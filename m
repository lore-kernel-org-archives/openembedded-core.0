Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B5BC433F5
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 11:15:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.7252.1642850126751635235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 03:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eBCTVNY2;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id q63so6850193pja.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 03:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1oW5kdcX7p8oiMMb6KHtyl+jQI61klAHN7k31FezW0g=;
        b=eBCTVNY2dJyqno3VSzY5EomVLX7ZYOMkiA+M7Jx1ZfUmXb3EtAGcXnM+c5AJ4A9NXd
         +bX3mrtT2LFP6A+WPe59sHZ4fHSKzVxRIebW5YRaNFZR6nExpgV2ZzBNzEcxhuCphxTx
         4lZw/C3EM1A2p0StXLqfwYNbcPQroLhMYeiL1WNCPDhdNdYhftUnyko5T5MFo9OSPcp3
         iSfWgWT6ScFxUYOotJggBN0xgSX4SsY0Ot5kgjVpOYLaM+aouctTumzVbOO0qkOtLyBz
         xJiuXjJx1P9mI/+uYvntAE1dRIGrgpvcf6htfuei298nmsZQDnyqT+lFAj8CHJjxBUZd
         Eb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1oW5kdcX7p8oiMMb6KHtyl+jQI61klAHN7k31FezW0g=;
        b=3h1uBGX77fNmI0WW1WwwjVlMLPpjw1e88LbMxryK7ZMEcLnZ26S0XqWiRU/sEmcRe0
         mxD4TmRa3LCP6puj7l2usAn2hnQYKfTiSRR21DJb7O58Lb4b1pmjrD+zzhd1B8auGJjg
         sMcpK/FfxiwmmqoBWGz6kGuVLQJwSzuGWL1287hWdZ8kKbGgqIoOk5W4yItFCFJ8+udO
         SmpgQpkEGvAon+je8hUB/gAqxI+L80e/ovb2b8R6DhRPFeO/YX5jRtoy7QwpjiiEIZ9+
         jgjKOjr8wNjTaacggK69SQ7uBNkRgV661Jp8juW+wt1lBdvxc0KvxxHV5Ebs5XYGNtBB
         pP+g==
X-Gm-Message-State: AOAM530x3fYy50PtRz+G1Ac6R1i3GH92CZCc3rEH0DAEtesNwewzTQU3
	kCKpsMR0h/IA/zwBrpQv3ySUqkiO3PllYQ==
X-Google-Smtp-Source: 
 ABdhPJzRzrAhuGC0FUmeghKjCKU+m7DKiVs9qfmHPbfzqbfaIk1toy7Yb9qGmBC6tLa99o+PuaQvVA==
X-Received: by 2002:a17:902:76c8:b0:14a:4a48:cac0 with SMTP id
 j8-20020a17090276c800b0014a4a48cac0mr7651982plt.90.1642850124517;
        Sat, 22 Jan 2022 03:15:24 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 n1sm9314343pfa.165.2022.01.22.03.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 03:15:24 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH 3/3] gcc: upgrade to gcc-10.3 version
Date: Sat, 22 Jan 2022 03:15:15 -0800
Message-Id: <20220122111516.6312-3-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220122111516.6312-1-pgowda.cve@gmail.com>
References: <20220122111516.6312-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jan 2022 11:15:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160857

gcc-10.2 in Hardknott branch has been upgraded to gcc-10.3 version
that includes many bug fixes.
Regression tested on X86-64, Arm and Aarch64 without issues.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../gcc/{gcc-10.2.inc => gcc-10.3.inc}        |  12 +-
 ...ian_10.2.bb => gcc-cross-canadian_10.3.bb} |   0
 .../{gcc-cross_10.2.bb => gcc-cross_10.3.bb}  |   0
 ...-crosssdk_10.2.bb => gcc-crosssdk_10.3.bb} |   0
 ...cc-runtime_10.2.bb => gcc-runtime_10.3.bb} |   0
 ...itizers_10.2.bb => gcc-sanitizers_10.3.bb} |   0
 ...{gcc-source_10.2.bb => gcc-source_10.3.bb} |   0
 .../gcc/gcc/0001-CVE-2021-35465.patch         |  22 +-
 ...-up-__aarch64_cas16_acq_rel-fallback.patch |  66 --
 ...ight-Line-Speculation-SLS-mitigation.patch | 202 ------
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 607 ----------------
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 658 ------------------
 ...gcc-Fix-argument-list-too-long-error.patch |   5 +-
 ...Re-introduce-spe-commandline-options.patch |   2 +-
 ...ngw32-Enable-operation_not_supported.patch |   4 +-
 .../gcc/0038-arm-neoverse-n2-support.patch    |  88 ---
 .../gcc/0039-arm64-neoverse-n2-support.patch  |  60 --
 .../gcc/{gcc_10.2.bb => gcc_10.3.bb}          |   0
 ...initial_10.2.bb => libgcc-initial_10.3.bb} |   0
 .../gcc/{libgcc_10.2.bb => libgcc_10.3.bb}    |   0
 ...ibgfortran_10.2.bb => libgfortran_10.3.bb} |   0
 21 files changed, 19 insertions(+), 1707 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-10.2.inc => gcc-10.3.inc} (90%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_10.2.bb => gcc-cross-canadian_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_10.2.bb => gcc-cross_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_10.2.bb => gcc-crosssdk_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_10.2.bb => gcc-runtime_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_10.2.bb => gcc-sanitizers_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_10.2.bb => gcc-source_10.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
 rename meta/recipes-devtools/gcc/{gcc_10.2.bb => gcc_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_10.2.bb => libgcc-initial_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_10.2.bb => libgcc_10.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_10.2.bb => libgfortran_10.3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.3.inc
similarity index 90%
rename from meta/recipes-devtools/gcc/gcc-10.2.inc
rename to meta/recipes-devtools/gcc/gcc-10.3.inc
index e7e3395c55..1fdfcced8e 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.3.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "10.2.0"
+PV = "10.3.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "10.2.0"
+BINV = "10.3.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -65,24 +65,18 @@ SRC_URI = "\
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
-           file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
-           file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
-           file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
            file://0001-libatomic-libgomp-libitc-Fix-bootstrap-PR70454.patch \
            file://0001-CVE-2021-35465.patch \
            file://0002-CVE-2021-35465.patch \
            file://0003-CVE-2021-35465.patch \
            file://0004-CVE-2021-35465.patch \
-           file://0038-arm-neoverse-n2-support.patch \
-           file://0039-arm64-neoverse-n2-support.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0005-CVE-2021-42574.patch \
 "
-SRC_URI[sha256sum] = "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
+SRC_URI[sha256sum] = "64f404c1a650f27fc33da242e1f2df54952e3963a49e06e73f6940f3223ac344"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 # For dev release snapshotting
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_10.2.bb b/meta/recipes-devtools/gcc/gcc-cross_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_10.2.bb b/meta/recipes-devtools/gcc/gcc-source_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_10.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_10.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
index b9bca49dd8..4d7c7e3f18 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
@@ -33,7 +33,7 @@ Signed-off-by: Pgowda <pgowda.cve@gmail.com>
 diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
 --- a/gcc/config/arm/arm.c	2020-07-22 23:35:17.344384552 -0700
 +++ b/gcc/config/arm/arm.c	2021-11-11 20:16:19.761241867 -0800
-@@ -3595,6 +3595,15 @@ arm_option_override (void)
+@@ -3610,6 +3610,15 @@ arm_option_override (void)
  	fix_cm3_ldrd = 0;
      }
  
@@ -52,7 +52,7 @@ diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
 diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
 --- a/gcc/config/arm/arm-cpus.in	2020-07-22 23:35:17.340384509 -0700
 +++ b/gcc/config/arm/arm-cpus.in	2021-11-11 20:17:01.364573561 -0800
-@@ -190,6 +190,9 @@ define feature quirk_armv6kz
+@@ -186,6 +186,9 @@ define feature quirk_armv6kz
  # Cortex-M3 LDRD quirk.
  define feature quirk_cm3_ldrd
  
@@ -62,7 +62,7 @@ diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
  # Don't use .cpu assembly directive
  define feature quirk_no_asmcpu
  
-@@ -314,7 +317,7 @@ define fgroup DOTPROD	NEON dotprod
+@@ -322,7 +325,7 @@ define implied vfp_base MVE MVE_FP ALL_F
  # architectures.
  # xscale isn't really a 'quirk', but it isn't an architecture either and we
  # need to ignore it for matching purposes.
@@ -71,7 +71,7 @@ diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
  
  # Architecture entries
  # format:
-@@ -1492,6 +1495,7 @@ begin cpu cortex-m33
+@@ -1524,6 +1527,7 @@ begin cpu cortex-m33
   architecture armv8-m.main+dsp+fp
   option nofp remove ALL_FP
   option nodsp remove armv7em
@@ -79,7 +79,7 @@ diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
   costs v7m
  end cpu cortex-m33
  
-@@ -1501,6 +1505,7 @@ begin cpu cortex-m35p
+@@ -1533,6 +1537,7 @@ begin cpu cortex-m35p
   architecture armv8-m.main+dsp+fp
   option nofp remove ALL_FP
   option nodsp remove armv7em
@@ -87,10 +87,10 @@ diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
   costs v7m
  end cpu cortex-m35p
  
-@@ -1508,7 +1513,7 @@ begin cpu cortex-m55
-  cname cortexm55
-  tune flags LDSCHED
-  architecture armv8.1-m.main+mve.fp+fp.dp
+@@ -1544,7 +1549,7 @@ begin cpu cortex-m55
+  option nomve remove mve mve_float
+  option nofp remove ALL_FP mve_float
+  option nodsp remove MVE mve_float
 - isa quirk_no_asmcpu
 + isa quirk_no_asmcpu quirk_vlldm
   costs v7m
@@ -113,7 +113,7 @@ diff --git a/gcc/config/arm/arm.opt b/gcc/config/arm/arm.opt
 diff -upr a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
 --- a/gcc/doc/invoke.texi	2021-11-11 19:30:56.264523105 -0800
 +++ b/gcc/doc/invoke.texi	2021-11-11 20:16:19.769241739 -0800
-@@ -773,6 +773,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -774,6 +774,7 @@ Objective-C and Objective-C++ Dialects}.
  -mverbose-cost-dump @gol
  -mpure-code @gol
  -mcmse @gol
