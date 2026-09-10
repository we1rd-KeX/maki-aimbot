--[[ 
    Project: Gemini Aims Fr System
    Code Assisted by Gemini
]]

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Configuration State
local Settings = {
    Home = {
        Enabled = false,
        Strength = 1.0,
    },
    Legit = {
        Smoothness = 4,
        ReactionDelay = 2,
        TargetPart = "Head",
        FOVRadius = 100,
    },
    Graphic = {
        PotatoMode = false,
    },
    Visual = {
        ESPEnabled = true,
        BoxColor = Color3.fromRGB(0, 255, 170),
    }
}

-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GeminiAimsFrUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- ==========================================
-- LOADING SCREEN OVERLAY
-- ==========================================
local LoadingScreen = Instance.new("Frame")
LoadingScreen.Name = "LoadingScreen"
LoadingScreen.Size = UDim2.new(1, 0, 1, 0)
LoadingScreen.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
LoadingScreen.BorderSizePixel = 0
LoadingScreen.ZIndex = 10
LoadingScreen.Parent = ScreenGui

local LoadingTitle = Instance.new("TextLabel")
LoadingTitle.Size = UDim2.new(0, 400, 0, 40)
LoadingTitle.Position = UDim2.new(0.5, -200, 0.5, -55)
LoadingTitle.BackgroundTransparency = 1
LoadingTitle.Font = Enum.Font.GothamBold
LoadingTitle.Text = "GEMINI AIMS FR LOADING..."
LoadingTitle.TextColor3 = Color3.fromRGB(240, 240, 255)
LoadingTitle.TextSize = 18
LoadingTitle.ZIndex = 11
LoadingTitle.Parent = LoadingScreen

local BarBackground = Instance.new("Frame")
BarBackground.Size = UDim2.new(0, 320, 0, 😎
BarBackground.Position = UDim2.new(0.5, -160, 0.5, 0)
BarBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
BarBackground.BorderSizePixel = 0
BarBackground.ZIndex = 11
BarBackground.Parent = LoadingScreen

local BarCorner = Instance.new("UICorner")
BarCorner.CornerRadius = UDim.new(1, 0)
BarCorner.Parent = BarBackground

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
BarFill.BorderSizePixel = 0
BarFill.ZIndex = 12
BarFill.Parent = BarBackground

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = BarFill

local PercentLabel = Instance.new("TextLabel")
PercentLabel.Size = UDim2.new(0, 320, 0, 24)
PercentLabel.Position = UDim2.new(0.5, -160, 0.5, 15)
PercentLabel.BackgroundTransparency = 1
PercentLabel.Font = Enum.Font.GothamMedium
PercentLabel.Text = "0%"
PercentLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
PercentLabel.TextSize = 12
PercentLabel.ZIndex = 11
PercentLabel.Parent = LoadingScreen

local SkipButton = Instance.new("TextButton")
SkipButton.Size = UDim2.new(0, 100, 0, 30)
SkipButton.Position = UDim2.new(0.5, -50, 0.5, 55)
SkipButton.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
SkipButton.BorderSizePixel = 0
SkipButton.Font = Enum.Font.Gotham
SkipButton.Text = "Skip"
SkipButton.TextColor3 = Color3.fromRGB(180, 180, 200)
SkipButton.TextSize = 12
SkipButton.ZIndex = 11
SkipButton.Parent = LoadingScreen

local SkipCorner = Instance.new("UICorner")
SkipCorner.CornerRadius = UDim.new(0, 6)
SkipCorner.Parent = SkipButton

-- ==========================================
-- MAIN INTERFACE FRAME
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 400)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Top Bar / Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -20, 0, 45)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "GEMINI AIMS FR SYSTEM"
TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

-- Subtitle watermark
local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, -20, 0, 15)
Watermark.Position = UDim2.new(0, 15, 0, 30)
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.Gotham
Watermark.Text = "Code Assisted by Gemini"
Watermark.TextColor3 = Color3.fromRGB(120, 120, 140)
Watermark.TextSize = 10
Watermark.TextXAlignment = Enum.TextXAlignment.Left
Watermark.Parent = MainFrame

