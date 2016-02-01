Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id B486D77060
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 21:36:41 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id is5so131766197obc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Feb 2016 13:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WQRJkGBs/4vreWP7DtAl7mCOLtaqetatI2BrXFi6wqs=;
	b=UP/2V6o5vtqlPJnsPv2xQpq81RfTTfrJb+fP2NuZbidQ1aWaKfBjpYxMLgaVMjetG4
	RSaQnn5reH/IiCKk70IR+Avh9u6oTBCCsf5lOWdybqHSFOaO4UvS0UEa/UxocqeMqK5W
	JY9XY0Nc0v6t1E7fwayrMc/Kxdw5omQPO/krQCWijORUjQ8ghX62BzBgVFsHSYuoGSZb
	cZjS0z0gp5GwosquByWH6TfyQj+jB0cXtB51DE6cQHG2IJ4usFgezUMOpZWK1eJLMJbY
	iswb7tDGQd3vLOA6lzU2ymMH/64feCgbZ+ia9o/QxuWE0VBjLp8JQqjKE8ZdXjnfIGdp
	+jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WQRJkGBs/4vreWP7DtAl7mCOLtaqetatI2BrXFi6wqs=;
	b=i19f69hzULjEwBlCvXkVlujWi6pR3/ujO0fvPjB2OqcGA/1v+1UoSjhPi84ypGJHyb
	hVjXgH0mxT4dIrWPIKzytvYmYwixjUO5yojzPOl/SZrfda4AVRxNb0NFxOEu3OqxGL/m
	RIyk1u6YEezwZXrYrNk/t9rX5mv69+v+EgYukk6Cff1xAeGt603fKwGyT03YfcMsWYok
	RWigXdYXSh1qMdfYTBx5OPTLhE/cmtrVlu1E44ff1fPSofi6Zfsm2tkosRaFAVSPzoqU
	+teyhCWr/Kc+lMvap6m1okLb6b7d+ILO0/sEvOTfH6FT+6VGn7O7Mxy9cU/my4lleQ49
	ctUA==
X-Gm-Message-State: AG10YOTdjhdPE71GebMlssto+J7drHIUkt4oBgYVz4ILAi8R7DIqsSvT1lQd8BrXcGyMSQ==
X-Received: by 10.182.133.37 with SMTP id oz5mr19967163obb.16.1454362601533;
	Mon, 01 Feb 2016 13:36:41 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	gx1sm4387347obc.12.2016.02.01.13.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Feb 2016 13:36:40 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 13:36:32 -0800
Message-Id: <1454362592-13211-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] liboil: drop recipe from oe-core
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
X-List-Received-Date: Mon, 01 Feb 2016 21:36:43 -0000

There are no remaining dependencies on liboil in oe-core (in most
cases it has been replaced by 'orc'). There is one recipe with a
dependency on liboil in meta-multimedia ('schroedinger').

The liboil recipe has now been included in meta-multimedia, so
can be dropped from oe-core.

  http://git.openembedded.org/meta-openembedded/commit/?id=1f48c624e0fcc15fdcfed923cfac5e8d7da07290

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../liboil-0.3.17/0001-Fix-enable-vfp-flag.patch   |  41 ----
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |  19 --
 .../liboil/liboil-0.3.17/liboil_fix_for_x32.patch  | 222 ---------------------
 .../liboil/liboil-0.3.17/no-tests.patch            |  24 ---
 meta/recipes-support/liboil/liboil_0.3.17.bb       |  27 ---
 5 files changed, 333 deletions(-)
 delete mode 100644 meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
 delete mode 100644 meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
 delete mode 100644 meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
 delete mode 100644 meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
 delete mode 100644 meta/recipes-support/liboil/liboil_0.3.17.bb

