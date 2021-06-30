Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.957.1625021590047965018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 19:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nPpSsSHH;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625021587; i=@fujitsu.com;
	bh=0hxfuDty2tcDLkeoxDQN1Cihmmgl2rZij55c9UdpLoc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nPpSsSHHdAEJ4QLHdKuPdXxTuF4dyrFwixtdTq4RMN1zkoWZ8m+a36VYjzSvulGFF
	 adTezxQU015o9HhLkIPfhlHTaOLUsXr8f54/CSGIf451XR7nJKms5jVgg5F4OW2Ey2
	 hv2IzkXaapeIeuvoNow/HO5rR6Cilk0xkHElXuZdh0CVe4rmhEgAq5FJ+vFkQkU0CK
	 M3ZO3DMIjJbTZZG2We2UexL8mmqKNL6Ig6iXt/Ma0l6XNy4DNjFzRsoT89Jy0YZELL
	 K7+tHluayyjYN3yPhwWYNd2WTAdwNe9fybD4dZAXJKiHjiISk6ryTolSyactS00H7f
	 f5NlqbO7P3SrQ==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 31/3F-56066-39CDBD06; Wed, 30 Jun 2021 02:53:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MRqjv5zu0
  Eg22fWSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozZJzawFkytrrh28DprA2NHZhcjF4eQwCwm
  iXlLrjNDOHsYJWbeO8nUxcjJwSagK3Hu8Vr2LkYODhEBPYmr/0RBwsIC5hKX+o8zgYRZBFQl7
  s5SAAnzCnhI/HjdxgZiSwgoSEx5+J4ZIi4ocXLmExYQm1lAQuLgixfMIK0SAooSs6fLQ5RXSM
  yYsY1tAiPPLCQds5B0LGBkWsVokVSUmZ5RkpuYmaNraGCga2hopGtoCcRGZnqJVbqJeqmluuW
  pxSW6hnqJ5cV6xZW5yTkpenmpJZsYgSGUUnCgbgfjg9cf9A4xSnIwKYnyTrlxO0GILyk/pTIj
  sTgjvqg0J7X4EKMMB4eSBG8jSE6wKDU9tSItMwcYzjBpCQ4eJRHex7eA0rzFBYm5xZnpEKlTj
  LEc734uXsTM8WbtEiD5Fky23bsLJNvB5MwFB1czc8wCk/fbDwHJByBSiCUvPy9VSpzXFmSoAM
  jQjNI8uJWw2L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXB+Rynsy8ErjLXgEdzQR09KI
  nN0GOLklESEk1MM3XODf9TaFyc7Sd8LG7e/VPLX93ruazpTzbLd19X7fNkXtvs8Qs9lOVbpyL
  k/4936m+jfu3PV4698UaJ6cpEXbJrCXp6t9P5ZocfP9qodiGxMzHk24F3E8QmFvTNGO/9d4di
  fGCr8svSavO9Np2/e0iF29H6ZPvipKfv2L9YXeF2fDUh3ueTPPK22u/aDfzeFXNlt3la2n5dA
  c764TIzw9lE0v1tvH0lSTO+G4+p2rZyeVzjTxq5Dsear4K/hn7cqfc422pGl256nfebJ+/7qf
  HnYpiL8Nl7drnLHU2tDe9ezgvMMlWVNTuifQNmQtTZocWSuYdX3ZsxpbkA16lRgsnMNxR0BZa
  lHWrpLY22VOJpTgj0VCLuag4EQCqSkhrWAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-267.messagelabs.com!1625021586!481009!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24183 invoked from network); 30 Jun 2021 02:53:07 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Jun 2021 02:53:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15U2qxRZ009179
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 03:53:06 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 30 Jun 2021 03:52:58 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libffi: upgrade 3.3 -> 3.4.2
Date: Wed, 30 Jun 2021 10:52:48 +0800
Message-ID: <1625021568-64909-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-Address-platforms-with-no-__int128-part2.patch
0001-Address-platforms-with-no-__int128.patch
0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
0001-powerpc-fix-build-failure-on-power7-and-older-532.patch
removed since they're included in 3.4.2

