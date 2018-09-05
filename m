Return-Path: <alejandr@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0073.outbound.protection.outlook.com [104.47.32.73])
	by mail.openembedded.org (Postfix) with ESMTP id B7C5D74CB4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1R843ExEXDxI1U/1Kj0zN5DDu6Nj27VPU8VuGlxJo9Q=;
	b=t5aaehQZMHaRj7Mo6xBjAMY0CQEw0H8GTcuwn2PSJ5GyRPp9nmJGkLaZcx8C7TU5znfBcDovYN/CIA3RaaA9hYXAzyTf+tXkRDSUqA1XIztZ9W7V0cZLa7YibPodWlkTxGBAv4I0a0RypaJyS1/XGPGT+T6Rt/3wZ4LNAWL50rQ=
Received: from BL0PR02CA0101.namprd02.prod.outlook.com (2603:10b6:208:51::42)
	by CY4PR02MB2679.namprd02.prod.outlook.com (2603:10b6:903:11a::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1101.18;
	Wed, 5 Sep 2018 06:47:32 +0000
Received: from BL2NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BL0PR02CA0101.outlook.office365.com
	(2603:10b6:208:51::42) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1101.14 via
	Frontend Transport; Wed, 5 Sep 2018 06:47:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT035.mail.protection.outlook.com (10.152.77.157) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1101.10
	via Frontend Transport; Wed, 5 Sep 2018 06:47:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb9-0008V8-8y for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:31 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fxRb4-0002DY-6H for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2018 23:47:26 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w856lHQ1011949; Tue, 4 Sep 2018 23:47:17 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fxRav-0002CD-Lg; Tue, 04 Sep 2018 23:47:17 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Sep 2018 23:45:42 -0700
Message-ID: <77cc8e5806c5dd43fc3cc6bba0c0fee572ce778c.1536129787.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1536129787.git.alejandr@xilinx.com>
References: <cover.1536129787.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(438002)(199004)(189003)(76176011)(106002)(77096007)(107886003)(36386004)(51416003)(7696005)(16200700003)(9786002)(81156014)(4326008)(8936002)(186003)(305945005)(81166006)(50226002)(36756003)(11346002)(16586007)(2616005)(126002)(476003)(478600001)(446003)(336012)(426003)(486006)(6666003)(118296001)(47776003)(50466002)(316002)(48376002)(106466001)(2351001)(6916009)(5660300001)(2906002)(53946003)(356003)(8676002)(26005)(63266004)(107986001)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2679; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT035;
	1:udlAK/Lr+XYYeXGRFtE0dTSa9Z++swHliVnaH0FYJFtBmjA/3qj+FA7HnrpoSUHLJ0IwNlac/c1RAJy0OYoHjAF20uCT5Qv4lxWGW9z+n+2oSYcmrcUdODvOrITSdMWN
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eae8f1a-0fbb-48c1-e92d-08d612fb74a7
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY4PR02MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2679;
	3:Z37ng0eUCs4pVKKDOeXXDIpkhebDp7igd+ZIzSg3+WXl4a7StHvMKfs5mmj6z7qja5WTC87UIm/GaAMeKeprzawD8CwkDDp+ABM583HeAA8rxdkmaLc3oVuWstLfbBvV/u/9hin63YS+dtrBdddfJ5BBweuH14ep2CTi+1pl4jeianXpggcVr2fxqmKeKcd7rFFzhluGggCD8yzRJE81zO/4CDVcHAQlbpzxte8I2Mh6bzNNKvff7bpi/ikpUCz/llMN53CajzKcncRHM473dCVeEg1htTCXcKljNkPB/FfxO8JyNkEhy9bYPPd+72o+V/ddKp2VLKcy2ieNpVaz84B3hMpnPTmBZalW2UhvCi0=;
	25:OvGp9ELgSMw/4DTK2bjZOgriNtl8CHyqfcZ9DiNyedL8ossMtnHE0y1rZeNNvIEf+eTzfAs8A3nqZsH37b/ajoevP3d5z57LuGoTQ1dVZZbfMKjb8zq7AS2mFyj/5s1GkM5UUz4fjT3Akfx8FmZRpFALQet+oXdamzN05eSdd2uBxshO0k/k/Dhxxkms1ZweW+QHcLiq7zj2qbhjeM6vGFysNYTr390YqXmh/4m9JGSI8VeDsuiynMo5Ok5rR0Dxw+HG7swWPJmc2GitbFvwUXuuJId7Z+OJ2WWbA40AvlgWl8NKSDx1N6eJFqseHV3u4i3ZUeS5tyhjTd86BAUxrw==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2679:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2679;
	31:sUqlikQjcfrLisiQCUq/pTJhWVp4mEipi7nUWrKZthllj2p4W9DjYzBIINITZ/ch8BgLFfJYPvdabCOy+QfGzSYIVLCIzmQHbaJddUEx4kX3GuVGehf2TuPMif8uZtCtJRkEPGhGgzYy0N8jUaJbA84CiERDf2ceNN22cgWHT+jKvwYuZK0C73HId7fLSRNNEADXyi/HTJ4xXixtru6ox3tAVGs2EuhH2uvEBlUIXSs=;
	20:ERYKgJG4/NxN1uw44rA9M7BoohSlfZ3/r23pLDsdwSq1Dg35b001sZb9HjDrXs+SrjpcEIE8zDQRCUqEK0ZHbVLMqjNDPhCVwJ1E4h18MdzuZXANdzf+oZScKmy/XqaiClYrTp7SqUir4icNJbAlf/Ogi5O+EypaOOJ49wE+B2rStAGcYsbfYpcX/LSWSpuf6HPEUQbspfu9FiY27xYGFpvUpjg55U1ikm6Lw/ZVV9uhZashA8L1V81Sq9SBkFhx7+V9J/CxQfAQhuZGh/ECbDT9865SAb+RbufF3T1geIKp4OyF7Q67ejtXiAGebiHG7F3xVigJUi2eg/2UoHzsCCwgfhWuX8J5trxac022LVYb82tr2pC02SNg2p3ZxRrF5179MQgIc5uU7CRziMwGtkyIHK/E47z6GnMJmZD14oExLfDWxE4XiDPDl+Xg5gFg2MOBFKYe/SMQ6T3TOvBYAE63P3qU/dqdabtM29Mef/lCQzw8yZuqlXz9xmmJzLLY
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR02MB26790DB7CAA592EA54BD7B48AC020@CY4PR02MB2679.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93004095)(3231311)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201708071742011)(7699016);
	SRVR:CY4PR02MB2679; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2679;
	4:8m7UDtwNQQMJpD4cueoYO85aqns+K3j7goTyah/99zEZiU4RQ+9CPeqFx+YpCc9nFXfW57ozo47LgR4beYuhcPraK8xH2ukJGayH9Cto6mgrD31iczhz4UJgl6q7l8vSy9AZ2lwi9Ve/LToUkEjBDNqCjTJ/u7vHbBEXug1IFbixYXTO55v13+zZTtRg13ibo2+HcqURzeSODahouimOWZSf77YrpkwOS6mvR2/EnEU2mHEL931NqfP5E/RWZ7d6nVYL8vo/qLGUZw7LL+/sJcd73bvijCVmX83LmCkls97Veu/h/qBztAgM6OsKyIiy