-- Tab Navigation Container
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 130, 1, -65)
TabContainer.Position = UDim2.new(0, 15, 0, 55)
TabContainer.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
TabContainer.BorderSizePixel = 0
TabContainer.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 😎
TabCorner.Parent = TabContainer

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 6)
TabListLayout.Parent = TabContainer

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingTop = UDim.new(0, 😎
TabPadding.PaddingLeft = UDim.new(0, 😎
TabPadding.PaddingRight = UDim.new(0, 😎
TabPadding.Parent = TabContainer

-- Content Panel Container
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -170, 1, -65)
ContentFrame.Position = UDim2.new(0, 155, 0, 55)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

local tabs = {"Home", "Legit", "Graphic", "Visual"}
local tabFrames = {}

for i, tabName in ipairs(tabs) do
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 34)
    Btn.BackgroundColor3 = i == 1 and Color3.fromRGB(45, 45, 65) or Color3.fromRGB(30, 30, 40)
    Btn.BorderSizePixel = 0
    Btn.Font = Enum.Font.GothamMedium
    Btn.Text = tabName
    Btn.TextColor3 = Color3.fromRGB(220, 220, 240)
    Btn.TextSize = 13
    Btn.Parent = TabContainer
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn
    
    local Page = Instance.new("ScrollingFrame")
    Page.Name = tabName .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = (i == 1)
    Page.ScrollBarThickness = 3
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.Parent = ContentFrame
    
    local PageLayout = Instance.new("UIListLayout")
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 10)
    PageLayout.Parent = Page
    
    tabFrames[tabName] = Page
    
    Btn.MouseButton1Click:Connect(function()
        for _, p in pairs(tabFrames) do p.Visible = false end
        for _, b in pairs(TabContainer:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            end
        end
        Page.Visible = true
        Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 65)
    end)
end

-- Function to create toggles
local function createToggle(parentPage, text, initialState, callback)
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(1, 0, 0, 38)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.Font = Enum.Font.Gotham
    ToggleBtn.Text = "  " .. text
    ToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 220)
    ToggleBtn.TextSize = 12
    ToggleBtn.TextXAlignment = Enum.TextXAlignment.Left
    ToggleBtn.Parent = parentPage
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = ToggleBtn
    
    local StatusIndicator = Instance.new("Frame")
    StatusIndicator.Size = UDim2.new(0, 12, 0, 12)
    StatusIndicator.Position = UDim2.new(1, -25, 0.5, -6)
    StatusIndicator.BackgroundColor3 = initialState and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(60, 60, 80)
    StatusIndicator.BorderSizePixel = 0
    StatusIndicator.Parent = ToggleBtn
    
    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(1, 0)
    IndCorner.Parent = StatusIndicator
    
    local state = initialState
    ToggleBtn.MouseButton1Click:Connect(function()
        state = not state
        StatusIndicator.BackgroundColor3 = state and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(60, 60, 80)
        callback(state)
    end)
end

-- Function to create interactive sliders
local function createSlider(parentPage, text, minVal, maxVal, defaultVal, isFloat, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, 0, 0, 54)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 36)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = parentPage
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = SliderFrame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -20, 0, 24)
    Title.Position = UDim2.new(0, 10, 0, 4)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.Gotham
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(200, 200, 220)
    Title.TextSize = 12
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = SliderFrame
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 70, 0, 24)
    ValueLabel.Position = UDim2.new(1, -80, 0, 4)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Font = Enum.Font.GothamMedium
    ValueLabel.Text = tostring(defaultVal)
    ValueLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
    ValueLabel.TextSize = 12
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValueLabel.Parent = SliderFrame
    
    local Track = Instance.new("Frame")
    Track.Size = UDim2.new(1, -20, 0, 6)
    Track.Position = UDim2.new(0, 10, 0, 36)
    Track.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    Track.BorderSizePixel = 0
    Track.Parent = SliderFrame
    
    local TrackCorner = Instance.new("UICorner")
    TrackCorner.CornerRadius = UDim.new(1, 0)
    TrackCorner.Parent = Track
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((defaultVal - minVal) / (maxVal - minVal), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
    Fill.BorderSizePixel = 0
    Fill.Parent = Track
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = Fill
    
    local dragging = false
    
    Track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation().X
            local trackAbsolutePos = Track.AbsolutePosition.X
            local trackAbsoluteSize = Track.AbsoluteSize.X
            
            local percent = math.clamp((mousePos - trackAbsolutePos) / trackAbsoluteSize, 0, 1)
            local rawVal = minVal + (percent * (maxVal - minVal))
            local val = isFloat and tonumber(string.format("%.1f", rawVal)) or math.floor(rawVal + 0.5)
            
            Fill.Size = UDim2.new(percent, 0, 1, 0)
            ValueLabel.Text = tostring(val)
            callback(val)
        end
    end)
