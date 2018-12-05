Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 15987 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 00:55:37 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
	by mail.openembedded.org (Postfix) with ESMTP id 338D66D234
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 00:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=h5tvAC6PdBU/NrDGqH/8pEmfXs3B36RAmq/NNNccMNw=;
	b=fdfCyGBNslgEhqOcsSVWMjBWa8bxdJxbax3KiAHgqBz2M68dgRJv/qKUAR8VWsuHqPA+C1i0KchGtRp/0xB5BKv1KN4EtcIqm082ExngrpxF7CDEbqqeKrLLRi1UBAwygrP2QEA1At6s6EP/00VqRn4WA6lTsoY7RsecJP9hz8U=
Received: from BYAPR02CA0046.namprd02.prod.outlook.com (2603:10b6:a03:54::23)
	by SN6PR02MB4336.namprd02.prod.outlook.com (2603:10b6:805:a4::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.21;
	Wed, 5 Dec 2018 00:40:34 +0000
Received: from SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BYAPR02CA0046.outlook.office365.com
	(2603:10b6:a03:54::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1382.18 via
	Frontend Transport; Wed, 5 Dec 2018 00:40:34 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT061.mail.protection.outlook.com (10.152.72.196) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1404.17
	via Frontend Transport; Wed, 5 Dec 2018 00:40:33 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53683
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBr-000050-He
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:23 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBm-0007rA-5k
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:18 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wB50bBqx007375; Tue, 4 Dec 2018 16:37:11 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gULBe-0007qa-Q8; Tue, 04 Dec 2018 16:37:10 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 16:37:07 -0800
Message-ID: <1543970227-15416-4-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543970227-15416-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1543970227-15416-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(199004)(189003)(336012)(50466002)(186003)(11346002)(316002)(305945005)(48376002)(47776003)(26005)(106466001)(106002)(7696005)(14444005)(36756003)(2616005)(8936002)(126002)(9786002)(8676002)(478600001)(486006)(2351001)(81166006)(81156014)(446003)(51416003)(16586007)(476003)(6666004)(356004)(4326008)(426003)(77096007)(2906002)(107886003)(6916009)(5660300001)(50226002)(54906003)(36386004)(63266004)(76176011)(2004002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4336; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT061;
	1:EF3mUvhrYf3sAGe7D3Me2SsTUpTGaeEqbYlu3vJUG05HDvr947DvXEAYm01CJwUm7t+DKn+LlHIRpzVDo4bxJD1oTsjtF5gQ3v53Lmjcgd5gYlBMydybwuGSlNsIWtmf
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0093c699-c608-4962-ddec-08d65a4a4428
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4336; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4336;
	3:VT5+z2lFH8GCcWExlMf4T6PVymXSGwUuOgPy/R57mi4hGa5sgLJYlceFkgigCeUkZnL1O8WGbEZpwBMJolyKr8FLpOMwPZUL1f4kFCAolzD2sOJ65lt8YD1G54/tp57njqcWNKxcTSQQQZgp1sCpO6rI32XyIVffy9ib8Up9et/z9wsNKXQ6uUrIDZ83hmWz2OM6C9L0KU3PXvfE/C7MdxZlX+lR8tePA4e5i02AoaZG8dqsAoBe97DSHUBuhjKL7AGYXj+dqp6yAj1jSHfpr9OHlVdWOVyeA+o8kAz5eiGZi//+SaATc8ulwdjduniGZlyE2rwXVDfg20wG8fuwg2c9AiLYgDlsSiDXGBmySfU=;
	25:7WDYxHELSJPnjzwkdUCl7NrctdrBarYLBys/ibiKJNtWnOoX/T+QYtO76aaKOjnQ5hx4gwYHAUFB6bA8SHfO0A6s6Yxxv4GgcgP9F2k/woCkQ1P81nmMXWj/WTvdxDEB2Ha9nDCXuEeZjujorLFFTB7oeKBirV6QfS/Ds/KW/mBgSdmdCmK1/50dXNuD2Y9yQZ/ZDdm7tQEs06HIyEaYAYt7bqucE9Uy3yQhkQzX7Cr8tEtoQusBTekF/nZmffqGDP0kCzKrXch1y1CeNEtkoha+ZNvckRIhYh/0DI+QeFksLKPJSPwI0VIC5HiZ0iBe5KvehOFPsMj4yS5qDVA/Nw==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4336:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4336;
	31:u6/ySg0hVoYkGEOWN1T1271g9/H5McAoK77TK66oDIAZB9PddPtNTvosd/sSBFn3XeCrLOX8sGD54nv+ECklhQ1VX9ni2/FphpOP0KIgkZwBRG10vOkgJgY+4oIax4PSA4jrEa0FaG84E9/tDhZf6jG2OOqvjUK/FCtr33XrWP5ZeDjllwXq2nIbpZPYtg0Fm5fPQhfsSt/PzCw0mFRM7PyrwX4O6QbohV1n2STV3Co=;
	20:5wqgqwj0uD10iCUHkkaT32/fNYyhK9AbRpsnY/0VlYr8L/q44nmTLB1TDh9J2ySHctQ9znnRKyMrrbVtBsy64HEnKUYYnnEAJqcDIaY/NOinaoqSCwRyuMCF8BAwp7Cm5aPCWOKVIM4d27UQBVHJ4X8pEetueyvcNfCbq0qpMUxpE7UPf9gfj3A/9RjmfRTXO8w2lrBBpOYOA4iRwbFdgkVyVYIc7xuMY9cbA3lPjMu0JNV0H3N6//4iV6DsfGYA3u2S86dAlq+O8r25COSWOkYk65yap/p5rwCFl8d7Q66djHxk+CINIUdxVNPXHxJ/qFMmZ89QtFogLeWItV6DpF2WYEnii9bCP+ZZtTuwMgmNKZNJNKB/dA0I+TmHTuwzBMU8tI77zuDhfFx1k21MSD3PJxIGDU4vw7e5jxa4MfcNBTxzru8bw4vls8CLe87QgzvY8OKiShlXVSvz0F5pELzsjzIZ09h0McLinnVus3+hFt8OLgB76uDq4mpxXeeL
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB433615B19D48246CAF410E4EB0A80@SN6PR02MB4336.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(3231455)(999002)(944501493)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4336; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4336; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4336;
	4:tlbK3q9itJJeAzBdflTIc42KhjcsZn5lXqfwTruZcb6eEpvI9bsbdbFyZ9qe7zhDCllGncVuO/qsdFPiq9tDLsWVfGqCxE4KAM3uvSTD8qqatPe0HQPq/V9wBlbC6Hr/0m3EAoKhL/Lt+SNr/OWXPncR5t1NqyWz53arnqqaMNzINwG7rArBU0VjiM2tX5TmHUv5m3PSysFfGPi4NX2SkED+ba+akVX+xkvSSztUGK7vIeqyNe+EUUBETflpwUQxzlM9VgLzn8ZlnCN99rQlxQ==
X-Forefront-PRVS: 08770259B4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4336;
	23:tDU7AzbRBUOV+mj1B861PxFPm8TgOXAK6+ykuuBtF?=
	=?us-ascii?Q?4jruyERvOkcnshmjDsBLhtPjJcOllWx8ecl8WNaqCLwII3OKckLdfyefufNI?=
	=?us-ascii?Q?ukUzIHXI10ZwtOp1ObwNQ7UeYePhROZAuRgYYQpt/Zlq6qk7fbQdQ5goOZsn?=
	=?us-ascii?Q?zoOGGko4cM8rwxCLYVgMlJP4PCPKL5ZHpkhDytAGuwA9pbEmWhaTdsruM0FR?=
	=?us-ascii?Q?DOR3bT9wPQ2qNWlOndCul0w6jWTbDnAZp8f1QLbpU5hOp2lYU19EvogCxAN/?=
	=?us-ascii?Q?B5ESB6Cbr8fxkVOXVuFUB6xwtSEmd9MMEhpwZzwzHs+9mSwuUYgujIqntSXt?=
	=?us-ascii?Q?9YX/Jha2sksQet32OsCf0/yL2y52LEVX1MngEHZSjlO9BjHOLERtOMXjOAKp?=
	=?us-ascii?Q?BNnqBkeLiTaxN79+n0nD+cYxj4WaLHVWW+1ZTM1ihNacKREAfmCV8bafufL+?=
	=?us-ascii?Q?Vl4AxNcoDJokoPerBEjybgYSJ1R095zsZuzLFVm3+v6jk8Dxubb+XL3bSy9U?=
	=?us-ascii?Q?LioGMJHMp+sISnlMQ+ZzuxZljWKmRa/nqe0GuwOsBfEgeuAIebiD5bcAvfJm?=
	=?us-ascii?Q?ZHDuDBsgUvl59LjML5pgyOOOUxz6pNYJ2ydKQ3vJcl3ueutH4LTdPGHx70sH?=
	=?us-ascii?Q?VX9+zCjDhrOSFV+rvZn9gX38DfR6sxPvFAQSNs017qXBIhp5kFzm2Nv3Oza9?=
	=?us-ascii?Q?iqmOMxYzvcI2DzoU+/uTb9mnrBdTLK+d9aPGOiKy4IYonpKoXWQFsnHAnBEw?=
	=?us-ascii?Q?WzZ2t1B1Gv0ZgWNA5RanAAxcIGrIWz5r6NxqU20fPyWpFElUsOdQpzFc+ful?=
	=?us-ascii?Q?5UZi0fqlXHz6HSVNaO0KVUfLVh4+leSCtInHN5IvV0QDgztpYAMa95/SEcv1?=
	=?us-ascii?Q?gVR8rmXnCUAygBn8bn7ZWQyxUQp89NPBrKiicIJz7Y/8AfL4QWIFZAOU0TOk?=
	=?us-ascii?Q?sEwg1O1yr+HLWaMSCzeRbeB0ecxJY/B4xX/DhJtr6FO3M1Qf/YNut/GxpE46?=
	=?us-ascii?Q?8Gk81F4ftf0e9/G9GAGMCxhhva5t5GL4k1KxJ1mvDlVP/UDbGpgH7SeFIfyP?=
	=?us-ascii?Q?8TaCsH1Z2DoKIIJoWVUP2l84WntGs/6ZfEhfwbNqRnXaQ+Y2F+iHblaIPsEG?=
	=?us-ascii?Q?uFmkYBzEAGJt6ayu80nj9kvZMZocoTaV/ENbrmbA3cY199Po/3EoVjqv1ysG?=
	=?us-ascii?Q?8urdxLh1c+5iRo=3D?=
X-Microsoft-Antispam-Message-Info: HwMstnAaNQxdF7Yw3R/7UeRLtV4JQWZ6RREelNV9WEQOm1nF7kVDd2ghH87ZGnbbGLJ6qFpbKjI67laDxacN5uvdF1o128E2nIEFTM+MAR2n9Au82l+7R0V6iX3rPNB+JxdmrOu2/A9HQfAB+Q+j5JQMSes0dwFFCxGauUIJFbAqqvwRbY1fMZaKrLAA2hSAAr8r/OBsk99iIzmk4DvlZnjg+wV7AoEwZGTawute3fbSWC5+gSy1V4Kac16BQfvlGquadQsLu+6IFTK0tMpHRMiL+oOxY1yoThiUOliHoUj4W1DWDf0JI6LgudXabDWSpEmvYlHUyQIYABs9cqpRY+TSd1uK8/5Jhl0oP3ME9Hc=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4336;
	6:tEaWt86HOvzHj78xy/hodcAMvPi+h5rJCGnOLRJ1VosJishvdT36y0vArNAmZN0CuoEx3BABGTvlaxkRF/bmGau2Piyrh25vgRRBKLVcsdT43jvjAwG1uP0zGVy/VXapWInfmdCoXtKAbThIRj4XlOkAavPyduskLxTWkKTDLnGzqXsY3uxKcwjUjXyssItoG0Rvp6yMgl2hxUVtwIpEUi9Bjr8woBBXxthf+kbotG1E96eI6uS1mWApvOtWZ9Y+oPpSCo8zrln5TYKd45nMLegI/Z2Fjf6LMH9NrxJRL23lwYpQZ6nTjJDQmi1VWnmroNxIkY3O0IQf/QRAEzz018A4D9yQDm/Njm2deJWzEq6MvvzKKgshMwymySGlCzpVTXucnBX8CbMLfFSOHJrCypANYzsKFmqcnnYXpbxsp2t16tTqDP4WDbEgGjRqhimHqMtS6DEC4qwQwDPgCKPDUw==;
	5:VXUsD7mMeuxFy7phJut2Z77ITBhoS5yAyTRtMrfm2dCSVEVFzfmZ2e3K6F7gJCmeDq0dvgxZzxZC9I+lyqpAMssxsnD07iVYw0vHM2fuP2KK9uMGB23zij5JqDp4bgnRWVSeFQjfGlCo+DUgFHZSBHi2MIi8JU6KSD30X7j6S5w=;
	7:V4c7qlGpJfGvOEDwy/HPGJ5pTaMazIzgtKqGBqEpeVSDU2Ng/DdkxgpVD2wvqIiykwRRh1s4KEN5CXFz8lfsZKrQSbTGmi43VwvaKEq2DIeTZk2nj3h9GwnipcfTGrF2Uol1802VZxnLCX9nIpfE3w==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2018 00:40:33.2424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0093c699-c608-4962-ddec-08d65a4a4428
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4336
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH 3/3] devtool: provide support for devtool menuconfig command.
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
X-List-Received-Date: Wed, 05 Dec 2018 00:55:38 -0000
Content-Type: text/plain

All packages that support the menuconfig task will be able to run devtool
menuconfig command. This would allow the user to modify the current
configure options and create a config fragment which can be added to a
recipe using devtool finish.

1. The patch checks if devtool menuconfig command is called for a valid
package.
2. It checks for oe-local-files dir within source and creates one
if needed, this directory is needed to store the final generated config
fragment so that devtool finish can update the recipe.
3. Menuconfig command is called for users to make necessary changes. After
saving the changes, diffconfig command is run to generate the fragment.

Syntax:
	devtool menuconfig <package name>
	 Ex: devtool menuconfig linux-yocto

The config fragment is saved as devtool-fragment.cfg within
oe-local-files dir.

	Ex: <workspace_path>/sources/linux-yocto/oe-local-files/devtool-fragment.cfg

Run devtool finish to update the recipe by appending the config fragment
to SRC_URI and place a copy of the fragment within the layer where the
recipe resides.
	Ex: devtool finish linux-yocto meta

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/menuconfig.py | 80 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/lib/devtool/menuconfig.py

diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
new file mode 100644
index 0000000..38133db
--- /dev/null
+++ b/scripts/lib/devtool/menuconfig.py
@@ -0,0 +1,80 @@
+# OpenEmbedded Development tool - menuconfig command plugin
+#
+# Copyright (C) 2018 Xilinx
+# Written by: Chandana Kalluri <ckalluri@xilinx.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+"""Devtool menuconfig plugin"""
+
+import os
+import bb
+import logging
+import argparse
+import re
+import glob
+from devtool import setup_tinfoil, parse_recipe, DevtoolError, standard, exec_build_env_command
+
+logger = logging.getLogger('devtool')
+
+def menuconfig(args, config, basepath, workspace):
+    """Entry point for the devtool 'menuconfig' subcommand"""
+
+    rd = "" 
+    kconfigpath = ""
+    pn_src = ""
+    localfilesdir = ""
+    workspace_dir = ""
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+      rd = parse_recipe(config, tinfoil, args.component, appends=True, filter_workspace=False)
+      if not rd:
+         return 1
+
+      pn =  rd.getVar('PN', True)
+      if pn not in workspace:
+         raise DevtoolError("Run devtool modify before calling menuconfig for %s" %pn)
+
+      if not rd.getVarFlag('do_menuconfig','task'):
+         raise DevtoolError("This package does not support menuconfig option")
+
+      workspace_dir = os.path.join(basepath,'workspace/sources')
+      kconfigpath = rd.getVar('B')
+      pn_src = os.path.join(workspace_dir,pn)
+
+      #add check to see if oe_local_files exists or not
+      localfilesdir = os.path.join(pn_src,'oe-local-files') 
+      if not os.path.exists(localfilesdir):
+          bb.utils.mkdirhier(localfilesdir)
+          #Add gitignore to ensure source tree is clean
+          gitignorefile = os.path.join(localfilesdir,'.gitignore')
+          with open(gitignorefile, 'w') as f:
+                  f.write('# Ignore local files, by default. Remove this file if you want to commit the directory to Git\n')
+                  f.write('*\n')
+
+    finally:
+      tinfoil.shutdown()
+
+    logger.info('Launching menuconfig')
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c menuconfig %s' % pn, watch=True) 
+    fragment = os.path.join(localfilesdir, 'devtool-fragment.cfg')
+    res = standard._create_kconfig_diff(pn_src,rd,fragment)
+
+    return 0
+
+def register_commands(subparsers, context):
+    """register devtool subcommands from this plugin"""
+    parser_menuconfig = subparsers.add_parser('menuconfig',help='allows altering the system component configuration', description='launches the make menuconfig command, allows user to make changes to configuration. creates a config fragment', group='advanced') 
+    parser_menuconfig.add_argument('component', help='compenent to alter config')
+    parser_menuconfig.set_defaults(func=menuconfig,fixed_setup=context.fixed_setup)
-- 
2.7.4


