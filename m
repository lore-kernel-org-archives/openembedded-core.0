Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 885 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Jun 2015 18:01:56 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0077.outbound.protection.outlook.com [157.56.110.77])
	by mail.openembedded.org (Postfix) with ESMTP id 09A3B73BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 18:01:56 +0000 (UTC)
Received: from BN1AFFO11FD012.protection.gbl (10.58.52.34) by
	BN1AFFO11HUB019.protection.gbl (10.58.52.129) with Microsoft SMTP
	Server (TLS) id 15.1.184.11; Tue, 2 Jun 2015 17:47:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD012.mail.protection.outlook.com (10.58.52.72) with Microsoft
	SMTP Server (TLS) id 15.1.184.11 via Frontend Transport;
	Tue, 2 Jun 2015 17:47:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzqHN-0005oC-Tw; Tue, 02 Jun 2015 10:47:09 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzqHN-0002Up-O1; Tue, 02 Jun 2015 10:47:09 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t52Hkgm6032342; Tue, 2 Jun 2015 10:46:42 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzqHK-0002UT-Cd; Tue, 02 Jun 2015 10:47:06 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 10:46:52 -0700
Message-ID: <1433267212-26042-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.4.2.3.g2ffcb72
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21584.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD012;
	1:n1etk3ZQNKeEI4XYieqfXrNMBY0sO0vFmKAsVTU9m2X+uYv+iBrEtPedpElIF3amsXhuTukv2zMzE9RVtNjfHHwwc0Y5KGa0jtuih3+UIgZwCHIfiowd3+0KOzRGakKrPDQ+kcCXbK7RFWASH8x3U0Xmltq2eD746rODGPzcNw2++QSSndq0itw/cpffxw0XNCY8eKdwRyfnFwNiR/Otgpfr63sBoonyFr+Ajmgi6u6QE7PolG88U4ojWfpxWg3fpNCFio2O9Z4SgtEeyASO7bT+ll9G1sMM1Bh8q+PD13+AmQJEJCtkbpV/zmIOTJY8YxRnR9vyjiSaVDu0XRJtLg==
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(189002)(199003)(86362001)(5001920100001)(5001960100002)(87936001)(5001860100001)(23676002)(77096005)(47776003)(5820100001)(63266004)(57986006)(76506005)(5001830100001)(50466002)(19580405001)(5001770100001)(46102003)(229853001)(106466001)(15975445007)(6806004)(62966003)(81156007)(64706001)(77156002)(19580395003)(50986999)(4001540100001)(189998001)(50226001)(36756003)(36386004)(92566002)(33646002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB019;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB019;
	2:PuORb1J3Z104w1FyfMa4loCnwXTBqJIjQc5taqPA9Hb2kCg8sOhYA8z1S10VPfmf;
	2:R2hwv/HGvIxhLvxgKCAbpYr+MQuZbZq/STwQuW2lcrYjcsQ/ynPt1mjKjfAbSqailNuQ17abIPxTuNbQzbdoSyLxBCxXeNHv9RXFDfv4ew2jZrM/8UM8xbb+ghf0RZZjwB7RxjLFPk0y6cyblBnPrptlZF0Uhk1fksFw49lseZcvM+NPfh+Q92J1oapSDSLjw9iHnkrniOp9ZSY7r908VaFih4e6mVvEHtof9dPeilc=;
	6:f9q4dDZU9yNZb1pcxOzE11ZikYIyjngYcgz7v4WrIZNIqnhV3GdmpdVTd+XdzA7oSG1L2xVn72zFoUlROFGoxMZ1aX0WaNOA4WFtzpCYdauwlef3PpZayVqgP0RGY3zAXOoQ6kpwXMI3x77dov9lLGO2tI/29AnvDM64xz+0u2zccl7Yv1ZegPHVq36iExEhPonxmOxOqbZcpH1qAXETfGfLNb5bPRCbyfuk3t+5Ont+Cgm8gdaZG6nAogBTey1XvypE31oZRVEFBgzTnIq5vDSC8ehA5OJalTrVLXzCtpVl6kJ37nzVa16YwLx35vwUVWUbfVpGWGcb7E18BQ416CP9PHJ9WG9njIQbmbMdaKmgaxI8NX728O1nE4DPOaHpjR5hzkHheBUzQ5dMDviOavlZatq1I+OUN0LpoTD87Is8n2yVzc0TivUQ6TrEbKnhByZHiAhI8Tzn2PHbZwMD9QzY0lvskPcWPCgPpfNkzftmvFZog/EnmjsKMHG98UKD
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB019;
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB01917BFF743AEEBB5822F568CB50@BN1AFFO11HUB019.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(520003)(5005006)(3002001); SRVR:BN1AFFO11HUB019;
	BCL:0; PCL:0; RULEID:; SRVR:BN1AFFO11HUB019; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB019;
	3:GKRSoscY/QK7KwfCtfAsGkRVvfwMsD5Gl0xw6aJpo8+Nw7hcgwWuOVT+dQVwDA/3SuDskQz/fmDvI4/cQzrF2E0sdIXlOCtyVfBPuLk016pqcV9ijj/5l3Dt9bn8/vacdxtc1zpQrsieyJ1doT9jVGcKkDuhO1QTqwS6SwyXeN7MJlIS3c1lDQZl690tjhN8yWGZD+PB8m7QtTogu0bZVY7JkoJgD683c84Y7WYi8GkGMNtsUJnoYJjQiGuucj1mNqHLif1IabVBIHdA0hx7ACsYtNwKKfiqbqFr6S1u1HHmbrJ9XIjGuNCLOTtyuKPl
X-Forefront-PRVS: 05954A7C45
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFBRkZPMTFIVUIwMTk7OTpZRjdRZWNvYzJ0QzFRd1JPdVRQenF6SURK?=
	=?utf-8?B?U09MMkkxQmZnWUpoR3VzRUpUcUp3U2NuRTRGNGk2TXNiUFBhUWx1ZHlGY3Jq?=
	=?utf-8?B?QngxZWZ0ZGNGRlJiZHNTNWx6STZBWjBlNEZseks4c1l2U2x5cGIyb1dsT2U1?=
	=?utf-8?B?T1hqa2ZTa3lTRzRpdW8zSXY3QUZRcENWdzV5MXpLd09oMG5mV1NMdWI1NEZK?=
	=?utf-8?B?NC9BUXJacnZ0Y213RlNhVGdYb2FFV2tHTXpBRThscForSnpZdTVCdjBxZ2Ix?=
	=?utf-8?B?LzBYNHZDSGEwaWFXTVdqaUJWQ2xjUWxQdUFjZWRlQzBCS2Y4MVlBQ1BWTml3?=
	=?utf-8?B?bk5TeGludmh3QlpZaTl6aGVicEswZnVxUjRLc2VRb3lObjRmZG1Idm9QeHM4?=
	=?utf-8?B?c2cwZWdPOThaYUFRWEoxNmZPRGIxWlNkNzJKT0t2eXFPOFlLeG5MdnQ2ckFa?=
	=?utf-8?B?MGpnRnFCU2NkcWdaTVI5eHV5ZFlMYVM1bE1DNG5NeXA4TjNndFZtQjNPZDA3?=
	=?utf-8?B?NFVGcG9ycjFuYUcxTTFtakh3TlQzRGFuVys5WDExTTNOdy94M01vejZZeWJx?=
	=?utf-8?B?U2ZwRkJqalY3UXlQQVJWWXp3VWt0SkRPU3ByWUhOaklJRWxPbHdwbWxONkp4?=
	=?utf-8?B?WVhrRXdIV1RKU1RiQjhBbnpLYzk4NjJoVk9la2U3WDk5eTd6cnd4Sk96Z2JO?=
	=?utf-8?B?eWZKWXU0YWpMNU02U0tzY0l2MHhONDIrQjBOWEpkYWtYV0ZiUTQ0L1k4Rlc2?=
	=?utf-8?B?eS94bVgzSjkrSzZNMzNLOVZvQTlOenRXczBjeEErc0V2RDdvSDZiSVc0VHdz?=
	=?utf-8?B?Ny9YYjgxWk1xZXB4OXZjdE82MXN5aHRBMHI1VzV5THdPeW93SFBZbGdTSDZ1?=
	=?utf-8?B?Q21Nb1JxVVUwNmovYUw5elB3NjFGOTB1UU1idnVTdGVhVXVscXpVb1VZb25T?=
	=?utf-8?B?TFFOMEw4SmQreFdlVWVNUDFXeUJhNUxzZ0w2cm1FNTJ4bmNvRkFGNFFoenEz?=
	=?utf-8?B?U3NjcHNEWHd2TDQ1b1dZMWs0TEp4c1ZkeEJOWXF0dzh2Vmd3VlJhTFdMTng4?=
	=?utf-8?B?RmVueHZYTGJTN29ZM2NWV3F1dFlxRWRRS2lsWTBmdjBvRWt0RnAvVEJicndR?=
	=?utf-8?B?NU90cjJHSlRzc0kzaGFmZktsYVlBTUNmSmo5ZGhpNXRWelIyNG5nSFBEemJs?=
	=?utf-8?B?YVprcXhZamNabHp1bXZSY0NSUFhYUWhBdHhHV2pPMjNRbzdMS3BuTEEzbGRs?=
	=?utf-8?B?RnMzajBKQmhHbHBRUkk4MVF4Z3Vqbkp5OWhSVjVaNU43KzdjQjM4UXBYNG5B?=
	=?utf-8?B?cGdMM3d2ZHpya2dqakdwbGVFZURzUmxyT2pUMGpMYzRZZkFwWnoxblV0TkJw?=
	=?utf-8?B?TmNtamtsa0R0ZTE1ZGhKMDA5eGxjRldlc0F6dktRZ3FDbGZ0RFQwcjRLTGVX?=
	=?utf-8?Q?K1PMG+8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB019;
	3:6Yr9AKs1m3yJ9PIMNs9abDu2ITTv2LwT+wh8O7V8mk9h0U8ccHO12Jr2XZeXKP1bMAxh1T/rzXeBHLUgQGbjR2+q9M0RbNeJin6kHhu1jT3cw3Dk9zPy69QSh5k2ZQvxlcfYZudLnpNBq1v/mEkXBg==;
	10:ny5PMRAZWR6kmZyHgjeDDMej2283KRXvg+3ao2uuY9B+frkkNjr05gaBGkh8Z5uhvBLZaTMb0o61OvBKi5pcfJ1uUjfEPvB4OBjPBOcLTq4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2015 17:47:11.1513 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB019
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soeren.brinkmann@gmail.com>
Subject: [PATCH v3] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Tue, 02 Jun 2015 18:01:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Sören Brinkmann <soeren.brinkmann@gmail.com>

Add a recipe for building the latest (as of today) version of
dosfstools.

Signed-off-by: Sören Brinkmann <soeren.brinkmann@gmail.com>
---
v3:
 - remove .inc file and duplicate content instead
 - pass DOCDIR and MANDIR to the make process
v2:
 - add recipe for 3.0.28 additionally to the 2.11 one
---
 .../dosfstools/dosfstools_3.0.28.bb                | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
new file mode 100644
index 000000000000..ef2d46b1edd7
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
@@ -0,0 +1,24 @@
+# dosfstools OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Copyright (C) 2015, Sören Brinkmann <soeren.brinkmann@gmail>  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+SUMMARY = "DOS FAT Filesystem Utilities"
+HOMEPAGE = "https://github.com/dosfstools/dosfstools"
+
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz"
+SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
+SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
+
+FILES_${PN} = "${base_sbindir}"
+FILES_${PN}-doc = "${mandir} ${docdir}"
+
+do_install () {
+	oe_runmake "PREFIX=${D}${prefix}" "SBINDIR=${D}${base_sbindir}" \
+		   "MANDIR=${D}${mandir}" "DOCDIR=${D}${docdir}" install
+}
+
+BBCLASSEXTEND = "native"
-- 
2.4.2.3.g2ffcb72