X-Forefront-PRVS: 078693968A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2679;
	23:5BJjIzpr+goL7r+zeE2qd8Cx9dgiVzR2bdoSAN+ee?=
	=?us-ascii?Q?O3KC6fmRKLgQO5yTG00jwltZ9GNm0ju1m9QiLLb3OUx4M6Pk5UUqEjR5cFA+?=
	=?us-ascii?Q?9jXbgh7ZLiNfI1tTTHT/OwcZI/V4V7TYIN4P6j5opVRYF4WZcUUDgXol8Byt?=
	=?us-ascii?Q?o8yf9HkzK4T34zYUI/wQX17qM7bJBwXMvaUFisw2Xx288xqoc0rdMrIYGm86?=
	=?us-ascii?Q?H8nDGN4/6hccTFq4rHdsHKyv8jLqtGmsrlgbn6SnGKQxzNmoTbQYlhtQ98ph?=
	=?us-ascii?Q?CMA3ZB2giLlNRNZ0DQ7jU0gMf1pTnz+kplji6ThjUTHl1xMw4yPJzexj0bKs?=
	=?us-ascii?Q?T8y4kIzF41eTYtX6q0iArDu2D9Z95Nj/pQBBLNXVDEdM3ebewjfDGZUkWNYa?=
	=?us-ascii?Q?+szoqlGTU6Ln9iI5ABGDfE2oT/mhQgT4Bx69Rvwat563yVxQxG+5cITwDTMZ?=
	=?us-ascii?Q?9J/9UUOMrh1bP0+LIZ0B/a1v9BWgfuUsALE3Vqjx1Ce05s5t+g3R1SaGMHMw?=
	=?us-ascii?Q?6roe0ot78kJ41joljHarzSOV8oqUGqnRmHHJ7Flhrt4U79TrVxDqIvmtyjp5?=
	=?us-ascii?Q?/d3Mno/C+UByy8lF7nyNEzHI4yq2yjNBFok48/hOBeh1SnPBRHUitrWo4HSq?=
	=?us-ascii?Q?HRTB0RbchLFv/lDHyiI3aIatQM6COXrcQX/ujTzU7yM8lLI24LfyagZuYGTi?=
	=?us-ascii?Q?24o0W86ChlE1IAocn3Q92idRY5Wg+z+mEvVQXXAQciO2ghug/EVGOvM5gQOr?=
	=?us-ascii?Q?WMDK9/oTYzNUHHaI9tUf3ZemThWdZB1Bf4UqJHzuFZdcqzlB4iMS4fRAOFU5?=
	=?us-ascii?Q?ZlUXTd8edWqIvyoUVdjUOTsvJo6fVnhvol2nDkelaKoe9s14EXE+9sMLzL+l?=
	=?us-ascii?Q?fo+tCtRElGHDayQfo3AzaGq3lwv7M4l3kCAdRr3KGg+w3L5r/hA6y5kjN4+6?=
	=?us-ascii?Q?SXN8JGPBJM49p29tRkzAbzR47lIrU3E91Mnjz2HuOM5St465e6EqmZlCEmj6?=
	=?us-ascii?Q?NZ4b3dOfX1MYm31LDFQIQ1GE2AmOyScz/2/uGkH9H8pQBjBPm0S9TlGboqAM?=
	=?us-ascii?Q?+zbMGkZTZd0VmcyMiEEJny9PxS5ejpXxbp03II2L/VNPp7f9Y2DFfO3HsLhb?=
	=?us-ascii?Q?kdaLP5fZHjj+IaflLlCP3vJ58Vtxk6ajOogVomgAV4C2/OMLEsyXD0JuVSGw?=
	=?us-ascii?Q?7hcUjYvOeOFCQs=3D?=
X-Microsoft-Antispam-Message-Info: sGdJx2YWmmqCKL4o8rRkgRfIkJoMptpwoTdTatM1Rn0CVGmsHeUdSt1lzX+v8OEQH9mdHdI+ksLvfl8dqdIoyc9xUicUv6iC/yMCcgOqN73DITJTQiFp/wQwRDIy7GYH/vKfWbrGKQMuvOkmKat8FFTOVi00AAyastJCyPdrh6y0o2iUpti85Hb1+In6xj8Sm5Fbzc19KFQ2yUZmw3vRIKFcYrwAMAXJWvVxm953C+L5zXpotl53gpT5b0jT2AphYvjPh9ahqJ3RPfw4s0PN2SNNSjDNprGuXKx9aPbSBRgyWt0Hjj6S5UdGXoyWeVc6VL4FcTNYP1M+MkcPOMWsi4h3rFmsHhIZU32cuRv/8Ec=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2679;
	6:0Qdu+EtfRSoSaFZi87rNdihnsDJij5foqS/ZrS2V5D+WBRY8VEKRdX+dZHcNzxYSZJrD4OjRhvv9HPmleVqyVx1u/8/zCWOerHIZpUZHZT71IO615vvNABBvN5FBjCAlBnAhhtp0ALGP5T5eEkPPbLYMfM6NGJ3jyqheY08I/oKH2G1rWDZRAs5GfyWqgAdY3jXIes0VP/E6AWKRsXNnUXka84luysNa9qVx6zMOc0k9/os/qlVFUWAg1ysevwTe+r2XCvuEMaJ53a+f/BZbAOq+GfyTpJqTi5ai08cC4yhkVrHKkPP12b9dljJkPkuvUbGfZGz3bTgXmJUXUCu8HfpFRZ3V+IVZ73+Hs1CK05yW5bzTiGQ/+I3P5nz9K3KdRYDXY5oLooCCJ/OdPA6lilUsyfpEE83tyKxhlOp17kzHOiE++VGroHt0HBdZsJ04ucLqrQvvH9HD4jKcm7ehoA==;
	5:Q9QdVfJ+YMb9y61EXhLlPbUXsPCj2p/H5xl4ZPOjpQem3LdWzQSQyOP3XrqSik1F8IquKYyRwKeA/vymUYNSxUBAsvJ65PGk99R1w9yZRuZYa0PERwlPVUYUo1VAvZUVAiMhwrj+B80hJLYlMOiDTOdT3Vp4W6Ug25qDl9w/fJs=;
	7:Z+IkrzklRb1z4lQsDSLxJEUwvj9NDw0jxnfxIW2xOmFxxuRx5PSYTLMblWYC50T55W4LuLAE5oSSpCiT0fQKOIeaS8u4E4pOpuK7gyLRwtZR8o9cbh+vr29QNh/6H4gOm3qD0oIdaCcOya4vjXhjFKs6DPiGe/d9EzF69dzhkXJcXpbNYar5AMDu2yE63FiXFx1G3PkHrIOn5sdSAwIBzOJSOpeh+9lDOngcX4RZEFM5igzt6zkDENPZUcEj05Vn
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2018 06:47:31.9162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eae8f1a-0fbb-48c1-e92d-08d612fb74a7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2679
Subject: [PATCH 1/4] python3-manifest: Use PYTHON_MAJMIN instead of hard coded version
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
X-List-Received-Date: Wed, 05 Sep 2018 07:20:53 -0000
Content-Type: text/plain

