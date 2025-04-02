Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7DAC36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:17:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2346.1743578261154837284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RAKN8/nX;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2254e0b4b79so4209275ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743578260; x=1744183060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oG6GYfyqqoyYy1A6KQbz7lTDjE+ezfWEpil6fX0U2+s=;
        b=RAKN8/nXeQ3hamfwD87aVQ89pV0jQuysrsVAlEaPmcIyifRayvYuNP/BWflfdPtgB1
         3aTJRah8Oy2tJE4u0FRZP1kpIpffMFQ5fhAJzbEDoLr/HoPr/dAsRtCpvcZXTxsA8nQg
         reSn12KUKGFa4rH5z/un41ApcOQU7XFgB8exXJ8kwLdTYmX1260i7j78aG+OtFuhbXkC
         DfU/fX1f4SHocL2PVrQtX8PIAYMjlYcWwILvzVYog/1ATPuC7Dx8hUlEWVxq0+8LJqSi
         rHayaXrdVm0DIp013dzIxZhsmnxXXguiQm6DfFgKqrpq9mCMora1mIUjkZgiHl5GeSlk
         wgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578260; x=1744183060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oG6GYfyqqoyYy1A6KQbz7lTDjE+ezfWEpil6fX0U2+s=;
        b=fZldoKn2gpB3IAW+Sg9DCzza4SgkxjJLHe6irUz1Yx6oXsebtn9dAVxachd0jBF9bq
         viZvFZ6hQtG1EAKVjTY+6xk64WDPDdALVgzyPZ0GgA1DWifh1S/xNms7lXfkXsDGUA/x
         azmTjqX9otE0y4VfU9HzEoltmSgl5JFtAYiYuPk3yyOf1UMKrZu4sNJy4Aefa0f8gKCx
         H/08cgpojDhOsnYc+EZ6bVB0dGLTzr6bpfSg2HKpb1VTGEHzPMoZGBPTuTIPf7O7c+yl
         iFAhzKP4koHXY10f7U0PKKJ81FrKx3V+UloEoOjrpbgrsKaqULczxQJ+kfo9DwxNM+TH
         NS6Q==
X-Gm-Message-State: AOJu0Yw5qDDKYx8lm1/ocPrJjPxQCbJZXJgGJ6ARwe1zGXEyXbzQcATS
	Xcr37UQcTGW1FvKq+Ai0MECcrUCYej5W5Bn1r3aO0ZMifwdJzsMO7X6LZMtl
X-Gm-Gg: ASbGncuhBnQhDhaeAM6BjGfcscKhDUsmlRwszjou2QYM1b8x6fzXjyfuFLwwTTKtgEn
	Lu5k0lGaDSwN5xVoFQx/QDG2V0ZZV/VWcEMkhEDZU+cS03kjFBdos73KT33r1Vg3cLYQSwWUALi
	D0uEsQyEoBfApx7Pk6n7SHxObiOlygV8wMwC5HGCBCL6t9D5Mrb0MbtDp7yQpPMG6Asn62cRd7U
	w0FwhqV4Fp7l18NbvQpSuteVKDvmtFQ/QuE9x/AAweuDgvZW9icYVFNB2yJzxHvrc1lNbpdP+NS
	vqjXCTDUR2Op7ifkeHOVUjx3PQoIh9hGscku
X-Google-Smtp-Source: AGHT+IEH088ETcKN9uEZKNK2Wpk32GbhLHLIX/CpHlvi63E1LRsowSkyl2YSkrk8z60By5i6f0siiw==
X-Received: by 2002:a05:6a00:180b:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73980487652mr26686121b3a.20.1743578260011;
        Wed, 02 Apr 2025 00:17:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm10215845b3a.48.2025.04.02.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:17:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mpfr: upgrade 4.2.1 -> 4.2.2
Date: Wed,  2 Apr 2025 00:17:36 -0700
Message-ID: <20250402071736.1547418-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402071736.1547418-1-raj.khem@gmail.com>
References: <20250402071736.1547418-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214224

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-use-predefined-_Float128-definitio.patch | 356 ------------------
 .../mpfr/{mpfr_4.2.1.bb => mpfr_4.2.2.bb}     |   3 +-
 2 files changed, 1 insertion(+), 358 deletions(-)
 delete mode 100644 meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch
 rename meta/recipes-support/mpfr/{mpfr_4.2.1.bb => mpfr_4.2.2.bb} (85%)

diff --git a/meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch b/meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch
deleted file mode 100644
index bb813ee94d9..00000000000
--- a/meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch
+++ /dev/null
@@ -1,356 +0,0 @@
-From c37c9d599b9aced92e182507bf223440bbc9a9f1 Mon Sep 17 00:00:00 2001
-From: Vincent Lefevre <vincent@vinc17.net>
-Date: Thu, 6 Mar 2025 01:34:28 +0100
-Subject: [PATCH] Portability: clean up support for binary128 (a.k.a.
- float128).
-
-This fixes a configure failure with Clang and glibc 2.41:
-  https://bugs.gentoo.org/949962
-  https://sourceware.org/bugzilla/show_bug.cgi?id=32750
-  https://sympa.inria.fr/sympa/arc/mpfr/2025-02/msg00025.html
-  https://sympa.inria.fr/sympa/arc/mpfr/2025-03/msg00001.html
-
-The issue is the following: in its configure script, GNU MPFR first
-tests whether _Float128 is supported (without header inclusions);
-if it isn't, MPFR then tests whether __float128 is supported, and
-in such a case, it defines _Float128 as __float128 with
-
-  AC_DEFINE([_Float128],[__float128],[__float128 fallback])
-
-As Clang supports __float128 but not _Float128 (at least on x86_64,
-up to version 19), this fallback is selected. But glibc 2.41 has a
-similar fallback, with a typedef:
-
-  typedef __float128 _Float128;
-
-With the MPFR _Float128 macro defined as __float128, as soon as some
-header such as <stdio.h> is included, this yields
-
-  typedef __float128 __float128;
-
-which is incorrect. This first occurs in the
-
-  AC_MSG_CHECKING(for GMP_NUMB_BITS and sizeof(mp_limb_t) consistency)
-  [...]
-
-configure test (in configure.ac), hence the failure of this test and
-the configure script.
-
-As an attempt to avoid such an issue with header inclusion, a solution
-should be to include the common headers in every configure test.
-
-But since _Float128 is a reserved identifier, we must avoid defining
-it as a macro (a typedef would also be incorrect). This is done here,
-by defining a mpfr_float128 macro instead. In the public mpfr.h header
-file, if the user has defined MPFR_WANT_FLOAT128: mpfr_float128 will
-be defined as _Float128 by default (thus this will not change the API),
-but if _Float128 is not supported, the user should define mpfr_float128
-as __float128 (or an equivalent type that is supported).
-
-* acinclude.m4: changed _Float128 to mpfr_float128 in AC_DEFINE.
-* configure.ac: updated a comment about _Float128.
-* doc/README.dev: update about MPFR_WANT_FLOAT128 and _Float128.
-* doc/mpfr.texi: in "Nomenclature and Types", added a paragraph about
-  binary128 support and the mpfr_float128 macro; update concerning the
-  functions related to binary128 (in particular, in the prototypes,
-  changed _Float128 to mpfr_float128).
-* src/mpfr.h: under "#ifdef MPFR_WANT_FLOAT128", define mpfr_float128
-  as _Float128 if not defined yet; in the prototypes, changed
-  _Float128 to mpfr_float128.
-* src/get_float128.c, src/set_float128.c, tests/tset_float128.c:
-  changed _Float128 to mpfr_float128; updated comments.
-* tests/tversion.c: for "float128 = yes", also output the actual type.
-
-Upstream-Status: Backport [https://gitlab.inria.fr/mpfr/mpfr/-/commit/c37c9d599b9aced92e182507bf223440bbc9a9f1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>                                             
----
- acinclude.m4          | 11 +++++++----
- configure.ac          |  2 +-
- doc/README.dev        | 11 ++---------
- doc/mpfr.texi         | 37 ++++++++++++++++++++++++++-----------
- src/get_float128.c    | 17 ++++++++++-------
- src/mpfr.h            | 10 ++++++++--
- src/set_float128.c    | 15 +++++++++------
- tests/tset_float128.c |  8 ++++----
- tests/tversion.c      |  8 +++++++-
- 9 files changed, 74 insertions(+), 45 deletions(-)
-
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -781,8 +781,11 @@ fi
- # End of decimal float checks
- 
- dnl Check if _Float128 or __float128 is available. We also require the
--dnl compiler to support hex constants with the f128 or q suffix (this
--dnl prevents the _Float128 support with GCC's -std=c90, but who cares?).
-+dnl compiler to support hex constants with the f128 or q suffix respectively.
-+dnl If _Float128 is supported, then the mpfr_float128 macro should be
-+dnl defined as this type. We do not define it here because this will be
-+dnl done in mpfr.h, and not defining it here is the only way to ensure
-+dnl that under "make check", mpfr.h really defines it.
- dnl Note: We use AC_LINK_IFELSE instead of AC_COMPILE_IFELSE since an
- dnl error may occur only at link time, such as under NetBSD:
- dnl   https://mail-index.netbsd.org/pkgsrc-users/2018/02/02/msg026220.html
-@@ -809,8 +812,8 @@ return x == 0;
- ]])],
-           [AC_MSG_RESULT(yes)
-            AC_DEFINE([MPFR_WANT_FLOAT128],2,
--                     [Build float128 functions with float128 fallback])
--           AC_DEFINE([_Float128],[__float128],[__float128 fallback])],
-+                     [Build float128 functions with __float128 fallback])
-+           AC_DEFINE([mpfr_float128],[__float128],[__float128 fallback])],
-           [AC_MSG_RESULT(no)
-            if test "$enable_float128" = yes; then
-               AC_MSG_ERROR(
---- a/configure.ac
-+++ b/configure.ac
-@@ -277,7 +277,7 @@ AC_ARG_ENABLE(decimal-float,
- 
- dnl Warning! Not to be confused with _Decimal128. Thus it is better
- dnl to say binary128 in the description. It can correspond to either
--dnl _Float128 (ISO/IEC TS 18661) or __float128 (old type name).
-+dnl _Float128 (ISO C23) or __float128 (old type name).
- AC_ARG_ENABLE(float128,
-    [  --disable-float128      explicitly disable binary128 support
-   --enable-float128       build conversion functions from/to binary128
---- a/doc/README.dev
-+++ b/doc/README.dev
-@@ -836,13 +836,6 @@ does not conform to the C standard by de
- 
-    =====================================================================
- 
--In MPFR, _Float128 may be defined as __float128 if the latter is provided
--by the compiler, but not the former. In such a case, do not assume that
--_Float128 and long double are necessarily different types (as required by
--the WG14 N2579 draft "IEC 60559 interchange and extended types").
--
--   =====================================================================
--
- For string suffix selection, do not write expressions of the form
- string + integer, such as
- 
---- a/doc/mpfr.texi
-+++ b/doc/mpfr.texi
-@@ -833,6 +833,26 @@ MPFR has a global (or per-thread) flag f
- provides operations on flags (@ref{Exceptions}). This C data type is used
- to represent a group of flags (or a mask).
- 
-+@cindex binary128
-+@cindex float128
-+@tindex @code{_Float128}
-+@tindex @code{__float128}
-+@tindex @code{mpfr_float128}
-+MPFR can be built with binary128 support (a.k.a.@: float128) for some
-+conversion functions if the @samp{_Float128} type (from ISO C23) or
-+the @samp{__float128} type (a common extension) is available. This is
-+automatically detected, but the @samp{--enable-float128} configure option
-+can also be used to ensure this support.  For this support, MPFR uses a
-+@code{mpfr_float128} macro, which needs to be defined as a supported type
-+for the binary128 format, typically @samp{_Float128} or @samp{__float128},
-+depending on the compiler and the system used to compile the user code.
-+Before including @file{mpfr.h}, the user needs to do the following (in
-+any order): define the @code{MPFR_WANT_FLOAT128} macro and define the
-+@code{mpfr_float128} macro as the actual float128 type; @file{mpfr.h} will
-+define @code{mpfr_float128} as @samp{_Float128} by default, but mainly for
-+compatibility with software written for MPFR@tie{}4.1.x and 4.2.0, where
-+the prototypes used @samp{_Float128}.
-+
- @node MPFR Variable Conventions, Rounding, Nomenclature and Types, MPFR Basics
- @comment  node-name,  next,  previous,  up
- @section MPFR Variable Conventions
-@@ -3646,9 +3666,9 @@ return zero otherwise.
- @end deftypefun
- 
- @deftypefun int mpfr_buildopt_float128_p (void)
--Return a non-zero value if MPFR was compiled with @samp{_Float128} support
--(that is, MPFR was built with the @samp{--enable-float128} configure option),
--return zero otherwise.
-+Return a non-zero value if MPFR was compiled with binary128 support
-+(a.k.a.@: float128), return zero otherwise. @xref{Nomenclature and Types}
-+for additional information.
- @end deftypefun
- 
- @deftypefun int mpfr_buildopt_decimal_p (void)
---- a/src/get_float128.c
-+++ b/src/get_float128.c
-@@ -1,5 +1,5 @@
- /* mpfr_get_float128 -- convert a multiple precision floating-point
--                        number to a _Float128 number
-+                        number to a binary128 (a.k.a. float128) number
- 
- Copyright 2012-2023 Free Software Foundation, Inc.
- Contributed by the AriC and Caramba projects, INRIA.
-@@ -25,17 +25,20 @@ https://www.gnu.org/licenses/ or write t
- 
- #ifdef MPFR_WANT_FLOAT128
- 
-+/* Note: mpfr_get_float128 is a macro defined as the actual binary128 type:
-+   either _Float128 or __float128. */
-+
- /* generic code */
--_Float128
-+mpfr_float128
- mpfr_get_float128 (mpfr_srcptr x, mpfr_rnd_t rnd_mode)
- {
- 
-   if (MPFR_UNLIKELY (MPFR_IS_SINGULAR (x)))
--    return (_Float128) mpfr_get_d (x, rnd_mode);
-+    return (mpfr_float128) mpfr_get_d (x, rnd_mode);
-   else /* now x is a normal non-zero number */
-     {
--      _Float128 r; /* result */
--      _Float128 m;
-+      mpfr_float128 r; /* result */
-+      mpfr_float128 m;
-       mpfr_exp_t e;  /* exponent of x (before rounding) */
-       mpfr_exp_t sh; /* exponent shift, so that x/2^sh is in the double range */
-       const int emin = -16381;
-@@ -62,7 +65,7 @@ mpfr_get_float128 (mpfr_srcptr x, mpfr_r
- 
-           MPFR_SAVE_EXPO_MARK (expo);
- 
--          /* First round x to the target _Float128 precision, taking the
-+          /* First round x to the target binary128 precision, taking the
-              reduced precision of the subnormals into account, so that all
-              subsequent operations are exact (this avoids double rounding
-              problems). */
-@@ -83,7 +86,7 @@ mpfr_get_float128 (mpfr_srcptr x, mpfr_r
-                  always work if GMP_NUMB_BITS > IEEE_FLOAT128_MANT_DIG.
-                  MPFR_LIMB_HIGHBIT has the advantage to fit on 1 bit. */
-               r += yp[i];
--              r *= 1 / (2 * (_Float128) MPFR_LIMB_HIGHBIT);
-+              r *= 1 / (2 * (mpfr_float128) MPFR_LIMB_HIGHBIT);
-             }
- 
-           mpfr_clear (y);
---- a/src/mpfr.h
-+++ b/src/mpfr.h
-@@ -476,8 +476,14 @@ __MPFR_DECLSPEC int mpfr_set_decimal128
- #endif
- __MPFR_DECLSPEC int mpfr_set_ld (mpfr_ptr, long double, mpfr_rnd_t);
- #ifdef MPFR_WANT_FLOAT128
--__MPFR_DECLSPEC int mpfr_set_float128 (mpfr_ptr, _Float128, mpfr_rnd_t);
--__MPFR_DECLSPEC _Float128 mpfr_get_float128 (mpfr_srcptr, mpfr_rnd_t);
-+/* The user is free to define mpfr_float128 as another equivalent type,
-+   such as __float128 if this one is supported by the current compiler
-+   but _Float128 isn't. */
-+# ifndef mpfr_float128
-+#  define mpfr_float128 _Float128
-+# endif
-+__MPFR_DECLSPEC int mpfr_set_float128 (mpfr_ptr, mpfr_float128, mpfr_rnd_t);
-+__MPFR_DECLSPEC mpfr_float128 mpfr_get_float128 (mpfr_srcptr, mpfr_rnd_t);
- #endif
- __MPFR_DECLSPEC int mpfr_set_z (mpfr_ptr, mpz_srcptr, mpfr_rnd_t);
- __MPFR_DECLSPEC int mpfr_set_z_2exp (mpfr_ptr, mpz_srcptr, mpfr_exp_t,
---- a/src/set_float128.c
-+++ b/src/set_float128.c
-@@ -1,4 +1,4 @@
--/* mpfr_set_float128 -- convert a machine _Float128 number to
-+/* mpfr_set_float128 -- convert a binary128 (a.k.a. float128) number to
-                         a multiple precision floating-point number
- 
- Copyright 2012-2023 Free Software Foundation, Inc.
-@@ -26,8 +26,11 @@ https://www.gnu.org/licenses/ or write t
- 
- #ifdef MPFR_WANT_FLOAT128
- 
-+/* Note: mpfr_get_float128 is a macro defined as the actual binary128 type:
-+   either _Float128 or __float128. */
-+
- #if MPFR_WANT_FLOAT128 == 1
--/* _Float128 type from ISO/IEC TS 18661 */
-+/* _Float128 type from ISO C23 */
- # define MPFR_FLOAT128_MAX 0x1.ffffffffffffffffffffffffffffp+16383f128
- #elif MPFR_WANT_FLOAT128 == 2
- /* __float128 type (GNU C extension) */
-@@ -37,12 +40,12 @@ https://www.gnu.org/licenses/ or write t
- #endif
- 
- int
--mpfr_set_float128 (mpfr_ptr r, _Float128 d, mpfr_rnd_t rnd_mode)
-+mpfr_set_float128 (mpfr_ptr r, mpfr_float128 d, mpfr_rnd_t rnd_mode)
- {
-   mpfr_t t;
-   mp_limb_t *tp;
-   int inexact, shift_exp, neg, e, i;
--  _Float128 p[14], q[14];
-+  mpfr_float128 p[14], q[14];
-   MPFR_SAVE_EXPO_DECL (expo);
- 
-   /* Check for NaN */
-@@ -66,7 +69,7 @@ mpfr_set_float128 (mpfr_ptr r, _Float128
-       return 0;
-     }
-   /* Check for ZERO */
--  else if (MPFR_UNLIKELY (d == (_Float128) 0.0))
-+  else if (MPFR_UNLIKELY (d == (mpfr_float128) 0.0))
-     return mpfr_set_d (r, (double) d, rnd_mode);
- 
-   shift_exp = 0; /* invariant: remainder to deal with is d*2^shift_exp */
-@@ -129,7 +132,7 @@ mpfr_set_float128 (mpfr_ptr r, _Float128
- 
-   for (i = MPFR_LAST_LIMB (t); i >= 0; i--)
-     {
--      d *= 2 * (_Float128) MPFR_LIMB_HIGHBIT;
-+      d *= 2 * (mpfr_float128) MPFR_LIMB_HIGHBIT;
-       tp[i] = (mp_limb_t) d;
-       d -= tp[i];
-     }
---- a/tests/tset_float128.c
-+++ b/tests/tset_float128.c
-@@ -33,7 +33,7 @@ https://www.gnu.org/licenses/ or write t
- static void
- check_special (void)
- {
--  _Float128 f;
-+  mpfr_float128 f;
-   mpfr_t x;
- 
-   mpfr_init2 (x, 113);
-@@ -162,7 +162,7 @@ static void
- check_large (void)
- {
-   mpfr_exp_t emin, emax;
--  _Float128 f, e;
-+  mpfr_float128 f, e;
-   int i;
-   mpfr_t x, y;
-   int r;
-@@ -177,7 +177,7 @@ check_large (void)
-   /* check with the largest float128 number 2^16384*(1-2^(-113)) */
-   for (f = 1.0, i = 0; i < 113; i++)
-     f = f + f;
--  f = f - (_Float128) 1.0;
-+  f = f - (mpfr_float128) 1.0;
-   mpfr_set_ui (y, 1, MPFR_RNDN);
-   mpfr_mul_2ui (y, y, 113, MPFR_RNDN);
-   mpfr_sub_ui (y, y, 1, MPFR_RNDN);
-@@ -258,7 +258,7 @@ check_small (void)
- {
-   int t[5] = { 1, 2, 17, 111, 112 };
-   mpfr_exp_t emin;
--  _Float128 e, f;
-+  mpfr_float128 e, f;
-   int i, j, neg, inex, r;
-   mpfr_t w, x, y, z;
- 
---- a/tests/tversion.c
-+++ b/tests/tversion.c
-@@ -309,10 +309,16 @@ main (void)
-       err = 1;
-     }
- 
-+#ifdef MPFR_WANT_FLOAT128
-+# define MPFR_F128 "yes (" MAKE_STR(mpfr_float128) ")"
-+#else
-+# define MPFR_F128 "no"
-+#endif
-+
-   (printf) ("[tversion] TLS = %s, float128 = %s, decimal = %s,"
-             " GMP internals = %s\n",
-             mpfr_buildopt_tls_p () ? "yes" : "no",
--            mpfr_buildopt_float128_p () ? "yes" : "no",
-+            MPFR_F128,
-             mpfr_buildopt_decimal_p () ? "yes"
- #if defined(DECIMAL_BID_FORMAT)
-             " (BID)"
diff --git a/meta/recipes-support/mpfr/mpfr_4.2.1.bb b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
similarity index 85%
rename from meta/recipes-support/mpfr/mpfr_4.2.1.bb
rename to meta/recipes-support/mpfr/mpfr_4.2.2.bb
index 423ac46783c..88cef0cfe1e 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.2.bb
@@ -14,8 +14,7 @@ CVE_PRODUCT = "gnu_mpfr"
 DEPENDS = "gmp autoconf-archive-native"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI += "file://0001-include-math.h-to-use-predefined-_Float128-definitio.patch"
-SRC_URI[sha256sum] = "277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2"
+SRC_URI[sha256sum] = "b67ba0383ef7e8a8563734e2e889ef5ec3c3b898a01d00fa0a6869ad81c6ce01"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 

