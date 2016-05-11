Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AAC806FF78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:35:56 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so4253160pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H08WJrx0DElp5l4+1uvtTkaO0D+NERVOVpJ7DIk0J8s=;
	b=wDVIpxkqtGXycY1jOQ8Q4bdSQPGs+EU2QC+x27wmmDLHIowCX4sVyRYrkhj9wQ0pAl
	wWoXEKi9b8Pbsb9vro4ROnBeFQ+iqeksILkhDdc6J+2jRjuwMu0fcDDE4IzN5oJMpV7k
	PdHD01vZVKPuSVE+W/3TsWLT0pANF3NQMKHXI6SbV5MtQodaOqK3dSc9A6tLVfEDt3fk
	Yz2PuCGPO3FDB5ddWe6GCgNVHkT9XleuR6lGywVcMeU0CrbB++6+uCglh+UAJbJ0HwuS
	9RagPQgO94IqAzvgno7wj5o3mlrHoXs59bcC6v7XTd7lIkFKmS8VeVYOv775Ie82dSbt
	fRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H08WJrx0DElp5l4+1uvtTkaO0D+NERVOVpJ7DIk0J8s=;
	b=lyG+KLQG71TNu+GtEUkC6fcEsm4VLebZ2V0tkgha8EfP4dRT1VTrSWCcH6VLLl+VKq
	MuOiZKII0grZwSZ1h7MD8JHqVDreg6veU0rclAB449pEDX9DdBv6Vnw0DIygGC5UMO+n
	8+hRhzYlnuxo6LPrLkj97aUycoB4ibLow+ijZGsJl2L2mTm7XPK+78BYwPRzWtgXRQzs
	LtEy03FHaAO0i846vIn3v8GbSEfeAfU8Pd2J/mtklGblKlU5/izrLNfTSzUx3u414CGe
	sItPdH3dTUCgOyKjTwtxjDx7JPHQeyScXv9ldGzexSeFChHsSj9Fn9WaYLX4mP7rWxlZ
	x92Q==
X-Gm-Message-State: AOPr4FWCt722HbyAgZa/b6sN4i10aFPwJyVOQGnW1zmdO+e14AXUUXIbOEU8iNMDtTyWCA==
X-Received: by 10.98.88.4 with SMTP id m4mr6675412pfb.71.1462988156935;
	Wed, 11 May 2016 10:35:56 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.35.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:35:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:04 -0700
Message-Id: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 01/42] gcc: Add gcc6 recipes
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
X-List-Received-Date: Wed, 11 May 2016 17:35:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Symlink-c-header-in-target_triplet-for-S.patch |   49 +
 meta/recipes-devtools/gcc/gcc-6.1.inc              |  131 +
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
 .../gcc/gcc-6.1/0002-uclibc-conf.patch             |   53 +
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
 .../gcc/gcc-6.1/0004-uclibc-locale.patch           | 2862 ++++++++++++++++++++
 .../gcc/gcc-6.1/0005-uclibc-locale-no__x.patch     |  257 ++
 .../gcc/gcc-6.1/0006-uclibc-locale-wchar_fix.patch |   68 +
 .../gcc/gcc-6.1/0007-uclibc-locale-update.patch    |  542 ++++
 .../gcc/gcc-6.1/0008-missing-execinfo_h.patch      |   28 +
 .../gcc/gcc-6.1/0009-c99-snprintf.patch            |   28 +
 .../0010-gcc-poison-system-directories.patch       |  192 ++
 .../gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch   |   39 +
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
 .../gcc/gcc-6.1/0013-64-bit-multilib-hack.patch    |   85 +
 .../gcc/gcc-6.1/0014-optional-libstdc.patch        |  125 +
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
 .../gcc/gcc-6.1/0016-COLLECT_GCC_OPTIONS.patch     |   38 +
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 +
 .../gcc-6.1/0018-fortran-cross-compile-hack.patch  |   46 +
 .../gcc/gcc-6.1/0019-cpp-honor-sysroot.patch       |   54 +
 .../gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch   |   57 +
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  234 ++
 ...0022-gcc-Fix-argument-list-too-long-error.patch |   40 +
 .../gcc/gcc-6.1/0023-Disable-sdt.patch             |  113 +
 .../gcc/gcc-6.1/0024-libtool.patch                 |   42 +
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
 ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
 ...-libdir-from-.la-which-usually-points-to-.patch |   31 +
 .../gcc/gcc-6.1/0028-export-CPP.patch              |   53 +
 ...AltiVec-generation-on-powepc-linux-target.patch |   56 +
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   42 +
 ...Ensure-target-gcc-headers-can-be-included.patch |   98 +
 ...-t-build-with-disable-dependency-tracking.patch |   54 +
 ...h-host-directory-during-relink-if-inst_pr.patch |   38 +
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   29 +
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |   28 +
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   54 +
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |  213 ++
 ...et-sysroot-gcc-version-specific-dirs-with.patch |  102 +
 ...-various-_FOR_BUILD-and-related-variables.patch |  137 +
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   28 +
 .../gcc/gcc-6.1/0041-ssp_nonshared.patch           |   28 +
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |  292 ++
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   43 +
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |   54 +
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  125 +
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   29 +
 .../recipes-devtools/gcc/gcc-cross-canadian_6.1.bb |    5 +
 meta/recipes-devtools/gcc/gcc-cross-initial_6.1.bb |    2 +
 meta/recipes-devtools/gcc/gcc-cross_6.1.bb         |    3 +
 .../gcc/gcc-crosssdk-initial_6.1.bb                |    3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_6.1.bb      |    2 +
 meta/recipes-devtools/gcc/gcc-runtime_6.1.bb       |    7 +
 meta/recipes-devtools/gcc/gcc-sanitizers_6.1.bb    |    2 +
 meta/recipes-devtools/gcc/gcc-source_6.1.bb        |    4 +
 meta/recipes-devtools/gcc/gcc_6.1.bb               |   15 +
 meta/recipes-devtools/gcc/libgcc-initial_6.1.bb    |    2 +
 meta/recipes-devtools/gcc/libgcc_6.1.bb            |    2 +
 meta/recipes-devtools/gcc/libgfortran_6.1.bb       |    3 +
 60 files changed, 7169 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0002-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0004-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0005-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0006-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0007-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0008-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0009-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0010-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0013-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0014-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0016-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0018-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0019-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0022-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0023-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0024-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0028-export-CPP.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0031-Ensure-target-gcc-headers-can-be-included.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0035-aarch64-Add-support-for-musl-ldso.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0037-handle-sysroot-support-for-nativesdk-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0041-ssp_nonshared.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.1/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-source_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_6.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgfortran_6.1.bb

