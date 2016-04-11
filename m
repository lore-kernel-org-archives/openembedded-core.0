Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 923 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Apr 2016 16:29:14 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0119.outbound.protection.outlook.com [157.56.110.119])
	by mail.openembedded.org (Postfix) with ESMTP id 618EA607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=26vjFFnXAzSg/xI1uDZzPrkmtTAMTw0cWbbMIWwI+II=;
	b=Gul00f8IGgShay/y6Yfuo9zpu8+SyjhxSuhkfPchJirzbmDy1TRpqAjk+rk/DPz7mf9utnj8DAyGrPwyELS1y51Uu6w7T4QUCx/GrIJVelsCNpKLnj7jgNnjYqoQ7q+N0Vbs0dhm/udx17EMNhBJRPpAVzI/D/1B90FwkTyXGco=
Authentication-Results: ti.com; dkim=none (message not signed)
	header.d=none;ti.com; dmarc=none action=none header.from=ni.com;
Received: from [10.2.106.105] (130.164.62.224) by
	BN1PR04MB842.namprd04.prod.outlook.com (10.255.203.144) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Mon, 11 Apr 2016 16:13:49 +0000
To: Denys Dmytriyenko <denis@denix.org>,
	<openembedded-core@lists.openembedded.org>
References: <1460091428-15870-1-git-send-email-denis@denix.org>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <570BCD36.30204@ni.com>
Date: Mon, 11 Apr 2016 11:13:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1460091428-15870-1-git-send-email-denis@denix.org>
X-Originating-IP: [130.164.62.224]
X-ClientProxiedBy: CY1PR20CA0086.namprd20.prod.outlook.com (10.164.213.140) To
	BN1PR04MB842.namprd04.prod.outlook.com (10.255.203.144)
X-MS-Office365-Filtering-Correlation-Id: cb1a8606-21eb-4151-72fa-08d3622444f4
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB842;
	2:jGzL0CUBerrreOqV2VLgCsooFHGzqKjtBb7mtzn2BNvZtpxygAMfpSLFPRe5SZwv9ehw0kpuy+E2JfzeEWq3bZh0U8BtOv+Jf7OMezPBIbDBZ05exZQ6y2RK27s82eNEA0AK4IIiFDcAMCzR6eIlCs+atn3S/lF8SmhtEXz+ev8sq/mcBNRhDBQ9jdrcSF/n;
	3:qbr2z1VBINSEXBjAU0eKZvPS3Ma6G7Og1Hfa5XKS9uOOOHV+pjoMHWYZCwrbSHgUaG1bmVQA9sFTN2iw9rxxND7OA+FBS6ealT4vRQ7ZFFQPDTgqT2JTepJs+AeeUdXb
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR04MB842;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB842;
	25:Oc6XCgvuET5sYe5RwgWWVited91wP1A2543s8cX9LXkf5YVf6G2/KFw/9MsrIg8zok1mr7RIcEPQ9CxPZTf8kFiARiSDgVoJAJiw1weH/LAC7EZY9VOGuUixif4uHOzkov6e6kc7L3+NaV9F/zt5kyRybA/+U8YFQmNiWgucTdBv365B9wYuKTD0GyR39w7lVBel0KdwsFq8rOAB2n5FwL6qGkWzjvng205QZWdKT6Ty/IN/AG+b876Oz5NBi9tLbOdg1a+uYo2OiWm102ZT1aHuZdQgxv19YJ0R0r1oV5hcGoRnOvyknYXs82Tpt0KUMqaSRFjBGVQIbTgVay9ot7vjQH8R4/LDsufncHKqLVNn58hhoKMLZJWn/lcweQ2geVjNACs6dlo8Untgm06QXyahgZx5eMspBEk/5+z5NrsvJ0EIMFD+xOyf8t288ycR6UqvfcsiPIbsy/2qFbKOjyzfCe7Uroj7mI2XQaP3w9uU1A6VpiBrOj3BeK2iih3s5knDFVWE3gslWJE4BHiIiNeCC5DrGCMHBXKXDTZI+dzkr0GvVXhfbDpdPXRksy9L6WEn2x/AP6w6LTu3tBo22VJy0gNQ1hJimn53snUz84gabX50pdGRbeJDMIEXbDJMEwW9kRl2g+didNsxksSoWl9yrs4x/3pHDk2ZovbvVojgIdZIYd9ThP+cjrgUHRpv
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB842;
	20:SaXnk0ricqhOoMgehH8pTQbUHRphMQVoRlQIqXgkbcLLk1e0XSbLlLyvMCT13uBXpPXie3P7v+xwaD6mNw7uwAD8kYAvP6U/J53YscYJkfV56bxhoB4V0XbH1yFhYsAZ9krvsufbZ+4o0HFIuBNJ965WV6Pzrhnh+QY3Bu5pXOzlCJHgaUdrVpyShRSHHkEVERwVECRjciMvSLg9kzVYRbLd6g0Vry5Sb1NnvTPQVRVrr/PrCpLNo6INsfRIskkc8+WEVQ/2XE2xYZKnuTXdfqxrU7zVk70QgoMPWKwQyF7gMw7jHCs3KJvQ+RtCtr3jNrnNzeXOFnlv5vvhznYNrAi9kSCx/fxb/W0llig/7dCpBqWuBMPgaAxYBr/dFgnVaMUUW1SBtuc/oNgm1sfaqUpHs3C0tRnNzCkMSQ5KWHhUhDtNQcsF+ctYJf6/QEZ9Frl7ZAVyz0dIphEp61kSQieMm5qCMw+CVMIFMe/e/iQi22+mbpqgGNh8uj3BggUcHEhtJ+noROgejQIdOAdG/FPyMM70b878Dhw6AgHaBJRvRtwxICJ/3sNeymY8Fsbx6x+DVNGFtidehtAILL8m/Cg86j+alJ8x2L4jxc+aQfQ=
