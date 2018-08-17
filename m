Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 10798 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 18 Aug 2018 03:29:46 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0072.outbound.protection.outlook.com [104.47.38.72])
	by mail.openembedded.org (Postfix) with ESMTP id 4348174A1B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 03:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=fo0H64ccKD8SxD3jF04F+18yyUcguCpFF4uVSvNG9L0=;
	b=i2zCva7ZA5rdcJw8Tm/RBfB6beWE+S7K45gfSXXCW40dzGjrWhH3REKgOHBFjiKLYOoW7IwaRTZxZl6DRIiZMfBQqzKrmmAL0QJVy2U5ZUhJkX9wtCe6CCUatuGh6hvs2Wkz/nx35VJNhQy3V/Fy41SsvW89ZDfx0vggnCuCrao=
Received: from MWHPR0201CA0061.namprd02.prod.outlook.com
	(2603:10b6:301:73::38) by BY2PR02MB089.namprd02.prod.outlook.com
	(2a01:111:e400:2c1c::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1038.23;
	Fri, 17 Aug 2018 18:55:23 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by MWHPR0201CA0061.outlook.office365.com
	(2603:10b6:301:73::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1059.20 via
	Frontend Transport; Fri, 17 Aug 2018 18:55:23 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Fri, 17 Aug 2018 18:55:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fqju6-0007Jg-Nu for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2018 11:55:22 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fqju1-00082N-Jl for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2018 11:55:17 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7HItAfp004799; Fri, 17 Aug 2018 11:55:11 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fqjtu-0007zk-PI; Fri, 17 Aug 2018 11:55:10 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 11:55:09 -0700
Message-ID: <1534532109-23250-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(438002)(199004)(189003)(81166006)(72206003)(48376002)(50466002)(8676002)(9786002)(81156014)(50226002)(47776003)(4326008)(2906002)(36386004)(63266004)(478600001)(107886003)(36756003)(106466001)(8936002)(305945005)(106002)(2351001)(5660300001)(1857600001)(126002)(316002)(16586007)(486006)(336012)(14444005)(26005)(6916009)(77096007)(476003)(2616005)(186003)(7696005)(426003)(51416003)(356003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB089; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT032;
	1:f2XPVnvBtxOGk1zjay6W5q/cm7mMKGuRRZ8yEHeHN4PzdncKCmGVKM99gNtSL9ruLnNH5Gs5ggXO0RXcZXyFYW+wkvpMQArrltmhT6KzOoIyTha08GsZWnprCBZeaLYX
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd94db00-1f17-49b6-b709-08d60472fcc9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BY2PR02MB089; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB089;
	3:GhWOWDBS/4PHV26WBNJD7oXG42mcfZhqYfDnLWsJWOy8CDoGGe0wA9BDj+/rZVE46TLrSzL/endemde/A1KF455erFzAsr6p0cSWmhmMUwoMqvdizHOqG0v4cjVTfDwUXeQGnt6BIDICp6VFmO3bEIpI4HNkHAAsPsqtAjVgQptG7fdrJ7X82IUi7GHL5xPiv7AU5DMMefRaGX1zrS10ikzqJC/qLrFTR0vd6QRl5YF8ImxUcy4x4b2k2emSy6kjybbpBBwfw2DU5S5W2q9eCeWbJyz4eNrJvPDEEzr8zoqcwfdlwSQICwrT5DYUfMNLUcCxYDDfioN2Zu/R3PzKYZdWGZZV732ZBdZMyTF38Fk=;
	25:Q/DMg7xFNIphg64zjvd1M40T/plwSvg8SJLwyZO8Z6oYzOrnTMMITIma9W4H9cZeASWK2Yzq728jfJpRvkVP1H30hkjRo6jpZNRRQ8M7FsHJW+33+RJAkwWFlavYCywW6jsum+Ez0m/hpS7xyLI5+inyii36Ovz1Lsg2ZS1M5SUDzoZ42ER+JRjwCt/gXn99RpaFlpLNoGSXTuysgbEn7NwpQLMjY2LC8sD0wudzicIEbaYZHOSK89PXShBqAOiRoJiYlHGTvxsOEXxLE3KA49vpjV84TQfiCYl0lQvfOofniRfoMuTaXPAr5m9wn4FbVqC8Ji+Vrq9tR2hShLTejQ==
X-MS-TrafficTypeDiagnostic: BY2PR02MB089:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB089;
	31:UFiIFG14N/w1ZDcXlJkOFZD61R1w1STZd/WxHaeLLcu9HkD/NMngacsnfx0rbF8inEigCUFU2D6GYYccG0T4JFOXZ9Axr5ta/XnNvukX/wpsTlT4LicoAMtePjwyreIl7utLjXzj+IJjPqEzyhqhdnPWT65PJc3oz5TN4xQdT8guHb4L2ESCx+37w27I0or2yGH27kHwLpruRlzDXgeZJgrY2K3x2mre40WJSGaXpEc=;
	20:e0DuRqkAwoyNE0ciZvw1/c7Hejhsdi6GnpTMDkH465i5vA2TYf4H+WHbX1P3afStxvwI2akcY33C1w8DmXXAq8l4pmW3XrurT/82bw/rJJGgnybupAwFw1WyStpwTW1EXrhIVhnMPJnhsYkL8B7MFIlwECKoe0aTSHY0DpMBXJRWUDpw0wJ/47vds5B+DZwj3dPKpQlqNdpTEu1zJCV57y5xGoo9iLsT1RfJ/9RUvq5wWTTTTOhzDZ/5qIGpYBZf1B5xynYzDEWi4L1xMOZiEzMJgRjrhT5usvPs/huCCD3mZf8IQp9aC894ckJXwbbp4bU3V2bq8MClVT1XCWOPKPZ1CpHTTe+ZoOfTDDYWilFr0Aw/YzqBP9xcJxwQjbQ47khAstjZOh/COn3HRZ+u7ZrPSTnUOcrKaoCbw4x1/V+Ue3HvgVjGFORNigeQD8KF2NlFWFuzyiyzSppvqa2HKj40tPSsFHx4yXF/CUvtS/0CUDMSdwYphG/H4t5rawTJ
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB089081DD22338D4AA0C97CFB93D0@BY2PR02MB089.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231311)(944501410)(52105095)(3002001)(93006095)(93004095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699016);
	SRVR:BY2PR02MB089; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB089; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB089;
	4:PHptS0UnZUpTfyGIXjZPgaGcwkCgo5FazhVfS6FDeJLS6AwGx3QzDXpA3PT2MWoYu7E6PbNYpBUZmTEZALT6/9fNJbWSynI7LkZ2knMC5WabqThXA9N/KxFGBSXZMYVrY6zSpmCQ7ur0gxpRwgN9Wzo7q63CK0O0YjT2WhsP/Ie278HUKvHhAmiIdeh5dDeRbuWwcRz9mG9mVC03gxIgEkLUWG8Ngfcn6FMkErJLWBIVJgTYgcx5vusMMYHg78wyNddrtaLRzGP2MBUQIAjoaRi2/KjQ4q68hB9GiA15kjhLfjEZJWXwGr09/ax3kYHO
X-Forefront-PRVS: 076777155F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB089;
	23:3iVPcKPfmYrCRFrfMspCFmNYuBb2mq5HIgwcza6cc9?=
	=?us-ascii?Q?4Kjm+7zY6ZRTqwC9aBuKF393B3yOoy4znyVxNeEX4CYh4cyXeF6/BASCQtGF?=
	=?us-ascii?Q?MEts10WzlatqwTou6qJE+iiPHyddeQ5kNTSuPotI3gbVWGlhi+8vD+fBl6H6?=
	=?us-ascii?Q?Lsb60W8kmi9R06d3cEVYZmcSWTqeuJ1kxdGzfKqBUNdgxAKVpVATeMlREkHq?=
	=?us-ascii?Q?s06kM1oQRIX+cqfeYzQjJPVTeio4XJa2UUg1GvDK4dkEEK1w3GBmbaQZ1arF?=
	=?us-ascii?Q?shWiXNtaXL4L5GxUa1lTqzg5TCGELNyKGU2cNa+Mtanbj91yG3jb/OfY4tlx?=
	=?us-ascii?Q?WXk666RpibUkQzp+OsNxrwMEaBHmuKeP1DJG5azmn8ujxu923zntnDlJh9wZ?=
	=?us-ascii?Q?VIywAc6BnAqNqRFBfCep2PWnkclzA2cYolfI+BUZWwMgb34rwMn5Rk2PDX4x?=
	=?us-ascii?Q?IojBVh620zD6XwPsIJXtttd/Pne6l26stg8btdZ1TIpozW9nnAgKKtfKVQek?=
	=?us-ascii?Q?TxXf4te2irIkMflivr0Fg05CIFMADHUHjeX9jBI4A1ScMuNcctABdHwaNrsV?=
	=?us-ascii?Q?ua6TmThiB25gKNPsaAU9l3qvOXKwJIBRddXpuDmd5hdK8wxHH/XGxoXSKsa1?=
	=?us-ascii?Q?GNV+c+ledL+0NHSWdmGVjLJ2bXNb0Mb+3u8q/2X1Ne917qPWaHJgBD3mfnUb?=
	=?us-ascii?Q?YQUAwbrBK/fdJPAsmIJGBRqP9vQthFMuZDSgaII7fCUStCAVCsH7me6UT32+?=
	=?us-ascii?Q?7dM97/C1bAr1nbG6O2aXsNp2plDp+9at63LGTSFtKz3qRqtx3uygMeRk5/um?=
	=?us-ascii?Q?JVV4i941C09EFeMt33pW51is92E7AgkWaJf6qG48ngRotFyvY1MX+LHnsTBz?=
	=?us-ascii?Q?p4QrAJD0o32fwQZWpswt+F94LhJtW5RoBCk4ywguKLXb+xzfDgMOFNb3Aod7?=
	=?us-ascii?Q?fYtfH9gVWQBR7zyG4GO7iNcXuAUNErv6rQelzrvGxLA0Y05RmcTGczt4udRI?=
	=?us-ascii?Q?cAwCfUxtNIF71HpT37yMuqpV5InEUEBmh2tdFWR4I+fzc12Dcf7DXGtOj8wF?=
	=?us-ascii?Q?mOG57jYlXpq6uGJJIBeo3McYfopRf7P2xHwcO/5Nd66qmXQQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: W0uIth78Ye/IRHdYefghRalGfiFlmrV75m+zW/e18DPdw6iJrx3mAAtJeKdY0Qq8vkxRap+Pv5/AO8GDZz4JXoUh+tyjLKJE2c+X/yJpet9n+o6gOiWLmW9jM32MErx69ej1v2jey2mWDY0LuwYE8dZT/SdRSIwEjxfi12Y7txPNC1Ld15Lzwex+UTMejMHNMtYj0ndAsZzbPV5BptopVBTnW7hdXDyz1oSmNjmO7uhSWFvrRcwjm4sASdq4hH8QwC8UDECqz4YSbmZilA5q6eKoA5FkXb/XkB4yepQGqdzcLwV8zeCg+JvmyjEGyWrdGkOQAlM32RL1fd4d+asxEHLcT/RZFwPjFrQ7cEmZThg=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB089;
	6:VolsfeTy7WyzcpXzCvAc0Omim9PrPpnj5PgsuoOxynHOfbRRXJrH/4SCo+eOb44o9uF2ahPhjDoScY2Sx/87boNLV7CuEhxjvIcXxRzBqP9YjyDDOa6oYYISImo6qM+no5yQZj3LLHeMW55HCyPY99j9u0LN2d4hTgQb5llnEU2ZAagCXUjdYQab8RRELnw2uFfk7UPnbhiePSR3EFFOelnvujUIWiCeZQKoucJkkeM6CN+VKHrMxGhtgcJjewNKxKc3exIytp4z60ikiyKYrBf/B8aDfL2QJanwb2F+Idz/gGWP9jx6ZluYvpPZWlDM43SvN9Ps1Yd+PScL0NfXJrsYcJzBPoL+Y4LV5jqnKJoEz8nl2ZQrvmHMiO49q83hEwrTdm5xVnlA0Q5LWewLKpiZI7ojc9b55D22LNnpdvb9rstuw2oSysrLPheNzSf7Tnv4VP2iKwqr44uWf053Hg==;
	5:JxA/artoIjWfRrIPxHDC9IrYocLNQ5W6nJhtX+z1Fv0W6c6GLgFQmBLQ6ZN62zDriXM3/pwZY6q4piLZx+VgevZCIzy0rMVtrSlTjM2TJaIzYfIUEbbmJC/oIvUS1XNLwYRzBry50zyDZ+UZpE6AHwCqQZgftusws0FP0f9FHCU=;
	7:BDi29NgnEL4qAavVR5vXRTFOv/e4KiWHrUN9WTqJIlunL7szalbUDfPqDSQVB3C+IEdA1eurZ5Sdxdv34q1HRJ+A3c6/+mpHhTR2Rge/oHXDmlilUbWlN2mSQzqRhdH3RYnA7pMBwDVkHuMi3za+R6lidau1vzdehNs/YAnxB6R+SSxLrHZMU+tzDOWLmbztBk89A/p5Wkz4xXHLwrEkCfA3wSyTY9kS4XPexdf+xVrsJW54ZTGr8zlwLcl6/BxF
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2018 18:55:23.1958 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd94db00-1f17-49b6-b709-08d60472fcc9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB089
Subject: [meta-qt5][PATCH] qtwebkit_git.bb: Fix configure failure on bison
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
X-List-Received-Date: Sat, 18 Aug 2018 03:29:46 -0000
Content-Type: text/plain

Fix the following error during do_configure

| CMake Error at
|   Could NOT find BISON (missing: BISON_EXECUTABLE) (Required is at
least
|   version "2.1")
| Call Stack (most recent call first):

Add dependency to bison-native to fix the above error

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 recipes-qt/qt5/qtwebkit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 9e4617a..a7dad98 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee \
 "
 
-DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-native"
+DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-native bison-native"
 
 inherit cmake_qt5 perlnative pythonnative
 
-- 
2.7.4