diff --git a/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch b/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
new file mode 100644
index 0000000..c598a0d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/0001-gcc-runtime-Symlink-c-header-in-target_triplet-for-S.patch
@@ -0,0 +1,49 @@
+From 0ef3d75514ee5a74b7c04ea36423cff97843fbb8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 10 May 2016 01:07:24 -0700
+Subject: [PATCH] gcc-runtime: Symlink c++ header in target_triplet for SDK use
+
+We build SDKs such that gcc-cross-candian is built for only one
+target *-*-linux and then use -muclibc or -mmusl to let it compile
+code for other libc variants. This works fine when libc = glibc
+however it does not work for c++ programs when libc != glibc since
+there are c++ headers installed under ${includedir}/c++/${BINV}/${TARGET_SYS}
+which is fine when gcc-runtime and gcc-cross-candian uses same --target options
+gxx includedir searches in right triplet, but it fails with musl/uclibc
+since gcc will look for glibc based triplet but gcc-runtime will install
+them under musl/uclibc triplet.
+
+This patch symlinks the musl/uclibc triplet to glibc triplet when libc != glibc
+
+This fixes SDKs for musl/uclibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meta/recipes-devtools/gcc/gcc-runtime.inc | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
+index 8639c1c..8e4d5eb 100644
+--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
++++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
+@@ -70,13 +70,15 @@ do_install () {
+ 	if [ -d ${D}${infodir} ]; then
+ 		rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
+ 	fi
++}
++
++do_install_append_class-target () {
+ 	if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
+ 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
+ 	fi
+-	if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
++	if [ "${TARGET_OS}" = "linux-gnuspe" -o "${TCLIBC}" != "glibc" ]; then
+ 		ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
+ 	fi
+-	chown -R root:root ${D}
+ }
+ 
+ INHIBIT_DEFAULT_DEPS = "1"
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1.inc b/meta/recipes-devtools/gcc/gcc-6.1.inc
new file mode 100644
index 0000000..1a00f3f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1.inc
@@ -0,0 +1,131 @@
+require gcc-common.inc
+
+# Third digit in PV should be incremented after a minor release
+
+PV = "6.1.1"
+
+#SNAP = "5-20150405"
+
+# BINV should be incremented to a revision after a minor gcc release
+
+BINV = "6.1.1"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.1:${FILE_DIRNAME}/gcc-6.1/backport:"
+
+DEPENDS =+ "mpfr gmp libmpc zlib"
+NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
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
+SRCREV = "bd9a826d5448db11d29d2ec5884e7e679066f140"
+
+#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
+BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
+
+SRC_URI = "\
+           ${BASEURI} \
+           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
+           file://0002-uclibc-conf.patch \
+           file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
+           file://0004-uclibc-locale.patch \
+           file://0005-uclibc-locale-no__x.patch \
+           file://0006-uclibc-locale-wchar_fix.patch \
+           file://0007-uclibc-locale-update.patch \
+           file://0008-missing-execinfo_h.patch \
+           file://0009-c99-snprintf.patch \
+           file://0010-gcc-poison-system-directories.patch \
+           file://0011-gcc-poison-dir-extend.patch \
+           file://0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+           file://0013-64-bit-multilib-hack.patch \
+           file://0014-optional-libstdc.patch \
+           file://0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
+           file://0016-COLLECT_GCC_OPTIONS.patch \
+           file://0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+           file://0018-fortran-cross-compile-hack.patch \
+           file://0019-cpp-honor-sysroot.patch \
+           file://0020-MIPS64-Default-to-N64-ABI.patch \
+           file://0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+           file://0022-gcc-Fix-argument-list-too-long-error.patch \
+           file://0023-Disable-sdt.patch \
+           file://0024-libtool.patch \
+           file://0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+           file://0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+           file://0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
+           file://0028-export-CPP.patch \
+           file://0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
+           file://0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch \
+           file://0031-Ensure-target-gcc-headers-can-be-included.patch \
+           file://0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
+           file://0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+           file://0035-aarch64-Add-support-for-musl-ldso.patch \
+           file://0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0037-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0039-Fix-various-_FOR_BUILD-and-related-variables.patch \
+           file://0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0041-ssp_nonshared.patch \
+           file://0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch \
+           file://0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
+           file://0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
+           file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
+           file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           ${BACKPORTS} \
+"
+
+BACKPORTS = ""
+
+#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
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
+    --with-linker-hash-style=${LINKER_HASH_STYLE} \
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
+EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
+
+EXTRA_OECONF_PATHS = "\
+    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
+    --with-sysroot=/not/exist \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..415f091
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -0,0 +1,42 @@
+From 92ed30da16b7487b334f739be177eb39885ab772 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:37:11 +0400
+Subject: [PATCH 01/46] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
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
+index 35f231e..bfadc33 100755
+--- a/configure
++++ b/configure
+@@ -7550,7 +7550,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+diff --git a/configure.ac b/configure.ac
+index 74bf58a..197d61b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3149,7 +3149,7 @@ fi
+ # for target_alias and gcc doesn't manage it consistently.
+ target_configargs="--cache-file=./config.cache ${target_configargs}"
+ 
+-FLAGS_FOR_TARGET=
++FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
+ case " $target_configdirs " in
+  *" newlib "*)
+   case " $target_configargs " in
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0002-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-6.1/0002-uclibc-conf.patch
new file mode 100644
index 0000000..4d284ef
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0002-uclibc-conf.patch
@@ -0,0 +1,53 @@
+From 4efc5a258c812875743647d756f75c93c4d514a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:38:25 +0400
+Subject: [PATCH 02/46] uclibc-conf
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ contrib/regression/objs-gcc.sh | 4 ++++
+ libjava/classpath/ltconfig     | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/regression/objs-gcc.sh b/contrib/regression/objs-gcc.sh
+index 60b0497..6dc7ead 100755
+--- a/contrib/regression/objs-gcc.sh
++++ b/contrib/regression/objs-gcc.sh
+@@ -106,6 +106,10 @@ if [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-gnu ]
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
+diff --git a/libjava/classpath/ltconfig b/libjava/classpath/ltconfig
+index d318957..df55950 100755
+--- a/libjava/classpath/ltconfig
++++ b/libjava/classpath/ltconfig
+@@ -603,7 +603,7 @@ host_os=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
+-linux-gnu*) ;;
++linux-gnu*|linux-uclibc*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+ 
+@@ -1247,7 +1247,7 @@ linux-gnuoldld* | linux-gnuaout* | linux-gnucoff*)
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-6.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
new file mode 100644
index 0000000..df07feb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
@@ -0,0 +1,87 @@
+From ad5fd283fc7ef04f66c7fb003805364ea3bd34e9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:40:12 +0400
+Subject: [PATCH 03/46] gcc-uclibc-locale-ctype_touplow_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ libstdc++-v3/config/locale/generic/c_locale.cc | 5 +++++
+ libstdc++-v3/config/locale/generic/c_locale.h  | 9 +++++++++
+ libstdc++-v3/config/os/gnu-linux/ctype_base.h  | 9 +++++++++
+ 3 files changed, 23 insertions(+)
+
+diff --git a/libstdc++-v3/config/locale/generic/c_locale.cc b/libstdc++-v3/config/locale/generic/c_locale.cc
+index ef6ce8f..4740636 100644
+--- a/libstdc++-v3/config/locale/generic/c_locale.cc
++++ b/libstdc++-v3/config/locale/generic/c_locale.cc
+@@ -273,5 +273,10 @@ _GLIBCXX_END_NAMESPACE_VERSION
+ #ifdef _GLIBCXX_LONG_DOUBLE_COMPAT
+ #define _GLIBCXX_LDBL_COMPAT(dbl, ldbl) \
+   extern "C" void ldbl (void) __attribute__ ((alias (#dbl)))
++#ifdef __UCLIBC__
++// This is because __c_locale is of type __ctype_touplow_t* which is short on uclibc. for glibc its int*
++_GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPs, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPs);
++#else
+ _GLIBCXX_LDBL_COMPAT(_ZSt14__convert_to_vIdEvPKcRT_RSt12_Ios_IostateRKPi, _ZSt14__convert_to_vIeEvPKcRT_RSt12_Ios_IostateRKPi);
++#endif
+ #endif // _GLIBCXX_LONG_DOUBLE_COMPAT
+diff --git a/libstdc++-v3/config/locale/generic/c_locale.h b/libstdc++-v3/config/locale/generic/c_locale.h
+index 794471e..d65f955 100644
+--- a/libstdc++-v3/config/locale/generic/c_locale.h
++++ b/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -40,13 +40,22 @@
+ 
+ #include <clocale>
+ 
++#ifdef __UCLIBC__
++#include <features.h>
++#include <ctype.h>
++#endif
++
+ #define _GLIBCXX_NUM_CATEGORIES 0
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 
++#ifdef __UCLIBC__
++  typedef __ctype_touplow_t*	__c_locale;
++#else
+   typedef int*			__c_locale;
++#endif
+ 
+   // Convert numeric value of type double and long double to string and
+   // return length of string.  If vsnprintf is available use it, otherwise
+diff --git a/libstdc++-v3/config/os/gnu-linux/ctype_base.h b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+index 591c793..55eb0e9 100644
+--- a/libstdc++-v3/config/os/gnu-linux/ctype_base.h
++++ b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
+@@ -33,6 +33,11 @@
+ 
+ // Information as gleaned from /usr/include/ctype.h
+ 
++#ifdef __UCLIBC__
++#include <features.h>
++#include <ctype.h>
++#endif
++
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+@@ -41,7 +46,11 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+   struct ctype_base
+   {
+     // Non-standard typedefs.
++#ifdef __UCLIBC__
++    typedef const __ctype_touplow_t*	__to_type;
++#else
+     typedef const int* 		__to_type;
++#endif
+ 
+     // NB: Offsets into ctype<char>::_M_table force a particular size
+     // on the mask type. Because of this, we don't use an enum.
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0004-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-6.1/0004-uclibc-locale.patch
new file mode 100644
index 0000000..ae2627c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0004-uclibc-locale.patch
@@ -0,0 +1,2862 @@
+From 68bd083357e78678a9baac760beb2a31f00954a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:41:39 +0400
+Subject: [PATCH 04/46] uclibc-locale
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ libstdc++-v3/acinclude.m4                          |  37 ++
+ .../config/locale/uclibc/c++locale_internal.h      |  63 ++
+ libstdc++-v3/config/locale/uclibc/c_locale.cc      | 160 +++++
+ libstdc++-v3/config/locale/uclibc/c_locale.h       | 117 ++++
+ .../config/locale/uclibc/codecvt_members.cc        | 308 +++++++++
+ .../config/locale/uclibc/collate_members.cc        |  80 +++
+ libstdc++-v3/config/locale/uclibc/ctype_members.cc | 300 +++++++++
+ .../config/locale/uclibc/messages_members.cc       | 100 +++
+ .../config/locale/uclibc/messages_members.h        | 118 ++++
+ .../config/locale/uclibc/monetary_members.cc       | 692 +++++++++++++++++++++
+ .../config/locale/uclibc/numeric_members.cc        | 160 +++++
+ libstdc++-v3/config/locale/uclibc/time_members.cc  | 406 ++++++++++++
+ libstdc++-v3/config/locale/uclibc/time_members.h   |  68 ++
+ libstdc++-v3/configure                             |  75 +++
+ libstdc++-v3/include/c_compatibility/wchar.h       |   2 +
+ libstdc++-v3/include/c_std/cwchar                  |   2 +
+ 16 files changed, 2688 insertions(+)
+ create mode 100644 libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+ create mode 100644 libstdc++-v3/config/locale/uclibc/c_locale.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/c_locale.h
+ create mode 100644 libstdc++-v3/config/locale/uclibc/codecvt_members.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/collate_members.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/ctype_members.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/messages_members.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/messages_members.h
+ create mode 100644 libstdc++-v3/config/locale/uclibc/monetary_members.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/numeric_members.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/time_members.cc
+ create mode 100644 libstdc++-v3/config/locale/uclibc/time_members.h
+
+diff --git a/libstdc++-v3/acinclude.m4 b/libstdc++-v3/acinclude.m4
+index b0f88cb..a0ee36b 100644
+--- a/libstdc++-v3/acinclude.m4
++++ b/libstdc++-v3/acinclude.m4
+@@ -2358,6 +2358,9 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
+   # Default to "generic".
+   if test $enable_clocale_flag = auto; then
+     case ${target_os} in
++      *-uclibc*)
++        enable_clocale_flag=uclibc
++        ;;
+       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
+ 	enable_clocale_flag=gnu
+ 	;;
+@@ -2542,6 +2545,40 @@ AC_DEFUN([GLIBCXX_ENABLE_CLOCALE], [
+       CTIME_CC=config/locale/generic/time_members.cc
+       CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
+       ;;
++    uclibc)
++      AC_MSG_RESULT(uclibc)
++
++      # Declare intention to use gettext, and add support for specific
++      # languages.
++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
++      ALL_LINGUAS="de fr"
++
++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
++      AC_CHECK_PROG(check_msgfmt, msgfmt, yes, no)
++      if test x"$check_msgfmt" = x"yes" && test x"$enable_nls" = x"yes"; then
++        USE_NLS=yes
++      fi
++      # Export the build objects.
++      for ling in $ALL_LINGUAS; do \
++        glibcxx_MOFILES="$glibcxx_MOFILES $ling.mo"; \
++        glibcxx_POFILES="$glibcxx_POFILES $ling.po"; \
++      done
++      AC_SUBST(glibcxx_MOFILES)
++      AC_SUBST(glibcxx_POFILES)
++
++      CLOCALE_H=config/locale/uclibc/c_locale.h
++      CLOCALE_CC=config/locale/uclibc/c_locale.cc
++      CCODECVT_CC=config/locale/uclibc/codecvt_members.cc
++      CCOLLATE_CC=config/locale/uclibc/collate_members.cc
++      CCTYPE_CC=config/locale/uclibc/ctype_members.cc
++      CMESSAGES_H=config/locale/uclibc/messages_members.h
++      CMESSAGES_CC=config/locale/uclibc/messages_members.cc
++      CMONEY_CC=config/locale/uclibc/monetary_members.cc
++      CNUMERIC_CC=config/locale/uclibc/numeric_members.cc
++      CTIME_H=config/locale/uclibc/time_members.h
++      CTIME_CC=config/locale/uclibc/time_members.cc
++      CLOCALE_INTERNAL_H=config/locale/uclibc/c++locale_internal.h
++      ;;
+   esac
+ 
+   # This is where the testsuite looks for locale catalogs, using the
+diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+new file mode 100644
+index 0000000..2ae3e4a
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -0,0 +1,63 @@
++// Prototypes for GLIBC thread locale __-prefixed functions -*- C++ -*-
++
++// Copyright (C) 2002, 2004, 2005 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++// Written by Jakub Jelinek <jakub@redhat.com>
++
++#include <bits/c++config.h>
++#include <clocale>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning clean this up
++#endif
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++
++extern "C" __typeof(nl_langinfo_l) __nl_langinfo_l;
++extern "C" __typeof(strcoll_l) __strcoll_l;
++extern "C" __typeof(strftime_l) __strftime_l;
++extern "C" __typeof(strtod_l) __strtod_l;
++extern "C" __typeof(strtof_l) __strtof_l;
++extern "C" __typeof(strtold_l) __strtold_l;
++extern "C" __typeof(strxfrm_l) __strxfrm_l;
++extern "C" __typeof(newlocale) __newlocale;
++extern "C" __typeof(freelocale) __freelocale;
++extern "C" __typeof(duplocale) __duplocale;
++extern "C" __typeof(uselocale) __uselocale;
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++extern "C" __typeof(iswctype_l) __iswctype_l;
++extern "C" __typeof(towlower_l) __towlower_l;
++extern "C" __typeof(towupper_l) __towupper_l;
++extern "C" __typeof(wcscoll_l) __wcscoll_l;
++extern "C" __typeof(wcsftime_l) __wcsftime_l;
++extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
++extern "C" __typeof(wctype_l) __wctype_l;
++#endif
++
++#endif // GLIBC 2.3 and later
+diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc b/libstdc++-v3/config/locale/uclibc/c_locale.cc
+new file mode 100644
+index 0000000..5081dc1
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -0,0 +1,160 @@
++// Wrapper for underlying C-language localization -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.8  Standard locale categories.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <cerrno>  // For errno
++#include <locale>
++#include <stdexcept>
++#include <langinfo.h>
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
++#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
++#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
++#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
++#define __strtof_l(S, E, L)         strtof((S), (E))
++#define __strtod_l(S, E, L)         strtod((S), (E))
++#define __strtold_l(S, E, L)        strtold((S), (E))
++#warning should dummy __newlocale check for C|POSIX ?
++#define __newlocale(a, b, c)        NULL
++#define __freelocale(a)             ((void)0)
++#define __duplocale(a)              __c_locale()
++#endif
++
++namespace std
++{
++  template<>
++    void
++    __convert_to_v(const char* __s, float& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  float __f = __strtof_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __f;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  template<>
++    void
++    __convert_to_v(const char* __s, double& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  double __d = __strtod_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __d;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  template<>
++    void
++    __convert_to_v(const char* __s, long double& __v, ios_base::iostate& __err,
++		   const __c_locale& __cloc)
++    {
++      if (!(__err & ios_base::failbit))
++	{
++	  char* __sanity;
++	  errno = 0;
++	  long double __ld = __strtold_l(__s, &__sanity, __cloc);
++          if (__sanity != __s && errno != ERANGE)
++	    __v = __ld;
++	  else
++	    __err |= ios_base::failbit;
++	}
++    }
++
++  void
++  locale::facet::_S_create_c_locale(__c_locale& __cloc, const char* __s,
++				    __c_locale __old)
++  {
++    __cloc = __newlocale(1 << LC_ALL, __s, __old);
++#ifdef __UCLIBC_HAS_XLOCALE__
++    if (!__cloc)
++      {
++	// This named locale is not supported by the underlying OS.
++	__throw_runtime_error(__N("locale::facet::_S_create_c_locale "
++			      "name not valid"));
++      }
++#endif
++  }
++
++  void
++  locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
++  {
++    if (_S_get_c_locale() != __cloc)
++      __freelocale(__cloc);
++  }
++
++  __c_locale
++  locale::facet::_S_clone_c_locale(__c_locale& __cloc)
++  { return __duplocale(__cloc); }
++} // namespace std
++
++namespace __gnu_cxx
++{
++  const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =
++    {
++      "LC_CTYPE",
++      "LC_NUMERIC",
++      "LC_TIME",
++      "LC_COLLATE",
++      "LC_MONETARY",
++      "LC_MESSAGES",
++#if _GLIBCXX_NUM_CATEGORIES != 0
++      "LC_PAPER",
++      "LC_NAME",
++      "LC_ADDRESS",
++      "LC_TELEPHONE",
++      "LC_MEASUREMENT",
++      "LC_IDENTIFICATION"
++#endif
++    };
++}
++
++namespace std
++{
++  const char* const* const locale::_S_categories = __gnu_cxx::category_names;
++}  // namespace std
+diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h b/libstdc++-v3/config/locale/uclibc/c_locale.h
+new file mode 100644
+index 0000000..da07c1f
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -0,0 +1,117 @@
++// Wrapper for underlying C-language localization -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.8  Standard locale categories.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#ifndef _C_LOCALE_H
++#define _C_LOCALE_H 1
++
++#pragma GCC system_header
++
++#include <cstring>              // get std::strlen
++#include <cstdio>               // get std::snprintf or std::sprintf
++#include <clocale>
++#include <langinfo.h>		// For codecvt
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this
++#endif
++#ifdef __UCLIBC_HAS_LOCALE__
++#include <iconv.h>		// For codecvt using iconv, iconv_t
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#include <libintl.h> 		// For messages
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning what is _GLIBCXX_C_LOCALE_GNU for
++#endif
++#define _GLIBCXX_C_LOCALE_GNU 1
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix categories
++#endif
++// #define _GLIBCXX_NUM_CATEGORIES 6
++#define _GLIBCXX_NUM_CATEGORIES 0
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++namespace __gnu_cxx
++{
++  extern "C" __typeof(uselocale) __uselocale;
++}
++#endif
++
++namespace std
++{
++#ifdef __UCLIBC_HAS_XLOCALE__
++  typedef __locale_t		__c_locale;
++#else
++  typedef int*			__c_locale;
++#endif
++
++  // Convert numeric value of type _Tv to string and return length of
++  // string.  If snprintf is available use it, otherwise fall back to
++  // the unsafe sprintf which, in general, can be dangerous and should
++  // be avoided.
++  template<typename _Tv>
++    int
++    __convert_from_v(char* __out,
++		     const int __size __attribute__ ((__unused__)),
++		     const char* __fmt,
++#ifdef __UCLIBC_HAS_XCLOCALE__
++		     _Tv __v, const __c_locale& __cloc, int __prec)
++    {
++      __c_locale __old = __gnu_cxx::__uselocale(__cloc);
++#else
++		     _Tv __v, const __c_locale&, int __prec)
++    {
++# ifdef __UCLIBC_HAS_LOCALE__
++      char* __old = std::setlocale(LC_ALL, NULL);
++      char* __sav = new char[std::strlen(__old) + 1];
++      std::strcpy(__sav, __old);
++      std::setlocale(LC_ALL, "C");
++# endif
++#endif
++
++      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
++
++#ifdef __UCLIBC_HAS_XCLOCALE__
++      __gnu_cxx::__uselocale(__old);
++#elif defined __UCLIBC_HAS_LOCALE__
++      std::setlocale(LC_ALL, __sav);
++      delete [] __sav;
++#endif
++      return __ret;
++    }
++}
++
++#endif
+diff --git a/libstdc++-v3/config/locale/uclibc/codecvt_members.cc b/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
+new file mode 100644
+index 0000000..64aa962
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/codecvt_members.cc
+@@ -0,0 +1,308 @@
++// std::codecvt implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2002, 2003 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.1.5 - Template class codecvt
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <cstdlib>  // For MB_CUR_MAX
++#include <climits>  // For MB_LEN_MAX
++#include <bits/c++locale_internal.h>
++
++namespace std
++{
++  // Specializations.
++#ifdef _GLIBCXX_USE_WCHAR_T
++  codecvt_base::result
++  codecvt<wchar_t, char, mbstate_t>::
++  do_out(state_type& __state, const intern_type* __from,
++	 const intern_type* __from_end, const intern_type*& __from_next,
++	 extern_type* __to, extern_type* __to_end,
++	 extern_type*& __to_next) const
++  {
++    result __ret = ok;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // wcsnrtombs is *very* fast but stops if encounters NUL characters:
++    // in case we fall back to wcrtomb and then continue, in a loop.
++    // NB: wcsnrtombs is a GNU extension
++    for (__from_next = __from, __to_next = __to;
++	 __from_next < __from_end && __to_next < __to_end
++	 && __ret == ok;)
++      {
++	const intern_type* __from_chunk_end = wmemchr(__from_next, L'\0',
++						      __from_end - __from_next);
++	if (!__from_chunk_end)
++	  __from_chunk_end = __from_end;
++
++	__from = __from_next;
++	const size_t __conv = wcsnrtombs(__to_next, &__from_next,
++					 __from_chunk_end - __from_next,
++					 __to_end - __to_next, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // wcrtomb.
++	    for (; __from < __from_next; ++__from)
++	      __to_next += wcrtomb(__to_next, *__from, &__tmp_state);
++	    __state = __tmp_state;
++	    __ret = error;
++	  }
++	else if (__from_next && __from_next < __from_chunk_end)
++	  {
++	    __to_next += __conv;
++	    __ret = partial;
++	  }
++	else
++	  {
++	    __from_next = __from_chunk_end;
++	    __to_next += __conv;
++	  }
++
++	if (__from_next < __from_end && __ret == ok)
++	  {
++	    extern_type __buf[MB_LEN_MAX];
++	    __tmp_state = __state;
++	    const size_t __conv = wcrtomb(__buf, *__from_next, &__tmp_state);
++	    if (__conv > static_cast<size_t>(__to_end - __to_next))
++	      __ret = partial;
++	    else
++	      {
++		memcpy(__to_next, __buf, __conv);
++		__state = __tmp_state;
++		__to_next += __conv;
++		++__from_next;
++	      }
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++
++  codecvt_base::result
++  codecvt<wchar_t, char, mbstate_t>::
++  do_in(state_type& __state, const extern_type* __from,
++	const extern_type* __from_end, const extern_type*& __from_next,
++	intern_type* __to, intern_type* __to_end,
++	intern_type*& __to_next) const
++  {
++    result __ret = ok;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // mbsnrtowcs is *very* fast but stops if encounters NUL characters:
++    // in case we store a L'\0' and then continue, in a loop.
++    // NB: mbsnrtowcs is a GNU extension
++    for (__from_next = __from, __to_next = __to;
++	 __from_next < __from_end && __to_next < __to_end
++	 && __ret == ok;)
++      {
++	const extern_type* __from_chunk_end;
++	__from_chunk_end = static_cast<const extern_type*>(memchr(__from_next, '\0',
++								  __from_end
++								  - __from_next));
++	if (!__from_chunk_end)
++	  __from_chunk_end = __from_end;
++
++	__from = __from_next;
++	size_t __conv = mbsnrtowcs(__to_next, &__from_next,
++				   __from_chunk_end - __from_next,
++				   __to_end - __to_next, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // mbrtowc.
++	    for (;; ++__to_next, __from += __conv)
++	      {
++		__conv = mbrtowc(__to_next, __from, __from_end - __from,
++				 &__tmp_state);
++		if (__conv == static_cast<size_t>(-1)
++		    || __conv == static_cast<size_t>(-2))
++		  break;
++	      }
++	    __from_next = __from;
++	    __state = __tmp_state;
++	    __ret = error;
++	  }
++	else if (__from_next && __from_next < __from_chunk_end)
++	  {
++	    // It is unclear what to return in this case (see DR 382).
++	    __to_next += __conv;
++	    __ret = partial;
++	  }
++	else
++	  {
++	    __from_next = __from_chunk_end;
++	    __to_next += __conv;
++	  }
++
++	if (__from_next < __from_end && __ret == ok)
++	  {
++	    if (__to_next < __to_end)
++	      {
++		// XXX Probably wrong for stateful encodings
++		__tmp_state = __state;
++		++__from_next;
++		*__to_next++ = L'\0';
++	      }
++	    else
++	      __ret = partial;
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_encoding() const throw()
++  {
++    // XXX This implementation assumes that the encoding is
++    // stateless and is either single-byte or variable-width.
++    int __ret = 0;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++    if (MB_CUR_MAX == 1)
++      __ret = 1;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_max_length() const throw()
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++    // XXX Probably wrong for stateful encodings.
++    int __ret = MB_CUR_MAX;
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __ret;
++  }
++
++  int
++  codecvt<wchar_t, char, mbstate_t>::
++  do_length(state_type& __state, const extern_type* __from,
++	    const extern_type* __end, size_t __max) const
++  {
++    int __ret = 0;
++    state_type __tmp_state(__state);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_codecvt);
++#endif
++
++    // mbsnrtowcs is *very* fast but stops if encounters NUL characters:
++    // in case we advance past it and then continue, in a loop.
++    // NB: mbsnrtowcs is a GNU extension
++
++    // A dummy internal buffer is needed in order for mbsnrtocws to consider
++    // its fourth parameter (it wouldn't with NULL as first parameter).
++    wchar_t* __to = static_cast<wchar_t*>(__builtin_alloca(sizeof(wchar_t)
++							   * __max));
++    while (__from < __end && __max)
++      {
++	const extern_type* __from_chunk_end;
++	__from_chunk_end = static_cast<const extern_type*>(memchr(__from, '\0',
++								  __end
++								  - __from));
++	if (!__from_chunk_end)
++	  __from_chunk_end = __end;
++
++	const extern_type* __tmp_from = __from;
++	size_t __conv = mbsnrtowcs(__to, &__from,
++				   __from_chunk_end - __from,
++				   __max, &__state);
++	if (__conv == static_cast<size_t>(-1))
++	  {
++	    // In case of error, in order to stop at the exact place we
++	    // have to start again from the beginning with a series of
++	    // mbrtowc.
++	    for (__from = __tmp_from;; __from += __conv)
++	      {
++		__conv = mbrtowc(NULL, __from, __end - __from,
++				 &__tmp_state);
++		if (__conv == static_cast<size_t>(-1)
++		    || __conv == static_cast<size_t>(-2))
++		  break;
++	      }
++	    __state = __tmp_state;
++	    __ret += __from - __tmp_from;
++	    break;
++	  }
++	if (!__from)
++	  __from = __from_chunk_end;
++
++	__ret += __from - __tmp_from;
++	__max -= __conv;
++
++	if (__from < __end && __max)
++	  {
++	    // XXX Probably wrong for stateful encodings
++	    __tmp_state = __state;
++	    ++__from;
++	    ++__ret;
++	    --__max;
++	  }
++      }
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++
++    return __ret;
++  }
++#endif
++}
+diff --git a/libstdc++-v3/config/locale/uclibc/collate_members.cc b/libstdc++-v3/config/locale/uclibc/collate_members.cc
+new file mode 100644
+index 0000000..c2664a7
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/collate_members.cc
+@@ -0,0 +1,80 @@
++// std::collate implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.4.1.2  collate virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
++#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
++#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
++#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
++#endif
++
++namespace std
++{
++  // These are basically extensions to char_traits, and perhaps should
++  // be put there instead of here.
++  template<>
++    int
++    collate<char>::_M_compare(const char* __one, const char* __two) const
++    {
++      int __cmp = __strcoll_l(__one, __two, _M_c_locale_collate);
++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp != 0);
++    }
++
++  template<>
++    size_t
++    collate<char>::_M_transform(char* __to, const char* __from,
++				size_t __n) const
++    { return __strxfrm_l(__to, __from, __n, _M_c_locale_collate); }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    int
++    collate<wchar_t>::_M_compare(const wchar_t* __one,
++				 const wchar_t* __two) const
++    {
++      int __cmp = __wcscoll_l(__one, __two, _M_c_locale_collate);
++      return (__cmp >> (8 * sizeof (int) - 2)) | (__cmp != 0);
++    }
++
++  template<>
++    size_t
++    collate<wchar_t>::_M_transform(wchar_t* __to, const wchar_t* __from,
++				   size_t __n) const
++    { return __wcsxfrm_l(__to, __from, __n, _M_c_locale_collate); }
++#endif
++}
+diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+new file mode 100644
+index 0000000..7294e3a
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -0,0 +1,300 @@
++// std::ctype implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.1.1.2  ctype virtual functions.
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __wctype_l(S, L)           wctype((S))
++#define __towupper_l(C, L)         towupper((C))
++#define __towlower_l(C, L)         towlower((C))
++#define __iswctype_l(C, M, L)      iswctype((C), (M))
++#endif
++
++namespace std
++{
++  // NB: The other ctype<char> specializations are in src/locale.cc and
++  // various /config/os/* files.
++  template<>
++    ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
++    : ctype<char>(0, false, __refs)
++    {
++      if (std::strcmp(__s, "C") != 0 && std::strcmp(__s, "POSIX") != 0)
++	{
++	  this->_S_destroy_c_locale(this->_M_c_locale_ctype);
++	  this->_S_create_c_locale(this->_M_c_locale_ctype, __s);
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  this->_M_toupper = this->_M_c_locale_ctype->__ctype_toupper;
++	  this->_M_tolower = this->_M_c_locale_ctype->__ctype_tolower;
++	  this->_M_table = this->_M_c_locale_ctype->__ctype_b;
++#endif
++	}
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  ctype<wchar_t>::__wmask_type
++  ctype<wchar_t>::_M_convert_to_wmask(const mask __m) const
++  {
++    __wmask_type __ret;
++    switch (__m)
++      {
++      case space:
++	__ret = __wctype_l("space", _M_c_locale_ctype);
++	break;
++      case print:
++	__ret = __wctype_l("print", _M_c_locale_ctype);
++	break;
++      case cntrl:
++	__ret = __wctype_l("cntrl", _M_c_locale_ctype);
++	break;
++      case upper:
++	__ret = __wctype_l("upper", _M_c_locale_ctype);
++	break;
++      case lower:
++	__ret = __wctype_l("lower", _M_c_locale_ctype);
++	break;
++      case alpha:
++	__ret = __wctype_l("alpha", _M_c_locale_ctype);
++	break;
++      case digit:
++	__ret = __wctype_l("digit", _M_c_locale_ctype);
++	break;
++      case punct:
++	__ret = __wctype_l("punct", _M_c_locale_ctype);
++	break;
++      case xdigit:
++	__ret = __wctype_l("xdigit", _M_c_locale_ctype);
++	break;
++      case alnum:
++	__ret = __wctype_l("alnum", _M_c_locale_ctype);
++	break;
++      case graph:
++	__ret = __wctype_l("graph", _M_c_locale_ctype);
++	break;
++      default:
++	__ret = __wmask_type();
++      }
++    return __ret;
++  }
++
++  wchar_t
++  ctype<wchar_t>::do_toupper(wchar_t __c) const
++  { return __towupper_l(__c, _M_c_locale_ctype); }
++
++  const wchar_t*
++  ctype<wchar_t>::do_toupper(wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi)
++      {
++        *__lo = __towupper_l(*__lo, _M_c_locale_ctype);
++        ++__lo;
++      }
++    return __hi;
++  }
++
++  wchar_t
++  ctype<wchar_t>::do_tolower(wchar_t __c) const
++  { return __towlower_l(__c, _M_c_locale_ctype); }
++
++  const wchar_t*
++  ctype<wchar_t>::do_tolower(wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi)
++      {
++        *__lo = __towlower_l(*__lo, _M_c_locale_ctype);
++        ++__lo;
++      }
++    return __hi;
++  }
++
++  bool
++  ctype<wchar_t>::
++  do_is(mask __m, wchar_t __c) const
++  {
++    // Highest bitmask in ctype_base == 10, but extra in "C"
++    // library for blank.
++    bool __ret = false;
++    const size_t __bitmasksize = 11;
++    for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++      if (__m & _M_bit[__bitcur]
++	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
++	{
++	  __ret = true;
++	  break;
++	}
++    return __ret;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_is(const wchar_t* __lo, const wchar_t* __hi, mask* __vec) const
++  {
++    for (; __lo < __hi; ++__vec, ++__lo)
++      {
++	// Highest bitmask in ctype_base == 10, but extra in "C"
++	// library for blank.
++	const size_t __bitmasksize = 11;
++	mask __m = 0;
++	for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++	  if (__iswctype_l(*__lo, _M_wmask[__bitcur], _M_c_locale_ctype))
++	    __m |= _M_bit[__bitcur];
++	*__vec = __m;
++      }
++    return __hi;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_scan_is(mask __m, const wchar_t* __lo, const wchar_t* __hi) const
++  {
++    while (__lo < __hi && !this->do_is(__m, *__lo))
++      ++__lo;
++    return __lo;
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_scan_not(mask __m, const char_type* __lo, const char_type* __hi) const
++  {
++    while (__lo < __hi && this->do_is(__m, *__lo) != 0)
++      ++__lo;
++    return __lo;
++  }
++
++  wchar_t
++  ctype<wchar_t>::
++  do_widen(char __c) const
++  { return _M_widen[static_cast<unsigned char>(__c)]; }
++
++  const char*
++  ctype<wchar_t>::
++  do_widen(const char* __lo, const char* __hi, wchar_t* __dest) const
++  {
++    while (__lo < __hi)
++      {
++	*__dest = _M_widen[static_cast<unsigned char>(*__lo)];
++	++__lo;
++	++__dest;
++      }
++    return __hi;
++  }
++
++  char
++  ctype<wchar_t>::
++  do_narrow(wchar_t __wc, char __dfault) const
++  {
++    if (__wc >= 0 && __wc < 128 && _M_narrow_ok)
++      return _M_narrow[__wc];
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    const int __c = wctob(__wc);
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return (__c == EOF ? __dfault : static_cast<char>(__c));
++  }
++
++  const wchar_t*
++  ctype<wchar_t>::
++  do_narrow(const wchar_t* __lo, const wchar_t* __hi, char __dfault,
++	    char* __dest) const
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    if (_M_narrow_ok)
++      while (__lo < __hi)
++	{
++	  if (*__lo >= 0 && *__lo < 128)
++	    *__dest = _M_narrow[*__lo];
++	  else
++	    {
++	      const int __c = wctob(*__lo);
++	      *__dest = (__c == EOF ? __dfault : static_cast<char>(__c));
++	    }
++	  ++__lo;
++	  ++__dest;
++	}
++    else
++      while (__lo < __hi)
++	{
++	  const int __c = wctob(*__lo);
++	  *__dest = (__c == EOF ? __dfault : static_cast<char>(__c));
++	  ++__lo;
++	  ++__dest;
++	}
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++    return __hi;
++  }
++
++  void
++  ctype<wchar_t>::_M_initialize_ctype()
++  {
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __c_locale __old = __uselocale(_M_c_locale_ctype);
++#endif
++    wint_t __i;
++    for (__i = 0; __i < 128; ++__i)
++      {
++	const int __c = wctob(__i);
++	if (__c == EOF)
++	  break;
++	else
++	  _M_narrow[__i] = static_cast<char>(__c);
++      }
++    if (__i == 128)
++      _M_narrow_ok = true;
++    else
++      _M_narrow_ok = false;
++    for (size_t __j = 0;
++	 __j < sizeof(_M_widen) / sizeof(wint_t); ++__j)
++      _M_widen[__j] = btowc(__j);
++
++    for (size_t __k = 0; __k <= 11; ++__k)
++      {
++	_M_bit[__k] = static_cast<mask>(_ISbit(__k));
++	_M_wmask[__k] = _M_convert_to_wmask(_M_bit[__k]);
++      }
++#ifdef __UCLIBC_HAS_XLOCALE__
++    __uselocale(__old);
++#endif
++  }
++#endif //  _GLIBCXX_USE_WCHAR_T
++}
+diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.cc b/libstdc++-v3/config/locale/uclibc/messages_members.cc
+new file mode 100644
+index 0000000..13594d9
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/messages_members.cc
+@@ -0,0 +1,100 @@
++// std::messages implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.7.1.2  messages virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix gettext stuff
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++extern "C" char *__dcgettext(const char *domainname,
++			     const char *msgid, int category);
++#undef gettext
++#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
++#else
++#undef gettext
++#define gettext(msgid) (msgid)
++#endif
++
++namespace std
++{
++  // Specializations.
++  template<>
++    string
++    messages<char>::do_get(catalog, int, int, const string& __dfault) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      __c_locale __old = __uselocale(_M_c_locale_messages);
++      const char* __msg = const_cast<const char*>(gettext(__dfault.c_str()));
++      __uselocale(__old);
++      return string(__msg);
++#elif defined __UCLIBC_HAS_LOCALE__
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_messages);
++      const char* __msg = gettext(__dfault.c_str());
++      setlocale(LC_ALL, __old);
++      free(__old);
++      return string(__msg);
++#else
++      const char* __msg = gettext(__dfault.c_str());
++      return string(__msg);
++#endif
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    wstring
++    messages<wchar_t>::do_get(catalog, int, int, const wstring& __dfault) const
++    {
++# ifdef __UCLIBC_HAS_XLOCALE__
++      __c_locale __old = __uselocale(_M_c_locale_messages);
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      __uselocale(__old);
++      return _M_convert_from_char(__msg);
++# elif defined __UCLIBC_HAS_LOCALE__
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_messages);
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      setlocale(LC_ALL, __old);
++      free(__old);
++      return _M_convert_from_char(__msg);
++# else
++      char* __msg = gettext(_M_convert_to_char(__dfault));
++      return _M_convert_from_char(__msg);
++# endif
++    }
++#endif
++}
+diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h b/libstdc++-v3/config/locale/uclibc/messages_members.h
+new file mode 100644
+index 0000000..1424078
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -0,0 +1,118 @@
++// std::messages implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.7.1.2  messages functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix prototypes for *textdomain funcs
++#endif
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++extern "C" char *__textdomain(const char *domainname);
++extern "C" char *__bindtextdomain(const char *domainname,
++				  const char *dirname);
++#else
++#undef __textdomain
++#undef __bindtextdomain
++#define __textdomain(D)           ((void)0)
++#define __bindtextdomain(D,P)     ((void)0)
++#endif
++
++  // Non-virtual member functions.
++  template<typename _CharT>
++     messages<_CharT>::messages(size_t __refs)
++     : facet(__refs), _M_c_locale_messages(_S_get_c_locale()),
++     _M_name_messages(_S_get_c_name())
++     { }
++
++  template<typename _CharT>
++     messages<_CharT>::messages(__c_locale __cloc, const char* __s,
++				size_t __refs)
++     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
++     _M_name_messages(__s)
++     {
++       char* __tmp = new char[std::strlen(__s) + 1];
++       std::strcpy(__tmp, __s);
++       _M_name_messages = __tmp;
++     }
++
++  template<typename _CharT>
++    typename messages<_CharT>::catalog
++    messages<_CharT>::open(const basic_string<char>& __s, const locale& __loc,
++			   const char* __dir) const
++    {
++      __bindtextdomain(__s.c_str(), __dir);
++      return this->do_open(__s, __loc);
++    }
++
++  // Virtual member functions.
++  template<typename _CharT>
++    messages<_CharT>::~messages()
++    {
++      if (_M_name_messages != _S_get_c_name())
++	delete [] _M_name_messages;
++      _S_destroy_c_locale(_M_c_locale_messages);
++    }
++
++  template<typename _CharT>
++    typename messages<_CharT>::catalog
++    messages<_CharT>::do_open(const basic_string<char>& __s,
++			      const locale&) const
++    {
++      // No error checking is done, assume the catalog exists and can
++      // be used.
++      __textdomain(__s.c_str());
++      return 0;
++    }
++
++  template<typename _CharT>
++    void
++    messages<_CharT>::do_close(catalog) const
++    { }
++
++   // messages_byname
++   template<typename _CharT>
++     messages_byname<_CharT>::messages_byname(const char* __s, size_t __refs)
++     : messages<_CharT>(__refs)
++     {
++       if (this->_M_name_messages != locale::facet::_S_get_c_name())
++	 delete [] this->_M_name_messages;
++       char* __tmp = new char[std::strlen(__s) + 1];
++       std::strcpy(__tmp, __s);
++       this->_M_name_messages = __tmp;
++
++       if (std::strcmp(__s, "C") != 0 && std::strcmp(__s, "POSIX") != 0)
++	 {
++	   this->_S_destroy_c_locale(this->_M_c_locale_messages);
++	   this->_S_create_c_locale(this->_M_c_locale_messages, __s);
++	 }
++     }
+diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+new file mode 100644
+index 0000000..aa52731
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -0,0 +1,692 @@
++// std::moneypunct implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.6.3.2  moneypunct virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning optimize this for uclibc
++#warning tailor for stub locale support
++#endif
++
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  // Construct and return valid pattern consisting of some combination of:
++  // space none symbol sign value
++  money_base::pattern
++  money_base::_S_construct_pattern(char __precedes, char __space, char __posn)
++  {
++    pattern __ret;
++
++    // This insanely complicated routine attempts to construct a valid
++    // pattern for use with monyepunct. A couple of invariants:
++
++    // if (__precedes) symbol -> value
++    // else value -> symbol
++
++    // if (__space) space
++    // else none
++
++    // none == never first
++    // space never first or last
++
++    // Any elegant implementations of this are welcome.
++    switch (__posn)
++      {
++      case 0:
++      case 1:
++	// 1 The sign precedes the value and symbol.
++	__ret.field[0] = sign;
++	if (__space)
++	  {
++	    // Pattern starts with sign.
++	    if (__precedes)
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[1] = value;
++		__ret.field[3] = symbol;
++	      }
++	    __ret.field[2] = space;
++	  }
++	else
++	  {
++	    // Pattern starts with sign and ends with none.
++	    if (__precedes)
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[2] = value;
++	      }
++	    else
++	      {
++		__ret.field[1] = value;
++		__ret.field[2] = symbol;
++	      }
++	    __ret.field[3] = none;
++	  }
++	break;
++      case 2:
++	// 2 The sign follows the value and symbol.
++	if (__space)
++	  {
++	    // Pattern either ends with sign.
++	    if (__precedes)
++	      {
++		__ret.field[0] = symbol;
++		__ret.field[2] = value;
++	      }
++	    else
++	      {
++		__ret.field[0] = value;
++		__ret.field[2] = symbol;
++	      }
++	    __ret.field[1] = space;
++	    __ret.field[3] = sign;
++	  }
++	else
++	  {
++	    // Pattern ends with sign then none.
++	    if (__precedes)
++	      {
++		__ret.field[0] = symbol;
++		__ret.field[1] = value;
++	      }
++	    else
++	      {
++		__ret.field[0] = value;
++		__ret.field[1] = symbol;
++	      }
++	    __ret.field[2] = sign;
++	    __ret.field[3] = none;
++	  }
++	break;
++      case 3:
++	// 3 The sign immediately precedes the symbol.
++	if (__precedes)
++	  {
++	    __ret.field[0] = sign;
++	    __ret.field[1] = symbol;
++	    if (__space)
++	      {
++		__ret.field[2] = space;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[2] = value;
++		__ret.field[3] = none;
++	      }
++	  }
++	else
++	  {
++	    __ret.field[0] = value;
++	    if (__space)
++	      {
++		__ret.field[1] = space;
++		__ret.field[2] = sign;
++		__ret.field[3] = symbol;
++	      }
++	    else
++	      {
++		__ret.field[1] = sign;
++		__ret.field[2] = symbol;
++		__ret.field[3] = none;
++	      }
++	  }
++	break;
++      case 4:
++	// 4 The sign immediately follows the symbol.
++	if (__precedes)
++	  {
++	    __ret.field[0] = symbol;
++	    __ret.field[1] = sign;
++	    if (__space)
++	      {
++		__ret.field[2] = space;
++		__ret.field[3] = value;
++	      }
++	    else
++	      {
++		__ret.field[2] = value;
++		__ret.field[3] = none;
++	      }
++	  }
++	else
++	  {
++	    __ret.field[0] = value;
++	    if (__space)
++	      {
++		__ret.field[1] = space;
++		__ret.field[2] = symbol;
++		__ret.field[3] = sign;
++	      }
++	    else
++	      {
++		__ret.field[1] = symbol;
++		__ret.field[2] = sign;
++		__ret.field[3] = none;
++	      }
++	  }
++	break;
++      default:
++	;
++      }
++    return __ret;
++  }
++
++  template<>
++    void
++    moneypunct<char, true>::_M_initialize_moneypunct(__c_locale __cloc,
++						     const char*)
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<char, true>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = "";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = "";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = "";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] = money_base::_S_atoms[__i];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(__MON_DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(__MON_THOUSANDS_SEP,
++							__cloc));
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	  _M_data->_M_positive_sign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  _M_data->_M_positive_sign_size = strlen(_M_data->_M_positive_sign);
++
++	  char __nposn = *(__nl_langinfo_l(__INT_N_SIGN_POSN, __cloc));
++	  if (!__nposn)
++	    _M_data->_M_negative_sign = "()";
++	  else
++	    _M_data->_M_negative_sign = __nl_langinfo_l(__NEGATIVE_SIGN,
++							__cloc);
++	  _M_data->_M_negative_sign_size = strlen(_M_data->_M_negative_sign);
++
++	  // _Intl == true
++	  _M_data->_M_curr_symbol = __nl_langinfo_l(__INT_CURR_SYMBOL, __cloc);
++	  _M_data->_M_curr_symbol_size = strlen(_M_data->_M_curr_symbol);
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__INT_FRAC_DIGITS,
++						      __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++	}
++    }
++
++  template<>
++    void
++    moneypunct<char, false>::_M_initialize_moneypunct(__c_locale __cloc,
++						      const char*)
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<char, false>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = "";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = "";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = "";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] = money_base::_S_atoms[__i];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(__MON_DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(__MON_THOUSANDS_SEP,
++							__cloc));
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	  _M_data->_M_positive_sign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  _M_data->_M_positive_sign_size = strlen(_M_data->_M_positive_sign);
++
++	  char __nposn = *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
++	  if (!__nposn)
++	    _M_data->_M_negative_sign = "()";
++	  else
++	    _M_data->_M_negative_sign = __nl_langinfo_l(__NEGATIVE_SIGN,
++							__cloc);
++	  _M_data->_M_negative_sign_size = strlen(_M_data->_M_negative_sign);
++
++	  // _Intl == false
++	  _M_data->_M_curr_symbol = __nl_langinfo_l(__CURRENCY_SYMBOL, __cloc);
++	  _M_data->_M_curr_symbol_size = strlen(_M_data->_M_curr_symbol);
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__FRAC_DIGITS, __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++	}
++    }
++
++  template<>
++    moneypunct<char, true>::~moneypunct()
++    { delete _M_data; }
++
++  template<>
++    moneypunct<char, false>::~moneypunct()
++    { delete _M_data; }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    moneypunct<wchar_t, true>::_M_initialize_moneypunct(__c_locale __cloc,
++#ifdef __UCLIBC_HAS_XLOCALE__
++							const char*)
++#else
++							const char* __name)
++#endif
++    {
++      if (!_M_data)
++	_M_data = new __moneypunct_cache<wchar_t, true>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = L"";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = L"";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = L"";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] =
++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
++	}
++      else
++	{
++	  // Named locale.
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __c_locale __old = __uselocale(__cloc);
++#else
++	  // Switch to named locale so that mbsrtowcs will work.
++	  char* __old = strdup(setlocale(LC_ALL, NULL));
++	  setlocale(LC_ALL, __name);
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be monetary
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# else
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
++	  union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++#endif
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++
++	  const char* __cpossign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  const char* __cnegsign = __nl_langinfo_l(__NEGATIVE_SIGN, __cloc);
++	  const char* __ccurr = __nl_langinfo_l(__INT_CURR_SYMBOL, __cloc);
++
++	  wchar_t* __wcs_ps = 0;
++	  wchar_t* __wcs_ns = 0;
++	  const char __nposn = *(__nl_langinfo_l(__INT_N_SIGN_POSN, __cloc));
++	  try
++	    {
++	      mbstate_t __state;
++	      size_t __len = strlen(__cpossign);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ps = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
++		  _M_data->_M_positive_sign = __wcs_ps;
++		}
++	      else
++		_M_data->_M_positive_sign = L"";
++	      _M_data->_M_positive_sign_size = wcslen(_M_data->_M_positive_sign);
++
++	      __len = strlen(__cnegsign);
++	      if (!__nposn)
++		_M_data->_M_negative_sign = L"()";
++	      else if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ns = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
++		  _M_data->_M_negative_sign = __wcs_ns;
++		}
++	      else
++		_M_data->_M_negative_sign = L"";
++	      _M_data->_M_negative_sign_size = wcslen(_M_data->_M_negative_sign);
++
++	      // _Intl == true.
++	      __len = strlen(__ccurr);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  wchar_t* __wcs = new wchar_t[__len];
++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
++		  _M_data->_M_curr_symbol = __wcs;
++		}
++	      else
++		_M_data->_M_curr_symbol = L"";
++	      _M_data->_M_curr_symbol_size = wcslen(_M_data->_M_curr_symbol);
++	    }
++	  catch (...)
++	    {
++	      delete _M_data;
++	      _M_data = 0;
++	      delete __wcs_ps;
++	      delete __wcs_ns;
++#ifdef __UCLIBC_HAS_XLOCALE__
++	      __uselocale(__old);
++#else
++	      setlocale(LC_ALL, __old);
++	      free(__old);
++#endif
++	      __throw_exception_again;
++	    }
++
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__INT_FRAC_DIGITS,
++						      __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__INT_P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__INT_P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__INT_P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++							__pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__INT_N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__INT_N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++							__nposn);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __uselocale(__old);
++#else
++	  setlocale(LC_ALL, __old);
++	  free(__old);
++#endif
++	}
++    }
++
++  template<>
++  void
++  moneypunct<wchar_t, false>::_M_initialize_moneypunct(__c_locale __cloc,
++#ifdef __UCLIBC_HAS_XLOCALE__
++						       const char*)
++#else
++                                                       const char* __name)
++#endif
++  {
++    if (!_M_data)
++      _M_data = new __moneypunct_cache<wchar_t, false>;
++
++    if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++	  _M_data->_M_grouping = "";
++          _M_data->_M_grouping_size = 0;
++	  _M_data->_M_curr_symbol = L"";
++	  _M_data->_M_curr_symbol_size = 0;
++	  _M_data->_M_positive_sign = L"";
++	  _M_data->_M_positive_sign_size = 0;
++	  _M_data->_M_negative_sign = L"";
++	  _M_data->_M_negative_sign_size = 0;
++	  _M_data->_M_frac_digits = 0;
++	  _M_data->_M_pos_format = money_base::_S_default_pattern;
++	  _M_data->_M_neg_format = money_base::_S_default_pattern;
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < money_base::_S_end; ++__i)
++	    _M_data->_M_atoms[__i] =
++	      static_cast<wchar_t>(money_base::_S_atoms[__i]);
++	}
++      else
++	{
++	  // Named locale.
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __c_locale __old = __uselocale(__cloc);
++#else
++	  // Switch to named locale so that mbsrtowcs will work.
++	  char* __old = strdup(setlocale(LC_ALL, NULL));
++	  setlocale(LC_ALL, __name);
++#endif
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be monetary
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# else
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
++          union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_MONETARY_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++#endif
++	  _M_data->_M_grouping = __nl_langinfo_l(__MON_GROUPING, __cloc);
++          _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++
++	  const char* __cpossign = __nl_langinfo_l(__POSITIVE_SIGN, __cloc);
++	  const char* __cnegsign = __nl_langinfo_l(__NEGATIVE_SIGN, __cloc);
++	  const char* __ccurr = __nl_langinfo_l(__CURRENCY_SYMBOL, __cloc);
++
++	  wchar_t* __wcs_ps = 0;
++	  wchar_t* __wcs_ns = 0;
++	  const char __nposn = *(__nl_langinfo_l(__N_SIGN_POSN, __cloc));
++	  try
++            {
++              mbstate_t __state;
++              size_t __len;
++              __len = strlen(__cpossign);
++              if (__len)
++                {
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ps = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ps, &__cpossign, __len, &__state);
++		  _M_data->_M_positive_sign = __wcs_ps;
++		}
++	      else
++		_M_data->_M_positive_sign = L"";
++              _M_data->_M_positive_sign_size = wcslen(_M_data->_M_positive_sign);
++
++	      __len = strlen(__cnegsign);
++	      if (!__nposn)
++		_M_data->_M_negative_sign = L"()";
++	      else if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  __wcs_ns = new wchar_t[__len];
++		  mbsrtowcs(__wcs_ns, &__cnegsign, __len, &__state);
++		  _M_data->_M_negative_sign = __wcs_ns;
++		}
++	      else
++		_M_data->_M_negative_sign = L"";
++              _M_data->_M_negative_sign_size = wcslen(_M_data->_M_negative_sign);
++
++	      // _Intl == true.
++	      __len = strlen(__ccurr);
++	      if (__len)
++		{
++		  ++__len;
++		  memset(&__state, 0, sizeof(mbstate_t));
++		  wchar_t* __wcs = new wchar_t[__len];
++		  mbsrtowcs(__wcs, &__ccurr, __len, &__state);
++		  _M_data->_M_curr_symbol = __wcs;
++		}
++	      else
++		_M_data->_M_curr_symbol = L"";
++              _M_data->_M_curr_symbol_size = wcslen(_M_data->_M_curr_symbol);
++	    }
++          catch (...)
++	    {
++	      delete _M_data;
++              _M_data = 0;
++	      delete __wcs_ps;
++	      delete __wcs_ns;
++#ifdef __UCLIBC_HAS_XLOCALE__
++	      __uselocale(__old);
++#else
++	      setlocale(LC_ALL, __old);
++	      free(__old);
++#endif
++              __throw_exception_again;
++	    }
++
++	  _M_data->_M_frac_digits = *(__nl_langinfo_l(__FRAC_DIGITS, __cloc));
++	  char __pprecedes = *(__nl_langinfo_l(__P_CS_PRECEDES, __cloc));
++	  char __pspace = *(__nl_langinfo_l(__P_SEP_BY_SPACE, __cloc));
++	  char __pposn = *(__nl_langinfo_l(__P_SIGN_POSN, __cloc));
++	  _M_data->_M_pos_format = _S_construct_pattern(__pprecedes, __pspace,
++	                                                __pposn);
++	  char __nprecedes = *(__nl_langinfo_l(__N_CS_PRECEDES, __cloc));
++	  char __nspace = *(__nl_langinfo_l(__N_SEP_BY_SPACE, __cloc));
++	  _M_data->_M_neg_format = _S_construct_pattern(__nprecedes, __nspace,
++	                                                __nposn);
++
++#ifdef __UCLIBC_HAS_XLOCALE__
++	  __uselocale(__old);
++#else
++	  setlocale(LC_ALL, __old);
++	  free(__old);
++#endif
++	}
++    }
++
++  template<>
++    moneypunct<wchar_t, true>::~moneypunct()
++    {
++      if (_M_data->_M_positive_sign_size)
++	delete [] _M_data->_M_positive_sign;
++      if (_M_data->_M_negative_sign_size
++          && wcscmp(_M_data->_M_negative_sign, L"()") != 0)
++	delete [] _M_data->_M_negative_sign;
++      if (_M_data->_M_curr_symbol_size)
++	delete [] _M_data->_M_curr_symbol;
++      delete _M_data;
++    }
++
++  template<>
++    moneypunct<wchar_t, false>::~moneypunct()
++    {
++      if (_M_data->_M_positive_sign_size)
++	delete [] _M_data->_M_positive_sign;
++      if (_M_data->_M_negative_sign_size
++          && wcscmp(_M_data->_M_negative_sign, L"()") != 0)
++	delete [] _M_data->_M_negative_sign;
++      if (_M_data->_M_curr_symbol_size)
++	delete [] _M_data->_M_curr_symbol;
++      delete _M_data;
++    }
++#endif
++}
+diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+new file mode 100644
+index 0000000..883ec1a
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -0,0 +1,160 @@
++// std::numpunct implementation details, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.3.1.2  numpunct virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#define _LIBC
++#include <locale>
++#undef _LIBC
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning tailor for stub locale support
++#endif
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  template<>
++    void
++    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __numpunct_cache<char>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_use_grouping = false;
++
++	  _M_data->_M_decimal_point = '.';
++	  _M_data->_M_thousands_sep = ',';
++
++	  for (size_t __i = 0; __i < __num_base::_S_oend; ++__i)
++	    _M_data->_M_atoms_out[__i] = __num_base::_S_atoms_out[__i];
++
++	  for (size_t __j = 0; __j < __num_base::_S_iend; ++__j)
++	    _M_data->_M_atoms_in[__j] = __num_base::_S_atoms_in[__j];
++	}
++      else
++	{
++	  // Named locale.
++	  _M_data->_M_decimal_point = *(__nl_langinfo_l(DECIMAL_POINT,
++							__cloc));
++	  _M_data->_M_thousands_sep = *(__nl_langinfo_l(THOUSANDS_SEP,
++							__cloc));
++
++	  // Check for NULL, which implies no grouping.
++	  if (_M_data->_M_thousands_sep == '\0')
++	    _M_data->_M_grouping = "";
++	  else
++	    _M_data->_M_grouping = __nl_langinfo_l(GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	}
++
++      // NB: There is no way to extact this info from posix locales.
++      // _M_truename = __nl_langinfo_l(YESSTR, __cloc);
++      _M_data->_M_truename = "true";
++      _M_data->_M_truename_size = 4;
++      // _M_falsename = __nl_langinfo_l(NOSTR, __cloc);
++      _M_data->_M_falsename = "false";
++      _M_data->_M_falsename_size = 5;
++    }
++
++  template<>
++    numpunct<char>::~numpunct()
++    { delete _M_data; }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __numpunct_cache<wchar_t>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_data->_M_grouping = "";
++	  _M_data->_M_grouping_size = 0;
++	  _M_data->_M_use_grouping = false;
++
++	  _M_data->_M_decimal_point = L'.';
++	  _M_data->_M_thousands_sep = L',';
++
++	  // Use ctype::widen code without the facet...
++	  for (size_t __i = 0; __i < __num_base::_S_oend; ++__i)
++	    _M_data->_M_atoms_out[__i] =
++	      static_cast<wchar_t>(__num_base::_S_atoms_out[__i]);
++
++	  for (size_t __j = 0; __j < __num_base::_S_iend; ++__j)
++	    _M_data->_M_atoms_in[__j] =
++	      static_cast<wchar_t>(__num_base::_S_atoms_in[__j]);
++	}
++      else
++	{
++	  // Named locale.
++	  // NB: In the GNU model wchar_t is always 32 bit wide.
++	  union { char *__s; wchar_t __w; } __u;
++	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __cloc);
++	  _M_data->_M_decimal_point = __u.__w;
++
++	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __cloc);
++	  _M_data->_M_thousands_sep = __u.__w;
++
++	  if (_M_data->_M_thousands_sep == L'\0')
++	    _M_data->_M_grouping = "";
++	  else
++	    _M_data->_M_grouping = __nl_langinfo_l(GROUPING, __cloc);
++	  _M_data->_M_grouping_size = strlen(_M_data->_M_grouping);
++	}
++
++      // NB: There is no way to extact this info from posix locales.
++      // _M_truename = __nl_langinfo_l(YESSTR, __cloc);
++      _M_data->_M_truename = L"true";
++      _M_data->_M_truename_size = 4;
++      // _M_falsename = __nl_langinfo_l(NOSTR, __cloc);
++      _M_data->_M_falsename = L"false";
++      _M_data->_M_falsename_size = 5;
++    }
++
++  template<>
++    numpunct<wchar_t>::~numpunct()
++    { delete _M_data; }
++ #endif
++}
+diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc b/libstdc++-v3/config/locale/uclibc/time_members.cc
+new file mode 100644
+index 0000000..e0707d7
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -0,0 +1,406 @@
++// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.5.1.2 - time_get virtual functions
++// ISO C++ 14882: 22.2.5.3.2 - time_put virtual functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++#include <locale>
++#include <bits/c++locale_internal.h>
++
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning tailor for stub locale support
++#endif
++#ifndef __UCLIBC_HAS_XLOCALE__
++#define __nl_langinfo_l(N, L)         nl_langinfo((N))
++#endif
++
++namespace std
++{
++  template<>
++    void
++    __timepunct<char>::
++    _M_put(char* __s, size_t __maxlen, const char* __format,
++	   const tm* __tm) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      const size_t __len = __strftime_l(__s, __maxlen, __format, __tm,
++					_M_c_locale_timepunct);
++#else
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_timepunct);
++      const size_t __len = strftime(__s, __maxlen, __format, __tm);
++      setlocale(LC_ALL, __old);
++      free(__old);
++#endif
++      // Make sure __s is null terminated.
++      if (__len == 0)
++	__s[0] = '\0';
++    }
++
++  template<>
++    void
++    __timepunct<char>::_M_initialize_timepunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __timepunct_cache<char>;
++
++      if (!__cloc)
++	{
++	  // "C" locale
++	  _M_c_locale_timepunct = _S_get_c_locale();
++
++	  _M_data->_M_date_format = "%m/%d/%y";
++	  _M_data->_M_date_era_format = "%m/%d/%y";
++	  _M_data->_M_time_format = "%H:%M:%S";
++	  _M_data->_M_time_era_format = "%H:%M:%S";
++	  _M_data->_M_date_time_format = "";
++	  _M_data->_M_date_time_era_format = "";
++	  _M_data->_M_am = "AM";
++	  _M_data->_M_pm = "PM";
++	  _M_data->_M_am_pm_format = "";
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = "Sunday";
++	  _M_data->_M_day2 = "Monday";
++	  _M_data->_M_day3 = "Tuesday";
++	  _M_data->_M_day4 = "Wednesday";
++	  _M_data->_M_day5 = "Thursday";
++	  _M_data->_M_day6 = "Friday";
++	  _M_data->_M_day7 = "Saturday";
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = "Sun";
++	  _M_data->_M_aday2 = "Mon";
++	  _M_data->_M_aday3 = "Tue";
++	  _M_data->_M_aday4 = "Wed";
++	  _M_data->_M_aday5 = "Thu";
++	  _M_data->_M_aday6 = "Fri";
++	  _M_data->_M_aday7 = "Sat";
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = "January";
++	  _M_data->_M_month02 = "February";
++	  _M_data->_M_month03 = "March";
++	  _M_data->_M_month04 = "April";
++	  _M_data->_M_month05 = "May";
++	  _M_data->_M_month06 = "June";
++	  _M_data->_M_month07 = "July";
++	  _M_data->_M_month08 = "August";
++	  _M_data->_M_month09 = "September";
++	  _M_data->_M_month10 = "October";
++	  _M_data->_M_month11 = "November";
++	  _M_data->_M_month12 = "December";
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = "Jan";
++	  _M_data->_M_amonth02 = "Feb";
++	  _M_data->_M_amonth03 = "Mar";
++	  _M_data->_M_amonth04 = "Apr";
++	  _M_data->_M_amonth05 = "May";
++	  _M_data->_M_amonth06 = "Jun";
++	  _M_data->_M_amonth07 = "Jul";
++	  _M_data->_M_amonth08 = "Aug";
++	  _M_data->_M_amonth09 = "Sep";
++	  _M_data->_M_amonth10 = "Oct";
++	  _M_data->_M_amonth11 = "Nov";
++	  _M_data->_M_amonth12 = "Dec";
++	}
++      else
++	{
++	  _M_c_locale_timepunct = _S_clone_c_locale(__cloc);
++
++	  _M_data->_M_date_format = __nl_langinfo_l(D_FMT, __cloc);
++	  _M_data->_M_date_era_format = __nl_langinfo_l(ERA_D_FMT, __cloc);
++	  _M_data->_M_time_format = __nl_langinfo_l(T_FMT, __cloc);
++	  _M_data->_M_time_era_format = __nl_langinfo_l(ERA_T_FMT, __cloc);
++	  _M_data->_M_date_time_format = __nl_langinfo_l(D_T_FMT, __cloc);
++	  _M_data->_M_date_time_era_format = __nl_langinfo_l(ERA_D_T_FMT,
++							     __cloc);
++	  _M_data->_M_am = __nl_langinfo_l(AM_STR, __cloc);
++	  _M_data->_M_pm = __nl_langinfo_l(PM_STR, __cloc);
++	  _M_data->_M_am_pm_format = __nl_langinfo_l(T_FMT_AMPM, __cloc);
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = __nl_langinfo_l(DAY_1, __cloc);
++	  _M_data->_M_day2 = __nl_langinfo_l(DAY_2, __cloc);
++	  _M_data->_M_day3 = __nl_langinfo_l(DAY_3, __cloc);
++	  _M_data->_M_day4 = __nl_langinfo_l(DAY_4, __cloc);
++	  _M_data->_M_day5 = __nl_langinfo_l(DAY_5, __cloc);
++	  _M_data->_M_day6 = __nl_langinfo_l(DAY_6, __cloc);
++	  _M_data->_M_day7 = __nl_langinfo_l(DAY_7, __cloc);
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = __nl_langinfo_l(ABDAY_1, __cloc);
++	  _M_data->_M_aday2 = __nl_langinfo_l(ABDAY_2, __cloc);
++	  _M_data->_M_aday3 = __nl_langinfo_l(ABDAY_3, __cloc);
++	  _M_data->_M_aday4 = __nl_langinfo_l(ABDAY_4, __cloc);
++	  _M_data->_M_aday5 = __nl_langinfo_l(ABDAY_5, __cloc);
++	  _M_data->_M_aday6 = __nl_langinfo_l(ABDAY_6, __cloc);
++	  _M_data->_M_aday7 = __nl_langinfo_l(ABDAY_7, __cloc);
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = __nl_langinfo_l(MON_1, __cloc);
++	  _M_data->_M_month02 = __nl_langinfo_l(MON_2, __cloc);
++	  _M_data->_M_month03 = __nl_langinfo_l(MON_3, __cloc);
++	  _M_data->_M_month04 = __nl_langinfo_l(MON_4, __cloc);
++	  _M_data->_M_month05 = __nl_langinfo_l(MON_5, __cloc);
++	  _M_data->_M_month06 = __nl_langinfo_l(MON_6, __cloc);
++	  _M_data->_M_month07 = __nl_langinfo_l(MON_7, __cloc);
++	  _M_data->_M_month08 = __nl_langinfo_l(MON_8, __cloc);
++	  _M_data->_M_month09 = __nl_langinfo_l(MON_9, __cloc);
++	  _M_data->_M_month10 = __nl_langinfo_l(MON_10, __cloc);
++	  _M_data->_M_month11 = __nl_langinfo_l(MON_11, __cloc);
++	  _M_data->_M_month12 = __nl_langinfo_l(MON_12, __cloc);
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = __nl_langinfo_l(ABMON_1, __cloc);
++	  _M_data->_M_amonth02 = __nl_langinfo_l(ABMON_2, __cloc);
++	  _M_data->_M_amonth03 = __nl_langinfo_l(ABMON_3, __cloc);
++	  _M_data->_M_amonth04 = __nl_langinfo_l(ABMON_4, __cloc);
++	  _M_data->_M_amonth05 = __nl_langinfo_l(ABMON_5, __cloc);
++	  _M_data->_M_amonth06 = __nl_langinfo_l(ABMON_6, __cloc);
++	  _M_data->_M_amonth07 = __nl_langinfo_l(ABMON_7, __cloc);
++	  _M_data->_M_amonth08 = __nl_langinfo_l(ABMON_8, __cloc);
++	  _M_data->_M_amonth09 = __nl_langinfo_l(ABMON_9, __cloc);
++	  _M_data->_M_amonth10 = __nl_langinfo_l(ABMON_10, __cloc);
++	  _M_data->_M_amonth11 = __nl_langinfo_l(ABMON_11, __cloc);
++	  _M_data->_M_amonth12 = __nl_langinfo_l(ABMON_12, __cloc);
++	}
++    }
++
++#ifdef _GLIBCXX_USE_WCHAR_T
++  template<>
++    void
++    __timepunct<wchar_t>::
++    _M_put(wchar_t* __s, size_t __maxlen, const wchar_t* __format,
++	   const tm* __tm) const
++    {
++#ifdef __UCLIBC_HAS_XLOCALE__
++      __wcsftime_l(__s, __maxlen, __format, __tm, _M_c_locale_timepunct);
++      const size_t __len = __wcsftime_l(__s, __maxlen, __format, __tm,
++					_M_c_locale_timepunct);
++#else
++      char* __old = strdup(setlocale(LC_ALL, NULL));
++      setlocale(LC_ALL, _M_name_timepunct);
++      const size_t __len = wcsftime(__s, __maxlen, __format, __tm);
++      setlocale(LC_ALL, __old);
++      free(__old);
++#endif
++      // Make sure __s is null terminated.
++      if (__len == 0)
++	__s[0] = L'\0';
++    }
++
++  template<>
++    void
++    __timepunct<wchar_t>::_M_initialize_timepunct(__c_locale __cloc)
++    {
++      if (!_M_data)
++	_M_data = new __timepunct_cache<wchar_t>;
++
++#warning wide time stuff
++//       if (!__cloc)
++	{
++	  // "C" locale
++	  _M_c_locale_timepunct = _S_get_c_locale();
++
++	  _M_data->_M_date_format = L"%m/%d/%y";
++	  _M_data->_M_date_era_format = L"%m/%d/%y";
++	  _M_data->_M_time_format = L"%H:%M:%S";
++	  _M_data->_M_time_era_format = L"%H:%M:%S";
++	  _M_data->_M_date_time_format = L"";
++	  _M_data->_M_date_time_era_format = L"";
++	  _M_data->_M_am = L"AM";
++	  _M_data->_M_pm = L"PM";
++	  _M_data->_M_am_pm_format = L"";
++
++	  // Day names, starting with "C"'s Sunday.
++	  _M_data->_M_day1 = L"Sunday";
++	  _M_data->_M_day2 = L"Monday";
++	  _M_data->_M_day3 = L"Tuesday";
++	  _M_data->_M_day4 = L"Wednesday";
++	  _M_data->_M_day5 = L"Thursday";
++	  _M_data->_M_day6 = L"Friday";
++	  _M_data->_M_day7 = L"Saturday";
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  _M_data->_M_aday1 = L"Sun";
++	  _M_data->_M_aday2 = L"Mon";
++	  _M_data->_M_aday3 = L"Tue";
++	  _M_data->_M_aday4 = L"Wed";
++	  _M_data->_M_aday5 = L"Thu";
++	  _M_data->_M_aday6 = L"Fri";
++	  _M_data->_M_aday7 = L"Sat";
++
++	  // Month names, starting with "C"'s January.
++	  _M_data->_M_month01 = L"January";
++	  _M_data->_M_month02 = L"February";
++	  _M_data->_M_month03 = L"March";
++	  _M_data->_M_month04 = L"April";
++	  _M_data->_M_month05 = L"May";
++	  _M_data->_M_month06 = L"June";
++	  _M_data->_M_month07 = L"July";
++	  _M_data->_M_month08 = L"August";
++	  _M_data->_M_month09 = L"September";
++	  _M_data->_M_month10 = L"October";
++	  _M_data->_M_month11 = L"November";
++	  _M_data->_M_month12 = L"December";
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  _M_data->_M_amonth01 = L"Jan";
++	  _M_data->_M_amonth02 = L"Feb";
++	  _M_data->_M_amonth03 = L"Mar";
++	  _M_data->_M_amonth04 = L"Apr";
++	  _M_data->_M_amonth05 = L"May";
++	  _M_data->_M_amonth06 = L"Jun";
++	  _M_data->_M_amonth07 = L"Jul";
++	  _M_data->_M_amonth08 = L"Aug";
++	  _M_data->_M_amonth09 = L"Sep";
++	  _M_data->_M_amonth10 = L"Oct";
++	  _M_data->_M_amonth11 = L"Nov";
++	  _M_data->_M_amonth12 = L"Dec";
++	}
++#if 0
++      else
++	{
++	  _M_c_locale_timepunct = _S_clone_c_locale(__cloc);
++
++	  union { char *__s; wchar_t *__w; } __u;
++
++	  __u.__s = __nl_langinfo_l(_NL_WD_FMT, __cloc);
++	  _M_data->_M_date_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_D_FMT, __cloc);
++	  _M_data->_M_date_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WT_FMT, __cloc);
++	  _M_data->_M_time_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_T_FMT, __cloc);
++	  _M_data->_M_time_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WD_T_FMT, __cloc);
++	  _M_data->_M_date_time_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WERA_D_T_FMT, __cloc);
++	  _M_data->_M_date_time_era_format = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WAM_STR, __cloc);
++	  _M_data->_M_am = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WPM_STR, __cloc);
++	  _M_data->_M_pm = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WT_FMT_AMPM, __cloc);
++	  _M_data->_M_am_pm_format = __u.__w;
++
++	  // Day names, starting with "C"'s Sunday.
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_1, __cloc);
++	  _M_data->_M_day1 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_2, __cloc);
++	  _M_data->_M_day2 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_3, __cloc);
++	  _M_data->_M_day3 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_4, __cloc);
++	  _M_data->_M_day4 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_5, __cloc);
++	  _M_data->_M_day5 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_6, __cloc);
++	  _M_data->_M_day6 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WDAY_7, __cloc);
++	  _M_data->_M_day7 = __u.__w;
++
++	  // Abbreviated day names, starting with "C"'s Sun.
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_1, __cloc);
++	  _M_data->_M_aday1 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_2, __cloc);
++	  _M_data->_M_aday2 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_3, __cloc);
++	  _M_data->_M_aday3 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_4, __cloc);
++	  _M_data->_M_aday4 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_5, __cloc);
++	  _M_data->_M_aday5 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_6, __cloc);
++	  _M_data->_M_aday6 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABDAY_7, __cloc);
++	  _M_data->_M_aday7 = __u.__w;
++
++	  // Month names, starting with "C"'s January.
++	  __u.__s = __nl_langinfo_l(_NL_WMON_1, __cloc);
++	  _M_data->_M_month01 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_2, __cloc);
++	  _M_data->_M_month02 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_3, __cloc);
++	  _M_data->_M_month03 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_4, __cloc);
++	  _M_data->_M_month04 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_5, __cloc);
++	  _M_data->_M_month05 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_6, __cloc);
++	  _M_data->_M_month06 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_7, __cloc);
++	  _M_data->_M_month07 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_8, __cloc);
++	  _M_data->_M_month08 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_9, __cloc);
++	  _M_data->_M_month09 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_10, __cloc);
++	  _M_data->_M_month10 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_11, __cloc);
++	  _M_data->_M_month11 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WMON_12, __cloc);
++	  _M_data->_M_month12 = __u.__w;
++
++	  // Abbreviated month names, starting with "C"'s Jan.
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_1, __cloc);
++	  _M_data->_M_amonth01 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_2, __cloc);
++	  _M_data->_M_amonth02 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_3, __cloc);
++	  _M_data->_M_amonth03 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_4, __cloc);
++	  _M_data->_M_amonth04 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_5, __cloc);
++	  _M_data->_M_amonth05 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_6, __cloc);
++	  _M_data->_M_amonth06 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_7, __cloc);
++	  _M_data->_M_amonth07 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_8, __cloc);
++	  _M_data->_M_amonth08 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_9, __cloc);
++	  _M_data->_M_amonth09 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_10, __cloc);
++	  _M_data->_M_amonth10 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_11, __cloc);
++	  _M_data->_M_amonth11 = __u.__w;
++	  __u.__s = __nl_langinfo_l(_NL_WABMON_12, __cloc);
++	  _M_data->_M_amonth12 = __u.__w;
++	}
++#endif // 0
++    }
++#endif
++}
+diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h b/libstdc++-v3/config/locale/uclibc/time_members.h
+new file mode 100644
+index 0000000..ba8e858
+--- /dev/null
++++ b/libstdc++-v3/config/locale/uclibc/time_members.h
+@@ -0,0 +1,68 @@
++// std::time_get, std::time_put implementation, GNU version -*- C++ -*-
++
++// Copyright (C) 2001, 2002, 2003, 2004 Free Software Foundation, Inc.
++//
++// This file is part of the GNU ISO C++ Library.  This library is free
++// software; you can redistribute it and/or modify it under the
++// terms of the GNU General Public License as published by the
++// Free Software Foundation; either version 2, or (at your option)
++// any later version.
++
++// This library is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++
++// You should have received a copy of the GNU General Public License along
++// with this library; see the file COPYING.  If not, write to the Free
++// Software Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307,
++// USA.
++
++// As a special exception, you may use this file as part of a free software
++// library without restriction.  Specifically, if other files instantiate
++// templates or use macros or inline functions from this file, or you compile
++// this file and link it with other files to produce an executable, this
++// file does not by itself cause the resulting executable to be covered by
++// the GNU General Public License.  This exception does not however
++// invalidate any other reasons why the executable file might be covered by
++// the GNU General Public License.
++
++//
++// ISO C++ 14882: 22.2.5.1.2 - time_get functions
++// ISO C++ 14882: 22.2.5.3.2 - time_put functions
++//
++
++// Written by Benjamin Kosnik <bkoz@redhat.com>
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(size_t __refs)
++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(_S_get_c_name())
++    { _M_initialize_timepunct(); }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(__cache_type* __cache, size_t __refs)
++    : facet(__refs), _M_data(__cache), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(_S_get_c_name())
++    { _M_initialize_timepunct(); }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s,
++				     size_t __refs)
++    : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
++    _M_name_timepunct(__s)
++    {
++      char* __tmp = new char[std::strlen(__s) + 1];
++      std::strcpy(__tmp, __s);
++      _M_name_timepunct = __tmp;
++      _M_initialize_timepunct(__cloc);
++    }
++
++  template<typename _CharT>
++    __timepunct<_CharT>::~__timepunct()
++    {
++      if (_M_name_timepunct != _S_get_c_name())
++	delete [] _M_name_timepunct;
++      delete _M_data;
++      _S_destroy_c_locale(_M_c_locale_timepunct);
++    }
+diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
+index 41797a9..8a5481c 100755
+--- a/libstdc++-v3/configure
++++ b/libstdc++-v3/configure
+@@ -15830,6 +15830,9 @@ fi
+   # Default to "generic".
+   if test $enable_clocale_flag = auto; then
+     case ${target_os} in
++      *-uclibc*)
++        enable_clocale_flag=uclibc
++        ;;
+       linux* | gnu* | kfreebsd*-gnu | knetbsd*-gnu)
+ 	enable_clocale_flag=gnu
+ 	;;
+@@ -16108,6 +16111,78 @@ $as_echo "newlib" >&6; }
+       CTIME_CC=config/locale/generic/time_members.cc
+       CLOCALE_INTERNAL_H=config/locale/generic/c++locale_internal.h
+       ;;
++    uclibc)
++      { $as_echo "$as_me:${as_lineno-$LINENO}: result: uclibc" >&5
++$as_echo "uclibc" >&6; }
++
++      # Declare intention to use gettext, and add support for specific
++      # languages.
++      # For some reason, ALL_LINGUAS has to be before AM-GNU-GETTEXT
++      ALL_LINGUAS="de fr"
++
++      # Don't call AM-GNU-GETTEXT here. Instead, assume glibc.
++      # Extract the first word of "msgfmt", so it can be a program name with args.
++set dummy msgfmt; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if test "${ac_cv_prog_check_msgfmt+set}" = set; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$check_msgfmt"; then
++  ac_cv_prog_check_msgfmt="$check_msgfmt" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
++    ac_cv_prog_check_msgfmt="yes"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++  test -z "$ac_cv_prog_check_msgfmt" && ac_cv_prog_check_msgfmt="no"
++fi
++fi
++check_msgfmt=$ac_cv_prog_check_msgfmt
++if test -n "$check_msgfmt"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $check_msgfmt" >&5
++$as_echo "$check_msgfmt" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++
++      if test x"$check_msgfmt" = x"yes" && test x"$enable_nls" = x"yes"; then
++        USE_NLS=yes
++      fi
++      # Export the build objects.
++      for ling in $ALL_LINGUAS; do \
++        glibcxx_MOFILES="$glibcxx_MOFILES $ling.mo"; \
++        glibcxx_POFILES="$glibcxx_POFILES $ling.po"; \
++      done
++
++
++
++      CLOCALE_H=config/locale/uclibc/c_locale.h
++      CLOCALE_CC=config/locale/uclibc/c_locale.cc
++      CCODECVT_CC=config/locale/uclibc/codecvt_members.cc
++      CCOLLATE_CC=config/locale/uclibc/collate_members.cc
++      CCTYPE_CC=config/locale/uclibc/ctype_members.cc
++      CMESSAGES_H=config/locale/uclibc/messages_members.h
++      CMESSAGES_CC=config/locale/uclibc/messages_members.cc
++      CMONEY_CC=config/locale/uclibc/monetary_members.cc
++      CNUMERIC_CC=config/locale/uclibc/numeric_members.cc
++      CTIME_H=config/locale/uclibc/time_members.h
++      CTIME_CC=config/locale/uclibc/time_members.cc
++      CLOCALE_INTERNAL_H=config/locale/uclibc/c++locale_internal.h
++      ;;
+   esac
+ 
+   # This is where the testsuite looks for locale catalogs, using the
+diff --git a/libstdc++-v3/include/c_compatibility/wchar.h b/libstdc++-v3/include/c_compatibility/wchar.h
+index 55a0b52..7d8bb15 100644
+--- a/libstdc++-v3/include/c_compatibility/wchar.h
++++ b/libstdc++-v3/include/c_compatibility/wchar.h
+@@ -101,7 +101,9 @@ using std::wmemcmp;
+ using std::wmemcpy;
+ using std::wmemmove;
+ using std::wmemset;
++#if _GLIBCXX_HAVE_WCSFTIME
+ using std::wcsftime;
++#endif
+ 
+ #if _GLIBCXX_USE_C99_WCHAR
+ using std::wcstold;
+diff --git a/libstdc++-v3/include/c_std/cwchar b/libstdc++-v3/include/c_std/cwchar
+index dc4cef02..256d126 100644
+--- a/libstdc++-v3/include/c_std/cwchar
++++ b/libstdc++-v3/include/c_std/cwchar
+@@ -175,7 +175,9 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+   using ::wcscoll;
+   using ::wcscpy;
+   using ::wcscspn;
++#if _GLIBCXX_HAVE_WCSFTIME
+   using ::wcsftime;
++#endif
+   using ::wcslen;
+   using ::wcsncat;
+   using ::wcsncmp;
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0005-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-6.1/0005-uclibc-locale-no__x.patch
new file mode 100644
index 0000000..3275016
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0005-uclibc-locale-no__x.patch
@@ -0,0 +1,257 @@
+From c01c14e8e9be382ecd4121ee70f5003b4cb0f904 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:42:36 +0400
+Subject: [PATCH 05/46] uclibc-locale-no__x
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ .../config/locale/uclibc/c++locale_internal.h      | 45 ++++++++++++++++++++++
+ libstdc++-v3/config/locale/uclibc/c_locale.cc      | 14 -------
+ libstdc++-v3/config/locale/uclibc/c_locale.h       |  1 +
+ .../config/locale/uclibc/collate_members.cc        |  7 ----
+ libstdc++-v3/config/locale/uclibc/ctype_members.cc |  7 ----
+ .../config/locale/uclibc/messages_members.cc       |  7 +---
+ .../config/locale/uclibc/messages_members.h        | 18 ++++-----
+ .../config/locale/uclibc/monetary_members.cc       |  4 --
+ .../config/locale/uclibc/numeric_members.cc        |  3 --
+ libstdc++-v3/config/locale/uclibc/time_members.cc  |  3 --
+ 10 files changed, 55 insertions(+), 54 deletions(-)
+
+diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+index 2ae3e4a..e74fddf 100644
+--- a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
++++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -60,4 +60,49 @@ extern "C" __typeof(wcsxfrm_l) __wcsxfrm_l;
+ extern "C" __typeof(wctype_l) __wctype_l;
+ #endif
+ 
++# define __nl_langinfo_l nl_langinfo_l
++# define __strcoll_l strcoll_l
++# define __strftime_l strftime_l
++# define __strtod_l strtod_l
++# define __strtof_l strtof_l
++# define __strtold_l strtold_l
++# define __strxfrm_l strxfrm_l
++# define __newlocale newlocale
++# define __freelocale freelocale
++# define __duplocale duplocale
++# define __uselocale uselocale
++
++# ifdef _GLIBCXX_USE_WCHAR_T
++#  define __iswctype_l iswctype_l
++#  define __towlower_l towlower_l
++#  define __towupper_l towupper_l
++#  define __wcscoll_l wcscoll_l
++#  define __wcsftime_l wcsftime_l
++#  define __wcsxfrm_l wcsxfrm_l
++#  define __wctype_l wctype_l
++# endif
++
++#else
++# define __nl_langinfo_l(N, L)       nl_langinfo((N))
++# define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
++# define __strtod_l(S, E, L)         strtod((S), (E))
++# define __strtof_l(S, E, L)         strtof((S), (E))
++# define __strtold_l(S, E, L)        strtold((S), (E))
++# define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
++# warning should dummy __newlocale check for C|POSIX ?
++# define __newlocale(a, b, c)        NULL
++# define __freelocale(a)             ((void)0)
++# define __duplocale(a)              __c_locale()
++//# define __uselocale ?
++//
++# ifdef _GLIBCXX_USE_WCHAR_T
++#  define __iswctype_l(C, M, L)       iswctype((C), (M))
++#  define __towlower_l(C, L)          towlower((C))
++#  define __towupper_l(C, L)          towupper((C))
++#  define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
++//#  define __wcsftime_l(S, M, F, T, L)  wcsftime((S), (M), (F), (T))
++#  define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
++#  define __wctype_l(S, L)            wctype((S))
++# endif
++
+ #endif // GLIBC 2.3 and later
+diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc b/libstdc++-v3/config/locale/uclibc/c_locale.cc
+index 5081dc1..21430d0 100644
+--- a/libstdc++-v3/config/locale/uclibc/c_locale.cc
++++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -39,20 +39,6 @@
+ #include <langinfo.h>
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __strtol_l(S, E, B, L)      strtol((S), (E), (B))
+-#define __strtoul_l(S, E, B, L)     strtoul((S), (E), (B))
+-#define __strtoll_l(S, E, B, L)     strtoll((S), (E), (B))
+-#define __strtoull_l(S, E, B, L)    strtoull((S), (E), (B))
+-#define __strtof_l(S, E, L)         strtof((S), (E))
+-#define __strtod_l(S, E, L)         strtod((S), (E))
+-#define __strtold_l(S, E, L)        strtold((S), (E))
+-#warning should dummy __newlocale check for C|POSIX ?
+-#define __newlocale(a, b, c)        NULL
+-#define __freelocale(a)             ((void)0)
+-#define __duplocale(a)              __c_locale()
+-#endif
+-
+ namespace std
+ {
+   template<>
+diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h b/libstdc++-v3/config/locale/uclibc/c_locale.h
+index da07c1f..4bca5f1 100644
+--- a/libstdc++-v3/config/locale/uclibc/c_locale.h
++++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -68,6 +68,7 @@ namespace __gnu_cxx
+ {
+   extern "C" __typeof(uselocale) __uselocale;
+ }
++#define __uselocale uselocale
+ #endif
+ 
+ namespace std
+diff --git a/libstdc++-v3/config/locale/uclibc/collate_members.cc b/libstdc++-v3/config/locale/uclibc/collate_members.cc
+index c2664a7..ec5c329 100644
+--- a/libstdc++-v3/config/locale/uclibc/collate_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/collate_members.cc
+@@ -36,13 +36,6 @@
+ #include <locale>
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __strcoll_l(S1, S2, L)      strcoll((S1), (S2))
+-#define __strxfrm_l(S1, S2, N, L)   strxfrm((S1), (S2), (N))
+-#define __wcscoll_l(S1, S2, L)      wcscoll((S1), (S2))
+-#define __wcsxfrm_l(S1, S2, N, L)   wcsxfrm((S1), (S2), (N))
+-#endif
+-
+ namespace std
+ {
+   // These are basically extensions to char_traits, and perhaps should
+diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+index 7294e3a..7b12861 100644
+--- a/libstdc++-v3/config/locale/uclibc/ctype_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -38,13 +38,6 @@
+ #undef _LIBC
+ #include <bits/c++locale_internal.h>
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __wctype_l(S, L)           wctype((S))
+-#define __towupper_l(C, L)         towupper((C))
+-#define __towlower_l(C, L)         towlower((C))
+-#define __iswctype_l(C, M, L)      iswctype((C), (M))
+-#endif
+-
+ namespace std
+ {
+   // NB: The other ctype<char> specializations are in src/locale.cc and
+diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.cc b/libstdc++-v3/config/locale/uclibc/messages_members.cc
+index 13594d9..d7693b4 100644
+--- a/libstdc++-v3/config/locale/uclibc/messages_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/messages_members.cc
+@@ -39,13 +39,10 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix gettext stuff
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-extern "C" char *__dcgettext(const char *domainname,
+-			     const char *msgid, int category);
+ #undef gettext
+-#define gettext(msgid) __dcgettext(NULL, msgid, LC_MESSAGES)
++#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#define gettext(msgid) dcgettext(NULL, msgid, LC_MESSAGES)
+ #else
+-#undef gettext
+ #define gettext(msgid) (msgid)
+ #endif
+ 
+diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h b/libstdc++-v3/config/locale/uclibc/messages_members.h
+index 1424078..d89da33 100644
+--- a/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -36,15 +36,11 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix prototypes for *textdomain funcs
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-extern "C" char *__textdomain(const char *domainname);
+-extern "C" char *__bindtextdomain(const char *domainname,
+-				  const char *dirname);
+-#else
+-#undef __textdomain
+-#undef __bindtextdomain
+-#define __textdomain(D)           ((void)0)
+-#define __bindtextdomain(D,P)     ((void)0)
++#ifndef __UCLIBC_HAS_GETTEXT_AWARENESS__
++#undef textdomain
++#undef bindtextdomain
++#define textdomain(D)           ((void)0)
++#define bindtextdomain(D,P)     ((void)0)
+ #endif
+ 
+   // Non-virtual member functions.
+@@ -70,7 +66,7 @@ extern "C" char *__bindtextdomain(const char *domainname,
+     messages<_CharT>::open(const basic_string<char>& __s, const locale& __loc,
+ 			   const char* __dir) const
+     {
+-      __bindtextdomain(__s.c_str(), __dir);
++      bindtextdomain(__s.c_str(), __dir);
+       return this->do_open(__s, __loc);
+     }
+ 
+@@ -90,7 +86,7 @@ extern "C" char *__bindtextdomain(const char *domainname,
+     {
+       // No error checking is done, assume the catalog exists and can
+       // be used.
+-      __textdomain(__s.c_str());
++      textdomain(__s.c_str());
+       return 0;
+     }
+ 
+diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+index aa52731..2e6f80a 100644
+--- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -43,10 +43,6 @@
+ #warning tailor for stub locale support
+ #endif
+ 
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+-
+ namespace std
+ {
+   // Construct and return valid pattern consisting of some combination of:
+diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+index 883ec1a..2c70642 100644
+--- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -41,9 +41,6 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning tailor for stub locale support
+ #endif
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+ 
+ namespace std
+ {
+diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc b/libstdc++-v3/config/locale/uclibc/time_members.cc
+index e0707d7..d848ed5 100644
+--- a/libstdc++-v3/config/locale/uclibc/time_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -40,9 +40,6 @@
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning tailor for stub locale support
+ #endif
+-#ifndef __UCLIBC_HAS_XLOCALE__
+-#define __nl_langinfo_l(N, L)         nl_langinfo((N))
+-#endif
+ 
+ namespace std
+ {
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0006-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-6.1/0006-uclibc-locale-wchar_fix.patch
new file mode 100644
index 0000000..e45a482
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0006-uclibc-locale-wchar_fix.patch
@@ -0,0 +1,68 @@
+From e7a4760fb40008cae33e6fc7dc4cfef6c2fd5f93 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:45:57 +0400
+Subject: [PATCH 06/46] uclibc-locale-wchar_fix
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ libstdc++-v3/config/locale/uclibc/monetary_members.cc |  4 ++--
+ libstdc++-v3/config/locale/uclibc/numeric_members.cc  | 13 +++++++++++++
+ 2 files changed, 15 insertions(+), 2 deletions(-)
+
+diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+index 2e6f80a..31ebb9f 100644
+--- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -401,7 +401,7 @@ namespace std
+ # ifdef __UCLIBC_HAS_XLOCALE__
+ 	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
+-# else
++# elif defined __UCLIBC_HAS_LOCALE__
+ 	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
+ # endif
+@@ -556,7 +556,7 @@ namespace std
+ # ifdef __UCLIBC_HAS_XLOCALE__
+ 	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
+-# else
++# elif defined __UCLIBC_HAS_LOCALE__
+ 	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
+ 	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
+ # endif
+diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+index 2c70642..d5c8961 100644
+--- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -127,12 +127,25 @@ namespace std
+ 	{
+ 	  // Named locale.
+ 	  // NB: In the GNU model wchar_t is always 32 bit wide.
++#ifdef __UCLIBC_MJN3_ONLY__
++#warning fix this... should be numeric
++#endif
++#ifdef __UCLIBC__
++# ifdef __UCLIBC_HAS_XLOCALE__
++	  _M_data->_M_decimal_point = __cloc->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __cloc->thousands_sep_wc;
++# elif defined __UCLIBC_HAS_LOCALE__
++	  _M_data->_M_decimal_point = __global_locale->decimal_point_wc;
++	  _M_data->_M_thousands_sep = __global_locale->thousands_sep_wc;
++# endif
++#else
+ 	  union { char *__s; wchar_t __w; } __u;
+ 	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_DECIMAL_POINT_WC, __cloc);
+ 	  _M_data->_M_decimal_point = __u.__w;
+ 
+ 	  __u.__s = __nl_langinfo_l(_NL_NUMERIC_THOUSANDS_SEP_WC, __cloc);
+ 	  _M_data->_M_thousands_sep = __u.__w;
++#endif
+ 
+ 	  if (_M_data->_M_thousands_sep == L'\0')
+ 	    _M_data->_M_grouping = "";
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0007-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-6.1/0007-uclibc-locale-update.patch
new file mode 100644
index 0000000..b73e591
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0007-uclibc-locale-update.patch
@@ -0,0 +1,542 @@
+From 8d53a38a3038104e6830ecea5e4beadce54457c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:46:58 +0400
+Subject: [PATCH 07/46] uclibc-locale-update
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ .../config/locale/uclibc/c++locale_internal.h      |  3 +
+ libstdc++-v3/config/locale/uclibc/c_locale.cc      | 74 ++++++++++------------
+ libstdc++-v3/config/locale/uclibc/c_locale.h       | 42 ++++++------
+ libstdc++-v3/config/locale/uclibc/ctype_members.cc | 51 +++++++++++----
+ .../config/locale/uclibc/messages_members.h        | 12 ++--
+ .../config/locale/uclibc/monetary_members.cc       | 34 ++++++----
+ .../config/locale/uclibc/numeric_members.cc        |  5 ++
+ libstdc++-v3/config/locale/uclibc/time_members.cc  | 18 ++++--
+ libstdc++-v3/config/locale/uclibc/time_members.h   | 17 +++--
+ 9 files changed, 158 insertions(+), 98 deletions(-)
+
+diff --git a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+index e74fddf..971a6b4 100644
+--- a/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
++++ b/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
+@@ -31,6 +31,9 @@
+ 
+ #include <bits/c++config.h>
+ #include <clocale>
++#include <cstdlib>
++#include <cstring>
++#include <cstddef>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning clean this up
+diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.cc b/libstdc++-v3/config/locale/uclibc/c_locale.cc
+index 21430d0..1b9d8e1 100644
+--- a/libstdc++-v3/config/locale/uclibc/c_locale.cc
++++ b/libstdc++-v3/config/locale/uclibc/c_locale.cc
+@@ -39,23 +39,20 @@
+ #include <langinfo.h>
+ #include <bits/c++locale_internal.h>
+ 
+-namespace std
+-{
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   template<>
+     void
+     __convert_to_v(const char* __s, float& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  float __f = __strtof_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __f;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      float __f = __strtof_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __f;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   template<>
+@@ -63,16 +60,13 @@ namespace std
+     __convert_to_v(const char* __s, double& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  double __d = __strtod_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __d;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      double __d = __strtod_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __d;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   template<>
+@@ -80,16 +74,13 @@ namespace std
+     __convert_to_v(const char* __s, long double& __v, ios_base::iostate& __err,
+ 		   const __c_locale& __cloc)
+     {
+-      if (!(__err & ios_base::failbit))
+-	{
+-	  char* __sanity;
+-	  errno = 0;
+-	  long double __ld = __strtold_l(__s, &__sanity, __cloc);
+-          if (__sanity != __s && errno != ERANGE)
+-	    __v = __ld;
+-	  else
+-	    __err |= ios_base::failbit;
+-	}
++      char* __sanity;
++      errno = 0;
++      long double __ld = __strtold_l(__s, &__sanity, __cloc);
++      if (__sanity != __s && errno != ERANGE)
++	__v = __ld;
++      else
++	__err |= ios_base::failbit;
+     }
+ 
+   void
+@@ -110,17 +101,18 @@ namespace std
+   void
+   locale::facet::_S_destroy_c_locale(__c_locale& __cloc)
+   {
+-    if (_S_get_c_locale() != __cloc)
++    if (__cloc && _S_get_c_locale() != __cloc)
+       __freelocale(__cloc);
+   }
+ 
+   __c_locale
+   locale::facet::_S_clone_c_locale(__c_locale& __cloc)
+   { return __duplocale(__cloc); }
+-} // namespace std
+ 
+-namespace __gnu_cxx
+-{
++_GLIBCXX_END_NAMESPACE
++
++_GLIBCXX_BEGIN_NAMESPACE(__gnu_cxx)
++
+   const char* const category_names[6 + _GLIBCXX_NUM_CATEGORIES] =
+     {
+       "LC_CTYPE",
+@@ -138,9 +130,11 @@ namespace __gnu_cxx
+       "LC_IDENTIFICATION"
+ #endif
+     };
+-}
+ 
+-namespace std
+-{
++_GLIBCXX_END_NAMESPACE
++
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   const char* const* const locale::_S_categories = __gnu_cxx::category_names;
+-}  // namespace std
++
++_GLIBCXX_END_NAMESPACE
+diff --git a/libstdc++-v3/config/locale/uclibc/c_locale.h b/libstdc++-v3/config/locale/uclibc/c_locale.h
+index 4bca5f1..64a6d46 100644
+--- a/libstdc++-v3/config/locale/uclibc/c_locale.h
++++ b/libstdc++-v3/config/locale/uclibc/c_locale.h
+@@ -39,21 +39,23 @@
+ #pragma GCC system_header
+ 
+ #include <cstring>              // get std::strlen
+-#include <cstdio>               // get std::snprintf or std::sprintf
++#include <cstdio>               // get std::vsnprintf or std::vsprintf
+ #include <clocale>
+ #include <langinfo.h>		// For codecvt
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix this
+ #endif
+-#ifdef __UCLIBC_HAS_LOCALE__
++#ifdef _GLIBCXX_USE_ICONV
+ #include <iconv.h>		// For codecvt using iconv, iconv_t
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-#include <libintl.h> 		// For messages
++#ifdef HAVE_LIBINTL_H
++#include <libintl.h>		// For messages
+ #endif
++#include <cstdarg>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning what is _GLIBCXX_C_LOCALE_GNU for
++// psm: used in os/gnu-linux/ctype_noninline.h
+ #endif
+ #define _GLIBCXX_C_LOCALE_GNU 1
+ 
+@@ -78,23 +80,25 @@ namespace std
+ #else
+   typedef int*			__c_locale;
+ #endif
+-
+-  // Convert numeric value of type _Tv to string and return length of
+-  // string.  If snprintf is available use it, otherwise fall back to
+-  // the unsafe sprintf which, in general, can be dangerous and should
++  // Convert numeric value of type double to string and return length of
++  // string.  If vsnprintf is available use it, otherwise fall back to
++  // the unsafe vsprintf which, in general, can be dangerous and should
+   // be avoided.
+-  template<typename _Tv>
+-    int
+-    __convert_from_v(char* __out,
+-		     const int __size __attribute__ ((__unused__)),
+-		     const char* __fmt,
+-#ifdef __UCLIBC_HAS_XCLOCALE__
+-		     _Tv __v, const __c_locale& __cloc, int __prec)
++    inline int
++    __convert_from_v(const __c_locale&
++#ifndef __UCLIBC_HAS_XCLOCALE__
++	__cloc __attribute__ ((__unused__))
++#endif
++		     ,
++		     char* __out,
++		     const int __size,
++		     const char* __fmt, ...)
+     {
++      va_list __args;
++#ifdef __UCLIBC_HAS_XCLOCALE__
++
+       __c_locale __old = __gnu_cxx::__uselocale(__cloc);
+ #else
+-		     _Tv __v, const __c_locale&, int __prec)
+-    {
+ # ifdef __UCLIBC_HAS_LOCALE__
+       char* __old = std::setlocale(LC_ALL, NULL);
+       char* __sav = new char[std::strlen(__old) + 1];
+@@ -103,7 +107,9 @@ namespace std
+ # endif
+ #endif
+ 
+-      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
++      va_start(__args, __fmt);
++      const int __ret = std::vsnprintf(__out, __size, __fmt, __args);
++      va_end(__args);
+ 
+ #ifdef __UCLIBC_HAS_XCLOCALE__
+       __gnu_cxx::__uselocale(__old);
+diff --git a/libstdc++-v3/config/locale/uclibc/ctype_members.cc b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+index 7b12861..13e011d 100644
+--- a/libstdc++-v3/config/locale/uclibc/ctype_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/ctype_members.cc
+@@ -33,16 +33,20 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+-namespace std
+-{
++_GLIBCXX_BEGIN_NAMESPACE(std)
++
+   // NB: The other ctype<char> specializations are in src/locale.cc and
+   // various /config/os/* files.
+-  template<>
+     ctype_byname<char>::ctype_byname(const char* __s, size_t __refs)
+     : ctype<char>(0, false, __refs)
+     {
+@@ -57,6 +61,8 @@ namespace std
+ #endif
+ 	}
+     }
++    ctype_byname<char>::~ctype_byname()
++    { }
+ 
+ #ifdef _GLIBCXX_USE_WCHAR_T
+   ctype<wchar_t>::__wmask_type
+@@ -138,17 +144,33 @@ namespace std
+   ctype<wchar_t>::
+   do_is(mask __m, wchar_t __c) const
+   {
+-    // Highest bitmask in ctype_base == 10, but extra in "C"
+-    // library for blank.
++    // The case of __m == ctype_base::space is particularly important,
++    // due to its use in many istream functions.  Therefore we deal with
++    // it first, exploiting the knowledge that on GNU systems _M_bit[5]
++    // is the mask corresponding to ctype_base::space.  NB: an encoding
++    // change would not affect correctness!
++
+     bool __ret = false;
+-    const size_t __bitmasksize = 11;
+-    for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
+-      if (__m & _M_bit[__bitcur]
+-	  && __iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
+-	{
+-	  __ret = true;
+-	  break;
+-	}
++    if (__m == _M_bit[5])
++      __ret = __iswctype_l(__c, _M_wmask[5], _M_c_locale_ctype);
++    else
++      {
++	// Highest bitmask in ctype_base == 10, but extra in "C"
++	// library for blank.
++	const size_t __bitmasksize = 11;
++	for (size_t __bitcur = 0; __bitcur <= __bitmasksize; ++__bitcur)
++	  if (__m & _M_bit[__bitcur])
++	    {
++	      if (__iswctype_l(__c, _M_wmask[__bitcur], _M_c_locale_ctype))
++		{
++		  __ret = true;
++		  break;
++		}
++	      else if (__m == _M_bit[__bitcur])
++		break;
++	    }
++      }
++
+     return __ret;
+   }
+ 
+@@ -290,4 +312,5 @@ namespace std
+ #endif
+   }
+ #endif //  _GLIBCXX_USE_WCHAR_T
+-}
++
++_GLIBCXX_END_NAMESPACE
+diff --git a/libstdc++-v3/config/locale/uclibc/messages_members.h b/libstdc++-v3/config/locale/uclibc/messages_members.h
+index d89da33..067657a 100644
+--- a/libstdc++-v3/config/locale/uclibc/messages_members.h
++++ b/libstdc++-v3/config/locale/uclibc/messages_members.h
+@@ -53,12 +53,16 @@
+   template<typename _CharT>
+      messages<_CharT>::messages(__c_locale __cloc, const char* __s,
+ 				size_t __refs)
+-     : facet(__refs), _M_c_locale_messages(_S_clone_c_locale(__cloc)),
+-     _M_name_messages(__s)
++     : facet(__refs), _M_c_locale_messages(NULL),
++     _M_name_messages(NULL)
+      {
+-       char* __tmp = new char[std::strlen(__s) + 1];
+-       std::strcpy(__tmp, __s);
++       const size_t __len = std::strlen(__s) + 1;
++       char* __tmp = new char[__len];
++       std::memcpy(__tmp, __s, __len);
+        _M_name_messages = __tmp;
++
++       // Last to avoid leaking memory if new throws.
++       _M_c_locale_messages = _S_clone_c_locale(__cloc);
+      }
+ 
+   template<typename _CharT>
+diff --git a/libstdc++-v3/config/locale/uclibc/monetary_members.cc b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+index 31ebb9f..7679b9c 100644
+--- a/libstdc++-v3/config/locale/uclibc/monetary_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/monetary_members.cc
+@@ -33,9 +33,14 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+@@ -206,7 +211,7 @@ namespace std
+ 	  }
+ 	break;
+       default:
+-	;
++	__ret = pattern();
+       }
+     return __ret;
+   }
+@@ -390,7 +395,9 @@ namespace std
+ 	  __c_locale __old = __uselocale(__cloc);
+ #else
+ 	  // Switch to named locale so that mbsrtowcs will work.
+-	  char* __old = strdup(setlocale(LC_ALL, NULL));
++  	  char* __old = setlocale(LC_ALL, NULL);
++          const size_t __llen = strlen(__old) + 1;
++          char* __sav = new char[__llen];
+ 	  setlocale(LC_ALL, __name);
+ #endif
+ 
+@@ -477,8 +484,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	      __uselocale(__old);
+ #else
+-	      setlocale(LC_ALL, __old);
+-	      free(__old);
++	      setlocale(LC_ALL, __sav);
++	      delete [] __sav;
+ #endif
+ 	      __throw_exception_again;
+ 	    }
+@@ -498,8 +505,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	  __uselocale(__old);
+ #else
+-	  setlocale(LC_ALL, __old);
+-	  free(__old);
++	  setlocale(LC_ALL, __sav);
++	  delete [] __sav;
+ #endif
+ 	}
+     }
+@@ -545,8 +552,11 @@ namespace std
+ 	  __c_locale __old = __uselocale(__cloc);
+ #else
+ 	  // Switch to named locale so that mbsrtowcs will work.
+-	  char* __old = strdup(setlocale(LC_ALL, NULL));
+-	  setlocale(LC_ALL, __name);
++          char* __old = setlocale(LC_ALL, NULL);
++          const size_t __llen = strlen(__old) + 1;
++          char* __sav = new char[__llen];
++          memcpy(__sav, __old, __llen);
++          setlocale(LC_ALL, __name);
+ #endif
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+@@ -633,8 +643,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	      __uselocale(__old);
+ #else
+-	      setlocale(LC_ALL, __old);
+-	      free(__old);
++	      setlocale(LC_ALL, __sav);
++	      delete [] __sav;
+ #endif
+               __throw_exception_again;
+ 	    }
+@@ -653,8 +663,8 @@ namespace std
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ 	  __uselocale(__old);
+ #else
+-	  setlocale(LC_ALL, __old);
+-	  free(__old);
++	  setlocale(LC_ALL, __sav);
++	  delete [] __sav;
+ #endif
+ 	}
+     }
+diff --git a/libstdc++-v3/config/locale/uclibc/numeric_members.cc b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+index d5c8961..8ae8969 100644
+--- a/libstdc++-v3/config/locale/uclibc/numeric_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/numeric_members.cc
+@@ -33,9 +33,14 @@
+ 
+ // Written by Benjamin Kosnik <bkoz@redhat.com>
+ 
++#include <features.h>
++#ifdef __UCLIBC_HAS_LOCALE__
+ #define _LIBC
+ #include <locale>
+ #undef _LIBC
++#else
++#include <locale>
++#endif
+ #include <bits/c++locale_internal.h>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+diff --git a/libstdc++-v3/config/locale/uclibc/time_members.cc b/libstdc++-v3/config/locale/uclibc/time_members.cc
+index d848ed5..f24d53e 100644
+--- a/libstdc++-v3/config/locale/uclibc/time_members.cc
++++ b/libstdc++-v3/config/locale/uclibc/time_members.cc
+@@ -53,11 +53,14 @@ namespace std
+       const size_t __len = __strftime_l(__s, __maxlen, __format, __tm,
+ 					_M_c_locale_timepunct);
+ #else
+-      char* __old = strdup(setlocale(LC_ALL, NULL));
++      char* __old = setlocale(LC_ALL, NULL);
++      const size_t __llen = strlen(__old) + 1;
++      char* __sav = new char[__llen];
++      memcpy(__sav, __old, __llen);
+       setlocale(LC_ALL, _M_name_timepunct);
+       const size_t __len = strftime(__s, __maxlen, __format, __tm);
+-      setlocale(LC_ALL, __old);
+-      free(__old);
++      setlocale(LC_ALL, __sav);
++      delete [] __sav;
+ #endif
+       // Make sure __s is null terminated.
+       if (__len == 0)
+@@ -207,11 +210,14 @@ namespace std
+       const size_t __len = __wcsftime_l(__s, __maxlen, __format, __tm,
+ 					_M_c_locale_timepunct);
+ #else
+-      char* __old = strdup(setlocale(LC_ALL, NULL));
++      char* __old = setlocale(LC_ALL, NULL);
++      const size_t __llen = strlen(__old) + 1;
++      char* __sav = new char[__llen];
++      memcpy(__sav, __old, __llen);
+       setlocale(LC_ALL, _M_name_timepunct);
+       const size_t __len = wcsftime(__s, __maxlen, __format, __tm);
+-      setlocale(LC_ALL, __old);
+-      free(__old);
++      setlocale(LC_ALL, __sav);
++      delete [] __sav;
+ #endif
+       // Make sure __s is null terminated.
+       if (__len == 0)
+diff --git a/libstdc++-v3/config/locale/uclibc/time_members.h b/libstdc++-v3/config/locale/uclibc/time_members.h
+index ba8e858..1665dde 100644
+--- a/libstdc++-v3/config/locale/uclibc/time_members.h
++++ b/libstdc++-v3/config/locale/uclibc/time_members.h
+@@ -50,12 +50,21 @@
+     __timepunct<_CharT>::__timepunct(__c_locale __cloc, const char* __s,
+ 				     size_t __refs)
+     : facet(__refs), _M_data(NULL), _M_c_locale_timepunct(NULL),
+-    _M_name_timepunct(__s)
++    _M_name_timepunct(NULL)
+     {
+-      char* __tmp = new char[std::strlen(__s) + 1];
+-      std::strcpy(__tmp, __s);
++      const size_t __len = std::strlen(__s) + 1;
++      char* __tmp = new char[__len];
++      std::memcpy(__tmp, __s, __len);
+       _M_name_timepunct = __tmp;
+-      _M_initialize_timepunct(__cloc);
++
++      try
++	{ _M_initialize_timepunct(__cloc); }
++      catch(...)
++	{
++	  delete [] _M_name_timepunct;
++	  __throw_exception_again;
++	}
++
+     }
+ 
+   template<typename _CharT>
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-6.1/0008-missing-execinfo_h.patch
new file mode 100644
index 0000000..01e7c95
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0008-missing-execinfo_h.patch
@@ -0,0 +1,28 @@
+From 6dde3da24ef4b9b357bca670d8551cab3fdda843 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:48:10 +0400
+Subject: [PATCH 08/46] missing-execinfo_h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ boehm-gc/include/gc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/boehm-gc/include/gc.h b/boehm-gc/include/gc.h
+index 6b38f2d..fca98ff 100644
+--- a/boehm-gc/include/gc.h
++++ b/boehm-gc/include/gc.h
+@@ -503,7 +503,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_off_page GC_PROTO((size_t lb));
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-6.1/0009-c99-snprintf.patch
new file mode 100644
index 0000000..d62341a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0009-c99-snprintf.patch
@@ -0,0 +1,28 @@
+From b794f1f1c1c7c06f3f0d78cf76c4fb90c2ab8dfb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:49:03 +0400
+Subject: [PATCH 09/46] c99-snprintf
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ libstdc++-v3/include/c_std/cstdio | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/include/c_std/cstdio
+index a4119ba..8396f43 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-6.1/0010-gcc-poison-system-directories.patch
new file mode 100644
index 0000000..ac4cf44
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0010-gcc-poison-system-directories.patch
@@ -0,0 +1,192 @@
+From d76250323dad69212c958e4857a98d99ab51a39e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 08:59:00 +0400
+Subject: [PATCH 10/46] gcc: poison-system-directories
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
+index 67048db..733185c 100644
+--- a/gcc/common.opt
++++ b/gcc/common.opt
+@@ -659,6 +659,10 @@ Wreturn-local-addr
+ Common Var(warn_return_local_addr) Init(1) Warning
+ Warn about returning a pointer/reference to a local or temporary variable.
+ 
++Wpoison-system-directories
++Common Var(flag_poison_system_directories) Init(1) Warning
++Warn for -I and -L options using system directories if cross compiling
++
+ Wshadow
+ Common Var(warn_shadow) Warning
+ Warn when one local variable shadows another.
+diff --git a/gcc/config.in b/gcc/config.in
+index 115cb61..105b30f 100644
+--- a/gcc/config.in
++++ b/gcc/config.in
+@@ -187,6 +187,12 @@
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
+index 1c6e340..8f83152 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -942,6 +942,7 @@ with_system_zlib
+ enable_maintainer_mode
+ enable_link_mutex
+ enable_version_specific_runtime_libs
++enable_poison_system_directories
+ enable_plugin
+ enable_host_shared
+ enable_libquadmath_support
+@@ -1681,6 +1682,8 @@ Optional Features:
+   --enable-version-specific-runtime-libs
+                           specify that runtime libraries should be installed
+                           in a compiler-specific directory
++  --enable-poison-system-directories
++                          warn for use of native system header directories
+   --enable-plugin         enable plugin support
+   --enable-host-shared    build host code as shared libraries
+   --disable-libquadmath-support
+@@ -28908,6 +28911,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
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
+index 6c1dcd9..0fccaef 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5861,6 +5861,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
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
+index 821f8fd..8bb49e7 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -284,6 +284,7 @@ Objective-C and Objective-C++ Dialects}.
+ -Wparentheses -Wno-pedantic-ms-format @gol
+ -Wplacement-new -Wplacement-new=@var{n} @gol
+ -Wpointer-arith  -Wno-pointer-to-int-cast @gol
++-Wno-poison-system-directories @gol
+ -Wno-pragmas -Wredundant-decls  -Wno-return-local-addr @gol
+ -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
+ -Wshift-overflow -Wshift-overflow=@var{n} @gol
+@@ -4723,6 +4724,14 @@ made up of data only and thus requires no special treatment.  But, for
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
+index 1af5920..4cfef7f 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1017,6 +1017,8 @@ proper position among the other output files.  */
+    "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
+    "%X %{o*} %{e*} %{N} %{n} %{r}\
+     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
++    %{Wno-poison-system-directories:--no-poison-system-directories} \
++    %{Werror=poison-system-directories:--error-poison-system-directories} \
+     %{static:} %{L*} %(mfwrap) %(link_libgcc) " \
+     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SPEC " \
+     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
+diff --git a/gcc/incpath.c b/gcc/incpath.c
+index ea40f4a..856da41 100644
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
+@@ -381,6 +382,24 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+ 	}
+       fprintf (stderr, _("End of search list.\n"));
+     }
++
++#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
++  if (flag_poison_system_directories)
++    {
++       struct cpp_dir *p;
++
++       for (p = heads[QUOTE]; p; p = p->next)
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch
new file mode 100644
index 0000000..a1736ae
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0011-gcc-poison-dir-extend.patch
@@ -0,0 +1,39 @@
+From a1c24b59def393e43cd50b6768604a212c788ed3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:00:34 +0400
+Subject: [PATCH 11/46] gcc-poison-dir-extend
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
+index 856da41..d2fc82c 100644
+--- a/gcc/incpath.c
++++ b/gcc/incpath.c
+@@ -392,7 +392,9 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
new file mode 100644
index 0000000..939b070
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -0,0 +1,73 @@
+From 00ef5f0f2a8d3b33aeb1e55c0d23439f4dd495af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:08:31 +0400
+Subject: [PATCH 12/46] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
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
+index bfadc33..755d382 100755
+--- a/configure
++++ b/configure
+@@ -6819,6 +6819,38 @@ fi
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-6.1/0013-64-bit-multilib-hack.patch
new file mode 100644
index 0000000..e31cde4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0013-64-bit-multilib-hack.patch
@@ -0,0 +1,85 @@
+From 7fc7a070ac53a55950a1eac76f02877d4106b4b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:10:06 +0400
+Subject: [PATCH 13/46] 64-bit multilib hack.
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
+index c0cc8a3..365a5d6 100644
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
+index 16c8adf..b932ace 100644
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
+index fa7550b..9b5d9ef 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-6.1/0014-optional-libstdc.patch
new file mode 100644
index 0000000..44b0cc7
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0014-optional-libstdc.patch
@@ -0,0 +1,125 @@
+From 36275f7981bdaf919bbc9b51a7c7fae1e192adb3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:12:56 +0400
+Subject: [PATCH 14/46] optional libstdc
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
+index 4f86876..660da6c 100644
+--- a/gcc/c-family/c.opt
++++ b/gcc/c-family/c.opt
+@@ -1647,6 +1647,10 @@ nostdinc++
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
+index 03cbde0..3642540 100644
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
+index 8bb49e7..84d68aa 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -207,6 +207,9 @@ in the following sections.
+ -fno-weak  -nostdinc++ @gol
+ -fvisibility-inlines-hidden @gol
+ -fvisibility-ms-compat @gol
++-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
++-fvtv-counts -fvtv-debug @gol
++-nostdlib++ @gol
+ -fext-numeric-literals @gol
+ -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @gol
+ -Wdelete-non-virtual-dtor -Wliteral-suffix -Wmultiple-inheritance @gol
+@@ -470,7 +473,7 @@ Objective-C and Objective-C++ Dialects}.
+ -s  -static -static-libgcc -static-libstdc++ @gol
+ -static-libasan -static-libtsan -static-liblsan -static-libubsan @gol
+ -static-libmpx -static-libmpxwrappers @gol
+--shared -shared-libgcc  -symbolic @gol
++-shared -shared-libgcc  -symbolic -nostdlib++ @gol
+ -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
+ -u @var{symbol} -z @var{keyword}}
+ 
+@@ -10601,6 +10604,33 @@ library subroutines.
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
+ Produce a position independent executable on targets that support it.
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 4cfef7f..da0b482 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1028,6 +1028,7 @@ proper position among the other output files.  */
+     %(mflib) " STACK_SPLIT_SPEC "\
+     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
+     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}\
++    %{!nostdlib++:}\
+     %{!nostdlib:%{!nostartfiles:%E}} %{T*}  \n%(post_link) }}}}}}"
+ #endif
+ 
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-6.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
new file mode 100644
index 0000000..6fc7346
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
@@ -0,0 +1,59 @@
+From 9346f6042d8f7f85a75ca2af15f3b8d234985165 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:14:20 +0400
+Subject: [PATCH 15/46] gcc: disable MASK_RELAX_PIC_CALLS bit
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
+index 8f83152..5e72f17 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -27018,13 +27018,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
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
+index 0fccaef..dd8f6fa 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -4522,13 +4522,6 @@ x:
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-6.1/0016-COLLECT_GCC_OPTIONS.patch
new file mode 100644
index 0000000..c154864
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0016-COLLECT_GCC_OPTIONS.patch
@@ -0,0 +1,38 @@
+From 1033bc2d4efc5c301bb822b607a673f5b10cc69f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:16:28 +0400
+Subject: [PATCH 16/46] COLLECT_GCC_OPTIONS
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
+index da0b482..7ca129f 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -4591,6 +4591,15 @@ set_collect_gcc_options (void)
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-6.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
new file mode 100644
index 0000000..0dbabd9
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -0,0 +1,96 @@
+From 67123a306880af997a99ae514677c2da4973bd1a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:17:25 +0400
+Subject: [PATCH 17/46] Use the defaults.h in ${B} instead of ${S}, and t-oe in
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
+index 6c5adc0..9a1d466 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -517,7 +517,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+ TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
+ 
+ xmake_file=@xmake_file@
+-tmake_file=@tmake_file@
++tmake_file=@tmake_file@ ./t-oe
+ TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
+ TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
+ TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
+diff --git a/gcc/configure b/gcc/configure
+index 5e72f17..389b6d5 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12130,8 +12130,8 @@ for f in $tm_file; do
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
+index dd8f6fa..91ac800 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1883,8 +1883,8 @@ for f in $tm_file; do
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
+index 67dfac6..b73e08d 100644
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
+@@ -109,7 +109,7 @@ esac
+ 
+ # If we postponed including defaults.h, add the #include now.
+ if test x"$postpone_defaults_h" = x"yes"; then
+-    echo "# include \"defaults.h\"" >> ${output}T
++    echo "# include \"./defaults.h\"" >> ${output}T
+ fi
+ 
+ # Add multiple inclusion protection guard, part two.
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-6.1/0018-fortran-cross-compile-hack.patch
new file mode 100644
index 0000000..b43d89e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0018-fortran-cross-compile-hack.patch
@@ -0,0 +1,46 @@
+From e360dc3e0f1e0b9b001ef722fcf66f8120a03dbc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:20:01 +0400
+Subject: [PATCH 18/46] fortran cross-compile hack.
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
+index f746f6f..b4f3278 100755
+--- a/libgfortran/configure
++++ b/libgfortran/configure
+@@ -12734,7 +12734,7 @@ esac
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ ac_ext=${ac_fc_srcext-f}
+ ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
+ ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
+diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
+index 8f377bb..67710b5 100644
+--- a/libgfortran/configure.ac
++++ b/libgfortran/configure.ac
+@@ -240,7 +240,7 @@ AC_SUBST(enable_static)
+ 
+ # We need gfortran to compile parts of the library
+ #AC_PROG_FC(gfortran)
+-FC="$GFORTRAN"
++#FC="$GFORTRAN"
+ AC_PROG_FC(gfortran)
+ 
+ # extra LD Flags which are required for targets
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0019-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-6.1/0019-cpp-honor-sysroot.patch
new file mode 100644
index 0000000..417a5ed
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0019-cpp-honor-sysroot.patch
@@ -0,0 +1,54 @@
+From 98d9c0c1b5552294b2130f7304bfb522da323442 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:22:00 +0400
+Subject: [PATCH 19/46] cpp: honor sysroot.
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
+index 9707fac..fe487a2 100644
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
+index 7ca129f..04fa81d 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1329,7 +1329,7 @@ static const struct compiler default_compilers[] =
+ 					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
+   {".i", "@cpp-output", 0, 0, 0},
+   {"@cpp-output",
+-   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
++   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
+   {".s", "@assembler", 0, 0, 0},
+   {"@assembler",
+    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch
new file mode 100644
index 0000000..ba612f5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0020-MIPS64-Default-to-N64-ABI.patch
@@ -0,0 +1,57 @@
+From 1f15447fbcf65142627af8a9694761534da8d0d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:23:08 +0400
+Subject: [PATCH 20/46] MIPS64: Default to N64 ABI
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
+index f66e48c..9c6d156 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -2065,29 +2065,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-6.1/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
new file mode 100644
index 0000000..6675ce3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -0,0 +1,234 @@
+From 9f73c8918b63e6a1c9b79384fac411d1056eec1c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:24:50 +0400
+Subject: [PATCH 21/46] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
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
+index a0764d3..02f7a7c 100644
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
+index ace8481..4010435 100644
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -68,8 +68,8 @@
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
+index a94bd2d..0220628 100644
+--- a/gcc/config/arm/linux-elf.h
++++ b/gcc/config/arm/linux-elf.h
+@@ -62,7 +62,7 @@
+ 
+ #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
+ 
+ #define LINUX_TARGET_LINK_SPEC  "%{h*} \
+    %{static:-Bstatic} \
+diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
+index d37a875..edde586 100644
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
+index 73d22e3..f4b5615 100644
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
+index 9aeeb94..b055652 100644
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
+index fa253b6..da02c8d 100644
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
+ #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index fefa0c4..7173938 100644
+--- a/gcc/config/rs6000/linux64.h
++++ b/gcc/config/rs6000/linux64.h
+@@ -412,16 +412,11 @@ extern int dot_symbols;
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
+@@ -429,8 +424,9 @@ extern int dot_symbols;
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
+index 2a036ac..50fb735 100644
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
+index 9b32577..7bd66de 100644
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
+index a1ef325..3bae3d5 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0022-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-6.1/0022-gcc-Fix-argument-list-too-long-error.patch
new file mode 100644
index 0000000..fab6e4a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0022-gcc-Fix-argument-list-too-long-error.patch
@@ -0,0 +1,40 @@
+From acce5157f6b3a1dc9a3676b7118ac887dc5693be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:26:37 +0400
+Subject: [PATCH 22/46] gcc: Fix argument list too long error.
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
+index 9a1d466..450cb79 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -3349,7 +3349,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config or c-family and .def
+ # files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
++	headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0023-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-6.1/0023-Disable-sdt.patch
new file mode 100644
index 0000000..0efd890
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0023-Disable-sdt.patch
@@ -0,0 +1,113 @@
+From 6573aec00ada35c48c1838c8491ce8f7798ae993 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:28:10 +0400
+Subject: [PATCH 23/46] Disable sdt.
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
+index 389b6d5..73c264d 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -28528,12 +28528,12 @@ fi
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
+index 91ac800..cecf121 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5514,15 +5514,15 @@ fi
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
+index 8a5481c..6a40e92 100755
+--- a/libstdc++-v3/configure
++++ b/libstdc++-v3/configure
+@@ -21735,11 +21735,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
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
+index 9e19e99..0077ffd 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0024-libtool.patch b/meta/recipes-devtools/gcc/gcc-6.1/0024-libtool.patch
new file mode 100644
index 0000000..1f73b5d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0024-libtool.patch
@@ -0,0 +1,42 @@
+From 6c0aa5c2538829248547197718037ff0b9788676 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:29:11 +0400
+Subject: [PATCH 24/46] libtool
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
+index 9503ec8..0121fba 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-6.1/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
new file mode 100644
index 0000000..3b7ee49
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -0,0 +1,43 @@
+From b1263a48553ce75f8c3bed4fe12122af57845567 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:30:32 +0400
+Subject: [PATCH 25/46] gcc: armv4: pass fix-v4bx to linker to support EABI.
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
+index 4010435..aaea1c9 100644
+--- a/gcc/config/arm/linux-eabi.h
++++ b/gcc/config/arm/linux-eabi.h
+@@ -94,10 +94,14 @@
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-6.1/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
new file mode 100644
index 0000000..be25be6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -0,0 +1,102 @@
+From b5c305fc251299f2e328410b18cfb55c75b5f038 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Mar 2013 09:33:04 +0400
+Subject: [PATCH 26/46] Use the multilib config files from ${B} instead of
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
+index 73c264d..377253e 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -12110,10 +12110,20 @@ done
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
+@@ -12124,6 +12134,10 @@ tm_file_list="options.h"
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
+index cecf121..54e7619 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1863,10 +1863,20 @@ done
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
+@@ -1877,6 +1887,10 @@ tm_file_list="options.h"
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-6.1/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
new file mode 100644
index 0000000..d1bbebc
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -0,0 +1,31 @@
+From eb6178b7fb466ae429c56380c6dbc564a16d900a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 09:39:38 +0000
+Subject: [PATCH 27/46] Avoid using libdir from .la which usually points to a
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
+index 0121fba..52bdbdb 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0028-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-6.1/0028-export-CPP.patch
new file mode 100644
index 0000000..c212539
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0028-export-CPP.patch
@@ -0,0 +1,53 @@
+From 617184f35e97934d9e6268e71378574e2b776c2b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 09:40:59 +0000
+Subject: [PATCH 28/46] export CPP
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
+index 1522e39..beb9b9a 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-6.1/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
new file mode 100644
index 0000000..47b9c0d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
@@ -0,0 +1,56 @@
+From e140700976e3b7eb4250b1ffde9bc16494456903 Mon Sep 17 00:00:00 2001
+From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
+Date: Wed, 5 Feb 2014 16:52:31 +0200
+Subject: [PATCH 29/46] Enable SPE & AltiVec generation on powepc*linux target
+
+When is configured with --target=powerpc-linux, the resulting GCC will
+not be able to generate code for SPE targets (e500v1/v2).
+GCC configured with --target=powerpc-linuxspe will not be able to
+generate AltiVec instructions (for e6500).
+This patch modifies the configured file such that SPE or AltiVec code
+can be generated when gcc is configured with --target=powerpc-linux.
+The ABI and speciffic instructions can be selected through the
+"-mabi=spe or -mabi=altivec" and the "-mspe or -maltivec" parameters.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
+---
+ gcc/config.gcc               | 9 ++++++++-
+ gcc/config/rs6000/linuxspe.h | 3 ---
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/gcc/config.gcc b/gcc/config.gcc
+index 9c6d156..18cff5a 100644
+--- a/gcc/config.gcc
++++ b/gcc/config.gcc
+@@ -2392,7 +2392,14 @@ powerpc-*-rtems*)
+ 	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-rtems rs6000/t-ppccomm"
+ 	;;
+ powerpc*-*-linux*)
+-	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spec.h rs6000/sysv4.h"
++	case ${target} in
++	    powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
++		tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spec.h rs6000/sysv4.h"
++		;;
++	    *)
++		tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spec.h rs6000/sysv4.h rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e500.h"
++		;;
++	esac
+ 	extra_options="${extra_options} rs6000/sysv4.opt"
+ 	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-ppccomm"
+ 	extra_objs="$extra_objs rs6000-linux.o"
+diff --git a/gcc/config/rs6000/linuxspe.h b/gcc/config/rs6000/linuxspe.h
+index 35623cd..f74e00d 100644
+--- a/gcc/config/rs6000/linuxspe.h
++++ b/gcc/config/rs6000/linuxspe.h
+@@ -27,6 +27,3 @@
+ #undef	TARGET_DEFAULT
+ #define TARGET_DEFAULT MASK_STRICT_ALIGN
+ #endif
+-
+-#undef  ASM_DEFAULT_SPEC
+-#define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-6.1/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
new file mode 100644
index 0000000..c09d019
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
@@ -0,0 +1,42 @@
+From 0ddcb95a86830766fd02122f19384fc929b377c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 10:21:55 +0000
+Subject: [PATCH 30/46] Disable the MULTILIB_OSDIRNAMES and other multilib
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
+index 1cfe9f3..d688ac9 100644
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
+-MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32
++#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0031-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-6.1/0031-Ensure-target-gcc-headers-can-be-included.patch
new file mode 100644
index 0000000..fb1cd0f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0031-Ensure-target-gcc-headers-can-be-included.patch
@@ -0,0 +1,98 @@
+From fc6621435a64a9d69aa251b70361da94cf2db6be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 10:25:11 +0000
+Subject: [PATCH 31/46] Ensure target gcc headers can be included
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
+index 450cb79..cc75536 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -593,6 +593,7 @@ libexecdir = @libexecdir@
+ 
+ # Directory in which the compiler finds libraries etc.
+ libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
++libsubdir_target = gcc/$(target_noncanonical)/$(version)
+ # Directory in which the compiler finds executables
+ libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
+ # Directory in which all plugin resources are installed
+@@ -2688,6 +2689,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+ 
+ PREPROCESSOR_DEFINES = \
+   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
++  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
+   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
+   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
+   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index 54aaf06..7b4dd51 100644
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
+index 3e18338..0f317f2 100644
+--- a/gcc/defaults.h
++++ b/gcc/defaults.h
+@@ -1492,4 +1492,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
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
+index 04fa81d..9750cc2 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -1450,13 +1450,6 @@ static const char *gcc_libexec_prefix;
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-6.1/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
new file mode 100644
index 0000000..c0b001d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
@@ -0,0 +1,54 @@
+From ff939c5063d8f8d444bdb25651a0a48e608efaa4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Feb 2015 11:17:19 +0000
+Subject: [PATCH 32/46] gcc 4.8+ won't build with --disable-dependency-tracking
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
+index b351244..399ce18 100644
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
+index a083d87..a92cfce 100644
+--- a/libatomic/Makefile.in
++++ b/libatomic/Makefile.in
+@@ -330,7 +330,8 @@ PAT_N = $(word 2,$(PAT_SPLIT))
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-6.1/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
new file mode 100644
index 0000000..e425d71
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -0,0 +1,38 @@
+From 5092f5389d02e78cd59690cf3fca24b56a97aff2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Mar 2015 08:21:19 +0000
+Subject: [PATCH 33/46] Don't search host directory during "relink" if
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
+index 52bdbdb..82bcec3 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-6.1/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
new file mode 100644
index 0000000..922a855
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -0,0 +1,29 @@
+From 1faa6f69f93bb95af2b2b2bd24e181b50fb5b37c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:15:27 -0700
+Subject: [PATCH 34/46] Use SYSTEMLIBS_DIR replacement instead of hardcoding
+ base_libdir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Inappropriate [OE Configuration]
+
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index 5fcaa59..8588ac0 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0035-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-6.1/0035-aarch64-Add-support-for-musl-ldso.patch
new file mode 100644
index 0000000..9dfc472
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0035-aarch64-Add-support-for-musl-ldso.patch
@@ -0,0 +1,28 @@
+From 3768468c1a6cc170fff88c03b808c975ac653811 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Apr 2015 23:18:39 -0700
+Subject: [PATCH 35/46] aarch64: Add support for musl ldso
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Inappropriate [OE Configuration]
+
+ gcc/config/aarch64/aarch64-linux.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index 8588ac0..946b3ca 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-6.1/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
new file mode 100644
index 0000000..f89a886
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -0,0 +1,54 @@
+From f4d3c8e970d42a43cd3d2f751e13324efa936ff8 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 5 Jul 2015 20:25:18 -0700
+Subject: [PATCH 36/46] libcc1: fix libcc1's install path and rpath
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
+index b40820b..32930c5 100644
+--- a/libcc1/Makefile.am
++++ b/libcc1/Makefile.am
+@@ -35,8 +35,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+ 
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ 
+ if ENABLE_PLUGIN
+ plugin_LTLIBRARIES = libcc1plugin.la
+diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
+index 79d39d3..227ec22 100644
+--- a/libcc1/Makefile.in
++++ b/libcc1/Makefile.in
+@@ -291,8 +291,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
+ 	    $(Wc)$(libiberty_normal)))
+ 
+ libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
+-plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
+-cc1libdir = $(libdir)/$(libsuffix)
++cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
++plugindir = $(cc1libdir)
+ @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la
+ @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
+ BUILT_SOURCES = compiler-name.h
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0037-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-6.1/0037-handle-sysroot-support-for-nativesdk-gcc.patch
new file mode 100644
index 0000000..15efcb1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0037-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -0,0 +1,213 @@
+From 1475b941d7a9c9874b0fb0558d01805945467331 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:39:54 +0000
+Subject: [PATCH 37/46] handle sysroot support for nativesdk-gcc
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
+ gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++++-------------
+ gcc/cppdefault.h |  3 ++-
+ gcc/gcc.c        | 20 ++++++++++++++------
+ 3 files changed, 53 insertions(+), 20 deletions(-)
+
+diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
+index 7b4dd51..9d1166c 100644
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
+index 8a81b45..9759efd 100644
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
+index 9750cc2..94c240e 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -247,6 +247,8 @@ FILE *report_times_to_file = NULL;
+ #endif
+ static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
+ 
++static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
++
+ /* Nonzero means pass the updated target_system_root to the compiler.  */
+ 
+ static int target_system_root_changed;
+@@ -517,6 +519,7 @@ or with constant text in a single argument.
+  %G     process LIBGCC_SPEC as a spec.
+  %R     Output the concatenation of target_system_root and
+         target_sysroot_suffix.
++ %r     Output the base path target_relocatable_prefix
+  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
+  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
+  %C     process CPP_SPEC as a spec.
+@@ -1473,10 +1476,10 @@ static const char *gcc_libexec_prefix;
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
+@@ -1484,9 +1487,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
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
+@@ -5762,6 +5765,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-6.1/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
new file mode 100644
index 0000000..89ee79d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -0,0 +1,102 @@
+From 42e4cdcaad590536246866b0846ec279e124fa16 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:41:45 +0000
+Subject: [PATCH 38/46] Search target sysroot gcc version specific dirs with
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
+index 94c240e..2812819 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -2507,7 +2507,7 @@ for_each_path (const struct path_prefix *paths,
+       if (path == NULL)
+ 	{
+ 	  len = paths->max_len + extra_space + 1;
+-	  len += MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len);
++	  len += MAX ((suffix_len + multi_os_dir_len), multiarch_len);
+ 	  path = XNEWVEC (char, len);
+ 	}
+ 
+@@ -2519,6 +2519,33 @@ for_each_path (const struct path_prefix *paths,
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0039-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-6.1/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
new file mode 100644
index 0000000..0ce7aec
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -0,0 +1,137 @@
+From 9ced49e459ccf1887feb58adf1e8836dcb4b1bdf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 Dec 2015 23:42:45 +0000
+Subject: [PATCH 39/46] Fix various _FOR_BUILD and related variables
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
+index beb9b9a..3e1c6bc 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
+ 	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
+@@ -170,6 +171,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -187,6 +191,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+@@ -713,6 +718,7 @@ BASE_FLAGS_TO_PASS = \
+ 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
+ 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
+ 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
++	"CXXFLAGS_FOR_BUILD=$(CXXFLAGS_FOR_BUILD)" \
+ 	"EXPECT=$(EXPECT)" \
+ 	"FLEX=$(FLEX)" \
+ 	"INSTALL=$(INSTALL)" \
+diff --git a/Makefile.tpl b/Makefile.tpl
+index 6b2eb6a..114e462 100644
+--- a/Makefile.tpl
++++ b/Makefile.tpl
+@@ -154,6 +154,7 @@ BUILD_EXPORTS = \
+ 	CC="$(CC_FOR_BUILD)"; export CC; \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
+ 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
+ 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
+ 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
+@@ -172,6 +173,9 @@ BUILD_EXPORTS = \
+ # built for the build system to override those in BASE_FLAGS_TO_PASS.
+ EXTRA_BUILD_FLAGS = \
+ 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
++	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
++	CPP="$(CC_FOR_BUILD) -E" \
++	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
+ 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
+ 
+ # This is the list of directories to built for the host system.
+@@ -189,6 +193,7 @@ HOST_SUBDIR = @host_subdir@
+ HOST_EXPORTS = \
+ 	$(BASE_EXPORTS) \
+ 	CC="$(CC)"; export CC; \
++	CPP="$(CC) -E"; export CPP; \
+ 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
+ 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
+ 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index cc75536..0ad2dc8 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -780,7 +780,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
+ BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
+ BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
+ BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
+-		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
++		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR_BUILD)
+ 
+ # Actual name to use when installing a native compiler.
+ GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
+diff --git a/gcc/configure b/gcc/configure
+index 377253e..78fc64a 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -11799,7 +11799,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index 54e7619..a94666e 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -1682,7 +1682,7 @@ else
+ 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
+ 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
+ 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
+-	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
++	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
+ 	${realsrcdir}/configure \
+ 		--enable-languages=${enable_languages-all} \
+ 		--target=$target_alias --host=$build_alias --build=$build_alias
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-6.1/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
new file mode 100644
index 0000000..c9a6fd0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -0,0 +1,28 @@
+From b0412c01c275aaeb6b458461cd2425120c8bcec8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Feb 2016 10:26:10 -0800
+Subject: [PATCH 40/46] nios2: Define MUSL_DYNAMIC_LINKER
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
+index 4ef55b5..62bc1e7 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.1/0041-ssp_nonshared.patch
new file mode 100644
index 0000000..0744529
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0041-ssp_nonshared.patch
@@ -0,0 +1,28 @@
+From 551a5db7acb56e085a101f1c222d51b2c1b039a4 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Sat, 7 Nov 2015 14:58:40 +0000
+Subject: [PATCH 41/46] ssp_nonshared
+
+---
+Upstream-Status: Inappropriate [OE Configuration]
+
+ gcc/gcc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.c b/gcc/gcc.c
+index 2812819..9de96ee 100644
+--- a/gcc/gcc.c
++++ b/gcc/gcc.c
+@@ -863,7 +863,8 @@ proper position among the other output files.  */
+ #ifndef LINK_SSP_SPEC
+ #ifdef TARGET_LIBC_PROVIDES_SSP
+ #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
+-		       "|fstack-protector-strong|fstack-protector-explicit:}"
++		       "|fstack-protector-strong|fstack-protector-explicit" \
++		       ":-lssp_nonshared}"
+ #else
+ #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
+ 		       "|fstack-protector-strong|fstack-protector-explicit" \
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-6.1/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
new file mode 100644
index 0000000..861f0fd
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
@@ -0,0 +1,292 @@
+From ba738cc411c9a54e389e336bcaa0a2428dd4a9d2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Mar 2016 02:27:43 -0400
+Subject: [PATCH 42/46] gcc/libcpp: support -ffile-prefix-map=<old>=<new>
+
+Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
+directory name (old) to another (new) in __FILE__, __BASE_FILE__ and
+__builtin_FILE ().
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
+
+Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/c-family/c-opts.c     | 13 +++++++
+ gcc/c-family/c.opt        |  4 +++
+ gcc/dwarf2out.c           |  1 +
+ gcc/gimplify.c            |  3 ++
+ libcpp/Makefile.in        | 10 +++---
+ libcpp/file-map.c         | 92 +++++++++++++++++++++++++++++++++++++++++++++++
+ libcpp/include/file-map.h | 30 ++++++++++++++++
+ libcpp/macro.c            |  2 ++
+ 8 files changed, 150 insertions(+), 5 deletions(-)
+ create mode 100644 libcpp/file-map.c
+ create mode 100644 libcpp/include/file-map.h
+
+diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
+index fec58bc..7a0af43 100644
+--- a/gcc/c-family/c-opts.c
++++ b/gcc/c-family/c-opts.c
+@@ -38,6 +38,14 @@ along with GCC; see the file COPYING3.  If not see
+ #include "opts.h"
+ #include "plugin.h"		/* For PLUGIN_INCLUDE_FILE event.  */
+ #include "mkdeps.h"
++#include "file-map.h"
++#include "c-target.h"
++#include "tm.h"			/* For BYTES_BIG_ENDIAN,
++				   DOLLARS_IN_IDENTIFIERS,
++				   STDC_0_IN_SYSTEM_HEADERS,
++				   TARGET_FLT_EVAL_METHOD_NON_DEFAULT and
++				   TARGET_OPTF.  */
++#include "tm_p.h"		/* For C_COMMON_OVERRIDE_OPTIONS.  */
+ #include "dumpfile.h"
+ 
+ #ifndef DOLLARS_IN_IDENTIFIERS
+@@ -503,6 +511,11 @@ c_common_handle_option (size_t scode, const char *arg, int value,
+       cpp_opts->narrow_charset = arg;
+       break;
+ 
++    case OPT_ffile_prefix_map_:
++      if (add_file_prefix_map (arg) < 0)
++        error ("invalid argument %qs to -ffile-prefix-map", arg);
++      break;
++
+     case OPT_fwide_exec_charset_:
+       cpp_opts->wide_charset = arg;
+       break;
+diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
+index 660da6c..31f7b34 100644
+--- a/gcc/c-family/c.opt
++++ b/gcc/c-family/c.opt
+@@ -1208,6 +1208,10 @@ fexec-charset=
+ C ObjC C++ ObjC++ Joined RejectNegative
+ -fexec-charset=<cset>	Convert all strings and character constants to character set <cset>.
+ 
++ffile-prefix-map=
++C ObjC C++ ObjC++ Joined RejectNegative
++-ffile-prefix-map=<old=new>	Map one directory name to another in __FILE__, __BASE_FILE__ and __builtin_FILE ()
++
+ fextended-identifiers
+ C ObjC C++ ObjC++
+ Permit universal character names (\\u and \\U) in identifiers.
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index 80f2df5..a2bfcc0 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -21672,6 +21672,7 @@ gen_producer_string (void)
+       case OPT_fltrans_output_list_:
+       case OPT_fresolution_:
+       case OPT_fdebug_prefix_map_:
++      case OPT_ffile_prefix_map_:
+ 	/* Ignore these.  */
+ 	continue;
+       default:
+diff --git a/gcc/gimplify.c b/gcc/gimplify.c
+index e223e59..1433c25 100644
+--- a/gcc/gimplify.c
++++ b/gcc/gimplify.c
+@@ -57,6 +57,8 @@ along with GCC; see the file COPYING3.  If not see
+ #include "gomp-constants.h"
+ #include "tree-dump.h"
+ #include "gimple-walk.h"
++#include "file-map.h"
++
+ #include "langhooks-def.h"	/* FIXME: for lhd_set_decl_assembler_name */
+ #include "builtins.h"
+ 
+@@ -2432,6 +2434,7 @@ gimplify_call_expr (tree *expr_p, gimple_seq *pre_p, bool want_value)
+       case BUILT_IN_FILE:
+ 	{
+ 	  const char *locfile = LOCATION_FILE (EXPR_LOCATION (*expr_p));
++	  locfile = remap_file_filename (locfile);
+ 	  *expr_p = build_string_literal (strlen (locfile) + 1, locfile);
+ 	  return GS_OK;
+ 	}
+diff --git a/libcpp/Makefile.in b/libcpp/Makefile.in
+index a7d7828..3d29572 100644
+--- a/libcpp/Makefile.in
++++ b/libcpp/Makefile.in
+@@ -84,12 +84,12 @@ DEPMODE = $(CXXDEPMODE)
+ 
+ 
+ libcpp_a_OBJS = charset.o directives.o directives-only.o errors.o \
+-	expr.o files.o identifiers.o init.o lex.o line-map.o macro.o \
+-	mkdeps.o pch.o symtab.o traditional.o
++	expr.o file-map.o files.o identifiers.o init.o lex.o line-map.o \
++	macro.o mkdeps.o pch.o symtab.o traditional.o
+ 
+ libcpp_a_SOURCES = charset.c directives.c directives-only.c errors.c \
+-	expr.c files.c identifiers.c init.c lex.c line-map.c macro.c \
+-	mkdeps.c pch.c symtab.c traditional.c
++	expr.c file-map.c files.c identifiers.c init.c lex.c line-map.c \
++	macro.c mkdeps.c pch.c symtab.c traditional.c
+ 
+ all: libcpp.a $(USED_CATALOGS)
+ 
+@@ -263,7 +263,7 @@ po/$(PACKAGE).pot: $(libcpp_a_SOURCES)
+ 
+ TAGS_SOURCES = $(libcpp_a_SOURCES) internal.h ucnid.h \
+     include/line-map.h include/symtab.h include/cpp-id-data.h \
+-    include/cpplib.h include/mkdeps.h system.h
++    include/cpplib.h include/mkdeps.h system.h include/file-map.h
+ 
+ TAGS: $(TAGS_SOURCES)
+ 	cd $(srcdir) && etags $(TAGS_SOURCES)
+diff --git a/libcpp/file-map.c b/libcpp/file-map.c
+new file mode 100644
+index 0000000..18035ef
+--- /dev/null
++++ b/libcpp/file-map.c
+@@ -0,0 +1,92 @@
++/* Map one directory name to another in __FILE__, __BASE_FILE__
++   and __builtin_FILE ().
++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
++
++This program is free software; you can redistribute it and/or modify it
++under the terms of the GNU General Public License as published by the
++Free Software Foundation; either version 3, or (at your option) any
++later version.
++
++This program is distributed in the hope that it will be useful,
++but WITHOUT ANY WARRANTY; without even the implied warranty of
++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++GNU General Public License for more details.
++
++You should have received a copy of the GNU General Public License
++along with this program; see the file COPYING3.  If not see
++<http://www.gnu.org/licenses/>.
++
++ In other words, you are welcome to use, share and improve this program.
++ You are forbidden to forbid anyone else to use, share and improve
++ what you give them.   Help stamp out software-hoarding!  */
++
++#include "config.h"
++#include "system.h"
++#include "file-map.h"
++
++/* Structure recording the mapping from source file and directory
++   names at compile time to __FILE__ */
++typedef struct file_prefix_map
++{
++  const char *old_prefix;
++  const char *new_prefix;
++  size_t old_len;
++  size_t new_len;
++  struct file_prefix_map *next;
++} file_prefix_map;
++
++/* Linked list of such structures.  */
++static file_prefix_map *file_prefix_maps;
++
++/* Record prefix mapping of __FILE__.  ARG is the argument to
++   -ffile-prefix-map and must be of the form OLD=NEW.  */
++int
++add_file_prefix_map (const char *arg)
++{
++  file_prefix_map *map;
++  const char *p;
++
++  p = strchr (arg, '=');
++  if (!p)
++  {
++      fprintf(stderr, "invalid argument %qs to -ffile-prefix-map", arg);
++      return -1;
++  }
++  map = XNEW (file_prefix_map);
++  map->old_prefix = xstrndup (arg, p - arg);
++  map->old_len = p - arg;
++  p++;
++  map->new_prefix = xstrdup (p);
++  map->new_len = strlen (p);
++  map->next = file_prefix_maps;
++  file_prefix_maps = map;
++
++  return 0;
++}
++
++/* Perform user-specified mapping of __FILE__ prefixes.  Return
++   the new name corresponding to filename.  */
++
++const char *
++remap_file_filename (const char *filename)
++{
++  file_prefix_map *map;
++  char *s;
++  const char *name;
++  size_t name_len;
++
++  for (map = file_prefix_maps; map; map = map->next)
++    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++      break;
++  if (!map)
++    return filename;
++  name = filename + map->old_len;
++  name_len = strlen (name) + 1;
++  s = (char *) alloca (name_len + map->new_len);
++  memcpy (s, map->new_prefix, map->new_len);
++  memcpy (s + map->new_len, name, name_len);
++
++  return xstrdup (s);
++}
++
++
+diff --git a/libcpp/include/file-map.h b/libcpp/include/file-map.h
+new file mode 100644
+index 0000000..8750315
+--- /dev/null
++++ b/libcpp/include/file-map.h
+@@ -0,0 +1,30 @@
++/* Map one directory name to another in __FILE__, __BASE_FILE__
++   and __builtin_FILE ().
++   Copyright (C) 2001-2016 Free Software Foundation, Inc.
++
++This program is free software; you can redistribute it and/or modify it
++under the terms of the GNU General Public License as published by the
++Free Software Foundation; either version 3, or (at your option) any
++later version.
++
++This program is distributed in the hope that it will be useful,
++but WITHOUT ANY WARRANTY; without even the implied warranty of
++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++GNU General Public License for more details.
++
++You should have received a copy of the GNU General Public License
++along with this program; see the file COPYING3.  If not see
++<http://www.gnu.org/licenses/>.
++
++ In other words, you are welcome to use, share and improve this program.
++ You are forbidden to forbid anyone else to use, share and improve
++ what you give them.   Help stamp out software-hoarding!  */
++
++#ifndef LIBCPP_FILE_MAP_H
++#define LIBCPP_FILE_MAP_H
++
++const char * remap_file_filename (const char *filename);
++
++int add_file_prefix_map (const char *arg);
++
++#endif /* !LIBCPP_FILE_MAP_H  */
+diff --git a/libcpp/macro.c b/libcpp/macro.c
+index c251553..3ceec3d 100644
+--- a/libcpp/macro.c
++++ b/libcpp/macro.c
+@@ -26,6 +26,7 @@ along with this program; see the file COPYING3.  If not see
+ #include "system.h"
+ #include "cpplib.h"
+ #include "internal.h"
++#include "file-map.h"
+ 
+ typedef struct macro_arg macro_arg;
+ /* This structure represents the tokens of a macro argument.  These
+@@ -301,6 +302,7 @@ _cpp_builtin_macro_text (cpp_reader *pfile, cpp_hashnode *node,
+ 	    if (!name)
+ 	      abort ();
+ 	  }
++	name = remap_file_filename (name);
+ 	len = strlen (name);
+ 	buf = _cpp_unaligned_alloc (pfile, len * 2 + 3);
+ 	result = buf;
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-6.1/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
new file mode 100644
index 0000000..0077f80
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
@@ -0,0 +1,43 @@
+From 25c87c6cc40ec5cc6965f8bfb215bec01abd6d82 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 16 Mar 2016 05:39:59 -0400
+Subject: [PATCH 43/46] Reuse -fdebug-prefix-map to replace -ffile-prefix-map
+
+The oe-core may use external toolchain to compile,
+which may not support -ffile-prefix-map.
+
+Since we use -fdebug-prefix-map to do the same thing,
+so we could reuse it to replace -ffile-prefix-map.
+
+Upstream-Status: Inappropriate[oe-core specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/opts-global.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gcc/opts-global.c b/gcc/opts-global.c
+index b7e5232..121d7b9 100644
+--- a/gcc/opts-global.c
++++ b/gcc/opts-global.c
+@@ -31,6 +31,7 @@ along with GCC; see the file COPYING3.  If not see
+ #include "langhooks.h"
+ #include "dbgcnt.h"
+ #include "debug.h"
++#include "file-map.h"
+ #include "output.h"
+ #include "plugin.h"
+ #include "toplev.h"
+@@ -357,6 +358,9 @@ handle_common_deferred_options (void)
+ 
+ 	case OPT_fdebug_prefix_map_:
+ 	  add_debug_prefix_map (opt->arg);
++
++	  /* Reuse -fdebug-prefix-map to replace -ffile-prefix-map */
++	  add_file_prefix_map (opt->arg);
+ 	  break;
+ 
+ 	case OPT_fdump_:
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-6.1/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
new file mode 100644
index 0000000..5d41af4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
@@ -0,0 +1,54 @@
+From 6ab23e88aef22bbabee7b9600c459ff39547bb66 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 24 Mar 2016 11:23:14 -0400
+Subject: [PATCH 44/46] gcc/final.c: -fdebug-prefix-map support to remap
+ sources with relative path
+
+PR other/70428
+* final.c (remap_debug_filename): Use lrealpath to translate
+relative path before remapping
+
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70428
+Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc/final.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/final.c b/gcc/final.c
+index 55cf509..23293e5 100644
+--- a/gcc/final.c
++++ b/gcc/final.c
+@@ -1554,16 +1554,25 @@ remap_debug_filename (const char *filename)
+   const char *name;
+   size_t name_len;
+ 
++  /* Support to remap filename with relative path  */
++  char *realpath = lrealpath (filename);
++  if (realpath == NULL)
++    return filename;
++
+   for (map = debug_prefix_maps; map; map = map->next)
+-    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
++    if (filename_ncmp (realpath, map->old_prefix, map->old_len) == 0)
+       break;
+   if (!map)
+-    return filename;
+-  name = filename + map->old_len;
++    {
++      free (realpath);
++      return filename;
++    }
++  name = realpath + map->old_len;
+   name_len = strlen (name) + 1;
+   s = (char *) alloca (name_len + map->new_len);
+   memcpy (s, map->new_prefix, map->new_len);
+   memcpy (s + map->new_len, name, name_len);
++  free (realpath);
+   return ggc_strdup (s);
+ }
+ 
+-- 
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-6.1/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
new file mode 100644
index 0000000..c62b727
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
@@ -0,0 +1,125 @@
+From 5a47d404ea29e2547269e3ddf38754462d93f903 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Apr 2016 20:03:28 +0000
+Subject: [PATCH 45/46] libgcc: Add knob to use ldbl-128 on ppc
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
+index f09b39b..296cf0f 100644
+--- a/libgcc/Makefile.in
++++ b/libgcc/Makefile.in
+@@ -43,6 +43,7 @@ enable_vtable_verify = @enable_vtable_verify@
+ enable_decimal_float = @enable_decimal_float@
+ fixed_point = @fixed_point@
+ with_aix_soname = @with_aix_soname@
++with_ldbl128 = @with_ldbl128@
+ 
+ host_noncanonical = @host_noncanonical@
+ real_host_noncanonical = @real_host_noncanonical@
+diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-linux
+index 4f6d4c4..c50dd94 100644
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
+index e7d6c75..e9a9019
+--- a/libgcc/configure
++++ b/libgcc/configure
+@@ -614,6 +614,7 @@ build_vendor
+ build_cpu
+ build
+ with_aix_soname
++with_ldbl128
+ enable_vtable_verify
+ enable_shared
+ libgcc_topdir
+@@ -663,6 +664,7 @@ with_cross_host
+ with_ld
+ enable_shared
+ enable_vtable_verify
++with_long_double_128
+ with_aix_soname
+ enable_version_specific_runtime_libs
+ with_slibdir
+@@ -1319,6 +1321,7 @@ Optional Packages:
+   --with-target-subdir=SUBDIR      Configuring in a subdirectory for target
+   --with-cross-host=HOST           Configuring with a cross compiler
+   --with-ld               arrange to use the specified ld (full pathname)
++  --with-long-double-128  use 128-bit long double by default
+   --with-aix-soname=aix|svr4|both
+                           shared library versioning (aka "SONAME") variant to
+                           provide on AIX
+@@ -2201,6 +2204,21 @@ fi
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
+index 269997f..81dc3ba 100644
+--- a/libgcc/configure.ac
++++ b/libgcc/configure.ac
+@@ -77,6 +77,18 @@ AC_ARG_ENABLE(vtable-verify,
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.1/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-6.1/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
new file mode 100644
index 0000000..390037f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.1/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -0,0 +1,29 @@
+From 513bf3c33e2f551f08bd57605091d5ddeba3536b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 May 2016 21:11:34 -0700
+Subject: [PATCH 46/46] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
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
+index 8c5f890..29be909 100644
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
+2.8.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.1.bb
new file mode 100644
index 0000000..bf53c5c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.1.bb
@@ -0,0 +1,5 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-cross-canadian.inc
+
+
+
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_6.1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_6.1.bb
new file mode 100644
index 0000000..4c73e5c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial_6.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-cross_${PV}.bb
+require gcc-cross-initial.inc
diff --git a/meta/recipes-devtools/gcc/gcc-cross_6.1.bb b/meta/recipes-devtools/gcc/gcc-cross_6.1.bb
new file mode 100644
index 0000000..b43cca0
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-cross_6.1.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-cross.inc
+
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.1.bb
new file mode 100644
index 0000000..fd90e11
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.1.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
+require gcc-crosssdk-initial.inc
+
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_6.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_6.1.bb
new file mode 100644
index 0000000..40a6c4f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk_6.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-cross_${PV}.bb
+require gcc-crosssdk.inc
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_6.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_6.1.bb
new file mode 100644
index 0000000..8f31e77
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-runtime_6.1.bb
@@ -0,0 +1,7 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-runtime.inc
+
+FILES_libgomp-dev += "\
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
+"
+
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_6.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_6.1.bb
new file mode 100644
index 0000000..601f666
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers_6.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-sanitizers.inc
diff --git a/meta/recipes-devtools/gcc/gcc-source_6.1.bb b/meta/recipes-devtools/gcc/gcc-source_6.1.bb
new file mode 100644
index 0000000..b890fa3
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-source_6.1.bb
@@ -0,0 +1,4 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require recipes-devtools/gcc/gcc-source.inc
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/gcc/gcc_6.1.bb b/meta/recipes-devtools/gcc/gcc_6.1.bb
new file mode 100644
index 0000000..b0a523c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc_6.1.bb
@@ -0,0 +1,15 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require gcc-target.inc
+
+# Building with thumb enabled on armv4t fails with
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
+ARM_INSTRUCTION_SET_armv4 = "arm"
+
+do_configure_prepend() {
+	# Easiest way to stop bad RPATHs getting into the library since we have a
+	# broken libtool here
+	sed -i -e 's/hardcode_into_libs=yes/hardcode_into_libs=no/' ${S}/libcc1/configure
+}
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_6.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_6.1.bb
new file mode 100644
index 0000000..19f253f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc-initial_6.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgcc-initial.inc
diff --git a/meta/recipes-devtools/gcc/libgcc_6.1.bb b/meta/recipes-devtools/gcc/libgcc_6.1.bb
new file mode 100644
index 0000000..a5152f2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgcc_6.1.bb
@@ -0,0 +1,2 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgcc.inc
diff --git a/meta/recipes-devtools/gcc/libgfortran_6.1.bb b/meta/recipes-devtools/gcc/libgfortran_6.1.bb
new file mode 100644
index 0000000..71dd8b4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/libgfortran_6.1.bb
@@ -0,0 +1,3 @@
+require recipes-devtools/gcc/gcc-${PV}.inc
+require libgfortran.inc
+
-- 
2.8.2