Currently the manifest contains hard coded paths with the version number,
e.g. python3.5, this patch changes the paths to use the variable
PYTHON_MAJMIN instead, this should make the python upgrades easier

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python3/python3-manifest.json           | 804 ++++++++++-----------
 1 file changed, 402 insertions(+), 402 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 3dda9f6..e332078 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -3,7 +3,7 @@
         "cached": [],
         "files": [
             "${bindir}/2to3-*",
-            "${libdir}/python3.5/lib2to3"
+            "${libdir}/python${PYTHON_MAJMIN}/lib2to3"
         ],
         "rdepends": [
             "core"
@@ -13,9 +13,9 @@
     "asyncio": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/asyncio",
-            "${libdir}/python3.5/concurrent",
-            "${libdir}/python3.5/concurrent/futures"
+            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
+            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
+            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
         ],
         "rdepends": [
             "compression",
@@ -36,18 +36,18 @@
     },
     "audio": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/chunk.*.pyc",
-            "${libdir}/python3.5/__pycache__/sndhdr.*.pyc",
-            "${libdir}/python3.5/__pycache__/sunau.*.pyc",
-            "${libdir}/python3.5/__pycache__/wave.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/chunk.py",
-            "${libdir}/python3.5/lib-dynload/audioop.*.so",
-            "${libdir}/python3.5/lib-dynload/ossaudiodev.*.so",
-            "${libdir}/python3.5/sndhdr.py",
-            "${libdir}/python3.5/sunau.py",
-            "${libdir}/python3.5/wave.py"
+            "${libdir}/python${PYTHON_MAJMIN}/chunk.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/audioop.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/ossaudiodev.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/sndhdr.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sunau.py",
+            "${libdir}/python${PYTHON_MAJMIN}/wave.py"
         ],
         "rdepends": [
             "core"
@@ -56,11 +56,11 @@
     },
     "codecs": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/xdrlib.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/lib-dynload/_multibytecodec.*.so",
-            "${libdir}/python3.5/xdrlib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/xdrlib.py"
         ],
         "rdepends": [
             "core"
@@ -69,12 +69,12 @@
     },
     "compile": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/compileall.*.pyc",
-            "${libdir}/python3.5/__pycache__/py_compile.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/compileall.py",
-            "${libdir}/python3.5/py_compile.py"
+            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
+            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
         ],
         "rdepends": [
             "asyncio",
@@ -95,23 +95,23 @@
     },
     "compression": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/_compression.*.pyc",
-            "${libdir}/python3.5/__pycache__/bz2.*.pyc",
-            "${libdir}/python3.5/__pycache__/gzip.*.pyc",
-            "${libdir}/python3.5/__pycache__/lzma.*.pyc",
-            "${libdir}/python3.5/__pycache__/tarfile.*.pyc",
-            "${libdir}/python3.5/__pycache__/zipfile.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/_compression.py",
-            "${libdir}/python3.5/bz2.py",
-            "${libdir}/python3.5/gzip.py",
-            "${libdir}/python3.5/lib-dynload/_bz2.*.so",
-            "${libdir}/python3.5/lib-dynload/_lzma.*.so",
-            "${libdir}/python3.5/lib-dynload/zlib.*.so",
-            "${libdir}/python3.5/lzma.py",
-            "${libdir}/python3.5/tarfile.py",
-            "${libdir}/python3.5/zipfile.py"
+            "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
+            "${libdir}/python${PYTHON_MAJMIN}/bz2.py",
+            "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bz2.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lzma.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/zlib.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
+            "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile.py"
         ],
         "rdepends": [
             "core",
@@ -122,77 +122,77 @@
     },
     "core": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/__future__.*.pyc",
