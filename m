Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 891C56DA91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 15:19:46 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hq4so4560456wib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 07:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0XKzU0DZDXlqumkNv2MHC9E4FButj/lCzrtpOvqHwRc=;
	b=dvwugsoWqh9vXup6p42/6uzmnZibT+md6V+Nw/uJrDBJRvVGqDIrUI2Vh73vk6XDrJ
	s2r4IjYy3fPtRjxggpMV72g8ERmFybrbzv4wy+zj/2XUL/7juqnuvoQZvo+3ICTPbjwo
	Jk9TWgfoGYxCxXDjqLZNnGvk9esIg3NGm8aCaZp/Bip75KqzgVg/XgJx0KPLFr7gGQQW
	HZKyn/OEtnH5PnGln5mUN4u/3j/zn4DUUJ6YLidoiTCjCxqobfmYm84WaTzQt0XhKJe0
	oNQZcJ1ZG6xDQgpR1ATgW1q1Rc5zF/B2izR0XdgMeCaZ66b3E0H3ByyMFUNf11QBHmq2
	Gewg==
X-Gm-Message-State: ALoCoQnKAsRBtGBPSQNoyedBJKkfnFwfcpLPHBFVmuEPH1i/Hhv0TDg0r4qssi2X06beIH3ah1ho
X-Received: by 10.180.75.115 with SMTP id b19mr21168709wiw.19.1389712786537;
	Tue, 14 Jan 2014 07:19:46 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm1923314wij.7.2014.01.14.07.19.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 07:19:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 15:19:29 +0000
Message-Id: <d8e83eb195fae7a3e614d8ca6406fe88e63399d7.1389712683.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
In-Reply-To: <cover.1389712683.git.ross.burton@intel.com>
References: <cover.1389712683.git.ross.burton@intel.com>
Subject: [PATCH][V3 4/7] python-numpy: add (from meta-oe)
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
X-List-Received-Date: Tue, 14 Jan 2014 15:19:47 -0000

python-numpy is needed for Piglit.  This recipe is taken directly from meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python-numpy/aarch64/_numpyconfig.h     |   30 +++++
 .../python/python-numpy/aarch64/config.h           |  139 ++++++++++++++++++++
 .../python/python-numpy/arm/config.h               |   21 +++
 .../python/python-numpy/arm/numpyconfig.h          |   17 +++
 .../python/python-numpy/armeb/config.h             |   21 +++
 .../python/python-numpy/armeb/numpyconfig.h        |   17 +++
 .../python/python-numpy/i586/config.h              |  108 +++++++++++++++
 .../python/python-numpy/i586/numpyconfig.h         |   24 ++++
 .../python/python-numpy/mipsel/config.h            |   21 +++
 .../python/python-numpy/mipsel/numpyconfig.h       |   17 +++
 .../python/python-numpy/trycompile.diff            |   33 +++++
 .../python/python-numpy/unbreak-assumptions.diff   |   16 +++
 .../python/python-numpy/x86-64/_numpyconfig.h      |   30 +++++
 .../python/python-numpy/x86-64/config.h            |  139 ++++++++++++++++++++
 meta/recipes-devtools/python/python-numpy_1.7.0.bb |   78 +++++++++++
 15 files changed, 711 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/aarch64/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/arm/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/armeb/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/i586/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mipsel/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/trycompile.diff
 create mode 100644 meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
 create mode 100644 meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python/python-numpy/x86-64/config.h
 create mode 100644 meta/recipes-devtools/python/python-numpy_1.7.0.bb

diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
new file mode 100644
index 0000000..be57ac2
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
@@ -0,0 +1,30 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x00000007
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy/aarch64/config.h b/meta/recipes-devtools/python/python-numpy/aarch64/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/aarch64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy/arm/config.h b/meta/recipes-devtools/python/python-numpy/arm/config.h
new file mode 100644
index 0000000..17ef186
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/arm/config.h
@@ -0,0 +1,21 @@
+/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
+/* #define SIZEOF_SHORT 2 */
+/* #define SIZEOF_INT 4 */
+/* #define SIZEOF_LONG 4 */
+/* #define SIZEOF_FLOAT 4 */
+/* #define SIZEOF_DOUBLE 8 */
+#define SIZEOF_LONG_DOUBLE 12
+#define SIZEOF_PY_INTPTR_T 4
+/* #define SIZEOF_LONG_LONG 8 */
+#define SIZEOF_PY_LONG_LONG 8
+/* #define CHAR_BIT 8 */
+#define MATHLIB m
+#define HAVE_FLOAT_FUNCS
+#define HAVE_LOG1P
+#define HAVE_EXPM1
+#define HAVE_INVERSE_HYPERBOLIC
+#define HAVE_INVERSE_HYPERBOLIC_FLOAT
+#define HAVE_ISNAN
+#define HAVE_ISINF
+#define HAVE_RINT
+
diff --git a/meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h b/meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h
new file mode 100644
index 0000000..c4bf654
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/arm/numpyconfig.h
@@ -0,0 +1,17 @@
+/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
+/*
+ *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
+ *   */
+#define NPY_SIZEOF_SHORT 2 
+#define NPY_SIZEOF_INT 4 
+#define NPY_SIZEOF_LONG 4 
+#define NPY_SIZEOF_FLOAT 4 
+#define NPY_SIZEOF_DOUBLE 8 
+#define NPY_SIZEOF_LONGDOUBLE 12 
+#define NPY_SIZEOF_PY_INTPTR_T 4 
+#define NPY_NO_SMP 0
+
+#define NPY_SIZEOF_LONGLONG 8 
+#define NPY_SIZEOF_PY_LONG_LONG 8 
+/* #define CHAR_BIT 8 */
+
diff --git a/meta/recipes-devtools/python/python-numpy/armeb/config.h b/meta/recipes-devtools/python/python-numpy/armeb/config.h
new file mode 100644
index 0000000..17ef186
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/armeb/config.h
@@ -0,0 +1,21 @@
+/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
+/* #define SIZEOF_SHORT 2 */
+/* #define SIZEOF_INT 4 */
+/* #define SIZEOF_LONG 4 */
+/* #define SIZEOF_FLOAT 4 */
+/* #define SIZEOF_DOUBLE 8 */
+#define SIZEOF_LONG_DOUBLE 12
+#define SIZEOF_PY_INTPTR_T 4
+/* #define SIZEOF_LONG_LONG 8 */
+#define SIZEOF_PY_LONG_LONG 8
+/* #define CHAR_BIT 8 */
+#define MATHLIB m
+#define HAVE_FLOAT_FUNCS
+#define HAVE_LOG1P
+#define HAVE_EXPM1
+#define HAVE_INVERSE_HYPERBOLIC
+#define HAVE_INVERSE_HYPERBOLIC_FLOAT
+#define HAVE_ISNAN
+#define HAVE_ISINF
+#define HAVE_RINT
+
diff --git a/meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h b/meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
new file mode 100644
index 0000000..c4bf654
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/armeb/numpyconfig.h
@@ -0,0 +1,17 @@
+/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
+/*
+ *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
+ *   */
+#define NPY_SIZEOF_SHORT 2 
+#define NPY_SIZEOF_INT 4 
+#define NPY_SIZEOF_LONG 4 
+#define NPY_SIZEOF_FLOAT 4 
+#define NPY_SIZEOF_DOUBLE 8 
+#define NPY_SIZEOF_LONGDOUBLE 12 
+#define NPY_SIZEOF_PY_INTPTR_T 4 
+#define NPY_NO_SMP 0
+
+#define NPY_SIZEOF_LONGLONG 8 
+#define NPY_SIZEOF_PY_LONG_LONG 8 
+/* #define CHAR_BIT 8 */
+
diff --git a/meta/recipes-devtools/python/python-numpy/i586/config.h b/meta/recipes-devtools/python/python-numpy/i586/config.h
new file mode 100644
index 0000000..08e41e3
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/i586/config.h
@@ -0,0 +1,108 @@
+#define SIZEOF_PY_INTPTR_T 4
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN
+#define HAVE_COS
+#define HAVE_TAN
+#define HAVE_SINH
+#define HAVE_COSH
+#define HAVE_TANH
+#define HAVE_FABS
+#define HAVE_FLOOR
+#define HAVE_CEIL
+#define HAVE_SQRT
+#define HAVE_LOG10
+#define HAVE_LOG
+#define HAVE_EXP
+#define HAVE_ASIN
+#define HAVE_ACOS
+#define HAVE_ATAN
+#define HAVE_FMOD
+#define HAVE_MODF
+#define HAVE_FREXP
+#define HAVE_LDEXP
+#define HAVE_RINT
+#define HAVE_TRUNC
+#define HAVE_EXP2
+#define HAVE_LOG2
+#define HAVE_ATAN2
+#define HAVE_POW
+#define HAVE_NEXTAFTER
+#define HAVE_SINF
+#define HAVE_COSF
+#define HAVE_TANF
+#define HAVE_SINHF
+#define HAVE_COSHF
+#define HAVE_TANHF
+#define HAVE_FABSF
+#define HAVE_FLOORF
+#define HAVE_CEILF
+#define HAVE_RINTF
+#define HAVE_TRUNCF
+#define HAVE_SQRTF
+#define HAVE_LOG10F
+#define HAVE_LOGF
+#define HAVE_LOG1PF
+#define HAVE_EXPF
+#define HAVE_EXPM1F
+#define HAVE_ASINF
+#define HAVE_ACOSF
+#define HAVE_ATANF
+#define HAVE_ASINHF
+#define HAVE_ACOSHF
+#define HAVE_ATANHF
+#define HAVE_HYPOTF
+#define HAVE_ATAN2F
+#define HAVE_POWF
+#define HAVE_FMODF
+#define HAVE_MODFF
+#define HAVE_FREXPF
+#define HAVE_LDEXPF
+#define HAVE_EXP2F
+#define HAVE_LOG2F
+#define HAVE_COPYSIGNF
+#define HAVE_NEXTAFTERF
+#define HAVE_SINL
+#define HAVE_COSL
+#define HAVE_TANL
+#define HAVE_SINHL
+#define HAVE_COSHL
+#define HAVE_TANHL
+#define HAVE_FABSL
+#define HAVE_FLOORL
+#define HAVE_CEILL
+#define HAVE_RINTL
+#define HAVE_TRUNCL
+#define HAVE_SQRTL
+#define HAVE_LOG10L
+#define HAVE_LOGL
+#define HAVE_LOG1PL
+#define HAVE_EXPL
+#define HAVE_EXPM1L
+#define HAVE_ASINL
+#define HAVE_ACOSL
+#define HAVE_ATANL
+#define HAVE_ASINHL
+#define HAVE_ACOSHL
+#define HAVE_ATANHL
+#define HAVE_HYPOTL
+#define HAVE_ATAN2L
+#define HAVE_POWL
+#define HAVE_FMODL
+#define HAVE_MODFL
+#define HAVE_FREXPL
+#define HAVE_LDEXPL
+#define HAVE_EXP2L
+#define HAVE_LOG2L
+#define HAVE_COPYSIGNL
+#define HAVE_NEXTAFTERL
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H
+#define HAVE_LDOUBLE_INTEL_EXTENDED_12_BYTES_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h b/meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h
new file mode 100644
index 0000000..ff7938c
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/i586/numpyconfig.h
@@ -0,0 +1,24 @@
+#ifndef _NPY_NUMPYCONFIG_H_
+#define _NPY_NUMPYCONFIG_H_
+
+#include "_numpyconfig.h"
+
+/* 
+ * On Mac OS X, because there is only one configuration stage for all the archs
+ * in universal builds, any macro which depends on the arch needs to be
+ * harcoded
+ */
+#ifdef __APPLE__
+	#undef NPY_SIZEOF_LONG
+	#undef NPY_SIZEOF_PY_INTPTR_T
+
+	#ifdef __LP64__
+		#define NPY_SIZEOF_LONG 		8
+		#define NPY_SIZEOF_PY_INTPTR_T 	8
+	#else
+		#define NPY_SIZEOF_LONG 		4
+		#define NPY_SIZEOF_PY_INTPTR_T 	4
+	#endif
+#endif
+
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy/mipsel/config.h b/meta/recipes-devtools/python/python-numpy/mipsel/config.h
new file mode 100644
index 0000000..17ef186
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/mipsel/config.h
@@ -0,0 +1,21 @@
+/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
+/* #define SIZEOF_SHORT 2 */
+/* #define SIZEOF_INT 4 */
+/* #define SIZEOF_LONG 4 */
+/* #define SIZEOF_FLOAT 4 */
+/* #define SIZEOF_DOUBLE 8 */
+#define SIZEOF_LONG_DOUBLE 12
+#define SIZEOF_PY_INTPTR_T 4
+/* #define SIZEOF_LONG_LONG 8 */
+#define SIZEOF_PY_LONG_LONG 8
+/* #define CHAR_BIT 8 */
+#define MATHLIB m
+#define HAVE_FLOAT_FUNCS
+#define HAVE_LOG1P
+#define HAVE_EXPM1
+#define HAVE_INVERSE_HYPERBOLIC
+#define HAVE_INVERSE_HYPERBOLIC_FLOAT
+#define HAVE_ISNAN
+#define HAVE_ISINF
+#define HAVE_RINT
+
diff --git a/meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h b/meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
new file mode 100644
index 0000000..c4bf654
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/mipsel/numpyconfig.h
@@ -0,0 +1,17 @@
+/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
+/*
+ *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
+ *   */
+#define NPY_SIZEOF_SHORT 2 
+#define NPY_SIZEOF_INT 4 
+#define NPY_SIZEOF_LONG 4 
+#define NPY_SIZEOF_FLOAT 4 
+#define NPY_SIZEOF_DOUBLE 8 
+#define NPY_SIZEOF_LONGDOUBLE 12 
+#define NPY_SIZEOF_PY_INTPTR_T 4 
+#define NPY_NO_SMP 0
+
+#define NPY_SIZEOF_LONGLONG 8 
+#define NPY_SIZEOF_PY_LONG_LONG 8 
+/* #define CHAR_BIT 8 */
+
diff --git a/meta/recipes-devtools/python/python-numpy/trycompile.diff b/meta/recipes-devtools/python/python-numpy/trycompile.diff
new file mode 100644
index 0000000..3ab3d72
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/trycompile.diff
@@ -0,0 +1,33 @@
+--- /tmp/setup.py	2008-09-01 10:37:44.000000000 +0200
++++ numpy-1.1.1/numpy/core/setup.py	2008-09-01 10:38:20.373198000 +0200
+@@ -80,8 +80,7 @@
+                 raise SystemError,\
+                       "Non-existing %s. Perhaps you need to install"\
+                       " python-dev|python-devel." % (python_h)
+-            result = config_cmd.try_run(tc,include_dirs=[python_include],
+-                                        library_dirs = default_lib_dirs)
++            result = config_cmd.try_compile(tc)
+             if not result:
+                 raise SystemError,"Failed to test configuration. "\
+                       "See previous error messages for more information."
+@@ -95,7 +94,7 @@
+             if mathlib:
+                 mathlibs_choices.insert(0,mathlib.split(','))
+             for libs in mathlibs_choices:
+-                if config_cmd.try_run(tc,libraries=libs):
++                if config_cmd.try_compile(tc):
+                     mathlibs = libs
+                     break
+             else:
+@@ -180,10 +179,7 @@
+                       " python-dev|python-devel." % (python_h)
+ 
+             config.numpy_include_dirs
+-            result = config_cmd.try_run(testcode,
+-                                include_dirs = [python_include] + \
+-                                                       config.numpy_include_dirs,
+-                                        library_dirs = default_lib_dirs)
++            result = config_cmd.try_compile(testcode)
+ 
+             if not result:
+                 raise SystemError,"Failed to generate numpy configuration. "\
diff --git a/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff b/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
new file mode 100644
index 0000000..c5b4481
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/unbreak-assumptions.diff
@@ -0,0 +1,16 @@
+--- /tmp/system_info.py	2008-08-22 00:38:16.000000000 +0200
++++ numpy-1.1.1/numpy/distutils/system_info.py	2008-08-22 00:40:33.013198000 +0200
+@@ -137,11 +137,8 @@
+     default_x11_lib_dirs = []
+     default_x11_include_dirs = []
+ else:
+-    default_lib_dirs = ['/usr/local/lib', '/opt/lib', '/usr/lib',
+-                        '/opt/local/lib', '/sw/lib']
+-    default_include_dirs = ['/usr/local/include',
+-                            '/opt/include', '/usr/include',
+-                            '/opt/local/include', '/sw/include']
++    default_lib_dirs = ['/non-existant-dir']
++    default_include_dirs = ['non-existant-dir']
+     default_src_dirs = ['.','/usr/local/src', '/opt/src','/sw/src']
+ 
+     try:
diff --git a/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h b/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
new file mode 100644
index 0000000..be57ac2
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/x86-64/_numpyconfig.h
@@ -0,0 +1,30 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x00000007
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy/x86-64/config.h b/meta/recipes-devtools/python/python-numpy/x86-64/config.h
new file mode 100644
index 0000000..0ce63b7
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy/x86-64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_INTEL_EXTENDED_16_BYTES_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta/recipes-devtools/python/python-numpy_1.7.0.bb b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
new file mode 100644
index 0000000..04cb2f1
--- /dev/null
+++ b/meta/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -0,0 +1,78 @@
+DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f87832d854acbade6e9f5c601c8b30b1"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
+           ${CONFIGFILESURI} "
+
+CONFIGFILESURI ?= ""
+
+CONFIGFILESURI_aarch64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_arm = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_armeb = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_mipsel = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_i586 = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_x86-64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+
+S = "${WORKDIR}/numpy-${PV}"
+
+inherit distutils
+
+# Make the build fail and replace *config.h with proper one
+# This is a ugly, ugly hack - Koen
+do_compile_prepend_class-target() {
+    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+    ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
+    true
+    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
+}
+
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
+
+SRC_URI[md5sum] = "4fa54e40b6a243416f0248123b6ec332"
+SRC_URI[sha256sum] = "f4fa70b7edbab65ee6432eb63743f5489f1919c614632b20b2fb45aa7e682ac6"
+
+# install what is needed for numpy.test()
+RDEPENDS_${PN} = "python-unittest \
+                  python-difflib \
+                  python-pprint \
+                  python-pickle \
+                  python-shell \
+                  python-nose \
+                  python-doctest \
+                  python-datetime \
+                  python-distutils \
+                  python-misc \
+                  python-mmap \
+                  python-netclient \
+                  python-numbers \
+                  python-pydoc \
+                  python-pkgutil \
+                  python-email \
+                  python-subprocess \
+                  python-compression \
+"
+
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.10.4