diff --git a/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch b/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
deleted file mode 100644
index aff1cb1..0000000
--- a/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-From 1921498bcc06408e8b051a3a9e9ce4182998f748 Mon Sep 17 00:00:00 2001
-From: David Schleef <ds@schleef.org>
-Date: Fri, 8 Apr 2011 10:05:49 -0700
-Subject: [PATCH 10/10] Fix --enable-vfp flag
-
-Patch from Christophe Lyon, fixes #36084.
----
- configure.ac           |    4 ++--
- liboil/arm/Makefile.am |    1 +
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 98c81fb..407d88c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -188,8 +188,8 @@ fi
- AC_ARG_ENABLE(vfp,
-   AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
-   enable_vfp=$enableval,enable_vfp=yes)
--if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
--  AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
-+if test "x$enable_vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
-+  AS_COMPILER_FLAG(["-mfpu=vfp"],
-     [VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"],
-     true)
-   #AS_COMPILER_FLAG(["-Wa,-mfloat-abi=softfp"],
-diff --git a/liboil/arm/Makefile.am b/liboil/arm/Makefile.am
-index ead08ed..cd8d9fa 100644
---- a/liboil/arm/Makefile.am
-+++ b/liboil/arm/Makefile.am
-@@ -6,4 +6,5 @@ libarm_la_SOURCES = \
- 	math_vfp_asm.S
- 
- libarm_la_CFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
-+libarm_la_CCASFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
- 
--- 
-1.7.6
-
diff --git a/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch b/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
deleted file mode 100644
index c8e3c1f..0000000
--- a/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream: https://bugs.freedesktop.org/show_bug.cgi?id=31358
-
-configure: fix whitelisting of x86_64 unaligned memory access
-
-Fix typo in whitelist so cross-compile works for x86_64.
-
-Upstream-Status: Inappropriate [configuration]
-
---- liboil-0.3.17/m4/as-unaligned-access.m4.orig	2009-02-26 14:40:08.000000000 -0500
-+++ liboil-0.3.17/m4/as-unaligned-access.m4	2010-11-03 12:19:55.000000000 -0400
-@@ -9,7 +9,7 @@
-         _AS_ECHO_N([(blacklisted) ])
-         as_cv_unaligned_access=no
- 	;;
--      i?86*|x86_64|amd64|powerpc*|m68k*|cris*)
-+      i?86*|x86_64*|amd64*|powerpc*|m68k*|cris*)
-         _AS_ECHO_N([(whitelisted) ])
-         as_cv_unaligned_access=yes
- 	;;
diff --git a/meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch b/meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
deleted file mode 100644
index 473380e..0000000
--- a/meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-Upstream-Status: Pending
-
-Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/01
-
-
-Index: liboil-0.3.17/liboil/amd64/wavelet.c
-===================================================================
---- liboil-0.3.17.orig/liboil/amd64/wavelet.c
-+++ liboil-0.3.17/liboil/amd64/wavelet.c
-@@ -21,14 +21,14 @@ deinterleave2_asm (int16_t *d1, int16_t 
-   asm volatile ("\n"
-       "  sub $2, %%rcx\n"
-       "1:\n"
--      "  movw (%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, (%0,%%rcx,2)\n"
--      "  movw 2(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, (%2,%%rcx,2)\n"
--      "  movw 4(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, 2(%0,%%rcx,2)\n"
--      "  movw 6(%1,%%rcx,4), %%ax\n"
--      "  movw %%ax, 2(%2,%%rcx,2)\n"
-+      "  movw (%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, (%q0,%%rcx,2)\n"
-+      "  movw 2(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, (%q2,%%rcx,2)\n"
-+      "  movw 4(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, 2(%q0,%%rcx,2)\n"
-+      "  movw 6(%q1,%%rcx,4), %%ax\n"
-+      "  movw %%ax, 2(%q2,%%rcx,2)\n"
-       "  sub $2, %%rcx\n"
-       "  jge 1b\n"
-       : "+r" (d1), "+r" (s_2xn), "+r" (d2), "+c" (n)
-@@ -53,20 +53,20 @@ deinterleave2_mmx (int16_t *d1, int16_t 
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm0\n"
--      "  movq 8(%1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm0\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm1\n"
-       "  pslld $16, %%mm0\n"
-       "  pslld $16, %%mm1\n"
-       "  psrad $16, %%mm0\n"
-       "  psrad $16, %%mm1\n"
-       "  packssdw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
--      "  movq (%1,%%rcx,4), %%mm0\n"
--      "  movq 8(%1,%%rcx,4), %%mm1\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-+      "  movq (%q1,%%rcx,4), %%mm0\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm1\n"
-       "  psrad $16, %%mm0\n"
-       "  psrad $16, %%mm1\n"
-       "  packssdw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%2,%%rcx,2)\n"
-+      "  movq %%mm0, (%q2,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -93,10 +93,10 @@ deinterleave2_mmx_2 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  pshufw $0xd8, (%1,%%rcx,4), %%mm0\n"
--      "  movd %%mm0, (%0,%%rcx,2)\n"
--      "  pshufw $0x8d, (%1,%%rcx,4), %%mm0\n"
--      "  movd %%mm0, (%2,%%rcx,2)\n"
-+      "  pshufw $0xd8, (%q1,%%rcx,4), %%mm0\n"
-+      "  movd %%mm0, (%q0,%%rcx,2)\n"
-+      "  pshufw $0x8d, (%q1,%%rcx,4), %%mm0\n"
-+      "  movd %%mm0, (%q2,%%rcx,2)\n"
-       "  add $2, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -123,16 +123,16 @@ deinterleave2_mmx_3 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm1\n"
--      "  movq (%1,%%rcx,4), %%mm2\n"
--      "  movq 8(%1,%%rcx,4), %%mm0\n"
-+      "  movq (%q1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm2\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm0\n"
-       "  punpcklwd %%mm0, %%mm1\n"
-       "  punpckhwd %%mm0, %%mm2\n"
-       "  movq %%mm1, %%mm0\n"
-       "  punpcklwd %%mm2, %%mm0\n"
-       "  punpckhwd %%mm2, %%mm1\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
--      "  movq %%mm1, (%2,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-+      "  movq %%mm1, (%q2,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -159,26 +159,26 @@ deinterleave2_mmx_4 (int16_t *d1, int16_
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,4), %%mm1\n"
-+      "  movq (%q1,%%rcx,4), %%mm1\n"
-       "  movq %%mm1, %%mm2\n"
--      "  movq 8(%1,%%rcx,4), %%mm0\n"
--      "   movq 16(%1,%%rcx,4), %%mm5\n"
-+      "  movq 8(%q1,%%rcx,4), %%mm0\n"
-+      "   movq 16(%q1,%%rcx,4), %%mm5\n"
-       "  punpcklwd %%mm0, %%mm1\n"
-       "   movq %%mm5, %%mm6\n"
-       "  punpckhwd %%mm0, %%mm2\n"
--      "   movq 24(%1,%%rcx,4), %%mm4\n"
-+      "   movq 24(%q1,%%rcx,4), %%mm4\n"
-       "  movq %%mm1, %%mm0\n"
-       "   punpcklwd %%mm4, %%mm5\n"
-       "  punpcklwd %%mm2, %%mm0\n"
-       "   punpckhwd %%mm4, %%mm6\n"
-       "  punpckhwd %%mm2, %%mm1\n"
-       "   movq %%mm5, %%mm4\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "   punpcklwd %%mm6, %%mm4\n"
--      "  movq %%mm1, (%2,%%rcx,2)\n"
-+      "  movq %%mm1, (%q2,%%rcx,2)\n"
-       "   punpckhwd %%mm6, %%mm5\n"
--      "   movq %%mm4, 8(%0,%%rcx,2)\n"
--      "   movq %%mm5, 8(%2,%%rcx,2)\n"
-+      "   movq %%mm4, 8(%q0,%%rcx,2)\n"
-+      "   movq %%mm5, 8(%q2,%%rcx,2)\n"
-       "  add $8, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -252,13 +252,13 @@ interleave2_mmx (int16_t *d_2xn, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-       "  movq %%mm0, %%mm2\n"
-       "  punpckhwd %%mm1, %%mm0\n"
-       "  punpcklwd %%mm1, %%mm2\n"
--      "  movq %%mm2, (%0,%%rcx,4)\n"
--      "  movq %%mm0, 8(%0,%%rcx,4)\n"
-+      "  movq %%mm2, (%q0,%%rcx,4)\n"
-+      "  movq %%mm0, 8(%q0,%%rcx,4)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %3, %%ecx\n"
-       "  jl 1b\n"
-@@ -285,12 +285,12 @@ lift_add_shift1_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $1, %%mm1\n"
--      "  paddw (%1,%%rcx,2), %%mm1\n"
--      "  movq %%mm1, (%0,%%rcx,2)\n"
-+      "  paddw (%q1,%%rcx,2), %%mm1\n"
-+      "  movq %%mm1, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -317,13 +317,13 @@ lift_sub_shift1_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $1, %%mm1\n"
-       "  psubw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -350,12 +350,12 @@ lift_add_shift2_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $2, %%mm1\n"
--      "  paddw (%1,%%rcx,2), %%mm1\n"
--      "  movq %%mm1, (%0,%%rcx,2)\n"
-+      "  paddw (%q1,%%rcx,2), %%mm1\n"
-+      "  movq %%mm1, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
-@@ -382,13 +382,13 @@ lift_sub_shift2_mmx (int16_t *d, int16_t
-   asm volatile ("\n"
-       "  xor %%rcx, %%rcx\n"
-       "1:\n"
--      "  movq (%2,%%rcx,2), %%mm1\n"
--      "  movq (%3,%%rcx,2), %%mm2\n"
--      "  movq (%1,%%rcx,2), %%mm0\n"
-+      "  movq (%q2,%%rcx,2), %%mm1\n"
-+      "  movq (%q3,%%rcx,2), %%mm2\n"
-+      "  movq (%q1,%%rcx,2), %%mm0\n"
-       "  paddw %%mm2, %%mm1\n"
-       "  psraw $2, %%mm1\n"
-       "  psubw %%mm1, %%mm0\n"
--      "  movq %%mm0, (%0,%%rcx,2)\n"
-+      "  movq %%mm0, (%q0,%%rcx,2)\n"
-       "  add $4, %%rcx\n"
-       "  cmp %4, %%ecx\n"
-       "  jl 1b\n"
diff --git a/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch b/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
deleted file mode 100644
index 892d441..0000000
--- a/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
---- liboil-0.3.9/liboil/liboilfunction.c.old	2006-09-18 13:03:20.000000000 +0100
-+++ liboil-0.3.9/liboil/liboilfunction.c	2006-09-18 13:04:10.000000000 +0100
-@@ -345,7 +345,9 @@
-     return;
-   }
- 
--  test = oil_test_new (klass);
-+  klass->chosen_impl = klass->reference_impl;
-+  klass->func = klass->reference_impl->func;
-+/*  test = oil_test_new (klass);
-   if (test == NULL) {
-     OIL_ERROR ("failed to test function class %s", klass->name);
-     return;
-@@ -385,7 +387,7 @@
-   klass->chosen_impl = min_impl;
-   klass->func = min_impl->func;
- 
--  oil_test_free (test);
-+  oil_test_free (test);*/
- }
- 
- static void
diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
deleted file mode 100644
index 03b7785..0000000
--- a/meta/recipes-support/liboil/liboil_0.3.17.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Library of simple functions optimized for various CPUs"
-HOMEPAGE = "http://liboil.freedesktop.org/"
-BUGTRACKER = "https://bugs.freedesktop.org/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
-                    file://liboil/liboil.h;endline=28;md5=95c794a66b88800d949fed17e437d9fb \
-                    file://liboil/liboilcpu.c;endline=28;md5=89da69a61d88eedcba066f42353fb75a \
-                    file://examples/example1.c;endline=29;md5=9d4dad9fcbbdf0441ee063f8af5170c9 \
-                    file://testsuite/trans.c;endline=29;md5=380ecd43121fe3dcc0d8d7e5984f283d"
-
-DEPENDS = "glib-2.0"
-PR = "r5"
-
-SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
-           file://no-tests.patch \
-           file://fix-unaligned-whitelist.patch \
-           file://0001-Fix-enable-vfp-flag.patch \
-           file://liboil_fix_for_x32.patch \
-          "
-
-SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
-SRC_URI[sha256sum] = "105f02079b0b50034c759db34b473ecb5704ffa20a5486b60a8b7698128bfc69"
-
-inherit autotools pkgconfig
-
-ARM_INSTRUCTION_SET = "arm"
-- 
1.9.1