-            "${libdir}/python3.5/__pycache__/_bootlocale.*.pyc",
-            "${libdir}/python3.5/__pycache__/_collections_abc.*.pyc",
-            "${libdir}/python3.5/__pycache__/_markupbase.*.pyc",
-            "${libdir}/python3.5/__pycache__/_sitebuiltins.*.pyc",
-            "${libdir}/python3.5/__pycache__/_sysconfigdata.*.pyc",
-            "${libdir}/python3.5/__pycache__/_weakrefset.*.pyc",
-            "${libdir}/python3.5/__pycache__/abc.*.pyc",
-            "${libdir}/python3.5/__pycache__/argparse.*.pyc",
-            "${libdir}/python3.5/__pycache__/ast.*.pyc",
-            "${libdir}/python3.5/__pycache__/bisect.*.pyc",
-            "${libdir}/python3.5/__pycache__/code.*.pyc",
-            "${libdir}/python3.5/__pycache__/codecs.*.pyc",
-            "${libdir}/python3.5/__pycache__/codeop.*.pyc",
-            "${libdir}/python3.5/__pycache__/configparser.*.pyc",
-            "${libdir}/python3.5/__pycache__/contextlib.*.pyc",
-            "${libdir}/python3.5/__pycache__/copy.*.pyc",
-            "${libdir}/python3.5/__pycache__/copyreg.*.pyc",
-            "${libdir}/python3.5/__pycache__/csv.*.pyc",
-            "${libdir}/python3.5/__pycache__/dis.*.pyc",
-            "${libdir}/python3.5/__pycache__/enum.*.pyc",
-            "${libdir}/python3.5/__pycache__/functools.*.pyc",
-            "${libdir}/python3.5/__pycache__/genericpath.*.pyc",
-            "${libdir}/python3.5/__pycache__/getopt.*.pyc",
-            "${libdir}/python3.5/__pycache__/gettext.*.pyc",
-            "${libdir}/python3.5/__pycache__/heapq.*.pyc",
-            "${libdir}/python3.5/__pycache__/imp.*.pyc",
-            "${libdir}/python3.5/__pycache__/inspect.*.pyc",
-            "${libdir}/python3.5/__pycache__/io.*.pyc",
-            "${libdir}/python3.5/__pycache__/keyword.*.pyc",
-            "${libdir}/python3.5/__pycache__/linecache.*.pyc",
-            "${libdir}/python3.5/__pycache__/locale.*.pyc",
-            "${libdir}/python3.5/__pycache__/opcode.*.pyc",
-            "${libdir}/python3.5/__pycache__/operator.*.pyc",
-            "${libdir}/python3.5/__pycache__/optparse.*.pyc",
-            "${libdir}/python3.5/__pycache__/os.*.pyc",
-            "${libdir}/python3.5/__pycache__/platform.*.pyc",
-            "${libdir}/python3.5/__pycache__/posixpath.*.pyc",
-            "${libdir}/python3.5/__pycache__/re.*.pyc",
-            "${libdir}/python3.5/__pycache__/reprlib.*.pyc",
-            "${libdir}/python3.5/__pycache__/rlcompleter.*.pyc",
-            "${libdir}/python3.5/__pycache__/selectors.*.pyc",
-            "${libdir}/python3.5/__pycache__/signal.*.pyc",
-            "${libdir}/python3.5/__pycache__/site.*.pyc",
-            "${libdir}/python3.5/__pycache__/sre_compile.*.pyc",
-            "${libdir}/python3.5/__pycache__/sre_constants.*.pyc",
-            "${libdir}/python3.5/__pycache__/sre_parse.*.pyc",
-            "${libdir}/python3.5/__pycache__/stat.*.pyc",
-            "${libdir}/python3.5/__pycache__/stringprep.*.pyc",
-            "${libdir}/python3.5/__pycache__/struct.*.pyc",
-            "${libdir}/python3.5/__pycache__/subprocess.*.pyc",
-            "${libdir}/python3.5/__pycache__/symbol.*.pyc",
-            "${libdir}/python3.5/__pycache__/sysconfig.*.pyc",
-            "${libdir}/python3.5/__pycache__/textwrap.*.pyc",
-            "${libdir}/python3.5/__pycache__/threading.*.pyc",
-            "${libdir}/python3.5/__pycache__/token.*.pyc",
-            "${libdir}/python3.5/__pycache__/tokenize.*.pyc",
-            "${libdir}/python3.5/__pycache__/traceback.*.pyc",
-            "${libdir}/python3.5/__pycache__/types.*.pyc",
-            "${libdir}/python3.5/__pycache__/warnings.*.pyc",
-            "${libdir}/python3.5/__pycache__/weakref.*.pyc",
-            "${libdir}/python3.5/collections/__pycache__",
-            "${libdir}/python3.5/collections/__pycache__/abc.*.pyc",
-            "${libdir}/python3.5/encodings/__pycache__",
-            "${libdir}/python3.5/encodings/__pycache__/aliases.*.pyc",
-            "${libdir}/python3.5/encodings/__pycache__/latin_1.*.pyc",
-            "${libdir}/python3.5/encodings/__pycache__/utf_8.*.pyc",
-            "${libdir}/python3.5/importlib/__pycache__",
-            "${libdir}/python3.5/importlib/__pycache__/abc.*.pyc",
-            "${libdir}/python3.5/importlib/__pycache__/machinery.*.pyc",
-            "${libdir}/python3.5/importlib/__pycache__/util.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
         ],
         "files": [
             "${bindir}/python*[!-config]",
@@ -201,119 +201,119 @@
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
             "${libdir}/python${PYTHON_MAJMIN}/collections",
             "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py",
-            "${libdir}/python3.5/UserDict.py",
-            "${libdir}/python3.5/UserList.py",
-            "${libdir}/python3.5/UserString.py",
-            "${libdir}/python3.5/__future__.py",
-            "${libdir}/python3.5/_abcoll.py",
-            "${libdir}/python3.5/_bootlocale.py",
-            "${libdir}/python3.5/_collections_abc.py",
-            "${libdir}/python3.5/_markupbase.py",
-            "${libdir}/python3.5/_sitebuiltins.py",
-            "${libdir}/python3.5/_sysconfigdata.py",
-            "${libdir}/python3.5/_weakrefset.py",
-            "${libdir}/python3.5/abc.py",
-            "${libdir}/python3.5/argparse.py",
-            "${libdir}/python3.5/ast.py",
-            "${libdir}/python3.5/bisect.py",
-            "${libdir}/python3.5/code.py",
-            "${libdir}/python3.5/codecs.py",
-            "${libdir}/python3.5/codeop.py",
-            "${libdir}/python3.5/collections",
-            "${libdir}/python3.5/collections/abc.py",
-            "${libdir}/python3.5/configparser.py",
-            "${libdir}/python3.5/contextlib.py",
-            "${libdir}/python3.5/copy.py",
-            "${libdir}/python3.5/copyreg.py",
-            "${libdir}/python3.5/csv.py",
-            "${libdir}/python3.5/dis.py",
-            "${libdir}/python3.5/encodings",
-            "${libdir}/python3.5/encodings/aliases.py",
-            "${libdir}/python3.5/encodings/latin_1.py",
-            "${libdir}/python3.5/encodings/utf_8.py",
-            "${libdir}/python3.5/enum.py",
-            "${libdir}/python3.5/functools.py",
-            "${libdir}/python3.5/genericpath.py",
-            "${libdir}/python3.5/getopt.py",
-            "${libdir}/python3.5/gettext.py",
-            "${libdir}/python3.5/heapq.py",
-            "${libdir}/python3.5/imp.py",
-            "${libdir}/python3.5/importlib",
-            "${libdir}/python3.5/importlib/_bootstrap.py",
-            "${libdir}/python3.5/importlib/_bootstrap_external.py",
-            "${libdir}/python3.5/importlib/abc.py",
-            "${libdir}/python3.5/importlib/machinery.py",
-            "${libdir}/python3.5/importlib/util.py",
-            "${libdir}/python3.5/inspect.py",
-            "${libdir}/python3.5/io.py",
-            "${libdir}/python3.5/keyword.py",
-            "${libdir}/python3.5/lib-dynload/__pycache__/_struct.*.so",
-            "${libdir}/python3.5/lib-dynload/__pycache__/binascii.*.so",
-            "${libdir}/python3.5/lib-dynload/__pycache__/time.*.so",
-            "${libdir}/python3.5/lib-dynload/__pycache__/xreadlines.*.so",
-            "${libdir}/python3.5/lib-dynload/_bisect.*.so",
-            "${libdir}/python3.5/lib-dynload/_csv.*.so",
-            "${libdir}/python3.5/lib-dynload/_heapq.*.so",
-            "${libdir}/python3.5/lib-dynload/_opcode.*.so",
-            "${libdir}/python3.5/lib-dynload/_posixsubprocess.*.so",
-            "${libdir}/python3.5/lib-dynload/_struct.*.so",
-            "${libdir}/python3.5/lib-dynload/array.*.so",
-            "${libdir}/python3.5/lib-dynload/binascii.*.so",
-            "${libdir}/python3.5/lib-dynload/math.*.so",
-            "${libdir}/python3.5/lib-dynload/parser.*.so",
-            "${libdir}/python3.5/lib-dynload/readline.*.so",
-            "${libdir}/python3.5/lib-dynload/select.*.so",
-            "${libdir}/python3.5/lib-dynload/time.*.so",
-            "${libdir}/python3.5/lib-dynload/unicodedata.*.so",
-            "${libdir}/python3.5/lib-dynload/xreadlines.*.so",
-            "${libdir}/python3.5/linecache.py",
-            "${libdir}/python3.5/locale.py",
-            "${libdir}/python3.5/new.py",
-            "${libdir}/python3.5/opcode.py",
-            "${libdir}/python3.5/operator.py",
-            "${libdir}/python3.5/optparse.py",
-            "${libdir}/python3.5/os.py",
-            "${libdir}/python3.5/platform.py",
-            "${libdir}/python3.5/posixpath.py",
-            "${libdir}/python3.5/re.py",
-            "${libdir}/python3.5/reprlib.py",
-            "${libdir}/python3.5/rlcompleter.py",
-            "${libdir}/python3.5/selectors.py",
-            "${libdir}/python3.5/signal.py",
-            "${libdir}/python3.5/site.py",
-            "${libdir}/python3.5/sre_compile.py",
-            "${libdir}/python3.5/sre_constants.py",
-            "${libdir}/python3.5/sre_parse.py",
-            "${libdir}/python3.5/stat.py",
-            "${libdir}/python3.5/stringprep.py",
-            "${libdir}/python3.5/struct.py",
-            "${libdir}/python3.5/subprocess.py",
-            "${libdir}/python3.5/symbol.py",
-            "${libdir}/python3.5/sysconfig.py",
-            "${libdir}/python3.5/textwrap.py",
-            "${libdir}/python3.5/threading.py",
-            "${libdir}/python3.5/token.py",
-            "${libdir}/python3.5/tokenize.py",
-            "${libdir}/python3.5/traceback.py",
-            "${libdir}/python3.5/types.py",
-            "${libdir}/python3.5/warnings.py",
-            "${libdir}/python3.5/weakref.py"
+            "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
+            "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
+            "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
+            "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
+            "${libdir}/python${PYTHON_MAJMIN}/abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
+            "${libdir}/python${PYTHON_MAJMIN}/ast.py",
+            "${libdir}/python${PYTHON_MAJMIN}/bisect.py",
+            "${libdir}/python${PYTHON_MAJMIN}/code.py",
+            "${libdir}/python${PYTHON_MAJMIN}/codecs.py",
+            "${libdir}/python${PYTHON_MAJMIN}/codeop.py",
+            "${libdir}/python${PYTHON_MAJMIN}/collections",
+            "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
+            "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/copy.py",
+            "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
+            "${libdir}/python${PYTHON_MAJMIN}/csv.py",
+            "${libdir}/python${PYTHON_MAJMIN}/dis.py",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/aliases.py",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/latin_1.py",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/utf_8.py",
+            "${libdir}/python${PYTHON_MAJMIN}/enum.py",
+            "${libdir}/python${PYTHON_MAJMIN}/functools.py",
+            "${libdir}/python${PYTHON_MAJMIN}/genericpath.py",
+            "${libdir}/python${PYTHON_MAJMIN}/getopt.py",
+            "${libdir}/python${PYTHON_MAJMIN}/gettext.py",
+            "${libdir}/python${PYTHON_MAJMIN}/heapq.py",
+            "${libdir}/python${PYTHON_MAJMIN}/imp.py",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap.py",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/_bootstrap_external.py",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/abc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/machinery.py",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/util.py",
+            "${libdir}/python${PYTHON_MAJMIN}/inspect.py",
+            "${libdir}/python${PYTHON_MAJMIN}/io.py",
+            "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/_struct.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/binascii.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/time.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xreadlines.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixsubprocess.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_struct.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/array.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/binascii.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/math.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/parser.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/readline.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/select.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/time.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/unicodedata.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/xreadlines.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/linecache.py",
+            "${libdir}/python${PYTHON_MAJMIN}/locale.py",
+            "${libdir}/python${PYTHON_MAJMIN}/new.py",
+            "${libdir}/python${PYTHON_MAJMIN}/opcode.py",
+            "${libdir}/python${PYTHON_MAJMIN}/operator.py",
+            "${libdir}/python${PYTHON_MAJMIN}/optparse.py",
+            "${libdir}/python${PYTHON_MAJMIN}/os.py",
+            "${libdir}/python${PYTHON_MAJMIN}/platform.py",
+            "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
+            "${libdir}/python${PYTHON_MAJMIN}/re.py",
+            "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
+            "${libdir}/python${PYTHON_MAJMIN}/selectors.py",
+            "${libdir}/python${PYTHON_MAJMIN}/signal.py",
+            "${libdir}/python${PYTHON_MAJMIN}/site.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sre_compile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sre_constants.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sre_parse.py",
+            "${libdir}/python${PYTHON_MAJMIN}/stat.py",
+            "${libdir}/python${PYTHON_MAJMIN}/stringprep.py",
+            "${libdir}/python${PYTHON_MAJMIN}/struct.py",
+            "${libdir}/python${PYTHON_MAJMIN}/subprocess.py",
+            "${libdir}/python${PYTHON_MAJMIN}/symbol.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sysconfig.py",
+            "${libdir}/python${PYTHON_MAJMIN}/textwrap.py",
+            "${libdir}/python${PYTHON_MAJMIN}/threading.py",
+            "${libdir}/python${PYTHON_MAJMIN}/token.py",
+            "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
+            "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
+            "${libdir}/python${PYTHON_MAJMIN}/types.py",
+            "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
+            "${libdir}/python${PYTHON_MAJMIN}/weakref.py"
         ],
         "rdepends": [],
         "summary": "Python interpreter and core modules"
     },
     "crypt": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/crypt.*.pyc",
