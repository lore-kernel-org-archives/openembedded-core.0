Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 846 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 May 2015 06:02:52 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0076.outbound.protection.outlook.com [157.56.111.76])
	by mail.openembedded.org (Postfix) with ESMTP id 9496D609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 06:02:52 +0000 (UTC)
Received: from BN1BFFO11FD045.protection.gbl (10.58.144.30) by
	BN1BFFO11HUB057.protection.gbl (10.58.144.204) with Microsoft SMTP
	Server (TLS) id 15.1.160.8; Mon, 18 May 2015 05:48:44 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD045.mail.protection.outlook.com (10.58.145.0) with Microsoft
	SMTP Server (TLS) id 15.1.172.14 via Frontend Transport;
	Mon, 18 May 2015 05:48:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YuDus-0003ry-KT; Sun, 17 May 2015 22:48:42 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YuDus-0004qP-Dy; Sun, 17 May 2015 22:48:42 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t4I5mH8Z017248; Sun, 17 May 2015 22:48:17 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YuDuq-0004pm-Dr; Sun, 17 May 2015 22:48:40 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 May 2015 22:48:22 -0700
Message-ID: <1431928102-18551-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.4.0.3.ge0ccc3b.dirty
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21550.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD045;
	1:cYjaCi4riT6iuY7ObvysC7bSlyXkJPA6zZrj9ap1P+eyExzvQVrMJg/e6Rg79taSE71dw0yE/cnNFghm5yix8v5puEUe319NENEXFb7WRkXQOZCU+28tAwfVTTXBHIEaXlQ6+buyqFmnPPR6LMB16pKEgUdzIIOyKjsfC5O//0/8sTZHZaEhcyMdcYtVgZ32jM3ApC2cUBps5a4YIC+q3ebcDg52dfaRSMvnvTstoOc5XuwHSI4DS+gg/JPdFyWO3+F3NVJBggXJYGP/CeHKApeA0u8zlQjyHDZzoYATZ88Y3CWXyKhgzpXv+D9ErSOL
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(55674003)(174864002)(199003)(479174004)(189002)(5423002)(377424004)(164054003)(54534003)(24433001)(15975445007)(5820100001)(63266004)(19580405001)(19580395003)(6806004)(92566002)(76506005)(57986006)(87936001)(50466002)(33646002)(36756003)(36386004)(5001960100002)(110136002)(5001830100001)(81156007)(5001860100001)(4001540100001)(4001150100001)(50226001)(189998001)(575784001)(86362001)(106466001)(77156002)(23676002)(46102003)(62966003)(47776003)(229853001)(77096005)(64706001)(50986999)(2351001)(107986001)(579004)(559001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB057;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFCRkZPMTFIVUIwNTc7MjpPVm5iNjc2cENzRFBxWnRLb2Q4bENMTk9Y?=
	=?utf-8?B?QjQ4aGl5L20yUXlvY25ham5rcWZtb29tWHhWN2lvd3l0Q083b1NXOzI6cUtx?=
	=?utf-8?B?Q0Y4Q09kZEx1KzYvT3pxOERYNW8xc1FPU095cTlOcndLaUxpL1p2UklDcDMr?=
	=?utf-8?B?aDlGYW5HWURlbVpqaUFkZjh5OU1qU3pZaGxZNUNSM2JYZ1p0OTJzcXVab0Vr?=
	=?utf-8?B?dEdacmkrUE5iVkZ3UERzMG5QVzF2OWNLUVVHM0E1L1VaMXAzOE5ISjFXelJ0?=
	=?utf-8?B?U3E0UE9haktxZThQWE9iK2liTjVOWWgrL2VvQm1YNXdLVnlNMlQwWkkwcEdt?=
	=?utf-8?B?bGh2NWJaRkN1SEZSUGZ5TDR4aURPWXVtSDBtY3RlZVdMSUhoeEhsa09VSGdn?=
	=?utf-8?B?OFY0VnhnZz07NjpjeUh4WWxoRkNvbGo1RWhGWXpjd3NubVR1bW4ydnRUV2ha?=
	=?utf-8?B?WmVMYTk4WVc2MHQzcTlQU1NsNGEzL2ZRZlFXeXpJRW1mMlRtUUJ4YmIxQUh3?=
	=?utf-8?B?Q0dXWnd6bU14SlREd0NTKy8wYXBwMEdhMzA0MWNBS0QxZWFOQ0l5MW5qY3Zy?=
	=?utf-8?B?blVvdXRWYkwyOWhmRDQ0bHRNWWxuNThRUHBHUkgyMTBmbk9CNWxTeGpQZm5L?=
	=?utf-8?B?WXhENFFRTml5Z2E0aXQ0WG02K0FrTTdLazNCVjM2Y0hzQS9IUkZKQ1J6cWJE?=
	=?utf-8?B?QjREZi9DTzVFSk9Wc1oxTXNHdE1LZk1meTdPYWk4bTFtOWZPSU16Q3NNdG1N?=
	=?utf-8?B?N3R4eHFsTytIZUpjLytJNzRnNHNvSENyN1FoaTN3REY3SGo4ZkxoREEwanJr?=
	=?utf-8?B?MlZnUVdod0I4cXRYQW9pelBuSU1sZU00NFdaTVZ0S09PVUVadStETWk5MjVF?=
	=?utf-8?B?d2I1YVBuUmZWcDhUUklZRmdPczhwdlY3eWhBMm9aT0NhU0Y0NVJpcS83UkZy?=
	=?utf-8?B?Sm5nU1h5U1p4TlVOckNReHJPRXVVYnQvTFNnK0pHdE16ekk1MGFZbU9uYXk3?=
	=?utf-8?B?RXRRM052QnJDcDg3SHNvdElYSmRjYTkxcFNldUUzK1J1YVlncE14MGlzT01a?=
	=?utf-8?B?NWNmOFJSRlB2NXVpekYyNzJJSnNpSzJ1N2huYjszOnlCT2VjMGl2NnNjcGgy?=
	=?utf-8?B?dTJoakpNbVh5cGV4d1Vac3ZDNjdpT0g1YWpoNUFMa2hKQURvSXl4VnEwSE1E?=
	=?utf-8?B?SVJoN1FZTUdrNzRsWUVDOEphaW5sZ3JTeGZ6U2E5VTNiUlpZNndDUTNwQXFa?=
	=?utf-8?B?QkZQcU1KQ0ZhMmNxOFJoV25uVStIVkZSSUZNZkRXMjdtMlg1ZFp6S0VPOVNO?=
	=?utf-8?B?DQoNCg0KDQpSd0ZMdjFucFVoSnhORTBMSnVzSUplM1dMMyt2OTd5cFZIMXda?=
	=?utf-8?B?N1VBVmJrNTJ5ZExremphRHg3NnovVlY2am5SSlpOUmgzTGh1THEyVVBzTjZZ?=
	=?utf-8?B?YVNKNmdxS3pBbmk4UFFDVURZT1g2Q0tpVm4wY2t2cEhuVjk0dnFBRGlHUWpP?=
	=?utf-8?B?RDlIMTNqT0tvQ1RFdmlMaXZjWnRGYXM9Ozk6VXpIVlZYdkw0anhIRjRsU2tp?=
	=?utf-8?B?VG8yOXJOYkZ5d1l3RnVaMnVnbTFoNjIvT0xXZjVVM1U3RDh5cG9nbVNPY3dp?=
	=?utf-8?B?WUpWZURnQjNPUHdQTjB3dTZJaGNqUm5FRjh2Zkt5TXB5QUxnTGhzUVJCMzJ6?=
	=?utf-8?B?NU52T2pkZGh3TkRhZmFvcnFwM0Q0dzhOKzdhVExvbEpNN2IzTWhKTDRjN2Er?=
	=?utf-8?B?eFMvQmRVRk9mcUNXL0JOME5JTVpRYzNVZDhVdTJrMmg2cTFRbksxM3RLQ0pj?=
	=?utf-8?B?cEgwUlp3YzFDbjN5TjBwODM2RnBPbk5lUWk4ZHN6bnFGYm9IdGhaeGFYakJP?=
	=?utf-8?B?bkF3cDE2TXFFS09vY2grWUhibGNNbzI0V1Z5aGhvb0tiNHVqRzVwQzJpTERa?=
	=?utf-8?B?Um8rTGpNZ2VkZE1yQW9uSVcvZVRLOU5ERUhDVWt3V3Jhb3R1dkFWMGwyY0hy?=
	=?utf-8?B?VEJiVW1FM2pJQWF4L1lrcnlIcXVnbHR3a21lR1lxYzM4M25RWjh3S01IU3FK?=
	=?utf-8?B?dDFtREdJUUlzSXRPY0p2NVRsR0hRWkJaUlRQekhwK0hkYVVKU3JLR3B1N2F0?=
	=?utf-8?B?QkVlRXJiMzNKOFlzVmVQcVRuM0tZcUdMa1RmeE9NdDlpYTJ2akdIeU5lalQ4?=
	=?utf-8?B?K3phM2RhZ2dHMFhKaTZTK2piZmxrZGhwdENHRkFKVDNyQU45WFpqc1hYTmJh?=
	=?utf-8?B?Tk9vZDlnb1p6U2hraFlENUdpaThjT3lBTUlqTVdsUXJBWHdwOU1IcEdneDFY?=
	=?utf-8?B?aEhHNWNRZjNjVVN6RDl4aDF5alMzVElXSVFNTnpXeGRETUsrYXMvYzRWZFdu?=
	=?utf-8?B?bnd2dklvZ2MxWkxMZkpvUzVJb2ZFL1J0ZHNYL2RkYThNUTB4UDZUTVB1SzJo?=
	=?utf-8?B?Yi85M1ZDZ05kK015VnBMemZpeHZCQ1BkVTVKY09sZWx6MkdOL09DU2hhM2NF?=
	=?utf-8?B?M0dVNHZCMmZWOHJSaG1RaEM4bUhaTzdMenVicDllazdtVUN2NkhzTzVaUEJR?=
	=?utf-8?B?NDhxclM2SjhXR2xlNUhZdlFGazB4NEF2a0h0MnQ5RUNKYXg1MUEwSGI3TEVV?=
	=?utf-8?B?cUp6WmNWRTViRzlWNjBXV0s2Z2x0Z2liQnA2bGRTNHdNY2sybW9jZnBIZDJM?=
	=?utf-8?B?bmcNCjRLDQpJNQ0KRWFkVUY4T0FQcVBGbEhWeURGS2ZaTVhqVFBvM1ZVSzg3?=
	=?utf-8?B?VlhWMlo5Nksvc1oxWE1IUVY3bGlNMmRDTUdJOUw2RkVFTXdDZ2hlQ0gyc20y?=
	=?utf-8?B?WUZnYXJyTmZHN1U0Ris1cGh2TGQ4MVFCU3dVeDlReVdXT2h3MFUzeDNYdm9h?=
	=?utf-8?B?RVQ4NCtwRDQ4SXdHeVVNeVR6SjRKZEt3K2FzcU00dGIzY2hnU1Fna25QNW5z?=
	=?utf-8?B?U3hIY2FkcURpdG1rYXZhRXF0TU1QRWRUVHd6ckd0OXdUeTFDRnZCRlpzMHI5?=
	=?utf-8?B?SC90bTJ3Wndsd3Z6RDBlOHlWQkZmMXFFOThZSjVoSkhQS2xrMCtXTVF4cHhD?=
	=?utf-8?B?RnJEcW5salgvTlZmTzBOWFRoY1VRbmZrRWZmK3FOZG8yV3JOa2ZMMkhPaVBQ?=
	=?utf-8?B?ZGlDMElxOXlhRDNudXZYTVBHSlFnSW5XUXhSd0lLQk9jUmpaN2NHODU5LzJ1?=
	=?utf-8?B?WVNPVlpTY3RKbmlCSFMzbzlLQzZ1dWVzUHFaM1FHeXVOWXRFcWxkOXZkSkM4?=
	=?utf-8?B?RFRGL3Vqcy9IYXgwMWVoNUYyMnF3ZjdnTG9PUzUxSDAxS0o5WEFPWFdLQnRh?=
	=?utf-8?B?ZVo5UEl4ZzloKzVUbzcySU9qU3ljYWxaQ3Z4RzZ6U3ZPNHo4TnI0QXAyRWJs?=
	=?utf-8?B?Q1FBRmlqS3cvRkdsYWhpS3l0UDVaa1NpSFRhOzM6U1lUYkQvL3dLM0U3YTRE?=
	=?utf-8?B?YUJOa2dqUE9VRDYwT2VCTGpuN1ZVaXNncHB4WFkyb0dzUHhLZHhTUzJGcWVj?=
	=?utf-8?B?bnJWZDVVZFhrcXo3Z1l0Tjc1bE9WMEpnN1E3NThKU0pJd09rR1owNU1CRWtO?=
	=?utf-8?B?MGNEd1cweXowUlpYZVpMQnJDRVVmeC8yem9CYm5KWXZNNEFydThnbWlFeGdn?=
	=?utf-8?B?PT07MTA6ZkUzMThNdE10MWNmRUtVenQzUmNiS3RjTDZ1d092QUhieGZDZkxp?=
	=?utf-8?B?VzRDWDZVRTM4TjZHb2dLYVl4YlpGK0cxaG1rcnJ2cDFsQ1VNZDNLdlB2enM4?=
	=?utf-8?Q?Jx2aw4i1Ky5Bcbsjz/rcE68=3D?=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB057;
X-Microsoft-Antispam-PRVS: <BN1BFFO11HUB0579C133220E1B1190A9FEC8CC40@BN1BFFO11HUB057.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN1BFFO11HUB057; BCL:0;
	PCL:0; RULEID:; SRVR:BN1BFFO11HUB057; 
X-Forefront-PRVS: 058043A388
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2015 05:48:44.2211 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB057
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soeren.brinkmann@gmail.com>
Subject: [PATCH RFC] dosfstools: Bump to version 3.0.28
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
X-List-Received-Date: Mon, 18 May 2015 06:02:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Sören Brinkmann <soeren.brinkmann@gmail.com>

Migrate to a new upstream at https://github.com/dosfstools/dosfstools
and use the latest release available as of today.

Signed-off-by: Sören Brinkmann <soeren.brinkmann@gmail.com>
---
Hi,

I was looking for the application 'fatlabel' and found that dosfstools provide
that app, but not in the version currently provided in OE.
I spent some time and this patch is the result.
The big changes are:
 - update to dosfstools 3.0.28
   - new upstream
   - licensed under GPLv3
 - removal of all patches

I suspected the big version jump probably obsoleted the patches carried in OE.
Hence, I just removed them.
I'm not sure whether the license change is the reason for OE only providing the
old version. In that case, I guess, just disregard this patch.

Initially, I ran into some issues in the QA step regarding files that have been
installed but not shipped. After a quick google search, I added the FILES_${PN}
and FILES_${PN}-doc lines. But I don't really know whether that is the
appropriate solution.

	Thanks,
	Sören

 .../dosfstools/dosfstools/alignment_hack.patch     |  38 --
 .../dosfstools/dosfstools-msdos_fs-types.patch     |  37 --
 .../dosfstools/fix_populated_dosfs_creation.patch  | 489 ----------------
 .../dosfstools/include-linux-types.patch           |  22 -
 .../dosfstools/dosfstools/mkdosfs-bootcode.patch   | 241 --------
 .../dosfstools/dosfstools/mkdosfs-dir.patch        | 639 ---------------------
 .../dosfstools/msdos_fat12_undefined.patch         |  19 -
 .../dosfstools/dosfstools/nofat32_autoselect.patch |  27 -
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |  35 --
 .../dosfstools/dosfstools_3.0.28.bb                |  23 +
 10 files changed, 23 insertions(+), 1547 deletions(-)
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch b/meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch
deleted file mode 100644
index b46b2db0a3e1..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/alignment_hack.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-The problem is that unsigned char[2] is
-guranteed to be 8Bit aligned on arm
-but unsigned short is/needs to be 16bit aligned
-the union { unsigned short; unsigned char[2] } trick 
-didn't work so no we use the alpha hack.
-
-memcpy into an 16bit aligned
-
-    -zecke
-
-Upstream-Status: Inappropriate [licensing]
-We're tracking an old release of dosfstools due to licensing issues.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- dosfstools/dosfsck/boot.c.orig	2003-05-15 19:32:23.000000000 +0200
-+++ dosfstools/dosfsck/boot.c	2003-06-13 17:44:25.000000000 +0200
-@@ -36,17 +36,15 @@
-     { 0xff, "5.25\" 320k floppy 2s/40tr/8sec" },
- };
- 
--#if defined __alpha || defined __ia64__ || defined __s390x__ || defined __x86_64__ || defined __ppc64__
-+
- /* Unaligned fields must first be copied byte-wise */
- #define GET_UNALIGNED_W(f)			\
-     ({						\
- 	unsigned short __v;			\
- 	memcpy( &__v, &f, sizeof(__v) );	\
--	CF_LE_W( *(unsigned short *)&f );	\
-+	CF_LE_W( *(unsigned short *)&__v );	\
-     })
--#else
--#define GET_UNALIGNED_W(f) CF_LE_W( *(unsigned short *)&f )
--#endif
-+
- 
- 
- static char *get_media_descr( unsigned char media )
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch
deleted file mode 100644
index 35abd1a2b155..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-msdos_fs-types.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Ensure the __s8 type is properly defined.
-
-Upstream-Status: Inappropriate [licensing]
-We're tracking an old release of dosfstools due to licensing issues.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- dosfstools-2.10/dosfsck/dosfsck.h.org	2006-02-21 08:36:14.000000000 -0700
-+++ dosfstools-2.10/dosfsck/dosfsck.h	2006-02-21 08:40:12.000000000 -0700
-@@ -22,6 +22,14 @@
-        #undef __KERNEL__
- #endif
- 
-+#ifndef __s8
-+#include <asm/types.h>
-+#endif
-+
-+#ifndef __ASM_STUB_BYTEORDER_H__
-+#include <asm/byteorder.h>
-+#endif
-+
- #include <linux/msdos_fs.h>
- 
- /* 2.1 kernels use le16_to_cpu() type functions for CF_LE_W & Co., but don't
---- dosfstools-2.10/dosfsck/file.c.org	2006-02-21 08:37:36.000000000 -0700
-+++ dosfstools-2.10/dosfsck/file.c	2006-02-21 08:37:47.000000000 -0700
-@@ -23,6 +23,10 @@
-        #undef __KERNEL__
- #endif
- 
-+#ifndef __s8
-+#include <asm/types.h>
-+#endif
-+
- #include <linux/msdos_fs.h>
- 
- #include "common.h"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch b/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
deleted file mode 100644
index 9d7f7321acad..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
+++ /dev/null
@@ -1,489 +0,0 @@
-Upstream-Status: Inappropriate
-
-This patch fixes populated dosfs image creation with directory 
-structures. Earlier it was causing segfault; and only image 
-population with no subdirectories was working.
-
-Issues fixed:
-1. (dir->count == dir->entries) check was only needed for root 
-   directory entries. And this check is wrong for non-root 
-   directories.
-2. For each dir entry 2 dir->table entries were needed, one for 
-   the file/dir and 2nd for long file name support. Earlier long
-   name support was added for filenames but the 2nd entry 
-   allocation, initialization & counting was missed.
-3. The memory clearing was missed at the code path after dir->table 
-   memroy allocation.
-4. Add entries for . & .. directories in all non-root directories.
-5. The . directory points to the correct entry in fat now.
-6. All directoriy entries' size was not zero as required for dosfsck,
-   Now all directory entries' size is zero.
-
-Enhancements:
-1. Added support for long names for directory names. This is same
-   as the existing long name support for filenames.
-2. Added error messages for previously silent memory allocation and 
-   other errors.
-3. -d options does not work correctly with fat32, so now throwing 
-   an error for that.
-4. Use predefined structures from kernel's msdos_fs.h file, rather 
-   than defining again here. And accordingly change the names & use
-   of structure variables.
-
-Outstanding Issues:
-1. The .. directory entry do not point to the parent of current
-   directory. This issue can be fixed by running dosfsck -a after
-   image creation.
-2. For files the filesize is correct, but the clusters size is more 
-   than it needs to be, this also can be fixed by running dosfsck -a
-   after image creation.
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 
-2011/12/13
-
-
-Index: dosfstools-2.11/mkdosfs/mkdosfs.c
-===================================================================
---- dosfstools-2.11.orig/mkdosfs/mkdosfs.c
-+++ dosfstools-2.11/mkdosfs/mkdosfs.c
-@@ -21,7 +21,17 @@
-    June 2004 - Jordan Crouse (info.linux@amd.com)
-    Added -d <directory> support to populate the image
-    Copyright (C) 2004, Advanced Micro Devices, All Rights Reserved
--   
-+
-+   2011-12-13: Nitin A Kamble <nitin.a.kamble@intel.com>
-+   Enhanced the -d <directory> support for population of image while
-+   creation. Earlier subdirectores support was broken, only files in
-+   the rootdir were supported. Now directory hirarchy is supported.
-+   Also added long filename support to directory names.
-+     The -d <directory> option (image population while creation)
-+   is broken with fat32.
-+   Copyright (C) 2011, Intel Corporation, All Rights Reserved
-+
-+
-    Fixes/additions May 1998 by Roman Hodek
-    <Roman.Hodek@informatik.uni-erlangen.de>:
-    - Atari format support
-@@ -86,23 +96,23 @@
- # undef __KERNEL__
- #endif
- 
--#if __BYTE_ORDER == __BIG_ENDIAN
--
-+#ifndef __ASM_STUB_BYTEORDER_H__
- #include <asm/byteorder.h>
--#ifdef __le16_to_cpu
--/* ++roman: 2.1 kernel headers define these function, they're probably more
-- * efficient then coding the swaps machine-independently. */
--#define CF_LE_W	__le16_to_cpu
--#define CF_LE_L	__le32_to_cpu
--#define CT_LE_W	__cpu_to_le16
--#define CT_LE_L	__cpu_to_le32
--#else
--#define CF_LE_W(v) ((((v) & 0xff) << 8) | (((v) >> 8) & 0xff))
--#define CF_LE_L(v) (((unsigned)(v)>>24) | (((unsigned)(v)>>8)&0xff00) | \
--               (((unsigned)(v)<<8)&0xff0000) | ((unsigned)(v)<<24))
-+#endif
-+
-+#include <linux/msdos_fs.h>
-+
-+#undef CF_LE_W
-+#undef CF_LE_L
-+#undef CT_LE_W
-+#undef CT_LE_L
-+
-+#if __BYTE_ORDER == __BIG_ENDIAN
-+#include <byteswap.h>
-+#define CF_LE_W(v) bswap_16(v)
-+#define CF_LE_L(v) bswap_32(v)
- #define CT_LE_W(v) CF_LE_W(v)
- #define CT_LE_L(v) CF_LE_L(v)
--#endif /* defined(__le16_to_cpu) */
-     
- #else
- 
-@@ -253,33 +263,6 @@ struct fat32_fsinfo {
-   __u32		reserved2[4];
- };
- 
--/* This stores up to 13 chars of the name */
--
--struct msdos_dir_slot {
--        __u8    id;             /* sequence number for slot */
--        __u8    name0_4[10];    /* first 5 characters in name */
--        __u8    attr;           /* attribute byte */
--        __u8    reserved;       /* always 0 */
--        __u8    alias_checksum; /* checksum for 8.3 alias */
--        __u8    name5_10[12];   /* 6 more characters in name */
--        __u16   start;          /* starting cluster number, 0 in long slots */
--        __u8    name11_12[4];   /* last 2 characters in name */
--};
--
--struct msdos_dir_entry
--  {
--    char	name[8], ext[3];	/* name and extension */
--    __u8        attr;			/* attribute bits */
--    __u8	lcase;			/* Case for base and extension */
--    __u8	ctime_ms;		/* Creation time, milliseconds */
--    __u16	ctime;			/* Creation time */
--    __u16	cdate;			/* Creation date */
--    __u16	adate;			/* Last access date */
--    __u16	starthi;		/* high 16 bits of first cl. (FAT32) */
--    __u16	time, date, start;	/* time, date and first cluster */
--    __u32	size;			/* file size (in bytes) */
--  } __attribute__ ((packed));
--
- /* The "boot code" we put into the filesystem... it writes a message and
-    tells the user to try again */
- 
-@@ -356,7 +339,6 @@ static struct msdos_dir_entry *root_dir;
- static int size_root_dir;	/* Size of the root directory in bytes */
- static int sectors_per_cluster = 0;	/* Number of sectors per disk cluster */
- static int root_dir_entries = 0;	/* Number of root directory entries */
--static int root_dir_num_entries = 0;
- static int last_cluster_written = 0;
- 
- static char *blank_sector;		/* Blank sector - all zeros */
-@@ -1315,7 +1297,7 @@ setup_tables (void)
-       de->date = CT_LE_W((unsigned short)(ctime->tm_mday +
- 					  ((ctime->tm_mon+1) << 5) +
- 					  ((ctime->tm_year-80) << 9)));
--      de->ctime_ms = 0;
-+      de->ctime_cs = 0;
-       de->ctime = de->time;
-       de->cdate = de->date;
-       de->adate = de->date;
-@@ -1451,16 +1433,23 @@ write_tables (void)
- 
- /* Add a file to the specified directory entry, and also write it into the image */
- 
--static void copy_filename(char *filename, char *base, char *ext) {
-+static void copy_filename(char *filename, char *dos_name) {
-   
-   char *ch = filename;
-   int i, len;
- 
--  memset(base, 0x20, 8);
--  memset(ext, 0x20, 3);
-+  if (!strcmp(filename, ".")) {
-+    strncpy(dos_name, MSDOS_DOT, MSDOS_NAME);
-+    return;
-+  }
-+  if (!strcmp(filename, "..")) {
-+    strncpy(dos_name, MSDOS_DOTDOT, MSDOS_NAME);
-+    return;
-+  }
-+  memset(dos_name, 0x20, MSDOS_NAME);
-   
-   for(len = 0 ; *ch && *ch != '.'; ch++) {
--    base[len++] = toupper(*ch);
-+    dos_name[len++] = toupper(*ch);
-     if (len == 8) break;
-   }
-   
-@@ -1468,7 +1457,7 @@ static void copy_filename(char *filename
-   if (*ch) ch++;
-   
-   for(len = 0 ; *ch; ch++) {
--    ext[len++] = toupper(*ch);
-+    dos_name[8 + len++] = toupper(*ch);
-     if (len == 3) break;
-   }
- }
-@@ -1551,7 +1540,7 @@ static int add_file(char *filename, stru
-   int start;
-   int usedsec, totalsec;
- 
--  char name83[8], ext83[3];
-+  char dos_name[MSDOS_NAME+1];
- 
-   struct msdos_dir_slot *slot;
-   int i;
-@@ -1562,23 +1551,22 @@ static int add_file(char *filename, stru
-   if (dir->root) {
-     if (dir->count == dir->entries) {
-       printf("Error - too many directory entries\n");
-+      return;
-     }
-   }
-   else {
--    if (dir->count == dir->entries) {
--      if (!dir->table) 
--	dir->table = 
--	  (struct msdos_dir_entry *) malloc(sizeof(struct msdos_dir_entry));
--      else {
--	dir->table = 
--	  (struct msdos_dir_entry *) realloc(dir->table, (dir->entries + 1) * 
--					     sizeof(struct msdos_dir_entry));
--
--	memset(&dir->table[dir->entries], 0, sizeof(struct msdos_dir_entry));
--      }
--
--      dir->entries++;
--    }
-+    /* 2 entries, one extra for long filename */
-+    if (!dir->table)
-+      dir->table =
-+        (struct msdos_dir_entry *) malloc(2 * sizeof(struct msdos_dir_entry));
-+    else
-+      dir->table =
-+        (struct msdos_dir_entry *) realloc(dir->table, 2 * (dir->entries + 1) *
-+      				     sizeof(struct msdos_dir_entry));
-+    if (!dir->table)
-+      printf("Error - realloc failed\n");
-+    memset(&dir->table[dir->entries], 0, 2 * sizeof(struct msdos_dir_entry));
-+    dir->entries += 2;
-   }
- 
-   infile = open(filename, O_RDONLY, 0);
-@@ -1611,13 +1599,13 @@ static int add_file(char *filename, stru
-     return -1;
-   }
- 
--  printf("ADD %s\n", filename);
-+  printf("ADD FILE %s\n", filename);
- 
-   /* Grab the basename of the file */
-   base = basename(filename);
-   
--  /* Extract out the 8.3 name */
--  copy_filename(base, name83, ext83);
-+  /* convert for dos fat structure  */
-+  copy_filename(base, dos_name);
- 
-   /* Make an extended name slot */
- 
-@@ -1629,12 +1617,9 @@ static int add_file(char *filename, stru
-   
-   slot->alias_checksum = 0;
-   
--  for(i = 0; i < 8; i++) 
--    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + name83[i];
-+  for(i = 0; i < MSDOS_NAME; i++)
-+    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + dos_name[i];
-   
--  for(i = 0; i < 3; i++) 
--    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + ext83[i];
--
-   p = base;
- 
-   copy_name(slot->name0_4, 10, &p);
-@@ -1645,8 +1630,7 @@ static int add_file(char *filename, stru
-   /* Get the entry from the root filesytem */
-   entry = &dir->table[dir->count++];
- 
--  strncpy(entry->name, name83, 8);
--  strncpy(entry->ext, ext83, 3);
-+  strncpy(entry->name, dos_name, MSDOS_NAME);
- 
- 
-   /* If the user has it read only, then add read only to the incoming
-@@ -1665,7 +1649,7 @@ static int add_file(char *filename, stru
- 				      ((ctime->tm_mon+1) << 5) +
- 				      ((ctime->tm_year-80) << 9)));
- 
--  entry->ctime_ms = 0;
-+  entry->ctime_cs = 0;
-   entry->ctime = entry->time;
-   entry->cdate = entry->date;
-   entry->adate = entry->date;
-@@ -1711,6 +1695,7 @@ static int add_file(char *filename, stru
- 
-  exit_add:
-   if (infile) close(infile);
-+  return 0;
- }
- 
- /* Add a new directory to the specified directory entry, and in turn populate 
-@@ -1727,10 +1712,18 @@ static void add_directory(char *filename
-   struct dirent *dentry = 0;
-   int remain;
-   char *data;
-+  char *base;
-+  char dos_name[MSDOS_NAME+1];
-+  struct msdos_dir_slot *slot;
-+  int i;
-+  char *p;
- 
-   /* If the directory doesn't exist */
--  if (!rddir) return;
--  
-+  if (!rddir) {
-+    printf("Error - dir does not exist: %s\n", filename);
-+    return;
-+  }
-+
-   if (dir->root) {
-     if (dir->count == dir->entries) {
-       printf("Error - too many directory entries\n");
-@@ -1738,28 +1731,58 @@ static void add_directory(char *filename
-     }
-   }
-   else {
--    if (dir->count == dir->entries) {
--      if (!dir->table) 
--	dir->table = (struct msdos_dir_entry *) malloc(sizeof(struct msdos_dir_entry));
--      else {
--	dir->table = (struct msdos_dir_entry *) realloc(dir->table, (dir->entries + 1) * 
--							sizeof(struct msdos_dir_entry));
--
--	/* Zero it out to avoid issues */
--	memset(&dir->table[dir->entries], 0, sizeof(struct msdos_dir_entry));
--      }
--	dir->entries++;
-+    /* 2 entries, one extra for long name of the directory */
-+    if (!dir->table)
-+      dir->table = (struct msdos_dir_entry *) malloc(2 * sizeof(struct msdos_dir_entry));
-+    else
-+      dir->table = (struct msdos_dir_entry *) realloc(dir->table, 2 * (dir->entries + 1) *
-+                                                             sizeof(struct msdos_dir_entry));
-+    if (!dir->table) {
-+      printf("Error - memory allocation failed\n");
-+      goto exit_add_dir;
-     }
-+    /* Zero it out to avoid issues */
-+    memset(&dir->table[dir->entries], 0, 2 * sizeof(struct msdos_dir_entry));
-+    dir->entries += 2;
-   }
- 
-+  printf("ADD DIR %s\n", filename);
-   /* Now, create a new directory entry for the new directory */
-   newdir = (struct dir_entry *) calloc(1, sizeof(struct dir_entry));
--  if (!newdir) goto exit_add_dir;
-+  if (!newdir) {
-+    printf("Error - calloc failed\n");
-+    goto exit_add_dir;
-+  }
-+
-+  /* Grab the basename of the file */
-+  base = basename(filename);
-+
-+  /* convert for dos structure  */
-+  copy_filename(base, dos_name);
-+
-+  /* Make an extended name slot */
-+  slot = (struct msdos_dir_slot *) &dir->table[dir->count++];
-+  slot->id = 'A';
-+  slot->attr = 0x0F;
-+  slot->reserved = 0;
-+  slot->start = 0;
-+
-+  slot->alias_checksum = 0;
- 
-+  for (i = 0; i < MSDOS_NAME; i++)
-+    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + dos_name[i];
-+
-+  p = base;
-+
-+  copy_name(slot->name0_4, 10, &p);
-+  copy_name(slot->name5_10, 12, &p);
-+  copy_name(slot->name11_12, 4, &p);
-+
-+  /* Get the entry from the root filesytem */
-   entry = &dir->table[dir->count++];
- 
--  strncpy(entry->name, basename(filename), sizeof(entry->name));
--  
-+  strncpy(entry->name, dos_name, MSDOS_NAME);
-+
-   entry->attr = ATTR_DIR;
-   ctime = localtime(&create_time);
- 
-@@ -1770,25 +1793,32 @@ static void add_directory(char *filename
- 				      ((ctime->tm_mon+1) << 5) +
- 				      ((ctime->tm_year-80) << 9)));
- 
--  entry->ctime_ms = 0;
-+  entry->ctime_cs = 0;
-   entry->ctime = entry->time;
-   entry->cdate = entry->date;
-   entry->adate = entry->date;
- 
-   /* Now, read the directory */
- 
--  while((dentry = readdir(rddir))) {
-+
-+  while((base[0] != '.') && (dentry = readdir(rddir))) {
-     struct stat st;
-     char *buffer;
--    
--    if (!strcmp(dentry->d_name, ".") || !strcmp(dentry->d_name, ".."))
--      continue;
- 
--    /* DOS wouldn't like a typical unix . (dot) file, so we skip those too */
--    if (dentry->d_name[0] == '.') continue;
-+    if (dentry->d_name[0] == '.') {
-+        /* dos also has . & .. directory entries */
-+      if (! ((!strcmp(dentry->d_name, ".")) || (!strcmp(dentry->d_name, "..")))) {
-+        /* ignore other .* files */
-+        printf("Error - File/Dir name is not dos compatible, ignored: %s\n", dentry->d_name);
-+        continue;
-+      }
-+    }
- 
-     buffer = malloc(strlen(filename) + strlen(dentry->d_name) + 3);
--    if (!buffer) continue;
-+    if (!buffer) {
-+        printf("Error - malloc failed\n");
-+        goto exit_add_dir;
-+    }
-     
-     sprintf(buffer, "%s/%s", filename, dentry->d_name);
-     if (!stat(buffer, &st)) {
-@@ -1806,11 +1836,23 @@ static void add_directory(char *filename
-   /* Now that the entire directory has been written, go ahead and write the directory
-      entry as well */
- 
-+  entry->size = 0; /* a directory has zero size */
-+
-+  if (base[0] == '.')  { /* . & .. point to parent's cluster */
-+    goto exit_add_dir;
-+  }
-+
-   entry->start = CT_LE_W(last_cluster_written);
-   entry->starthi = CT_LE_W((last_cluster_written & 0xFFFF0000) >> 16); 
--  entry->size = newdir->count * sizeof(struct msdos_dir_entry);
-+
-+/* . dir start points to parent */
-+  newdir->table[1].start = entry->start;
-+/* .. dir points to parent of parent*/
-+/* .. dir start is not set yet, would need more changes to the code,
-+ * but dosfsck can fix these .. entry start pointers correctly */
-+
-+  remain = newdir->count * sizeof(struct msdos_dir_entry);
-   
--  remain = entry->size;
-   data = (char *) newdir->table;
- 
-   while(remain) {
-@@ -1858,6 +1900,7 @@ static void add_root_directory(char *dir
- 
-   if (!newdir) {
-     closedir(dir);
-+    printf("Error - calloc failed!\n");
-     return;
-   }
- 
-@@ -1877,7 +1920,10 @@ static void add_root_directory(char *dir
-     if (entry->d_name[0] == '.') continue;
-  
-     buffer = malloc(strlen(dirname) + strlen(entry->d_name) + 3);
--    if (!buffer) continue;
-+    if (!buffer) {
-+        printf("Error - malloc failed!\n");
-+        continue;
-+    }
- 
-     sprintf(buffer, "%s/%s", dirname, entry->d_name);
-     if (!stat(buffer, &st)) {
-@@ -2245,6 +2291,9 @@ main (int argc, char **argv)
-   if (check && listfile)	/* Auto and specified bad block handling are mutually */
-     die ("-c and -l are incompatible");		/* exclusive of each other! */
- 
-+  if (dirname && (size_fat == 32))
-+    die ("-d is incompatible with FAT32");
-+
-   if (!create) {
-     check_mount (device_name);	/* Is the device already mounted? */
-     dev = open (device_name, O_RDWR);	/* Is it a suitable device to build the FS on? */
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch b/meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch
deleted file mode 100644
index ab5c8cf8c381..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/include-linux-types.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-mkdsofs is using types of the style __u8, which it gets with some
-versions of libc headers via linux/hdreg.h including asm/types.h.
-Newer version of fedora (at least) have a hdreg.h whichdoes not
-include asm/types.h. To work around this patch mkdosfs.c to explicity
-include linux/types.h which will in turn pull in asm/types.h which
-defines these variables.
-
-Upstream-Status: Inappropriate [licensing]
-We're tracking an old release of dosfstools due to licensing issues.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- dosfstools-2.10/mkdosfs/mkdosfs.c~	2006-07-12 18:46:21.000000000 +1000
-+++ dosfstools-2.10/mkdosfs/mkdosfs.c	2006-07-12 18:46:21.000000000 +1000
-@@ -60,6 +60,7 @@
- #include "../version.h"
- 
- #include <fcntl.h>
-+#include <linux/types.h>
- #include <linux/hdreg.h>
- #include <linux/fs.h>
- #include <linux/fd.h>
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
deleted file mode 100644
index ae21bee78e74..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
+++ /dev/null
@@ -1,241 +0,0 @@
-Add option to read in bootcode from a file.
-
-Upstream-Status: Inappropriate [licensing]
-We're tracking an old release of dosfstools due to licensing issues.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: dosfstools-2.11/mkdosfs/ChangeLog
-===================================================================
---- dosfstools-2.11.orig/mkdosfs/ChangeLog	1997-06-18 10:09:38.000000000 +0000
-+++ dosfstools-2.11/mkdosfs/ChangeLog	2011-12-06 12:14:23.634011558 +0000
-@@ -1,3 +1,14 @@
-+19th June 2003			Sam Bingner (sam@bingner.com)
-+
-+	Added option to read in bootcode from a file so that if you have
-+	for example Windows 2000 boot code, you can have it write that
-+	as the bootcode.  This is a dump of the behinning of a partition
-+	generally 512 bytes, but can be up to reserved sectors*512 bytes.
-+        Also writes 0x80 as the	BIOS drive number if we are formatting a
-+	hard drive, and sets the number of hidden sectors to be the
-+	number of sectors in one track. These were required so that DOS
-+	could boot using the bootcode.
-+
- 28th January 1995		H. Peter Anvin (hpa@yggdrasil.com)
- 
- 	Better algorithm to select cluster sizes on large filesystems.
-Index: dosfstools-2.11/mkdosfs/mkdosfs.8
-===================================================================
---- dosfstools-2.11.orig/mkdosfs/mkdosfs.8	2004-02-25 19:36:07.000000000 +0000
-+++ dosfstools-2.11/mkdosfs/mkdosfs.8	2011-12-06 12:19:54.777888434 +0000
-@@ -44,6 +44,10 @@
- .I message-file
- ]
- [
-+.B \-B
-+.I bootcode-file
-+]
-+[
- .B \-n
- .I volume-name
- ]
-@@ -165,6 +169,18 @@
- carriage return-line feed combinations, and tabs have been expanded.
- If the filename is a hyphen (-), the text is taken from standard input. 
- .TP
-+.BI \-B " bootcode-file"
-+Uses boot machine code from file "file".  On any thing other than FAT32,
-+this only writes the first 3 bytes, and 480 bytes from offset 3Eh.  On
-+FAT32, this writes the first 3 bytes, 420 bytes from offset 5Ah to both
-+primary and backup boot sectors.  Also writes all other reserved sectors
-+excluding the sectors following boot sectors (usually sector 2 and 7).
-+Does not require that the input file be as large as reserved_sectors*512.
-+To make a FAT32 partition bootable, you will need at least the first
-+13 sectors (6656 bytes).  You can also specify a partition as the argument
-+to clone the boot code from that partition.
-+i.e mkdosfs -B /dev/sda1 /dev/sda1
-+.TP
- .BI \-n " volume-name"
- Sets the volume name (label) of the filesystem.  The volume name can
- be up to 11 characters long.  The default is no label.
-@@ -198,8 +214,9 @@
- simply will not support it ;)
- .SH AUTHOR
- Dave Hudson - <dave@humbug.demon.co.uk>; modified by Peter Anvin
--<hpa@yggdrasil.com>. Fixes and additions by Roman Hodek
--<roman@hodek.net> for Debian/GNU Linux.
-+<hpa@yggdrasil.com> and Sam Bingner <sam@bingner.com>. Fixes and
-+additions by Roman Hodek <Roman.Hodek@informatik.uni-erlangen.de>
-+for Debian/GNU Linux.
- .SH ACKNOWLEDGEMENTS
- .B mkdosfs
- is based on code from
-Index: dosfstools-2.11/mkdosfs/mkdosfs.c
-===================================================================
---- dosfstools-2.11.orig/mkdosfs/mkdosfs.c	2005-03-12 16:12:16.000000000 +0000
-+++ dosfstools-2.11/mkdosfs/mkdosfs.c	2011-12-06 12:27:55.121886076 +0000
-@@ -24,6 +24,12 @@
-    - New options -A, -S, -C
-    - Support for filesystems > 2GB
-    - FAT32 support
-+
-+   Fixes/additions June 2003 by Sam Bingner
-+   <sam@bingner.com>:
-+   - Add -B option to read in bootcode from a file
-+   - Write BIOS drive number so that FS can properly boot
-+   - Set number of hidden sectors before boot code to be one track
-    
-    Copying:     Copyright 1993, 1994 David Hudson (dave@humbug.demon.co.uk)
- 
-@@ -153,6 +159,8 @@
- #define FAT_BAD      0x0ffffff7
- 
- #define MSDOS_EXT_SIGN 0x29	/* extended boot sector signature */
-+#define HD_DRIVE_NUMBER 0x80	/* Boot off first hard drive */
-+#define FD_DRIVE_NUMBER 0x00	/* Boot off first floppy drive */
- #define MSDOS_FAT12_SIGN "FAT12   "	/* FAT12 filesystem signature */
- #define MSDOS_FAT16_SIGN "FAT16   "	/* FAT16 filesystem signature */
- #define MSDOS_FAT32_SIGN "FAT32   "	/* FAT32 filesystem signature */
-@@ -175,6 +183,8 @@
- #define BOOTCODE_SIZE		448
- #define BOOTCODE_FAT32_SIZE	420
- 
-+#define MAX_RESERVED		0xFFFF
-+
- /* __attribute__ ((packed)) is used on all structures to make gcc ignore any
-  * alignments */
- 
-@@ -202,7 +212,7 @@
-   __u16         fat_length;	/* sectors/FAT */
-   __u16         secs_track;	/* sectors per track */
-   __u16         heads;		/* number of heads */
--  __u32         hidden;		/* hidden sectors (unused) */
-+  __u32         hidden;		/* hidden sectors (one track) */
-   __u32         total_sect;	/* number of sectors (if sectors == 0) */
-   union {
-     struct {
-@@ -285,6 +295,8 @@
- 
- /* Global variables - the root of all evil :-) - see these and weep! */
- 
-+static char *template_boot_code;	/* Variable to store a full template boot sector in */
-+static int use_template = 0;
- static char *program_name = "mkdosfs";	/* Name of the program */
- static char *device_name = NULL;	/* Name of the device on which to create the filesystem */
- static int atari_format = 0;	/* Use Atari variation of MS-DOS FS format */
-@@ -837,6 +849,12 @@
-     vi->volume_id[2] = (unsigned char) ((volume_id & 0x00ff0000) >> 16);
-     vi->volume_id[3] = (unsigned char) (volume_id >> 24);
-   }
-+  if (bs.media == 0xf8) {
-+      vi->drive_number = HD_DRIVE_NUMBER;  /* Set bios drive number to 80h */
-+  }
-+  else {
-+      vi->drive_number = FD_DRIVE_NUMBER;  /* Set bios drive number to 00h */
-+  }
- 
-   if (!atari_format) {
-     memcpy(vi->volume_label, volume_name, 11);
-@@ -1362,6 +1380,32 @@
-    * dir area on FAT12/16, and the first cluster on FAT32. */
-   writebuf( (char *) root_dir, size_root_dir, "root directory" );
- 
-+  if (use_template == 1) {
-+    /* dupe template into reserved sectors */
-+    seekto( 0, "Start of partition" );
-+    if (size_fat == 32) {
-+      writebuf( template_boot_code, 3, "backup jmpBoot" );
-+      seekto( 0x5a, "sector 1 boot area" );
-+      writebuf( template_boot_code+0x5a, 420, "sector 1 boot area" );
-+      seekto( 512*2, "third sector" );
-+      if (backup_boot != 0) {
-+        writebuf( template_boot_code+512*2, backup_boot*sector_size - 512*2, "data to backup boot" );
-+        seekto( backup_boot*sector_size, "backup boot sector" );
-+        writebuf( template_boot_code, 3, "backup jmpBoot" );
-+        seekto( backup_boot*sector_size+0x5a, "backup boot sector boot area" );
-+        writebuf( template_boot_code+0x5a, 420, "backup boot sector boot area" );
-+        seekto( (backup_boot+2)*sector_size, "sector following backup code" );
-+        writebuf( template_boot_code+(backup_boot+2)*sector_size, (reserved_sectors-backup_boot-2)*512, "remaining data" );
-+      } else {
-+        writebuf( template_boot_code+512*2, (reserved_sectors-2)*512, "remaining data" );
-+      }
-+    } else {
-+      writebuf( template_boot_code, 3, "jmpBoot" );
-+      seekto( 0x3e, "sector 1 boot area" );
-+      writebuf( template_boot_code+0x3e, 448, "boot code" );
-+    }
-+  }
-+
-   if (blank_sector) free( blank_sector );
-   if (info_sector) free( info_sector );
-   free (root_dir);   /* Free up the root directory space from setup_tables */
-@@ -1376,7 +1420,7 @@
- {
-   fatal_error("\
- Usage: mkdosfs [-A] [-c] [-C] [-v] [-I] [-l bad-block-file] [-b backup-boot-sector]\n\
--       [-m boot-msg-file] [-n volume-name] [-i volume-id]\n\
-+       [-m boot-msg-file] [-n volume-name] [-i volume-id] [-B bootcode]\n\
-        [-s sectors-per-cluster] [-S logical-sector-size] [-f number-of-FATs]\n\
-        [-h hidden-sectors] [-F fat-size] [-r root-dir-entries] [-R reserved-sectors]\n\
-        /dev/name [blocks]\n");
-@@ -1439,7 +1483,7 @@
-   printf ("%s " VERSION " (" VERSION_DATE ")\n",
- 	   program_name);
- 
--  while ((c = getopt (argc, argv, "AbcCf:F:Ii:l:m:n:r:R:s:S:h:v")) != EOF)
-+  while ((c = getopt (argc, argv, "AbcCf:F:Ii:l:m:n:r:R:s:S:v:B:")) != EOF)
-     /* Scan the command line for options */
-     switch (c)
-       {
-@@ -1509,6 +1553,51 @@
- 	listfile = optarg;
- 	break;
- 
-+      case 'B':         /* B : read in bootcode */
-+        if ( strcmp(optarg, "-") )
-+	  {
-+	    msgfile = fopen(optarg, "r");
-+	    if ( !msgfile )
-+	      perror(optarg);
-+	  }
-+	else
-+	  msgfile = stdin;
-+
-+	if ( msgfile )
-+	  {
-+            if (!(template_boot_code = malloc( MAX_RESERVED )))
-+                die( "Out of memory" );
-+	    /* The template boot sector including reserved must not be > 65535 */
-+            use_template = 1;
-+	    i = 0;
-+	    do
-+	      {
-+		ch = getc(msgfile);
-+		switch (ch)
-+		  {
-+		  case EOF:
-+		    break;
-+
-+		  default:
-+		    template_boot_code[i++] = ch; /* Store character */
-+		    break;
-+		  }
-+	      }
-+	    while ( ch != EOF && i < MAX_RESERVED );
-+	    ch = getc(msgfile); /* find out if we're at EOF */
-+
-+	    /* Fill up with zeros */
-+	    while( i < MAX_RESERVED )
-+		template_boot_code[i++] = '\0';
-+	    
-+	    if ( ch != EOF )
-+	      printf ("Warning: template too long; truncated after %d bytes\n", i);
-+	    
-+	    if ( msgfile != stdin )
-+	      fclose(msgfile);
-+	  }
-+	break;
-+
-       case 'm':		/* m : Set boot message */
- 	if ( strcmp(optarg, "-") )
- 	  {
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
deleted file mode 100644
index 3ba4711d1265..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
+++ /dev/null
@@ -1,639 +0,0 @@
-Add -d <directory> support to populate the image.
-
-Upstream-Status: Inappropriate [licensing]
-We're tracking an old release of dosfstools due to licensing issues.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: dosfstools-2.11/mkdosfs/mkdosfs.c
-===================================================================
---- dosfstools-2.11.orig/mkdosfs/mkdosfs.c	2011-12-06 12:27:55.000000000 +0000
-+++ dosfstools-2.11/mkdosfs/mkdosfs.c	2011-12-06 12:37:13.445950703 +0000
-@@ -18,6 +18,10 @@
-    as a rule), and not the block.  For example the boot block does not
-    occupy a full cluster.
- 
-+   June 2004 - Jordan Crouse (info.linux@amd.com)
-+   Added -d <directory> support to populate the image
-+   Copyright (C) 2004, Advanced Micro Devices, All Rights Reserved
-+   
-    Fixes/additions May 1998 by Roman Hodek
-    <Roman.Hodek@informatik.uni-erlangen.de>:
-    - Atari format support
-@@ -71,6 +75,8 @@
- #include <unistd.h>
- #include <time.h>
- #include <errno.h>
-+#include <libgen.h>
-+#include <dirent.h>
- 
- #include <linux/version.h>
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
-@@ -110,6 +116,8 @@
-  * sufficient (or even better :) for 64 bit offsets in the meantime */
- #define llseek lseek
- 
-+#define ROUND_UP(value, divisor) (value + (divisor - (value % divisor))) / divisor
-+
- /* Constant definitions */
- 
- #define TRUE 1			/* Boolean constants */
-@@ -149,7 +157,6 @@
- #define ATTR_VOLUME  8		/* volume label */
- #define ATTR_DIR     16		/* directory */
- #define ATTR_ARCH    32		/* archived */
--
- #define ATTR_NONE    0		/* no attribute bits */
- #define ATTR_UNUSED  (ATTR_VOLUME | ATTR_ARCH | ATTR_SYS | ATTR_HIDDEN)
- 	/* attribute bits that are copied "as is" */
-@@ -245,6 +252,19 @@
-   __u32		reserved2[4];
- };
- 
-+/* This stores up to 13 chars of the name */
-+
-+struct msdos_dir_slot {
-+        __u8    id;             /* sequence number for slot */
-+        __u8    name0_4[10];    /* first 5 characters in name */
-+        __u8    attr;           /* attribute byte */
-+        __u8    reserved;       /* always 0 */
-+        __u8    alias_checksum; /* checksum for 8.3 alias */
-+        __u8    name5_10[12];   /* 6 more characters in name */
-+        __u16   start;          /* starting cluster number, 0 in long slots */
-+        __u8    name11_12[4];   /* last 2 characters in name */
-+};
-+
- struct msdos_dir_entry
-   {
-     char	name[8], ext[3];	/* name and extension */
-@@ -293,6 +313,15 @@
- 
- #define MESSAGE_OFFSET 29	/* Offset of message in above code */
- 
-+/* Special structure to keep track of directories as we add them for the -d option */
-+
-+struct dir_entry {
-+  int root;                       /* Specifies if this is the root dir or not */
-+  int count;                      /* Number of items in the table */
-+  int entries;                    /* Number of entries in the table */
-+  struct msdos_dir_entry *table;  /* Pointer to the entry table */
-+};
-+
- /* Global variables - the root of all evil :-) - see these and weep! */
- 
- static char *template_boot_code;	/* Variable to store a full template boot sector in */
-@@ -326,6 +355,9 @@
- static int size_root_dir;	/* Size of the root directory in bytes */
- static int sectors_per_cluster = 0;	/* Number of sectors per disk cluster */
- static int root_dir_entries = 0;	/* Number of root directory entries */
-+static int root_dir_num_entries = 0;
-+static int last_cluster_written = 0;
-+
- static char *blank_sector;		/* Blank sector - all zeros */
- static int hidden_sectors = 0;		/* Number of hidden sectors */
- 
-@@ -399,7 +431,6 @@
-   }
- }
- 
--
- /* Mark a specified sector as having a particular value in it's FAT entry */
- 
- static void
-@@ -1266,6 +1297,9 @@
-       die ("unable to allocate space for root directory in memory");
-     }
- 
-+
-+  last_cluster_written = 2;
-+  
-   memset(root_dir, 0, size_root_dir);
-   if ( memcmp(volume_name, "           ", 11) )
-     {
-@@ -1314,11 +1348,11 @@
-   }
-   
-   if (!(blank_sector = malloc( sector_size )))
--      die( "Out of memory" );
-+    die( "Out of memory" );
-+  
-   memset(blank_sector, 0, sector_size);
- }
--
--
-+  
- /* Write the new filesystem's data tables to wherever they're going to end up! */
- 
- #define error(str)				\
-@@ -1340,7 +1374,7 @@
-   do {							\
-     int __size = (size);				\
-     if (write (dev, buf, __size) != __size)		\
--	error ("failed whilst writing " errstr);	\
-+       error ("failed whilst writing " errstr);	\
-   } while(0)
- 
- 
-@@ -1412,6 +1446,452 @@
-   free (fat);  /* Free up the fat table space reserved during setup_tables */
- }
- 
-+/* Add a file to the specified directory entry, and also write it into the image */
-+
-+static void copy_filename(char *filename, char *base, char *ext) {
-+  
-+  char *ch = filename;
-+  int i, len;
-+
-+  memset(base, 0x20, 8);
-+  memset(ext, 0x20, 3);
-+  
-+  for(len = 0 ; *ch && *ch != '.'; ch++) {
-+    base[len++] = toupper(*ch);
-+    if (len == 8) break;
-+  }
-+  
-+  for ( ; *ch && *ch != '.'; ch++);
-+  if (*ch) ch++;
-+  
-+  for(len = 0 ; *ch; ch++) {
-+    ext[len++] = toupper(*ch);
-+    if (len == 3) break;
-+  }
-+}
-+
-+/* Check for an .attrib.<filename> file, and read the attributes therein */
-+
-+/* We are going to be pretty pedantic about this.  The file needs 3
-+   bytes at the beginning, the attributes are listed in this order:
-+   
-+   (H)idden|(S)ystem|(A)rchived
-+   
-+   A capital HSA means to enable it, anything else will disable it
-+   (I recommend a '-') The unix user attributes will still be used 
-+   for write access.
-+
-+   For example, to enable system file access for ldlinux.sys, write 
-+   the following to .attrib.ldlinux.sys: -S-
-+*/
-+
-+unsigned char check_attrib_file(char *dir, char *filename) {
-+
-+  char attrib[4] = { '-', '-', '-' };
-+  unsigned char *buffer = 0;
-+  int ret = ATTR_NONE;
-+  int fd = -1;
-+
-+  buffer = (char *) calloc(1, strlen(dir) + strlen(filename) + 10);
-+  if (!buffer) return ATTR_NONE;
-+
-+  sprintf(buffer, "%s/.attrib.%s", dir, filename);
-+
-+  if (access(buffer, R_OK)) 
-+    goto exit_attrib;
-+
-+  if ((fd = open(buffer, O_RDONLY, 0)) < 0)
-+    goto exit_attrib;
-+
-+  if (read(fd, attrib, 3) < 0)
-+    goto exit_attrib;
-+  
-+  if (attrib[0] == 'H') ret |= ATTR_HIDDEN;
-+  if (attrib[1] == 'S') ret |= ATTR_SYS;
-+  if (attrib[2] == 'A') ret |= ATTR_ARCH;
-+
-+  printf("%s: Setting atrribute %x\n", filename, ret);
-+
-+ exit_attrib:
-+  if (fd >= 0) close(fd);
-+  if (buffer) free(buffer);
-+
-+  return ret;
-+}
-+
-+static void copy_name(char *buffer, int size, char **pointer) {
-+  int i;
-+
-+  for(i = 0; i < size; i += 2) {
-+    if (*pointer) {
-+      buffer[i] = **pointer;
-+      buffer[i + 1] = 0x00;
-+      *pointer = **pointer ? *pointer + 1 : 0;
-+    }
-+    else {
-+      buffer[i] = 0xFF;
-+      buffer[i + 1] = 0xFF;
-+    }
-+  }  
-+}
-+
-+static int add_file(char *filename, struct dir_entry *dir, unsigned char attr) 
-+{
-+  struct stat stat;
-+  struct msdos_dir_entry *entry;
-+  int infile = 0;
-+  int sectors, clusters;
-+  struct tm *ctime;
-+  int c, s;
-+  int ptr;
-+  char *buffer, *base;
-+  int start;
-+  int usedsec, totalsec;
-+
-+  char name83[8], ext83[3];
-+
-+  struct msdos_dir_slot *slot;
-+  int i;
-+  char *p;
-+
-+  /* The root directory is static, everything else grows as needed */
-+
-+  if (dir->root) {
-+    if (dir->count == dir->entries) {
-+      printf("Error - too many directory entries\n");
-+    }
-+  }
-+  else {
-+    if (dir->count == dir->entries) {
-+      if (!dir->table) 
-+	dir->table = 
-+	  (struct msdos_dir_entry *) malloc(sizeof(struct msdos_dir_entry));
-+      else {
-+	dir->table = 
-+	  (struct msdos_dir_entry *) realloc(dir->table, (dir->entries + 1) * 
-+					     sizeof(struct msdos_dir_entry));
-+
-+	memset(&dir->table[dir->entries], 0, sizeof(struct msdos_dir_entry));
-+      }
-+
-+      dir->entries++;
-+    }
-+  }
-+
-+  infile = open(filename, O_RDONLY, 0);
-+  if (!infile) return;
-+  
-+  if (fstat(infile, &stat))
-+    goto exit_add;
-+ 
-+  if (S_ISCHR(stat.st_mode) ||S_ISBLK(stat.st_mode) ||
-+      S_ISFIFO(stat.st_mode) || S_ISLNK(stat.st_mode)) {
-+    printf("Error - cannot create a special file in a FATFS\n");
-+    goto exit_add;
-+  }
-+
-+  /* FIXME: This isn't very pretty */
-+
-+  usedsec = start_data_sector + (size_root_dir / sector_size) +
-+    (last_cluster_written * bs.cluster_size);
-+
-+  totalsec = blocks * BLOCK_SIZE / sector_size;
-+  
-+  /* Figure out how many sectors / clustors the file requires */
-+
-+  sectors = ROUND_UP(stat.st_size, sector_size);
-+  clusters = ROUND_UP(sectors, (int) bs.cluster_size);
-+
-+  if (usedsec + sectors > totalsec) {
-+    printf("Error - %s is too big (%d vs %d)\n", filename, sectors, totalsec - usedsec);
-+    close(infile);
-+    return -1;
-+  }
-+
-+  printf("ADD %s\n", filename);
-+
-+  /* Grab the basename of the file */
-+  base = basename(filename);
-+  
-+  /* Extract out the 8.3 name */
-+  copy_filename(base, name83, ext83);
-+
-+  /* Make an extended name slot */
-+
-+  slot = (struct msdos_dir_slot *) &dir->table[dir->count++];
-+  slot->id = 'A';  
-+  slot->attr = 0x0F;
-+  slot->reserved = 0;
-+  slot->start = 0;
-+  
-+  slot->alias_checksum = 0;
-+  
-+  for(i = 0; i < 8; i++) 
-+    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + name83[i];
-+  
-+  for(i = 0; i < 3; i++) 
-+    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + ext83[i];
-+
-+  p = base;
-+
-+  copy_name(slot->name0_4, 10, &p);
-+  copy_name(slot->name5_10, 12, &p);
-+  copy_name(slot->name11_12, 4, &p);
-+
-+
-+  /* Get the entry from the root filesytem */
-+  entry = &dir->table[dir->count++];
-+
-+  strncpy(entry->name, name83, 8);
-+  strncpy(entry->ext, ext83, 3);
-+
-+
-+  /* If the user has it read only, then add read only to the incoming
-+     attribute settings */
-+
-+  if (!(stat.st_mode & S_IWUSR)) attr |= ATTR_RO;
-+  entry->attr = attr;
-+
-+  /* Set the access time on the file */
-+  ctime = localtime(&create_time);
-+
-+  entry->time = CT_LE_W((unsigned short)((ctime->tm_sec >> 1) +
-+					  (ctime->tm_min << 5) + (ctime->tm_hour << 11)));
-+
-+  entry->date = CT_LE_W((unsigned short)(ctime->tm_mday +
-+				      ((ctime->tm_mon+1) << 5) +
-+				      ((ctime->tm_year-80) << 9)));
-+
-+  entry->ctime_ms = 0;
-+  entry->ctime = entry->time;
-+  entry->cdate = entry->date;
-+  entry->adate = entry->date;
-+  entry->size = stat.st_size;
-+
-+  start = last_cluster_written;
-+
-+  entry->start = CT_LE_W(start);  /* start sector */
-+  entry->starthi = CT_LE_W((start & 0xFFFF0000) >> 16); /* High start sector (for FAT32) */
-+
-+  /* We mark all of the clusters we use in the FAT */
-+  
-+  for(c = 0; c < clusters; c++ ) {
-+    int free;
-+    int next = c == (clusters - 1) ? FAT_EOF : start + c + 1;
-+    mark_FAT_cluster(start + c, next);  
-+    last_cluster_written++;
-+  }
-+  
-+  /* This confused me too - cluster 2 starts after the
-+     root directory data - search me as to why */
-+
-+  ptr = (start_data_sector * sector_size) + size_root_dir;
-+  ptr += (start - 2) * bs.cluster_size * sector_size;
-+    
-+  buffer = (char *) malloc(sector_size);
-+
-+  if (!buffer) {
-+    printf("Error - couldn't allocate memory\n");
-+    goto exit_add;
-+  }
-+
-+  /* Write the file into the file block */
-+
-+  seekto(ptr, "datafile");
-+
-+  while(1) {
-+    int size = read(infile, buffer, sector_size);    
-+    if (size <= 0) break;
-+    
-+    writebuf(buffer, size, "data");    
-+  }
-+
-+ exit_add:
-+  if (infile) close(infile);
-+}
-+
-+/* Add a new directory to the specified directory entry, and in turn populate 
-+   it with its own files */
-+
-+/* FIXME:  This should check to make sure there is enough size to add itself */
-+
-+static void add_directory(char *filename, struct dir_entry *dir) {
-+
-+  struct dir_entry *newdir = 0;
-+  struct msdos_dir_entry *entry;
-+  struct tm *ctime;
-+  DIR *rddir = opendir(filename);
-+  struct dirent *dentry = 0;
-+  int remain;
-+  char *data;
-+
-+  /* If the directory doesn't exist */
-+  if (!rddir) return;
-+  
-+  if (dir->root) {
-+    if (dir->count == dir->entries) {
-+      printf("Error - too many directory entries\n");
-+      goto exit_add_dir;
-+    }
-+  }
-+  else {
-+    if (dir->count == dir->entries) {
-+      if (!dir->table) 
-+	dir->table = (struct msdos_dir_entry *) malloc(sizeof(struct msdos_dir_entry));
-+      else {
-+	dir->table = (struct msdos_dir_entry *) realloc(dir->table, (dir->entries + 1) * 
-+							sizeof(struct msdos_dir_entry));
-+
-+	/* Zero it out to avoid issues */
-+	memset(&dir->table[dir->entries], 0, sizeof(struct msdos_dir_entry));
-+      }
-+	dir->entries++;
-+    }
-+  }
-+
-+  /* Now, create a new directory entry for the new directory */
-+  newdir = (struct dir_entry *) calloc(1, sizeof(struct dir_entry));
-+  if (!newdir) goto exit_add_dir;
-+
-+  entry = &dir->table[dir->count++];
-+
-+  strncpy(entry->name, basename(filename), sizeof(entry->name));
-+  
-+  entry->attr = ATTR_DIR;
-+  ctime = localtime(&create_time);
-+
-+  entry->time = CT_LE_W((unsigned short)((ctime->tm_sec >> 1) +
-+					  (ctime->tm_min << 5) + (ctime->tm_hour << 11)));
-+
-+  entry->date = CT_LE_W((unsigned short)(ctime->tm_mday +
-+				      ((ctime->tm_mon+1) << 5) +
-+				      ((ctime->tm_year-80) << 9)));
-+
-+  entry->ctime_ms = 0;
-+  entry->ctime = entry->time;
-+  entry->cdate = entry->date;
-+  entry->adate = entry->date;
-+
-+  /* Now, read the directory */
-+
-+  while((dentry = readdir(rddir))) {
-+    struct stat st;
-+    char *buffer;
-+    
-+    if (!strcmp(dentry->d_name, ".") || !strcmp(dentry->d_name, ".."))
-+      continue;
-+
-+    /* DOS wouldn't like a typical unix . (dot) file, so we skip those too */
-+    if (dentry->d_name[0] == '.') continue;
-+
-+    buffer = malloc(strlen(filename) + strlen(dentry->d_name) + 3);
-+    if (!buffer) continue;
-+    
-+    sprintf(buffer, "%s/%s", filename, dentry->d_name);
-+    if (!stat(buffer, &st)) {
-+      if (S_ISDIR(st.st_mode)) 
-+	add_directory(buffer, newdir);
-+      else if (S_ISREG(st.st_mode)) {
-+	unsigned char attrib = check_attrib_file(filename, dentry->d_name);
-+	add_file(buffer, newdir, attrib);
-+      }
-+    }
-+ 
-+    free(buffer);
-+  }
-+  
-+  /* Now that the entire directory has been written, go ahead and write the directory
-+     entry as well */
-+
-+  entry->start = CT_LE_W(last_cluster_written);
-+  entry->starthi = CT_LE_W((last_cluster_written & 0xFFFF0000) >> 16); 
-+  entry->size = newdir->count * sizeof(struct msdos_dir_entry);
-+  
-+  remain = entry->size;
-+  data = (char *) newdir->table;
-+
-+  while(remain) {
-+    int size = 
-+      remain > bs.cluster_size * sector_size ? bs.cluster_size * sector_size : remain;
-+
-+    int pos = (start_data_sector * sector_size) + size_root_dir;
-+    pos += (last_cluster_written - 2) * bs.cluster_size * sector_size;
-+    
-+    seekto(pos, "add_dir");
-+    writebuf(data, size, "add_dir");
-+    
-+    remain -= size;
-+    data += size;
-+
-+    mark_FAT_cluster(last_cluster_written, remain ? last_cluster_written + 1 : FAT_EOF);      
-+    last_cluster_written++;
-+  }
-+  
-+ exit_add_dir:
-+  if (rddir) closedir(rddir);
-+  if (newdir->table) free(newdir->table);
-+  if (newdir) free(newdir);
-+}  
-+  
-+/* Given a directory, add all the files and directories to the root directory of the
-+   image.  
-+*/
-+
-+static void add_root_directory(char *dirname) 
-+{
-+  DIR *dir = opendir(dirname);
-+  struct dirent *entry = 0;
-+  struct dir_entry *newdir = 0;
-+
-+  if (!dir) {
-+    printf("Error - directory %s does not exist\n", dirname);
-+    return;
-+  }
-+ 
-+  /* Create the root directory structure - this is a bit different then
-+     above, because the table already exists, we just refer to it. */
-+
-+  newdir = (struct dir_entry *) calloc(1,sizeof(struct dir_entry));
-+
-+  if (!newdir) {
-+    closedir(dir);
-+    return;
-+  }
-+
-+  newdir->entries = root_dir_entries;
-+  newdir->root = 1;
-+  newdir->count = 0;
-+  newdir->table = root_dir;
-+
-+  while((entry = readdir(dir))) {
-+    struct stat st;
-+    char *buffer;
-+    
-+    if (!strcmp(entry->d_name, ".") || !strcmp(entry->d_name, ".."))
-+      continue;
-+    
-+    /* DOS wouldn't like a typical unix . (dot) file, so we skip those too */
-+    if (entry->d_name[0] == '.') continue;
-+ 
-+    buffer = malloc(strlen(dirname) + strlen(entry->d_name) + 3);
-+    if (!buffer) continue;
-+
-+    sprintf(buffer, "%s/%s", dirname, entry->d_name);
-+    if (!stat(buffer, &st)) {
-+      if (S_ISDIR(st.st_mode)) 
-+	add_directory(buffer, newdir);
-+      else if (S_ISREG(st.st_mode)) {
-+	unsigned char attrib = check_attrib_file(dirname, entry->d_name);
-+	add_file(buffer, newdir, attrib);
-+      }
-+    }
-+
-+    free(buffer);
-+  }
-+
-+  closedir(dir);
-+  if (newdir) free(newdir);
-+}
- 
- /* Report the command usage and return a failure error code */
- 
-@@ -1423,7 +1903,7 @@
-        [-m boot-msg-file] [-n volume-name] [-i volume-id] [-B bootcode]\n\
-        [-s sectors-per-cluster] [-S logical-sector-size] [-f number-of-FATs]\n\
-        [-h hidden-sectors] [-F fat-size] [-r root-dir-entries] [-R reserved-sectors]\n\
--       /dev/name [blocks]\n");
-+       [-d directory] /dev/name [blocks]\n");
- }
- 
- /*
-@@ -1463,6 +1943,8 @@
-   int c;
-   char *tmp;
-   char *listfile = NULL;
-+  char *dirname = NULL;
-+
-   FILE *msgfile;
-   struct stat statbuf;
-   int i = 0, pos, ch;
-@@ -1483,7 +1965,7 @@
-   printf ("%s " VERSION " (" VERSION_DATE ")\n",
- 	   program_name);
- 
--  while ((c = getopt (argc, argv, "AbcCf:F:Ii:l:m:n:r:R:s:S:v:B:")) != EOF)
-+  while ((c = getopt (argc, argv, "AbcCd:f:F:Ii:l:m:n:r:R:s:S:v:B:")) != EOF)
-     /* Scan the command line for options */
-     switch (c)
-       {
-@@ -1508,6 +1990,10 @@
- 	create = TRUE;
- 	break;
- 
-+  case 'd':
-+	dirname = optarg;
-+	break;
-+
-       case 'f':		/* f : Choose number of FATs */
- 	nr_fats = (int) strtol (optarg, &tmp, 0);
- 	if (*tmp || nr_fats < 1 || nr_fats > 4)
-@@ -1811,8 +2297,10 @@
-   else if (listfile)
-     get_list_blocks (listfile);
- 
--  write_tables ();		/* Write the file system tables away! */
- 
-+  if (dirname) add_root_directory(dirname);
-+
-+  write_tables ();		/* Write the file system tables away! */  
-   exit (0);			/* Terminate with no errors! */
- }
- 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch b/meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch
deleted file mode 100644
index 11e8a7594b25..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/msdos_fat12_undefined.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fix a compilation error due to undefined MSDOS_FAT12.
-
-Upstream-Status: Inappropriate [licensing]
-We're tracking an old release of dosfstools due to licensing issues.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
---- dosfstools-2.10/dosfsck/boot.c.orig	2004-10-15 08:51:42.394725176 -0600
-+++ dosfstools-2.10/dosfsck/boot.c	2004-10-15 08:49:16.776862456 -0600
-@@ -14,6 +14,9 @@
- #include "io.h"
- #include "boot.h"
- 
-+#ifndef MSDOS_FAT12
-+#define MSDOS_FAT12 4084
-+#endif
- 
- #define ROUND_TO_MULTIPLE(n,m) ((n) && (m) ? (n)+(m)-1-((n)-1)%(m) : 0)
-     /* don't divide by zero */
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch b/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
deleted file mode 100644
index 6ee3f7f77134..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/nofat32_autoselect.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-FAT32 appears to be broken when used with the -d option to populate the msdos
-image. This disables the FAT32 autoselection code which means we don't get
-broken images with the -d option. It can still be enabled on the commandline
-at the users own risk. This changes us back to the 2.10 version's behaviour
-which was known to work well even with large images.
-
-Upstream-Status: Inapproriate [depends on other patches we apply]
-
-RP 2011/12/13
-
-Index: dosfstools-2.11/mkdosfs/mkdosfs.c
-===================================================================
---- dosfstools-2.11.orig/mkdosfs/mkdosfs.c	2011-12-13 13:54:37.538509391 +0000
-+++ dosfstools-2.11/mkdosfs/mkdosfs.c	2011-12-13 13:55:10.258508631 +0000
-@@ -808,10 +808,12 @@
-       bs.media = (char) 0xf8; /* Set up the media descriptor for a hard drive */
-       bs.dir_entries[0] = (char) 0;	/* Default to 512 entries */
-       bs.dir_entries[1] = (char) 2;
-+/*
-       if (!size_fat && blocks*SECTORS_PER_BLOCK > 1064960) {
- 	  if (verbose) printf("Auto-selecting FAT32 for large filesystem\n");
- 	  size_fat = 32;
-       }
-+*/
-       if (size_fat == 32) {
- 	  /* For FAT32, try to do the same as M$'s format command:
- 	   * fs size < 256M: 0.5k clusters
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
deleted file mode 100644
index d1c24b874845..000000000000
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-# dosfstools OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-SUMMARY = "DOS FAT Filesystem Utilities"
-HOMEPAGE = "http://daniel-baumann.ch/software/dosfstools/"
-
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
-PR = "r5"
-
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.src.tar.gz/407d405ade410f7597d364ab5dc8c9f6/${BP}.src.tar.gz \
-           file://mkdosfs-bootcode.patch \
-           file://mkdosfs-dir.patch \
-           file://alignment_hack.patch \
-           file://msdos_fat12_undefined.patch \
-           file://dosfstools-msdos_fs-types.patch \
-           file://include-linux-types.patch \
-           file://nofat32_autoselect.patch \
-           file://fix_populated_dosfs_creation.patch "
-
-SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
-SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
-
-# Makefile sets this, but we clobber its CFLAGS, so
-# add this in here to for sure allow for big files.
-#
-CFLAGS_append = " -D_FILE_OFFSET_BITS=64"
-
-do_install () {
-	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${base_sbindir}" \
-		   "MANDIR=${D}${mandir}/man8" install
-}
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
new file mode 100644
index 000000000000..12a2c0a7e333
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
@@ -0,0 +1,23 @@
+# dosfstools OE build file
+# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
+# Copyright (C) 2015, Sören Brinkmann <soeren.brinkmann@gmail>  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+SUMMARY = "DOS FAT Filesystem Utilities"
+HOMEPAGE = "https://github.com/dosfstools/dosfstools"
+
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://${S}/COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz"
+SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
+SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
+
+FILES_${PN} = "${base_sbindir}"
+FILES_${PN}-doc = "${mandir} ${docdir}"
+
+do_install () {
+	oe_runmake "PREFIX=${D}${prefix}" "SBINDIR=${D}${base_sbindir}" install
+}
+
+BBCLASSEXTEND = "native"
-- 
2.4.0.3.ge0ccc3b.dirty


