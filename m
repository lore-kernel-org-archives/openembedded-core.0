Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8249.1595926401137223222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: A/gDfmxLDSpPBO5Aa78jBTtMvmrO0hRsrr7Gl0L729X3K1Yud1W9yU3gGXcAdyR19HvmftCMas
 v9Vgcsrbe5Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699784"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:26 -0700
IronPort-SDR: 65v2OdeQfpadQlavF+7QoPSw1a/GBJnUwt+EQ+s0aneWOqc0VpSs/3KrZoBswht3COUU0hIJyY
 Oq/sT6PDfcLw==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245965"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 27/32] python3-numpy: Stop shipping manual config files
Date: Tue, 28 Jul 2020 16:51:28 +0800
Message-Id: <49a9b38bb8355aa6b3413335851b7b609356e33b.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Automatic generation seems to work fine,
and does not become outdated.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8993270f8bc65e152418d84fde03f8ead83c054b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python-numpy/files/aarch64/_numpyconfig.h |  32 ----
 .../python-numpy/files/aarch64/config.h       | 139 ------------------
 .../python-numpy/files/arm/config.h           |  21 ---
 .../python-numpy/files/arm/numpyconfig.h      |  17 ---
 .../python-numpy/files/armeb/config.h         |  21 ---
 .../python-numpy/files/armeb/numpyconfig.h    |  17 ---
 .../files/mipsarchn32eb/_numpyconfig.h        |  32 ----
 .../python-numpy/files/mipsarchn32eb/config.h | 139 ------------------
 .../files/mipsarchn32el/_numpyconfig.h        |  31 ----
 .../python-numpy/files/mipsarchn32el/config.h | 138 -----------------
 .../files/mipsarchn64eb/_numpyconfig.h        |  32 ----
 .../python-numpy/files/mipsarchn64eb/config.h | 139 ------------------
 .../files/mipsarchn64el/_numpyconfig.h        |  32 ----
 .../python-numpy/files/mipsarchn64el/config.h | 138 -----------------
 .../files/mipsarcho32eb/_numpyconfig.h        |  32 ----
 .../python-numpy/files/mipsarcho32eb/config.h | 139 ------------------
 .../python-numpy/files/mipsarcho32el/config.h |  21 ---
 .../files/mipsarcho32el/numpyconfig.h         |  18 ---
 .../python-numpy/files/powerpc/_numpyconfig.h |  32 ----
 .../python-numpy/files/powerpc/config.h       | 139 ------------------
 .../files/powerpc64/_numpyconfig.h            |  32 ----
 .../python-numpy/files/powerpc64/config.h     | 139 ------------------
 .../python-numpy/files/riscv64/_numpyconfig.h |  32 ----
 .../python-numpy/files/riscv64/config.h       | 139 ------------------
 .../python-numpy/files/x86-64/_numpyconfig.h  |  32 ----
 .../python-numpy/files/x86-64/config.h        | 139 ------------------
 .../python-numpy/files/x86/config.h           | 108 --------------
 .../python-numpy/files/x86/numpyconfig.h      |  24 ---
 .../python-numpy/python-numpy.inc             |  68 ---------
 29 files changed, 2022 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/aarch64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/arm/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/arm/numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/armeb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/powerpc64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86-64/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86/config.h
 delete mode 100644 meta/recipes-devtools/python-numpy/files/x86/numpyconfig.h