-            "${libdir}/python3.5/__pycache__/hashlib.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/crypt.py",
-            "${libdir}/python3.5/hashlib.py",
-            "${libdir}/python3.5/lib-dynload/_crypt.*.so",
-            "${libdir}/python3.5/lib-dynload/_hashlib.*.so",
-            "${libdir}/python3.5/lib-dynload/_sha256.*.so",
-            "${libdir}/python3.5/lib-dynload/_sha512.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
+            "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
         ],
         "rdepends": [
             "core",
@@ -325,9 +325,9 @@
     "ctypes": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/ctypes",
-            "${libdir}/python3.5/lib-dynload/_ctypes.*.so",
-            "${libdir}/python3.5/lib-dynload/_ctypes_test.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/ctypes",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes_test.*.so"
         ],
         "rdepends": [
             "core"
@@ -337,9 +337,9 @@
     "curses": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/curses",
-            "${libdir}/python3.5/lib-dynload/_curses.*.so",
-            "${libdir}/python3.5/lib-dynload/_curses_panel.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/curses",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses_panel.*.so"
         ],
         "rdepends": [
             "core"
@@ -348,15 +348,15 @@
     },
     "datetime": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/_strptime.*.pyc",
-            "${libdir}/python3.5/__pycache__/calendar.*.pyc",
-            "${libdir}/python3.5/__pycache__/datetime.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/_strptime.py",
-            "${libdir}/python3.5/calendar.py",
-            "${libdir}/python3.5/datetime.py",
-            "${libdir}/python3.5/lib-dynload/_datetime.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
+            "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
+            "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
         ],
         "rdepends": [
             "core"
@@ -366,8 +366,8 @@
     "db": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/dbm",
-            "${libdir}/python3.5/lib-dynload/_dbm.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/dbm",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
         ],
         "rdepends": [
             "core"
@@ -376,12 +376,12 @@
     },
     "debugger": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/bdb.*.pyc",
