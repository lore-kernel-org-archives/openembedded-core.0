Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id B31927089F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 06:51:59 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id lj1so3034761pab.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TmpnB+GsK8HiQIGdv8dyNJqk8YC2RS76FN3V7ZUz8z4=;
	b=KRLGnmsFx+Bajb2+3njiYoKH61xYZe0vgeMSaP2QIwYPtYmSm+0gZsxUvmicQQyMhD
	tAxCP0ppohiUUyDpuYKBTxqC/+NP1VhjPwaCY8/0kqooRnN1/vi0EUtu2t/prWUADKW8
	pYr2NV8zPB65dzLuhwO1Edyg4Mq/hQOgF8vM/wyI0/TicsNrwstXbtb1YpOfC+mgSMNh
	wAJm3+u66LZ3qmawC8dfSPmcExk50exZKoxIgtraUkCVbAijuie5KHaPr/FtlqtZuj2C
	IyaHXts+fF5FaI7pVIDWMnSO0LaBUPV/5i2qE66Zt5VgVYTf/HA1HMrLQqJwNijOOk3h
	G5+g==
X-Received: by 10.68.138.13 with SMTP id qm13mr632600pbb.46.1406789520481;
	Wed, 30 Jul 2014 23:52:00 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id f16sm6724680pdm.43.2014.07.30.23.51.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 23:51:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 23:55:21 -0700
Message-Id: <1406789721-6769-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gcc: Upgrade 4.9.0 -> 4.9.1
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
X-List-Received-Date: Thu, 31 Jul 2014 06:52:07 -0000

Drop patches which are already available in 4.9.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    9 +-
 ...-E500-SPE-errors-with-the-_Decimal64-type.patch |   98 --------------------
 2 files changed, 4 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 10bd5d5..d1be67d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "4.9.0"
+PV = "4.9.1"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "4.9.0"
+BINV = "4.9.1"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-4.9:"
 
@@ -65,12 +65,11 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
 	   file://0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch \
            file://0051-eabispe.patch \
-           file://0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch \
            file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
            file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
 	  "
-SRC_URI[md5sum] = "9709b49ae0e904cbb0a6a1b62853b556"
-SRC_URI[sha256sum] = "b9b047a97bade9c1c89970bc8e211ff57b7b8998a1730a80a653d329f8ed1257"
+SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
+SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch b/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
deleted file mode 100644
index b4be18e..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.9/0052-Fix-GCC-targeting-E500-SPE-errors-with-the-_Decimal64-type.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From e44a6d438db4848c2a555be773568a3cf7994206 Mon Sep 17 00:00:00 2001
-From: Alexandru-Cezar Sardan <alexandru.sardan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
-Date: Mon, 26 May 2014 12:11:13 +0300
-Subject: [PATCH] Fix E500 with SPE errors with the _Decimal64 type
-
-[gcc]
-2014-04-21 Michael Meissner  <meissner-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
-
-	PR target/60735
-	* config/rs6000/rs6000.md (mov<mode>_softfloat32, FMOVE64 case):
-	If mode is DDmode and TARGET_E500_DOUBLE allow move.
-
-	* config/rs6000/rs6000.c (rs6000_debug_reg_global): Print some
-	more debug information for E500 if -mdebug=reg.
-
-[gcc/testsuite]
-2014-04-21  Michael Meissner  <meissner-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
-
-	PR target/60735
-	* gcc.target/powerpc/pr60735.c: New test.  Insure _Decimal64 does
-	not cause errors if -mspe.
-
-Upstream status: Accepted
-
-This solves upstream bug 60735 
-(https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60735).
-
-Patch taken from https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=209664
----
- gcc/config/rs6000/rs6000.c                 |   18 ++++++++++++++++++
- gcc/config/rs6000/rs6000.md                |    3 ++-
- gcc/testsuite/gcc.target/powerpc/pr60735.c |   11 +++++++++++
- 3 files changed, 31 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/powerpc/pr60735.c
-
-diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
-index 494efc5..6dcf440 100644
---- a/gcc/config/rs6000/rs6000.c
-+++ b/gcc/config/rs6000/rs6000.c
-@@ -2283,6 +2283,24 @@ rs6000_debug_reg_global (void)
-   if (rs6000_float_gprs)
-     fprintf (stderr, DEBUG_FMT_S, "float_gprs", "true");
- 
-+  fprintf (stderr, DEBUG_FMT_S, "fprs",
-+	   (TARGET_FPRS ? "true" : "false"));
-+
-+  fprintf (stderr, DEBUG_FMT_S, "single_float",
-+	   (TARGET_SINGLE_FLOAT ? "true" : "false"));
-+
-+  fprintf (stderr, DEBUG_FMT_S, "double_float",
-+	   (TARGET_DOUBLE_FLOAT ? "true" : "false"));
-+
-+  fprintf (stderr, DEBUG_FMT_S, "soft_float",
-+	   (TARGET_SOFT_FLOAT ? "true" : "false"));
-+
-+  fprintf (stderr, DEBUG_FMT_S, "e500_single",
-+	   (TARGET_E500_SINGLE ? "true" : "false"));
-+
-+  fprintf (stderr, DEBUG_FMT_S, "e500_double",
-+	   (TARGET_E500_DOUBLE ? "true" : "false"));
-+
-   if (TARGET_LINK_STACK)
-     fprintf (stderr, DEBUG_FMT_S, "link_stack", "true");
- 
-diff --git a/gcc/config/rs6000/rs6000.md b/gcc/config/rs6000/rs6000.md
-index 64c9e7c..9cefe15 100644
---- a/gcc/config/rs6000/rs6000.md
-+++ b/gcc/config/rs6000/rs6000.md
-@@ -9395,7 +9395,8 @@
- 	(match_operand:FMOVE64 1 "input_operand" "r,Y,r,G,H,F"))]
-   "! TARGET_POWERPC64 
-    && ((TARGET_FPRS && TARGET_SINGLE_FLOAT) 
--       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE)
-+       || TARGET_SOFT_FLOAT || TARGET_E500_SINGLE
-+       || (<MODE>mode == DDmode && TARGET_E500_DOUBLE))
-    && (gpc_reg_operand (operands[0], <MODE>mode)
-        || gpc_reg_operand (operands[1], <MODE>mode))"
-   "#"
-diff --git a/gcc/testsuite/gcc.target/powerpc/pr60735.c b/gcc/testsuite/gcc.target/powerpc/pr60735.c
-new file mode 100644
-index 0000000..9bac30b
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/powerpc/pr60735.c
-@@ -0,0 +1,11 @@
-+/* { dg-do compile } */
-+/* { dg-options "-mcpu=8548 -mspe -mabi=spe -O2" } */
-+/* { dg-skip-if "not an SPE target" { ! powerpc_spe_nocache } { "*" } { "" } } */
-+
-+/* In PR60735, the type _Decimal64 generated an insn not found message.  */
-+
-+void
-+pr60735 (_Decimal64 *p, _Decimal64 *q)
-+{
-+  *p = *q;
-+}
--- 
-1.7.9.5
-
-- 
1.7.10.4