@@ -121,7 +121,7 @@ diff -upr a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
  -mfdpic}
  
  @emph{AVR Options}
-@@ -21233,6 +21234,14 @@ Use multiply and add/subtract instructio
+@@ -21266,6 +21267,14 @@ Use multiply and add/subtract instructio
  
  Do not use multiply and add/subtract instructions.
  
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
deleted file mode 100644
index c060accd99..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From fd2ec4542fd2975e6d3f2f1c1a2639945a84f9e1 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Mon, 3 Aug 2020 22:55:28 +0200
-Subject: [PATCH] aarch64: Fix up __aarch64_cas16_acq_rel fallback
-
-As mentioned in the PR, the fallback path when LSE is unavailable writes
-incorrect registers to the memory if the previous content compares equal
-to x0, x1 - it writes copy of x0, x1 from the start of function, but it
-should write x2, x3.
-
-2020-08-03  Jakub Jelinek  <jakub@redhat.com>
-
-	PR target/96402
-	* config/aarch64/lse.S (__aarch64_cas16_acq_rel): Use x2, x3 instead
-	of x(tmp0), x(tmp1) in STXP arguments.
-
-	* gcc.target/aarch64/pr96402.c: New test.
-
-(cherry picked from commit 90b43856fdff7d96d93d22970eca8a86c56e0ddc)
----
- gcc/testsuite/gcc.target/aarch64/pr96402.c | 16 ++++++++++++++++
- libgcc/config/aarch64/lse.S                |  2 +-
- 2 files changed, 17 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/pr96402.c
-
-diff --git a/gcc/testsuite/gcc.target/aarch64/pr96402.c b/gcc/testsuite/gcc.target/aarch64/pr96402.c
-new file mode 100644
-index 00000000000..fa2dddfac15
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/pr96402.c
-@@ -0,0 +1,16 @@
-+/* PR target/96402 */
-+/* { dg-do run { target int128 } } */
-+/* { dg-options "-moutline-atomics" } */
-+
-+int
-+main ()
-+{
-+  __int128 a = 0;
-+  __sync_val_compare_and_swap (&a, (__int128) 0, (__int128) 1);
-+  if (a != 1)
-+    __builtin_abort ();
-+  __sync_val_compare_and_swap (&a, (__int128) 1, (((__int128) 0xdeadbeeffeedbac1ULL) << 64) | 0xabadcafe00c0ffeeULL);
-+  if (a != ((((__int128) 0xdeadbeeffeedbac1ULL) << 64) | 0xabadcafe00c0ffeeULL))
-+    __builtin_abort ();
-+  return 0;
-+}
-diff --git a/libgcc/config/aarch64/lse.S b/libgcc/config/aarch64/lse.S
-index 64691c601c1..c8fbfbce4fd 100644
---- a/libgcc/config/aarch64/lse.S
-+++ b/libgcc/config/aarch64/lse.S
-@@ -203,7 +203,7 @@ STARTFN	NAME(cas)
- 	cmp		x0, x(tmp0)
- 	ccmp		x1, x(tmp1), #0, eq
- 	bne		1f
--	STXP		w(tmp2), x(tmp0), x(tmp1), [x4]
-+	STXP		w(tmp2), x2, x3, [x4]
- 	cbnz		w(tmp2), 0b
- 1:	ret
- 
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
deleted file mode 100644
index 73de4c7590..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-CVE: CVE-2020-13844
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 1ff243934ac443b5f58cd02a5012ce58ecc31fb2 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:58 +0100
-Subject: [PATCH 1/3] aarch64: New Straight Line Speculation (SLS) mitigation
- flags
-
-Here we introduce the flags that will be used for straight line speculation.
-
-The new flag introduced is `-mharden-sls=`.
-This flag can take arguments of `none`, `all`, or a comma seperated list of one
-or more of `retbr` or `blr`.
-`none` indicates no special mitigation of the straight line speculation
-vulnerability.
-`all` requests all mitigations currently implemented.
-`retbr` requests that the RET and BR instructions have a speculation barrier
-inserted after them.
-`blr` requests that BLR instructions are replaced by a BL to a function stub
-using a BR with a speculation barrier after it.
-
-Setting this on a per-function basis using attributes or the like is not
-enabled, but may be in the future.
-
-gcc/ChangeLog:
-
-2020-06-02  Matthew Malcomson  <matthew.malcomson@arm.com>
-
-	* config/aarch64/aarch64-protos.h (aarch64_harden_sls_retbr_p):
-	New.
-	(aarch64_harden_sls_blr_p): New.
-	* config/aarch64/aarch64.c (enum aarch64_sls_hardening_type):
-	New.
-	(aarch64_harden_sls_retbr_p): New.
-	(aarch64_harden_sls_blr_p): New.
-	(aarch64_validate_sls_mitigation): New.
-	(aarch64_override_options): Parse options for SLS mitigation.
-	* config/aarch64/aarch64.opt (-mharden-sls): New option.
-	* doc/invoke.texi: Document new option.
----
- gcc/config/aarch64/aarch64-protos.h |  3 ++
- gcc/config/aarch64/aarch64.c        | 76 +++++++++++++++++++++++++++++++++++++
- gcc/config/aarch64/aarch64.opt      |  4 ++
- gcc/doc/invoke.texi                 | 12 ++++++
- 4 files changed, 95 insertions(+)
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index 723d9ba..eb5f4b4 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -781,4 +781,7 @@ extern const atomic_ool_names aarch64_ool_ldeor_names;
- 
- tree aarch64_resolve_overloaded_builtin_general (location_t, tree, void *);
- 
-+extern bool aarch64_harden_sls_retbr_p (void);
-+extern bool aarch64_harden_sls_blr_p (void);
-+
- #endif /* GCC_AARCH64_PROTOS_H */
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index b86434a..437a9cf 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -14494,6 +14494,79 @@ aarch64_validate_mcpu (const char *str, const struct processor **res,
-   return false;
- }
- 
-+/* Straight line speculation indicators.  */
-+enum aarch64_sls_hardening_type
-+{
-+  SLS_NONE = 0,
-+  SLS_RETBR = 1,
-+  SLS_BLR = 2,
-+  SLS_ALL = 3,
-+};
-+static enum aarch64_sls_hardening_type aarch64_sls_hardening;
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the RET
-+   and BR instructions.  */
-+bool
-+aarch64_harden_sls_retbr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_RETBR;
-+}
-+
-+/* Return whether we should mitigatate Straight Line Speculation for the BLR
-+   instruction.  */
-+bool
-+aarch64_harden_sls_blr_p (void)
-+{
-+  return aarch64_sls_hardening & SLS_BLR;
-+}
-+
-+/* As of yet we only allow setting these options globally, in the future we may
-+   allow setting them per function.  */
-+static void
-+aarch64_validate_sls_mitigation (const char *const_str)
-+{
-+  char *token_save = NULL;
-+  char *str = NULL;
-+
-+  if (strcmp (const_str, "none") == 0)
-+    {
-+      aarch64_sls_hardening = SLS_NONE;
-+      return;
-+    }
-+  if (strcmp (const_str, "all") == 0)
-+    {
-+      aarch64_sls_hardening = SLS_ALL;
-+      return;
-+    }
-+
-+  char *str_root = xstrdup (const_str);
-+  str = strtok_r (str_root, ",", &token_save);
-+  if (!str)
-+    error ("invalid argument given to %<-mharden-sls=%>");
-+
-+  int temp = SLS_NONE;
-+  while (str)
-+    {
-+      if (strcmp (str, "blr") == 0)
-+	temp |= SLS_BLR;
-+      else if (strcmp (str, "retbr") == 0)
-+	temp |= SLS_RETBR;
-+      else if (strcmp (str, "none") == 0 || strcmp (str, "all") == 0)
-+	{
-+	  error ("%<%s%> must be by itself for %<-mharden-sls=%>", str);
-+	  break;
-+	}
-+      else
-+	{
-+	  error ("invalid argument %<%s%> for %<-mharden-sls=%>", str);
-+	  break;
-+	}
-+      str = strtok_r (NULL, ",", &token_save);
-+    }
-+  aarch64_sls_hardening = (aarch64_sls_hardening_type) temp;
-+  free (str_root);
-+}
-+
- /* Parses CONST_STR for branch protection features specified in
-    aarch64_branch_protect_types, and set any global variables required.  Returns
-    the parsing result and assigns LAST_STR to the last processed token from
-@@ -14738,6 +14811,9 @@ aarch64_override_options (void)
-   selected_arch = NULL;
-   selected_tune = NULL;
- 
-+  if (aarch64_harden_sls_string)
-+    aarch64_validate_sls_mitigation (aarch64_harden_sls_string);
-+
-   if (aarch64_branch_protection_string)
-     aarch64_validate_mbranch_protection (aarch64_branch_protection_string);
- 
-diff --git a/gcc/config/aarch64/aarch64.opt b/gcc/config/aarch64/aarch64.opt
-index d99d14c..5170361 100644
---- a/gcc/config/aarch64/aarch64.opt
-+++ b/gcc/config/aarch64/aarch64.opt
-@@ -71,6 +71,10 @@ mgeneral-regs-only
- Target Report RejectNegative Mask(GENERAL_REGS_ONLY) Save
- Generate code which uses only the general registers.
- 
-+mharden-sls=
-+Target RejectNegative Joined Var(aarch64_harden_sls_string)
-+Generate code to mitigate against straight line speculation.
-+
- mfix-cortex-a53-835769
- Target Report Var(aarch64_fix_a53_err835769) Init(2) Save
- Workaround for ARM Cortex-A53 Erratum number 835769.
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index a2794a6..bd5b77a 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -696,6 +696,7 @@ Objective-C and Objective-C++ Dialects}.
- -msign-return-address=@var{scope} @gol
- -mbranch-protection=@var{none}|@var{standard}|@var{pac-ret}[+@var{leaf}
- +@var{b-key}]|@var{bti} @gol
-+-mharden-sls=@var{opts} @gol
- -march=@var{name}  -mcpu=@var{name}  -mtune=@var{name}  @gol
- -moverride=@var{string}  -mverbose-cost-dump @gol
- -mstack-protector-guard=@var{guard} -mstack-protector-guard-reg=@var{sysreg} @gol
-@@ -17065,6 +17066,17 @@ functions.  The optional argument @samp{b-key} can be used to sign the functions
- with the B-key instead of the A-key.
- @samp{bti} turns on branch target identification mechanism.
- 
-+@item -mharden-sls=@var{opts}
-+@opindex mharden-sls
-+Enable compiler hardening against straight line speculation (SLS).
-+@var{opts} is a comma-separated list of the following options:
-+@table @samp
-+@item retbr
-+@item blr
-+@end table
-+In addition, @samp{-mharden-sls=all} enables all SLS hardening while
-+@samp{-mharden-sls=none} disables all SLS hardening.
-+
- @item -msve-vector-bits=@var{bits}
- @opindex msve-vector-bits
- Specify the number of bits in an SVE vector register.  This option only has
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch b/meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
deleted file mode 100644
index 823cc8b668..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
+++ /dev/null
@@ -1,607 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b1204d16e1ec96a4aa89e44de8990e2499ffdb22 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 2/3] aarch64: Introduce SLS mitigation for RET and BR
- instructions
-
-Instructions following RET or BR are not necessarily executed.  In order
-to avoid speculation past RET and BR we can simply append a speculation
-barrier.
-
-Since these speculation barriers will not be architecturally executed,
-they are not expected to add a high performance penalty.
-
-The speculation barrier is to be SB when targeting architectures which
-have this enabled, and DSB SY + ISB otherwise.
-
-We add tests for each of the cases where such an instruction was seen.
-
-This is implemented by modifying each machine description pattern that
-emits either a RET or a BR instruction.  We choose not to use something
-like `TARGET_ASM_FUNCTION_EPILOGUE` since it does not affect the
-`indirect_jump`, `jump`, `sibcall_insn` and `sibcall_value_insn`
-patterns and we find it preferable to implement the functionality in the
-same way for every pattern.
-
-There is one particular case which is slightly tricky.  The
-implementation of TARGET_ASM_TRAMPOLINE_TEMPLATE uses a BR which needs
-to be mitigated against.  The trampoline template is used *once* per
-compilation unit, and the TRAMPOLINE_SIZE is exposed to the user via the
-builtin macro __LIBGCC_TRAMPOLINE_SIZE__.
-In the future we may implement function specific attributes to turn on
-and off hardening on a per-function basis.
-The fixed nature of the trampoline described above implies it will be
-safer to ensure this speculation barrier is always used.
-
-Testing:
-  Bootstrap and regtest done on aarch64-none-linux
-  Used a temporary hack(1) to use these options on every test in the
-  testsuite and a script to check that the output never emitted an
-  unmitigated RET or BR.
-
-1) Temporary hack was a change to the testsuite to always use
-`-save-temps` and run a script on the assembly output of those
-compilations which produced one to ensure every RET or BR is immediately
-followed by a speculation barrier.
-
-gcc/ChangeLog:
-
-	* config/aarch64/aarch64-protos.h (aarch64_sls_barrier): New.
-	* config/aarch64/aarch64.c (aarch64_output_casesi): Emit
-	speculation barrier after BR instruction if needs be.
-	(aarch64_trampoline_init): Handle ptr_mode value & adjust size
-	of code copied.
-	(aarch64_sls_barrier): New.
-	(aarch64_asm_trampoline_template): Add needed barriers.
-	* config/aarch64/aarch64.h (AARCH64_ISA_SB): New.
-	(TARGET_SB): New.
-	(TRAMPOLINE_SIZE): Account for barrier.
-	* config/aarch64/aarch64.md (indirect_jump, *casesi_dispatch,
-	simple_return, *do_return, *sibcall_insn, *sibcall_value_insn):
-	Emit barrier if needs be, also account for possible barrier using
-	"sls_length" attribute.
-	(sls_length): New attribute.
-	(length): Determine default using any non-default sls_length
-	value.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c: New test.
-	* gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c:
-	New test.
-	* gcc.target/aarch64/sls-mitigation/sls-mitigation.exp: New file.
-	* lib/target-supports.exp (check_effective_target_aarch64_asm_sb_ok):
-	New proc.
----
- gcc/config/aarch64/aarch64-protos.h                |   1 +
- gcc/config/aarch64/aarch64.c                       |  41 ++++++-
- gcc/config/aarch64/aarch64.h                       |  10 +-
- gcc/config/aarch64/aarch64.md                      |  76 +++++++++----
- .../aarch64/sls-mitigation/sls-miti-retbr-pacret.c |  21 ++++
- .../aarch64/sls-mitigation/sls-miti-retbr.c        | 119 +++++++++++++++++++++
- .../aarch64/sls-mitigation/sls-mitigation.exp      |  73 +++++++++++++
- gcc/testsuite/lib/target-supports.exp              |   2 +-
- 8 files changed, 318 insertions(+), 25 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index eb5f4b4..ee0ffde 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -781,6 +781,7 @@ extern const atomic_ool_names aarch64_ool_ldeor_names;
- 
- tree aarch64_resolve_overloaded_builtin_general (location_t, tree, void *);
- 
-+const char *aarch64_sls_barrier (int);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
- 
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 437a9cf..44e3d1f 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -10852,8 +10852,8 @@ aarch64_return_addr (int count, rtx frame ATTRIBUTE_UNUSED)
- static void
- aarch64_asm_trampoline_template (FILE *f)
- {
--  int offset1 = 16;
--  int offset2 = 20;
-+  int offset1 = 24;
-+  int offset2 = 28;
- 
-   if (aarch64_bti_enabled ())
-     {
-@@ -10876,6 +10876,17 @@ aarch64_asm_trampoline_template (FILE *f)
-     }
-   asm_fprintf (f, "\tbr\t%s\n", reg_names [IP1_REGNUM]);
- 
-+  /* We always emit a speculation barrier.
-+     This is because the same trampoline template is used for every nested
-+     function.  Since nested functions are not particularly common or
-+     performant we don't worry too much about the extra instructions to copy
-+     around.
-+     This is not yet a problem, since we have not yet implemented function
-+     specific attributes to choose between hardening against straight line
-+     speculation or not, but such function specific attributes are likely to
-+     happen in the future.  */
-+  asm_fprintf (f, "\tdsb\tsy\n\tisb\n");
-+
-   /* The trampoline needs an extra padding instruction.  In case if BTI is
-      enabled the padding instruction is replaced by the BTI instruction at
-      the beginning.  */
-@@ -10890,10 +10901,14 @@ static void
- aarch64_trampoline_init (rtx m_tramp, tree fndecl, rtx chain_value)
- {
-   rtx fnaddr, mem, a_tramp;
--  const int tramp_code_sz = 16;
-+  const int tramp_code_sz = 24;
- 
-   /* Don't need to copy the trailing D-words, we fill those in below.  */
--  emit_block_move (m_tramp, assemble_trampoline_template (),
-+  /* We create our own memory address in Pmode so that `emit_block_move` can
-+     use parts of the backend which expect Pmode addresses.  */
-+  rtx temp = convert_memory_address (Pmode, XEXP (m_tramp, 0));
-+  emit_block_move (gen_rtx_MEM (BLKmode, temp),
-+		   assemble_trampoline_template (),
- 		   GEN_INT (tramp_code_sz), BLOCK_OP_NORMAL);
-   mem = adjust_address (m_tramp, ptr_mode, tramp_code_sz);
-   fnaddr = XEXP (DECL_RTL (fndecl), 0);
-@@ -11084,6 +11099,8 @@ aarch64_output_casesi (rtx *operands)
-   output_asm_insn (buf, operands);
-   output_asm_insn (patterns[index][1], operands);
-   output_asm_insn ("br\t%3", operands);
-+  output_asm_insn (aarch64_sls_barrier (aarch64_harden_sls_retbr_p ()),
-+		   operands);
-   assemble_label (asm_out_file, label);
-   return "";
- }
-@@ -22924,6 +22941,22 @@ aarch64_file_end_indicate_exec_stack ()
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_BTI
- #undef GNU_PROPERTY_AARCH64_FEATURE_1_AND
- 
-+/* Helper function for straight line speculation.
-+   Return what barrier should be emitted for straight line speculation
-+   mitigation.
-+   When not mitigating against straight line speculation this function returns
-+   an empty string.
-+   When mitigating against straight line speculation, use:
-+   * SB when the v8.5-A SB extension is enabled.
-+   * DSB+ISB otherwise.  */
-+const char *
-+aarch64_sls_barrier (int mitigation_required)
-+{
-+  return mitigation_required
-+    ? (TARGET_SB ? "sb" : "dsb\tsy\n\tisb")
-+    : "";
-+}
-+
- /* Target-specific selftests.  */
- 
- #if CHECKING_P
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 1ce23c6..c21015f 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -281,6 +281,7 @@ extern unsigned aarch64_architecture_version;
- #define AARCH64_ISA_F32MM	   (aarch64_isa_flags & AARCH64_FL_F32MM)
- #define AARCH64_ISA_F64MM	   (aarch64_isa_flags & AARCH64_FL_F64MM)
- #define AARCH64_ISA_BF16	   (aarch64_isa_flags & AARCH64_FL_BF16)
-+#define AARCH64_ISA_SB  	   (aarch64_isa_flags & AARCH64_FL_SB)
- 
- /* Crypto is an optional extension to AdvSIMD.  */
- #define TARGET_CRYPTO (TARGET_SIMD && AARCH64_ISA_CRYPTO)
-@@ -378,6 +379,9 @@ extern unsigned aarch64_architecture_version;
- #define TARGET_FIX_ERR_A53_835769_DEFAULT 1
- #endif
- 
-+/* SB instruction is enabled through +sb.  */
-+#define TARGET_SB (AARCH64_ISA_SB)
-+
- /* Apply the workaround for Cortex-A53 erratum 835769.  */
- #define TARGET_FIX_ERR_A53_835769	\
-   ((aarch64_fix_a53_err835769 == 2)	\
-@@ -1058,8 +1062,10 @@ typedef struct
- 
- #define RETURN_ADDR_RTX aarch64_return_addr
- 
--/* BTI c + 3 insns + 2 pointer-sized entries.  */
--#define TRAMPOLINE_SIZE	(TARGET_ILP32 ? 24 : 32)
-+/* BTI c + 3 insns
-+   + sls barrier of DSB + ISB.
-+   + 2 pointer-sized entries.  */
-+#define TRAMPOLINE_SIZE	(24 + (TARGET_ILP32 ? 8 : 16))
- 
- /* Trampolines contain dwords, so must be dword aligned.  */
- #define TRAMPOLINE_ALIGNMENT 64
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index 8c8be3c..dda04ee 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -407,10 +407,25 @@
- ;; Attribute that specifies whether the alternative uses MOVPRFX.
- (define_attr "movprfx" "no,yes" (const_string "no"))
- 
-+;; Attribute to specify that an alternative has the length of a single
-+;; instruction plus a speculation barrier.
-+(define_attr "sls_length" "none,retbr,casesi" (const_string "none"))
-+
- (define_attr "length" ""
-   (cond [(eq_attr "movprfx" "yes")
-            (const_int 8)
--        ] (const_int 4)))
-+
-+	 (eq_attr "sls_length" "retbr")
-+	   (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int 4)
-+		  (match_test "TARGET_SB") (const_int 8)]
-+		 (const_int 12))
-+
-+	 (eq_attr "sls_length" "casesi")
-+	   (cond [(match_test "!aarch64_harden_sls_retbr_p ()") (const_int 16)
-+		  (match_test "TARGET_SB") (const_int 20)]
-+		 (const_int 24))
-+	]
-+	  (const_int 4)))
- 
- ;; Strictly for compatibility with AArch32 in pipeline models, since AArch64 has
- ;; no predicated insns.
-@@ -447,8 +462,12 @@
- (define_insn "indirect_jump"
-   [(set (pc) (match_operand:DI 0 "register_operand" "r"))]
-   ""
--  "br\\t%0"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("br\\t%0", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_insn "jump"
-@@ -765,7 +784,7 @@
-   "*
-   return aarch64_output_casesi (operands);
-   "
--  [(set_attr "length" "16")
-+  [(set_attr "sls_length" "casesi")
-    (set_attr "type" "branch")]
- )
- 
-@@ -844,18 +863,23 @@
-   [(return)]
-   ""
-   {
-+    const char *ret = NULL;
-     if (aarch64_return_address_signing_enabled ()
- 	&& TARGET_ARMV8_3
- 	&& !crtl->calls_eh_return)
-       {
- 	if (aarch64_ra_sign_key == AARCH64_KEY_B)
--	  return "retab";
-+	  ret = "retab";
- 	else
--	  return "retaa";
-+	  ret = "retaa";
-       }
--    return "ret";
-+    else
-+      ret = "ret";
-+    output_asm_insn (ret, operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-   }
--  [(set_attr "type" "branch")]
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_expand "return"
-@@ -867,8 +891,12 @@
- (define_insn "simple_return"
-   [(simple_return)]
-   ""
--  "ret"
--  [(set_attr "type" "branch")]
-+  {
-+    output_asm_insn ("ret", operands);
-+    return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+  }
-+  [(set_attr "type" "branch")
-+   (set_attr "sls_length" "retbr")]
- )
- 
- (define_insn "*cb<optab><mode>1"
-@@ -1066,10 +1094,16 @@
-    (unspec:DI [(match_operand:DI 2 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%0
--   b\\t%c0"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative == 0)
-+      {
-+	output_asm_insn ("br\\t%0", operands);
-+	return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c0";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
- 
- (define_insn "*sibcall_value_insn"
-@@ -1080,10 +1114,16 @@
-    (unspec:DI [(match_operand:DI 3 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (return)]
-   "SIBLING_CALL_P (insn)"
--  "@
--   br\\t%1
--   b\\t%c1"
--  [(set_attr "type" "branch, branch")]
-+  {
-+    if (which_alternative == 0)
-+      {
-+	output_asm_insn ("br\\t%1", operands);
-+	return aarch64_sls_barrier (aarch64_harden_sls_retbr_p ());
-+      }
-+    return "b\\t%c1";
-+  }
-+  [(set_attr "type" "branch, branch")
-+   (set_attr "sls_length" "retbr,none")]
- )
- 
- ;; Call subroutine returning any type.
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
-new file mode 100644
-index 0000000..fa1887a
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr-pacret.c
-@@ -0,0 +1,21 @@
-+/* Avoid ILP32 since pacret is only available for LP64 */
-+/* { dg-do compile { target { ! ilp32 } } } */
-+/* { dg-additional-options "-mharden-sls=retbr -mbranch-protection=pac-ret -march=armv8.3-a" } */
-+
-+/* Testing the do_return pattern for retaa and retab.  */
-+long retbr_subcall(void);
-+long retbr_do_return_retaa(void)
-+{
-+    return retbr_subcall()+1;
-+}
-+
-+__attribute__((target("branch-protection=pac-ret+b-key")))
-+long retbr_do_return_retab(void)
-+{
-+    return retbr_subcall()+1;
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly followed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa|retab)\tx[0-9][0-9]?\n\t(?!dsb\tsy\n\tisb)} } } */
-+/* { dg-final { scan-assembler-not {ret\t} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-new file mode 100644
-index 0000000..76b8d03
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-retbr.c
-@@ -0,0 +1,119 @@
-+/* We ensure that -Wpedantic is off since it complains about the trampolines
-+   we explicitly want to test.  */
-+/* { dg-additional-options "-mharden-sls=retbr -Wno-pedantic " } */
-+/*
-+   Ensure that the SLS hardening of RET and BR leaves no unprotected RET/BR
-+   instructions.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+int
-+retbr_sibcall_value_insn (struct sls_testclass x)
-+{
-+  return x.x(x.left, x.right);
-+}
-+
-+void
-+retbr_sibcall_insn (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+}
-+
-+/* Aim to test two different returns.
-+   One that introduces a tail call in the middle of the function, and one that
-+   has a normal return.  */
-+int
-+retbr_multiple_returns (struct sls_testclass x)
-+{
-+  int temp;
-+  if (x.left % 10)
-+    return x.x(x.left, 100);
-+  else if (x.right % 20)
-+    {
-+      return x.x(x.left * x.right, 100);
-+    }
-+  temp = x.left % x.right;
-+  temp *= 100;
-+  temp /= 2;
-+  return temp % 3;
-+}
-+
-+void
-+retbr_multiple_returns_void (struct sls_testclass x)
-+{
-+  if (x.left % 10)
-+    {
-+      x.y(x.left, 100);
-+    }
-+  else if (x.right % 20)
-+    {
-+      x.y(x.left * x.right, 100);
-+    }
-+  return;
-+}
-+
-+/* Testing the casesi jump via register.  */
-+__attribute__ ((optimize ("Os")))
-+int
-+retbr_casesi_dispatch (struct sls_testclass x)
-+{
-+  switch (x.left)
-+    {
-+    case -5:
-+      return -2;
-+    case -3:
-+      return -1;
-+    case 0:
-+      return 0;
-+    case 3:
-+      return 1;
-+    case 5:
-+      break;
-+    default:
-+      __builtin_unreachable ();
-+    }
-+  return x.right;
-+}
-+
-+/* Testing the BR in trampolines is mitigated against.  */
-+void f1 (void *);
-+void f3 (void *, void (*)(void *));
-+void f2 (void *);
-+
-+int
-+retbr_trampolines (void *a, int b)
-+{
-+  if (!b)
-+    {
-+      f1 (a);
-+      return 1;
-+    }
-+  if (b)
-+    {
-+      void retbr_tramp_internal (void *c)
-+      {
-+	if (c == a)
-+	  f2 (c);
-+      }
-+      f3 (a, retbr_tramp_internal);
-+    }
-+  return 0;
-+}
-+
-+/* Testing the indirect_jump pattern.  */
-+void
-+retbr_indirect_jump (int *buf)
-+{
-+  __builtin_longjmp(buf, 1);
-+}
-+
-+/* Ensure there are no BR or RET instructions which are not directly followed
-+   by a speculation barrier.  */
-+/* { dg-final { scan-assembler-not {\t(br|ret|retaa|retab)\tx[0-9][0-9]?\n\t(?!dsb\tsy\n\tisb|sb)} } } */
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-new file mode 100644
-index 0000000..8122503
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-mitigation.exp
-@@ -0,0 +1,73 @@
-+#  Regression driver for SLS mitigation on AArch64.
-+#  Copyright (C) 2020 Free Software Foundation, Inc.
-+#  Contributed by ARM Ltd.
-+#
-+#  This file is part of GCC.
-+#
-+#  GCC is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU General Public License as published by
-+#  the Free Software Foundation; either version 3, or (at your option)
-+#  any later version.
-+#
-+#  GCC is distributed in the hope that it will be useful, but
-+#  WITHOUT ANY WARRANTY; without even the implied warranty of
-+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+#  General Public License for more details.
-+#
-+#  You should have received a copy of the GNU General Public License
-+#  along with GCC; see the file COPYING3.  If not see
-+#  <http://www.gnu.org/licenses/>.  */
-+
-+# Exit immediately if this isn't an AArch64 target.
-+if {![istarget aarch64*-*-*] } then {
-+  return
-+}
-+
-+# Load support procs.
-+load_lib gcc-dg.exp
-+load_lib torture-options.exp
-+
-+# If a testcase doesn't have special options, use these.
-+global DEFAULT_CFLAGS
-+if ![info exists DEFAULT_CFLAGS] then {
-+    set DEFAULT_CFLAGS " "
-+}
-+
-+# Initialize `dg'.
-+dg-init
-+torture-init
-+
-+# Use different architectures as well as the normal optimisation options.
-+# (i.e. use both SB and DSB+ISB barriers).
-+
-+set save-dg-do-what-default ${dg-do-what-default}
-+# Main loop.
-+# Run with torture tests (i.e. a bunch of different optimisation levels) just
-+# to increase test coverage.
-+set dg-do-what-default assemble
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+	"-save-temps" $DEFAULT_CFLAGS
-+
-+# Run the same tests but this time with SB extension.
-+# Since not all supported assemblers will support that extension we decide
-+# whether to assemble or just compile based on whether the extension is
-+# supported for the available assembler.
-+
-+set templist {}
-+foreach x $DG_TORTURE_OPTIONS {
-+  lappend templist "$x -march=armv8.3-a+sb "
-+  lappend templist "$x -march=armv8-a+sb "
-+}
-+set-torture-options $templist
-+if { [check_effective_target_aarch64_asm_sb_ok] } {
-+    set dg-do-what-default assemble
-+} else {
-+    set dg-do-what-default compile
-+}
-+gcc-dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/*.\[cCS\]]] \
-+	"-save-temps" $DEFAULT_CFLAGS
-+set dg-do-what-default ${save-dg-do-what-default}
-+
-+# All done.
-+torture-finish
-+dg-finish
-diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index 8a186dd..9d2e093 100644
---- a/gcc/testsuite/lib/target-supports.exp
-+++ b/gcc/testsuite/lib/target-supports.exp
-@@ -9432,7 +9432,7 @@ proc check_effective_target_aarch64_tiny { } {
- # various architecture extensions via the .arch_extension pseudo-op.
- 
- foreach { aarch64_ext } { "fp" "simd" "crypto" "crc" "lse" "dotprod" "sve"
--			  "i8mm" "f32mm" "f64mm" "bf16" } {
-+			  "i8mm" "f32mm" "f64mm" "bf16" "sb" } {
-     eval [string map [list FUNC $aarch64_ext] {
- 	proc check_effective_target_aarch64_asm_FUNC_ok { } {
- 	  if { [istarget aarch64*-*-*] } {
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch b/meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
deleted file mode 100644
index 716a367172..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
+++ /dev/null
@@ -1,658 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From a5e7efc40ed841934c1d913f39476afa17d8e5f7 Mon Sep 17 00:00:00 2001
-From: Matthew Malcomson <matthew.malcomson@arm.com>
-Date: Thu, 9 Jul 2020 09:11:59 +0100
-Subject: [PATCH 3/3] aarch64: Mitigate SLS for BLR instruction
-
-This patch introduces the mitigation for Straight Line Speculation past
-the BLR instruction.
-
-This mitigation replaces BLR instructions with a BL to a stub which uses
-a BR to jump to the original value.  These function stubs are then
-appended with a speculation barrier to ensure no straight line
-speculation happens after these jumps.
-
-When optimising for speed we use a set of stubs for each function since
-this should help the branch predictor make more accurate predictions
-about where a stub should branch.
-
-When optimising for size we use one set of stubs for all functions.
-This set of stubs can have human readable names, and we are using
-`__call_indirect_x<N>` for register x<N>.
-
-When BTI branch protection is enabled the BLR instruction can jump to a
-`BTI c` instruction using any register, while the BR instruction can
-only jump to a `BTI c` instruction using the x16 or x17 registers.
-Hence, in order to ensure this transformation is safe we mov the value
-of the original register into x16 and use x16 for the BR.
-
-As an example when optimising for size:
-a
-    BLR x0
-instruction would get transformed to something like
-    BL __call_indirect_x0
-where __call_indirect_x0 labels a thunk that contains
-__call_indirect_x0:
-    MOV X16, X0
-    BR X16
-    <speculation barrier>
-
-The first version of this patch used local symbols specific to a
-compilation unit to try and avoid relocations.
-This was mistaken since functions coming from the same compilation unit
-can still be in different sections, and the assembler will insert
-relocations at jumps between sections.
-
-On any relocation the linker is permitted to emit a veneer to handle
-jumps between symbols that are very far apart.  The registers x16 and
-x17 may be clobbered by these veneers.
-Hence the function stubs cannot rely on the values of x16 and x17 being
-the same as just before the function stub is called.
-
-Similar can be said for the hot/cold partitioning of single functions,
-so function-local stubs have the same restriction.
-
-This updated version of the patch never emits function stubs for x16 and
-x17, and instead forces other registers to be used.
-
-Given the above, there is now no benefit to local symbols (since they
-are not enough to avoid dealing with linker intricacies).  This patch
-now uses global symbols with hidden visibility each stored in their own
-COMDAT section.  This means stubs can be shared between compilation
-units while still avoiding the PLT indirection.
-
-This patch also removes the `__call_indirect_x30` stub (and
-function-local equivalent) which would simply jump back to the original
-location.
-
-The function-local stubs are emitted to the assembly output file in one
-chunk, which means we need not add the speculation barrier directly
-after each one.
-This is because we know for certain that the instructions directly after
-the BR in all but the last function stub will be from another one of
-these stubs and hence will not contain a speculation gadget.
-Instead we add a speculation barrier at the end of the sequence of
-stubs.
-
-The global stubs are emitted in COMDAT/.linkonce sections by
-themselves so that the linker can remove duplicates from multiple object
-files.  This means they are not emitted in one chunk, and each one must
-include the speculation barrier.
-
-Another difference is that since the global stubs are shared across
-compilation units we do not know that all functions will be targeting an
-architecture supporting the SB instruction.
-Rather than provide multiple stubs for each architecture, we provide a
-stub that will work for all architectures -- using the DSB+ISB barrier.
-
-This mitigation does not apply for BLR instructions in the following
-places:
-- Some accesses to thread-local variables use a code sequence with a BLR
-  instruction.  This code sequence is part of the binary interface between
-  compiler and linker. If this BLR instruction needs to be mitigated, it'd
-  probably be best to do so in the linker. It seems that the code sequence
-  for thread-local variable access is unlikely to lead to a Spectre Revalation
-  Gadget.
-- PLT stubs are produced by the linker and each contain a BLR instruction.
-  It seems that at most only after the last PLT stub a Spectre Revalation
-  Gadget might appear.
-
-Testing:
-  Bootstrap and regtest on AArch64
-    (with BOOT_CFLAGS="-mharden-sls=retbr,blr")
-  Used a temporary hack(1) in gcc-dg.exp to use these options on every
-  test in the testsuite, a slight modification to emit the speculation
-  barrier after every function stub, and a script to check that the
-  output never emitted a BLR, or unmitigated BR or RET instruction.
-  Similar on an aarch64-none-elf cross-compiler.
-
-1) Temporary hack emitted a speculation barrier at the end of every stub
-function, and used a script to ensure that:
-  a) Every RET or BR is immediately followed by a speculation barrier.
-  b) No BLR instruction is emitted by compiler.
-
-gcc/ChangeLog:
-
-	* config/aarch64/aarch64-protos.h (aarch64_indirect_call_asm):
-	New declaration.
-	* config/aarch64/aarch64.c (aarch64_regno_regclass): Handle new
-	stub registers class.
-	(aarch64_class_max_nregs): Likewise.
-	(aarch64_register_move_cost): Likewise.
-	(aarch64_sls_shared_thunks): Global array to store stub labels.
-	(aarch64_sls_emit_function_stub): New.
-	(aarch64_create_blr_label): New.
-	(aarch64_sls_emit_blr_function_thunks): New.
-	(aarch64_sls_emit_shared_blr_thunks): New.
-	(aarch64_asm_file_end): New.
-	(aarch64_indirect_call_asm): New.
-	(TARGET_ASM_FILE_END): Use aarch64_asm_file_end.
-	(TARGET_ASM_FUNCTION_EPILOGUE): Use
-	aarch64_sls_emit_blr_function_thunks.
-	* config/aarch64/aarch64.h (STB_REGNUM_P): New.
-	(enum reg_class): Add STUB_REGS class.
-	(machine_function): Introduce `call_via` array for
-	function-local stub labels.
-	* config/aarch64/aarch64.md (*call_insn, *call_value_insn): Use
-	aarch64_indirect_call_asm to emit code when hardening BLR
-	instructions.
-	* config/aarch64/constraints.md (Ucr): New constraint
-	representing registers for indirect calls.  Is GENERAL_REGS
-	usually, and STUB_REGS when hardening BLR instruction against
-	SLS.
-	* config/aarch64/predicates.md (aarch64_general_reg): STUB_REGS class
-	is also a general register.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c: New test.
-	* gcc.target/aarch64/sls-mitigation/sls-miti-blr.c: New test.
----
- gcc/config/aarch64/aarch64-protos.h                |   1 +
- gcc/config/aarch64/aarch64.c                       | 225 ++++++++++++++++++++-
- gcc/config/aarch64/aarch64.h                       |  15 ++
- gcc/config/aarch64/aarch64.md                      |  11 +-
- gcc/config/aarch64/constraints.md                  |   9 +
- gcc/config/aarch64/predicates.md                   |   3 +-
- .../aarch64/sls-mitigation/sls-miti-blr-bti.c      |  40 ++++
- .../aarch64/sls-mitigation/sls-miti-blr.c          |  33 +++
- 8 files changed, 328 insertions(+), 9 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
- create mode 100644 gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-
-diff --git a/gcc/config/aarch64/aarch64-protos.h b/gcc/config/aarch64/aarch64-protos.h
-index ee0ffde..839f801 100644
---- a/gcc/config/aarch64/aarch64-protos.h
-+++ b/gcc/config/aarch64/aarch64-protos.h
-@@ -782,6 +782,7 @@ extern const atomic_ool_names aarch64_ool_ldeor_names;
- tree aarch64_resolve_overloaded_builtin_general (location_t, tree, void *);
- 
- const char *aarch64_sls_barrier (int);
-+const char *aarch64_indirect_call_asm (rtx);
- extern bool aarch64_harden_sls_retbr_p (void);
- extern bool aarch64_harden_sls_blr_p (void);
- 
-diff --git a/gcc/config/aarch64/aarch64.c b/gcc/config/aarch64/aarch64.c
-index 2389d49..0f7bba3 100644
---- a/gcc/config/aarch64/aarch64.c
-+++ b/gcc/config/aarch64/aarch64.c
-@@ -10605,6 +10605,9 @@ aarch64_label_mentioned_p (rtx x)
- enum reg_class
- aarch64_regno_regclass (unsigned regno)
- {
-+  if (STUB_REGNUM_P (regno))
-+    return STUB_REGS;
-+
-   if (GP_REGNUM_P (regno))
-     return GENERAL_REGS;
- 
-@@ -10939,6 +10942,7 @@ aarch64_class_max_nregs (reg_class_t regclass, machine_mode mode)
-   unsigned int nregs, vec_flags;
-   switch (regclass)
-     {
-+    case STUB_REGS:
-     case TAILCALL_ADDR_REGS:
-     case POINTER_REGS:
-     case GENERAL_REGS:
-@@ -13155,10 +13159,12 @@ aarch64_register_move_cost (machine_mode mode,
-     = aarch64_tune_params.regmove_cost;
- 
-   /* Caller save and pointer regs are equivalent to GENERAL_REGS.  */
--  if (to == TAILCALL_ADDR_REGS || to == POINTER_REGS)
-+  if (to == TAILCALL_ADDR_REGS || to == POINTER_REGS
-+      || to == STUB_REGS)
-     to = GENERAL_REGS;
- 
--  if (from == TAILCALL_ADDR_REGS || from == POINTER_REGS)
-+  if (from == TAILCALL_ADDR_REGS || from == POINTER_REGS
-+      || from == STUB_REGS)
-     from = GENERAL_REGS;
- 
-   /* Make RDFFR very expensive.  In particular, if we know that the FFR
-@@ -22957,6 +22963,215 @@ aarch64_sls_barrier (int mitigation_required)
-     : "";
- }
- 
-+static GTY (()) tree aarch64_sls_shared_thunks[30];
-+static GTY (()) bool aarch64_sls_shared_thunks_needed = false;
-+const char *indirect_symbol_names[30] = {
-+    "__call_indirect_x0",
-+    "__call_indirect_x1",
-+    "__call_indirect_x2",
-+    "__call_indirect_x3",
-+    "__call_indirect_x4",
-+    "__call_indirect_x5",
-+    "__call_indirect_x6",
-+    "__call_indirect_x7",
-+    "__call_indirect_x8",
-+    "__call_indirect_x9",
-+    "__call_indirect_x10",
-+    "__call_indirect_x11",
-+    "__call_indirect_x12",
-+    "__call_indirect_x13",
-+    "__call_indirect_x14",
-+    "__call_indirect_x15",
-+    "", /* "__call_indirect_x16",  */
-+    "", /* "__call_indirect_x17",  */
-+    "__call_indirect_x18",
-+    "__call_indirect_x19",
-+    "__call_indirect_x20",
-+    "__call_indirect_x21",
-+    "__call_indirect_x22",
-+    "__call_indirect_x23",
-+    "__call_indirect_x24",
-+    "__call_indirect_x25",
-+    "__call_indirect_x26",
-+    "__call_indirect_x27",
-+    "__call_indirect_x28",
-+    "__call_indirect_x29",
-+};
-+
-+/* Function to create a BLR thunk.  This thunk is used to mitigate straight
-+   line speculation.  Instead of a simple BLR that can be speculated past,
-+   we emit a BL to this thunk, and this thunk contains a BR to the relevant
-+   register.  These thunks have the relevant speculation barries put after
-+   their indirect branch so that speculation is blocked.
-+
-+   We use such a thunk so the speculation barriers are kept off the
-+   architecturally executed path in order to reduce the performance overhead.
-+
-+   When optimizing for size we use stubs shared by the linked object.
-+   When optimizing for performance we emit stubs for each function in the hope
-+   that the branch predictor can better train on jumps specific for a given
-+   function.  */
-+rtx
-+aarch64_sls_create_blr_label (int regnum)
-+{
-+  gcc_assert (STUB_REGNUM_P (regnum));
-+  if (optimize_function_for_size_p (cfun))
-+    {
-+      /* For the thunks shared between different functions in this compilation
-+	 unit we use a named symbol -- this is just for users to more easily
-+	 understand the generated assembly.  */
-+      aarch64_sls_shared_thunks_needed = true;
-+      const char *thunk_name = indirect_symbol_names[regnum];
-+      if (aarch64_sls_shared_thunks[regnum] == NULL)
-+	{
-+	  /* Build a decl representing this function stub and record it for
-+	     later.  We build a decl here so we can use the GCC machinery for
-+	     handling sections automatically (through `get_named_section` and
-+	     `make_decl_one_only`).  That saves us a lot of trouble handling
-+	     the specifics of different output file formats.  */
-+	  tree decl = build_decl (BUILTINS_LOCATION, FUNCTION_DECL,
-+				  get_identifier (thunk_name),
-+				  build_function_type_list (void_type_node,
-+							    NULL_TREE));
-+	  DECL_RESULT (decl) = build_decl (BUILTINS_LOCATION, RESULT_DECL,
-+					   NULL_TREE, void_type_node);
-+	  TREE_PUBLIC (decl) = 1;
-+	  TREE_STATIC (decl) = 1;
-+	  DECL_IGNORED_P (decl) = 1;
-+	  DECL_ARTIFICIAL (decl) = 1;
-+	  make_decl_one_only (decl, DECL_ASSEMBLER_NAME (decl));
-+	  resolve_unique_section (decl, 0, false);
-+	  aarch64_sls_shared_thunks[regnum] = decl;
-+	}
-+
-+      return gen_rtx_SYMBOL_REF (Pmode, thunk_name);
-+    }
-+
-+  if (cfun->machine->call_via[regnum] == NULL)
-+    cfun->machine->call_via[regnum]
-+      = gen_rtx_LABEL_REF (Pmode, gen_label_rtx ());
-+  return cfun->machine->call_via[regnum];
-+}
-+
-+/* Helper function for aarch64_sls_emit_blr_function_thunks and
-+   aarch64_sls_emit_shared_blr_thunks below.  */
-+static void
-+aarch64_sls_emit_function_stub (FILE *out_file, int regnum)
-+{
-+  /* Save in x16 and branch to that function so this transformation does
-+     not prevent jumping to `BTI c` instructions.  */
-+  asm_fprintf (out_file, "\tmov\tx16, x%d\n", regnum);
-+  asm_fprintf (out_file, "\tbr\tx16\n");
-+}
-+
-+/* Emit all BLR stubs for this particular function.
-+   Here we emit all the BLR stubs needed for the current function.  Since we
-+   emit these stubs in a consecutive block we know there will be no speculation
-+   gadgets between each stub, and hence we only emit a speculation barrier at
-+   the end of the stub sequences.
-+
-+   This is called in the TARGET_ASM_FUNCTION_EPILOGUE hook.  */
-+void
-+aarch64_sls_emit_blr_function_thunks (FILE *out_file)
-+{
-+  if (! aarch64_harden_sls_blr_p ())
-+    return;
-+
-+  bool any_functions_emitted = false;
-+  /* We must save and restore the current function section since this assembly
-+     is emitted at the end of the function.  This means it can be emitted *just
-+     after* the cold section of a function.  That cold part would be emitted in
-+     a different section.  That switch would trigger a `.cfi_endproc` directive
-+     to be emitted in the original section and a `.cfi_startproc` directive to
-+     be emitted in the new section.  Switching to the original section without
-+     restoring would mean that the `.cfi_endproc` emitted as a function ends
-+     would happen in a different section -- leaving an unmatched
-+     `.cfi_startproc` in the cold text section and an unmatched `.cfi_endproc`
-+     in the standard text section.  */
-+  section *save_text_section = in_section;
-+  switch_to_section (function_section (current_function_decl));
-+  for (int regnum = 0; regnum < 30; ++regnum)
-+    {
-+      rtx specu_label = cfun->machine->call_via[regnum];
-+      if (specu_label == NULL)
-+	continue;
-+
-+      targetm.asm_out.print_operand (out_file, specu_label, 0);
-+      asm_fprintf (out_file, ":\n");
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      any_functions_emitted = true;
-+    }
-+  if (any_functions_emitted)
-+    /* Can use the SB if needs be here, since this stub will only be used
-+      by the current function, and hence for the current target.  */
-+    asm_fprintf (out_file, "\t%s\n", aarch64_sls_barrier (true));
-+  switch_to_section (save_text_section);
-+}
-+
-+/* Emit shared BLR stubs for the current compilation unit.
-+   Over the course of compiling this unit we may have converted some BLR
-+   instructions to a BL to a shared stub function.  This is where we emit those
-+   stub functions.
-+   This function is for the stubs shared between different functions in this
-+   compilation unit.  We share when optimizing for size instead of speed.
-+
-+   This function is called through the TARGET_ASM_FILE_END hook.  */
-+void
-+aarch64_sls_emit_shared_blr_thunks (FILE *out_file)
-+{
-+  if (! aarch64_sls_shared_thunks_needed)
-+    return;
-+
-+  for (int regnum = 0; regnum < 30; ++regnum)
-+    {
-+      tree decl = aarch64_sls_shared_thunks[regnum];
-+      if (!decl)
-+	continue;
-+
-+      const char *name = indirect_symbol_names[regnum];
-+      switch_to_section (get_named_section (decl, NULL, 0));
-+      ASM_OUTPUT_ALIGN (out_file, 2);
-+      targetm.asm_out.globalize_label (out_file, name);
-+      /* Only emits if the compiler is configured for an assembler that can
-+	 handle visibility directives.  */
-+      targetm.asm_out.assemble_visibility (decl, VISIBILITY_HIDDEN);
-+      ASM_OUTPUT_TYPE_DIRECTIVE (out_file, name, "function");
-+      ASM_OUTPUT_LABEL (out_file, name);
-+      aarch64_sls_emit_function_stub (out_file, regnum);
-+      /* Use the most conservative target to ensure it can always be used by any
-+	 function in the translation unit.  */
-+      asm_fprintf (out_file, "\tdsb\tsy\n\tisb\n");
-+      ASM_DECLARE_FUNCTION_SIZE (out_file, name, decl);
-+    }
-+}
-+
-+/* Implement TARGET_ASM_FILE_END.  */
-+void
-+aarch64_asm_file_end ()
-+{
-+  aarch64_sls_emit_shared_blr_thunks (asm_out_file);
-+  /* Since this function will be called for the ASM_FILE_END hook, we ensure
-+     that what would be called otherwise (e.g. `file_end_indicate_exec_stack`
-+     for FreeBSD) still gets called.  */
-+#ifdef TARGET_ASM_FILE_END
-+  TARGET_ASM_FILE_END ();
-+#endif
-+}
-+
-+const char *
-+aarch64_indirect_call_asm (rtx addr)
-+{
-+  gcc_assert (REG_P (addr));
-+  if (aarch64_harden_sls_blr_p ())
-+    {
-+      rtx stub_label = aarch64_sls_create_blr_label (REGNO (addr));
-+      output_asm_insn ("bl\t%0", &stub_label);
-+    }
-+  else
-+   output_asm_insn ("blr\t%0", &addr);
-+  return "";
-+}
-+
- /* Target-specific selftests.  */
- 
- #if CHECKING_P
-@@ -23507,6 +23722,12 @@ aarch64_libgcc_floating_mode_supported_p
- #undef TARGET_MD_ASM_ADJUST
- #define TARGET_MD_ASM_ADJUST arm_md_asm_adjust
- 
-+#undef TARGET_ASM_FILE_END
-+#define TARGET_ASM_FILE_END aarch64_asm_file_end
-+
-+#undef TARGET_ASM_FUNCTION_EPILOGUE
-+#define TARGET_ASM_FUNCTION_EPILOGUE aarch64_sls_emit_blr_function_thunks
-+
- struct gcc_target targetm = TARGET_INITIALIZER;
- 
- #include "gt-aarch64.h"
-diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 8e0fc37..7331450 100644
---- a/gcc/config/aarch64/aarch64.h
-+++ b/gcc/config/aarch64/aarch64.h
-@@ -643,6 +643,16 @@ extern unsigned aarch64_architecture_version;
- #define GP_REGNUM_P(REGNO)						\
-   (((unsigned) (REGNO - R0_REGNUM)) <= (R30_REGNUM - R0_REGNUM))
- 
-+/* Registers known to be preserved over a BL instruction.  This consists of the
-+   GENERAL_REGS without x16, x17, and x30.  The x30 register is changed by the
-+   BL instruction itself, while the x16 and x17 registers may be used by
-+   veneers which can be inserted by the linker.  */
-+#define STUB_REGNUM_P(REGNO) \
-+  (GP_REGNUM_P (REGNO) \
-+   && (REGNO) != R16_REGNUM \
-+   && (REGNO) != R17_REGNUM \
-+   && (REGNO) != R30_REGNUM) \
-+
- #define FP_REGNUM_P(REGNO)			\
-   (((unsigned) (REGNO - V0_REGNUM)) <= (V31_REGNUM - V0_REGNUM))
- 
-@@ -667,6 +677,7 @@ enum reg_class
- {
-   NO_REGS,
-   TAILCALL_ADDR_REGS,
-+  STUB_REGS,
-   GENERAL_REGS,
-   STACK_REG,
-   POINTER_REGS,
-@@ -689,6 +700,7 @@ enum reg_class
- {						\
-   "NO_REGS",					\
-   "TAILCALL_ADDR_REGS",				\
-+  "STUB_REGS",					\
-   "GENERAL_REGS",				\
-   "STACK_REG",					\
-   "POINTER_REGS",				\
-@@ -708,6 +720,7 @@ enum reg_class
- {									\
-   { 0x00000000, 0x00000000, 0x00000000 },	/* NO_REGS */		\
-   { 0x00030000, 0x00000000, 0x00000000 },	/* TAILCALL_ADDR_REGS */\
-+  { 0x3ffcffff, 0x00000000, 0x00000000 },	/* STUB_REGS */		\
-   { 0x7fffffff, 0x00000000, 0x00000003 },	/* GENERAL_REGS */	\
-   { 0x80000000, 0x00000000, 0x00000000 },	/* STACK_REG */		\
-   { 0xffffffff, 0x00000000, 0x00000003 },	/* POINTER_REGS */	\
-@@ -862,6 +875,8 @@ typedef struct GTY (()) machine_function
-   struct aarch64_frame frame;
-   /* One entry for each hard register.  */
-   bool reg_is_wrapped_separately[LAST_SAVED_REGNUM];
-+  /* One entry for each general purpose register.  */
-+  rtx call_via[SP_REGNUM];
-   bool label_is_assembled;
- } machine_function;
- #endif
-diff --git a/gcc/config/aarch64/aarch64.md b/gcc/config/aarch64/aarch64.md
-index dda04ee..43da754 100644
---- a/gcc/config/aarch64/aarch64.md
-+++ b/gcc/config/aarch64/aarch64.md
-@@ -1022,16 +1022,15 @@
- )
- 
- (define_insn "*call_insn"
--  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "r, Usf"))
-+  [(call (mem:DI (match_operand:DI 0 "aarch64_call_insn_operand" "Ucr, Usf"))
- 	 (match_operand 1 "" ""))
-    (unspec:DI [(match_operand:DI 2 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%0
-+  * return aarch64_indirect_call_asm (operands[0]);
-   bl\\t%c0"
--  [(set_attr "type" "call, call")]
--)
-+  [(set_attr "type" "call, call")])
- 
- (define_expand "call_value"
-   [(parallel
-@@ -1050,13 +1049,13 @@
- 
- (define_insn "*call_value_insn"
-   [(set (match_operand 0 "" "")
--	(call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "r, Usf"))
-+	(call (mem:DI (match_operand:DI 1 "aarch64_call_insn_operand" "Ucr, Usf"))
- 		      (match_operand 2 "" "")))
-    (unspec:DI [(match_operand:DI 3 "const_int_operand")] UNSPEC_CALLEE_ABI)
-    (clobber (reg:DI LR_REGNUM))]
-   ""
-   "@
--  blr\\t%1
-+  * return aarch64_indirect_call_asm (operands[1]);
-   bl\\t%c1"
-   [(set_attr "type" "call, call")]
- )
-diff --git a/gcc/config/aarch64/constraints.md b/gcc/config/aarch64/constraints.md
-index d993268..8cc6f50 100644
---- a/gcc/config/aarch64/constraints.md
-+++ b/gcc/config/aarch64/constraints.md
-@@ -24,6 +24,15 @@
- (define_register_constraint "Ucs" "TAILCALL_ADDR_REGS"
-   "@internal Registers suitable for an indirect tail call")
- 
-+(define_register_constraint "Ucr"
-+    "aarch64_harden_sls_blr_p () ? STUB_REGS : GENERAL_REGS"
-+  "@internal Registers to be used for an indirect call.
-+   This is usually the general registers, but when we are hardening against
-+   Straight Line Speculation we disallow x16, x17, and x30 so we can use
-+   indirection stubs.  These indirection stubs cannot use the above registers
-+   since they will be reached by a BL that may have to go through a linker
-+   veneer.")
-+
- (define_register_constraint "w" "FP_REGS"
-   "Floating point and SIMD vector registers.")
- 
-diff --git a/gcc/config/aarch64/predicates.md b/gcc/config/aarch64/predicates.md
-index 215fcec..1754b1e 100644
---- a/gcc/config/aarch64/predicates.md
-+++ b/gcc/config/aarch64/predicates.md
-@@ -32,7 +32,8 @@
- 
- (define_predicate "aarch64_general_reg"
-   (and (match_operand 0 "register_operand")
--       (match_test "REGNO_REG_CLASS (REGNO (op)) == GENERAL_REGS")))
-+       (match_test "REGNO_REG_CLASS (REGNO (op)) == STUB_REGS
-+		    || REGNO_REG_CLASS (REGNO (op)) == GENERAL_REGS")))
- 
- ;; Return true if OP a (const_int 0) operand.
- (define_predicate "const0_operand"
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-new file mode 100644
-index 0000000..b1fb754
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr-bti.c
-@@ -0,0 +1,40 @@
-+/* { dg-do compile } */
-+/* { dg-additional-options "-mharden-sls=blr -mbranch-protection=bti" } */
-+/*
-+   Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   Here we also check that there are no BR instructions with anything except an
-+   x16 or x17 register.  This is because a `BTI c` instruction can be branched
-+   to using a BLR instruction using any register, but can only be branched to
-+   with a BR using an x16 or x17 register.
-+  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval = x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler-not {\tbr\tx(?!16|17)} } } */
-+/* { dg-final { scan-assembler {\tbr\tx(16|17)} } } */
-+
-diff --git a/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-new file mode 100644
-index 0000000..88bafff
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/aarch64/sls-mitigation/sls-miti-blr.c
-@@ -0,0 +1,33 @@
-+/* { dg-additional-options "-mharden-sls=blr -save-temps" } */
-+/* Ensure that the SLS hardening of BLR leaves no BLR instructions.
-+   We only test that all BLR instructions have been removed, not that the
-+   resulting code makes sense.  */
-+typedef int (foo) (int, int);
-+typedef void (bar) (int, int);
-+struct sls_testclass {
-+    foo *x;
-+    bar *y;
-+    int left;
-+    int right;
-+};
-+
-+/* We test both RTL patterns for a call which returns a value and a call which
-+   does not.  */
-+int blr_call_value (struct sls_testclass x)
-+{
-+  int retval = x.x(x.left, x.right);
-+  if (retval % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+int blr_call (struct sls_testclass x)
-+{
-+  x.y(x.left, x.right);
-+  if (x.left % 10)
-+    return 100;
-+  return 9;
-+}
-+
-+/* { dg-final { scan-assembler-not {\tblr\t} } } */
-+/* { dg-final { scan-assembler {\tbr\tx[0-9][0-9]?} } } */
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
index 88e1715b5c..03d7a41633 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -30,9 +30,8 @@ diff --git a/gcc/Makefile.in b/gcc/Makefile.in
 index a67d2cc18d6..480c9366418 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3606,7 +3606,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
- # We keep the directory structure for files in config or c-family and .def
- # files. All other files are flattened to a single directory.
+ # We keep the directory structure for files in config, common/config or
+ # c-family and .def files. All other files are flattened to a single directory.
  	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
 -	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
 +	headers=`echo $(sort $(PLUGIN_HEADERS)) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
diff --git a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
index ba7c2b8fd5..43d881fa5e 100644
--- a/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0033-Re-introduce-spe-commandline-options.patch
@@ -33,6 +33,6 @@ index f95b8279270..0e52d51409d 100644
 +Target RejectNegative Var(rs6000_spe_abi, 0)
 +Do not use the SPE ABI extensions.
 +
+ ; Altivec ABI
  mabi=altivec
  Target RejectNegative Var(rs6000_altivec_abi) Save
- Use the AltiVec ABI extensions.
diff --git a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
index de82a3a539..4db3d15554 100644
--- a/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
+++ b/meta/recipes-devtools/gcc/gcc/0036-mingw32-Enable-operation_not_supported.patch
@@ -16,11 +16,11 @@ index 68ac72a78fb..71cd5815b81 100644
 --- a/libstdc++-v3/config/os/mingw32/error_constants.h
 +++ b/libstdc++-v3/config/os/mingw32/error_constants.h
 @@ -107,7 +107,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
- #ifdef _GLIBCXX_HAVE_EPERM
+ #ifdef EPERM
        operation_not_permitted = 		EPERM,
  #endif
 -//    operation_not_supported = 		EOPNOTSUPP,
 +      operation_not_supported = 		EOPNOTSUPP,
- #ifdef _GLIBCXX_HAVE_EWOULDBLOCK
+ #ifdef EWOULDBLOCK
        operation_would_block = 			EWOULDBLOCK,
  #endif
diff --git a/meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
deleted file mode 100644
index 3e42266b81..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0038-arm-neoverse-n2-support.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From d7e8411f6a333d4054894ad3b23f23415a525230 Mon Sep 17 00:00:00 2001
-From: Alex Coplan <alex.coplan@arm.com>
-Date: Fri, 2 Oct 2020 16:06:15 +0100
-Subject: [PATCH] arm: Add support for Neoverse N2 CPU
-
-This patch backports the AArch32 support for Arm's Neoverse N2 CPU to
-GCC 10.
-
-gcc/ChangeLog:
-
-	* config/arm/arm-cpus.in (neoverse-n2): New.
-	* config/arm/arm-tables.opt: Regenerate.
-	* config/arm/arm-tune.md: Regenerate.
-	* doc/invoke.texi: Document support for Neoverse N2.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=d7e8411f6a333d4054894ad3b23f23415a525230]
-
-Signed-off-by: pgowda <pgowda.cve@gmail.com>
----
- gcc/config/arm/arm-cpus.in    | 12 ++++++++++++
- gcc/config/arm/arm-tables.opt |  3 +++
- gcc/config/arm/arm-tune.md    |  5 +++--
- gcc/doc/invoke.texi           |  6 +++---
- 4 files changed, 21 insertions(+), 5 deletions(-)
-
-diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
---- a/gcc/config/arm/arm-cpus.in	2021-12-20 20:24:59.912159845 -0800
-+++ b/gcc/config/arm/arm-cpus.in	2021-12-20 21:00:04.417003845 -0800
-@@ -1481,6 +1481,18 @@ begin cpu cortex-a76.cortex-a55
-  costs cortex_a57
- end cpu cortex-a76.cortex-a55
- 
-+# Armv8.5 A-profile Architecture Processors
-+begin cpu neoverse-n2
-+  cname neoversen2
-+  tune for cortex-a57
-+  tune flags LDSCHED
-+  architecture armv8.5-a+fp16+bf16+i8mm
-+  option crypto add FP_ARMv8 CRYPTO
-+  costs cortex_a57
-+  vendor 41
-+  part 0xd49
-+end cpu neoverse-n2
-+
- # V8 M-profile implementations.
- begin cpu cortex-m23
-  cname cortexm23
-diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
---- a/gcc/config/arm/arm-tables.opt	2020-07-22 23:35:54.688795958 -0700
-+++ b/gcc/config/arm/arm-tables.opt	2021-12-20 21:00:04.421003776 -0800
-@@ -253,6 +253,9 @@ EnumValue
- Enum(processor_type) String(cortex-m23) Value( TARGET_CPU_cortexm23)
- 
- EnumValue
-+Enum(processor_type) String(neoverse-n2) Value( TARGET_CPU_neoversen2)
-+
-+EnumValue
- Enum(processor_type) String(cortex-m33) Value( TARGET_CPU_cortexm33)
- 
- EnumValue
-diff --git a/gcc/config/arm/arm-tune.md b/gcc/config/arm/arm-tune.md
---- a/gcc/config/arm/arm-tune.md	2020-07-22 23:35:54.684795913 -0700
-+++ b/gcc/config/arm/arm-tune.md	2021-12-20 21:02:44.630260284 -0800
-@@ -46,6 +46,6 @@
- 	cortexa73cortexa53,cortexa55,cortexa75,
- 	cortexa76,cortexa76ae,cortexa77,
- 	neoversen1,cortexa75cortexa55,cortexa76cortexa55,
--	cortexm23,cortexm33,cortexm35p,
--	cortexm55,cortexr52"
-+	neoversen2,cortexm23,cortexm33,
-+	cortexm35p,cortexm55,cortexr52"
- 	(const (symbol_ref "((enum attr_tune) arm_tune)")))
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
---- a/gcc/doc/invoke.texi	2021-12-20 20:24:59.916159782 -0800
-+++ b/gcc/doc/invoke.texi	2021-12-20 21:03:41.337290704 -0800
-@@ -18857,9 +18857,9 @@ Permissible names are: @samp{arm7tdmi},
- @samp{cortex-m35p}, @samp{cortex-m55},
- @samp{cortex-m1.small-multiply}, @samp{cortex-m0.small-multiply},
- @samp{cortex-m0plus.small-multiply}, @samp{exynos-m1}, @samp{marvell-pj4},
--@samp{neoverse-n1}, @samp{xscale}, @samp{iwmmxt}, @samp{iwmmxt2},
--@samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te}, @samp{fa626te},
--@samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
-+@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{xscale}, @samp{iwmmxt},
-+@samp{iwmmxt2}, @samp{ep9312}, @samp{fa526}, @samp{fa626}, @samp{fa606te},
-+@samp{fa626te}, @samp{fmp626}, @samp{fa726te}, @samp{xgene1}.
- 
- Additionally, this option can specify that GCC should tune the performance
- of the code for a big.LITTLE system.  Permissible names are:
diff --git a/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch b/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
deleted file mode 100644
index b3e0f396bd..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0039-arm64-neoverse-n2-support.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 9428e9267435a62f672e2ba42df46432c021a9cf Mon Sep 17 00:00:00 2001
-From: Alex Coplan <alex.coplan@arm.com>
-Date: Tue, 29 Sep 2020 17:09:09 +0100
-Subject: [PATCH] aarch64: Add support for Neoverse N2 CPU
-
-This patch backports the AArch64 support for Arm's Neoverse N2 CPU to
-GCC 10.
-
-gcc/ChangeLog:
-
-	* config/aarch64/aarch64-cores.def: Add Neoverse N2.
-	* config/aarch64/aarch64-tune.md: Regenerate.
-	* doc/invoke.texi: Document AArch64 support for Neoverse N2.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=9428e9267435a62f672e2ba42df46432c021a9cf]
-
-Signed-off-by: pgowda <pgowda.cve@gmail.com>
----
- gcc/config/aarch64/aarch64-cores.def | 3 +++
- gcc/config/aarch64/aarch64-tune.md   | 2 +-
- gcc/doc/invoke.texi                  | 4 ++--
- 3 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-cores.def
---- a/gcc/config/aarch64/aarch64-cores.def	2020-07-22 23:35:17.320384289 -0700
-+++ b/gcc/config/aarch64/aarch64-cores.def	2021-12-21 01:08:45.518472342 -0800
-@@ -135,6 +135,9 @@ AARCH64_CORE("zeus", zeus, cortexa57, 8_
- /* Qualcomm ('Q') cores. */
- AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -1)
- 
-+/* Armv8.5-A Architecture Processors.  */
-+AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen1, 0x41, 0xd49, -1)
-+
- /* ARMv8-A big.LITTLE implementations.  */
- 
- AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LITTLE (0xd07, 0xd03), -1)
-diff --git a/gcc/config/aarch64/aarch64-tune.md b/gcc/config/aarch64/aarch64-tune.md
---- a/gcc/config/aarch64/aarch64-tune.md	2020-07-22 23:35:54.684795913 -0700
-+++ b/gcc/config/aarch64/aarch64-tune.md	2021-12-21 01:09:56.829252050 -0800
-@@ -1,5 +1,5 @@
- ;; -*- buffer-read-only: t -*-
- ;; Generated automatically by gentune.sh from aarch64-cores.def
- (define_attr "tune"
--	"cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunderx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55"
-+	"cortexa34,cortexa35,cortexa53,cortexa57,cortexa72,cortexa73,thunderx,thunderxt88p1,thunderxt88,octeontx,octeontxt81,octeontxt83,thunderxt81,thunderxt83,emag,xgene1,falkor,qdf24xx,exynosm1,phecda,thunderx2t99p1,vulcan,thunderx2t99,cortexa55,cortexa75,cortexa76,cortexa76ae,cortexa77,cortexa65,cortexa65ae,ares,neoversen1,neoversee1,octeontx2,octeontx2t98,octeontx2t96,octeontx2t93,octeontx2f95,octeontx2f95n,octeontx2f95mm,tsv110,thunderx3t110,zeus,neoversen2,saphira,cortexa57cortexa53,cortexa72cortexa53,cortexa73cortexa35,cortexa73cortexa53,cortexa75cortexa55,cortexa76cortexa55"
- 	(const (symbol_ref "((enum attr_tune) aarch64_tune)")))
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
---- a/gcc/doc/invoke.texi	2021-12-21 00:50:18.345426447 -0800
-+++ b/gcc/doc/invoke.texi	2021-12-21 01:11:18.547853686 -0800
-@@ -17010,8 +17010,8 @@ performance of the code.  Permissible va
- @samp{cortex-a57}, @samp{cortex-a72}, @samp{cortex-a73}, @samp{cortex-a75},
- @samp{cortex-a76}, @samp{cortex-a76ae}, @samp{cortex-a77},
- @samp{cortex-a65}, @samp{cortex-a65ae}, @samp{cortex-a34},
--@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor},
--@samp{neoverse-e1},@samp{neoverse-n1},@samp{qdf24xx}, @samp{saphira},
-+@samp{ares}, @samp{exynos-m1}, @samp{emag}, @samp{falkor}, @samp{neoverse-e1},
-+@samp{neoverse-n1}, @samp{neoverse-n2}, @samp{qdf24xx}, @samp{saphira},
- @samp{phecda}, @samp{xgene1}, @samp{vulcan}, @samp{octeontx},
- @samp{octeontx81},  @samp{octeontx83},
- @samp{octeontx2}, @samp{octeontx2t98}, @samp{octeontx2t96}
diff --git a/meta/recipes-devtools/gcc/gcc_10.2.bb b/meta/recipes-devtools/gcc/gcc_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_10.2.bb
rename to meta/recipes-devtools/gcc/gcc_10.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_10.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_10.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_10.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_10.2.bb b/meta/recipes-devtools/gcc/libgcc_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_10.2.bb
rename to meta/recipes-devtools/gcc/libgcc_10.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_10.2.bb b/meta/recipes-devtools/gcc/libgfortran_10.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_10.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_10.3.bb
-- 
2.31.1