-            "${libdir}/python3.5/__pycache__/pdb.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/bdb.py",
-            "${libdir}/python3.5/pdb.py"
+            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
         ],
         "rdepends": [
             "core",
@@ -405,8 +405,8 @@
             "${libdir}/*.o",
             "${libdir}/lib*${SOLIBSDEV}",
             "${libdir}/pkgconfig",
-            "${libdir}/python3.5/config*/Makefile",
-            "${libdir}/python3.5/config*/Makefile/__pycache__"
+            "${libdir}/python${PYTHON_MAJMIN}/config*/Makefile",
+            "${libdir}/python${PYTHON_MAJMIN}/config*/Makefile/__pycache__"
         ],
         "rdepends": [
             "core"
@@ -415,10 +415,10 @@
     },
     "difflib": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/difflib.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/difflib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
         ],
         "rdepends": [
             "core"
@@ -428,7 +428,7 @@
     "distutils": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/distutils"
+            "${libdir}/python${PYTHON_MAJMIN}/distutils"
         ],
         "rdepends": [
             "core"
@@ -437,10 +437,10 @@
     },
     "distutils-staticdev": {
         "cached": [
-            "${libdir}/python3.5/config/__pycache__/lib*.a"
+            "${libdir}/python${PYTHON_MAJMIN}/config/__pycache__/lib*.a"
         ],
         "files": [
-            "${libdir}/python3.5/config/lib*.a"
+            "${libdir}/python${PYTHON_MAJMIN}/config/lib*.a"
         ],
         "rdepends": [
             "distutils"
@@ -449,10 +449,10 @@
     },
     "doctest": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/doctest.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/doctest.py"
+            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
         ],
         "rdepends": [
             "core",
@@ -468,11 +468,11 @@
     },
     "email": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/imaplib.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/email",
-            "${libdir}/python3.5/imaplib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/email",
+            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
         ],
         "rdepends": [
             "core",
@@ -487,7 +487,7 @@
     "fcntl": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/lib-dynload/fcntl.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
         ],
         "rdepends": [
             "core"
@@ -497,7 +497,7 @@
     "gdbm": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/lib-dynload/_gdbm.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
         ],
         "rdepends": [
             "core"
@@ -506,11 +506,11 @@
     },
     "html": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/formatter.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/formatter.py",
-            "${libdir}/python3.5/html"
+            "${libdir}/python${PYTHON_MAJMIN}/formatter.py",
+            "${libdir}/python${PYTHON_MAJMIN}/html"
         ],
         "rdepends": [
             "core"
@@ -521,7 +521,7 @@
         "cached": [],
         "files": [
             "${bindir}/idle*",
-            "${libdir}/python3.5/idlelib"
+            "${libdir}/python${PYTHON_MAJMIN}/idlelib"
         ],
         "rdepends": [
             "core"
@@ -530,12 +530,12 @@
     },
     "image": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/colorsys.*.pyc",
-            "${libdir}/python3.5/__pycache__/imghdr.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/colorsys.py",
-            "${libdir}/python3.5/imghdr.py"
+            "${libdir}/python${PYTHON_MAJMIN}/colorsys.py",
+            "${libdir}/python${PYTHON_MAJMIN}/imghdr.py"
         ],
         "rdepends": [
             "core"
@@ -544,23 +544,23 @@
     },
     "io": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/_pyio.*.pyc",
-            "${libdir}/python3.5/__pycache__/ipaddress.*.pyc",
-            "${libdir}/python3.5/__pycache__/pipes.*.pyc",
-            "${libdir}/python3.5/__pycache__/socket.*.pyc",
-            "${libdir}/python3.5/__pycache__/ssl.*.pyc",
-            "${libdir}/python3.5/__pycache__/tempfile.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/_pyio.py",
-            "${libdir}/python3.5/ipaddress.py",
-            "${libdir}/python3.5/lib-dynload/_socket.*.so",
-            "${libdir}/python3.5/lib-dynload/_ssl.*.so",
-            "${libdir}/python3.5/lib-dynload/termios.*.so",
-            "${libdir}/python3.5/pipes.py",
-            "${libdir}/python3.5/socket.py",
-            "${libdir}/python3.5/ssl.py",
-            "${libdir}/python3.5/tempfile.py"
+            "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
+            "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/pipes.py",
+            "${libdir}/python${PYTHON_MAJMIN}/socket.py",
+            "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
+            "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
         ],
         "rdepends": [
             "compression",
@@ -576,8 +576,8 @@
     "json": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/json",
-            "${libdir}/python3.5/lib-dynload/_json.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/json",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
         ],
         "rdepends": [
             "core"
@@ -587,7 +587,7 @@
     "logging": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/logging"
+            "${libdir}/python${PYTHON_MAJMIN}/logging"
         ],
         "rdepends": [
             "core",
@@ -597,10 +597,10 @@
     },
     "mailbox": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/mailbox.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/mailbox.py"