diff --git a/meta/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
deleted file mode 100644
index 109deb0435..0000000000
--- a/meta/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/aarch64/config.h b/meta/recipes-devtools/python-numpy/files/aarch64/config.h
deleted file mode 100644
index c30b868f2f..0000000000
--- a/meta/recipes-devtools/python-numpy/files/aarch64/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/arm/config.h b/meta/recipes-devtools/python-numpy/files/arm/config.h
deleted file mode 100644
index 17ef186d56..0000000000
--- a/meta/recipes-devtools/python-numpy/files/arm/config.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
-/* #define SIZEOF_SHORT 2 */
-/* #define SIZEOF_INT 4 */
-/* #define SIZEOF_LONG 4 */
-/* #define SIZEOF_FLOAT 4 */
-/* #define SIZEOF_DOUBLE 8 */
-#define SIZEOF_LONG_DOUBLE 12
-#define SIZEOF_PY_INTPTR_T 4
-/* #define SIZEOF_LONG_LONG 8 */
-#define SIZEOF_PY_LONG_LONG 8
-/* #define CHAR_BIT 8 */
-#define MATHLIB m
-#define HAVE_FLOAT_FUNCS
-#define HAVE_LOG1P
-#define HAVE_EXPM1
-#define HAVE_INVERSE_HYPERBOLIC
-#define HAVE_INVERSE_HYPERBOLIC_FLOAT
-#define HAVE_ISNAN
-#define HAVE_ISINF
-#define HAVE_RINT
-
diff --git a/meta/recipes-devtools/python-numpy/files/arm/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/arm/numpyconfig.h
deleted file mode 100644
index c4bf6547f0..0000000000
--- a/meta/recipes-devtools/python-numpy/files/arm/numpyconfig.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
-/*
- *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
- *   */
-#define NPY_SIZEOF_SHORT 2 
-#define NPY_SIZEOF_INT 4 
-#define NPY_SIZEOF_LONG 4 
-#define NPY_SIZEOF_FLOAT 4 
-#define NPY_SIZEOF_DOUBLE 8 
-#define NPY_SIZEOF_LONGDOUBLE 12 
-#define NPY_SIZEOF_PY_INTPTR_T 4 
-#define NPY_NO_SMP 0
-
-#define NPY_SIZEOF_LONGLONG 8 
-#define NPY_SIZEOF_PY_LONG_LONG 8 
-/* #define CHAR_BIT 8 */
-
diff --git a/meta/recipes-devtools/python-numpy/files/armeb/config.h b/meta/recipes-devtools/python-numpy/files/armeb/config.h
deleted file mode 100644
index 17ef186d56..0000000000
--- a/meta/recipes-devtools/python-numpy/files/armeb/config.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
-/* #define SIZEOF_SHORT 2 */
-/* #define SIZEOF_INT 4 */
-/* #define SIZEOF_LONG 4 */
-/* #define SIZEOF_FLOAT 4 */
-/* #define SIZEOF_DOUBLE 8 */
-#define SIZEOF_LONG_DOUBLE 12
-#define SIZEOF_PY_INTPTR_T 4
-/* #define SIZEOF_LONG_LONG 8 */
-#define SIZEOF_PY_LONG_LONG 8
-/* #define CHAR_BIT 8 */
-#define MATHLIB m
-#define HAVE_FLOAT_FUNCS
-#define HAVE_LOG1P
-#define HAVE_EXPM1
-#define HAVE_INVERSE_HYPERBOLIC
-#define HAVE_INVERSE_HYPERBOLIC_FLOAT
-#define HAVE_ISNAN
-#define HAVE_ISINF
-#define HAVE_RINT
-
diff --git a/meta/recipes-devtools/python-numpy/files/armeb/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
deleted file mode 100644
index c4bf6547f0..0000000000
--- a/meta/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
-/*
- *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
- *   */
-#define NPY_SIZEOF_SHORT 2 
-#define NPY_SIZEOF_INT 4 
-#define NPY_SIZEOF_LONG 4 
-#define NPY_SIZEOF_FLOAT 4 
-#define NPY_SIZEOF_DOUBLE 8 
-#define NPY_SIZEOF_LONGDOUBLE 12 
-#define NPY_SIZEOF_PY_INTPTR_T 4 
-#define NPY_NO_SMP 0
-
-#define NPY_SIZEOF_LONGLONG 8 
-#define NPY_SIZEOF_PY_LONG_LONG 8 
-/* #define CHAR_BIT 8 */
-
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
deleted file mode 100644
index debb390094..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
deleted file mode 100644
index c30b868f2f..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
deleted file mode 100644
index 8e2b5d0940..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
+++ /dev/null
@@ -1,31 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
deleted file mode 100644
index 48727039ae..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
+++ /dev/null
@@ -1,138 +0,0 @@
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
deleted file mode 100644
index debb390094..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
deleted file mode 100644
index c30b868f2f..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
deleted file mode 100644
index debb390094..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h b/meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
deleted file mode 100644
index 48727039ae..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
+++ /dev/null
@@ -1,138 +0,0 @@
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
deleted file mode 100644
index 4c465c216c..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 8
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 16
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 4
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
deleted file mode 100644
index 2f6135adce..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 4
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_DOUBLE_BE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarcho32el/config.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
deleted file mode 100644
index 17ef186d56..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
-/* #define SIZEOF_SHORT 2 */
-/* #define SIZEOF_INT 4 */
-/* #define SIZEOF_LONG 4 */
-/* #define SIZEOF_FLOAT 4 */
-/* #define SIZEOF_DOUBLE 8 */
-#define SIZEOF_LONG_DOUBLE 12
-#define SIZEOF_PY_INTPTR_T 4
-/* #define SIZEOF_LONG_LONG 8 */
-#define SIZEOF_PY_LONG_LONG 8
-/* #define CHAR_BIT 8 */
-#define MATHLIB m
-#define HAVE_FLOAT_FUNCS
-#define HAVE_LOG1P
-#define HAVE_EXPM1
-#define HAVE_INVERSE_HYPERBOLIC
-#define HAVE_INVERSE_HYPERBOLIC_FLOAT
-#define HAVE_ISNAN
-#define HAVE_ISINF
-#define HAVE_RINT
-
diff --git a/meta/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
deleted file mode 100644
index 0b7cd51af4..0000000000
--- a/meta/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
-/*
- *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
- *   */
-#define NPY_SIZEOF_SHORT 2 
-#define NPY_SIZEOF_INT 4 
-#define NPY_SIZEOF_LONG 4 
-#define NPY_SIZEOF_FLOAT 4 
-#define NPY_SIZEOF_DOUBLE 8 
-#define NPY_SIZEOF_LONGDOUBLE 12 
-#define NPY_SIZEOF_PY_INTPTR_T 4 
-#define NPY_NO_SMP 0
-
-#define NPY_SIZEOF_LONGLONG 8 
-#define NPY_SIZEOF_PY_LONG_LONG 8 
-#define NPY_SIZEOF_OFF_T 8
-/* #define CHAR_BIT 8 */
-
diff --git a/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
deleted file mode 100644
index 6e7262ad91..0000000000
--- a/meta/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 4
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/powerpc/config.h b/meta/recipes-devtools/python-numpy/files/powerpc/config.h
deleted file mode 100644
index f65d39d5de..0000000000
--- a/meta/recipes-devtools/python-numpy/files/powerpc/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 4
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_DOUBLE_DOUBLE_BE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
deleted file mode 100644
index debb390094..0000000000
--- a/meta/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/powerpc64/config.h b/meta/recipes-devtools/python-numpy/files/powerpc64/config.h
deleted file mode 100644
index c30b868f2f..0000000000
--- a/meta/recipes-devtools/python-numpy/files/powerpc64/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
deleted file mode 100644
index 109deb0435..0000000000
--- a/meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/riscv64/config.h b/meta/recipes-devtools/python-numpy/files/riscv64/config.h
deleted file mode 100644
index c30b868f2f..0000000000
--- a/meta/recipes-devtools/python-numpy/files/riscv64/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
deleted file mode 100644
index b330361649..0000000000
--- a/meta/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
+++ /dev/null
@@ -1,32 +0,0 @@
-#define NPY_HAVE_ENDIAN_H 1
-#define NPY_SIZEOF_SHORT SIZEOF_SHORT
-#define NPY_SIZEOF_INT SIZEOF_INT
-#define NPY_SIZEOF_LONG SIZEOF_LONG
-#define NPY_SIZEOF_FLOAT 4
-#define NPY_SIZEOF_COMPLEX_FLOAT 8
-#define NPY_SIZEOF_DOUBLE 8
-#define NPY_SIZEOF_OFF_T 8
-#define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_ENABLE_SEPARATE_COMPILATION 1
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_PY_LONG_LONG 8
-#define NPY_SIZEOF_LONGLONG 8
-#define NPY_NO_SMP 0
-#define NPY_HAVE_DECL_ISNAN
-#define NPY_HAVE_DECL_ISINF
-#define NPY_HAVE_DECL_ISFINITE
-#define NPY_HAVE_DECL_SIGNBIT
-#define NPY_USE_C99_COMPLEX 1
-#define NPY_HAVE_COMPLEX_DOUBLE 1
-#define NPY_HAVE_COMPLEX_FLOAT 1
-#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
-#define NPY_USE_C99_FORMATS 1
-#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
-#define NPY_ABI_VERSION 0x01000009
-#define NPY_API_VERSION 0x0000000A
-
-#ifndef __STDC_FORMAT_MACROS
-#define __STDC_FORMAT_MACROS 1
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/x86-64/config.h b/meta/recipes-devtools/python-numpy/files/x86-64/config.h
deleted file mode 100644
index 0ce63b7d22..0000000000
--- a/meta/recipes-devtools/python-numpy/files/x86-64/config.h
+++ /dev/null
@@ -1,139 +0,0 @@
-#define HAVE_ENDIAN_H 1
-#define SIZEOF_PY_INTPTR_T 8
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN 1
-#define HAVE_COS 1
-#define HAVE_TAN 1
-#define HAVE_SINH 1
-#define HAVE_COSH 1
-#define HAVE_TANH 1
-#define HAVE_FABS 1
-#define HAVE_FLOOR 1
-#define HAVE_CEIL 1
-#define HAVE_SQRT 1
-#define HAVE_LOG10 1
-#define HAVE_LOG 1
-#define HAVE_EXP 1
-#define HAVE_ASIN 1
-#define HAVE_ACOS 1
-#define HAVE_ATAN 1
-#define HAVE_FMOD 1
-#define HAVE_MODF 1
-#define HAVE_FREXP 1
-#define HAVE_LDEXP 1
-#define HAVE_RINT 1
-#define HAVE_TRUNC 1
-#define HAVE_EXP2 1
-#define HAVE_LOG2 1
-#define HAVE_ATAN2 1
-#define HAVE_POW 1
-#define HAVE_NEXTAFTER 1
-#define HAVE_SINF 1
-#define HAVE_COSF 1
-#define HAVE_TANF 1
-#define HAVE_SINHF 1
-#define HAVE_COSHF 1
-#define HAVE_TANHF 1
-#define HAVE_FABSF 1
-#define HAVE_FLOORF 1
-#define HAVE_CEILF 1
-#define HAVE_RINTF 1
-#define HAVE_TRUNCF 1
-#define HAVE_SQRTF 1
-#define HAVE_LOG10F 1
-#define HAVE_LOGF 1
-#define HAVE_LOG1PF 1
-#define HAVE_EXPF 1
-#define HAVE_EXPM1F 1
-#define HAVE_ASINF 1
-#define HAVE_ACOSF 1
-#define HAVE_ATANF 1
-#define HAVE_ASINHF 1
-#define HAVE_ACOSHF 1
-#define HAVE_ATANHF 1
-#define HAVE_HYPOTF 1
-#define HAVE_ATAN2F 1
-#define HAVE_POWF 1
-#define HAVE_FMODF 1
-#define HAVE_MODFF 1
-#define HAVE_FREXPF 1
-#define HAVE_LDEXPF 1
-#define HAVE_EXP2F 1
-#define HAVE_LOG2F 1
-#define HAVE_COPYSIGNF 1
-#define HAVE_NEXTAFTERF 1
-#define HAVE_SINL 1
-#define HAVE_COSL 1
-#define HAVE_TANL 1
-#define HAVE_SINHL 1
-#define HAVE_COSHL 1
-#define HAVE_TANHL 1
-#define HAVE_FABSL 1
-#define HAVE_FLOORL 1
-#define HAVE_CEILL 1
-#define HAVE_RINTL 1
-#define HAVE_TRUNCL 1
-#define HAVE_SQRTL 1
-#define HAVE_LOG10L 1
-#define HAVE_LOGL 1
-#define HAVE_LOG1PL 1
-#define HAVE_EXPL 1
-#define HAVE_EXPM1L 1
-#define HAVE_ASINL 1
-#define HAVE_ACOSL 1
-#define HAVE_ATANL 1
-#define HAVE_ASINHL 1
-#define HAVE_ACOSHL 1
-#define HAVE_ATANHL 1
-#define HAVE_HYPOTL 1
-#define HAVE_ATAN2L 1
-#define HAVE_POWL 1
-#define HAVE_FMODL 1
-#define HAVE_MODFL 1
-#define HAVE_FREXPL 1
-#define HAVE_LDEXPL 1
-#define HAVE_EXP2L 1
-#define HAVE_LOG2L 1
-#define HAVE_COPYSIGNL 1
-#define HAVE_NEXTAFTERL 1
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H 1
-#define HAVE_CREAL 1
-#define HAVE_CIMAG 1
-#define HAVE_CABS 1
-#define HAVE_CARG 1
-#define HAVE_CEXP 1
-#define HAVE_CSQRT 1
-#define HAVE_CLOG 1
-#define HAVE_CCOS 1
-#define HAVE_CSIN 1
-#define HAVE_CPOW 1
-#define HAVE_CREALF 1
-#define HAVE_CIMAGF 1
-#define HAVE_CABSF 1
-#define HAVE_CARGF 1
-#define HAVE_CEXPF 1
-#define HAVE_CSQRTF 1
-#define HAVE_CLOGF 1
-#define HAVE_CCOSF 1
-#define HAVE_CSINF 1
-#define HAVE_CPOWF 1
-#define HAVE_CREALL 1
-#define HAVE_CIMAGL 1
-#define HAVE_CABSL 1
-#define HAVE_CARGL 1
-#define HAVE_CEXPL 1
-#define HAVE_CSQRTL 1
-#define HAVE_CLOGL 1
-#define HAVE_CCOSL 1
-#define HAVE_CSINL 1
-#define HAVE_CPOWL 1
-#define HAVE_LDOUBLE_INTEL_EXTENDED_16_BYTES_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/x86/config.h b/meta/recipes-devtools/python-numpy/files/x86/config.h
deleted file mode 100644
index 08e41e3d99..0000000000
--- a/meta/recipes-devtools/python-numpy/files/x86/config.h
+++ /dev/null
@@ -1,108 +0,0 @@
-#define SIZEOF_PY_INTPTR_T 4
-#define SIZEOF_PY_LONG_LONG 8
-#define MATHLIB m
-#define HAVE_SIN
-#define HAVE_COS
-#define HAVE_TAN
-#define HAVE_SINH
-#define HAVE_COSH
-#define HAVE_TANH
-#define HAVE_FABS
-#define HAVE_FLOOR
-#define HAVE_CEIL
-#define HAVE_SQRT
-#define HAVE_LOG10
-#define HAVE_LOG
-#define HAVE_EXP
-#define HAVE_ASIN
-#define HAVE_ACOS
-#define HAVE_ATAN
-#define HAVE_FMOD
-#define HAVE_MODF
-#define HAVE_FREXP
-#define HAVE_LDEXP
-#define HAVE_RINT
-#define HAVE_TRUNC
-#define HAVE_EXP2
-#define HAVE_LOG2
-#define HAVE_ATAN2
-#define HAVE_POW
-#define HAVE_NEXTAFTER
-#define HAVE_SINF
-#define HAVE_COSF
-#define HAVE_TANF
-#define HAVE_SINHF
-#define HAVE_COSHF
-#define HAVE_TANHF
-#define HAVE_FABSF
-#define HAVE_FLOORF
-#define HAVE_CEILF
-#define HAVE_RINTF
-#define HAVE_TRUNCF
-#define HAVE_SQRTF
-#define HAVE_LOG10F
-#define HAVE_LOGF
-#define HAVE_LOG1PF
-#define HAVE_EXPF
-#define HAVE_EXPM1F
-#define HAVE_ASINF
-#define HAVE_ACOSF
-#define HAVE_ATANF
-#define HAVE_ASINHF
-#define HAVE_ACOSHF
-#define HAVE_ATANHF
-#define HAVE_HYPOTF
-#define HAVE_ATAN2F
-#define HAVE_POWF
-#define HAVE_FMODF
-#define HAVE_MODFF
-#define HAVE_FREXPF
-#define HAVE_LDEXPF
-#define HAVE_EXP2F
-#define HAVE_LOG2F
-#define HAVE_COPYSIGNF
-#define HAVE_NEXTAFTERF
-#define HAVE_SINL
-#define HAVE_COSL
-#define HAVE_TANL
-#define HAVE_SINHL
-#define HAVE_COSHL
-#define HAVE_TANHL
-#define HAVE_FABSL
-#define HAVE_FLOORL
-#define HAVE_CEILL
-#define HAVE_RINTL
-#define HAVE_TRUNCL
-#define HAVE_SQRTL
-#define HAVE_LOG10L
-#define HAVE_LOGL
-#define HAVE_LOG1PL
-#define HAVE_EXPL
-#define HAVE_EXPM1L
-#define HAVE_ASINL
-#define HAVE_ACOSL
-#define HAVE_ATANL
-#define HAVE_ASINHL
-#define HAVE_ACOSHL
-#define HAVE_ATANHL
-#define HAVE_HYPOTL
-#define HAVE_ATAN2L
-#define HAVE_POWL
-#define HAVE_FMODL
-#define HAVE_MODFL
-#define HAVE_FREXPL
-#define HAVE_LDEXPL
-#define HAVE_EXP2L
-#define HAVE_LOG2L
-#define HAVE_COPYSIGNL
-#define HAVE_NEXTAFTERL
-#define HAVE_DECL_SIGNBIT
-#define HAVE_COMPLEX_H
-#define HAVE_LDOUBLE_INTEL_EXTENDED_12_BYTES_LE 1
-#ifndef __cplusplus
-/* #undef inline */
-#endif
-
-#ifndef _NPY_NPY_CONFIG_H_
-#error config.h should never be included directly, include npy_config.h instead
-#endif
diff --git a/meta/recipes-devtools/python-numpy/files/x86/numpyconfig.h b/meta/recipes-devtools/python-numpy/files/x86/numpyconfig.h
deleted file mode 100644
index ff7938cd96..0000000000
--- a/meta/recipes-devtools/python-numpy/files/x86/numpyconfig.h
+++ /dev/null
@@ -1,24 +0,0 @@
-#ifndef _NPY_NUMPYCONFIG_H_
-#define _NPY_NUMPYCONFIG_H_
-
-#include "_numpyconfig.h"
-
-/* 
- * On Mac OS X, because there is only one configuration stage for all the archs
- * in universal builds, any macro which depends on the arch needs to be
- * harcoded
- */
-#ifdef __APPLE__
-	#undef NPY_SIZEOF_LONG
-	#undef NPY_SIZEOF_PY_INTPTR_T
-
-	#ifdef __LP64__
-		#define NPY_SIZEOF_LONG 		8
-		#define NPY_SIZEOF_PY_INTPTR_T 	8
-	#else
-		#define NPY_SIZEOF_LONG 		4
-		#define NPY_SIZEOF_PY_INTPTR_T 	4
-	#endif
-#endif
-
-#endif
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index a12e72f964..f68b90e6b9 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -8,7 +8,6 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-npy_cpu-Add-riscv-support.patch \
-           ${CONFIGFILESURI} \
            file://0001-numpy-random-setup.py-remove-the-detection-of-x86-ta.patch \
            "
 SRC_URI[md5sum] = "c48b2ad785f82cdfe28c907ce35e2a71"
@@ -20,77 +19,10 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 # Needed for building with gcc 4.x from centos 7
 CFLAGS_append_class-native = " -std=c99"
 
-CONFIGFILESURI ?= ""
-
-CONFIGFILESURI_aarch64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_arm = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_armeb = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_mipsarcho32el = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_x86 = " \
-    file://config.h \
-    file://numpyconfig.h \
-"
-CONFIGFILESURI_x86-64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarcho32eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_powerpc = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_powerpc64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn64eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn64el = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn32eb = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_mipsarchn32el = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-CONFIGFILESURI_riscv64 = " \
-    file://config.h \
-    file://_numpyconfig.h \
-"
-
 S = "${WORKDIR}/numpy-${PV}"
 
 CLEANBROKEN = "1"
 
-# Make the build fail and replace *config.h with proper one
-# This is a ugly, ugly hack - Koen
-do_compile_prepend_class-target() {
-    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-    true
-    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
-}
-
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
 # install what is needed for numpy.test()
-- 
2.25.4

