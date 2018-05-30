Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 953CD74EBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 05:04:56 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id a20-v6so8393569pfo.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jgvwceDQqrexMaB6CLo/WQwpdhKsNXM6OksMy7rI0SA=;
	b=MueIXLxr/pUt7bPR3ElGNn/sfDg5/dK8WIV9FRPtX+Mu26jpvQ9o61u8t2gunnpq3g
	qK3m2oVTnP3Jyx7lU73dHy4zcIRmKVJVFLpB3GFQ2Hk9Z6TlwAomXdD5V9r5CStO2T6U
	LG4ettvaPZtSGrIFs9Xe6lMPwxaKBp5EMDy9y1spkAqoaEuXXUNUadbHSdq9U5P8K7oJ
	T8Q8CCnEfKCoTX2O3A3adeltEdQfxpjH/lR5AEncYxiSbqT02Lwyqc8XPwBNrDgoiO5O
	dyyHmfk/U98DENl85i6YWDxnW8DLiUs1iM/rLbBk7bfcvJZBEkt1mmxKXTBkK6Fz/p5+
	UBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jgvwceDQqrexMaB6CLo/WQwpdhKsNXM6OksMy7rI0SA=;
	b=roSEugGdb4MOuBmeAnndT4ixytR4A0hxK1vUgUzPSp5b3sd5QdxWjFD24b+saTRTUx
	PAiPtzwEaJUksGqFg2toyCxeWnXGiUJ+6qPyDseCCmEjKnzAaWGLkj3AoZcLyaTrzeTm
	tuBCqcqzGRlRKUS2U3m5zhsM5pYarJW4hH1UyQHFlkyLFrK1Ad0sZgYKCtnmH2yAQpfE
	1p5vKk0f0XOHUbVDYhgKsYZp0OEIhfociXwOtUnbbDs2jPoUni8owZBRCNqXUKjVXnpw
	G+PCfmprN9wnY/wP49nRQPFzCwqa305CreB3alWxGtwcKO54Z40U1ZRekbShCa+Q0Fw/
	4K/A==
X-Gm-Message-State: ALKqPwdWoORU99MmJkVo3mPQP++t8ra9gQmS8Hq27AMscOT43oIBHZPM
	TLiS3ZzVYwbczRQP+wdfjl6g6A==
X-Google-Smtp-Source: ADUXVKITudxw4/1R9iulnsk95bSnp19hCS53alXT60h7KrtA0UbCCLFfz+Z5J8szSxuMTohIEDWEwA==
X-Received: by 2002:a63:ad4a:: with SMTP id
	y10-v6mr1026978pgo.330.1527656695303; 
	Tue, 29 May 2018 22:04:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	l71-v6sm24952157pge.8.2018.05.29.22.04.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 22:04:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 22:04:49 -0700