refresh 0001-arm-sysv-reverted-clang-VFP-mitigation.patch

License-Updage: Copyright year updated to 2021

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ess-platforms-with-no-__int128-part2.patch | 34 ----------
 ...1-Address-platforms-with-no-__int128.patch | 27 --------
 ...-missed-ifndef-for-__mips_soft_float.patch | 27 --------
 ...m-sysv-reverted-clang-VFP-mitigation.patch | 34 +++++-----
 ...pc.h-fix-build-failure-with-powerpc7.patch | 62 -------------------
 ...uild-failure-on-power7-and-older-532.patch | 38 ------------
 .../libffi/{libffi_3.3.bb => libffi_3.4.2.bb} | 10 +--
 7 files changed, 19 insertions(+), 213 deletions(-)
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
 delete mode 100644 meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch
 rename meta/recipes-support/libffi/{libffi_3.3.bb => libffi_3.4.2.bb} (72%)

diff --git a/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch b/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch
deleted file mode 100644
index 6b5b7d4747..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128-part2.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Address platforms with no __int128.
-
-Fixes remaining pieces from
-https://github.com/libffi/libffi/commit/6663047f56c2932a6b10a790f4ac6666dd181326
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/src/powerpc/ffi_linux64.c.org	2019-12-05 14:48:33.140579431 -0800
-+++ a/src/powerpc/ffi_linux64.c	2019-12-05 14:53:58.827244495 -0800
-@@ -680,9 +680,9 @@ ffi_prep_args64 (extended_cif *ecif, uns
-                     {
-                       if (vecarg_count < NUM_VEC_ARG_REGISTERS64
-                           && i < nfixedargs)
--                        *vec_base.f128++ = *arg.f128++;
-+		        memcpy (vec_base.f128++, arg.f128, sizeof (float128));
-                       else
--                        *next_arg.f128 = *arg.f128++;
-+		        memcpy (next_arg.f128, arg.f128++, sizeof (float128));
-                       if (++next_arg.f128 == gpr_end.f128)
-                         next_arg.f128 = rest.f128;
-                       vecarg_count++;
-@@ -986,9 +986,9 @@ ffi_closure_helper_LINUX64 (ffi_cif *cif
-                   do
-                     {
-                       if (pvec < end_pvec && i < nfixedargs)
--                        *to.f128 = *pvec++;
-+		        memcpy (to.f128, pvec++, sizeof (float128));
-                       else
--                        *to.f128 = *from.f128;
-+		        memcpy (to.f128, from.f128, sizeof (float128));
-                       to.f128++;
-                       from.f128++;
-                     }
diff --git a/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch b/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch
deleted file mode 100644
index 2e32a50296..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-Address-platforms-with-no-__int128.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 68f45b9049dffb54f5a29a3a495ab3dfcf010634 Mon Sep 17 00:00:00 2001
-From: Anthony Green <green@moxielogic.com>
-Date: Fri, 29 Nov 2019 07:00:35 -0500
-Subject: [PATCH] Address platforms with no __int128.
-
-Upstream-Status: Backport [https://github.com/libffi/libffi/commit/6663047f56c2932a6b10a790f4ac6666dd181326]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/powerpc/ffi_linux64.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/powerpc/ffi_linux64.c b/src/powerpc/ffi_linux64.c
-index de0d033..7364770 100644
---- a/src/powerpc/ffi_linux64.c
-+++ b/src/powerpc/ffi_linux64.c
-@@ -547,9 +547,9 @@ ffi_prep_args64 (extended_cif *ecif, unsigned long *const stack)
-               if (next_arg.ul == gpr_end.ul)
-                 next_arg.ul = rest.ul;
-               if (vecarg_count < NUM_VEC_ARG_REGISTERS64 && i < nfixedargs)
--                *vec_base.f128++ = **p_argv.f128;
-+		memcpy (vec_base.f128++, *p_argv.f128, sizeof (float128));
-               else
--                *next_arg.f128 = **p_argv.f128;
-+		memcpy (next_arg.f128, *p_argv.f128, sizeof (float128));
-               if (++next_arg.f128 == gpr_end.f128)
-                 next_arg.f128 = rest.f128;
-               vecarg_count++;
diff --git a/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch b/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
deleted file mode 100644
index 397194bc93..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-Fixed-missed-ifndef-for-__mips_soft_float.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 14e2e74682db3bfcf057688f738fdd842a02ff2d Mon Sep 17 00:00:00 2001
-From: Carl Hurd <carl@Carls-MacBook-Pro.local>
-Date: Wed, 18 Jul 2018 09:04:32 -0400
-Subject: [PATCH] Fixed missed #ifndef for __mips_soft_float
-
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/442]
----
- src/mips/o32.S | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/mips/o32.S b/src/mips/o32.S
-index 44e74cb..799139b 100644
---- a/src/mips/o32.S
-+++ b/src/mips/o32.S
-@@ -282,9 +282,11 @@ $LCFI12:
- 	li	$13, 1		# FFI_O32
- 	bne	$16, $13, 1f	# Skip fp save if FFI_O32_SOFT_FLOAT
- 	
-+#ifndef __mips_soft_float
- 	# Store all possible float/double registers.
- 	s.d	$f12, FA_0_0_OFF2($fp)
- 	s.d	$f14, FA_1_0_OFF2($fp)
-+#endif
- 1:
- 	# prepare arguments for ffi_closure_mips_inner_O32
- 	REG_L	a0, 4($15)	 # cif 
diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
index 782dce70d8..5e529d1ce7 100644
--- a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
+++ b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
@@ -4,9 +4,9 @@ Date: Fri, 27 Nov 2020 15:28:42 +0000
 Subject: [PATCH] arm/sysv: reverted clang VFP mitigation
 
 Since commit e3d2812ce43940aacae5bab2d0e965278cb1e7ea,
-seperate instructions were used when compiling under clang, 
+seperate instructions were used when compiling under clang,
 as clang didn't allow the directives at the time. This mitigation
-now causes compilation to fail under clang 10, as described by 
+now causes compilation to fail under clang 10, as described by
 https://github.com/libffi/libffi/issues/607. Now that
 clang supports the LDC and SDC instructions, this mitigation
 has been reverted.
@@ -18,25 +18,25 @@ Signed-off-by: Brett Warren <brett.warren@arm.com>
  1 file changed, 33 deletions(-)
 
 diff --git a/src/arm/sysv.S b/src/arm/sysv.S
-index 63180a4..e3ce526 100644
+index fb36213..e4272a1 100644
 --- a/src/arm/sysv.S
 +++ b/src/arm/sysv.S
-@@ -128,13 +128,8 @@ ARM_FUNC_START(ffi_call_VFP)
- 	cfi_startproc
+@@ -142,13 +142,8 @@ ARM_FUNC_START(ffi_call_VFP)
  
  	cmp	r3, #3			@ load only d0 if possible
+ 	ite	le
 -#ifdef __clang__
--	vldrle d0, [sp]
--	vldmgt sp, {d0-d7}
+-	vldrle d0, [r0]
+-	vldmgt r0, {d0-d7}
 -#else
- 	ldcle	p11, cr0, [r0]		@ vldrle d0, [sp]
- 	ldcgt	p11, cr0, [r0], {16}	@ vldmgt sp, {d0-d7}
+ 	ldcle	p11, cr0, [r0]		@ vldrle d0, [r0]
+ 	ldcgt	p11, cr0, [r0], {16}	@ vldmgt r0, {d0-d7}
 -#endif
  	add	r0, r0, #64		@ discard the vfp register args
  	/* FALLTHRU */
  ARM_FUNC_END(ffi_call_VFP)
-@@ -172,25 +167,13 @@ ARM_FUNC_START(ffi_call_SYSV)
- 	nop
+@@ -193,25 +188,13 @@ ARM_FUNC_START(ffi_call_SYSV)
+ #endif
  0:
  E(ARM_TYPE_VFP_S)
 -#ifdef __clang__
@@ -61,7 +61,7 @@ index 63180a4..e3ce526 100644
  	pop	{fp,pc}
  E(ARM_TYPE_INT64)
  	str	r1, [r2, #4]
-@@ -287,11 +270,7 @@ ARM_FUNC_START(ffi_closure_VFP)
+@@ -320,11 +303,7 @@ ARM_FUNC_START(ffi_closure_VFP)
  	add	ip, sp, #16
  	sub	sp, sp, #64+32			@ allocate frame
  	cfi_adjust_cfa_offset(64+32)
@@ -73,7 +73,7 @@ index 63180a4..e3ce526 100644
  	stmdb	sp!, {ip,lr}
  
  	/* See above.  */
-@@ -320,25 +299,13 @@ ARM_FUNC_START_LOCAL(ffi_closure_ret)
+@@ -358,25 +337,13 @@ ARM_FUNC_START_LOCAL(ffi_closure_ret)
  	cfi_rel_offset(lr, 4)
  0:
  E(ARM_TYPE_VFP_S)
@@ -82,23 +82,23 @@ index 63180a4..e3ce526 100644
 -#else
  	ldc	p10, cr0, [r2]			@ vldr s0, [r2]
 -#endif
- 	ldm	sp, {sp,pc}
+ 	b	call_epilogue
  E(ARM_TYPE_VFP_D)
 -#ifdef __clang__
 -	vldr d0, [r2]
 -#else
  	ldc	p11, cr0, [r2]			@ vldr d0, [r2]
 -#endif
- 	ldm	sp, {sp,pc}
+ 	b	call_epilogue
  E(ARM_TYPE_VFP_N)
 -#ifdef __clang__
 -	vldm r2, {d0-d3}
 -#else
  	ldc	p11, cr0, [r2], {8}		@ vldm r2, {d0-d3}
 -#endif
- 	ldm	sp, {sp,pc}
+ 	b	call_epilogue
  E(ARM_TYPE_INT64)
  	ldr	r1, [r2, #4]
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch b/meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
deleted file mode 100644
index 52e6e4536b..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From de93adfb6f48100946bba2c3abad2a77a0cfde0b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Nov 2019 09:52:01 +0100
-Subject: [PATCH] ffi_powerpc.h: fix build failure with powerpc7
-
-This is a patch pulled down from the following:
-https://github.com/buildroot/buildroot/blob/78926f610b1411b03464152472fd430012deb9ac/package/libffi/0004-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch
-
-This issue is being hit on OpenBMC code when pulling the latest
-libffi tag and building on a P8 ppc64le machine. I verified this
-patch fixes the issue we are seeing.
-
-Below is the original commit message:
-
-Sicne commit 73dd43afc8a447ba98ea02e9aad4c6898dc77fb0, build on powerpc7
-fails on:
-
-In file included from ../src/powerpc/ffi.c:33:0:
-../src/powerpc/ffi_powerpc.h:61:9: error: '_Float128' is not supported on this target
- typedef _Float128 float128;
-         ^~~~~~~~~
-
-Fix this build failure by checking for __HAVE_FLOAT128 before using
-_Float128, as _Float128 is enabled only on specific conditions, see
-output/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/bits/floatn.h:
-
- /* Defined to 1 if the current compiler invocation provides a
-    floating-point type with the IEEE 754 binary128 format, and this glibc
-    includes corresponding *f128 interfaces for it.  */
- #if defined _ARCH_PWR8 && defined __LITTLE_ENDIAN__ && (_CALL_ELF == 2) \
-     && defined __FLOAT128__ && !defined __NO_LONG_DOUBLE_MATH
- # define __HAVE_FLOAT128 1
- #else
- # define __HAVE_FLOAT128 0
- #endif
-
-Fixes:
- - http://autobuild.buildroot.org/results/5c9dd8fb3b6a128882b6250f197c80232d8a3b53
-
-Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/561]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Andrew Geissler <geissonator@yahoo.com>
----
- src/powerpc/ffi_powerpc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
-index 8e2f2f0..960a5c4 100644
---- a/src/powerpc/ffi_powerpc.h
-+++ b/src/powerpc/ffi_powerpc.h
-@@ -57,7 +57,7 @@ typedef union
-   double d;
- } ffi_dblfl;
-
--#if defined(__FLOAT128_TYPE__)
-+#if defined(__FLOAT128_TYPE__) && defined(__HAVE_FLOAT128)
- typedef _Float128 float128;
- #elif defined(__FLOAT128__)
- typedef __float128 float128;
---
-2.21.0 (Apple Git-122)
-
diff --git a/meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch b/meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch
deleted file mode 100644
index 8a7aea4311..0000000000
--- a/meta/recipes-support/libffi/libffi/0001-powerpc-fix-build-failure-on-power7-and-older-532.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4dc6cc961300b9deffb648b1237390a5bea1c6d6 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Thu, 28 Nov 2019 12:42:41 +0000
-Subject: [PATCH] powerpc: fix build failure on power7 and older (#532)
-
-Build failure looks as:
-```
-libtool: compile:  powerpc-unknown-linux-gnu-gcc \
-    -O2 -mcpu=powerpc -mtune=powerpc -pipe ... -c src/powerpc/ffi.c ...
-In file included from src/powerpc/ffi.c:33:
-src/powerpc/ffi_powerpc.h:65:9: error: '__int128' is not supported on this target
-   65 | typedef __int128 float128;
-      |         ^~~~~~~~
-```
-
-The fix avoids using __int128 in favour of aligned char[16].
-
-Closes: https://github.com/libffi/libffi/issues/531
-Upstream-Status: Backport [https://github.com/libffi/libffi/commit/01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd]
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/powerpc/ffi_powerpc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
-index 5ee2a70..8e2f2f0 100644
---- a/src/powerpc/ffi_powerpc.h
-+++ b/src/powerpc/ffi_powerpc.h
-@@ -62,7 +62,7 @@ typedef _Float128 float128;
- #elif defined(__FLOAT128__)
- typedef __float128 float128;
- #else
--typedef __int128 float128;
-+typedef char float128[16] __attribute__((aligned(16)));
- #endif
- 
- void FFI_HIDDEN ffi_closure_SYSV (void);
diff --git a/meta/recipes-support/libffi/libffi_3.3.bb b/meta/recipes-support/libffi/libffi_3.4.2.bb
similarity index 72%
rename from meta/recipes-support/libffi/libffi_3.3.bb
rename to meta/recipes-support/libffi/libffi_3.4.2.bb
index 10ef003242..47b230afa2 100644
--- a/meta/recipes-support/libffi/libffi_3.3.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
@@ -8,19 +8,13 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=492385fe22195952f5b9b197868ba268"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=679b5c9bdc79a2b93ee574e193e7a7bc"
 
 SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
-           file://0001-Fixed-missed-ifndef-for-__mips_soft_float.patch \
            file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
-           file://0001-powerpc-fix-build-failure-on-power7-and-older-532.patch \
-           file://0001-Address-platforms-with-no-__int128.patch \
-           file://0001-Address-platforms-with-no-__int128-part2.patch \
-           file://0001-ffi_powerpc.h-fix-build-failure-with-powerpc7.patch \
            "
-SRC_URI[md5sum] = "6313289e32f1d38a9df4770b014a2ca7"
-SRC_URI[sha256sum] = "72fba7922703ddfa7a028d513ac15a85c8d54c8d67f55fa5a4802885dc652056"
+SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620"
 UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
 UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1

