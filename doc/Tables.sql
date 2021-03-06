SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domains](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Domains] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[Instruction] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](50) NOT NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[Action] [nvarchar](50) NULL,
	[Controller] [nvarchar](50) NULL,
	[Identity] [nvarchar](50) NULL,
	[Referrer] [nvarchar](250) NULL,
	[UserAgent] [nvarchar](250) NULL,
	[Url] [nvarchar](500) NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Logger] [nvarchar](250) NULL,
	[Callsite] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Domains] ON 

GO
INSERT [dbo].[Domains] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, N'domain1.com', N'Domain One', GetDate(), N'johndoe', GetDate(), N'johndoe')
GO
INSERT [dbo].[Domains] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (2, N'domain2.com', N'Domain Two', GetDate(), N'johndoe', GetDate(), N'johndoe')
GO
INSERT [dbo].[Domains] ([Id], [Name], [Description], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (3, N'domain3.com', N'Domain Three', GetDate(), N'johndoe', GetDate(), N'johndoe')
GO
SET IDENTITY_INSERT [dbo].[Domains] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailTemplates] ON 

GO
INSERT [dbo].[EmailTemplates] ([Id], [Name], [Description], [Subject], [Body], [Instruction], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Add New User Notification', N'Email sent out to supervisors after a new user is added to the application.', N'Sample Application - New User [[[User_FullName]]] is added', N'<div style="font-family: Segoe UI, Segoe WP, Segoe, Tahoma, Microsoft Sans Serif, Verdana, sans-serif; font-size: 14px; color: #333333; direction: ltr; line-height: 20px;"><div style="font-family: Segoe UI, Segoe WP, Segoe, Tahoma, Microsoft Sans Serif, Verdana, sans-serif; font-size: 24px; color: #0078D7; line-height: 32px;">Dear Supervisor,</div><p style="font-family: Segoe UI, Segoe WP, Segoe, Tahoma, Microsoft Sans Serif, Verdana, sans-serif; font-size: 14px; color: #333333; line-height: 20px;"><strong>[[[User_FullName]]]</strong> is added to Sample Application. Please click [[[User_EditLink]]] to assign role to [[[User_FirstName]]].</p><p style="font-family: Segoe UI, Segoe WP, Segoe, Tahoma, Microsoft Sans Serif, Verdana, sans-serif; font-size: 14px; color: #333333; line-height: 20px;">If clicking the link above does not work, copy and paste the following URL in a new browser window instead.<br />[[[User_EditUrl]]]</p><p style="font-family: Segoe UI, Segoe WP, Segoe, Tahoma, Microsoft Sans Serif, Verdana, sans-serif; font-size: 14px; color: #333333; line-height: 20px;">Sincerely,<br /><strong>Sample Application</strong></p><div style="font-family: Segoe UI Semibold, Segoe WP Semibold, Segoe UI, Segoe WP, Segoe, Tahoma, Microsoft Sans Serif, Verdana, sans-serif; font-size: 10px; color: #666666; line-height: normal;">If you did not request this change, please contact help desk immediately.</div></div>', NULL, N'johndoe', CAST(N'2017-01-05 12:24:24.377' AS DateTime), N'johndoe', CAST(N'2017-01-05 12:24:24.377' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[EmailTemplates] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Administrator')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

GO
INSERT [dbo].[Settings] ([Id], [Name], [Value]) VALUES (1, N'website.url', N'https://www.example.com')
GO
INSERT [dbo].[Settings] ([Id], [Name], [Value]) VALUES (2, N'email.from.address', N'fromemail@example.com')
GO
INSERT [dbo].[Settings] ([Id], [Name], [Value]) VALUES (3, N'email.to.addresses', N'toemail1@example.com;toemail2@example.com')
GO
INSERT [dbo].[Settings] ([Id], [Name], [Value]) VALUES (4, N'email.smtp.host', N'gmail.example.com')
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [UserName], [FirstName], [LastName], [IsActive], [LastLoginDate], [CreatedOn], [CreatedBy], [ModifiedOn], [ModifiedBy]) VALUES (1, N'johndoe', N'John', N'Doe', 1, GetDate(), GetDate(), N'johndoe', GetDate(), N'johndoe')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO