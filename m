Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0107.outbound.protection.outlook.com [157.56.111.107])
	by mail.openembedded.org (Postfix) with ESMTP id E96E37237A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 04:04:02 +0000 (UTC)
Received: from CO2PR03CA0034.namprd03.prod.outlook.com (10.141.194.161) by
	DM2PR0301MB0718.namprd03.prod.outlook.com (25.160.97.139) with
	Microsoft SMTP
	Server (TLS) id 15.1.53.17; Thu, 15 Jan 2015 04:04:01 +0000
Received: from BN1BFFO11FD038.protection.gbl (2a01:111:f400:7c10::1:170) by
	CO2PR03CA0034.outlook.office365.com (2a01:111:e400:1414::33) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Thu, 15 Jan 2015
	04:04:00 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD038.mail.protection.outlook.com (10.58.144.101) with
	Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport; Thu, 15 Jan 2015
	04:04:00 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0F43rQu001389;
	Wed, 14 Jan 2015 21:03:58 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 12:03:52 +0800
Message-ID: <1421294632-31110-4-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1421294632-31110-1-git-send-email-ting.liu@freescale.com>
References: <1421294632-31110-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(377424004)(189002)(199003)(36756003)(229853001)(77096005)(47776003)(64706001)(87936001)(48376002)(50466002)(450100001)(2351001)(2950100001)(68736005)(62966003)(77156002)(15975445007)(110136001)(76176999)(86362001)(92566002)(105606002)(104016003)(81156004)(106466001)(33646002)(19580395003)(69596002)(85426001)(6806004)(19580405001)(50986999)(50226001)(97736003)(86152002)(46102003)(211663006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0718;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:DM2PR0301MB0718;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:DM2PR0301MB0718; 
X-Forefront-PRVS: 0457F11EAF
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0718; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2015 04:04:00.1722 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0718
Subject: [oe-core dizzy][PATCH 3/3] valgrind: build with altivec only if it supported
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
X-List-Received-Date: Thu, 15 Jan 2015 04:04:06 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 .../pass-maltivec-only-if-it-supported.patch       | 68 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
new file mode 100644
index 0000000..12ad4c3
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
@@ -0,0 +1,68 @@
+Upstream-status: Backport
+
+r14566 | florian | 2014-09-24 17:02:54 -0500 (Wed, 24 Sep 2014) | 4 lines
+
+The testbuckets none/tests/ppc{32,64} did not build in case the
+toolchain did not support -maltivec -mabi=altivec.
+This should work now. Fixes BZ #338731
+
+Index: none/tests/ppc32/Makefile.am
+===================================================================
+--- a/none/tests/ppc32/Makefile.am	(revision 14565)
++++ b/none/tests/ppc32/Makefile.am	(revision 14566)
+@@ -72,8 +72,12 @@
+ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+ 
+ if HAS_ALTIVEC
++BUILD_FLAG_ALTIVEC = -maltivec
++BUILD_FLAG_ABI_ALTIVEC = -mabi=altivec
+ ALTIVEC_FLAG = -DHAS_ALTIVEC
+ else
++BUILD_FLAG_ALTIVEC =
++BUILD_FLAG_ABI_ALTIVEC =
+ ALTIVEC_FLAG =
+ endif
+ 
+@@ -101,11 +105,12 @@
+ ISA_2_07_FLAG =
+ endif
+ 
+-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
+-			@FLAG_M32@ $(ALTIVEC_FLAG)
++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
++			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
+ 
+-testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -maltivec -mabi=altivec -DALTIVEC \
+-			-DGCC_COMPILER @FLAG_M32@
++testVMX_CFLAGS  = $(AM_CFLAGS) -O -g -Wall -DALTIVEC \
++			-DGCC_COMPILER @FLAG_M32@  $(BUILD_FLAG_ALTIVEC) \
++			$(BUILD_FLAG_ABI_ALTIVEC)
+ 
+ test_isa_2_06_part1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
+ 			@FLAG_M32@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
+Index: none/tests/ppc64/Makefile.am
+===================================================================
+--- a/none/tests/ppc64/Makefile.am	(revision 14565)
++++ b/none/tests/ppc64/Makefile.am	(revision 14566)
+@@ -50,8 +50,10 @@
+ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+ 
+ if HAS_ALTIVEC
++BUILD_FLAG_ALTIVEC = -maltivec
+ ALTIVEC_FLAG = -DHAS_ALTIVEC
+ else
++BUILD_FLAG_ALTIVEC =
+ ALTIVEC_FLAG =
+ endif
+ 
+@@ -88,8 +90,8 @@
+ test_isa_2_06_part3_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(VSX_FLAG) \
+ 			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_VSX)
+ 
+-jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames -maltivec \
+-			@FLAG_M64@ $(ALTIVEC_FLAG)
++jm_insns_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames \
++			@FLAG_M64@ $(ALTIVEC_FLAG) $(BUILD_FLAG_ALTIVEC)
+ 
+ test_dfp1_CFLAGS = $(AM_CFLAGS) -Winline -Wall -O -g -mregnames $(DFP_FLAG) \
+ 			@FLAG_M64@ $(BUILD_FLAGS_DFP)
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index c415e77..eea81a2 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://remove-arm-variant-specific.patch \
            file://remove-ppc-tests-failing-build.patch \
            file://add-ptest.patch \
+           file://pass-maltivec-only-if-it-supported.patch \
            file://run-ptest \
           "
 
-- 
1.8.3.2