+            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
         ],
         "rdepends": [
             "core",
@@ -618,12 +618,12 @@
     },
     "math": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/random.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/lib-dynload/_random.*.so",
-            "${libdir}/python3.5/lib-dynload/cmath.*.so",
-            "${libdir}/python3.5/random.py"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/random.py"
         ],
         "rdepends": [
             "core",
@@ -633,12 +633,12 @@
     },
     "mime": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/quopri.*.pyc",
-            "${libdir}/python3.5/__pycache__/uu.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/quopri.py",
-            "${libdir}/python3.5/uu.py"
+            "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
+            "${libdir}/python${PYTHON_MAJMIN}/uu.py"
         ],
         "rdepends": [
             "core"
@@ -648,7 +648,7 @@
     "mmap": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/lib-dynload/mmap.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/mmap.*.so"
         ],
         "rdepends": [
             "core"
@@ -718,8 +718,8 @@
     "multiprocessing": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/lib-dynload/_multiprocessing.*.so",
-            "${libdir}/python3.5/multiprocessing"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
         ],
         "rdepends": [
             "core"
@@ -728,30 +728,30 @@
     },
     "netclient": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/base64.*.pyc",
-            "${libdir}/python3.5/__pycache__/ftplib.*.pyc",
-            "${libdir}/python3.5/__pycache__/hmac.*.pyc",
-            "${libdir}/python3.5/__pycache__/mimetypes.*.pyc",
-            "${libdir}/python3.5/__pycache__/nntplib.*.pyc",
-            "${libdir}/python3.5/__pycache__/poplib.*.pyc",
-            "${libdir}/python3.5/__pycache__/smtplib.*.pyc",
-            "${libdir}/python3.5/__pycache__/telnetlib.*.pyc",
-            "${libdir}/python3.5/__pycache__/uuid.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/base64.py",
-            "${libdir}/python3.5/ftplib.py",
-            "${libdir}/python3.5/hmac.py",
-            "${libdir}/python3.5/http",
-            "${libdir}/python3.5/http/__pycache__",
-            "${libdir}/python3.5/mimetypes.py",
-            "${libdir}/python3.5/nntplib.py",
-            "${libdir}/python3.5/poplib.py",
-            "${libdir}/python3.5/smtplib.py",
-            "${libdir}/python3.5/telnetlib.py",
-            "${libdir}/python3.5/urllib",
-            "${libdir}/python3.5/urllib/__pycache__",
-            "${libdir}/python3.5/uuid.py"
+            "${libdir}/python${PYTHON_MAJMIN}/base64.py",
+            "${libdir}/python${PYTHON_MAJMIN}/ftplib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/hmac.py",
+            "${libdir}/python${PYTHON_MAJMIN}/http",
+            "${libdir}/python${PYTHON_MAJMIN}/http/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/mimetypes.py",
+            "${libdir}/python${PYTHON_MAJMIN}/nntplib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib",
+            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
         "rdepends": [
             "compression",
@@ -771,12 +771,12 @@
     },
     "netserver": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/cgi.*.pyc",
-            "${libdir}/python3.5/__pycache__/socketserver.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/cgi.py",
-            "${libdir}/python3.5/socketserver.py"
+            "${libdir}/python${PYTHON_MAJMIN}/cgi.py",
+            "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
         ],
         "rdepends": [
             "compression",
@@ -797,17 +797,17 @@
     },
     "numbers": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/_pydecimal.*.pyc",
-            "${libdir}/python3.5/__pycache__/decimal.*.pyc",
-            "${libdir}/python3.5/__pycache__/fractions.*.pyc",
-            "${libdir}/python3.5/__pycache__/numbers.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/_pydecimal.py",
-            "${libdir}/python3.5/decimal.py",
-            "${libdir}/python3.5/fractions.py",
-            "${libdir}/python3.5/lib-dynload/_decimal.*.so",
-            "${libdir}/python3.5/numbers.py"
+            "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
+            "${libdir}/python${PYTHON_MAJMIN}/decimal.py",
+            "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
         ],
         "rdepends": [
             "core"
@@ -816,17 +816,17 @@
     },
     "pickle": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/_compat_pickle.*.pyc",
-            "${libdir}/python3.5/__pycache__/pickle.*.pyc",
-            "${libdir}/python3.5/__pycache__/pickletools.*.pyc",
-            "${libdir}/python3.5/__pycache__/shelve.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/_compat_pickle.py",
-            "${libdir}/python3.5/lib-dynload/_pickle.*.so",
-            "${libdir}/python3.5/pickle.py",
-            "${libdir}/python3.5/pickletools.py",
-            "${libdir}/python3.5/shelve.py"
+            "${libdir}/python${PYTHON_MAJMIN}/_compat_pickle.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_pickle.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/pickle.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
+            "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
         ],
         "rdepends": [
             "core"
@@ -835,10 +835,10 @@
     },
     "pkgutil": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/pkgutil.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/pkgutil.py"
+            "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py"
         ],
         "rdepends": [
             "core"
@@ -847,10 +847,10 @@
     },
     "plistlib": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/plistlib.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/plistlib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
         ],
         "rdepends": [
             "core",
@@ -861,10 +861,10 @@
     },
     "pprint": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/pprint.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/pprint.py"
+            "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
         ],
         "rdepends": [
             "core"
@@ -873,15 +873,15 @@
     },
     "profile": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/cProfile.*.pyc",
