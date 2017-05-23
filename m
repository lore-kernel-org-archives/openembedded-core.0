Return-Path: <carol.zhu@nxp.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0085.outbound.protection.outlook.com [104.47.41.85])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB2777E89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:35:59 +0000 (UTC)
Received: from BN6PR03CA0096.namprd03.prod.outlook.com (10.164.122.162) by
	CY1PR0301MB0908.namprd03.prod.outlook.com (10.160.165.19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 07:36:00 +0000
Received: from BL2FFO11FD038.protection.gbl (2a01:111:f400:7c09::107) by
	BN6PR03CA0096.outlook.office365.com (2603:10b6:405:6f::34) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Tue, 23 May 2017 07:35:59 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD038.mail.protection.outlook.com (10.173.161.134) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 07:35:58 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4N7Zo6e015402; Tue, 23 May 2017 00:35:56 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 15:34:19 +0800
Message-ID: <1495524863-28699-3-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
References: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131399985592151240;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(39450400003)(39840400002)(39850400002)(39400400002)(39410400002)(39380400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(97736004)(48376002)(106466001)(2351001)(50986999)(5003940100001)(4326008)(76176999)(189998001)(230783001)(50466002)(47776003)(77096006)(38730400002)(6306002)(8656002)(105606002)(53936002)(36756003)(110136004)(54906002)(104016004)(305945005)(86362001)(50226002)(575784001)(5660300001)(8936002)(8676002)(2906002)(85426001)(356003)(6916009)(2950100002)(498600001)(33646002)(81166006)(6666003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0908;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD038;
	1:tsHHlpksxvlH1CnJMHg6fbV/MeahnI6J4FPhR2w0QrD9BUVFDdSWqum1STItJBKiDTL09jf+4w22aTx9nMJlZ5xB63amMvgzWTNkWetn3r+XM9I5wjRCYNNUo1EzniIsg3fTGT/nAiqw6Qewpt7ph4sl4KG49uoQ3dcfs3r2trqSTIdjg+2XDShFwYI0T2TBxq0Jpo4xu12gnT1qifTgZ5v5+blE4iyerFVmgFGsm9ObtqtmOcW1WZoUc93H4STKbDnEnEUv7ZrUP6aOImRnl94cj9gqz8amZ2PulLmY0QrR+wFDaEnYty81GkWr5dqORmdVQxl5+aT0njlR2k1NCV2BUJmkCzjQDQ2tgAzr7UF6kM7Ba1HfA5CbQHz5o8vQ6n2yXek4FHKMk9AML/tnrfCMlqwF9Lcefj8+GVnUNhiQp3ebVx3aD19DMXBTNU3j0SRc1mVvJl6xt1hF2aRGbgB+9/TNrQh2fi7hi3aIy57QiEoE9jfhT9VOtefvilCKNj+/HjZ6whVKc+BG7YTFgS3Q6mBd6MLvxD34S0uWD+OVpunqVSBVa8u/Tv58WDyaI/23zMhApGvDl1haKZhcXyjttuqo2hJ2QhKnQZzq9wB1Wlyo3FZ5/6iqP1qN+TbVPywDEqDlPm3PTWQT43Bt9UXZTn7vesAntqVv3Rr0/8TfL//YAIyImXs6hzBvShQT/4LvyNfxbdAGhiYHNG3aD5JHofz83PHXyIZ9vj6GYxaYM4rOtxZ1aNiDPjvM2g19qsiRKS2rMHzowA3BFDpHBg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR0301MB0908:
X-MS-Office365-Filtering-Correlation-Id: 7f7a7797-603e-47c7-c05f-08d4a1ae5b17
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY1PR0301MB0908; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	3:uqxLGVCsVbh/kI3V8p3QnAwNsFwCAYhKIDcSS493Tf4GgPMPYpqoggffMEcRyF4m6F4bDtZbiSKdBIRCmnrtXeiyb53ZjQFT2uk+AkkOrWZ+z3j0HtvaD58eW6CSH0bDw0CQNFxVDtBZQlLmFilZKXoemUK/IzuSnF1ZCgZkKOEzeCCKHUgE/Zi05NyXrWi0/Q5+hN3Qp/696+g8W6lQw38/otcLB+n37ru4CWc6sutFj+QEfXFqT8Oq3CLwmG4sPbt/kFYOGitmOHmKa6bAgwIJc1Vd566bcDaK6PYdBgowmTkMnj5SzSM57QSps6XnyRjTYX7rQwfQbnQo7LNKzbveVbs3CULm5SZ1U6Ajk9dwKg34EwBtx0m88dHmNdVKT/9+/9kw5jwoBOTGKiHDgHv86Bj9Sqn4Pkgn7/mNQxE6udTgTP2dGhw3nF/pS5ZV;
	25:G4wHaSeAEH9TMtZ8quYDD2rnTXyvXunncwWAFK7bKU+9yrRPmyz+9cj/snrjceHloASjCwyHxn9kEwFABMaWGcDk46LcAh8fWG5flx7cbJEdXycSDFmkAINLPb7ZuiYyF1X1qubWFM4jkPyIv395lgoR2XYqzEMxvdF2FVN1zhXIppT0C9pOrlC3t30MySHuk46sCr4kK6c0Oc8E8uICdL87RwQS6AH2EnimRLiNP4xqY11QrHjSQln8uUBxKhCtc3TIsllpe7E4CooMUVi6PLkuq2Qt1IOJBwWKjTA8WuJNmv92edPZPsmkkC+1vjmAF2xOoycrp0agl8VOHS37apd6gfzN1VGod7fCkGOieiYZx//pms4IO8/0S2lzZcxFWH7W1CHFv6eB5FeOpETDCDauv1O7A+8aM5yd6qGbQC5CdLRWo51rOaBw1BPUapW4cPWgGAhn5JiHLsagMw3XLcc+9o+0DowFiAOAksXLX9I=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	31:E/1183HdcLNmUZi8OrX9/2Ch0Rx0MkSsjKJKN1az1W6J+Qh2+Bm1B0FuXKNzM6p35HOJzP/5ob3FwIPyeK1Q/SXYM0055rF7dGeQ4LmZy7ObdKIDGqSGiym9dZueMDRVlvftmfn0CWILIuseKc8d7ZAb6ZwhPclPIu6mAFkWAnkugr88lcrd83P26RSgVruwMRAoKQyTruYRxcHFI3CWolkEU8FxskTiNw884M74VlXOzpnkZ9gCDFr9LDLvlq4jP4DE3I4KGy83B/+OpwOLpw==
X-Microsoft-Antispam-PRVS: <CY1PR0301MB09087D9957781813C31E9228E9F90@CY1PR0301MB0908.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(131327999870524)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13017025)(13023025)(13024025)(5005006)(13018025)(13015025)(8121501046)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(20161123563025)(20161123556025)(20161123559100)(20161123565025)(20161123561025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153);
	SRVR:CY1PR0301MB0908; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0908; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0908;
	4:2bdIAgHgJPFECU90aXJjuFQCgYQ/AUtQOSbpRLGX?=
	=?us-ascii?Q?QwYeBBeUyaokuYM9kJwFC9kjQWAP2NofquzZYRGnYqXygqmfOb+NapNbrZVd?=
	=?us-ascii?Q?xicbPvv5l74mcoA67fvuBBcu+WNXZPmFdic6RJ2RBdQr8b3iXvmEeJIiqgPw?=
	=?us-ascii?Q?KN9314orvBtGJ686lsCJBsPU2GBHiafyNoVvOpkVHGRSrqDitBiJ2nnQzbVl?=
	=?us-ascii?Q?l1kSGmaBaPWhbBpPoYMaiWljiJ5XxC0Ae0TgVcDCMqRFGBmyAylH1UB83RCp?=
	=?us-ascii?Q?B4OF8hHmyUSjlG4i18W1rBWvAZvS42Tf8SwstymLuBlThEp5RnZMWTdPtDXq?=
	=?us-ascii?Q?wBjyhsmz3GSlbdfNBJ3/Ovu002qaIrWYnroaQHG8Di40HjlXbqPKW0klmKyn?=
	=?us-ascii?Q?NpJmjti3VhCK2wJzH++NmBP4g0lCG4yhW4P9Xk5/1W4tHj8F2aLrLZKlvvX/?=
	=?us-ascii?Q?yIJAZCWA3azDyb6r9HXu8nRjs3XgcVJ0d94/kX84VgMxBv5D/br95jVLyHSy?=
	=?us-ascii?Q?kyIOBBFXE2msTTGhBHLLHierh9kM0/EKRmpGPqGM/+MTF6WAWpAviwBkR8+9?=
	=?us-ascii?Q?NJWhsQrwvSecSoB4sakyt8Vimy0WeKs/ew5D7Ty76GMBY+V1jonlRuQar7El?=
	=?us-ascii?Q?UA5gfx/zTZ89/81pPjP4cFZlwHsh/jyr8/cVkT/fewp00hvJ/DhcGw54xQX/?=
	=?us-ascii?Q?ynp8TFHWQKcGGBRMPHVFoZwL1F+5Fnx7K6L3oo7OHVcg6O/ZsaNzvQtoSR/c?=
	=?us-ascii?Q?/7yA96NIgfxoPsamAqkXvSaaiWtRUSsQpNW/RmRxo2QbUbWT2o78YEUCRrVQ?=
	=?us-ascii?Q?nhF12cufgLRnoP8hIhdpeBYEFLBRKDYpn3hM7DmmkvnRbM+224C4Y7cf4fGd?=
	=?us-ascii?Q?yqCuUY//Qorxy4TNawJ0U8Qb5s6Jdu55GI7Hj62g8HDcGzg66lQ+R3Dq3aIC?=
	=?us-ascii?Q?josXbguZcEf4uzSBegR98ziVCdSTKflOVK+uOLAmk3ahFPW4wbyyStXNIo78?=
	=?us-ascii?Q?pj0=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0908;
	23:rQhq1P8589QkwMjUbdXEXv6GGhd9+s9qV6jKwD1?=
	=?us-ascii?Q?D9A7kg83SpSZ1S3RCv6u3Ief37sPIwkzj/2HJGIAK9ev05O7UxO8jsxciMSS?=
	=?us-ascii?Q?NVTcIUtCg2POZptELXjoew6h63XoWu/7J0V1WIGJc4EWnejxJG48UUxuutPJ?=
	=?us-ascii?Q?CxPXr8fvss0ClVrYw48w5qP14YPXLIRF6MpMrzxEZEGV2nJKxKYrawYqqidb?=
	=?us-ascii?Q?i1XghcZzeNmWkCrq2/wylB0Qs6/Vxsyv4QjjcUwJeGujkK7GBi3vjaPkCPQz?=
	=?us-ascii?Q?DGSJWHciQuDHuE5UJs1CIhrzvQFL3TYJ1v9APv/GSZnSRoeyz2bcBHGnrwcc?=
	=?us-ascii?Q?GyGrRiF7c8eRTLjn3o2TurFAUcZvOAUjTmS79STxAZA/W3CCQuTFo/YWot5U?=
	=?us-ascii?Q?EV3PlqpiYXH0Tmy9qVU8vPlxOkzFCn8GkDh3fuG8IAuit03gWMH1YZe7cG6V?=
	=?us-ascii?Q?Xuy3zbj1gbPuVR0wpQE4QWHYugQ6PbvjKjuGnSsjkTK+VeSkuT+3PZVmEKqu?=
	=?us-ascii?Q?EkomO+qi8tVqhXdyQ64qtWxB148zQkvbeBuNuhAKDL7vWw/KUoc7Esgpjb4j?=
	=?us-ascii?Q?8r9OK9OxkCjGgp9Bs1dZtV4Bz8vXMKoW82SO2Z69PVfzDQD7XZuIZTHWkqdy?=
	=?us-ascii?Q?jiCGzuDWbCYHPfNckoOeBhGq1dif22Q3IAxJXCfS+JE89v2eSd6yZg36+zAA?=
	=?us-ascii?Q?9UrShkcFTKBYk+Aj078u/FdCDGHfA7xnDDo0VWsiSjI1EZKbMrc8jY626e3h?=
	=?us-ascii?Q?tLZhrn4oUtMu3Kh/E/pGdHQucTnivF/fnMSmEaDJlyAej7o5JUPfrOqjysIX?=
	=?us-ascii?Q?ZlrdIM6lkAUzY/kHD4Pf878zZedz+DFAewZKpIFURx/ix5FC3qZnfMmI/YsQ?=
	=?us-ascii?Q?HkWcvDZeCNCuXK0WDBXrwVvebOWrPoAUZhlMmQSy1UOwWTWOjTROoeykd0x/?=
	=?us-ascii?Q?4V54/mCpf85ixZ95MgPWbmz1tsWnxE3oLYwZI3iCDU2YUA1u9x9MHR4KeESJ?=
	=?us-ascii?Q?utW3dbjIRXR5AGNwA0jK38F1hlKcWK1UQc/oSYlunk44MuvJwd2VJLxKD1Yp?=
	=?us-ascii?Q?t8OCnWMfcX77SzQHHdN2MGDZG2FlrHTLR7UcIm1UrGnYhs4psnQj53fhVhp2?=
	=?us-ascii?Q?Ac6snK7tKNy3RV2VZ2Bvk8lvtxBFckJ00mlaX3rsCdLAtPQjrIrhUHwcHcFv?=
	=?us-ascii?Q?STzA3t3hFGeRkNwr/7MYXEVQQmIX5U/iNORb+Jl6FMaAoBQQLo//ug4cPgtJ?=
	=?us-ascii?Q?e4UrNCiI7dd7ByCQz6UNUF5xzzi+UqdG1OcMX0/U3DOZ4V+j20pQJmlhye4Z?=
	=?us-ascii?Q?xqtNmoh1I1aLv4ZhQVeIGkxEQhEYdvNNd0uI/iB8+egh/?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	6:ocZv5+xrnVwunDqFCWr7okpS8nNYWmI4MDq9jFjs5LTvpODgq1IkWVbG0X83IZoCCYFaFVcnSFTUUPr5tqB/uYKKiONYPl8SSh9lQHPmNkCp9/rZ0/yDLwT9GejwImZG1tRjCfIBfhc5C9P0YWwxdiBITXJRgN+CjGmj/nmj/EVZVKr57S46xPOl5mimW/TCWtdrbf8rjXlHQa4GpUZh7LpawboQPYTTHstZy5iY34E+kMqzaNXNXPFTJuw80bE7Wu8IUCnQEU1N8ots16uzYbhKDBA9/79cisJeSInuXos/euOcrgQdQhFfxyKAEbGVRdsiJm7scHmp1xXWKHGqT2tGNe2jXoT2P1iZgqKtI+8eB1YGbmPgBRSM8GX0gFveC/Gi5/VdwWyiDkvqvuyEHmIqCLmxw7ieYZaLzs8vnFjFWcdVusTpUwVsVrlGzDQjoC8In/ZbHlNcIqbFgN7K+pSzm7VkiYHBAy+hpzs1q+clxmpyvQYcVXOpSo98fp3vlNJc13UbYMgb/jGHuwW3hA==;
	5:w4DtizLuDS6jnaNxG3TMYbQCR7vuFqcpHp4xiXmRAr5KXrZSnif5g8fs9dk1iQ14kE6CBrwnyy8rOAYKsDNSLomVadk07GPjkGMO8NFoe2DzwT00ppL+Cm8bolwnh7kgc3qmZpPUrmmcFWSlM5FdqYWBQfndWfRhi83zsHEEmdJwyKvA15YACeCUA1a0m/Ft;
	24:6Id0erxgP4b35gwqa+Y5jJR6cSgKZWRJ52gnFDUCp+Lwa0qF3YjfIPXCKoPWe34BfL6f5RLTayHx+nscbjykcdhsYce6kXwlgjmKVoPy5Ps=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	7:xZsqR/hAxBr68oWs+ATkJPnv1XMcTbFdYjZ1xU/LbnSbxlExz7nVGM8UjanzT1xS+UylSG0FOCcM+mu95ZRHk6kzTyb1Hef0ek5RnWEyGq+DdeiPvslY2FqX2IfCSydEQTyhUKZpvCc0LeyD6xoHUXuJAWl2ymNDJF2c5K0xsB5bWdjjVN9gIxXxf6Yb/pyvGMyNAurO8twjLd6ONpuLSPXtdaFwdBxbBC4/Gn87kJm7v9nTuYr17WhOShxwNJow0y437Yi5VNpygAK+gUtSMFketXvDU7Ke1pENu3G6lR1GN8I5WjrdOPclGfuwNv23qF8ABwwtfSOodqBd7q961g==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 07:35:58.9031 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0908
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 2/6] gstreamer1.0-plugins-bad: Add configuration for enabling accurate seeks
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
X-List-Received-Date: Tue, 23 May 2017 07:36:00 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...configuration-for-enabling-accurate-seeks.patch | 148 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 149 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
new file mode 100755
index 0000000..46d602c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
@@ -0,0 +1,148 @@
+From 698fbfbf955af2fb9b79f9e6e8091b8750c886c4 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Wed, 26 Oct 2016 16:28:10 +0800
+Subject: [PATCH 1/5] player: Add configuration for enabling accurate seeks
+
+Upstream-Status: Backport [1.11.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=773521
+
+---
+ docs/libs/gst-plugins-bad-libs-sections.txt |  3 ++
+ gst-libs/gst/player/gstplayer.c             | 60 +++++++++++++++++++++++++++++
+ gst-libs/gst/player/gstplayer.h             |  3 ++
+ 3 files changed, 66 insertions(+)
+
+diff --git a/docs/libs/gst-plugins-bad-libs-sections.txt b/docs/libs/gst-plugins-bad-libs-sections.txt
+index dbab6f7..77092f9 100644
+--- a/docs/libs/gst-plugins-bad-libs-sections.txt
++++ b/docs/libs/gst-plugins-bad-libs-sections.txt
+@@ -1953,6 +1953,9 @@ gst_player_config_get_position_update_interval
+ gst_player_config_set_user_agent
+ gst_player_config_get_user_agent
+ 
++gst_player_config_set_seek_accurate
++gst_player_config_get_seek_accurate
++
+ <SUBSECTION Standard>
+ GST_IS_PLAYER
+ GST_IS_PLAYER_CLASS
+diff --git a/gst-libs/gst/player/gstplayer.c b/gst-libs/gst/player/gstplayer.c
+index 313bca5..d9ff524 100644
+--- a/gst-libs/gst/player/gstplayer.c
++++ b/gst-libs/gst/player/gstplayer.c
+@@ -85,6 +85,7 @@ typedef enum
+ {
+   CONFIG_QUARK_USER_AGENT = 0,
+   CONFIG_QUARK_POSITION_INTERVAL_UPDATE,
++  CONFIG_QUARK_ACCURATE_SEEK,
+ 
+   CONFIG_QUARK_MAX
+ } ConfigQuarkId;
+@@ -92,6 +93,7 @@ typedef enum
+ static const gchar *_config_quark_strings[] = {
+   "user-agent",
+   "position-interval-update",
++  "accurate-seek",
+ };
+ 
+ GQuark _config_quark_table[CONFIG_QUARK_MAX];
+@@ -266,6 +268,7 @@ gst_player_init (GstPlayer * self)
+   /* *INDENT-OFF* */
+   self->config = gst_structure_new_id (QUARK_CONFIG,
+       CONFIG_QUARK (POSITION_INTERVAL_UPDATE), G_TYPE_UINT, DEFAULT_POSITION_UPDATE_INTERVAL_MS,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, FALSE,
+       NULL);
+   /* *INDENT-ON* */
+ 
+@@ -2967,6 +2970,7 @@ gst_player_seek_internal_locked (GstPlayer * self)
+   GstStateChangeReturn state_ret;
+   GstEvent *s_event;
+   GstSeekFlags flags = 0;
++  gboolean accurate = FALSE;
+ 
+   if (self->seek_source) {
+     g_source_destroy (self->seek_source);
+@@ -3002,6 +3006,14 @@ gst_player_seek_internal_locked (GstPlayer * self)
+ 
+   flags |= GST_SEEK_FLAG_FLUSH;
+ 
++  accurate = gst_player_config_get_seek_accurate (self->config);
++
++  if (accurate) {
++    flags |= GST_SEEK_FLAG_ACCURATE;
++  } else {
++    flags &= ~GST_SEEK_FLAG_ACCURATE;
++  }
++
+   if (rate != 1.0) {
+     flags |= GST_SEEK_FLAG_TRICKMODE;
+   }
+@@ -4199,3 +4211,51 @@ gst_player_config_get_position_update_interval (const GstStructure * config)
+ 
+   return interval;
+ }
++
++/**
++ * gst_player_config_set_seek_accurate:
++ * @player: #GstPlayer instance
++ * @accurate: accurate seek or not
++ *
++ * Enable or disable accurate seeking. When enabled, elements will try harder
++ * to seek as accurately as possible to the requested seek position. Generally
++ * it will be slower especially for formats that don't have any indexes or
++ * timestamp markers in the stream.
++ *
++ * If accurate seeking is disabled, elements will seek as close as the request
++ * position without slowing down seeking too much.
++ *
++ * Accurate seeking is disabled by default.
++ *
++ * Since: 1.12
++ */
++void
++gst_player_config_set_seek_accurate (GstPlayer * self, gboolean accurate)
++{
++  GstStructure *config = self->config;
++  g_return_if_fail (config != NULL);
++
++  gst_structure_id_set (config,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, accurate, NULL);
++}
++
++/**
++ * gst_player_config_get_seek_accurate:
++ * @config: a #GstPlayer configuration
++ *
++ * Returns: %TRUE if accurate seeking is enabled
++ *
++ * Since 1.12
++ */
++gboolean
++gst_player_config_get_seek_accurate (const GstStructure * config)
++{
++  gboolean accurate = FALSE;
++
++  g_return_val_if_fail (config != NULL, FALSE);
++
++  gst_structure_id_get (config,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, &accurate, NULL);
++
++  return accurate;
++}
+diff --git a/gst-libs/gst/player/gstplayer.h b/gst-libs/gst/player/gstplayer.h
+index 0ac66be..8426be5 100644
+--- a/gst-libs/gst/player/gstplayer.h
++++ b/gst-libs/gst/player/gstplayer.h
+@@ -202,6 +202,9 @@ void           gst_player_config_set_position_update_interval  (GstStructure * c
+                                                                 guint          interval);
+ guint          gst_player_config_get_position_update_interval  (const GstStructure * config);
+ 
++void           gst_player_config_set_seek_accurate (GstPlayer * player, gboolean accurate);
++gboolean       gst_player_config_get_seek_accurate (const GstStructure * config);
++
+ G_END_DECLS
+ 
+ #endif /* __GST_PLAYER_H__ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index a5fc913..6655a86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
+    file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


