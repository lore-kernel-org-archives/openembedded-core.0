Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2C778975
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:40:47 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id l27so397357pfk.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PbDWFOiPkRlhOkjV4QyY10KCXO1B7lQgzR/vaCwA/lo=;
	b=s8ZiN1YtKyW7+6+4BSSfPDu2YzLYhDuOxsTZvQrbyYKXmL12amgB8O8DYIdq3EC0CD
	rjsuH4nvFSHFhmToy/O/VAkJEvHlzSw/thhhf0HH6KoFiBWAARyY5C2Sz2GvMWM3G+PQ
	Cizcm8rg3DcrH4Ez6KH8jnM7j/pB0dGCVEpb//LeW3TOl9N56sus4xHwXYTjapYkzE5Y
	6tTYvLqdRprYHr6Qkt+q6MDVLzJ6FJSKxreu7ZauyFM28uRuezfSWqPSkXnwkAw4N4c5
	usrS3Gdq32QhmI0KYGslX0ghFTYwSbcK51pSrK1/nlop0HAb0bQaNA9yxXO4Vm0muwmg
	ODGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PbDWFOiPkRlhOkjV4QyY10KCXO1B7lQgzR/vaCwA/lo=;
	b=kbe3b8VIgCXOpaRxdBNoIfzGy2bgYMfBbvEB70iPHAnJ5M6fFAsQRs30FOvFeyHQu6
	k5g+ijtdPgSjf+sBgEkcZLU9Q0/G65GbKxDBKvl/7/QVRYw5W8p5XbaGZAzb42aDF625
	6BPAepN5LM86NkrQWtPvuFck/UA5IAPmoClxhsa3C3xz0V7Xbgk6+RULj76OgjAVcOZG
	l1Q1bT7tOYGCecUGZInl+KiVkG7FXhShwfmxQHsrS/h4upXBTZByIKcaD8f1VPtUvZuP
	QxOuckJTf5sD0JgBrGH37aa8r0kb9l6N/Xmgea4ne9+lHVh7cxJF8RJHlMrm+JKCicFn
	gdcQ==
X-Gm-Message-State: AElRT7Epz4F4335XfLk5TLMKhV04vgzvHx2b/zfAWDwSULTRrwzuTEMU
	6HDYq6aMd618e+Cg1pQDCaqJDA==
X-Google-Smtp-Source: AG47ELvjWVMD2yeoX+/GdGVq0Np3yFvVKlL3cnw5H818Iv2y0xEkT/m0N0g0WYHS6730/kgedjSPMw==
X-Received: by 10.99.149.68 with SMTP id t4mr3363464pgn.144.1521258048915;
	Fri, 16 Mar 2018 20:40:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	184sm874800pfg.124.2018.03.16.20.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 20:40:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:40:35 -0700
Message-Id: <b4f8a2fe4c3f68d780f2c9be6fe26cb958ec46bc.1521257828.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <cover.1521257828.git.raj.khem@gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] python-numpy: Fix build for riscv64
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
X-List-Received-Date: Sat, 17 Mar 2018 03:40:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-npy_cpu-Add-riscv-support.patch     |  28 +++++
 .../python-numpy/files/riscv64/_numpyconfig.h      |  32 +++++
 .../python-numpy/files/riscv64/config.h            | 139 +++++++++++++++++++++
 .../recipes-devtools/python-numpy/python-numpy.inc |   5 +
 4 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
 create mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/config.h

diff --git a/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch b/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
new file mode 100644
index 0000000000..4f5c4f5f0d
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
@@ -0,0 +1,28 @@
+From 30fb1bf9244bb0789c02ec7c98a923acc7200206 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Mar 2018 19:55:21 -0700
+Subject: [PATCH] npy_cpu: Add riscv support
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/10761]
+
+ numpy/core/include/numpy/npy_cpu.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
+index 84653ea18..9e88db873 100644
+--- a/numpy/core/include/numpy/npy_cpu.h
++++ b/numpy/core/include/numpy/npy_cpu.h
+@@ -78,6 +78,8 @@
+     #define NPY_CPU_AARCH64
+ #elif defined(__mc68000__)
+     #define NPY_CPU_M68K
++#elif defined(__riscv)
++    #define NPY_CPU_RISCV
+ #elif defined(__arc__) && defined(__LITTLE_ENDIAN__)
+     #define NPY_CPU_ARCEL
+ #elif defined(__arc__) && defined(__BIG_ENDIAN__)
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h b/meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
new file mode 100644
index 0000000000..109deb0435
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
@@ -0,0 +1,32 @@
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
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta/recipes-devtools/python-numpy/files/riscv64/config.h b/meta/recipes-devtools/python-numpy/files/riscv64/config.h
new file mode 100644
index 0000000000..c30b868f2f
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/riscv64/config.h
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
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index 10af4c50e3..5c5f0c837a 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -8,6 +8,7 @@ SRCNAME = "numpy"
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://fix_shebang_f2py.patch \
+           file://0001-npy_cpu-Add-riscv-support.patch \
            ${CONFIGFILESURI} "
 SRC_URI[md5sum] = "0e09f20f62ab9f8a02cb7bd3fd023482"
 SRC_URI[sha256sum] = "8708a775be9a9a457b80a49193c57bd9d51a8a195ed1f1c4b8e89eaf3aa646ee"
@@ -69,6 +70,10 @@ CONFIGFILESURI_mipsarchn32el = " \
     file://config.h \
     file://_numpyconfig.h \
 "
+CONFIGFILESURI_riscv64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
2.16.2