-            "${libdir}/python3.5/__pycache__/profile.*.pyc",
-            "${libdir}/python3.5/__pycache__/pstats.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/cProfile.py",
-            "${libdir}/python3.5/lib-dynload/_lsprof.*.so",
-            "${libdir}/python3.5/profile.py",
-            "${libdir}/python3.5/pstats.py"
+            "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/profile.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
         ],
         "rdepends": [
             "core"
@@ -890,12 +890,12 @@
     },
     "pydoc": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/pydoc.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
         ],
         "files": [
             "${bindir}/pydoc*",
-            "${libdir}/python3.5/pydoc.py",
-            "${libdir}/python3.5/pydoc_data"
+            "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
         ],
         "rdepends": [
             "core",
@@ -907,7 +907,7 @@
     "resource": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/lib-dynload/resource.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
         ],
         "rdepends": [
             "core"
@@ -916,10 +916,10 @@
     },
     "runpy": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/runpy.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/runpy.py"
+            "${libdir}/python${PYTHON_MAJMIN}/runpy.py"
         ],
         "rdepends": [
             "core",
@@ -929,18 +929,18 @@
     },
     "shell": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/cmd.*.pyc",
-            "${libdir}/python3.5/__pycache__/fnmatch.*.pyc",
-            "${libdir}/python3.5/__pycache__/glob.*.pyc",
-            "${libdir}/python3.5/__pycache__/shlex.*.pyc",
-            "${libdir}/python3.5/__pycache__/shutil.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/cmd.py",
-            "${libdir}/python3.5/fnmatch.py",
-            "${libdir}/python3.5/glob.py",
-            "${libdir}/python3.5/shlex.py",
-            "${libdir}/python3.5/shutil.py"
+            "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
+            "${libdir}/python${PYTHON_MAJMIN}/fnmatch.py",
+            "${libdir}/python${PYTHON_MAJMIN}/glob.py",
+            "${libdir}/python${PYTHON_MAJMIN}/shlex.py",
+            "${libdir}/python${PYTHON_MAJMIN}/shutil.py"
         ],
         "rdepends": [
             "compression",
@@ -952,15 +952,15 @@
     },
     "smtpd": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/asynchat.*.pyc",
-            "${libdir}/python3.5/__pycache__/asyncore.*.pyc",
-            "${libdir}/python3.5/__pycache__/smtpd.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
         ],
         "files": [
             "${bindir}/smtpd.py",
-            "${libdir}/python3.5/asynchat.py",
-            "${libdir}/python3.5/asyncore.py",
-            "${libdir}/python3.5/smtpd.py"
+            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
+            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
+            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
         ],
         "rdepends": [
             "core",
@@ -977,14 +977,14 @@
     },
     "sqlite3": {
         "cached": [
-            "${libdir}/python3.5/sqlite3/__pycache__",
-            "${libdir}/python3.5/sqlite3/__pycache__/dbapi2.*.pyc",
-            "${libdir}/python3.5/sqlite3/__pycache__/dump.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so",
-            "${libdir}/python3.5/sqlite3/dbapi2.py",
-            "${libdir}/python3.5/sqlite3/dump.py"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dbapi2.py",
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dump.py"
         ],
         "rdepends": [
             "core",
@@ -995,7 +995,7 @@
     "sqlite3-tests": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/sqlite3/test"
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/test"
         ],
         "rdepends": [
             "core",
@@ -1005,10 +1005,10 @@
     },
     "stringold": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/string.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/string.py"
+            "${libdir}/python${PYTHON_MAJMIN}/string.py"
         ],
         "rdepends": [
             "core"
@@ -1018,7 +1018,7 @@
     "syslog": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/lib-dynload/syslog.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
         ],
         "rdepends": [
             "core"
@@ -1027,12 +1027,12 @@
     },
     "terminal": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/pty.*.pyc",
-            "${libdir}/python3.5/__pycache__/tty.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/pty.py",
-            "${libdir}/python3.5/tty.py"
+            "${libdir}/python${PYTHON_MAJMIN}/pty.py",
+            "${libdir}/python${PYTHON_MAJMIN}/tty.py"
         ],
         "rdepends": [
             "core",
@@ -1043,7 +1043,7 @@
     "tests": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/test"
+            "${libdir}/python${PYTHON_MAJMIN}/test"
         ],
         "rdepends": [
             "core",
@@ -1053,16 +1053,16 @@
     },
     "threading": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/_dummy_thread.*.pyc",
-            "${libdir}/python3.5/__pycache__/_threading_local.*.pyc",
-            "${libdir}/python3.5/__pycache__/dummy_threading.*.pyc",
-            "${libdir}/python3.5/__pycache__/queue.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dummy_threading.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/_dummy_thread.py",
-            "${libdir}/python3.5/_threading_local.py",
-            "${libdir}/python3.5/dummy_threading.py",
-            "${libdir}/python3.5/queue.py"
+            "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
+            "${libdir}/python${PYTHON_MAJMIN}/dummy_threading.py",
+            "${libdir}/python${PYTHON_MAJMIN}/queue.py"
         ],
         "rdepends": [
             "core"
@@ -1072,7 +1072,7 @@
     "tkinter": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/tkinter"
+            "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
         "rdepends": [
             "core"
@@ -1081,10 +1081,10 @@
     },
     "typing": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/typing.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/typing.py"
+            "${libdir}/python${PYTHON_MAJMIN}/typing.py"
         ],
         "rdepends": [
             "core"
@@ -1094,9 +1094,9 @@
     "unittest": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/unittest",
-            "${libdir}/python3.5/unittest/",
-            "${libdir}/python3.5/unittest/__pycache__"
+            "${libdir}/python${PYTHON_MAJMIN}/unittest",
+            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
+            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
         ],
         "rdepends": [
             "core",
@@ -1110,12 +1110,12 @@
     },
     "unixadmin": {
         "cached": [
-            "${libdir}/python3.5/__pycache__/getpass.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ],
         "files": [
-            "${libdir}/python3.5/getpass.py",
-            "${libdir}/python3.5/lib-dynload/grp.*.so",
-            "${libdir}/python3.5/lib-dynload/nis.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/getpass.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/nis.*.so"
         ],
         "rdepends": [
             "core",
@@ -1126,9 +1126,9 @@
     "xml": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/lib-dynload/_elementtree.*.so",
-            "${libdir}/python3.5/lib-dynload/pyexpat.*.so",
-            "${libdir}/python3.5/xml"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_elementtree.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/pyexpat.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/xml"
         ],
         "rdepends": [
             "core"
@@ -1138,8 +1138,8 @@
     "xmlrpc": {
         "cached": [],
         "files": [
-            "${libdir}/python3.5/xmlrpc",
-            "${libdir}/python3.5/xmlrpc/__pycache__"
+            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
+            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
         ],
         "rdepends": [
             "core",
@@ -1147,4 +1147,4 @@
         ],
         "summary": "Python XML-RPC support"
     }
-}
\ No newline at end of file
+}
-- 
2.7.4


