local toggle = true
local button = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
button:SetSize(100, 50)
button:SetPoint("TOPRIGHT", MinimapCluster, "TOPLEFT", -5, -100)
button:SetText("Auto: " .. tostring(toggle))
button:SetMovable(true)
button:SetScript("OnClick", function()
    toggle = not toggle
    button:SetText("Auto: " .. tostring(toggle))
end)
button:SetScript("OnMouseDown", function(self, button)
    if button == "RightButton" then
        self:StartMoving()
    end
end)
button:SetScript("OnMouseUp", function(self, button)
    if button == "RightButton" then
        self:StopMovingOrSizing()
    end
end)

local function relog()
	if toggle and GMR.IsFullyLoaded() and not GMR.IsExecuting() then
		GMR.Print("autoplay!")
		GMR.Execute()
	end
	if not toggle then
		GMR.Print("Autoplay disabled until /reload")
		
	end
	button:Hide()
end

C_Timer.After(7, relog)
