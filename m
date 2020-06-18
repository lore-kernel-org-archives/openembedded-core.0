Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web12.10581.1592494966096481434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=i1B2nAfU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id g7so4841508oti.13
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BjiV0Mb37ZLkxvhqAf1BHpoVHE+e6l/SdSXlureaTjM=;
        b=i1B2nAfUABfS8dIwphLk+HPCHOsubWD9Fn8s0W+nHBnCghWKoOvjHuwGBAeqPO/bpr
         1JiZ3RsdSaWXcIe/iiNvDxKISm+LQcpF9A4mnjM67vXqTpOVqvywHOqKv3gmDcvEfYmG
         OFOUzMm/SlHuruJk2Gw9kU9b9VYe4RHpieSpIc9e6fMgBuW75QDJtl/o8pUWQQFd/UBC
         nEI/ax8PaQqLH3BrzkGJT17Nc1MK4OHn31xfjIJu1ahavwcJBGr4w14q7UJ54nTqTNiW
         rUN/GR4f1SYvoS6W/0em0SP6bHKDHhQCu9VMZo5Hkox22GbNmalp4VsPg8L7Pj8qBQVQ
         f3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BjiV0Mb37ZLkxvhqAf1BHpoVHE+e6l/SdSXlureaTjM=;
        b=bo6Ab+hTv8EvuvA/yWRuHU9pVkAgDjlaKWUg9qz8jIKB/blbg35SH2K5xLOStjCw8A
         PZNWjrQgdNV4jUHvwH0P5VlPQ28lkoh9vOQ1Y2Wo/879rkyuo16k30miaohL8+RD5RBa
         nSfTTdE0p2ubOiYUGzYFiRHLFVgl5q2mS96WKyVmZgC/tqScGs2VQOQP5NYi1dSdojvD
         OuVzhTRyhJ7QsHZ0jrYORhhOhHHbbnjr9kna9fvTpRKTCZJjn1t2ion92r8VNgPfQFdT
         akqx8FxNW9/PE03FA2JdiJ4x0+5+AJC3/bNXL5qW2C1/DWAUUIJ+dLMqIB7dK7iaE8qI
         25Ug==
X-Gm-Message-State: AOAM5306CIQiSR1unqnTbttnjLp89gDE8GOeweWM4DX6Q0ozCW9OJZkD
	Dh7f1jRyEkQeqdUWRMViZ/0ydFxfv21iwQ==
X-Google-Smtp-Source: ABdhPJySNTWVlwqjAbtx3vl7k7m79onJE4v2fTTT6QqdIKw25WKO4by/VfImkFhKOKw/pq13jrbUjQ==
X-Received: by 2002:a9d:456:: with SMTP id 80mr3910846otc.2.1592494964436;
        Thu, 18 Jun 2020 08:42:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/21] glibc: Update to latest on 2.31 branch
Date: Thu, 18 Jun 2020 05:40:44 -1000
Message-Id: <04e5d5f5a4318c826768146f5cd5de03fd152550.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

There are few fixes specifically for compiling with gcc10 that are good
to have, before hitting them later

Backport build fix from master for aarch64 with gcc10

Drop CVE-2020-10029 patch its already applied on latest 2.31 branch

latest glibc 2.31 added fix for __getauxval/aarch64 issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c7e0e0bf32eb1ed0b7d8acddb16c0d1e93f2aa1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../0030-Improve-IFUNC-check-BZ-25506.patch   |  47 -----
 ...-with-GCC-10-when-long-double-double.patch | 170 ------------------
 .../glibc/glibc/CVE-2020-10029.patch          | 128 -------------
 meta/recipes-core/glibc/glibc_2.31.bb         |   3 -
 5 files changed, 1 insertion(+), 349 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-10029.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 4c72eedf41..c2d68979eb 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31+git${SRCPV}"