X-Microsoft-Antispam-PRVS: <BN1PR04MB8428FBB07D7E22009AE2A9786940@BN1PR04MB842.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BN1PR04MB842; BCL:0; PCL:0; RULEID:; SRVR:BN1PR04MB842; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB842;
	4:WwU2DEINXavcJ6gcFJ979Nk/5u8OUeX/CpZduDkuer49ZAhv7+6jwehFdPC83DxXGl0jWeWX/sHAoTrWPzL21PumaO2SEUUf/s0fhE9iJjXmqWTpCB4BPmXxtqExUzX86aF+/GAdYjZmbffHXwxkM1TaldqYqqoHjHsYdwkhAZhJCOUsF8gy0+i2DxivO1K0pqMursnXSWhxljDEE7eIVVOZXMR3TDvu1Go653RcX7zjxgLSZzFz3lmIKim8fqXgNi1ukB+Lpckhd3mxcLNul+KpvIFCYJRGhcPNMPGu/ZhCB89MaJ2Eebl9acPGdFGzYEnHmh9w9WPGxWbWHT+1WWCMgmEs43/xO5+80QkDR7DG2LMcK0bIOQyDgrBLanVK8DbD+ATKkml3Gmvy7LBWAg==
X-Forefront-PRVS: 09090B6B69
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6049001)(6009001)(377454003)(24454002)(2906002)(86362001)(4001350100001)(36756003)(5004730100002)(50466002)(83506001)(4326007)(5008740100001)(65816999)(19580395003)(19580405001)(6116002)(586003)(3846002)(2950100001)(33656002)(92566002)(47776003)(66066001)(77096005)(65956001)(5001770100001)(76176999)(54356999)(50986999)(23746002)(558084003)(42186005)(189998001)(1096002)(81166005)(230700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR04MB842; H:[10.2.106.105];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN1PR04MB842;
	23:SH24On+zXOUvSXt2Lw0zWm/Jx6xu+0SI4sGNtB?=
	=?Windows-1252?Q?HMwYWOBzMYjUQwRxsESeYBKAS3os0LASSRIGBOoiMp5NVS1UnJ7aCbI6?=
	=?Windows-1252?Q?i0G6S+XQkHarAjt954aBLS/1I3G/yd+7LEKzIUHNdLbCY6gOeAOYh/mP?=
	=?Windows-1252?Q?K8fgxeXOB8v8Duqrm2JElAI2KHrpB+oVFoWjMM0D+OowBkLtEU3Vh0Sh?=
	=?Windows-1252?Q?b+5vb2w4HC+/ThjayNuMSceXz/CyjIINpyz2K1lKWqv9WFMJxoUlB9ez?=
	=?Windows-1252?Q?5qv8hV/hLyLi5FaOrsVqwiq82t+yz82EMyN2Z/S7TT/DAf3QRT4NvEjk?=
	=?Windows-1252?Q?WKOv9FyNagZ71+MuK+wh05J6vzXPULEWIPedPwLAzd1DtROjxJqqqp8v?=
	=?Windows-1252?Q?W+29cwdYSZD5LAekvCU8/1RabwTDtDLlSPpLVivnOdIoQkFjSpy2O1tf?=
	=?Windows-1252?Q?EpZKZzQ8Oo17YXIGjron+zTjnSbaqsg8XRPVxC1ZzAZO5A3Auk4tL076?=
	=?Windows-1252?Q?rGxOuVVXCKqM7PlNs1qBYq2WvN4ywMNZ6mocYbfO4Lo1d7aQtHKX4P02?=
	=?Windows-1252?Q?B4ilBaEe6rW8PVaAUC/BXDyTzVHzZR5p55fq6x9d6UM2AzPf2VU6StJ/?=
	=?Windows-1252?Q?DtuZL03VOT3EFZ/zKRtR1yev3p752BQJu2zfsiA7uxTx60zpYUZidnUs?=
	=?Windows-1252?Q?cgeK6WcewpsvHKzsphDOHnWZpVXHGFweqxWgfQ+XiIsGLcxKFrOLzl2N?=
	=?Windows-1252?Q?OWc5hyR43MFAmbumsOHVsfmqV8ig1Whl4MzMalFTFUqCfjiAG0J9Aw/5?=
	=?Windows-1252?Q?yv4k/VNIjK7jAOCoIiX0PEvaPHPZGRPbe7iutMUrv5dOQsWN5kmbH41s?=
	=?Windows-1252?Q?QkDjGbO0cFxsJM2AuU7DUeCHvXlt7yiVaPxBDDynfhzeubM78lyjjhKQ?=
	=?Windows-1252?Q?K9UQLEn/oBxcGSeMQtzQuV+NBwMu35nlIWs2g2BoWE48X4zqmBf1Bp3f?=
	=?Windows-1252?Q?2/DkolLdH2I/RXE9bCVvBfqs8buSm+maTBYWmH8ev0q0KNbtsBl7nwh4?=
	=?Windows-1252?Q?1jdS5wL2t25+FK9TrNgyEDghDW4CL5ONYB8b2UHYFbPdIF32DE/D4adw?=
	=?Windows-1252?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB842;
	5:3/HHa82bPOxyD1Kp9/Onv5Rw6bG8gbr08S6kxz/L26dXfxRtR/YXG4EyuMHeigB6IdSSlkNfhKU5rRx1j6oE6ff5R5DmpP/NOZs9EzphijKkU5ihlWEpEsK+YwmKNAR5E77ACQ5Elzp9ThPKxf693Q==;
	24:Qic51fC5WyWrMSnEZ2WaRj7i22ydjN+EsCNLZapq3sZEgo3Tci7wj040eshTfqmMsHd0V56yz1b2t0tl8pi1c9QBVTmqb3Ha8NFIvWuG9HA=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2016 16:13:49.9899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR04MB842
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] opkg-utils: re-do find/ls code to not fail on filenames with spaces
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Apr 2016 16:29:16 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 04/07/2016 11:57 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---

do you mind posting the patch to the opkg-devel@googlegroups.com list too?

-- 
Cheers,

Alejandro