end

-- Populate Menu Tabs
createToggle(tabFrames["Home"], "Master System Active", Settings.Home.Enabled, function(val)
    Settings.Home.Enabled = val
end)

createSlider(tabFrames["Home"], "Aimbot Intensity Strength", 0.1, 2.0, Settings.Home.Strength, true, function(val)
    Settings.Home.Strength = val
end)

createSlider(tabFrames["Legit"], "Smoothness Speed", 1, 20, Settings.Legit.Smoothness, false, function(val)
    Settings.Legit.Smoothness = val
end)

createSlider(tabFrames["Legit"], "Reaction Delay (ms)", 0, 50, Settings.Legit.ReactionDelay, false, function(val)
    Settings.Legit.ReactionDelay = val
end)

createSlider(tabFrames["Legit"], "FOV Radius Range", 20, 300, Settings.Legit.FOVRadius, false, function(val)
    Settings.Legit.FOVRadius = val
end)

createToggle(tabFrames["Graphic"], "Lightweight Potato Mode", Settings.Graphic.PotatoMode, function(val)
    Settings.Graphic.PotatoMode = val
    if val then
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") then part.Material = Enum.Material.SmoothPlastic end
        end
    end
end)

createToggle(tabFrames["Visual"], "Target ESP Outlines", Settings.Visual.ESPEnabled, function(val)
    Settings.Visual.ESPEnabled = val
end)

-- ==========================================
-- LOADING ANIMATION & SKIP HANDLER
-- ==========================================
local isLoading = true

local function finishLoading()
    if not isLoading then return end
    isLoading = false
    
    -- Smooth fade out loading screen
    TweenService:Create(LoadingScreen, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    for _, child in ipairs(LoadingScreen:GetChildren()) do
        if child:IsA("GuiObject") then
            TweenService:Create(child, TweenInfo.new(0.5), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
        end
    end
    task.wait(0.5)
    LoadingScreen:Destroy()
    MainFrame.Visible = true
end

SkipButton.MouseButton1Click:Connect(finishLoading)

-- Simulate loading progress over 2 seconds
task.spawn(function()
    for i = 1, 100 do
        if not isLoading then break end
        BarFill.Size = UDim2.new(i / 100, 0, 1, 0)
        PercentLabel.Text = i .. "%"
        task.wait(0.02)
    end
    finishLoading()
end)

-- ==========================================
-- ENGINE LOOP & TOGGLE MAPPING
-- ==========================================
RunService.RenderStepped:Connect(function()
    if not Settings.Home.Enabled then return end
    
    local closestTarget = nil
    local shortestDist = Settings.Legit.FOVRadius
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(Settings.Legit.TargetPart) then
            local part = player.Character[Settings.Legit.TargetPart]
            local screenPoint, onScreen = Camera:WorldToViewportPoint(part.Position)
            
            if onScreen then
                local mouseDist = (Vector2.new(screenPoint.X, screenPoint.Y) - UserInputService:GetMouseLocation()).Magnitude
                if mouseDist < shortestDist then
                    shortestDist = mouseDist
                    closestTarget = part
                end
            end
        end
    end
    
    if closestTarget then
        local alpha = (1 / Settings.Legit.Smoothness) * Settings.Home.Strength
        Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, closestTarget.Position), math.clamp(alpha, 0.01, 1))
    end
end)

-- Toggle menu visibility with the Tab key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Tab then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