-SRCREV_glibc ?= "71f2b249a28e17eac0e47c53af44d5c5b65101aa"
+SRCREV_glibc ?= "109474122400ca7d60782b131dc867a5c1f2fe55"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
diff --git a/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch b/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
deleted file mode 100644
index 1cb398d2bc..0000000000
--- a/meta/recipes-core/glibc/glibc/0030-Improve-IFUNC-check-BZ-25506.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 87a698a21646b7ee620923ef5ffa9735471a8ddd Mon Sep 17 00:00:00 2001
-From: Fangrui Song <maskray@google.com>
-Date: Tue, 4 Feb 2020 21:55:44 -0800
-Subject: [PATCH] Improve IFUNC check [BZ #25506]
-
-GNU ld's RISCV port does not support IFUNC. ld -no-pie produces no
-relocation and the test passed incorrectly. Be more rigid by testing
-IRELATIVE explicitly.
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=87a698a21646b7ee620923ef5ffa9735471a8ddd]
-Tested-by: Aurelien Jarno <aurelien@aurel32.net>
-Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index b959d2d988..3b98ec312f 100755
---- a/configure
-+++ b/configure
-@@ -4035,7 +4035,7 @@ if ${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS \
- 	    -o conftest conftest.S 1>&5 2>&5; then
-   # Do a link to see if the backend supports IFUNC relocs.
-   $READELF -r conftest 1>&5
--  LC_ALL=C $READELF -r conftest | grep 'no relocations' >/dev/null || {
-+  LC_ALL=C $READELF -Wr conftest | grep -q 'IRELATIVE\|R_SPARC_JMP_IREL' && {
-     libc_cv_ld_gnu_indirect_function=yes
-   }
- fi
-diff --git a/configure.ac b/configure.ac
-index 49b900c1ed..e20034f301 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -649,7 +649,7 @@ if ${CC-cc} $CFLAGS $CPPFLAGS $LDFLAGS \
- 	    -o conftest conftest.S 1>&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD; then
-   # Do a link to see if the backend supports IFUNC relocs.
-   $READELF -r conftest 1>&AS_MESSAGE_LOG_FD
--  LC_ALL=C $READELF -r conftest | grep 'no relocations' >/dev/null || {
-+  LC_ALL=C $READELF -Wr conftest | grep -q 'IRELATIVE\|R_SPARC_JMP_IREL' && {
-     libc_cv_ld_gnu_indirect_function=yes
-   }
- fi
--- 
-2.25.1
-
diff --git a/meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch b/meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch
deleted file mode 100644
index 72622961ad..0000000000
--- a/meta/recipes-core/glibc/glibc/0031-Fix-build-with-GCC-10-when-long-double-double.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From 49348beafe9ba150c9bd48595b3f372299bddbb0 Mon Sep 17 00:00:00 2001
-From: Joseph Myers <joseph@codesourcery.com>
-Date: Tue, 17 Mar 2020 22:57:42 +0000
-Subject: [PATCH] Fix build with GCC 10 when long double = double.
-
-On platforms where long double has the same ABI as double, glibc
-defines long double functions as aliases for the corresponding double
-functions.  The declarations of those functions in <math.h> are
-disabled to avoid problems with aliases having incompatible types, but
-GCC 10 now gives errors for incompatible types when the long double
-function is known to GCC as a built-in function, not just when there
-is an incompatible header declaration.
-
-This patch fixes those errors by using appropriate
--fno-builtin-<function> options to compile the double functions.  The
-list of CFLAGS-* settings is an appropriately adapted version of that
-in sysdeps/ieee754/ldbl-opt/Makefile used there for building nldbl-*.c
-files; in particular, the options are used even if GCC does not
-currently have a built-in function of a given function, so that adding
-such a built-in function in future will not break the glibc build.
-Thus, various of the CFLAGS-* settings are only for future-proofing
-and may not currently be needed (and it's possible some could be
-irrelevant for other reasons).
-
-Tested with build-many-glibcs.py for arm-linux-gnueabi (compilers and
-glibcs builds), where it fixes the build that previously failed.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=49348beafe9ba150c9bd48595b3f372299bddbb0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- math/Makefile | 122 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 122 insertions(+)
-
-diff --git a/math/Makefile b/math/Makefile
-index 84a8b94c74..0a5a40430e 100644
---- a/math/Makefile
-+++ b/math/Makefile
-@@ -650,6 +650,128 @@ ifneq ($(long-double-fcts),yes)
- # We won't compile the `long double' code at all.  Tell the `double' code
- # to define aliases for the `FUNCl' names.
- math-CPPFLAGS += -DNO_LONG_DOUBLE
-+# GCC 10 diagnoses aliases with types conflicting with built-in
-+# functions.
-+CFLAGS-w_acos.c += -fno-builtin-acosl
-+CFLAGS-w_acosh.c += -fno-builtin-acoshl
-+CFLAGS-w_asin.c += -fno-builtin-asinl
-+CFLAGS-s_asinh.c += -fno-builtin-asinhl
-+CFLAGS-s_atan.c += -fno-builtin-atanl
-+CFLAGS-w_atan2.c += -fno-builtin-atan2l
-+CFLAGS-w_atanh.c += -fno-builtin-atanhl
-+CFLAGS-s_cabs.c += -fno-builtin-cabsl
-+CFLAGS-s_cacos.c += -fno-builtin-cacosl
-+CFLAGS-s_cacosh.c += -fno-builtin-cacoshl
-+CFLAGS-s_canonicalize.c += -fno-builtin-canonicalizel
-+CFLAGS-s_carg.c += -fno-builtin-cargl
-+CFLAGS-s_casin.c += -fno-builtin-casinl
-+CFLAGS-s_casinh.c += -fno-builtin-casinhl
-+CFLAGS-s_catan.c += -fno-builtin-catanl
-+CFLAGS-s_catanh.c += -fno-builtin-catanhl
-+CFLAGS-s_cbrt.c += -fno-builtin-cbrtl
-+CFLAGS-s_ccos.c += -fno-builtin-ccosl
-+CFLAGS-s_ccosh.c += -fno-builtin-ccoshl
-+CFLAGS-s_ceil.c += -fno-builtin-ceill
-+CFLAGS-s_cexp.c += -fno-builtin-cexpl
-+CFLAGS-s_cimag.c += -fno-builtin-cimagl
-+CFLAGS-s_clog.c += -fno-builtin-clogl
-+CFLAGS-s_clog10.c += -fno-builtin-clog10l
-+CFLAGS-s_conj.c += -fno-builtin-conjl
-+CFLAGS-s_copysign.c += -fno-builtin-copysignl
-+CFLAGS-s_cos.c += -fno-builtin-cosl
-+CFLAGS-w_cosh.c += -fno-builtin-coshl
-+CFLAGS-s_cpow.c += -fno-builtin-cpowl
-+CFLAGS-s_cproj.c += -fno-builtin-cprojl
-+CFLAGS-s_creal.c += -fno-builtin-creall
-+CFLAGS-s_csin.c += -fno-builtin-csinl
-+CFLAGS-s_csinh.c += -fno-builtin-csinhl
-+CFLAGS-s_csqrt.c += -fno-builtin-csqrtl
-+CFLAGS-s_ctan.c += -fno-builtin-ctanl
-+CFLAGS-s_ctanh.c += -fno-builtin-ctanhl
-+CFLAGS-s_dadd.c += -fno-builtin-daddl
-+CFLAGS-s_ddiv.c += -fno-builtin-ddivl
-+CFLAGS-s_dmul.c += -fno-builtin-dmull
-+CFLAGS-s_dsub.c += -fno-builtin-dsubl
-+CFLAGS-s_erf.c += -fno-builtin-erfl
-+CFLAGS-s_erfc.c += -fno-builtin-erfcl
-+CFLAGS-e_exp.c += -fno-builtin-expl
-+CFLAGS-w_exp10.c += -fno-builtin-exp10l
-+CFLAGS-e_exp2.c += -fno-builtin-exp2l
-+CFLAGS-s_expm1.c += -fno-builtin-expm1l
-+CFLAGS-s_fabs.c += -fno-builtin-fabsl
-+CFLAGS-s_fadd.c += -fno-builtin-faddl
-+CFLAGS-s_fdim.c += -fno-builtin-fdiml
-+CFLAGS-s_fdiv.c += -fno-builtin-fdivl
-+CFLAGS-s_finite.c += -fno-builtin-finitel
-+CFLAGS-s_floor.c += -fno-builtin-floorl
-+CFLAGS-s_fma.c += -fno-builtin-fmal
-+CFLAGS-s_fmax.c += -fno-builtin-fmaxl
-+CFLAGS-s_fmaxmag.c += -fno-builtin-fmaxmagl
-+CFLAGS-s_fmin.c += -fno-builtin-fminl
-+CFLAGS-s_fminmag.c += -fno-builtin-fminmagl
-+CFLAGS-w_fmod.c += -fno-builtin-fmodl
-+CFLAGS-s_fmul.c += -fno-builtin-fmull
-+CFLAGS-s_frexp.c += -fno-builtin-frexpl
-+CFLAGS-s_fromfp.c += -fno-builtin-fromfpl
-+CFLAGS-s_fromfpx.c += -fno-builtin-fromfpxl
-+CFLAGS-s_fsub.c += -fno-builtin-fsubl
-+CFLAGS-s_gamma.c += -fno-builtin-gammal
-+CFLAGS-s_getpayload.c += -fno-builtin-getpayloadl
-+CFLAGS-w_hypot.c += -fno-builtin-hypotl
-+CFLAGS-w_ilogb.c += -fno-builtin-ilogbl
-+CFLAGS-s_isinf.c += -fno-builtin-isinfl
-+CFLAGS-s_isnan.c += -fno-builtin-isnanl
-+CFLAGS-w_j0.c += -fno-builtin-j0l
-+CFLAGS-w_j1.c += -fno-builtin-j1l
-+CFLAGS-w_jn.c += -fno-builtin-jnl
-+CFLAGS-s_ldexp.c += -fno-builtin-ldexpl
-+CFLAGS-w_lgamma.c += -fno-builtin-lgammal
-+CFLAGS-w_lgamma_r.c += -fno-builtin-lgammal_r
-+CFLAGS-w_llogb.c += -fno-builtin-llogbl
-+CFLAGS-s_llrint.c += -fno-builtin-llrintl
-+CFLAGS-s_llround.c += -fno-builtin-llroundl
-+CFLAGS-e_log.c += -fno-builtin-logl
-+CFLAGS-w_log10.c += -fno-builtin-log10l
-+CFLAGS-w_log1p.c += -fno-builtin-log1pl
-+CFLAGS-e_log2.c += -fno-builtin-log2l
-+CFLAGS-s_logb.c += -fno-builtin-logbl
-+CFLAGS-s_lrint.c += -fno-builtin-lrintl
-+CFLAGS-s_lround.c += -fno-builtin-lroundl
-+CFLAGS-s_modf.c += -fno-builtin-modfl
-+CFLAGS-s_nan.c += -fno-builtin-nanl
-+CFLAGS-s_nearbyint.c += -fno-builtin-nearbyintl
-+CFLAGS-s_nextafter.c += -fno-builtin-nextafterl
-+CFLAGS-s_nextdown.c += -fno-builtin-nextdownl
-+CFLAGS-s_nexttoward.c += -fno-builtin-nexttoward -fno-builtin-nexttowardl
-+CFLAGS-s_nexttowardf.c += -fno-builtin-nexttowardf
-+CFLAGS-s_nextup.c += -fno-builtin-nextupl
-+CFLAGS-e_pow.c += -fno-builtin-powl
-+CFLAGS-w_remainder.c += -fno-builtin-remainderl -fno-builtin-dreml
-+CFLAGS-s_remquo.c += -fno-builtin-remquol
-+CFLAGS-s_rint.c += -fno-builtin-rintl
-+CFLAGS-s_round.c += -fno-builtin-roundl
-+CFLAGS-s_roundeven.c += -fno-builtin-roundevenl
-+CFLAGS-w_scalb.c += -fno-builtin-scalbl
-+CFLAGS-w_scalbln.c += -fno-builtin-scalblnl
-+CFLAGS-s_scalbn.c += -fno-builtin-scalbnl
-+CFLAGS-s_setpayload.c += -fno-builtin-setpayloadl
-+CFLAGS-s_setpayloadsig.c += -fno-builtin-setpayloadsigl
-+CFLAGS-s_significand.c += -fno-builtin-significandl
-+CFLAGS-s_sin.c += -fno-builtin-sinl
-+CFLAGS-s_sincos.c += -fno-builtin-sincosl
-+CFLAGS-w_sinh.c += -fno-builtin-sinhl
-+CFLAGS-w_sqrt.c += -fno-builtin-sqrtl
-+CFLAGS-s_tan.c += -fno-builtin-tanl
-+CFLAGS-s_tanh.c += -fno-builtin-tanhl
-+CFLAGS-w_tgamma.c += -fno-builtin-tgammal
-+CFLAGS-s_totalorder.c += -fno-builtin-totalorderl
-+CFLAGS-s_totalordermag.c += -fno-builtin-totalordermagl
-+CFLAGS-s_trunc.c += -fno-builtin-truncl
-+CFLAGS-s_ufromfp.c += -fno-builtin-ufromfpl
-+CFLAGS-s_ufromfpx.c += -fno-builtin-ufromfpxl
-+CFLAGS-s_y0.c += -fno-builtin-y0l
-+CFLAGS-s_y1.c += -fno-builtin-y1l
-+CFLAGS-s_yn.c += -fno-builtin-ynl
- endif
- 
- # These files quiet sNaNs in a way that is optimized away without
--- 
-2.26.0
-
diff --git a/meta/recipes-core/glibc/glibc/CVE-2020-10029.patch b/meta/recipes-core/glibc/glibc/CVE-2020-10029.patch
deleted file mode 100644
index 22a15f5fdc..0000000000
--- a/meta/recipes-core/glibc/glibc/CVE-2020-10029.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From ce265ec5bc25ec35fba53807abac1b0c8469895e Mon Sep 17 00:00:00 2001
-From: Joseph Myers <joseph@codesourcery.com>
-Date: Wed, 12 Feb 2020 23:31:56 +0000
-Subject: [PATCH] Avoid ldbl-96 stack corruption from range reduction of
-
- pseudo-zero (bug 25487).
-
-Bug 25487 reports stack corruption in ldbl-96 sinl on a pseudo-zero
-argument (an representation where all the significand bits, including
-the explicit high bit, are zero, but the exponent is not zero, which
-is not a valid representation for the long double type).
-
-Although this is not a valid long double representation, existing
-practice in this area (see bug 4586, originally marked invalid but
-subsequently fixed) is that we still seek to avoid invalid memory
-accesses as a result, in case of programs that treat arbitrary binary
-data as long double representations, although the invalid
-representations of the ldbl-96 format do not need to be consistently
-handled the same as any particular valid representation.
-
-This patch makes the range reduction detect pseudo-zero and unnormal
-representations that would otherwise go to __kernel_rem_pio2, and
-returns a NaN for them instead of continuing with the range reduction
-process.  (Pseudo-zero and unnormal representations whose unbiased
-exponent is less than -1 have already been safely returned from the
-function before this point without going through the rest of range
-reduction.)  Pseudo-zero representations would previously result in
-the value passed to __kernel_rem_pio2 being all-zero, which is
-definitely unsafe; unnormal representations would previously result in
-a value passed whose high bit is zero, which might well be unsafe
-since that is not a form of input expected by __kernel_rem_pio2.
-
-Tested for x86_64.
-
-CVE: CVE-2020-10029
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;
-a=patch;h=9333498794cde1d5cca518badf79533a24114b6f]
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-
----
- sysdeps/ieee754/ldbl-96/Makefile           |  3 ++-
- sysdeps/ieee754/ldbl-96/e_rem_pio2l.c      | 12 +++++++++
- sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c | 41 ++++++++++++++++++++++++++++++
- 3 files changed, 55 insertions(+), 1 deletion(-)
- create mode 100644 sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c
-
-diff --git a/sysdeps/ieee754/ldbl-96/Makefile b/sysdeps/ieee754/ldbl-96/Makefile
-index b103254..052c1c7 100644
---- a/sysdeps/ieee754/ldbl-96/Makefile
-+++ b/sysdeps/ieee754/ldbl-96/Makefile
-@@ -17,5 +17,6 @@
- # <https://www.gnu.org/licenses/>.
- 
- ifeq ($(subdir),math)
--tests += test-canonical-ldbl-96 test-totalorderl-ldbl-96
-+tests += test-canonical-ldbl-96 test-totalorderl-ldbl-96 test-sinl-pseudo
-+CFLAGS-test-sinl-pseudo.c += -fstack-protector-all
- endif
-diff --git a/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c b/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c
-index 805de22..1aeccb4 100644
---- a/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c
-+++ b/sysdeps/ieee754/ldbl-96/e_rem_pio2l.c
-@@ -210,6 +210,18 @@ __ieee754_rem_pio2l (long double x, long double *y)
-       return 0;
-     }
- 
-+  if ((i0 & 0x80000000) == 0)
-+    {
-+      /* Pseudo-zero and unnormal representations are not valid
-+	 representations of long double.  We need to avoid stack
-+	 corruption in __kernel_rem_pio2, which expects input in a
-+	 particular normal form, but those representations do not need
-+	 to be consistently handled like any particular floating-point
-+	 value.  */
-+      y[1] = y[0] = __builtin_nanl ("");
-+      return 0;
-+    }
-+
-   /* Split the 64 bits of the mantissa into three 24-bit integers
-      stored in a double array.  */
-   exp = j0 - 23;
-diff --git a/sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c b/sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c
-new file mode 100644
-index 0000000..f59b977
---- /dev/null
-+++ b/sysdeps/ieee754/ldbl-96/test-sinl-pseudo.c
-@@ -0,0 +1,41 @@
-+/* Test sinl for pseudo-zeros and unnormals for ldbl-96 (bug 25487).
-+   Copyright (C) 2020 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <math.h>
-+#include <math_ldbl.h>
-+#include <stdint.h>
-+
-+static int
-+do_test (void)
-+{
-+  for (int i = 0; i < 64; i++)
-+    {
-+      uint64_t sig = i == 63 ? 0 : 1ULL << i;
-+      long double ld;
-+      SET_LDOUBLE_WORDS (ld, 0x4141,
-+			 sig >> 32, sig & 0xffffffffULL);
-+      /* The requirement is that no stack overflow occurs when the
-+	 pseudo-zero or unnormal goes through range reduction.  */
-+      volatile long double ldr;
-+      ldr = sinl (ld);
-+      (void) ldr;
-+    }
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 6605fd3967..2032311b27 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -40,9 +40,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0027-intl-Emit-no-lines-in-bison-generated-files.patch \
            file://0028-inject-file-assembly-directives.patch \
            file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
-           file://CVE-2020-10029.patch \
-           file://0030-Improve-IFUNC-check-BZ-25506.patch \
-           file://0031-Fix-build-with-GCC-10-when-long-double-double.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.17.1

