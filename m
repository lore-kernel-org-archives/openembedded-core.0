Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 1059 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Jan 2017 21:39:32 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0045.outbound.protection.outlook.com [104.47.40.45])
	by mail.openembedded.org (Postfix) with ESMTP id 917EC60269
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 21:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=M13yB0pRPMeWymC68I707zGep6ytNAsI8gIegYb/vPU=;
	b=JUsttmT3BY/G2ywmhWYu41FOk50m5V6ZeBYwK2+tMrKj07RBqt/MhCmB2XZ2iU/taS9h04ZqP6xdxfamtaUe2vP/cNI66nfUKCdTGDeT0NzoRva4JCq2xNGOiIHdKyhBg6DQ7wFtUeZO50hd9gcKCNRmjoh/AQx2k4ATGdIXPaA=
Received: from CY1PR0201CA0036.namprd02.prod.outlook.com (10.163.30.174) by
	SN1PR02MB1391.namprd02.prod.outlook.com (10.162.0.19) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.829.7; Tue, 10 Jan 2017 21:06:08 +0000
Received: from CY1NAM02FT053.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by CY1PR0201CA0036.outlook.office365.com
	(2a01:111:e400:58b9::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.845.12 via
	Frontend Transport; Tue, 10 Jan 2017 21:06:08 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT053.mail.protection.outlook.com (10.152.74.165) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.803.8
	via Frontend Transport; Tue, 10 Jan 2017 21:06:07 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cR3cM-0001f1-PG; Tue, 10 Jan 2017 13:06:06 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cR3cM-0005tv-Kt; Tue, 10 Jan 2017 13:06:06 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1cR3cJ-0005qy-Eu; Tue, 10 Jan 2017 13:06:03 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>
Date: Tue, 10 Jan 2017 13:04:00 -0800
Message-ID: <1484082240-8105-1-git-send-email-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22814.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39410400002)(39850400002)(39450400003)(39860400002)(39840400002)(2980300002)(438002)(199003)(189002)(626004)(5003940100001)(50986999)(2201001)(8936002)(356003)(50226002)(92566002)(63266004)(2906002)(9786002)(81156014)(36756003)(81166006)(8676002)(36386004)(33646002)(50466002)(4326007)(47776003)(48376002)(5001770100001)(106466001)(107886002)(305945005)(38730400001)(5660300001)(4001430100002)(39060400001)(77096006)(54906002)(189998001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1391; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT053;
	1:sUDtLt9EYpf/q47BmOl9zu1FqfiVj1n2FrUukfYlStfLVg9I0D2CjIvmJSVDq/q7/E+MtJzLT2XhlFhfO5PDO0rOPN0uxr7jusMtex3AmAe7zC3SMl1+uDdSWsQAiow3cJk8tDTKplKAotJ05dRfCHx8E0fM/xWEjumIiBAf/MVPHlJI7+WuIR75rendJS2BWq2yeAUBbW09uMz2nJPoMpRD37WxjyO+GIDm6kiBPTaDheh14vix0Or0BxIoJH6XDw/4qfjNU2iCUAJTkyucoyTPbysTAmigT1dxlQZ13eqoNSX7kbHQqcUu0hG8imU1S0QpQ70/8jaYOPinWD0qtBo5w758rahKX1gvSsgwfl2fAkaXXJ0pnN0HSkOoRJdvQb9xddhqLqiM4wISNqrnYUkt2xbhq7U3zN9936xkZ6HUT344MPbk1wybp2BxgyCQKxuqGwDj0Cp2J5gxmR1t4yvxxXZSuj4U4ZM7eNefkAMUlIO6/lJ9+rLCjSMeidy0V6zNxmg6lf/qDkeFcC/kovt8kTdtk9IRbIJ5NrVO9JhiTdeCrKY4N29j7C55yfcgqph+SjHOUgs9PqJeZBkNdw==
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 38f6c479-0804-4e59-a195-08d4399c7f19
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:SN1PR02MB1391; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1391;
	3:X435b2c6MEmFHS6v65XdDaAghmKx9CSxt9gPwNt/i/4WzqaCPuVKaBWGkHMoELsPNO65mR3IO7yKSa+/PwUyPUmCQAtZwOxLrRne6j64zDz5ep5i+OKfGWlBt+ePBn+aXMUcA34biOMXuS+gLR9RU+zdvi2wVRvXfQHZmle/jgdSYyYDUgst5+ZbYckouSPqSUM7rjDinsCp+JBwcYoHtyvHY5Gde6VxY6igJ+zTZofQrQ5TjwiZJ6/W7lEW0jLbsZBNaCba19A/Cp1m2JfXMrzCXBXlNdRGUzUYkRG2anAJs+PHY56aC6rzuHBNUH9T70cC+ToOOksGuRpvqB5Yjgt3GlQQj0Yo90aXLTSAoehV8IoaujTQcwidzUDZsg+dZOpUNjZjtVEnd+Abp0Ropg==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1391;
	25:k3Hfwsuzm3E35SN0S3E9T+AJVm4zr3wNjbTz7QEKrlY1hjKnxTecHj91yTOgPFELzpDMO3n6sBhI6zvQRWuZeMmm1JfoU5cDoaT53z6VzNOiT1GOknSLu+4B1mY9JzL8KK6bIPY2ANVNdlr6KOinEO9seDRlj3uVrq3Q26nGtUhRfyPw1IznEVk1xArVIySkvweCuTFpv4Yuhs+MdBMVcg8i85cBZPw6cADfIcJfuTZIllAsXgRzX1a46DjF1wUxox0mh9xRKoH7x2ryfRqkOuHE++qbgvrLlzxoqxML674sgYVaVgDu6EfaBkJYj45i6AOmmOLUdSEkcAQVK474aNxt4u+x8HbdLm6PmYqFx4JpebKR/XCn3Ii0JTyk+kfZ9UaIjWGR7g2/F6bMlOa/JW8S50abs6qh1GtlSSkFBhFGj514ry5FP1LG8nxbVBUzxgPI1AodE+F6MYsQ3quHA8ztRLwHhrV/KN4eZJIHzgLjkmr7d/ioi00qt38DbvnfJtrz6I+AkLzpuKQCGbkZWvPYIcY26un1oN7N+UAODqO6w3SjfV0MdBMqL00ekIhIMjq34Ert/6UYYkeIEvjbF5Ua7X23f83y5P8i8VDDQ91UaVnK9bo6Ba6Bvqw42hcxhvjQD6Dd3wLBpf5yHtlQaNxfCMhd/g3QBWXgx8HD3kCIuPB+rF2gfj5f0H9I+M8svWtPJWzb1Y8d9cIplum1D/mhKugNVq3I0JE7GA3MPsbq9GR2n407CU0RLxfpFHhbVxr6wNvtZl88guJl5001bmZzS//gSqPm3uCMf4DmNkZjZT4HUU8pK9M5dJZc50Hp
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1391;
	31:fAk6jt9lW6+Lhlua1RnQcrHnSdRkcTdEHTUz3b0Du/2HcZQg2G7liyg6B16qlrUq3Lh7gbOc1PIE+pGfotMKEh7pXzaP+sA71M8GlcUkQn204xXLIKia2is+GdTbjqhZoPJpXYcI7oY+ioIBY6SFqdu0C/XJdmYf+yCcMAdcRNF6SKSxrlc+FEXZ7GtVilBA1h9UNNe2jddtYpljyyO7LpMlDyB14/RTCYJhK+Ctzg59UuA3GS1dlAbHlpFjwEcHULTrDezD0tU05hEfEeFGIA==;
	20:67qYXsQ4w6jiGWMN97oKLV/V3RQCn3xypQwB9XEE37OMoa7JHvCW0okCtHcaoq+5UWTLBTXP0jWqg0Btm2fbwx2IWvI7x4anE/feCD2P0BEUUCZ/hxhEFJestE8KHxeVky75wJn2dBLOVBPD9LtZ0+vug6LKIgdgXrwXRT2ISwP8gpIo7xR0ZbGGLrU6mymQ9SjXuQ9stuxXeW8j7Hvr5+AN17KqwjuTgLWM73YKHm+n/6nKALjlftm6ultJomDLjQ/QAI/Cjk1ddM4A4PhN9Ql1fSYKAxxuXsHtucYdwzuBzrtP7Ja7oaiv01f66oZUENJsHjbL9+E+Q1yzaWyXAZE2zTCIoPI4wDZC+HE+sAsxtMqZ7mflw+qCaftshRzBfyk5oCXMihX9c4emsz06HmfxWaq+yoLu2K2WAVAMNCMrGMii4MYgZ4K9gZPDkwtwJWhTK1WdFNUB0oMxyWYrIcuA2T+R1IbmMyjXYSFwcnCuZVGoeyXunBJgCynlwWqf
X-Microsoft-Antispam-PRVS: <SN1PR02MB139165D37A86DB83B4376DCFDC670@SN1PR02MB1391.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13023025)(13017025)(13015025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(6072148);
	SRVR:SN1PR02MB1391; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB1391; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1391;
	4:Go83xzPecbsZaHrHB5deNBPH0Lz8mL9onFDUM1bJnGGvHQ389vyG5TGAlAHdV6Y9CZs6j3E8FoxirsA0meZr7plK2wUg83SzV3QrRGUke4kEHAlj0+vC4nKLMDg9saWBniBCZFxlaDhtBr70hHxW8MF6+eQQcnhbqlSsRn1EBBvVr3KzDemerJ7OPPUNSBSw6b5iGHuMCvFtC91NvqWbAddB/26Vb0Wa95Lvx8JZ68WJcvzLmCBsvV0fRLOt7LAm7Pzn3XWlCJGUz8xRTm2CaKw6IPJieUdjTNmhayrC3ekWUytrovRy86XXq9d4JRRuhuIClb9X3ep3LXEYmu55q3dxBR+aendBNqUoZdVBAB+JcnHh+NwsWn6mUQ+62Z9P7RHGPObQHthceKDfW86dy86xvowzadiwbRIHvgA3qs4dCO2JXBzxvtBWaEQxK0DZ9eXN4IR5xdzzqZWLPvU1Rg5YoufuWNIbLqK0DJ0j3vajN/OvFxeQ05o7GFgMk22qIlzXkrfI/sjSXmIfBGZ3HBOWdBsCXW83PU4cmZE3Iikj1qKQ9B430tWXxrYdDI/PRdNbnx9ix0z3ZWOnhlM9YENojfXTqjrpyIPxKkp0pmUIC8jqx30ppKPxU9UXLP24uIk01arYND7M/yv1qH4VYw5LSVqMzpebfLeXcQDB+/FOZQp0WaW5NI1810vVqtS5IhpXYchztnf2GbPp7oGtutNd/pOiDk/7O/TdB0MN5ig=
X-Forefront-PRVS: 01834E39B7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1391;
	23:PMahfBuzgPi6w1t6yue+Th0cY7DgXtbSgwWPW9WdY?=
	=?us-ascii?Q?Px+7tKMzDX168CbcjelYvoS/l98kOOA9kmhNVxKwXNOEeb8D2rtML/ALfdCr?=
	=?us-ascii?Q?OQpndcWBlTaWZykVAwzzBp6ONXJJw9msjGA6kpSTYyZp+OA332cZBTyp4aVt?=
	=?us-ascii?Q?odjpU8Vjw9dxd17N+GVcVkTxkVncAdoBTGvsKQ4Bv2Sm4QJlYZYEtGNU9/dL?=
	=?us-ascii?Q?cWr/ez9L0wyIv1SOtBOvI6WwmlxUbWMIhZPr3iz6Rk6RH+7k4p5W7006mmVf?=
	=?us-ascii?Q?VkIAjCxOapXZWJTDk5nuD28n+wlk6er8WGIVDkKPNjFNxaIIxKfc2ZBYXMSN?=
	=?us-ascii?Q?V25P3pbgmjRUt689lZzfJX0obXwSwuP/zLrE1R2+Tn7Ds8WjqZIyy7o1d/df?=
	=?us-ascii?Q?bbfjwC2M40QK8xBfDhSEbOSJIZLqSp4jImw6wUBxENCPRdr+DtWPwjFoyl4l?=
	=?us-ascii?Q?1ZxotEvC4q59Zcj6hju3Wif1dBEccpU4O7iZemO24BT6bb3bKlqXRMiG06q8?=
	=?us-ascii?Q?35h3zAC6IDwClNSszGWE+X5ZIGo0IWWwx/qYEhlwDGoMS8gZItd2J5908gfS?=
	=?us-ascii?Q?a0ND+kJKLuUYzMTZpSx6AY/ezqZ5eB1n2NRFRE8OmIlJUabQeodGcViM6L4U?=
	=?us-ascii?Q?Se6P8YEK7RJUfZNbbbYQ1ImV2E1s1Tb2TZheXRvSYrKqGILZEGhZRTLVN4fJ?=
	=?us-ascii?Q?6SE466Y6tVzFdbCH+jtH1T8lT8KTe64d1hLu6fJ+BA++4lCHi4ghiLU8cxQK?=
	=?us-ascii?Q?EhC/uYpRQPYtN1YpmjXZtoU5izyitMSdtwNC7oQ+Vl1ZkSuScCvpJdTB1B9e?=
	=?us-ascii?Q?NFxcLKs8qbmZDuz6j1ZAO/zN+13IlVIBhDMLVdOjtKFeSNW7PAAdlPWflqO7?=
	=?us-ascii?Q?iqbnD1fwZqRvVBdYWHRQ+2OeYGzexxIrqovxfbKyzdYbnqmoWhrRQ6OvvFrB?=
	=?us-ascii?Q?fnLcEeteI2Yh6p8DS0hcfiJVNqjuFMxlKWDmR+Xo71HARGzmtAha9QoqoT+F?=
	=?us-ascii?Q?mgFyFe4fu0IYWcDeFoi5ocrB59Nz0xC7uIZgxpFgRxYXVpHdwVQOsba07y21?=
	=?us-ascii?Q?OvuDtkUSXs2UZHzLrsFppasvtDGkNPuFKtAvKltdPJJRSCe6W7pDZJDvf4HC?=
	=?us-ascii?Q?9idGlSd1QI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1391;
	6:1kSN8M9F/UUXHTvWGV87MtZ3/pUr3QQPRssnvzDnUj/achvrQBLCVG4Xm78RvM1pFh5GWc2acnCvHOxU+SK+WxEjxN5SxYrM6Aio3Gxq7LavkdynDGH5hnLCS50V1AVq3nnyND7sOqQb779Ivc0saUSL0fgx+7vE4RyiGi7Y7T+MHlkUVYUEFUC/D4urTEc3/brVf3KCXlHBrO9V4cMyL4pJP5K7FY9sD3IPmY/ALVp9HK7ujd6mp1bWeCyc8Z9hxddmuJiF+llSEuAMYlciV1AyYMJCWqm11I89YSuaRC72j9RKsUDzpXst7k7V9dUnXMRBjQWXOp8Q8tCRMQ9lJohut/Fol5rR1VqlamULRxFXb8/EiflJWfx3TMcJG/OqHJbHXNwB/dKZo91h8lcMXcdWzNVFcwWHP3/8+wcWd5Cp4zl3cM6KHVPo1zbEUWBmw8C5QXI8GMRqJHVPxp3BHQ==;
	5:DWR/4CbnmqfyNeR4LIilF4+f9MQA+YJPXVnOHk5L3icw4WdTi2uDhQgGXI0QClrOKVG1Q7IkMKzA8is9o1YtPHeamKOjy6PKK3nchD2oo8QcalqbM+Hzw1o5D66P/DUzdhkQPkkTojeIjyWztNGUsw==;
	24:OOXTCLARKhhM/K616RkROes+uof8aRpHyNFvuSWMRZmfW7YxBVcbVtb9Aq7Xr74sGW8dRUiyFiKqaJNOlgkiL8ZwqT0CM15Ow23wUohU18o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1391;
	7:FqFLaPN1SY3mwkpJ7RMtYn5djvIaHdRzIkXbPiw6RRQQe2UG159n08zaKS6wh7AMZP2s76sqQjbWU5bRXUUe+6Xj8B1kBHvrzxSiPsvZftB2KnZibhqXLgnplSlHJDSLikLa58aVczAJsESBds6UTJXuGba0y2ZDFLm+L5xrHiV2E1kdV/2xI8pl9QLuINnV+7YXmYPE7r+3y0ZQ+j1dX0YZJGxhs+irnE/8P30Vr+gISczPoqFrNtrikobExJR2E6T1PjQ0Bcuym5j0Nj0O3qH2Pxc9ffQP5h+datqGui24Pc9NHixtuN6QvXcFQWLgiOOT7wi18O06B6moqXG6qieaj9sahuJ88Y6HeLdNZ+7CRr/vCi9D+YrahE/flwuT/mOFxXciIF4HzfY1RNfKJGrMr8hg4wneJSS+UtgUGr5Sjr9syPl2/BzwJm0tAh72qecJJatngdxn6Cg2HVqwDQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2017 21:06:07.3025 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1391
Subject: [PATCH] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Tue, 10 Jan 2017 21:39:34 -0000
Content-Type: text/plain

In some cirsumstances the user doesn't want to supply a kernel, rootFS
or DTB to QEMU. This will occur more now that QEMU supports loading
images using a '-device loader' method.

Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
to avoid supplying these options to QEMU.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
Nathan Rossi previously queried if we should have a QB_KERNEL_OPT
variable instead of this, so then different machines can set that
based on their specifc use cases. Generally it would be set to
QB_KERNEL_OPT = "-kernel @KERNEL@".

I never heard any feedback on that and as it would break all
existing QEMU usage I haven't changed this patch to do that.

 scripts/runqemu | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 203992a..83ec337 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -453,7 +453,7 @@ class BaseConfig(object):
     def check_rootfs(self):
         """Check and set rootfs"""
 
-        if self.fstype == 'nfs':
+        if self.fstype == 'nfs' or self.fstype == "none":
             return
 
         if self.rootfs and not os.path.exists(self.rootfs):
@@ -481,6 +481,10 @@ class BaseConfig(object):
         # QB_DEFAULT_KERNEL is always a full file path
         kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
 
+        # The user didn't want a kernel to be loaded
+        if kernel_name == "none":
+            return
+
         deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
         if not self.kernel:
             kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
@@ -858,6 +862,9 @@ class BaseConfig(object):
             k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
             self.kernel_cmdline = 'root=%s rw highres=off' % k_root
 
+        if self.fstype == 'none':
+            self.rootfs_options = ''
+
         self.set('ROOTFS_OPTIONS', self.rootfs_options)
 
     def guess_qb_system(self):
-- 
2.7.4