Message-Id: <29b39b01bc5c8edadae553e8545e3b5f0d49a3dd.1527656441.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527656441.git.raj.khem@gmail.com>
References: <cover.1527656441.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] gcc-8: Add recipes for 8.1 release
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
X-List-Received-Date: Wed, 30 May 2018 05:04:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc         | 124 +++++++++
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  42 +++
 .../gcc/gcc-8.1/0002-c99-snprintf.patch       |  28 ++
 .../0003-gcc-poison-system-directories.patch  | 192 +++++++++++++
 .../gcc-8.1/0004-gcc-poison-dir-extend.patch  |  39 +++
 ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 +++++
 .../gcc-8.1/0006-64-bit-multilib-hack.patch   |  85 ++++++
 .../gcc/gcc-8.1/0007-optional-libstdc.patch   | 125 +++++++++
 ...gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 ++++
 .../gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch    |  38 +++
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 +++++++
 .../0011-fortran-cross-compile-hack.patch     |  46 ++++
 .../gcc/gcc-8.1/0012-cpp-honor-sysroot.patch  |  54 ++++
 .../0013-MIPS64-Default-to-N64-ABI.patch      |  57 ++++
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234 ++++++++++++++++
 ...gcc-Fix-argument-list-too-long-error.patch |  40 +++
 .../gcc/gcc-8.1/0016-Disable-sdt.patch        | 113 ++++++++
 .../gcc/gcc-8.1/0017-libtool.patch            |  42 +++
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  43 +++
 ...-config-files-from-B-instead-of-usin.patch | 102 +++++++
 ...ir-from-.la-which-usually-points-to-.patch |  31 +++
 .../gcc/gcc-8.1/0021-export-CPP.patch         |  53 ++++
 ...ILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 +++
 ...e-target-gcc-headers-can-be-included.patch |  98 +++++++
 ...ild-with-disable-dependency-tracking.patch |  54 ++++
 ...t-directory-during-relink-if-inst_pr.patch |  38 +++
 ...IR-replacement-instead-of-hardcoding.patch |  29 ++
 ...27-aarch64-Add-support-for-musl-ldso.patch |  28 ++
 ...-fix-libcc1-s-install-path-and-rpath.patch |  54 ++++
 ...le-sysroot-support-for-nativesdk-gcc.patch | 213 +++++++++++++++
 ...sroot-gcc-version-specific-dirs-with.patch | 102 +++++++
 ...ous-_FOR_BUILD-and-related-variables.patch | 137 ++++++++++
 ...032-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  28 ++
 ...d-to-link-commandline-for-musl-targe.patch |  87 ++++++
 ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 125 +++++++++
 ...using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 ++
 ...as-for-__cpu_indicator_init-instead-.patch |  86 ++++++
 .../0037-sync-gcc-stddef.h-with-musl.patch    |  91 ++++++
 ...-fault-in-precompiled-header-generat.patch |  60 ++++
 .../0039-Fix-for-testsuite-failure.patch      | 258 ++++++++++++++++++
 .../gcc/gcc-cross-canadian_8.1.bb             |   5 +
 .../gcc/gcc-cross-initial_8.1.bb              |   2 +
 meta/recipes-devtools/gcc/gcc-cross_8.1.bb    |   3 +
 .../gcc/gcc-crosssdk-initial_8.1.bb           |   3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb |   2 +
 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb  |   7 +
 .../gcc/gcc-sanitizers_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/gcc-source_8.1.bb   |   4 +
 meta/recipes-devtools/gcc/gcc_8.1.bb          |  10 +
 .../gcc/libgcc-initial_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/libgcc_8.1.bb       |   2 +
 meta/recipes-devtools/gcc/libgfortran_8.1.bb  |   3 +
 52 files changed, 3320 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-source_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_8.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgfortran_8.1.bb

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
new file mode 100644
index 0000000000..ecc1ceff99
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -0,0 +1,124 @@
+require gcc-common.inc
+
+# Third digit in PV should be incremented after a minor release
+
+PV = "8.1.0"
+
+# BINV should be incremented to a revision after a minor gcc release
+
+BINV = "8.1.0"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-8.1:${FILE_DIRNAME}/gcc-8.1/backport:"
+
+DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
+
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+    file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
+"
+
+#RELEASE = "8.0.1-RC-20180427"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
+#SRCREV = "f7cf798b73fd1a07098f9a490deec1e2a36e0bed"
+#BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
+#BASEURI ?= "http://mirrors.concertpass.com/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
+
+SRC_URI = "\
+           ${BASEURI} \
+           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+           file://0002-c99-snprintf.patch \
+           file://0003-gcc-poison-system-directories.patch \
+           file://0004-gcc-poison-dir-extend.patch \
+           file://0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+           file://0006-64-bit-multilib-hack.patch \
+           file://0007-optional-libstdc.patch \
+           file://0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
+           file://0009-COLLECT_GCC_OPTIONS.patch \
+           file://0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+           file://0011-fortran-cross-compile-hack.patch \
+           file://0012-cpp-honor-sysroot.patch \
+           file://0013-MIPS64-Default-to-N64-ABI.patch \
+           file://0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+           file://0015-gcc-Fix-argument-list-too-long-error.patch \
+           file://0016-Disable-sdt.patch \
+           file://0017-libtool.patch \
+           file://0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+           file://0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+           file://0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
+           file://0021-export-CPP.patch \
+           file://0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch \
+           file://0023-Ensure-target-gcc-headers-can-be-included.patch \
+           file://0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
+           file://0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+           file://0027-aarch64-Add-support-for-musl-ldso.patch \
+           file://0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0029-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0031-Fix-various-_FOR_BUILD-and-related-variables.patch \
+           file://0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
+           file://0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
+           file://0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           file://0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0037-sync-gcc-stddef.h-with-musl.patch \
+           file://0038-fix-segmentation-fault-in-precompiled-header-generat.patch \
+           file://0039-Fix-for-testsuite-failure.patch \
+           ${BACKPORTS} \
+"
+BACKPORTS = "\
+"
+SRC_URI[md5sum] = "65f7c65818dc540b3437605026d329fc"
+SRC_URI[sha256sum] = "1d1866f992626e61349a1ccd0b8d5253816222cdc13390dcfaa74b093aa2b153"
+
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
+#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
+B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+
+# Language Overrides
+FORTRAN = ""
+JAVA = ""
+
+LTO = "--enable-lto"
+
+EXTRA_OECONF_BASE = "\
+    ${LTO} \
+    --enable-libssp \
+    --enable-libitm \
+    --disable-bootstrap \
+    --disable-libmudflap \
+    --with-system-zlib \
+    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
+    --enable-linker-build-id \
+    --with-ppl=no \
+    --with-cloog=no \
+    --enable-checking=release \
+    --enable-cheaders=c_global \
+    --without-isl \
+"
+
+EXTRA_OECONF_INITIAL = "\
+    --disable-libmudflap \
+    --disable-libgomp \
+    --disable-libitm \
+    --disable-libquadmath \
+    --with-system-zlib \
+    --disable-lto \
+    --disable-plugin \
+    --enable-decimal-float=no \
+    --without-isl \
+    gcc_cv_libc_provides_ssp=yes \
+"
+
+EXTRA_OECONF_PATHS = "\
+    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
+    --with-sysroot=/not/exist \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000000..423fe28e11
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -0,0 +1,42 @@
+From b752fb2b6d6f6da68da5386b96abf0d74cd4bbe6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:37:11 +0400
+Subject: [PATCH 01/39] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ configure    | 2 +-
+ configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 69c99e99cca..517fb70192e 100755
+--- a/configure
++++ b/configure
+@@ -7511,7 +7511,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+diff --git a/configure.ac b/configure.ac
+index a1edc369a27..f8c254f1fac 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3100,7 +3100,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
new file mode 100644
index 0000000000..aa123b41a1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0002-c99-snprintf.patch
@@ -0,0 +1,28 @@
+From 5fbfcf247ed6dd01263639daf0c9c3a291e2fd3a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:49:03 +0400
+Subject: [PATCH 02/39] c99-snprintf
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ libstdc++-v3/include/c_std/cstdio | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/include/c_std/cstdio
+index 1b9571eaa8d..ad816be4fd1 100644
+--- a/libstdc++-v3/include/c_std/cstdio
++++ b/libstdc++-v3/include/c_std/cstdio
+@@ -144,7 +144,7 @@ namespace std
+   using ::vsprintf;
+ } // namespace std
+ 
+-#if _GLIBCXX_USE_C99_STDIO
++#if _GLIBCXX_USE_C99_STDIO || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
new file mode 100644
index 0000000000..1839d4c7b8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0003-gcc-poison-system-directories.patch
@@ -0,0 +1,192 @@
+From 48c670d2678e0323d88eb72205e039f393cabe05 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:59:00 +0400
+Subject: [PATCH 03/39] gcc: poison-system-directories
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [distribution: codesourcery]
+---
+ gcc/common.opt      |  4 ++++
+ gcc/config.in       |  6 ++++++
+ gcc/configure       | 16 ++++++++++++++++
+ gcc/configure.ac    | 10 ++++++++++
+ gcc/doc/invoke.texi |  9 +++++++++
+ gcc/gcc.c           |  2 ++
+ gcc/incpath.c       | 19 +++++++++++++++++++
+ 7 files changed, 66 insertions(+)
+
+diff --git a/gcc/common.opt b/gcc/common.opt
+index d6ef85928f3..7b29efe3882 100644
+--- a/gcc/common.opt
++++ b/gcc/common.opt
+@@ -679,6 +679,10 @@ Wreturn-local-addr
+ Common Var(warn_return_local_addr) Init(1) Warning
+ Warn about returning a pointer/reference to a local or temporary variable.
+ 
++Wpoison-system-directories
++Common Var(flag_poison_system_directories) Init(1) Warning
++Warn for -I and -L options using system directories if cross compiling
++
+ Wshadow
+ Common Var(warn_shadow) Warning
+ Warn when one variable shadows another.  Same as -Wshadow=global.
+diff --git a/gcc/config.in b/gcc/config.in
+index 5bccb408016..1c784a8276b 100644
+--- a/gcc/config.in
++++ b/gcc/config.in
+@@ -194,6 +194,12 @@
+ #endif
+ 
+ 
++/* Define to warn for use of native system header directories */
++#ifndef USED_FOR_TARGET
++#undef ENABLE_POISON_SYSTEM_DIRECTORIES
++#endif
++
++
+ /* Define if you want all operations on RTL (the basic data structure of the
+    optimizer and back end) to be checked for dynamic type safety at runtime.
+    This is quite expensive. */
+diff --git a/gcc/configure b/gcc/configure
+index 5c345ce0fd7..cafd05fd150 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -953,6 +953,7 @@ with_system_zlib
+ enable_maintainer_mode
+ enable_link_mutex
+ enable_version_specific_runtime_libs
++enable_poison_system_directories
+ enable_plugin
+ enable_host_shared
+ enable_libquadmath_support
+@@ -1696,6 +1697,8 @@ Optional Features:
+   --enable-version-specific-runtime-libs
+                           specify that runtime libraries should be installed
+                           in a compiler-specific directory
++  --enable-poison-system-directories
++                          warn for use of native system header directories
+   --enable-plugin         enable plugin support
+   --enable-host-shared    build host code as shared libraries
+   --disable-libquadmath-support
+@@ -29715,6 +29718,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+ fi
+ 
+ 
++# Check whether --enable-poison-system-directories was given.
++if test "${enable_poison_system_directories+set}" = set; then :
++  enableval=$enable_poison_system_directories;
++else
++  enable_poison_system_directories=no
++fi
++
++if test "x${enable_poison_system_directories}" = "xyes"; then
++
++$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
++
++fi
++
+ # Substitute configuration variables
+ 
+ 
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 65dbf1f2f80..dd5b38195ce 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -6341,6 +6341,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+                 [specify that runtime libraries should be
+                  installed in a compiler-specific directory])])
+ 
++AC_ARG_ENABLE([poison-system-directories],
++             AS_HELP_STRING([--enable-poison-system-directories],
++                            [warn for use of native system header directories]),,
++             [enable_poison_system_directories=no])
++if test "x${enable_poison_system_directories}" = "xyes"; then
++  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
++           [1],
++           [Define to warn for use of native system header directories])
++fi
++
+ # Substitute configuration variables
+ AC_SUBST(subdirs)
+ AC_SUBST(srcdir)
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index 255149fcfb8..cb71b60fe3c 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -303,6 +303,7 @@ Objective-C and Objective-C++ Dialects}.
+ -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned -Wpadded @gol
+ -Wparentheses  -Wno-pedantic-ms-format @gol
+ -Wplacement-new  -Wplacement-new=@var{n} @gol
++-Wno-poison-system-directories @gol
+ -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
+ -Wno-pragmas  -Wredundant-decls  -Wrestrict  -Wno-return-local-addr @gol
+ -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
+@@ -5712,6 +5713,14 @@ made up of data only and thus requires no special treatment.  But, for
+ most targets, it is made up of code and thus requires the stack to be
+ made executable in order for the program to work properly.
+ 
++@item -Wno-poison-system-directories
++@opindex Wno-poison-system-directories
++Do not warn for @option{-I} or @option{-L} options using system
++directories such as @file{/usr/include} when cross compiling.  This
++option is intended for use in chroot environments when such
++directories contain the correct headers and libraries for the target
++system rather than the host.
++
+ @item -Wfloat-equal
+ @opindex Wfloat-equal
+ @opindex Wno-float-equal
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index a716f708259..02b3cd39fc2 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1037,6 +1037,8 @@ proper position among the other output files.  */
+    "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
+    "%X %{o*} %{e*} %{N} %{n} %{r}\
+     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
++    %{Wno-poison-system-directories:--no-poison-system-directories} \
++    %{Werror=poison-system-directories:--error-poison-system-directories} \
+     %{static|no-pie|static-pie:} %{L*} %(mfwrap) %(link_libgcc) " \
+     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SPEC " \
+     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
+diff --git a/gcc/incpath.c b/gcc/incpath.c
+index b11c6a57939..e3b7a21966f 100644
+--- a/gcc/incpath.c
++++ b/gcc/incpath.c
+@@ -26,6 +26,7 @@
+ #include "intl.h"
+ #include "incpath.h"
+ #include "cppdefault.h"
++#include "diagnostic-core.h"
+ 
+ /* Microsoft Windows does not natively support inodes.
+    VMS has non-numeric inodes.  */
+@@ -393,6 +394,24 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+ 	}
+       fprintf (stderr, _("End of search list.\n"));
+     }
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (flag_poison_system_directories)
++    {
++       struct cpp_dir *p;
++
++       for (p = heads[INC_QUOTE]; p; p = p->next)
++         {
++          if ((!strncmp (p->name, "/usr/include", 12))
++              || (!strncmp (p->name, "/usr/local/include", 18))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++            warning (OPT_Wpoison_system_directories,
++                     "include location \"%s\" is unsafe for "
++                     "cross-compilation",
++                     p->name);
++         }
++    }
++#endif
+ }
+ 
+ /* Use given -I paths for #include "..." but not #include <...>, and
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
new file mode 100644
index 0000000000..1072d5b18f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0004-gcc-poison-dir-extend.patch
@@ -0,0 +1,39 @@
+From 97370eadcd10da5da529dfb734df56993ce24644 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:00:34 +0400
+Subject: [PATCH 04/39] gcc-poison-dir-extend
+
+Add /sw/include and /opt/include based on the original
+zecke-no-host-includes.patch patch.  The original patch checked for
+/usr/include, /sw/include and /opt/include and then triggered a failure and
+aborted.
+
+Instead, we add the two missing items to the current scan.  If the user
+wants this to be a failure, they can add "-Werror=poison-system-directories".
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/incpath.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/incpath.c b/gcc/incpath.c
+index e3b7a21966f..9a457e02dd3 100644
+--- a/gcc/incpath.c
++++ b/gcc/incpath.c
+@@ -404,7 +404,9 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+          {
+           if ((!strncmp (p->name, "/usr/include", 12))
+               || (!strncmp (p->name, "/usr/local/include", 18))
+-              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
++              || (!strncmp (p->name, "/usr/X11R6/include", 18))
++              || (!strncmp (p->name, "/sw/include", 11))
++              || (!strncmp (p->name, "/opt/include", 12)))
+             warning (OPT_Wpoison_system_directories,
+                      "include location \"%s\" is unsafe for "
+                      "cross-compilation",
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000000..8b1b9769a4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -0,0 +1,73 @@
+From ae3fe6e5e50937de6e4223ca90810187372a8cf5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:08:31 +0400
+Subject: [PATCH 05/39] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
+
+Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
+
+This alternative patch is better because it lets you just use CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped target libraries are never compiled with the native compiler, it makes little sense to use different flags for stage1 and later stages. And it also makes little sense to use a different variable than CFLAGS_FOR_TARGET.
+
+Other changes I had to do include:
+
+- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner this way though.
+
+- passing the right CFLAGS to configure scripts as exported environment variables
+
+I also stopped passing LIBCFLAGS to configure scripts since they are unused in the whole src tree. And I updated the documentation as H-P reminded me to do.
+
+Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok for 4.3?
+
+Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ configure | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/configure b/configure
+index 517fb70192e..acd2b97df40 100755
+--- a/configure
++++ b/configure
+@@ -6772,6 +6772,38 @@ fi
+ 
+ 
+ 
++# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
++# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
++# might also be empty (or "-g", if a non-GCC C++ compiler is in the path).
++# We want to ensure that TARGET libraries (which we know are built with
++# gcc) are built with "-O2 -g", so include those options when setting
++# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
++if test "x$CFLAGS_FOR_TARGET" = x; then
++  CFLAGS_FOR_TARGET=$CFLAGS
++  case " $CFLAGS " in
++    *" -O2 "*) ;;
++    *) CFLAGS_FOR_TARGET="-O2 $CFLAGS" ;;
++  esac
++  case " $CFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CFLAGS_FOR_TARGET="-g $CFLAGS" ;;
++  esac
++fi
++
++
++if test "x$CXXFLAGS_FOR_TARGET" = x; then
++  CXXFLAGS_FOR_TARGET=$CXXFLAGS
++  case " $CXXFLAGS " in
++    *" -O2 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-O2 $CXXFLAGS" ;;
++  esac
++  case " $CXXFLAGS " in
++    *" -g "* | *" -g3 "*) ;;
++    *) CXXFLAGS_FOR_TARGET="-g $CXXFLAGS" ;;
++  esac
++fi
++
++
+ # Handle --with-headers=XXX.  If the value is not "yes", the contents of
+ # the named directory are copied to $(tooldir)/sys-include.
+ if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
new file mode 100644
index 0000000000..0dce95c890
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0006-64-bit-multilib-hack.patch
@@ -0,0 +1,85 @@
+From 89af3b7399313b337f06c19cc2d787aa16d27711 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:10:06 +0400
+Subject: [PATCH 06/39] 64-bit multilib hack.
+
+GCC has internal multilib handling code but it assumes a very specific rigid directory
+layout. The build system implementation of multilib layout is very generic and allows
+complete customisation of the library directories.
+
+This patch is a partial solution to allow any custom directories to be passed into gcc
+and handled correctly. It forces gcc to use the base_libdir (which is the current
+directory, "."). We need to do this for each multilib that is configured as we don't
+know which compiler options may be being passed into the compiler. Since we have a compiler
+per mulitlib at this point that isn't an issue.
+
+The one problem is the target compiler is only going to work for the default multlilib at
+this point. Ideally we'd figure out which multilibs were being enabled with which paths
+and be able to patch these entries with a complete set of correct paths but this we
+don't have such code at this point. This is something the target gcc recipe should do
+and override these platform defaults in its build config.
+
+RP 15/8/11
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/config/i386/t-linux64   |  6 ++----
+ gcc/config/mips/t-linux64   | 10 +++-------
+ gcc/config/rs6000/t-linux64 |  5 ++---
+ 3 files changed, 7 insertions(+), 14 deletions(-)
+
+diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
+index 8ea0faff369..266c6008004 100644
+--- a/gcc/config/i386/t-linux64
++++ b/gcc/config/i386/t-linux64
+@@ -32,7 +32,5 @@
+ #
+ comma=,
+ MULTILIB_OPTIONS    = $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
+-MULTILIB_DIRNAMES   = $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPTIONS)))
+-MULTILIB_OSDIRNAMES = m64=../lib64$(call if_multiarch,:x86_64-linux-gnu)
+-MULTILIB_OSDIRNAMES+= m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-linux-gnu)
+-MULTILIB_OSDIRNAMES+= mx32=../libx32$(call if_multiarch,:x86_64-linux-gnux32)
++MULTILIB_DIRNAMES = . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
+index c017b7d04c5..126892cf40b 100644
+--- a/gcc/config/mips/t-linux64
++++ b/gcc/config/mips/t-linux64
+@@ -17,10 +17,6 @@
+ # <http://www.gnu.org/licenses/>.
+ 
+ MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
+-MULTILIB_DIRNAMES = n32 32 64
+-MIPS_EL = $(if $(filter %el, $(firstword $(subst -, ,$(target)))),el)
+-MIPS_SOFT = $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cpu_default)) $(filter soft, $(with_float))),soft)
+-MULTILIB_OSDIRNAMES = \
+-	../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT)) \
+-	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
+-	../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
++MULTILIB_DIRNAMES = . . .
++MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
++
+diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
+index 0faa2a02df4..13fd8ca971e 100644
+--- a/gcc/config/rs6000/t-linux64
++++ b/gcc/config/rs6000/t-linux64
+@@ -26,10 +26,9 @@
+ # MULTILIB_OSDIRNAMES according to what is found on the target.
+ 
+ MULTILIB_OPTIONS    := m64/m32
+-MULTILIB_DIRNAMES   := 64 32
++MULTILIB_DIRNAMES   := . .
+ MULTILIB_EXTRA_OPTS := 
+-MULTILIB_OSDIRNAMES := m64=../lib64$(call if_multiarch,:powerpc64-linux-gnu)
+-MULTILIB_OSDIRNAMES += m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-linux-gnu)
++MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
+ 
+ rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
+ 	$(COMPILE) $<
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
new file mode 100644
index 0000000000..721ea03fad
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0007-optional-libstdc.patch
@@ -0,0 +1,125 @@
+From fb7df63e9548c29b70601d642a1850fc455f8565 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:12:56 +0400
+Subject: [PATCH 07/39] optional libstdc
+
+gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
+will not run correctly since by default the linker will try to link against libstdc++
+which shouldn't exist yet. We need an option to disable -lstdc++
+option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc
+driver. This patch adds such an option which only disables the -lstdc++.
+
+A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
+do this officially, the likely answer is don't build libstdc++ separately.
+
+RP 29/6/10
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ gcc/c-family/c.opt  |  4 ++++
+ gcc/cp/g++spec.c    |  1 +
+ gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
+ gcc/gcc.c           |  1 +
+ 4 files changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
+index 5013501b232..6312f2c8f90 100644
+--- a/gcc/c-family/c.opt
++++ b/gcc/c-family/c.opt
+@@ -1900,6 +1900,10 @@ nostdinc++
+ C++ ObjC++
+ Do not search standard system include directories for C++.
+ 
++nostdlib++
++Driver
++Do not link standard C++ runtime library
++
+ o
+ C ObjC C++ ObjC++ Joined Separate
+ ; Documented in common.opt
+diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
+index 443a1746da3..e9b51be62ef 100644
+--- a/gcc/cp/g++spec.c
++++ b/gcc/cp/g++spec.c
+@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **in_decoded_options,
+       switch (decoded_options[i].opt_index)
+ 	{
+ 	case OPT_nostdlib:
++	case OPT_nostdlib__:
+ 	case OPT_nodefaultlibs:
+ 	  library = -1;
+ 	  break;
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index cb71b60fe3c..b0d481e3a30 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -211,6 +211,9 @@ in the following sections.
+ -fno-weak  -nostdinc++ @gol
+ -fvisibility-inlines-hidden @gol
+ -fvisibility-ms-compat @gol
++-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
++-fvtv-counts -fvtv-debug @gol
++-nostdlib++ @gol
+ -fext-numeric-literals @gol
+ -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @gol
+ -Wdelete-non-virtual-dtor  -Wliteral-suffix  -Wmultiple-inheritance @gol
+@@ -509,7 +512,7 @@ Objective-C and Objective-C++ Dialects}.
+ -s  -static -static-pie -static-libgcc  -static-libstdc++ @gol
+ -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
+ -static-libmpx  -static-libmpxwrappers @gol
+--shared  -shared-libgcc  -symbolic @gol
++-shared  -shared-libgcc  -symbolic -nostdlib++ @gol
+ -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
+ -u @var{symbol}  -z @var{keyword}}
+ 
+@@ -12331,6 +12334,33 @@ library subroutines.
+ constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
+ GNU Compiler Collection (GCC) Internals}.)
+ 
++@item -nostdlib++
++@opindex nostdlib++
++Do not use the standard system C++ runtime libraries when linking.
++Only the libraries you specify will be passed to the linker.
++
++@cindex @option{-lgcc}, use with @option{-nostdlib}
++@cindex @option{-nostdlib} and unresolved references
++@cindex unresolved references and @option{-nostdlib}
++@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
++@cindex @option{-nodefaultlibs} and unresolved references
++@cindex unresolved references and @option{-nodefaultlibs}
++One of the standard libraries bypassed by @option{-nostdlib} and
++@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal subroutines
++which GCC uses to overcome shortcomings of particular machines, or special
++needs for some languages.
++(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
++Collection (GCC) Internals},
++for more discussion of @file{libgcc.a}.)
++In most cases, you need @file{libgcc.a} even when you want to avoid
++other standard libraries.  In other words, when you specify @option{-nostdlib}
++or @option{-nodefaultlibs} you should usually specify @option{-lgcc} as well.
++This ensures that you have no unresolved references to internal GCC
++library subroutines.
++(An example of such an internal subroutine is @code{__main}, used to ensure C++
++constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
++GNU Compiler Collection (GCC) Internals}.)
++
+ @item -pie
+ @opindex pie
+ Produce a dynamically linked position independent executable on targets
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 02b3cd39fc2..8cd27a5dad5 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1047,6 +1047,7 @@ proper position among the other output files.  */
+     %(mflib) " STACK_SPLIT_SPEC "\
+     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
+     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}\
++    %{!nostdlib++:}\
+     %{!nostdlib:%{!nostartfiles:%E}} %{T*}  \n%(post_link) }}}}}}"
+ #endif
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
new file mode 100644
index 0000000000..a76b7f735b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
@@ -0,0 +1,59 @@
+From 11eb97efccb90b830c84ed077a25b1a15ad3335b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:14:20 +0400
+Subject: [PATCH 08/39] gcc: disable MASK_RELAX_PIC_CALLS bit
+
+The new feature added after 4.3.3
+"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
+will cause cc1plus eat up all the system memory when build webkit-gtk.
+The function mips_get_pic_call_symbol keeps on recursively calling itself.
+Disable this feature to walk aside the bug.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ gcc/configure    | 7 -------
+ gcc/configure.ac | 7 -------
+ 2 files changed, 14 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index cafd05fd150..19ba051d673 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -27553,13 +27553,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr_reloc" >&5
+ $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
+ 
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index dd5b38195ce..066dfe19bb6 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -4798,13 +4798,6 @@ x:
+         rm -f conftest.*
+       fi
+     fi
+-    if test $gcc_cv_as_ld_jalr_reloc = yes; then
+-      if test x$target_cpu_default = x; then
+-        target_cpu_default=MASK_RELAX_PIC_CALLS
+-      else
+-        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
+-      fi
+-    fi
+     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
+ 
+     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
new file mode 100644
index 0000000000..3abece0da7
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0009-COLLECT_GCC_OPTIONS.patch
@@ -0,0 +1,38 @@
+From e19d25847f08eeb5ef26a031fa5eff732bfd0d43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:16:28 +0400
+Subject: [PATCH 09/39] COLLECT_GCC_OPTIONS
+
+This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
+invoke collect2.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/gcc.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 8cd27a5dad5..d355d65583a 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -4677,6 +4677,15 @@ set_collect_gcc_options (void)
+ 		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
+ 
+   first_time = TRUE;
++#ifdef HAVE_LD_SYSROOT
++  if (target_system_root_changed && target_system_root)
++    {
++      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'--sysroot=")-1);
++      obstack_grow (&collect_obstack, target_system_root,strlen(target_system_root));
++      obstack_grow (&collect_obstack, "'", 1);
++      first_time = FALSE;
++    }
++#endif
+   for (i = 0; (int) i < n_switches; i++)
+     {
+       const char *const *args;
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
new file mode 100644
index 0000000000..5785b58934
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -0,0 +1,96 @@
+From 265cb883c310f3bb7e49fd13b81362476fbeb6c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:17:25 +0400
+Subject: [PATCH 10/39] Use the defaults.h in ${B} instead of ${S}, and t-oe in
+ ${B}
+
+Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
+the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+While compiling gcc-crosssdk-initial-x86_64 on some host, there is
+occasionally failure that test the existance of default.h doesn't
+work, the reason is tm_include_list='** defaults.h' rather than
+tm_include_list='** ./defaults.h'
+
+So we add the test condition for this situation.
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/Makefile.in  | 2 +-
+ gcc/configure    | 4 ++--
+ gcc/configure.ac | 4 ++--
+ gcc/mkconfig.sh  | 4 ++--
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 20bee0494b1..1367136bfac 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -538,7 +538,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+ TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
+ 
+ xmake_file=@xmake_file@
+-tmake_file=@tmake_file@
++tmake_file=@tmake_file@ ./t-oe
+ TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
+ TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
+ TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
+diff --git a/gcc/configure b/gcc/configure
+index 19ba051d673..a575839c1b2 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12158,8 +12158,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 066dfe19bb6..676116a6d96 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1922,8 +1922,8 @@ for f in $tm_file; do
+        tm_include_list="${tm_include_list} $f"
+        ;;
+     defaults.h )
+-       tm_file_list="${tm_file_list} \$(srcdir)/$f"
+-       tm_include_list="${tm_include_list} $f"
++       tm_file_list="${tm_file_list} ./$f"
++       tm_include_list="${tm_include_list} ./$f"
+        ;;
+     * )
+        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
+diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
+index 0f75c863c0b..68d8d6613cf 100644
+--- a/gcc/mkconfig.sh
++++ b/gcc/mkconfig.sh
+@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
+     if [ $# -ge 1 ]; then
+ 	echo '#ifdef IN_GCC' >> ${output}T
+ 	for file in "$@"; do
+-	    if test x"$file" = x"defaults.h"; then
++	    if test x"$file" = x"./defaults.h" -o x"$file" = x"defaults.h"; then
+ 		postpone_defaults_h="yes"
+ 	    else
+ 		echo "# include \"$file\"" >> ${output}T
+@@ -106,7 +106,7 @@ esac
+ 
+ # If we postponed including defaults.h, add the #include now.
+ if test x"$postpone_defaults_h" = x"yes"; then
+-    echo "# include \"defaults.h\"" >> ${output}T
++    echo "# include \"./defaults.h\"" >> ${output}T
+ fi
+ 
+ # Add multiple inclusion protection guard, part two.
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
new file mode 100644
index 0000000000..fe0fb7d531
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0011-fortran-cross-compile-hack.patch
@@ -0,0 +1,46 @@
+From 71cba188d47b6ae9d9b87261eb4bc9eb68ae355d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:20:01 +0400
+Subject: [PATCH 11/39] fortran cross-compile hack.
+
+* Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
+used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
+directory.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [embedded specific]
+---
+ libgfortran/configure    | 2 +-
+ libgfortran/configure.ac | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgfortran/configure b/libgfortran/configure
+index 91fce8fecd0..6747f86eb98 100755
+--- a/libgfortran/configure
++++ b/libgfortran/configure
+@@ -12883,7 +12883,7 @@ esac
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ ac_ext=${ac_fc_srcext-f}
+ ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
+ ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
+diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
+index bf6d3634dda..9dbe43cc616 100644
+--- a/libgfortran/configure.ac
++++ b/libgfortran/configure.ac
+@@ -250,7 +250,7 @@ AC_SUBST(enable_static)
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ AC_PROG_FC(gfortran)
+ 
+ # extra LD Flags which are required for targets
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
new file mode 100644
index 0000000000..961f96f11e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0012-cpp-honor-sysroot.patch
@@ -0,0 +1,54 @@
+From b3e8e7e8ae106e3207e9edc3d23dcce1464b755f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:22:00 +0400
+Subject: [PATCH 12/39] cpp: honor sysroot.
+
+Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
+preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
+rather than the --sysroot option specified on the commandline. If access to that directory is
+permission denied (unreadable), gcc will error.
+
+This happens when ccache is in use due to the fact it uses preprocessed source files.
+
+The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix,
+-isystem, -isysroot happen and the correct sysroot is used.
+
+[YOCTO #2074]
+
+RP 2012/04/13
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/cp/lang-specs.h | 2 +-
+ gcc/gcc.c           | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
+index f0802b8915c..f324d299849 100644
+--- a/gcc/cp/lang-specs.h
++++ b/gcc/cp/lang-specs.h
+@@ -64,5 +64,5 @@ along with GCC; see the file COPYING3.  If not see
+   {".ii", "@c++-cpp-output", 0, 0, 0},
+   {"@c++-cpp-output",
+    "%{!M:%{!MM:%{!E:\
+-    cc1plus -fpreprocessed %i %(cc1_options) %2\
++    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
+     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index d355d65583a..570cdc00034 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1343,7 +1343,7 @@ static const struct compiler default_compilers[] =
+ 					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 0, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+   {".s", "@assembler", 0, 0, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
new file mode 100644
index 0000000000..8ef8806b21
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0013-MIPS64-Default-to-N64-ABI.patch
@@ -0,0 +1,57 @@
+From 0f3629978cd7c98614e87d4fd190b89864221631 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:23:08 +0400
+Subject: [PATCH 13/39] MIPS64: Default to N64 ABI
+
+MIPS64 defaults to n32 ABI, this patch makes it
+so that it defaults to N64 ABI
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [OE config specific]
+---
+ gcc/config.gcc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 8741dd1e3b2..2ffcb39d85f 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -2137,29 +2137,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+ 			default_mips_arch=mips32
+ 			;;
+ 		mips64el-st-linux-gnu)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			tm_file="${tm_file} mips/st.h"
+ 			tmake_file="${tmake_file} mips/t-st"
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mips64octeon*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			tm_defines="${tm_defines} MIPS_CPU_STRING_DEFAULT=\\\"octeon\\\""
+ 			target_cpu_default=MASK_SOFT_FLOAT_ABI
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mipsisa64r6*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			default_mips_arch=mips64r6
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mipsisa64r2*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			default_mips_arch=mips64r2
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 		mips64*-*-linux* | mipsisa64*-*-linux*)
+-			default_mips_abi=n32
++			default_mips_abi=64
+ 			enable_mips_multilibs="yes"
+ 			;;
+ 	esac
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
new file mode 100644
index 0000000000..8913c87255
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -0,0 +1,234 @@
+From 53f1c382b1366c5621c8edead9c766950c290fd9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:24:50 +0400
+Subject: [PATCH 14/39] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+ relative to SYSTEMLIBS_DIR
+
+This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+relative to SYSTEMLIBS_DIR which can be set in generated headers
+This breaks the assumption of hardcoded multilib in gcc
+Change is only for the supported architectures in OE including
+SH, sparc, alpha for possible future support (if any)
+
+Removes the do_headerfix task in metadata
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [OE configuration]
+---
+ gcc/config/alpha/linux-elf.h |  4 ++--
+ gcc/config/arm/linux-eabi.h  |  4 ++--
+ gcc/config/arm/linux-elf.h   |  2 +-
+ gcc/config/i386/linux.h      |  2 +-
+ gcc/config/i386/linux64.h    |  6 +++---
+ gcc/config/linux.h           |  8 ++++----
+ gcc/config/mips/linux.h      | 12 ++++++------
+ gcc/config/rs6000/linux64.h  | 16 ++++++----------
+ gcc/config/sh/linux.h        |  2 +-
+ gcc/config/sparc/linux.h     |  2 +-
+ gcc/config/sparc/linux64.h   |  4 ++--
+ 11 files changed, 29 insertions(+), 33 deletions(-)
+
+diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
+index 36b74dc1993..02373578af8 100644
+--- a/gcc/config/alpha/linux-elf.h
++++ b/gcc/config/alpha/linux-elf.h
+@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
+ #define EXTRA_SPECS \
+ { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
+ 
+-#define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
++#define GLIBC_DYNAMIC_LINKER	SYSTEMLIBS_DIR "ld-linux.so.2"
++#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+ #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
+ #elif DEFAULT_LIBC == LIBC_GLIBC
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index 8585fde3d41..b3af68cac57 100644
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -62,8 +62,8 @@
+    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
+ 
+ #undef  GLIBC_DYNAMIC_LINKER
+-#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
+-#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
++#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
++#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"
+ #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
+ 
+ #define GLIBC_DYNAMIC_LINKER \
+diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
+index cfcd9cb1a5c..a798e987ecb 100644
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
+@@ -60,7 +60,7 @@
+ 
+ #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #define LINUX_TARGET_LINK_SPEC  "%{h*} \
+    %{static:-Bstatic} \
+diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
+index 69f97f15b0d..71bc31d9231 100644
+--- a/gcc/config/i386/linux.h
++++ b/gcc/config/i386/linux.h
+@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
+ <http://www.gnu.org/licenses/>.  */
+ 
+ #define GNU_USER_LINK_EMULATION "elf_i386"
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
+diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
+index f2d913e30ac..8725f33d8a5 100644
+--- a/gcc/config/i386/linux64.h
++++ b/gcc/config/i386/linux64.h
+@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
+ #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
+-#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
++#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+ #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 2ea4ff92c1d..487b0c0923b 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -81,10 +81,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+    GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
+    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
+    supporting both 32-bit and 64-bit compilation.  */
+-#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
+ #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
+ #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
+ #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index 2dfd0c18b90..12057c51b5e 100644
+--- a/gcc/config/mips/linux.h
++++ b/gcc/config/mips/linux.h
+@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
+ #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
+ 
+ #define GLIBC_DYNAMIC_LINKER32 \
+-  "%{mnan=2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
+ #define GLIBC_DYNAMIC_LINKER64 \
+-  "%{mnan=2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
+ #define GLIBC_DYNAMIC_LINKERN32 \
+-  "%{mnan=2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
+ 
+ #undef UCLIBC_DYNAMIC_LINKER32
+ #define UCLIBC_DYNAMIC_LINKER32 \
+-  "%{mnan=2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
+ #undef UCLIBC_DYNAMIC_LINKER64
+ #define UCLIBC_DYNAMIC_LINKER64 \
+-  "%{mnan=2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld64-uClibc.so.0}"
+ #define UCLIBC_DYNAMIC_LINKERN32 \
+-  "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
++  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
+ 
+ #undef MUSL_DYNAMIC_LINKER32
+ #define MUSL_DYNAMIC_LINKER32 \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 90fe6566255..55695dadd91 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -420,16 +420,11 @@ extern int dot_symbols;
+ #undef	LINK_OS_DEFAULT_SPEC
+ #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.1"
+-
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
+ #ifdef LINUX64_DEFAULT_ABI_ELFv2
+-#define GLIBC_DYNAMIC_LINKER64 \
+-"%{mabi=elfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
+-":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv1:" SYSTEMLIBS_DIR "ld64.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
+ #else
+-#define GLIBC_DYNAMIC_LINKER64 \
+-"%{mabi=elfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
+-":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
++#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv2:" SYSTEMLIBS_DIR "ld64.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
+ #endif
+ 
+ #define MUSL_DYNAMIC_LINKER32 \
+@@ -437,8 +432,9 @@ extern int dot_symbols;
+ #define MUSL_DYNAMIC_LINKER64 \
+   "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
+ 
+-#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
+-#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
++#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
++
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+ #define CHOOSE_DYNAMIC_LINKER(G, U, M) \
+   "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
+diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
+index 6d2ccd012ba..ec78a89ce15 100644
+--- a/gcc/config/sh/linux.h
++++ b/gcc/config/sh/linux.h
+@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
+   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
+   "%{mfdpic:-fdpic}.so.1"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef SUBTARGET_LINK_EMUL_SUFFIX
+ #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
+diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
+index 9fb03af0fe9..401fddbbb22 100644
+--- a/gcc/config/sparc/linux.h
++++ b/gcc/config/sparc/linux.h
+@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
+    When the -shared link option is used a final link is not being
+    done.  */
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #undef  LINK_SPEC
+ #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
+diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
+index c1fe42165b7..26a79bfa2e3 100644
+--- a/gcc/config/sparc/linux64.h
++++ b/gcc/config/sparc/linux64.h
+@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
+    When the -shared link option is used a final link is not being
+    done.  */
+ 
+-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
+-#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #ifdef SPARC_BI_ARCH
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
new file mode 100644
index 0000000000..4bff84285b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0015-gcc-Fix-argument-list-too-long-error.patch
@@ -0,0 +1,40 @@
+From 2e75a14cd60227e036790184f0eb400abc3c870b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:26:37 +0400
+Subject: [PATCH 15/39] gcc: Fix argument list too long error.
+
+There would be an "Argument list too long" error when the
+build directory is longer than 200, this is caused by:
+
+headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+
+The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
+it, use the $(sort list) of GNU make which can handle the too long list
+would fix the problem, the header would be short enough after sorted.
+The "tr ' ' '\012'" was used for translating the space to "\n", the
+$(sort list) doesn't need this.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 1367136bfac..71a8275c39f 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -3538,7 +3538,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config or c-family and .def
+ # files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
++	headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
new file mode 100644
index 0000000000..8197546200
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0016-Disable-sdt.patch
@@ -0,0 +1,113 @@
+From 423d87ac47d21e399d759d7ff3b638f0c721a7df Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:28:10 +0400
+Subject: [PATCH 16/39] Disable sdt.
+
+We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
+It may or may not exist from preivous builds though. To be determinstic, disable
+sdt.h usage always. This avoids build failures if the header is removed after configure
+but before libgcc is compiled for example.
+
+RP 2012/8/7
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Disable sdt for libstdc++-v3.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Inappropriate [hack]
+---
+ gcc/configure             | 12 ++++++------
+ gcc/configure.ac          | 18 +++++++++---------
+ libstdc++-v3/configure    |  6 +++---
+ libstdc++-v3/configure.ac |  2 +-
+ 4 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index a575839c1b2..872338f29b6 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -29296,12 +29296,12 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
+ $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
+ have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-
+-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+-
+-fi
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#
++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
++#
++#fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
+ $as_echo "$have_sys_sdt_h" >&6; }
+ 
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 676116a6d96..55046e68926 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5957,15 +5957,15 @@ fi
+ AC_SUBST([enable_default_ssp])
+ 
+ # Test for <sys/sdt.h> on the target.
+-GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
+-AC_MSG_CHECKING(sys/sdt.h in the target C library)
+-have_sys_sdt_h=no
+-if test -f $target_header_dir/sys/sdt.h; then
+-  have_sys_sdt_h=yes
+-  AC_DEFINE(HAVE_SYS_SDT_H, 1,
+-            [Define if your target C library provides sys/sdt.h])
+-fi
+-AC_MSG_RESULT($have_sys_sdt_h)
++#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
++#AC_MSG_CHECKING(sys/sdt.h in the target C library)
++#have_sys_sdt_h=no
++#if test -f $target_header_dir/sys/sdt.h; then
++#  have_sys_sdt_h=yes
++#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
++#            [Define if your target C library provides sys/sdt.h])
++#fi
++#AC_MSG_RESULT($have_sys_sdt_h)
+ 
+ # Check if TFmode long double should be used by default or not.
+ # Some glibc targets used DFmode long double, but with glibc 2.4
+diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
+index c9dbaa139d5..c64a77d152b 100755
+--- a/libstdc++-v3/configure
++++ b/libstdc++-v3/configure
+@@ -21786,11 +21786,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
+ ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
+ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+-  if test $glibcxx_cv_sys_sdt_h = yes; then
++#  if test $glibcxx_cv_sys_sdt_h = yes; then
+ 
+-$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
++#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
+ 
+-  fi
++#  fi
+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_h" >&5
+ $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
+ 
+diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
+index 0ef96270c9c..afe55a1b215 100644
+--- a/libstdc++-v3/configure.ac
++++ b/libstdc++-v3/configure.ac
+@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
+ GLIBCXX_CHECK_SC_NPROC_ONLN
+ GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
+ GLIBCXX_CHECK_SYSCTL_HW_NCPU
+-GLIBCXX_CHECK_SDT_H
++#GLIBCXX_CHECK_SDT_H
+ 
+ # Check for available headers.
+ AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch b/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
new file mode 100644
index 0000000000..0caa1ce160
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0017-libtool.patch
@@ -0,0 +1,42 @@
+From c8b11e96b11910b2d4df6ae8104466e3303d933f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:29:11 +0400
+Subject: [PATCH 17/39] libtool
+
+libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
+when running on am x86_64 build host.
+
+This patch stops this speading to libdir in the libstdc++.la file within libtool.
+Arguably, it shouldn't be passing this into libtool in the first place but
+for now this resolves the nastiest problems this causes.
+
+func_normal_abspath would resolve an empty path to `pwd` so we need
+to filter the zero case.
+
+RP 2012/8/24
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ ltmain.sh | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 9503ec85d70..0121fba707f 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -6359,6 +6359,10 @@ func_mode_link ()
+ 	func_warning "ignoring multiple \`-rpath's for a libtool library"
+ 
+       install_libdir="$1"
++      if test -n "$install_libdir"; then
++	func_normal_abspath "$install_libdir"
++	install_libdir=$func_normal_abspath_result
++      fi
+ 
+       oldlibs=
+       if test -z "$rpath"; then
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
new file mode 100644
index 0000000000..643cc671ba
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -0,0 +1,43 @@
+From 7dbba844a59bdf6e7d724f8bfa7927246cb7af8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:30:32 +0400
+Subject: [PATCH 18/39] gcc: armv4: pass fix-v4bx to linker to support EABI.
+
+The LINK_SPEC for linux gets overwritten by linux-eabi.h which
+means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
+the option is not passed to linker when chosing march=armv4
+This patch redefines this in linux-eabi.h and reinserts it
+for eabi defaulting toolchains.
+
+We might want to send it upstream.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ gcc/config/arm/linux-eabi.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index b3af68cac57..330b6e13c5f 100644
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -88,10 +88,14 @@
+ #define MUSL_DYNAMIC_LINKER \
+   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
+ 
++/* For armv4 we pass --fix-v4bx to linker to support EABI */
++#undef TARGET_FIX_V4BX_SPEC
++#define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+-#define LINK_SPEC EABI_LINK_SPEC					\
++#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC			\
+   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				\
+ 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
new file mode 100644
index 0000000000..084918652e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -0,0 +1,102 @@
+From 117140acd3c383f620ff75894276001c7405dcce Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:33:04 +0400
+Subject: [PATCH 19/39] Use the multilib config files from ${B} instead of
+ using the ones from ${S}
+
+Use the multilib config files from ${B} instead of using the ones from ${S}
+so that the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+---
+ gcc/configure    | 22 ++++++++++++++++++----
+ gcc/configure.ac | 22 ++++++++++++++++++----
+ 2 files changed, 36 insertions(+), 8 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index 872338f29b6..cfcadc93a01 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12138,10 +12138,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}"
+ 
+@@ -12152,6 +12162,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 55046e68926..44b90478f55 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1902,10 +1902,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}"
+ 
+@@ -1916,6 +1926,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
new file mode 100644
index 0000000000..911fe8521c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -0,0 +1,31 @@
+From a7266111a5ba2d146c979e86ff84f6b807ca5fdc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 09:39:38 +0000
+Subject: [PATCH 20/39] Avoid using libdir from .la which usually points to a
+ host path
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltmain.sh | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 0121fba707f..52bdbdb5f9c 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -5628,6 +5628,9 @@ func_mode_link ()
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
++	    # Instead of using libdir from .la which usually points to a host path,
++	    # use the path the .la is contained in.
++	    libdir="$abs_ladir"
+ 	    dir="$libdir"
+ 	    absdir="$libdir"
+ 	  fi
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
new file mode 100644
index 0000000000..2e6b411062
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0021-export-CPP.patch
@@ -0,0 +1,53 @@
+From c8599fc3b5781b319707c9c0f1b0a1ef7cddb027 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 09:40:59 +0000
+Subject: [PATCH 21/39] export CPP
+
+The OE environment sets and exports CPP as being the target gcc. When
+building gcc-cross-canadian for a mingw targetted sdk, the following can be found
+in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log:
+
+configure:3641: checking for _FILE_OFFSET_BITS value needed for large files
+configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
+configure:3666: $? = 0
+configure:3698: result: no
+configure:3786: checking how to run the C preprocessor
+configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
+configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
+configure:3876: $? = 0
+
+Note this is a *build* target (in build-x86_64-linux) so it should be
+using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
+headers are very different, using the wrong cpp is a real problem. It is leaking
+into configure through the CPP variable. Ultimately this leads to build
+failures related to not being able to include a process.h file for pem-unix.c.
+
+The fix is to ensure we export a sane CPP value into the build
+environment when using build targets. We could define a CPP_FOR_BUILD value which may be
+the version which needs to be upstreamed but for now, this fix is good enough to
+avoid the problem.
+
+RP 22/08/2013
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 2bf83b72265..1af45580086 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -149,6 +149,7 @@ BUILD_EXPORTS = \
+ 	AR="$(AR_FOR_BUILD)"; export AR; \
+ 	AS="$(AS_FOR_BUILD)"; export AS; \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
++	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
new file mode 100644
index 0000000000..17c581f11e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
@@ -0,0 +1,42 @@
+From 5e2ee46c720b6ce03a18da70dd4e0917c258ab0b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 10:21:55 +0000
+Subject: [PATCH 22/39] Disable the MULTILIB_OSDIRNAMES and other multilib
+ options.
+
+Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on
+systems where the libdir is NOT set to /lib64.  This is allowed by the
+ABI, as
+long as the dynamic loader is present in /lib.
+
+We simply want to use the default rules in gcc to find and configure the
+normal libdir.
+
+Upstream-Status: Inappropriate[OE-Specific]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/t-aarch64-linux | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
+index b9897785a89..7d06f0d0edb 100644
+--- a/gcc/config/aarch64/t-aarch64-linux
++++ b/gcc/config/aarch64/t-aarch64-linux
+@@ -21,8 +21,8 @@
+ LIB1ASMSRC   = aarch64/lib1funcs.asm
+ LIB1ASMFUNCS = _aarch64_sync_cache_range
+ 
+-AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
+-MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
+-MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
++#AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
++#MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
++#MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
+ 
+-MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
++#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
new file mode 100644
index 0000000000..4d4da1a524
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0023-Ensure-target-gcc-headers-can-be-included.patch
@@ -0,0 +1,98 @@
+From 73766424a2f71b1810fb8afdd863028855d87e5a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 10:25:11 +0000
+Subject: [PATCH 23/39] Ensure target gcc headers can be included
+
+There are a few headers installed as part of the OpenEmbedded
+gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
+built for the target architecture, these are within the target
+sysroot and not cross/nativesdk; thus they weren't able to be
+found by gcc with the existing search paths. Add support for
+picking up these headers under the sysroot supplied on the gcc
+command line in order to resolve this.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/Makefile.in  | 2 ++
+ gcc/cppdefault.c | 4 ++++
+ gcc/defaults.h   | 9 +++++++++
+ gcc/gcc.c        | 7 -------
+ 4 files changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 71a8275c39f..5ae693fb06c 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -614,6 +614,7 @@ libexecdir = @libexecdir@
+ 
+ # Directory in which the compiler finds libraries etc.
+ libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
++libsubdir_target = gcc/$(target_noncanonical)/$(version)
+ # Directory in which the compiler finds executables
+ libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
+ # Directory in which all plugin resources are installed
+@@ -2870,6 +2871,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+ 
+ PREPROCESSOR_DEFINES = \
+   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
+   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
+   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
+   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index b36a979d5ba..e2e187dedaf 100644
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
+@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
+     /* This is the dir for gcc's private headers.  */
+     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
+ #endif
++#ifdef GCC_INCLUDE_SUBDIR_TARGET
++    /* This is the dir for gcc's private headers under the specified sysroot.  */
++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++#endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+diff --git a/gcc/defaults.h b/gcc/defaults.h
+index 78a08a33f12..c8851277674 100644
+--- a/gcc/defaults.h
++++ b/gcc/defaults.h
+@@ -1451,4 +1451,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
+ #endif
+ 
++/* Default prefixes to attach to command names.  */
++
++#ifndef STANDARD_STARTFILE_PREFIX_1
++#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
++#endif
++#ifndef STANDARD_STARTFILE_PREFIX_2
++#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
++#endif
++
+ #endif  /* ! GCC_DEFAULTS_H */
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 570cdc00034..3fb64d453f1 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1464,13 +1464,6 @@ static const char *gcc_libexec_prefix;
+ 
+ /* Default prefixes to attach to command names.  */
+ 
+-#ifndef STANDARD_STARTFILE_PREFIX_1
+-#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
+-#endif
+-#ifndef STANDARD_STARTFILE_PREFIX_2
+-#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
+-#endif
+-
+ #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
+ #undef MD_EXEC_PREFIX
+ #undef MD_STARTFILE_PREFIX
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
new file mode 100644
index 0000000000..67b47f4ec0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
@@ -0,0 +1,54 @@
+From 57beef69396f6c187014b8e61cdc966218479d07 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 11:17:19 +0000
+Subject: [PATCH 24/39] gcc 4.8+ won't build with --disable-dependency-tracking
+
+since the *.Ppo files don't get created unless --enable-dependency-tracking is true.
+
+This patch ensures we only use those compiler options when its enabled.
+
+Upstream-Status: Submitted
+
+(Problem was already reported upstream, attached this patch there
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55930)
+
+RP
+2012/09/22
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libatomic/Makefile.am | 3 ++-
+ libatomic/Makefile.in | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
+index 803b292cce5..b47842eb590 100644
+--- a/libatomic/Makefile.am
++++ b/libatomic/Makefile.am
+@@ -101,7 +101,8 @@ PAT_S		= $(word 3,$(PAT_SPLIT))
+ IFUNC_DEF	= -DIFUNC_ALT=$(PAT_S)
+ IFUNC_OPT	= $(word $(PAT_S),$(IFUNC_OPTIONS))
+ 
+-M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_TRUE@M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_FALSE@M_DEPS		=
+ M_SIZE		= -DN=$(PAT_N)
+ M_IFUNC		= $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
+ M_FILE		= $(PAT_BASE)_n.c
+diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
+index c8f38be5835..4fab7cec3ea 100644
+--- a/libatomic/Makefile.in
++++ b/libatomic/Makefile.in
+@@ -335,7 +335,8 @@ PAT_N = $(word 2,$(PAT_SPLIT))
+ PAT_S = $(word 3,$(PAT_SPLIT))
+ IFUNC_DEF = -DIFUNC_ALT=$(PAT_S)
+ IFUNC_OPT = $(word $(PAT_S),$(IFUNC_OPTIONS))
+-M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_TRUE@M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
++@AMDEP_FALSE@M_DEPS =
+ M_SIZE = -DN=$(PAT_N)
+ M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
+ M_FILE = $(PAT_BASE)_n.c
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
new file mode 100644
index 0000000000..d8b35bbbee
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -0,0 +1,38 @@
+From fd96c9b35c592f1bdd32bc5ae669157473e44063 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Mar 2015 08:21:19 +0000
+Subject: [PATCH 25/39] Don't search host directory during "relink" if
+ $inst_prefix is provided
+
+http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
+
+Upstream-Status: Submitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ltmain.sh | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/ltmain.sh b/ltmain.sh
+index 52bdbdb5f9c..82bcec39f05 100644
+--- a/ltmain.sh
++++ b/ltmain.sh
+@@ -6004,12 +6004,13 @@ func_mode_link ()
+ 	      fi
+ 	    else
+ 	      # We cannot seem to hardcode it, guess we'll fake it.
++	      # Default if $libdir is not relative to the prefix:
+ 	      add_dir="-L$libdir"
+-	      # Try looking first in the location we're being installed to.
++
+ 	      if test -n "$inst_prefix_dir"; then
+ 		case $libdir in
+ 		  [\\/]*)
+-		    add_dir="$add_dir -L$inst_prefix_dir$libdir"
++		    add_dir="-L$inst_prefix_dir$libdir"
+ 		    ;;
+ 		esac
+ 	      fi
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
new file mode 100644
index 0000000000..d3ab5aa9ce
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -0,0 +1,29 @@
+From c2e400afe8c514357859fca88af4d3e1fcbfe2ff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:15:27 -0700
+Subject: [PATCH 26/39] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+ base_libdir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index bf1327e98cc..64436183bc8 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -21,7 +21,7 @@
+ #ifndef GCC_AARCH64_LINUX_H
+ #define GCC_AARCH64_LINUX_H
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+ #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
new file mode 100644
index 0000000000..9e5ce8a60b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0027-aarch64-Add-support-for-musl-ldso.patch
@@ -0,0 +1,28 @@
+From a2cc175769fd8255750eaecae64e3d1f9c38d48f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:18:39 -0700
+Subject: [PATCH 27/39] aarch64: Add support for musl ldso
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index 64436183bc8..ba156676026 100644
+--- a/gcc/config/aarch64/aarch64-linux.h
++++ b/gcc/config/aarch64/aarch64-linux.h
+@@ -24,7 +24,7 @@
+ #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
+ 
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
new file mode 100644
index 0000000000..2673f4e36b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -0,0 +1,54 @@
+From a8a8a02788ff98f253ce0b33adcb0e661d24b1e3 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 5 Jul 2015 20:25:18 -0700
+Subject: [PATCH 28/39] libcc1: fix libcc1's install path and rpath
+
+* Install libcc1.so and libcc1plugin.so into
+  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
+  had done to lto-plugin.
+* Fix bad RPATH iussue:
+  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sysroots/qemux86-64/usr/lib64/../lib64 in file
+ /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_64-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
+ [rpaths]
+
+Upstream-Status: Inappropriate [OE configuration]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libcc1/Makefile.am | 4 ++--
+ libcc1/Makefile.in | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
+index 6ecb66b4365..634cce3c2a9 100644
+--- a/libcc1/Makefile.am
++++ b/libcc1/Makefile.am
+@@ -37,8 +37,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+ 
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ 
+ if ENABLE_PLUGIN
+ plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
+diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
+index 47be10025ad..8d5481d87bd 100644
+--- a/libcc1/Makefile.in
++++ b/libcc1/Makefile.in
+@@ -303,8 +303,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ 
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
+ @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
+ shared_source = callbacks.cc callbacks.hh connection.cc connection.hh \
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
new file mode 100644
index 0000000000..727bb0da3b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0029-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -0,0 +1,213 @@
+From 3bb74495e45e0e798daae5556497e688b8fc4eef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:39:54 +0000
+Subject: [PATCH 29/39] handle sysroot support for nativesdk-gcc
+
+Being able to build a nativesdk gcc is useful, particularly in cases
+where the host compiler may be of an incompatible version (or a 32
+bit compiler is needed).
+
+Sadly, building nativesdk-gcc is not straight forward. We install
+nativesdk-gcc into a relocatable location and this means that its
+library locations can change. "Normal" sysroot support doesn't help
+in this case since the values of paths like "libdir" change, not just
+base root directory of the system.
+
+In order to handle this we do two things:
+
+a) Add %r into spec file markup which can be used for injected paths
+   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
+b) Add other paths which need relocation into a .gccrelocprefix section
+   which the relocation code will notice and adjust automatically.
+
+Upstream-Status: Inappropriate
+RP 2015/7/28
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++-------------
+ gcc/cppdefault.h |  3 ++-
+ gcc/gcc.c        | 20 +++++++++++++------
+ 3 files changed, 53 insertions(+), 20 deletions(-)
+
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index e2e187dedaf..2faba2b1d63 100644
+--- a/gcc/cppdefault.c
++++ b/gcc/cppdefault.c
+@@ -35,6 +35,30 @@
+ # undef CROSS_INCLUDE_DIR
+ #endif
+ 
++static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
++static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
++static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
++static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
++static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET;
++#ifdef LOCAL_INCLUDE_DIR
++static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = LOCAL_INCLUDE_DIR;
++#endif
++#ifdef PREFIX_INCLUDE_DIR
++static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX_INCLUDE_DIR;
++#endif
++#ifdef FIXED_INCLUDE_DIR
++static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = FIXED_INCLUDE_DIR;
++#endif
++#ifdef CROSS_INCLUDE_DIR
++static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = CROSS_INCLUDE_DIR;
++#endif
++#ifdef TOOL_INCLUDE_DIR
++static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = TOOL_INCLUDE_DIR;
++#endif
++#ifdef NATIVE_SYSTEM_HEADER_DIR
++static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = NATIVE_SYSTEM_HEADER_DIR;
++#endif
++
+ const struct default_include cpp_include_defaults[]
+ #ifdef INCLUDE_DEFAULTS
+ = INCLUDE_DEFAULTS;
+@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
+ = {
+ #ifdef GPLUSPLUS_INCLUDE_DIR
+     /* Pick up GNU C++ generic include files.  */
+-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
+     /* Pick up GNU C++ target-dependent include files.  */
+-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
+ #endif
+ #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
+     /* Pick up GNU C++ backward and deprecated include files.  */
+-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_DIR
+     /* This is the dir for gcc's private headers.  */
+-    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef GCC_INCLUDE_SUBDIR_TARGET
+     /* This is the dir for gcc's private headers under the specified sysroot.  */
+-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
+ #endif
+ #ifdef LOCAL_INCLUDE_DIR
+     /* /usr/local/include comes before the fixincluded header files.  */
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
+ #endif
+ #ifdef PREFIX_INCLUDE_DIR
+-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
+ #endif
+ #ifdef FIXED_INCLUDE_DIR
+     /* This is the dir for fixincludes.  */
+-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
+       /* A multilib suffix needs adding if different multilibs use
+ 	 different headers.  */
+ #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
+@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaults[]
+ #endif
+ #ifdef CROSS_INCLUDE_DIR
+     /* One place the target system's headers might be.  */
+-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
+ #endif
+ #ifdef TOOL_INCLUDE_DIR
+     /* Another place the target system's headers might be.  */
+-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
+ #endif
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+     /* /usr/include comes dead last.  */
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
+-    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
+ #endif
+     { 0, 0, 0, 0, 0, 0 }
+   };
+diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
+index 4a0186d1cf2..29e5d9da0dc 100644
+--- a/gcc/cppdefault.h
++++ b/gcc/cppdefault.h
+@@ -33,7 +33,8 @@
+ 
+ struct default_include
+ {
+-  const char *const fname;	/* The name of the directory.  */
++  const char *fname;     /* The name of the directory.  */
++
+   const char *const component;	/* The component containing the directory
+ 				   (see update_path in prefix.c) */
+   const char cplusplus;		/* Only look here if we're compiling C++.  */
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 3fb64d453f1..cd0c7fbe961 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -248,6 +248,8 @@ FILE *report_times_to_file = NULL;
+ #endif
+ static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
+ 
++static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
++
+ /* Nonzero means pass the updated target_system_root to the compiler.  */
+ 
+ static int target_system_root_changed;
+@@ -519,6 +521,7 @@ or with constant text in a single argument.
+  %G     process LIBGCC_SPEC as a spec.
+  %R     Output the concatenation of target_system_root and
+         target_sysroot_suffix.
++ %r     Output the base path target_relocatable_prefix
+  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
+  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
+  %C     process CPP_SPEC as a spec.
+@@ -1487,10 +1490,10 @@ static const char *gcc_libexec_prefix;
+    gcc_exec_prefix is set because, in that case, we know where the
+    compiler has been installed, and use paths relative to that
+    location instead.  */
+-static const char *const standard_exec_prefix = STANDARD_EXEC_PREFIX;
+-static const char *const standard_libexec_prefix = STANDARD_LIBEXEC_PREFIX;
+-static const char *const standard_bindir_prefix = STANDARD_BINDIR_PREFIX;
+-static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
++static char standard_exec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
++static char standard_libexec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_LIBEXEC_PREFIX;
++static char standard_bindir_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_BINDIR_PREFIX;
++static char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+ 
+ /* For native compilers, these are well-known paths containing
+    components that may be provided by the system.  For cross
+@@ -1498,9 +1501,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+ static const char *md_exec_prefix = MD_EXEC_PREFIX;
+ static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
+ static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
+-static const char *const standard_startfile_prefix_1
++static char standard_startfile_prefix_1[4096] __attribute__ ((section (".gccrelocprefix")))
+   = STANDARD_STARTFILE_PREFIX_1;
+-static const char *const standard_startfile_prefix_2
++static char standard_startfile_prefix_2[4096] __attribute__ ((section (".gccrelocprefix")))
+   = STANDARD_STARTFILE_PREFIX_2;
+ 
+ /* A relative path to be used in finding the location of tools
+@@ -5849,6 +5852,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+ 	      }
+ 	    break;
+ 
++          case 'r':
++              obstack_grow (&obstack, target_relocatable_prefix,
++		      strlen (target_relocatable_prefix));
++            break;
++
+ 	  case 'S':
+ 	    value = do_spec_1 (startfile_spec, 0, NULL);
+ 	    if (value != 0)
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
new file mode 100644
index 0000000000..33566dffa8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -0,0 +1,102 @@
+From f5cc8cd0c44092dc487106ade27e011c1f584ada Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:41:45 +0000
+Subject: [PATCH 30/39] Search target sysroot gcc version specific dirs with
+ multilib.
+
+We install the gcc libraries (such as crtbegin.p) into
+<sysroot><libdir>/<target-sys>/5.2.0/
+which is a default search path for GCC (aka multi_suffix in the
+code below). <target-sys> is 'machine' in gcc's terminology. We use
+these directories so that multiple gcc versions could in theory
+co-exist on target.
+
+We only want to build one gcc-cross-canadian per arch and have this work
+for all multilibs. <target-sys> can be handled by mapping the multilib
+<target-sys> to the one used by gcc-cross-canadian, e.g.
+mips64-polkmllib32-linux
+is symlinked to by mips64-poky-linux.
+
+The default gcc search path in the target sysroot for a "lib64" mutlilib
+is:
+
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+which means that the lib32 crtbegin.o will be found and the lib64 ones
+will not which leads to compiler failures.
+
+This patch injects a multilib version of that path first so the lib64
+binaries can be found first. With this change the search path becomes:
+
+<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/lib32/../lib64/
+<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
+<sysroot>/usr/lib32/../lib64/
+<sysroot>/lib32/
+<sysroot>/usr/lib32/
+
+Upstream-Status: Pending
+RP 2015/7/31
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
+ 1 file changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index cd0c7fbe961..f6f3aa077c8 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -2527,7 +2527,7 @@ for_each_path (const struct path_prefix *paths,
+       if (path == NULL)
+ 	{
+ 	  len = paths->max_len + extra_space + 1;
+-	  len += MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len);
++	  len += MAX ((suffix_len + multi_os_dir_len), multiarch_len);
+ 	  path = XNEWVEC (char, len);
+ 	}
+ 
+@@ -2539,6 +2539,33 @@ for_each_path (const struct path_prefix *paths,
+ 	  /* Look first in MACHINE/VERSION subdirectory.  */
+ 	  if (!skip_multi_dir)
+ 	    {
++	      if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir))
++	        {
++	          const char *this_multi;
++	          size_t this_multi_len;
++
++	          if (pl->os_multilib)
++		    {
++		      this_multi = multi_os_dir;
++		      this_multi_len = multi_os_dir_len;
++		    }
++	          else
++		    {
++		      this_multi = multi_dir;
++		      this_multi_len = multi_dir_len;
++		    }
++
++	          /* Look in multilib MACHINE/VERSION subdirectory first */
++	          if (this_multi_len)
++	            {
++		      memcpy (path + len, this_multi, this_multi_len + 1);
++	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
++	              ret = callback (path, callback_info);
++	                if (ret)
++		          break;
++	            }
++	        }
++
+ 	      memcpy (path + len, multi_suffix, suffix_len + 1);
+ 	      ret = callback (path, callback_info);
+ 	      if (ret)
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
new file mode 100644
index 0000000000..dabc005964
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -0,0 +1,137 @@
+From 93b4e1d3a0f8417118d1c48fcd1ce51996e1420b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:42:45 +0000
+Subject: [PATCH 31/39] Fix various _FOR_BUILD and related variables
+
+When doing a FOR_BUILD thing, you have to override CFLAGS with
+CFLAGS_FOR_BUILD. And if you use C++, you also have to override
+CXXFLAGS with CXXFLAGS_FOR_BUILD.
+Without this, when building for mingw, you end up trying to use
+the mingw headers for a host build.
+
+The same goes for other variables as well, such as CPPFLAGS,
+CPP, and GMPINC.
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.in      | 6 ++++++
+ Makefile.tpl     | 5 +++++
+ gcc/Makefile.in  | 2 +-
+ gcc/configure    | 2 +-
+ gcc/configure.ac | 2 +-
+ 5 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 1af45580086..8966453c32c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
+ 	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
+@@ -169,6 +170,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -186,6 +190,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+@@ -753,6 +758,7 @@ BASE_FLAGS_TO_PASS = \
+ 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
+ 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
+ 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
++	"CXXFLAGS_FOR_BUILD=$(CXXFLAGS_FOR_BUILD)" \
+ 	"EXPECT=$(EXPECT)" \
+ 	"FLEX=$(FLEX)" \
+ 	"INSTALL=$(INSTALL)" \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index abd2bc2fb89..5822b260404 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -154,6 +154,7 @@ BUILD_EXPORTS = \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GFORTRAN="$(GFORTRAN_FOR_BUILD)"; export GFORTRAN; \
+@@ -171,6 +172,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -188,6 +192,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 5ae693fb06c..02ee0aa72f4 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -801,7 +801,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+ BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
+ BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
+ BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+-		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
++		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR_BUILD)
+ 
+ # Actual name to use when installing a native compiler.
+ GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
+diff --git a/gcc/configure b/gcc/configure
+index cfcadc93a01..2f6b4f72ef3 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -11797,7 +11797,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 44b90478f55..9f8a51fc9bd 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1708,7 +1708,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
new file mode 100644
index 0000000000..6dd9d54234
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -0,0 +1,28 @@
+From 99f3e3b427996ac579d95e68440a0bd7af7ef0fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 10:26:10 -0800
+Subject: [PATCH 32/39] nios2: Define MUSL_DYNAMIC_LINKER
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/config/nios2/linux.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index 4729105626d..36181eb7b85 100644
+--- a/gcc/config/nios2/linux.h
++++ b/gcc/config/nios2/linux.h
+@@ -30,6 +30,7 @@
+ #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
++#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
+ 
+ #undef LINK_SPEC
+ #define LINK_SPEC LINK_SPEC_ENDIAN \
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
new file mode 100644
index 0000000000..05a6b0a1dc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -0,0 +1,87 @@
+From 84b55ab2f68710a583d4ec810ea8b3b68576f8aa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 18:10:54 -0700
+Subject: [PATCH 33/39] Add ssp_nonshared to link commandline for musl targets
+
+when -fstack-protector options are enabled we need to
+link with ssp_shared on musl since it does not provide
+the __stack_chk_fail_local() so essentially it provides
+libssp but not libssp_nonshared something like
+TARGET_LIBC_PROVIDES_SSP_BUT_NOT_SSP_NONSHARED
+ where-as for glibc the needed symbols
+are already present in libc_nonshared library therefore
+we do not need any library helper on glibc based systems
+but musl needs the libssp_noshared from gcc
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/linux.h          |  7 +++++++
+ gcc/config/rs6000/linux.h   | 10 ++++++++++
+ gcc/config/rs6000/linux64.h | 10 ++++++++++
+ 3 files changed, 27 insertions(+)
+
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 487b0c0923b..4769d089538 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -182,6 +182,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
+   }
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++
+ #endif
+ 
+ #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
+diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
+index 01b40c762f6..e7c5e92215c 100644
+--- a/gcc/config/rs6000/linux.h
++++ b/gcc/config/rs6000/linux.h
+@@ -92,6 +92,16 @@
+ 					 " -m elf32ppclinux")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #undef LINK_OS_LINUX_SPEC
+ #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
+   %{!static-pie: \
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 55695dadd91..60f1ee24985 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -473,6 +473,16 @@ extern int dot_symbols;
+ 					   " -m elf64ppc")
+ #endif
+ 
++/* link libssp_nonshared.a with musl */
++#if DEFAULT_LIBC == LIBC_MUSL
++#ifdef TARGET_LIBC_PROVIDES_SSP
++#undef LINK_SSP_SPEC
++#define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
++#endif
++#endif
++
+ #define LINK_OS_LINUX_SPEC32 LINK_OS_LINUX_EMUL32 " %{!shared: %{!static: \
+   %{!static-pie: \
+     %{rdynamic:-export-dynamic} \
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
new file mode 100644
index 0000000000..7a69ea2806
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
@@ -0,0 +1,125 @@
+From faf35e26740461fe1a1da5433d5a0169a663e3b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Apr 2016 20:03:28 +0000
+Subject: [PATCH 34/39] libgcc: Add knob to use ldbl-128 on ppc
+
+musl does not support ldbl 128 so we can not assume
+that linux as a whole supports ldbl-128 bits, instead
+act upon configure option passed to gcc and assume no
+on musl and yes otherwise if no option is passed since
+default behaviour is to assume ldbl128 it does not
+change the defaults
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ libgcc/Makefile.in           |  1 +
+ libgcc/config/rs6000/t-linux |  5 ++++-
+ libgcc/configure             | 18 ++++++++++++++++++
+ libgcc/configure.ac          | 12 ++++++++++++
+ 4 files changed, 35 insertions(+), 1 deletion(-)
+ mode change 100644 => 100755 libgcc/configure
+
+diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
+index dd8cee99fd3..b5f478af382 100644
+--- a/libgcc/Makefile.in
++++ b/libgcc/Makefile.in
+@@ -48,6 +48,7 @@ unwind_header = @unwind_header@
+ md_unwind_header = @md_unwind_header@
+ sfp_machine_header = @sfp_machine_header@
+ thread_header = @thread_header@
++with_ldbl128 = @with_ldbl128@
+ 
+ host_noncanonical = @host_noncanonical@
+ real_host_noncanonical = @real_host_noncanonical@
+diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-linux
+index 4f6d4c4a4d2..c50dd94a2da 100644
+--- a/libgcc/config/rs6000/t-linux
++++ b/libgcc/config/rs6000/t-linux
+@@ -1,3 +1,6 @@
+ SHLIB_MAPFILES += $(srcdir)/config/rs6000/libgcc-glibc.ver
+ 
+-HOST_LIBGCC2_CFLAGS += -mlong-double-128 -mno-minimal-toc
++ifeq ($(with_ldbl128),yes)
++HOST_LIBGCC2_CFLAGS += -mlong-double-128
++endif
++HOST_LIBGCC2_CFLAGS += -mno-minimal-toc
+diff --git a/libgcc/configure b/libgcc/configure
+old mode 100644
+new mode 100755
+index b2f3f870844..ed806587c17
+--- a/libgcc/configure
++++ b/libgcc/configure
+@@ -619,6 +619,7 @@ build_vendor
+ build_cpu
+ build
+ with_aix_soname
++with_ldbl128
+ enable_vtable_verify
+ enable_shared
+ libgcc_topdir
+@@ -668,6 +669,7 @@ with_cross_host
+ with_ld
+ enable_shared
+ enable_vtable_verify
++with_long_double_128
+ with_aix_soname
+ enable_version_specific_runtime_libs
+ with_slibdir
+@@ -1329,6 +1331,7 @@ Optional Packages:
+   --with-target-subdir=SUBDIR      Configuring in a subdirectory for target
+   --with-cross-host=HOST           Configuring with a cross compiler
+   --with-ld               arrange to use the specified ld (full pathname)
++  --with-long-double-128  use 128-bit long double by default
+   --with-aix-soname=aix|svr4|both
+                           shared library versioning (aka "SONAME") variant to
+                           provide on AIX
+@@ -2213,6 +2216,21 @@ fi
+ 
+ 
+ 
++# Check whether --with-long-double-128 was given.
++if test "${with_long_double_128+set}" = set; then :
++  withval=$with_long_double_128; with_ldbl128="$with_long_double_128"
++else
++  case "${host}" in
++ power*-*-musl*)
++   with_ldbl128="no";;
++ *) with_ldbl128="yes";;
++ esac
++
++fi
++
++
++
++
+ # Check whether --with-aix-soname was given.
+ if test "${with_aix_soname+set}" = set; then :
+   withval=$with_aix_soname; case "${host}:${enable_shared}" in
+diff --git a/libgcc/configure.ac b/libgcc/configure.ac
+index b59aa746afc..42220a263c5 100644
+--- a/libgcc/configure.ac
++++ b/libgcc/configure.ac
+@@ -78,6 +78,18 @@ AC_ARG_ENABLE(vtable-verify,
+ [enable_vtable_verify=no])
+ AC_SUBST(enable_vtable_verify)
+ 
++AC_ARG_WITH(long-double-128,
++[AS_HELP_STRING([--with-long-double-128],
++    [use 128-bit long double by default])],
++      with_ldbl128="$with_long_double_128",
++[case "${host}" in
++ power*-*-musl*)
++   with_ldbl128="no";;
++ *) with_ldbl128="yes";;
++ esac
++])
++AC_SUBST(with_ldbl128)
++
+ AC_ARG_WITH(aix-soname,
+ [AS_HELP_STRING([--with-aix-soname=aix|svr4|both],
+     [shared library versioning (aka "SONAME") variant to provide on AIX])],
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
new file mode 100644
index 0000000000..5e416e010d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -0,0 +1,29 @@
+From 775c7fafcbfebed2d4bd8a6a011f18f70f3b59d3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 May 2016 21:11:34 -0700
+Subject: [PATCH 35/39] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgcc/config/t-slibgcc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
+index 7e60b621a2d..ea22ede3361 100644
+--- a/libgcc/config/t-slibgcc
++++ b/libgcc/config/t-slibgcc
+@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
+ 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+ 
+ SHLIB_LINK = $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
+-	$(SHLIB_LDFLAGS) \
++	$(LDFLAGS) $(SHLIB_LDFLAGS) \
+ 	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
+ 	$(SHLIB_OBJS) $(SHLIB_LC) && \
+ 	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
new file mode 100644
index 0000000000..8def33a17d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -0,0 +1,86 @@
+From b7faeed60261d7b75f2db3823926de1650ef64bc Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Sat, 24 Oct 2015 20:09:53 +0000
+Subject: [PATCH 36/39] libgcc_s: Use alias for __cpu_indicator_init instead of
+ symver
+
+Adapter from
+
+https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
+
+This fix was debated but hasnt been applied gcc upstream since
+they expect musl to support '@' in symbol versioning which is
+a sun/gnu versioning extention. This patch however avoids the
+need for the '@' symbols at all
+
+libgcc/Changelog:
+
+2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
+	(__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
+
+	* config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SYMVER.
+
+gcc/Changelog:
+
+2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
+
+	* config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_init
+	call __cpu_indicator_init_local instead of __cpu_indicator_init.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/config/i386/i386.c       | 4 ++--
+ libgcc/config/i386/cpuinfo.c | 6 +++---
+ libgcc/config/i386/t-linux   | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
+index 6a2141e48db..455fccbdd50 100644
+--- a/gcc/config/i386/i386.c
++++ b/gcc/config/i386/i386.c
+@@ -36490,10 +36490,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+     {
+     case IX86_BUILTIN_CPU_INIT:
+       {
+-	/* Make it call __cpu_indicator_init in libgcc. */
++	/* Make it call __cpu_indicator_init_local in libgcc.a. */
+ 	tree call_expr, fndecl, type;
+         type = build_function_type_list (integer_type_node, NULL_TREE); 
+-	fndecl = build_fn_decl ("__cpu_indicator_init", type);
++	fndecl = build_fn_decl ("__cpu_indicator_init_local", type);
+ 	call_expr = build_call_expr (fndecl, 0); 
+ 	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
+       }
+diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
+index 86953db2743..e0476272810 100644
+--- a/libgcc/config/i386/cpuinfo.c
++++ b/libgcc/config/i386/cpuinfo.c
+@@ -482,7 +482,7 @@ __cpu_indicator_init (void)
+   return 0;
+ }
+ 
+-#if defined SHARED && defined USE_ELF_SYMVER
+-__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8.0");
+-__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
++#ifndef SHARED
++int __cpu_indicator_init_local (void)
++  __attribute__ ((weak, alias ("__cpu_indicator_init")));
+ #endif
+diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
+index 8506a635790..564296f788e 100644
+--- a/libgcc/config/i386/t-linux
++++ b/libgcc/config/i386/t-linux
+@@ -3,5 +3,5 @@
+ # t-slibgcc-elf-ver and t-linux
+ SHLIB_MAPFILES = libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc.ver
+ 
+-HOST_LIBGCC2_CFLAGS += -mlong-double-80 -DUSE_ELF_SYMVER $(CET_FLAGS)
++HOST_LIBGCC2_CFLAGS += -mlong-double-80 $(CET_FLAGS)
+ CRTSTUFF_T_CFLAGS += $(CET_FLAGS)
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
new file mode 100644
index 0000000000..f8a7f41ab1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0037-sync-gcc-stddef.h-with-musl.patch
@@ -0,0 +1,91 @@
+From 602abaab15ffb60bf1797187a71b485042c56360 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Feb 2017 12:56:00 -0800
+Subject: [PATCH 37/39] sync gcc stddef.h with musl
+
+musl defines ptrdiff_t size_t and wchar_t
+so dont define them here if musl is definining them
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gcc/ginclude/stddef.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
+index 31b96a7e5e1..438a3ce7c56 100644
+--- a/gcc/ginclude/stddef.h
++++ b/gcc/ginclude/stddef.h
+@@ -134,6 +134,7 @@ _TYPE_wchar_t;
+ #ifndef ___int_ptrdiff_t_h
+ #ifndef _GCC_PTRDIFF_T
+ #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
++#ifndef __DEFINED_ptrdiff_t /* musl */
+ #define _PTRDIFF_T
+ #define _T_PTRDIFF_
+ #define _T_PTRDIFF
+@@ -143,10 +144,12 @@ _TYPE_wchar_t;
+ #define ___int_ptrdiff_t_h
+ #define _GCC_PTRDIFF_T
+ #define _PTRDIFF_T_DECLARED
++#define __DEFINED_ptrdiff_t /* musl */
+ #ifndef __PTRDIFF_TYPE__
+ #define __PTRDIFF_TYPE__ long int
+ #endif
+ typedef __PTRDIFF_TYPE__ ptrdiff_t;
++#endif /* __DEFINED_ptrdiff_t */
+ #endif /* _PTRDIFF_T_DECLARED */
+ #endif /* _GCC_PTRDIFF_T */
+ #endif /* ___int_ptrdiff_t_h */
+@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #ifndef _GCC_SIZE_T
+ #ifndef _SIZET_
+ #ifndef __size_t
++#ifndef __DEFINED_size_t /* musl */
+ #define __size_t__	/* BeOS */
+ #define __SIZE_T__	/* Cray Unicos/Mk */
+ #define _SIZE_T
+@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
+ #define ___int_size_t_h
+ #define _GCC_SIZE_T
+ #define _SIZET_
++#define __DEFINED_size_t /* musl */
+ #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
+   || defined(__DragonFly__) \
+   || defined(__FreeBSD_kernel__)
+@@ -235,6 +240,7 @@ typedef long ssize_t;
+ #endif /* _SIZE_T */
+ #endif /* __SIZE_T__ */
+ #endif /* __size_t__ */
++#endif /* __DEFINED_size_t */
+ #undef	__need_size_t
+ #endif /* _STDDEF_H or __need_size_t.  */
+ 
+@@ -264,6 +270,7 @@ typedef long ssize_t;
+ #ifndef ___int_wchar_t_h
+ #ifndef __INT_WCHAR_T_H
+ #ifndef _GCC_WCHAR_T
++#ifndef __DEFINED_wchar_t /* musl */
+ #define __wchar_t__	/* BeOS */
+ #define __WCHAR_T__	/* Cray Unicos/Mk */
+ #define _WCHAR_T
+@@ -279,6 +286,7 @@ typedef long ssize_t;
+ #define __INT_WCHAR_T_H
+ #define _GCC_WCHAR_T
+ #define _WCHAR_T_DECLARED
++#define __DEFINED_wchar_t /* musl */
+ 
+ /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
+    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
+@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
+ #endif
+ #endif /* __WCHAR_T__ */
+ #endif /* __wchar_t__ */
++#endif /* __DEFINED_wchar_t musl */
+ #undef	__need_wchar_t
+ #endif /* _STDDEF_H or __need_wchar_t.  */
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
new file mode 100644
index 0000000000..224d2ae6d3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -0,0 +1,60 @@
+From 00694849632dee23741925c6104df134f6bff747 Mon Sep 17 00:00:00 2001
+From: Juro Bystricky <juro.bystricky@intel.com>
+Date: Mon, 19 Mar 2018 22:31:20 -0700
+Subject: [PATCH 38/39] fix segmentation fault in precompiled header generation
+
+Prevent a segmentation fault which occurs when using incorrect
+structure trying to access name of some named operators, such as
+CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
+those cases, as is may not be initialized at all.
+
+[YOCTO #11738]
+
+Upstream-Status: Pending
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcpp/lex.c | 26 +++++++++++++++++++++-----
+ 1 file changed, 21 insertions(+), 5 deletions(-)
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index 37c365a3560..63480048db6 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -3279,11 +3279,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
+     spell_ident:
+     case SPELL_IDENT:
+       if (forstring)
+-	{
+-	  memcpy (buffer, NODE_NAME (token->val.node.spelling),
+-		  NODE_LEN (token->val.node.spelling));
+-	  buffer += NODE_LEN (token->val.node.spelling);
+-	}
++        {
++          if (token->type == CPP_NAME)
++            {
++              memcpy (buffer, NODE_NAME (token->val.node.spelling),
++                    NODE_LEN (token->val.node.spelling));
++              buffer += NODE_LEN (token->val.node.spelling);
++              break;
++            }
++          /* NAMED_OP, cannot use node.spelling */
++          if (token->flags & NAMED_OP)
++            {
++              const char *str = cpp_named_operator2name (token->type);
++              if (str)
++                {
++                  size_t len = strlen(str);
++                  memcpy(buffer, str, len);
++                  buffer += len;
++                }
++              break;
++            }
++        }
+       else
+ 	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
+       break;
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
new file mode 100644
index 0000000000..f35163099c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0039-Fix-for-testsuite-failure.patch
@@ -0,0 +1,258 @@
+From d151a62c252749643c850a08d1335321e5b75d42 Mon Sep 17 00:00:00 2001
+From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
+Date: Wed, 6 Dec 2017 22:52:26 -0800
+Subject: [PATCH 39/39] Fix for testsuite failure
+
+2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
+
+	* gcc.dg/pr56275.c: If SSE is disabled, ensure that
+	"-mfpmath" is not set to use SSE. Set "-mfpmath=387".
+	* gcc.dg/pr68306.c: Likewise
+	* gcc.dg/pr68306-2.c: Likewise
+	* gcc.dg/pr68306-3.c: Likewise
+	* gcc.dg/pr69634.c: Likewise
+	* gcc.target/i386/amd64-abi-1.c: Likewise
+	* gcc.target/i386/funcspec-6.c: Likewise
+	* gcc.target/i386/interrupt-387-err-1.c: Likewise
+	* gcc.target/i386/isa-14.c: Likewise
+	* gcc.target/i386/pr44948-2b.c: Likewise
+	* gcc.target/i386/pr53425-1.c: Likewise
+	* gcc.target/i386/pr53425-2.c: Likewise
+	* gcc.target/i386/pr55247.c: Likewise
+	* gcc.target/i386/pr59644.c: Likewise
+	* gcc.target/i386/pr62120.c: Likewise
+	* gcc.target/i386/pr70467-1.c: Likewise
+	* gcc.target/i386/warn-vect-op-1.c: Likewise
+
+If -Wall, -Werror are used during compilation various test cases fail
+to compile.
+
+If SSE is disabled, be sure to -mfpmath=387 to resolve this.
+
+This patch removes the changes to Changelog from the original patch.
+This will help us avoid conflicts.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ gcc/testsuite/gcc.dg/pr56275.c                      | 2 +-
+ gcc/testsuite/gcc.dg/pr68306-2.c                    | 2 +-
+ gcc/testsuite/gcc.dg/pr68306-3.c                    | 2 +-
+ gcc/testsuite/gcc.dg/pr68306.c                      | 2 +-
+ gcc/testsuite/gcc.dg/pr69634.c                      | 2 +-
+ gcc/testsuite/gcc.target/i386/amd64-abi-1.c         | 2 +-
+ gcc/testsuite/gcc.target/i386/funcspec-6.c          | 1 +
+ gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c | 2 +-
+ gcc/testsuite/gcc.target/i386/isa-14.c              | 2 +-
+ gcc/testsuite/gcc.target/i386/pr44948-2b.c          | 2 +-
+ gcc/testsuite/gcc.target/i386/pr53425-1.c           | 2 +-
+ gcc/testsuite/gcc.target/i386/pr53425-2.c           | 2 +-
+ gcc/testsuite/gcc.target/i386/pr55247.c             | 2 +-
+ gcc/testsuite/gcc.target/i386/pr59644.c             | 2 +-
+ gcc/testsuite/gcc.target/i386/pr62120.c             | 2 +-
+ gcc/testsuite/gcc.target/i386/pr70467-1.c           | 2 +-
+ gcc/testsuite/gcc.target/i386/warn-vect-op-1.c      | 2 +-
+ 17 files changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/gcc/testsuite/gcc.dg/pr56275.c b/gcc/testsuite/gcc.dg/pr56275.c
+index b901bb2b199..a4f6c95e1a1 100644
+--- a/gcc/testsuite/gcc.dg/pr56275.c
++++ b/gcc/testsuite/gcc.dg/pr56275.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O2" } */
+-/* { dg-additional-options "-mno-sse" { target { i?86-*-* x86_64-*-* } } } */
++/* { dg-additional-options "-mno-sse -mfpmath=387" { target { i?86-*-* x86_64-*-* } } } */
+ 
+ typedef long long v2tw __attribute__ ((vector_size (2 * sizeof (long long))));
+ 
+diff --git a/gcc/testsuite/gcc.dg/pr68306-2.c b/gcc/testsuite/gcc.dg/pr68306-2.c
+index 4672ebe7987..2a368c484b6 100644
+--- a/gcc/testsuite/gcc.dg/pr68306-2.c
++++ b/gcc/testsuite/gcc.dg/pr68306-2.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O3" } */
+-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ 
+ struct {
+     int tz_minuteswest;
+diff --git a/gcc/testsuite/gcc.dg/pr68306-3.c b/gcc/testsuite/gcc.dg/pr68306-3.c
+index f5a8c102cf8..df3390c64c2 100644
+--- a/gcc/testsuite/gcc.dg/pr68306-3.c
++++ b/gcc/testsuite/gcc.dg/pr68306-3.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O3" } */
+-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ /* { dg-additional-options "-mno-altivec -mno-vsx" { target powerpc*-*-* } } */
+ 
+ extern void fn2();
+diff --git a/gcc/testsuite/gcc.dg/pr68306.c b/gcc/testsuite/gcc.dg/pr68306.c
+index 54e5b40f221..0813389e2c1 100644
+--- a/gcc/testsuite/gcc.dg/pr68306.c
++++ b/gcc/testsuite/gcc.dg/pr68306.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O3" } */
+-/* { dg-additional-options "-mno-sse -mno-mmx" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mno-mmx -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ 
+ enum powerpc_pmc_type { PPC_PMC_IBM };
+ struct {
+diff --git a/gcc/testsuite/gcc.dg/pr69634.c b/gcc/testsuite/gcc.dg/pr69634.c
+index 60a56149463..bcc23f9ccd6 100644
+--- a/gcc/testsuite/gcc.dg/pr69634.c
++++ b/gcc/testsuite/gcc.dg/pr69634.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-options "-O2 -fno-dce -fschedule-insns -fno-tree-vrp -fcompare-debug -Wno-psabi" } */
+-/* { dg-additional-options "-mno-sse" { target i?86-*-* x86_64-*-* } } */
++/* { dg-additional-options "-mno-sse -mfpmath=387" { target i?86-*-* x86_64-*-* } } */
+ /* { dg-require-effective-target scheduling } */
+ 
+ typedef unsigned short u16;
+diff --git a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
+index 69fde57bf06..7f1f1c03edf 100644
+--- a/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
++++ b/gcc/testsuite/gcc.target/i386/amd64-abi-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! ia32 } } } */
+-/* { dg-options "-mno-sse" } */
++/* { dg-options "-mno-sse -mfpmath=387" } */
+ /* { dg-additional-options "-mabi=sysv" { target *-*-mingw* } } */
+ 
+ double foo(void) { return 0; }	/* { dg-error "SSE disabled" } */
+diff --git a/gcc/testsuite/gcc.target/i386/funcspec-6.c b/gcc/testsuite/gcc.target/i386/funcspec-6.c
+index ea896b7ebfd..bf15569b826 100644
+--- a/gcc/testsuite/gcc.target/i386/funcspec-6.c
++++ b/gcc/testsuite/gcc.target/i386/funcspec-6.c
+@@ -1,6 +1,7 @@
+ /* Test whether all of the 64-bit function specific options are accepted
+    without error.  */
+ /* { dg-do compile { target { ! ia32 } } } */
++/* { dg-additional-options "-mfpmath=387" } */
+ 
+ #include "funcspec-56.inc"
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
+index 3fbdc881dda..6b4d9d1252a 100644
+--- a/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
++++ b/gcc/testsuite/gcc.target/i386/interrupt-387-err-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387" } */
++/* { dg-options "-O2 -mgeneral-regs-only -mno-cld -mno-iamcu -m80387 -mfpmath=387" } */
+ 
+ typedef unsigned int uword_t __attribute__ ((mode (__word__)));
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/isa-14.c b/gcc/testsuite/gcc.target/i386/isa-14.c
+index 5d49e6e77fe..1de2db92bdd 100644
+--- a/gcc/testsuite/gcc.target/i386/isa-14.c
++++ b/gcc/testsuite/gcc.target/i386/isa-14.c
+@@ -1,5 +1,5 @@
+ /* { dg-do run } */
+-/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse" } */
++/* { dg-options "-march=x86-64 -msse4a -mfma4 -mno-sse -mfpmath=387" } */
+ 
+ extern void abort (void);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/pr44948-2b.c b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
+index fa1769b62fb..f79fb12726f 100644
+--- a/gcc/testsuite/gcc.target/i386/pr44948-2b.c
++++ b/gcc/testsuite/gcc.target/i386/pr44948-2b.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic" } */
++/* { dg-options "-O -mno-sse -Wno-psabi -mtune=generic -mfpmath=387" } */
+ 
+ struct A
+ { 
+diff --git a/gcc/testsuite/gcc.target/i386/pr53425-1.c b/gcc/testsuite/gcc.target/i386/pr53425-1.c
+index 2e89ff7d81d..6339bf6b736 100644
+--- a/gcc/testsuite/gcc.target/i386/pr53425-1.c
++++ b/gcc/testsuite/gcc.target/i386/pr53425-1.c
+@@ -1,6 +1,6 @@
+ /* PR target/53425 */
+ /* { dg-do compile { target { ! ia32 } } } */
+-/* { dg-options "-O2 -mno-sse" } */
++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
+ /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
+ 
+ typedef double __v2df __attribute__ ((__vector_size__ (16)));
+diff --git a/gcc/testsuite/gcc.target/i386/pr53425-2.c b/gcc/testsuite/gcc.target/i386/pr53425-2.c
+index 61f6283dbe9..2c5a55f0ac3 100644
+--- a/gcc/testsuite/gcc.target/i386/pr53425-2.c
++++ b/gcc/testsuite/gcc.target/i386/pr53425-2.c
+@@ -1,6 +1,6 @@
+ /* PR target/53425 */
+ /* { dg-do compile { target { ! ia32 } } } */
+-/* { dg-options "-O2 -mno-sse" } */
++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
+ /* { dg-skip-if "no SSE vector" { x86_64-*-mingw* } } */
+ 
+ typedef float __v2sf __attribute__ ((__vector_size__ (8)));
+diff --git a/gcc/testsuite/gcc.target/i386/pr55247.c b/gcc/testsuite/gcc.target/i386/pr55247.c
+index 23366d0909d..9810e3abb76 100644
+--- a/gcc/testsuite/gcc.target/i386/pr55247.c
++++ b/gcc/testsuite/gcc.target/i386/pr55247.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile { target { ! ia32 } } } */
+ /* { dg-require-effective-target maybe_x32 } */
+-/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long" } */
++/* { dg-options "-O2 -mno-sse -mno-mmx -mx32 -maddress-mode=long -mfpmath=387" } */
+ 
+ typedef unsigned int uint32_t;
+ typedef uint32_t Elf32_Word;
+diff --git a/gcc/testsuite/gcc.target/i386/pr59644.c b/gcc/testsuite/gcc.target/i386/pr59644.c
+index 96006b3e338..4287e4538bf 100644
+--- a/gcc/testsuite/gcc.target/i386/pr59644.c
++++ b/gcc/testsuite/gcc.target/i386/pr59644.c
+@@ -1,6 +1,6 @@
+ /* PR target/59644 */
+ /* { dg-do run { target lp64 } } */
+-/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=3 -maccumulate-outgoing-args -mno-red-zone" } */
++/* { dg-options "-O2 -ffreestanding -mno-sse -mpreferred-stack-boundary=3 -maccumulate-outgoing-args -mno-red-zone -mfpmath=387" } */
+ 
+ /* This test uses __builtin_trap () instead of e.g. abort,
+    because due to -mpreferred-stack-boundary=3 it should not call
+diff --git a/gcc/testsuite/gcc.target/i386/pr62120.c b/gcc/testsuite/gcc.target/i386/pr62120.c
+index bfb8c4703eb..ed04cf181f3 100644
+--- a/gcc/testsuite/gcc.target/i386/pr62120.c
++++ b/gcc/testsuite/gcc.target/i386/pr62120.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-mno-sse" } */
++/* { dg-options "-mno-sse -mfpmath=387" } */
+ 
+ void foo ()
+ {
+diff --git a/gcc/testsuite/gcc.target/i386/pr70467-1.c b/gcc/testsuite/gcc.target/i386/pr70467-1.c
+index 4e112c88d07..bcfb396a68d 100644
+--- a/gcc/testsuite/gcc.target/i386/pr70467-1.c
++++ b/gcc/testsuite/gcc.target/i386/pr70467-1.c
+@@ -1,6 +1,6 @@
+ /* PR rtl-optimization/70467 */
+ /* { dg-do compile } */
+-/* { dg-options "-O2 -mno-sse" } */
++/* { dg-options "-O2 -mno-sse -mfpmath=387" } */
+ 
+ void foo (unsigned long long *);
+ 
+diff --git a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
+index 6cda1534311..26e37f5b8ba 100644
+--- a/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
++++ b/gcc/testsuite/gcc.target/i386/warn-vect-op-1.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile { target { ! ia32 } } }  */
+-/* { dg-options "-mno-sse -Wvector-operation-performance" }  */
++/* { dg-options "-mno-sse -Wvector-operation-performance -mfpmath=387" }  */
+ #define vector(elcount, type)  \
+ __attribute__((vector_size((elcount)*sizeof(type)))) type
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
new file mode 100644
index 0000000000..bf53c5cd78
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_8.1.bb
@@ -0,0 +1,5 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-cross-canadian.inc
+
+
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
new file mode 100644
index 0000000000..4c73e5ce61
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial_8.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-cross_${PV}.bb
+require gcc-cross-initial.inc
diff --git a/meta/recipes-devtools/gcc/gcc-cross_8.1.bb b/meta/recipes-devtools/gcc/gcc-cross_8.1.bb
new file mode 100644
index 0000000000..b43cca0c52
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross_8.1.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-cross.inc
+
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
new file mode 100644
index 0000000000..fd90e1140f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_8.1.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
+require gcc-crosssdk-initial.inc
+
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
new file mode 100644
index 0000000000..40a6c4feff
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-cross_${PV}.bb
+require gcc-crosssdk.inc
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
new file mode 100644
index 0000000000..8f31e7792e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-runtime_8.1.bb
@@ -0,0 +1,7 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-runtime.inc
+
+FILES_libgomp-dev += "\
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
+"
+
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
new file mode 100644
index 0000000000..601f666023
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers_8.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-sanitizers.inc
diff --git a/meta/recipes-devtools/gcc/gcc-source_8.1.bb b/meta/recipes-devtools/gcc/gcc-source_8.1.bb
new file mode 100644
index 0000000000..b890fa33ea
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-source_8.1.bb
@@ -0,0 +1,4 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-source.inc
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/gcc/gcc_8.1.bb b/meta/recipes-devtools/gcc/gcc_8.1.bb
new file mode 100644
index 0000000000..ab208e7026
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc_8.1.bb
@@ -0,0 +1,10 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-target.inc
+
+# Building with thumb enabled on armv4t armv5t fails with
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_8.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
new file mode 100644
index 0000000000..19f253fce8
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc-initial_8.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgcc-initial.inc
diff --git a/meta/recipes-devtools/gcc/libgcc_8.1.bb b/meta/recipes-devtools/gcc/libgcc_8.1.bb
new file mode 100644
index 0000000000..a5152f28e9
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc_8.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgcc.inc
diff --git a/meta/recipes-devtools/gcc/libgfortran_8.1.bb b/meta/recipes-devtools/gcc/libgfortran_8.1.bb
new file mode 100644
index 0000000000..71dd8b4bdc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgfortran_8.1.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgfortran.inc
+
-- 
2.17.0


