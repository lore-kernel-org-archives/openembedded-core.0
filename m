Return-Path: <chunrong.guo@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0122.outbound.protection.outlook.com [104.47.32.122])
	by mail.openembedded.org (Postfix) with ESMTP id C23D871ABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=LKEng+EjqTa71DiXSkfqYylDANI6ybFU6AowPrD6Sl4=;
	b=eCrrFXm/+beJfOFVls/h2u6w3sSHiAC7ukiK6MHXgjbR937/lkXIsNK137Y7blD/AjoiUP1XObsffgKnHPVstIO2KH27cS/00S9pM1J4Lt8jfQ+ZNgwfJ6Uj73KOasI+WDgPRf4QQ+At9AJ8c9iZDvHoIzN+Q4a0igTg05e2Xc4=
Received: from DM5PR03CA0027.namprd03.prod.outlook.com (10.174.189.144) by
	BLUPR0301MB2033.namprd03.prod.outlook.com (10.164.22.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Wed, 10 May 2017 08:47:26 +0000
Received: from BL2FFO11OLC004.protection.gbl (2a01:111:f400:7c09::191) by
	DM5PR03CA0027.outlook.office365.com (2603:10b6:4:3b::16) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16 via Frontend Transport; Wed, 10 May 2017 08:47:25 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC004.mail.protection.outlook.com (10.173.161.188) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1047.9 via Frontend Transport; Wed, 10 May 2017 08:47:25 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4A8lKCa017702; Wed, 10 May 2017 01:47:23 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 May 2017 16:47:12 +0800
Message-ID: <1494406033-28833-2-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1494406033-28833-1-git-send-email-B40290@freescale.com>
References: <1494406033-28833-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39400400002)(39850400002)(39450400003)(39410400002)(39840400002)(39860400002)(2980300002)(189002)(199003)(9170700003)(5003940100001)(8656002)(48376002)(305945005)(2906002)(50986999)(8936002)(42882006)(6666003)(356003)(2950100002)(6916009)(50466002)(189998001)(77096006)(50226002)(38730400002)(81166006)(107886003)(8676002)(110136004)(105586002)(5660300001)(106466001)(498600001)(36756003)(104016004)(2351001)(53936002)(76176999)(47776003)(54906002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2033;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; MX:1;
	A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC004;
	1:tFSCP+yBu29HYUxGakNVwcK8s0UiEt9DZ0vIG7fGu99xeMj0CDI2iiFeRp3dygK70LJhp8wqNk9jaJaTiMk6fSmDGjzpVh8kO0NK1T4fx9S90vemmk6Xse4+jIX5v1UTsmUjfY0CkIC9dL/FdAytmVDsp7dfFOQbbeJ1UNEcFPBg5NxybWM/j7eJ6xA+RyrEhTkST9NCqZZCnSTzPtkJ/VsUXPeJkRBc8rEELvbZe15Ew+fNaNWevt1q7fqCcOAYHeZWtGPNILszdtNKDptgBv1XUdmje6RjzVxflsI1wpGHWycV/OFsN8XMsohsFBRWB/rByA6ltqvHvawyNyFJ+8PdbbXgZJgnYpbH4anLj/SSHkwbLWI1dK8yGxD2gWTMSFb3NPJQLHR+les4ShMTDZo3NE243IT1/mk78W9jGgWb5Vs2fvlCV0iifHaQbHP+pfrDdBigciN7PEJ90xtoM5D2MHQ6MFp9BdW4Onb5pvwRPFgNJE5dkJZNiY1Gd8cxleLeECl85MCVPDPRiRmWvXIxWMdM4QWaIAC83dTdQUoxUfomHOq9e8CiZmLG3rxV240BSKOfe/YPdrkOD4em8w==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d04994a8-6bee-4150-074d-08d497812eac
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:BLUPR0301MB2033; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	3:qYlG0YNUHwGX0Aypq9ybOn8E7+H5VwQTCYy4dquYnr5bFwDTxDEg4He8NiHOmdLSudR14HMesIuN24T03qNKGkV6C58bisY/EnYtF4xYGDMBtgMFcIWZlncwmOWUpMlIudSnrxuL5imZab/RFa9mY95tJuOEcVVGBNo3b6Jd4+hYm2AfH1g+iPnQ4x9XTvs8qhNWWIiY0zTdw1EDdJB5F0Lj8wChQiQahKdQqalzy0qJ72w83twRpa+/j3YTfhOt4zFTv2x3yGY49U+GmHF0LCeQurLyWf6wH/7j0/FMqXSYaiEiObHH/1pQ1dVPOZl94ayLHKZU3r2vKVv2r9CCt7MXJW6P4PRClJM20Dk8bocpM+55go9uOCX9Z17NW8AT3guYMom37eI0h06uecaZcUWDoIS97pxBiDC1ZVtcWmcGUsLEawJxGY1oZ3QiwOOQFu0p4HCA0IICA9lOMb/jTQ==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	25:aucWz0kQ4j0aZ5J2/cc8hZEydWr4VLIFmtoN718qgQsC2zmis0kB6aGWwYn9ZydTZOy7xr/xHyaYJ69q4vk8ZOqq7gr0R2hIbvUJqnDbYTvt2PzIZaoCVlbhagm6Xba94CXmee76qv3cjRW2A65zvuKACjFrVRUrtsUMCygnMP2XMiPLU9yTsSskprpuYMVJXxe/zH8Fyqqrn+poN21rWuZC2/vZy48+XhgvIoNtg8XA43lctMZ+bBcsEwhfbzrlYoM5TShTFVvoxl7T31LQPaoqYcrw7c/88W4G4t0GQBI6Wmkt5OxQsoEh+Fn5tTRT3wSf3bPan7JtszBaL9fpIorovtiuj79Wym67P+EsM3SmsOLXdQ2svS2P74HqCuYv2eCBb6AEK+hrE4WZjsciqNyznFPvdJb1GspZvQIWkRVGdHZHTglA4KRsaGnBb9qPrFjXH6jPI4BXL8XGOltHnA==;
	31:M5D+crFaFvIbqsmF1oA4OTLJHsRpZLOq3GAYpUE88aepEW2RZmhfPO0ffMSxIiy6Xj65SRxoSmoYwZGTElsVGYayffnvzxO4aVAxwS00qO8KnMgFb3tYkGyIPkyY3IvuBb574Y5DXuinh+xwF+SnlASSitaMsV4LsMIVg53/wlzpL3sxsAHWmfgsR8hNwUgXR/a71sNP3S408fjcOdxJnBqU7PlrPV4yrP6mekaC590Y5tuwS9bYFUtNwZ/AQXEFEEHtsnokkdRISY2+oGf4NA==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	20:lOJSle3oALKDZW82+8LO7qX5nAx7XNcr5qSJqD6tErq/GQ82PMedqkcgY4s0ohqzSn19g1ttyWZy9q2XpcfWl1CP9yX/MYTYAZUMMrNVucHBcAgG5bemC7W0KCGj6FikIHFMZ7hdfvQGF7x0J/qr6Y3u9T6inrOokN2VKNBtTL16k1SYOi3Q9eQM8WEDBVd5/O7mN0Pz/IyyBpZebeGHJLzkQvQGjzu82hDUkurNGtWU5MwIgKFZKxuEbXIoAs5H3JlVwM+gAvfjQeQA0++4LHxphdR+CelnznJzPyY0PHlrss0vMek+woS5swl5FFzCtuUeQd5E6TE5NHtBg3K3iayny4J5IV/J8w1TSwpQ4uQm6Y9jV+GDbkcjIVNW1SXNQA+cOLywohrFznDzTK/bbJWdzp8/QJfgVc0EzSF6hCtVn4UpkCLK+rBqLTUbrn/4yGtAnTA22zszQgEUvC6mDDJHbNo57gnY4mmz8TsMgHjkV053uuti3vnRA46g87NVdVVMfAIsLQileuo+2Ns4ZkX/MtC2h6MjS40hXVubExFH3EtzcC6vL6gQrsjk6N3bMPBL/PXr465yfFkO0zb/1G+zDd9cb99w1YT+vKbcEHM=
X-Microsoft-Antispam-PRVS: <BLUPR0301MB203307E2F01A7D25C09F317884EC0@BLUPR0301MB2033.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(13015025)(13017025)(13023025)(13024025)(13018025)(8121501046)(10201501046)(93006095)(3002001)(6055026)(6041248)(20161123560025)(20161123564025)(20161123562025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(6072148);
	SRVR:BLUPR0301MB2033; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2033; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	4:KA1Ngh6U3KcxUhePNgW02H36fK5ld5sVKOofbi36?=
	=?us-ascii?Q?jJAdUI4feHkbsROKsFfPnSmlZ+L40/Zsg1YCdgUkUqMkCuGQZhePK2J1QQzX?=
	=?us-ascii?Q?+FhSpQhhK3CyEdrboPdMTJVdqyAAZTJAlZxHp5uPm2gAlYX0cY59l1mvgJ32?=
	=?us-ascii?Q?Uo1kejpcLI5luFSTeREgTe9v6s4t+xcFV4mdXIklVAoTzOeWEwz682B+WarI?=
	=?us-ascii?Q?UCW/c+1rs2ZKMW439RT06sy1dgYYJE3P3v1+nuP6yiyrVHzmVAZIHy9Hlv1N?=
	=?us-ascii?Q?xyFfxNpcOArU+rwnlNi2tlaRfhSc832K8sd8ysFT99WVNoQOBGoxMikSM0h7?=
	=?us-ascii?Q?h35VLvmti0AWsW0F8PwplkxPdVXu2EidowjiRofTBAVXy9IQ7xUDwCsIDbck?=
	=?us-ascii?Q?Ix8p60LZcHwxUYf+VeV4O5n+7gBHgi1E21S+9piJCtWB4qxC9gwP7M58qXYz?=
	=?us-ascii?Q?G5EMHU7/6NjyG1rliOcY7fdhCIXPPd5gZKSbmze1a5G9oQPzsLmC/csIfFXy?=
	=?us-ascii?Q?/cVDFgsBZdX3DtuHesbH2PfT+qIxr67DjzOrtH/9tKJFAKZ+PM6mwTsJkDaL?=
	=?us-ascii?Q?zwP+IBLAlbZI211b9xx2kNvOzj3e2Rmq76TC3QgxjfT2HgGM0eDtphXPIDy2?=
	=?us-ascii?Q?C+kS0NBR9BW2UeVwbxjpHa3dO1Ifvy3ZqWigm7PsVzTocD6a4yGJV+REi2f7?=
	=?us-ascii?Q?Ut1IX98Ss0mIgCC5pDfDNsurSq6R/qaR0OOf/htm5ZhjfvvfP+60Q4UVyizf?=
	=?us-ascii?Q?ui+f5znLe+0jqmZzCGEUnDHMSWiI+GwpS+9AyyN3IAjsKJ6+x9DpGAWg2RBj?=
	=?us-ascii?Q?iYQBSSgkyvKQQebWklPxFWaaAuze1y6WwPFGRDM84Cv0fn5GhS6BV8sT1Pjv?=
	=?us-ascii?Q?X7IM1WmaRuwXRr/51B3afDybKJJF9Jcad3wel8ya3wTGBoMc/ewvGXbvX/v4?=
	=?us-ascii?Q?Hu23kItIF+wKHDESOykzYXT2g/mbG8tSvZ1WbYq6oA=3D=3D?=
X-Forefront-PRVS: 03030B9493
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB2033;
	23:el2IKnidY4i4qPWiXt0L0H+6qzY/HtH9MST1tpg?=
	=?us-ascii?Q?QDs2lejVYGhPGMa2OnuIZYvL7tO1c7uXzvymaLuOTiBySkKSWE2dT5k+lzKV?=
	=?us-ascii?Q?VHi7MErJgCsbf3/aDT64B0qpUj35ZL7IPmJJyInQB/O+cN41qgdEGgHeQuY6?=
	=?us-ascii?Q?FlDo9x/IQcPI3Isl6UiiWXMH9YO245YgEb6oqeVBLeXXR/RKB2goD8pWc3nF?=
	=?us-ascii?Q?Za04eEfyMKo0Ss49SDXz6/SQT+AvmvrTtzxrb7LfiFLXae+X2mIRanzNlpmd?=
	=?us-ascii?Q?3nhPOHhgT+RoV+mstCEo3CASLONa79ZrKm2P8tF7Z2nCXiKnEX6JzOtvo2n5?=
	=?us-ascii?Q?qCLZwLd8PPv9Li+SAEgyOH5l9e5aq0N/CdKT28tuCzNkUP1jD8SIR+eMikF4?=
	=?us-ascii?Q?WTD6khxDD5Mxo3TwawqmFn7E7mDDdx3QrlSKOH4MiE3jz5O+RCqcysmZbAuA?=
	=?us-ascii?Q?9z6AuUB9urqwOmJa3susDkpr/2SSEsHiQeYyz6YeU9oufJZ5O09YzQK966jy?=
	=?us-ascii?Q?HjE+2m5U2g0rrSkRTugFa7O7PA8TfK3vpcfxDYUPGIitEBT4q0iOJHReyBd/?=
	=?us-ascii?Q?tcMj3Gk7WJUe/SG9spTKK8g3svXGXjl73SCc4eU7cAvUrvd/KHe3o/J6S58U?=
	=?us-ascii?Q?i5iM713UJE+ils/BdZz4FjjW4e8GRHfGXcUyUplD3/orjyW3Mo2CzpbEc3EY?=
	=?us-ascii?Q?YKe8a71z336DyPIrh4rwDZxStj1kQZhOey1+cWtA0o4dZWdOXFJXLFf183HW?=
	=?us-ascii?Q?EQDGf9qxvxrF44cRwv+hlxAhZMJfZmehqAU3F41PVZYAzuNpvrRzQEUENkif?=
	=?us-ascii?Q?xXuxFyWjzY3S2kdCT/qt3pauVOVq0sOZ06RtQmV7Bj15tZ5I8/mp3TbHkEfO?=
	=?us-ascii?Q?qzEkwRsM2jKuwbx8mdb6+nMgnUxOvggCivCNvFROYBnj+rKPstvsNGCGXLSw?=
	=?us-ascii?Q?R1IuGREoNimb9TlN7/iwiSPZOl9tw9eagN1ya94HlbqThk+gJDH5lrcHZpRA?=
	=?us-ascii?Q?cS4SC/9+4D2FFP8702XuOtM1UV3i3M+ceYoVfo/w6amg6jwkh6W1xK5nyPrm?=
	=?us-ascii?Q?Kn7iC8AeCcCm/b+/qJaIEPZBJrI65XX5N4dGOiBp6tRnYOcy/XKz+oLr/LsH?=
	=?us-ascii?Q?K3DL2XP8Rzkk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	6:VehMj8nVL1AnavpQ5P20TD8xhgMlHskQeC4KGPIR3de8I9tjyJhvM2T8h8N9GexgsHvOgKl6unwHzD+EsClyNpcqITw21K5ME4sin5kYAq3c88PXE7oRCA+Bhm82VD7tlZPy1zjDdal6PIzhLZ9vXOd2F/AccGhqRC2juMwT1U8QHDhP3ifDJDyM93tOTxuJPoy5EvkLdA97XHMa0ZBwGk6YxERytXW1BHlMuHCoMHXKIHonj6h3xyn5S/WTODStmDNTsOFWdvQkz+569WTHb/pF8L/DY+iNFAXOIdUU+HJ2yMrwyAyBqIN8uDQWO96ZCBmU+noHiHWapmenFO2kC4bdtMPZwFqm9UuQxK/oTOSymwehQVqMOZYev+EHTIDe6ARHuLske04ZkX10MDaSHtOdy+oJs7HxmByCgmacpQUcUbSlzvPYhRVjee0rvAx8uEQCS+KxKdJZWmeD9SbdBBZQ92tcHOg9cHNRPJSCXLVnqTlg9iKjwR2rI4ngXKBVZqkW8OjvNTuvrRlGlCqMt7+6bJ+Wh+ss6MSlzH3hqUb8BfRIkwoaiBmvny59Y1THE3N4AnQNnl3On+aO4/wyEw==;
	5:ucDU25aprizzI6IZQh69JADztqLYo7O1hPO5Pcrv3AzqCm08uaSN6LDSrSAtyMUJ+5RHVNCZhSiu82RvjOy4NJsAGfzUcF++y8WYAM9tjh8PoXuRaag1TS0dvfShSckyTrHBy4VusSIpUflKJonI3A==;
	24:dq4LYsuIucIoPaqy+WeprKS5o/tu2AbUVbYOfqzN8bmQjHhg33u4OWiO9svpN8EVJ0XoQalys+7EVbQH2hXXLnUYEAKocePtW8GMvhpxoH8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB2033;
	7:78N7p8EZURFyAZjLJQl8wBxs0eGnKpKGxBlUB92iem19ffav4dgpxIBEuPEq17O2BVD2MuxqyJVLkEYAe6exIjW4LCeaATMfEeoc9d1h2ZwFv2LUHKILzb0v+60eJcs5zYYFQidKdH4g+0BZRkVoPnp+lx+MFBM0DP1m9s9rpfNT/rXl2O4jBUE5v8WWybGQs2PGyp7T0SlvC3wEzTkbsxt6F05HCrouU8hm8ijdX8Hg3pBd7nabUSgHIGf2Kzv66ZoYX+20xLbgOF9BECnTU9KJQG350dJYaj6GtM4wQ/S+6C2072XYY6JNjaqHY6tZY1NJV9L5mKEkzf4ZY0fUxA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2017 08:47:25.4123 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2033
Cc: chunrong.guo@nxp.com
Subject: [PATCH 2/3] kernel-fitimage: set replacementtype to vmlinux
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
X-List-Received-Date: Wed, 10 May 2017 09:03:07 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f40fbf3..9fa836f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -10,7 +10,7 @@ python __anonymous () {
         if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
-            replacementtype = "zImage"
+            replacementtype = "vmlinux"
 
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
-- 
1.8.3.2


