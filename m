Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA0078289
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 11:58:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBJBwUUp010246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 19 Dec 2017 11:58:31 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eRGXW-0004KP-SH; Tue, 19 Dec 2017 11:58:30 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 11:58:29 +0000
Message-Id: <1513684709-16598-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] gcc: Drop 6.4
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
X-List-Received-Date: Tue, 19 Dec 2017 11:58:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We've had 7.x around for long enough now that it should be tested and usable
everywhere, drop 6.4.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              | 131 ---------
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  42 ---
 .../gcc/gcc-6.4/0008-missing-execinfo_h.patch      |  28 --
 .../gcc/gcc-6.4/0009-c99-snprintf.patch            |  28 --
 .../0010-gcc-poison-system-directories.patch       | 192 --------------
 .../gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch   |  39 ---
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  73 ------
 .../gcc/gcc-6.4/0013-64-bit-multilib-hack.patch    |  85 ------
 .../gcc/gcc-6.4/0014-optional-libstdc.patch        | 125 ---------
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  59 -----
 .../gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch     |  38 ---
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  96 -------
 .../gcc-6.4/0018-fortran-cross-compile-hack.patch  |  46 ----
 .../gcc/gcc-6.4/0019-cpp-honor-sysroot.patch       |  54 ----
 .../gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch   |  57 ----
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 234 -----------------
 ...0022-gcc-Fix-argument-list-too-long-error.patch |  40 ---
 .../gcc/gcc-6.4/0023-Disable-sdt.patch             | 113 --------
 .../gcc/gcc-6.4/0024-libtool.patch                 |  42 ---
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  43 ---
 ...tilib-config-files-from-B-instead-of-usin.patch | 102 -------
 ...-libdir-from-.la-which-usually-points-to-.patch |  31 ---
 .../gcc/gcc-6.4/0028-export-CPP.patch              |  53 ----
 ...AltiVec-generation-on-powepc-linux-target.patch |  56 ----
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  42 ---
 ...Ensure-target-gcc-headers-can-be-included.patch |  98 -------
 ...-t-build-with-disable-dependency-tracking.patch |  54 ----
 ...h-host-directory-during-relink-if-inst_pr.patch |  38 ---
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |  29 --
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |  28 --
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  54 ----
 ...-handle-sysroot-support-for-nativesdk-gcc.patch | 213 ---------------
 ...et-sysroot-gcc-version-specific-dirs-with.patch | 102 -------
 ...-various-_FOR_BUILD-and-related-variables.patch | 137 ----------
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |  28 --
 .../gcc/gcc-6.4/0041-ssp_nonshared.patch           |  28 --
 ...c-libcpp-support-ffile-prefix-map-old-new.patch | 292 ---------------------
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |  43 ---
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |  54 ----
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 125 ---------
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |  29 --
 ...e-alias-for-__cpu_indicator_init-instead-.patch |  85 ------
 .../gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch |  91 -------
 .../gcc/gcc-6.4/0054_all_nopie-all-flags.patch     |  22 --
 .../gcc/gcc-6.4/0055-unwind_h-glibc26.patch        | 139 ----------
 ...-relax-the-restriction-on-subreg-reload-f.patch |  51 ----
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 --------------
 .../gcc/gcc-6.4/backport/CVE-2016-6131.patch       | 223 ----------------
 .../recipes-devtools/gcc/gcc-cross-canadian_6.4.bb |   5 -
 meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb |   2 -
 meta/recipes-devtools/gcc/gcc-cross_6.4.bb         |   3 -
 .../gcc/gcc-crosssdk-initial_6.4.bb                |   3 -
 meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb      |   2 -
 meta/recipes-devtools/gcc/gcc-runtime_6.4.bb       |   7 -
 meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb    |   2 -
 meta/recipes-devtools/gcc/gcc-source_6.4.bb        |   4 -
 meta/recipes-devtools/gcc/gcc_6.4.bb               |   9 -
 meta/recipes-devtools/gcc/libgcc-initial_6.4.bb    |   2 -
 meta/recipes-devtools/gcc/libgcc_6.4.bb            |   2 -
 meta/recipes-devtools/gcc/libgfortran_6.4.bb       |   3 -
 60 files changed, 4050 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-source_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/libgcc_6.4.bb
 delete mode 100644 meta/recipes-devtools/gcc/libgfortran_6.4.bb

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
deleted file mode 100644
index 37e996a..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ /dev/null
@@ -1,131 +0,0 @@
-require gcc-common.inc
-
-# Third digit in PV should be incremented after a minor release
-
-PV = "6.4.0"
-
-# BINV should be incremented to a revision after a minor gcc release
-
-BINV = "6.4.0"
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-6.4:${FILE_DIRNAME}/gcc-6.4/backport:"
-
-DEPENDS =+ "mpfr gmp libmpc zlib"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
-
-LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
-
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-    file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
-"
-
-
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
-#SRCREV = "bd9a826d5448db11d29d2ec5884e7e679066f140"
-#BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
-#BASEURI ?= "ftp://sourceware.org/pub/gcc/snapshots/6.2.0-RC-20160815/gcc-6.2.0-RC-20160815.tar.bz2"
-
-SRC_URI = "\
-           ${BASEURI} \
-           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-           file://0008-missing-execinfo_h.patch \
-           file://0009-c99-snprintf.patch \
-           file://0010-gcc-poison-system-directories.patch \
-           file://0011-gcc-poison-dir-extend.patch \
-           file://0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
-           file://0013-64-bit-multilib-hack.patch \
-           file://0014-optional-libstdc.patch \
-           file://0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
-           file://0016-COLLECT_GCC_OPTIONS.patch \
-           file://0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-           file://0018-fortran-cross-compile-hack.patch \
-           file://0019-cpp-honor-sysroot.patch \
-           file://0020-MIPS64-Default-to-N64-ABI.patch \
-           file://0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
-           file://0022-gcc-Fix-argument-list-too-long-error.patch \
-           file://0023-Disable-sdt.patch \
-           file://0024-libtool.patch \
-           file://0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
-           file://0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
-           file://0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
-           file://0028-export-CPP.patch \
-           file://0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
-           file://0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch \
-           file://0031-Ensure-target-gcc-headers-can-be-included.patch \
-           file://0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
-           file://0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
-           file://0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
-           file://0035-aarch64-Add-support-for-musl-ldso.patch \
-           file://0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
-           file://0037-handle-sysroot-support-for-nativesdk-gcc.patch \
-           file://0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0039-Fix-various-_FOR_BUILD-and-related-variables.patch \
-           file://0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0041-ssp_nonshared.patch \
-           file://0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch \
-           file://0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
-           file://0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
-           file://0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
-           file://0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
-           file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
-           file://0048-sync-gcc-stddef.h-with-musl.patch \
-           file://0054_all_nopie-all-flags.patch \
-           file://0055-unwind_h-glibc26.patch \
-           file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch \
-           ${BACKPORTS} \
-"
-BACKPORTS = "\
-           file://CVE-2016-6131.patch \
-           file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
-"
-SRC_URI[md5sum] = "11ba51a0cfb8471927f387c8895fe232"
-SRC_URI[sha256sum] = "850bf21eafdfe5cd5f6827148184c08c4a0852a37ccf36ce69855334d2c914d4"
-
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
-B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
-
-# Language Overrides
-FORTRAN = ""
-JAVA = ""
-
-LTO = "--enable-lto"
-
-EXTRA_OECONF_BASE = "\
-    ${LTO} \
-    --enable-libssp \
-    --enable-libitm \
-    --disable-bootstrap \
-    --disable-libmudflap \
-    --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
-    --enable-linker-build-id \
-    --with-ppl=no \
-    --with-cloog=no \
-    --enable-checking=release \
-    --enable-cheaders=c_global \
-    --without-isl \
-"
-
-EXTRA_OECONF_INITIAL = "\
-    --disable-libmudflap \
-    --disable-libgomp \
-    --disable-libitm \
-    --disable-libquadmath \
-    --with-system-zlib \
-    --disable-lto \
-    --disable-plugin \
-    --enable-decimal-float=no \
-    --without-isl \
-    gcc_cv_libc_provides_ssp=yes \
-"
-
-EXTRA_OECONF_PATHS = "\
-    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
-    --with-sysroot=/not/exist \
-    --with-build-sysroot=${STAGING_DIR_TARGET} \
-"
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
deleted file mode 100644
index 415f091..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 92ed30da16b7487b334f739be177eb39885ab772 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:37:11 +0400
-Subject: [PATCH 01/46] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 35f231e..bfadc33 100755
---- a/configure
-+++ b/configure
-@@ -7550,7 +7550,7 @@ fi
- # for target_alias and gcc doesn't manage it consistently.
- target_configargs="--cache-file=./config.cache ${target_configargs}"
- 
--FLAGS_FOR_TARGET=
-+FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
-diff --git a/configure.ac b/configure.ac
-index 74bf58a..197d61b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3149,7 +3149,7 @@ fi
- # for target_alias and gcc doesn't manage it consistently.
- target_configargs="--cache-file=./config.cache ${target_configargs}"
- 
--FLAGS_FOR_TARGET=
-+FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
deleted file mode 100644
index 01e7c95..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0008-missing-execinfo_h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6dde3da24ef4b9b357bca670d8551cab3fdda843 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:48:10 +0400
-Subject: [PATCH 08/46] missing-execinfo_h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- boehm-gc/include/gc.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/boehm-gc/include/gc.h b/boehm-gc/include/gc.h
-index 6b38f2d..fca98ff 100644
---- a/boehm-gc/include/gc.h
-+++ b/boehm-gc/include/gc.h
-@@ -503,7 +503,7 @@ GC_API GC_PTR GC_malloc_atomic_ignore_off_page GC_PROTO((size_t lb));
- #if defined(__linux__) || defined(__GLIBC__)
- # include <features.h>
- # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
--     && !defined(__ia64__)
-+     && !defined(__ia64__) && !defined(__UCLIBC__)
- #   ifndef GC_HAVE_BUILTIN_BACKTRACE
- #     define GC_HAVE_BUILTIN_BACKTRACE
- #   endif
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
deleted file mode 100644
index d62341a..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0009-c99-snprintf.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b794f1f1c1c7c06f3f0d78cf76c4fb90c2ab8dfb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:49:03 +0400
-Subject: [PATCH 09/46] c99-snprintf
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- libstdc++-v3/include/c_std/cstdio | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libstdc++-v3/include/c_std/cstdio b/libstdc++-v3/include/c_std/cstdio
-index a4119ba..8396f43 100644
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -144,7 +144,7 @@ namespace std
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99_STDIO
-+#if _GLIBCXX_USE_C99_STDIO || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch
deleted file mode 100644
index ac4cf44..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0010-gcc-poison-system-directories.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From d76250323dad69212c958e4857a98d99ab51a39e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:59:00 +0400
-Subject: [PATCH 10/46] gcc: poison-system-directories
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [distribution: codesourcery]
----
- gcc/common.opt      |  4 ++++
- gcc/config.in       |  6 ++++++
- gcc/configure       | 16 ++++++++++++++++
- gcc/configure.ac    | 10 ++++++++++
- gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.c           |  2 ++
- gcc/incpath.c       | 19 +++++++++++++++++++
- 7 files changed, 66 insertions(+)
-
-diff --git a/gcc/common.opt b/gcc/common.opt
-index 67048db..733185c 100644
---- a/gcc/common.opt
-+++ b/gcc/common.opt
-@@ -659,6 +659,10 @@ Wreturn-local-addr
- Common Var(warn_return_local_addr) Init(1) Warning
- Warn about returning a pointer/reference to a local or temporary variable.
- 
-+Wpoison-system-directories
-+Common Var(flag_poison_system_directories) Init(1) Warning
-+Warn for -I and -L options using system directories if cross compiling
-+
- Wshadow
- Common Var(warn_shadow) Warning
- Warn when one local variable shadows another.
-diff --git a/gcc/config.in b/gcc/config.in
-index 115cb61..105b30f 100644
---- a/gcc/config.in
-+++ b/gcc/config.in
-@@ -187,6 +187,12 @@
- #endif
- 
- 
-+/* Define to warn for use of native system header directories */
-+#ifndef USED_FOR_TARGET
-+#undef ENABLE_POISON_SYSTEM_DIRECTORIES
-+#endif
-+
-+
- /* Define if you want all operations on RTL (the basic data structure of the
-    optimizer and back end) to be checked for dynamic type safety at runtime.
-    This is quite expensive. */
-diff --git a/gcc/configure b/gcc/configure
-index 1c6e340..8f83152 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -942,6 +942,7 @@ with_system_zlib
- enable_maintainer_mode
- enable_link_mutex
- enable_version_specific_runtime_libs
-+enable_poison_system_directories
- enable_plugin
- enable_host_shared
- enable_libquadmath_support
-@@ -1681,6 +1682,8 @@ Optional Features:
-   --enable-version-specific-runtime-libs
-                           specify that runtime libraries should be installed
-                           in a compiler-specific directory
-+  --enable-poison-system-directories
-+                          warn for use of native system header directories
-   --enable-plugin         enable plugin support
-   --enable-host-shared    build host code as shared libraries
-   --disable-libquadmath-support
-@@ -28908,6 +28911,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
- fi
- 
- 
-+# Check whether --enable-poison-system-directories was given.
-+if test "${enable_poison_system_directories+set}" = set; then :
-+  enableval=$enable_poison_system_directories;
-+else
-+  enable_poison_system_directories=no
-+fi
-+
-+if test "x${enable_poison_system_directories}" = "xyes"; then
-+
-+$as_echo "#define ENABLE_POISON_SYSTEM_DIRECTORIES 1" >>confdefs.h
-+
-+fi
-+
- # Substitute configuration variables
- 
- 
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 6c1dcd9..0fccaef 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -5861,6 +5861,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
-                 [specify that runtime libraries should be
-                  installed in a compiler-specific directory])])
- 
-+AC_ARG_ENABLE([poison-system-directories],
-+             AS_HELP_STRING([--enable-poison-system-directories],
-+                            [warn for use of native system header directories]),,
-+             [enable_poison_system_directories=no])
-+if test "x${enable_poison_system_directories}" = "xyes"; then
-+  AC_DEFINE([ENABLE_POISON_SYSTEM_DIRECTORIES],
-+           [1],
-+           [Define to warn for use of native system header directories])
-+fi
-+
- # Substitute configuration variables
- AC_SUBST(subdirs)
- AC_SUBST(srcdir)
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 821f8fd..8bb49e7 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -284,6 +284,7 @@ Objective-C and Objective-C++ Dialects}.
- -Wparentheses -Wno-pedantic-ms-format @gol
- -Wplacement-new -Wplacement-new=@var{n} @gol
- -Wpointer-arith  -Wno-pointer-to-int-cast @gol
-+-Wno-poison-system-directories @gol
- -Wno-pragmas -Wredundant-decls  -Wno-return-local-addr @gol
- -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
- -Wshift-overflow -Wshift-overflow=@var{n} @gol
-@@ -4723,6 +4724,14 @@ made up of data only and thus requires no special treatment.  But, for
- most targets, it is made up of code and thus requires the stack to be
- made executable in order for the program to work properly.
- 
-+@item -Wno-poison-system-directories
-+@opindex Wno-poison-system-directories
-+Do not warn for @option{-I} or @option{-L} options using system
-+directories such as @file{/usr/include} when cross compiling.  This
-+option is intended for use in chroot environments when such
-+directories contain the correct headers and libraries for the target
-+system rather than the host.
-+
- @item -Wfloat-equal
- @opindex Wfloat-equal
- @opindex Wno-float-equal
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 1af5920..4cfef7f 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1017,6 +1017,8 @@ proper position among the other output files.  */
-    "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
-    "%X %{o*} %{e*} %{N} %{n} %{r}\
-     %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}} \
-+    %{Wno-poison-system-directories:--no-poison-system-directories} \
-+    %{Werror=poison-system-directories:--error-poison-system-directories} \
-     %{static:} %{L*} %(mfwrap) %(link_libgcc) " \
-     VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SPEC " \
-     %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
-diff --git a/gcc/incpath.c b/gcc/incpath.c
-index ea40f4a..856da41 100644
---- a/gcc/incpath.c
-+++ b/gcc/incpath.c
-@@ -26,6 +26,7 @@
- #include "intl.h"
- #include "incpath.h"
- #include "cppdefault.h"
-+#include "diagnostic-core.h"
- 
- /* Microsoft Windows does not natively support inodes.
-    VMS has non-numeric inodes.  */
-@@ -381,6 +382,24 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
- 	}
-       fprintf (stderr, _("End of search list.\n"));
-     }
-+
-+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
-+  if (flag_poison_system_directories)
-+    {
-+       struct cpp_dir *p;
-+
-+       for (p = heads[QUOTE]; p; p = p->next)
-+         {
-+          if ((!strncmp (p->name, "/usr/include", 12))
-+              || (!strncmp (p->name, "/usr/local/include", 18))
-+              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
-+            warning (OPT_Wpoison_system_directories,
-+                     "include location \"%s\" is unsafe for "
-+                     "cross-compilation",
-+                     p->name);
-+         }
-+    }
-+#endif
- }
- 
- /* Use given -I paths for #include "..." but not #include <...>, and
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
deleted file mode 100644
index a1736ae..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0011-gcc-poison-dir-extend.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a1c24b59def393e43cd50b6768604a212c788ed3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:00:34 +0400
-Subject: [PATCH 11/46] gcc-poison-dir-extend
-
-Add /sw/include and /opt/include based on the original
-zecke-no-host-includes.patch patch.  The original patch checked for
-/usr/include, /sw/include and /opt/include and then triggered a failure and
-aborted.
-
-Instead, we add the two missing items to the current scan.  If the user
-wants this to be a failure, they can add "-Werror=poison-system-directories".
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/incpath.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/incpath.c b/gcc/incpath.c
-index 856da41..d2fc82c 100644
---- a/gcc/incpath.c
-+++ b/gcc/incpath.c
-@@ -392,7 +392,9 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
-          {
-           if ((!strncmp (p->name, "/usr/include", 12))
-               || (!strncmp (p->name, "/usr/local/include", 18))
--              || (!strncmp (p->name, "/usr/X11R6/include", 18)))
-+              || (!strncmp (p->name, "/usr/X11R6/include", 18))
-+              || (!strncmp (p->name, "/sw/include", 11))
-+              || (!strncmp (p->name, "/opt/include", 12)))
-             warning (OPT_Wpoison_system_directories,
-                      "include location \"%s\" is unsafe for "
-                      "cross-compilation",
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
deleted file mode 100644
index 939b070..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 00ef5f0f2a8d3b33aeb1e55c0d23439f4dd495af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:08:31 +0400
-Subject: [PATCH 12/46] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
-
-Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
-
-This alternative patch is better because it lets you just use CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped target libraries are never compiled with the native compiler, it makes little sense to use different flags for stage1 and later stages. And it also makes little sense to use a different variable than CFLAGS_FOR_TARGET.
-
-Other changes I had to do include:
-
-- moving the creation of default CFLAGS_FOR_TARGET from Makefile.am to configure.ac, because otherwise the BOOT_CFLAGS are substituted into CFLAGS_FOR_TARGET (which is "-O2 -g $(CFLAGS)") via $(CFLAGS). It is also cleaner this way though.
-
-- passing the right CFLAGS to configure scripts as exported environment variables
-
-I also stopped passing LIBCFLAGS to configure scripts since they are unused in the whole src tree. And I updated the documentation as H-P reminded me to do.
-
-Bootstrapped/regtested i686-pc-linux-gnu, will commit to 4.4 shortly. Ok for 4.3?
-
-Signed-off-by: Paolo Bonzini  <bonzini@gnu.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- configure | 32 ++++++++++++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/configure b/configure
-index bfadc33..755d382 100755
---- a/configure
-+++ b/configure
-@@ -6819,6 +6819,38 @@ fi
- 
- 
- 
-+# During gcc bootstrap, if we use some random cc for stage1 then CFLAGS
-+# might be empty or "-g".  We don't require a C++ compiler, so CXXFLAGS
-+# might also be empty (or "-g", if a non-GCC C++ compiler is in the path).
-+# We want to ensure that TARGET libraries (which we know are built with
-+# gcc) are built with "-O2 -g", so include those options when setting
-+# CFLAGS_FOR_TARGET and CXXFLAGS_FOR_TARGET.
-+if test "x$CFLAGS_FOR_TARGET" = x; then
-+  CFLAGS_FOR_TARGET=$CFLAGS
-+  case " $CFLAGS " in
-+    *" -O2 "*) ;;
-+    *) CFLAGS_FOR_TARGET="-O2 $CFLAGS" ;;
-+  esac
-+  case " $CFLAGS " in
-+    *" -g "* | *" -g3 "*) ;;
-+    *) CFLAGS_FOR_TARGET="-g $CFLAGS" ;;
-+  esac
-+fi
-+
-+
-+if test "x$CXXFLAGS_FOR_TARGET" = x; then
-+  CXXFLAGS_FOR_TARGET=$CXXFLAGS
-+  case " $CXXFLAGS " in
-+    *" -O2 "*) ;;
-+    *) CXXFLAGS_FOR_TARGET="-O2 $CXXFLAGS" ;;
-+  esac
-+  case " $CXXFLAGS " in
-+    *" -g "* | *" -g3 "*) ;;
-+    *) CXXFLAGS_FOR_TARGET="-g $CXXFLAGS" ;;
-+  esac
-+fi
-+
-+
- # Handle --with-headers=XXX.  If the value is not "yes", the contents of
- # the named directory are copied to $(tooldir)/sys-include.
- if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
deleted file mode 100644
index e31cde4..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0013-64-bit-multilib-hack.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 7fc7a070ac53a55950a1eac76f02877d4106b4b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:10:06 +0400
-Subject: [PATCH 13/46] 64-bit multilib hack.
-
-GCC has internal multilib handling code but it assumes a very specific rigid directory
-layout. The build system implementation of multilib layout is very generic and allows
-complete customisation of the library directories.
-
-This patch is a partial solution to allow any custom directories to be passed into gcc
-and handled correctly. It forces gcc to use the base_libdir (which is the current
-directory, "."). We need to do this for each multilib that is configured as we don't
-know which compiler options may be being passed into the compiler. Since we have a compiler
-per mulitlib at this point that isn't an issue.
-
-The one problem is the target compiler is only going to work for the default multlilib at
-this point. Ideally we'd figure out which multilibs were being enabled with which paths
-and be able to patch these entries with a complete set of correct paths but this we
-don't have such code at this point. This is something the target gcc recipe should do
-and override these platform defaults in its build config.
-
-RP 15/8/11
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/config/i386/t-linux64   |  6 ++----
- gcc/config/mips/t-linux64   | 10 +++-------
- gcc/config/rs6000/t-linux64 |  5 ++---
- 3 files changed, 7 insertions(+), 14 deletions(-)
-
-diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index c0cc8a3..365a5d6 100644
---- a/gcc/config/i386/t-linux64
-+++ b/gcc/config/i386/t-linux64
-@@ -32,7 +32,5 @@
- #
- comma=,
- MULTILIB_OPTIONS    = $(subst $(comma),/,$(TM_MULTILIB_CONFIG))
--MULTILIB_DIRNAMES   = $(patsubst m%, %, $(subst /, ,$(MULTILIB_OPTIONS)))
--MULTILIB_OSDIRNAMES = m64=../lib64$(call if_multiarch,:x86_64-linux-gnu)
--MULTILIB_OSDIRNAMES+= m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:i386-linux-gnu)
--MULTILIB_OSDIRNAMES+= mx32=../libx32$(call if_multiarch,:x86_64-linux-gnux32)
-+MULTILIB_DIRNAMES = . .
-+MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
-diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index 16c8adf..b932ace 100644
---- a/gcc/config/mips/t-linux64
-+++ b/gcc/config/mips/t-linux64
-@@ -17,10 +17,6 @@
- # <http://www.gnu.org/licenses/>.
- 
- MULTILIB_OPTIONS = mabi=n32/mabi=32/mabi=64
--MULTILIB_DIRNAMES = n32 32 64
--MIPS_EL = $(if $(filter %el, $(firstword $(subst -, ,$(target)))),el)
--MIPS_SOFT = $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cpu_default)) $(filter soft, $(with_float))),soft)
--MULTILIB_OSDIRNAMES = \
--	../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT)) \
--	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
--	../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
-+MULTILIB_DIRNAMES = . . .
-+MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
-+
-diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index fa7550b..9b5d9ef 100644
---- a/gcc/config/rs6000/t-linux64
-+++ b/gcc/config/rs6000/t-linux64
-@@ -26,10 +26,9 @@
- # MULTILIB_OSDIRNAMES according to what is found on the target.
- 
- MULTILIB_OPTIONS    := m64/m32
--MULTILIB_DIRNAMES   := 64 32
-+MULTILIB_DIRNAMES   := . .
- MULTILIB_EXTRA_OPTS := 
--MULTILIB_OSDIRNAMES := m64=../lib64$(call if_multiarch,:powerpc64-linux-gnu)
--MULTILIB_OSDIRNAMES += m32=$(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)$(call if_multiarch,:powerpc-linux-gnu)
-+MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
- 
- rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
- 	$(COMPILE) $<
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
deleted file mode 100644
index 44b0cc7..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0014-optional-libstdc.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 36275f7981bdaf919bbc9b51a7c7fae1e192adb3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:12:56 +0400
-Subject: [PATCH 14/46] optional libstdc
-
-gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
-will not run correctly since by default the linker will try to link against libstdc++
-which shouldn't exist yet. We need an option to disable -lstdc++
-option whilst leaving -lc, -lgcc and other automatic library dependencies added by gcc
-driver. This patch adds such an option which only disables the -lstdc++.
-
-A "standard" gcc build uses xgcc and hence avoids this. We should ask upstream how to
-do this officially, the likely answer is don't build libstdc++ separately.
-
-RP 29/6/10
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- gcc/c-family/c.opt  |  4 ++++
- gcc/cp/g++spec.c    |  1 +
- gcc/doc/invoke.texi | 32 +++++++++++++++++++++++++++++++-
- gcc/gcc.c           |  1 +
- 4 files changed, 37 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 4f86876..660da6c 100644
---- a/gcc/c-family/c.opt
-+++ b/gcc/c-family/c.opt
-@@ -1647,6 +1647,10 @@ nostdinc++
- C++ ObjC++
- Do not search standard system include directories for C++.
- 
-+nostdlib++
-+Driver
-+Do not link standard C++ runtime library
-+
- o
- C ObjC C++ ObjC++ Joined Separate
- ; Documented in common.opt
-diff --git a/gcc/cp/g++spec.c b/gcc/cp/g++spec.c
-index 03cbde0..3642540 100644
---- a/gcc/cp/g++spec.c
-+++ b/gcc/cp/g++spec.c
-@@ -137,6 +137,7 @@ lang_specific_driver (struct cl_decoded_option **in_decoded_options,
-       switch (decoded_options[i].opt_index)
- 	{
- 	case OPT_nostdlib:
-+	case OPT_nostdlib__:
- 	case OPT_nodefaultlibs:
- 	  library = -1;
- 	  break;
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 8bb49e7..84d68aa 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -207,6 +207,9 @@ in the following sections.
- -fno-weak  -nostdinc++ @gol
- -fvisibility-inlines-hidden @gol
- -fvisibility-ms-compat @gol
-+-fvtable-verify=@r{[}std@r{|}preinit@r{|}none@r{]} @gol
-+-fvtv-counts -fvtv-debug @gol
-+-nostdlib++ @gol
- -fext-numeric-literals @gol
- -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @gol
- -Wdelete-non-virtual-dtor -Wliteral-suffix -Wmultiple-inheritance @gol
-@@ -470,7 +473,7 @@ Objective-C and Objective-C++ Dialects}.
- -s  -static -static-libgcc -static-libstdc++ @gol
- -static-libasan -static-libtsan -static-liblsan -static-libubsan @gol
- -static-libmpx -static-libmpxwrappers @gol
---shared -shared-libgcc  -symbolic @gol
-+-shared -shared-libgcc  -symbolic -nostdlib++ @gol
- -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
- -u @var{symbol} -z @var{keyword}}
- 
-@@ -10601,6 +10604,33 @@ library subroutines.
- constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
- GNU Compiler Collection (GCC) Internals}.)
- 
-+@item -nostdlib++
-+@opindex nostdlib++
-+Do not use the standard system C++ runtime libraries when linking.
-+Only the libraries you specify will be passed to the linker.
-+
-+@cindex @option{-lgcc}, use with @option{-nostdlib}
-+@cindex @option{-nostdlib} and unresolved references
-+@cindex unresolved references and @option{-nostdlib}
-+@cindex @option{-lgcc}, use with @option{-nodefaultlibs}
-+@cindex @option{-nodefaultlibs} and unresolved references
-+@cindex unresolved references and @option{-nodefaultlibs}
-+One of the standard libraries bypassed by @option{-nostdlib} and
-+@option{-nodefaultlibs} is @file{libgcc.a}, a library of internal subroutines
-+which GCC uses to overcome shortcomings of particular machines, or special
-+needs for some languages.
-+(@xref{Interface,,Interfacing to GCC Output,gccint,GNU Compiler
-+Collection (GCC) Internals},
-+for more discussion of @file{libgcc.a}.)
-+In most cases, you need @file{libgcc.a} even when you want to avoid
-+other standard libraries.  In other words, when you specify @option{-nostdlib}
-+or @option{-nodefaultlibs} you should usually specify @option{-lgcc} as well.
-+This ensures that you have no unresolved references to internal GCC
-+library subroutines.
-+(An example of such an internal subroutine is @code{__main}, used to ensure C++
-+constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
-+GNU Compiler Collection (GCC) Internals}.)
-+
- @item -pie
- @opindex pie
- Produce a position independent executable on targets that support it.
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 4cfef7f..da0b482 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1028,6 +1028,7 @@ proper position among the other output files.  */
-     %(mflib) " STACK_SPLIT_SPEC "\
-     %{fprofile-arcs|fprofile-generate*|coverage:-lgcov} " SANITIZER_SPEC " \
-     %{!nostdlib:%{!nodefaultlibs:%(link_ssp) %(link_gcc_c_sequence)}}\
-+    %{!nostdlib++:}\
-     %{!nostdlib:%{!nostartfiles:%E}} %{T*}  \n%(post_link) }}}}}}"
- #endif
- 
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
deleted file mode 100644
index 6fc7346..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 9346f6042d8f7f85a75ca2af15f3b8d234985165 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:14:20 +0400
-Subject: [PATCH 15/46] gcc: disable MASK_RELAX_PIC_CALLS bit
-
-The new feature added after 4.3.3
-"http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
-will cause cc1plus eat up all the system memory when build webkit-gtk.
-The function mips_get_pic_call_symbol keeps on recursively calling itself.
-Disable this feature to walk aside the bug.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [configuration]
----
- gcc/configure    | 7 -------
- gcc/configure.ac | 7 -------
- 2 files changed, 14 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index 8f83152..5e72f17 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -27018,13 +27018,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
-         rm -f conftest.*
-       fi
-     fi
--    if test $gcc_cv_as_ld_jalr_reloc = yes; then
--      if test x$target_cpu_default = x; then
--        target_cpu_default=MASK_RELAX_PIC_CALLS
--      else
--        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
--      fi
--    fi
-     { $as_echo "$as_me:${as_lineno-$LINENO}: result: $gcc_cv_as_ld_jalr_reloc" >&5
- $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
- 
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 0fccaef..dd8f6fa 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -4522,13 +4522,6 @@ x:
-         rm -f conftest.*
-       fi
-     fi
--    if test $gcc_cv_as_ld_jalr_reloc = yes; then
--      if test x$target_cpu_default = x; then
--        target_cpu_default=MASK_RELAX_PIC_CALLS
--      else
--        target_cpu_default="($target_cpu_default)|MASK_RELAX_PIC_CALLS"
--      fi
--    fi
-     AC_MSG_RESULT($gcc_cv_as_ld_jalr_reloc)
- 
-     AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
deleted file mode 100644
index c154864..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0016-COLLECT_GCC_OPTIONS.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1033bc2d4efc5c301bb822b607a673f5b10cc69f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:16:28 +0400
-Subject: [PATCH 16/46] COLLECT_GCC_OPTIONS
-
-This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
-invoke collect2.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/gcc.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index da0b482..7ca129f 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -4591,6 +4591,15 @@ set_collect_gcc_options (void)
- 		sizeof ("COLLECT_GCC_OPTIONS=") - 1);
- 
-   first_time = TRUE;
-+#ifdef HAVE_LD_SYSROOT
-+  if (target_system_root_changed && target_system_root)
-+    {
-+      obstack_grow (&collect_obstack, "'--sysroot=", sizeof("'--sysroot=")-1);
-+      obstack_grow (&collect_obstack, target_system_root,strlen(target_system_root));
-+      obstack_grow (&collect_obstack, "'", 1);
-+      first_time = FALSE;
-+    }
-+#endif
-   for (i = 0; (int) i < n_switches; i++)
-     {
-       const char *const *args;
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
deleted file mode 100644
index 0dbabd9..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 67123a306880af997a99ae514677c2da4973bd1a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:17:25 +0400
-Subject: [PATCH 17/46] Use the defaults.h in ${B} instead of ${S}, and t-oe in
- ${B}
-
-Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
-the source can be shared between gcc-cross-initial,
-gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-While compiling gcc-crosssdk-initial-x86_64 on some host, there is
-occasionally failure that test the existance of default.h doesn't
-work, the reason is tm_include_list='** defaults.h' rather than
-tm_include_list='** ./defaults.h'
-
-So we add the test condition for this situation.
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/Makefile.in  | 2 +-
- gcc/configure    | 4 ++--
- gcc/configure.ac | 4 ++--
- gcc/mkconfig.sh  | 4 ++--
- 4 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 6c5adc0..9a1d466 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -517,7 +517,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
- TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
- 
- xmake_file=@xmake_file@
--tmake_file=@tmake_file@
-+tmake_file=@tmake_file@ ./t-oe
- TM_ENDIAN_CONFIG=@TM_ENDIAN_CONFIG@
- TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
- TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
-diff --git a/gcc/configure b/gcc/configure
-index 5e72f17..389b6d5 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -12130,8 +12130,8 @@ for f in $tm_file; do
-        tm_include_list="${tm_include_list} $f"
-        ;;
-     defaults.h )
--       tm_file_list="${tm_file_list} \$(srcdir)/$f"
--       tm_include_list="${tm_include_list} $f"
-+       tm_file_list="${tm_file_list} ./$f"
-+       tm_include_list="${tm_include_list} ./$f"
-        ;;
-     * )
-        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index dd8f6fa..91ac800 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -1883,8 +1883,8 @@ for f in $tm_file; do
-        tm_include_list="${tm_include_list} $f"
-        ;;
-     defaults.h )
--       tm_file_list="${tm_file_list} \$(srcdir)/$f"
--       tm_include_list="${tm_include_list} $f"
-+       tm_file_list="${tm_file_list} ./$f"
-+       tm_include_list="${tm_include_list} ./$f"
-        ;;
-     * )
-        tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
-diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index 67dfac6..b73e08d 100644
---- a/gcc/mkconfig.sh
-+++ b/gcc/mkconfig.sh
-@@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
-     if [ $# -ge 1 ]; then
- 	echo '#ifdef IN_GCC' >> ${output}T
- 	for file in "$@"; do
--	    if test x"$file" = x"defaults.h"; then
-+	    if test x"$file" = x"./defaults.h" -o x"$file" = x"defaults.h"; then
- 		postpone_defaults_h="yes"
- 	    else
- 		echo "# include \"$file\"" >> ${output}T
-@@ -109,7 +109,7 @@ esac
- 
- # If we postponed including defaults.h, add the #include now.
- if test x"$postpone_defaults_h" = x"yes"; then
--    echo "# include \"defaults.h\"" >> ${output}T
-+    echo "# include \"./defaults.h\"" >> ${output}T
- fi
- 
- # Add multiple inclusion protection guard, part two.
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch
deleted file mode 100644
index b43d89e..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0018-fortran-cross-compile-hack.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e360dc3e0f1e0b9b001ef722fcf66f8120a03dbc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:20:01 +0400
-Subject: [PATCH 18/46] fortran cross-compile hack.
-
-* Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
-used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
-directory.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- libgfortran/configure    | 2 +-
- libgfortran/configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libgfortran/configure b/libgfortran/configure
-index f746f6f..b4f3278 100755
---- a/libgfortran/configure
-+++ b/libgfortran/configure
-@@ -12734,7 +12734,7 @@ esac
- 
- # We need gfortran to compile parts of the library
- #AC_PROG_FC(gfortran)
--FC="$GFORTRAN"
-+#FC="$GFORTRAN"
- ac_ext=${ac_fc_srcext-f}
- ac_compile='$FC -c $FCFLAGS $ac_fcflags_srcext conftest.$ac_ext >&5'
- ac_link='$FC -o conftest$ac_exeext $FCFLAGS $LDFLAGS $ac_fcflags_srcext conftest.$ac_ext $LIBS >&5'
-diff --git a/libgfortran/configure.ac b/libgfortran/configure.ac
-index 8f377bb..67710b5 100644
---- a/libgfortran/configure.ac
-+++ b/libgfortran/configure.ac
-@@ -240,7 +240,7 @@ AC_SUBST(enable_static)
- 
- # We need gfortran to compile parts of the library
- #AC_PROG_FC(gfortran)
--FC="$GFORTRAN"
-+#FC="$GFORTRAN"
- AC_PROG_FC(gfortran)
- 
- # extra LD Flags which are required for targets
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
deleted file mode 100644
index 417a5ed..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0019-cpp-honor-sysroot.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 98d9c0c1b5552294b2130f7304bfb522da323442 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:22:00 +0400
-Subject: [PATCH 19/46] cpp: honor sysroot.
-
-Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
-preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
-rather than the --sysroot option specified on the commandline. If access to that directory is
-permission denied (unreadable), gcc will error.
-
-This happens when ccache is in use due to the fact it uses preprocessed source files.
-
-The fix below adds %I to the cpp-output spec macro so the default substitutions for -iprefix,
--isystem, -isysroot happen and the correct sysroot is used.
-
-[YOCTO #2074]
-
-RP 2012/04/13
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/cp/lang-specs.h | 2 +-
- gcc/gcc.c           | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index 9707fac..fe487a2 100644
---- a/gcc/cp/lang-specs.h
-+++ b/gcc/cp/lang-specs.h
-@@ -64,5 +64,5 @@ along with GCC; see the file COPYING3.  If not see
-   {".ii", "@c++-cpp-output", 0, 0, 0},
-   {"@c++-cpp-output",
-    "%{!M:%{!MM:%{!E:\
--    cc1plus -fpreprocessed %i %(cc1_options) %2\
-+    cc1plus -fpreprocessed %i %I %(cc1_options) %2\
-     %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 7ca129f..04fa81d 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1329,7 +1329,7 @@ static const struct compiler default_compilers[] =
- 					   %W{o*:--output-pch=%*}}%V}}}}}}}", 0, 0, 0},
-   {".i", "@cpp-output", 0, 0, 0},
-   {"@cpp-output",
--   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
-+   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %I %(cc1_options) %{!fsyntax-only:%(invoke_as)}}}}", 0, 0, 0},
-   {".s", "@assembler", 0, 0, 0},
-   {"@assembler",
-    "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch
deleted file mode 100644
index ba612f5..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0020-MIPS64-Default-to-N64-ABI.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 1f15447fbcf65142627af8a9694761534da8d0d1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:23:08 +0400
-Subject: [PATCH 20/46] MIPS64: Default to N64 ABI
-
-MIPS64 defaults to n32 ABI, this patch makes it
-so that it defaults to N64 ABI
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [OE config specific]
----
- gcc/config.gcc | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index f66e48c..9c6d156 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -2065,29 +2065,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
- 			default_mips_arch=mips32
- 			;;
- 		mips64el-st-linux-gnu)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			tm_file="${tm_file} mips/st.h"
- 			tmake_file="${tmake_file} mips/t-st"
- 			enable_mips_multilibs="yes"
- 			;;
- 		mips64octeon*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			tm_defines="${tm_defines} MIPS_CPU_STRING_DEFAULT=\\\"octeon\\\""
- 			target_cpu_default=MASK_SOFT_FLOAT_ABI
- 			enable_mips_multilibs="yes"
- 			;;
- 		mipsisa64r6*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			default_mips_arch=mips64r6
- 			enable_mips_multilibs="yes"
- 			;;
- 		mipsisa64r2*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			default_mips_arch=mips64r2
- 			enable_mips_multilibs="yes"
- 			;;
- 		mips64*-*-linux* | mipsisa64*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			enable_mips_multilibs="yes"
- 			;;
- 	esac
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
deleted file mode 100644
index 6675ce3..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ /dev/null
@@ -1,234 +0,0 @@
-From 9f73c8918b63e6a1c9b79384fac411d1056eec1c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:24:50 +0400
-Subject: [PATCH 21/46] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
- relative to SYSTEMLIBS_DIR
-
-This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
-relative to SYSTEMLIBS_DIR which can be set in generated headers
-This breaks the assumption of hardcoded multilib in gcc
-Change is only for the supported architectures in OE including
-SH, sparc, alpha for possible future support (if any)
-
-Removes the do_headerfix task in metadata
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [OE configuration]
----
- gcc/config/alpha/linux-elf.h |  4 ++--
- gcc/config/arm/linux-eabi.h  |  4 ++--
- gcc/config/arm/linux-elf.h   |  2 +-
- gcc/config/i386/linux.h      |  2 +-
- gcc/config/i386/linux64.h    |  6 +++---
- gcc/config/linux.h           |  8 ++++----
- gcc/config/mips/linux.h      | 12 ++++++------
- gcc/config/rs6000/linux64.h  | 16 ++++++----------
- gcc/config/sh/linux.h        |  2 +-
- gcc/config/sparc/linux.h     |  2 +-
- gcc/config/sparc/linux64.h   |  4 ++--
- 11 files changed, 29 insertions(+), 33 deletions(-)
-
-diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index a0764d3..02f7a7c 100644
---- a/gcc/config/alpha/linux-elf.h
-+++ b/gcc/config/alpha/linux-elf.h
-@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
- #define EXTRA_SPECS \
- { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
- 
--#define GLIBC_DYNAMIC_LINKER	"/lib/ld-linux.so.2"
--#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
-+#define GLIBC_DYNAMIC_LINKER	SYSTEMLIBS_DIR "ld-linux.so.2"
-+#define UCLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-uClibc.so.0"
- #if DEFAULT_LIBC == LIBC_UCLIBC
- #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
- #elif DEFAULT_LIBC == LIBC_GLIBC
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index ace8481..4010435 100644
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -68,8 +68,8 @@
-    GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
- 
- #undef  GLIBC_DYNAMIC_LINKER
--#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT "/lib/ld-linux.so.3"
--#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT "/lib/ld-linux-armhf.so.3"
-+#define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
-+#define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"
- #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
- 
- #define GLIBC_DYNAMIC_LINKER \
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index a94bd2d..0220628 100644
---- a/gcc/config/arm/linux-elf.h
-+++ b/gcc/config/arm/linux-elf.h
-@@ -62,7 +62,7 @@
- 
- #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
- 
- #define LINUX_TARGET_LINK_SPEC  "%{h*} \
-    %{static:-Bstatic} \
-diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index d37a875..edde586 100644
---- a/gcc/config/i386/linux.h
-+++ b/gcc/config/i386/linux.h
-@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
- <http://www.gnu.org/licenses/>.  */
- 
- #define GNU_USER_LINK_EMULATION "elf_i386"
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
- 
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
-diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index 73d22e3..f4b5615 100644
---- a/gcc/config/i386/linux64.h
-+++ b/gcc/config/i386/linux64.h
-@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
- #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
- 
--#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
--#define GLIBC_DYNAMIC_LINKERX32 "/libx32/ld-linux-x32.so.2"
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
-+#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
- 
- #undef MUSL_DYNAMIC_LINKER32
- #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 9aeeb94..b055652 100644
---- a/gcc/config/linux.h
-+++ b/gcc/config/linux.h
-@@ -81,10 +81,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
-    GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
-    GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
-    supporting both 32-bit and 64-bit compilation.  */
--#define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
--#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
--#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
--#define UCLIBC_DYNAMIC_LINKERX32 "/lib/ldx32-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ldx32-uClibc.so.0"
- #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
- #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
- #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index fa253b6..da02c8d 100644
---- a/gcc/config/mips/linux.h
-+++ b/gcc/config/mips/linux.h
-@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
- #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
- 
- #define GLIBC_DYNAMIC_LINKER32 \
--  "%{mnan=2008:/lib/ld-linux-mipsn8.so.1;:/lib/ld.so.1}"
-+  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
- #define GLIBC_DYNAMIC_LINKER64 \
--  "%{mnan=2008:/lib64/ld-linux-mipsn8.so.1;:/lib64/ld.so.1}"
-+  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
- #define GLIBC_DYNAMIC_LINKERN32 \
--  "%{mnan=2008:/lib32/ld-linux-mipsn8.so.1;:/lib32/ld.so.1}"
-+  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
- 
- #undef UCLIBC_DYNAMIC_LINKER32
- #define UCLIBC_DYNAMIC_LINKER32 \
--  "%{mnan=2008:/lib/ld-uClibc-mipsn8.so.0;:/lib/ld-uClibc.so.0}"
-+  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
- #undef UCLIBC_DYNAMIC_LINKER64
- #define UCLIBC_DYNAMIC_LINKER64 \
--  "%{mnan=2008:/lib/ld64-uClibc-mipsn8.so.0;:/lib/ld64-uClibc.so.0}"
-+  "%{mnan=2008:" SYSTEMLIBS_DIR "ld64-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld64-uClibc.so.0}"
- #define UCLIBC_DYNAMIC_LINKERN32 \
--  "%{mnan=2008:/lib32/ld-uClibc-mipsn8.so.0;:/lib32/ld-uClibc.so.0}"
-+  "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
- 
- #undef MUSL_DYNAMIC_LINKER32
- #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-mips%{EL:el}%{msoft-float:-sf}.so.1"
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index fefa0c4..7173938 100644
---- a/gcc/config/rs6000/linux64.h
-+++ b/gcc/config/rs6000/linux64.h
-@@ -412,16 +412,11 @@ extern int dot_symbols;
- #undef	LINK_OS_DEFAULT_SPEC
- #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
- 
--#define GLIBC_DYNAMIC_LINKER32 "%(dynamic_linker_prefix)/lib/ld.so.1"
--
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
- #ifdef LINUX64_DEFAULT_ABI_ELFv2
--#define GLIBC_DYNAMIC_LINKER64 \
--"%{mabi=elfv1:%(dynamic_linker_prefix)/lib64/ld64.so.1;" \
--":%(dynamic_linker_prefix)/lib64/ld64.so.2}"
-+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv1:" SYSTEMLIBS_DIR "ld64.so.1;:" SYSTEMLIBS_DIR "ld64.so.2}"
- #else
--#define GLIBC_DYNAMIC_LINKER64 \
--"%{mabi=elfv2:%(dynamic_linker_prefix)/lib64/ld64.so.2;" \
--":%(dynamic_linker_prefix)/lib64/ld64.so.1}"
-+#define GLIBC_DYNAMIC_LINKER64 "%{mabi=elfv2:" SYSTEMLIBS_DIR "ld64.so.2;:" SYSTEMLIBS_DIR "ld64.so.1}"
- #endif
- 
- #define MUSL_DYNAMIC_LINKER32 \
-@@ -429,8 +424,9 @@ extern int dot_symbols;
- #define MUSL_DYNAMIC_LINKER64 \
-   "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
- 
--#define UCLIBC_DYNAMIC_LINKER32 "/lib/ld-uClibc.so.0"
--#define UCLIBC_DYNAMIC_LINKER64 "/lib/ld64-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
-+#define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
-+
- #if DEFAULT_LIBC == LIBC_UCLIBC
- #define CHOOSE_DYNAMIC_LINKER(G, U, M) \
-   "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
-diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index 2a036ac..50fb735 100644
---- a/gcc/config/sh/linux.h
-+++ b/gcc/config/sh/linux.h
-@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
-   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
-   "%{mfdpic:-fdpic}.so.1"
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
- 
- #undef SUBTARGET_LINK_EMUL_SUFFIX
- #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
-diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 9b32577..7bd66de 100644
---- a/gcc/config/sparc/linux.h
-+++ b/gcc/config/sparc/linux.h
-@@ -83,7 +83,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
-    When the -shared link option is used a final link is not being
-    done.  */
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
- 
- #undef  LINK_SPEC
- #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
-diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index a1ef325..3bae3d5 100644
---- a/gcc/config/sparc/linux64.h
-+++ b/gcc/config/sparc/linux64.h
-@@ -84,8 +84,8 @@ along with GCC; see the file COPYING3.  If not see
-    When the -shared link option is used a final link is not being
-    done.  */
- 
--#define GLIBC_DYNAMIC_LINKER32 "/lib/ld-linux.so.2"
--#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
-+#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux.so.2"
- 
- #ifdef SPARC_BI_ARCH
- 
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch
deleted file mode 100644
index fab6e4a..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0022-gcc-Fix-argument-list-too-long-error.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From acce5157f6b3a1dc9a3676b7118ac887dc5693be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH 22/46] gcc: Fix argument list too long error.
-
-There would be an "Argument list too long" error when the
-build directory is longer than 200, this is caused by:
-
-headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
-
-The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
-it, use the $(sort list) of GNU make which can handle the too long list
-would fix the problem, the header would be short enough after sorted.
-The "tr ' ' '\012'" was used for translating the space to "\n", the
-$(sort list) doesn't need this.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 9a1d466..450cb79 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -3349,7 +3349,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
- # We keep the directory structure for files in config or c-family and .def
- # files. All other files are flattened to a single directory.
- 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
--	headers=`echo $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def) | tr ' ' '\012' | sort -u`; \
-+	headers="$(sort $(PLUGIN_HEADERS) $$(cd $(srcdir); echo *.h *.def))"; \
- 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
- 	for file in $$headers; do \
- 	  if [ -f $$file ] ; then \
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
deleted file mode 100644
index 0efd890..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0023-Disable-sdt.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 6573aec00ada35c48c1838c8491ce8f7798ae993 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:28:10 +0400
-Subject: [PATCH 23/46] Disable sdt.
-
-We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
-It may or may not exist from preivous builds though. To be determinstic, disable
-sdt.h usage always. This avoids build failures if the header is removed after configure
-but before libgcc is compiled for example.
-
-RP 2012/8/7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Disable sdt for libstdc++-v3.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Inappropriate [hack]
----
- gcc/configure             | 12 ++++++------
- gcc/configure.ac          | 18 +++++++++---------
- libstdc++-v3/configure    |  6 +++---
- libstdc++-v3/configure.ac |  2 +-
- 4 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index 389b6d5..73c264d 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -28528,12 +28528,12 @@ fi
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
- $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
- have_sys_sdt_h=no
--if test -f $target_header_dir/sys/sdt.h; then
--  have_sys_sdt_h=yes
--
--$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
--
--fi
-+#if test -f $target_header_dir/sys/sdt.h; then
-+#  have_sys_sdt_h=yes
-+#
-+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
-+#
-+#fi
- { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
- $as_echo "$have_sys_sdt_h" >&6; }
- 
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 91ac800..cecf121 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -5514,15 +5514,15 @@ fi
- AC_SUBST([enable_default_ssp])
- 
- # Test for <sys/sdt.h> on the target.
--GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
--AC_MSG_CHECKING(sys/sdt.h in the target C library)
--have_sys_sdt_h=no
--if test -f $target_header_dir/sys/sdt.h; then
--  have_sys_sdt_h=yes
--  AC_DEFINE(HAVE_SYS_SDT_H, 1,
--            [Define if your target C library provides sys/sdt.h])
--fi
--AC_MSG_RESULT($have_sys_sdt_h)
-+#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
-+#AC_MSG_CHECKING(sys/sdt.h in the target C library)
-+#have_sys_sdt_h=no
-+#if test -f $target_header_dir/sys/sdt.h; then
-+#  have_sys_sdt_h=yes
-+#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
-+#            [Define if your target C library provides sys/sdt.h])
-+#fi
-+#AC_MSG_RESULT($have_sys_sdt_h)
- 
- # Check if TFmode long double should be used by default or not.
- # Some glibc targets used DFmode long double, but with glibc 2.4
-diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index 8a5481c..6a40e92 100755
---- a/libstdc++-v3/configure
-+++ b/libstdc++-v3/configure
-@@ -21735,11 +21735,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
- ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
- ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
--  if test $glibcxx_cv_sys_sdt_h = yes; then
-+#  if test $glibcxx_cv_sys_sdt_h = yes; then
- 
--$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
-+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
- 
--  fi
-+#  fi
-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_h" >&5
- $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
- 
-diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index 9e19e99..0077ffd 100644
---- a/libstdc++-v3/configure.ac
-+++ b/libstdc++-v3/configure.ac
-@@ -230,7 +230,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
- GLIBCXX_CHECK_SC_NPROC_ONLN
- GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
- GLIBCXX_CHECK_SYSCTL_HW_NCPU
--GLIBCXX_CHECK_SDT_H
-+#GLIBCXX_CHECK_SDT_H
- 
- # Check for available headers.
- AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch b/meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
deleted file mode 100644
index 1f73b5d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0024-libtool.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 6c0aa5c2538829248547197718037ff0b9788676 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:29:11 +0400
-Subject: [PATCH 24/46] libtool
-
-libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
-when running on am x86_64 build host.
-
-This patch stops this speading to libdir in the libstdc++.la file within libtool.
-Arguably, it shouldn't be passing this into libtool in the first place but
-for now this resolves the nastiest problems this causes.
-
-func_normal_abspath would resolve an empty path to `pwd` so we need
-to filter the zero case.
-
-RP 2012/8/24
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- ltmain.sh | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 9503ec8..0121fba 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -6359,6 +6359,10 @@ func_mode_link ()
- 	func_warning "ignoring multiple \`-rpath's for a libtool library"
- 
-       install_libdir="$1"
-+      if test -n "$install_libdir"; then
-+	func_normal_abspath "$install_libdir"
-+	install_libdir=$func_normal_abspath_result
-+      fi
- 
-       oldlibs=
-       if test -z "$rpath"; then
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
deleted file mode 100644
index 3b7ee49..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b1263a48553ce75f8c3bed4fe12122af57845567 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:30:32 +0400
-Subject: [PATCH 25/46] gcc: armv4: pass fix-v4bx to linker to support EABI.
-
-The LINK_SPEC for linux gets overwritten by linux-eabi.h which
-means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
-the option is not passed to linker when chosing march=armv4
-This patch redefines this in linux-eabi.h and reinserts it
-for eabi defaulting toolchains.
-
-We might want to send it upstream.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- gcc/config/arm/linux-eabi.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 4010435..aaea1c9 100644
---- a/gcc/config/arm/linux-eabi.h
-+++ b/gcc/config/arm/linux-eabi.h
-@@ -94,10 +94,14 @@
- #define MUSL_DYNAMIC_LINKER \
-   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
- 
-+/* For armv4 we pass --fix-v4bx to linker to support EABI */
-+#undef TARGET_FIX_V4BX_SPEC
-+#define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
-+
- /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
-    use the GNU/Linux version, not the generic BPABI version.  */
- #undef  LINK_SPEC
--#define LINK_SPEC EABI_LINK_SPEC					\
-+#define LINK_SPEC TARGET_FIX_V4BX_SPEC EABI_LINK_SPEC			\
-   LINUX_OR_ANDROID_LD (LINUX_TARGET_LINK_SPEC,				\
- 		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
- 
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
deleted file mode 100644
index be25be6..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From b5c305fc251299f2e328410b18cfb55c75b5f038 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:33:04 +0400
-Subject: [PATCH 26/46] Use the multilib config files from ${B} instead of
- using the ones from ${S}
-
-Use the multilib config files from ${B} instead of using the ones from ${S}
-so that the source can be shared between gcc-cross-initial,
-gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
----
- gcc/configure    | 22 ++++++++++++++++++----
- gcc/configure.ac | 22 ++++++++++++++++++----
- 2 files changed, 36 insertions(+), 8 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index 73c264d..377253e 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -12110,10 +12110,20 @@ done
- tmake_file_=
- for f in ${tmake_file}
- do
--	if test -f ${srcdir}/config/$f
--	then
--		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
--	fi
-+  case $f in
-+    */t-linux64 )
-+       if test -f ./config/$f
-+       then
-+         tmake_file_="${tmake_file_} ./config/$f"
-+       fi
-+       ;;
-+    * )
-+       if test -f ${srcdir}/config/$f
-+       then
-+         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
-+       fi
-+       ;;
-+  esac
- done
- tmake_file="${tmake_file_}"
- 
-@@ -12124,6 +12134,10 @@ tm_file_list="options.h"
- tm_include_list="options.h insn-constants.h"
- for f in $tm_file; do
-   case $f in
-+    */linux64.h )
-+       tm_file_list="${tm_file_list} ./config/$f"
-+       tm_include_list="${tm_include_list} ./config/$f"
-+       ;;
-     ./* )
-        f=`echo $f | sed 's/^..//'`
-        tm_file_list="${tm_file_list} $f"
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index cecf121..54e7619 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -1863,10 +1863,20 @@ done
- tmake_file_=
- for f in ${tmake_file}
- do
--	if test -f ${srcdir}/config/$f
--	then
--		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
--	fi
-+  case $f in
-+    */t-linux64 )
-+       if test -f ./config/$f
-+       then
-+         tmake_file_="${tmake_file_} ./config/$f"
-+       fi
-+       ;;
-+    * )
-+       if test -f ${srcdir}/config/$f
-+       then
-+         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
-+       fi
-+       ;;
-+  esac
- done
- tmake_file="${tmake_file_}"
- 
-@@ -1877,6 +1887,10 @@ tm_file_list="options.h"
- tm_include_list="options.h insn-constants.h"
- for f in $tm_file; do
-   case $f in
-+    */linux64.h )
-+       tm_file_list="${tm_file_list} ./config/$f"
-+       tm_include_list="${tm_include_list} ./config/$f"
-+       ;;
-     ./* )
-        f=`echo $f | sed 's/^..//'`
-        tm_file_list="${tm_file_list} $f"
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
deleted file mode 100644
index d1bbebc..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From eb6178b7fb466ae429c56380c6dbc564a16d900a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 09:39:38 +0000
-Subject: [PATCH 27/46] Avoid using libdir from .la which usually points to a
- host path
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltmain.sh | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 0121fba..52bdbdb 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -5628,6 +5628,9 @@ func_mode_link ()
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
-+	    # Instead of using libdir from .la which usually points to a host path,
-+	    # use the path the .la is contained in.
-+	    libdir="$abs_ladir"
- 	    dir="$libdir"
- 	    absdir="$libdir"
- 	  fi
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
deleted file mode 100644
index c212539..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0028-export-CPP.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 617184f35e97934d9e6268e71378574e2b776c2b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 09:40:59 +0000
-Subject: [PATCH 28/46] export CPP
-
-The OE environment sets and exports CPP as being the target gcc. When
-building gcc-cross-canadian for a mingw targetted sdk, the following can be found
-in build.x86_64-pokysdk-mingw32.i586-poky-linux/build-x86_64-linux/libiberty/config.log:
-
-configure:3641: checking for _FILE_OFFSET_BITS value needed for large files
-configure:3666: gcc  -c -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  conftest.c >&5
-configure:3666: $? = 0
-configure:3698: result: no
-configure:3786: checking how to run the C preprocessor
-configure:3856: result: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32
-configure:3876: x86_64-pokysdk-mingw32-gcc -E --sysroot=/media/build1/poky/build/tmp/sysroots/x86_64-nativesdk-mingw32-pokysdk-mingw32 conftest.c
-configure:3876: $? = 0
-
-Note this is a *build* target (in build-x86_64-linux) so it should be
-using the host "gcc", not x86_64-pokysdk-mingw32-gcc. Since the mingw32
-headers are very different, using the wrong cpp is a real problem. It is leaking
-into configure through the CPP variable. Ultimately this leads to build
-failures related to not being able to include a process.h file for pem-unix.c.
-
-The fix is to ensure we export a sane CPP value into the build
-environment when using build targets. We could define a CPP_FOR_BUILD value which may be
-the version which needs to be upstreamed but for now, this fix is good enough to
-avoid the problem.
-
-RP 22/08/2013
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 1522e39..beb9b9a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -149,6 +149,7 @@ BUILD_EXPORTS = \
- 	AR="$(AR_FOR_BUILD)"; export AR; \
- 	AS="$(AS_FOR_BUILD)"; export AS; \
- 	CC="$(CC_FOR_BUILD)"; export CC; \
-+	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
deleted file mode 100644
index 47b9c0d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From e140700976e3b7eb4250b1ffde9bc16494456903 Mon Sep 17 00:00:00 2001
-From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
-Date: Wed, 5 Feb 2014 16:52:31 +0200
-Subject: [PATCH 29/46] Enable SPE & AltiVec generation on powepc*linux target
-
-When is configured with --target=powerpc-linux, the resulting GCC will
-not be able to generate code for SPE targets (e500v1/v2).
-GCC configured with --target=powerpc-linuxspe will not be able to
-generate AltiVec instructions (for e6500).
-This patch modifies the configured file such that SPE or AltiVec code
-can be generated when gcc is configured with --target=powerpc-linux.
-The ABI and speciffic instructions can be selected through the
-"-mabi=spe or -mabi=altivec" and the "-mspe or -maltivec" parameters.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
----
- gcc/config.gcc               | 9 ++++++++-
- gcc/config/rs6000/linuxspe.h | 3 ---
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 9c6d156..18cff5a 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -2392,7 +2392,14 @@ powerpc-*-rtems*)
- 	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-rtems rs6000/t-ppccomm"
- 	;;
- powerpc*-*-linux*)
--	tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spec.h rs6000/sysv4.h"
-+	case ${target} in
-+	    powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
-+		tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spec.h rs6000/sysv4.h"
-+		;;
-+	    *)
-+		tm_file="${tm_file} dbxelf.h elfos.h gnu-user.h freebsd-spec.h rs6000/sysv4.h rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e500.h"
-+		;;
-+	esac
- 	extra_options="${extra_options} rs6000/sysv4.opt"
- 	tmake_file="${tmake_file} rs6000/t-fprules rs6000/t-ppccomm"
- 	extra_objs="$extra_objs rs6000-linux.o"
-diff --git a/gcc/config/rs6000/linuxspe.h b/gcc/config/rs6000/linuxspe.h
-index 35623cd..f74e00d 100644
---- a/gcc/config/rs6000/linuxspe.h
-+++ b/gcc/config/rs6000/linuxspe.h
-@@ -27,6 +27,3 @@
- #undef	TARGET_DEFAULT
- #define TARGET_DEFAULT MASK_STRICT_ALIGN
- #endif
--
--#undef  ASM_DEFAULT_SPEC
--#define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
deleted file mode 100644
index c09d019..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0ddcb95a86830766fd02122f19384fc929b377c5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 10:21:55 +0000
-Subject: [PATCH 30/46] Disable the MULTILIB_OSDIRNAMES and other multilib
- options.
-
-Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on
-systems where the libdir is NOT set to /lib64.  This is allowed by the
-ABI, as
-long as the dynamic loader is present in /lib.
-
-We simply want to use the default rules in gcc to find and configure the
-normal libdir.
-
-Upstream-Status: Inappropriate[OE-Specific]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/config/aarch64/t-aarch64-linux | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
-index 1cfe9f3..d688ac9 100644
---- a/gcc/config/aarch64/t-aarch64-linux
-+++ b/gcc/config/aarch64/t-aarch64-linux
-@@ -21,8 +21,8 @@
- LIB1ASMSRC   = aarch64/lib1funcs.asm
- LIB1ASMFUNCS = _aarch64_sync_cache_range
- 
--AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
--MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
--MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
-+#AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
-+#MULTILIB_OSDIRNAMES = mabi.lp64=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
-+#MULTIARCH_DIRNAME = $(call if_multiarch,aarch64$(AARCH_BE)-linux-gnu)
- 
--MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32
-+#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch
deleted file mode 100644
index fb1cd0f..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0031-Ensure-target-gcc-headers-can-be-included.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From fc6621435a64a9d69aa251b70361da94cf2db6be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 10:25:11 +0000
-Subject: [PATCH 31/46] Ensure target gcc headers can be included
-
-There are a few headers installed as part of the OpenEmbedded
-gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
-built for the target architecture, these are within the target
-sysroot and not cross/nativesdk; thus they weren't able to be
-found by gcc with the existing search paths. Add support for
-picking up these headers under the sysroot supplied on the gcc
-command line in order to resolve this.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/Makefile.in  | 2 ++
- gcc/cppdefault.c | 4 ++++
- gcc/defaults.h   | 9 +++++++++
- gcc/gcc.c        | 7 -------
- 4 files changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 450cb79..cc75536 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -593,6 +593,7 @@ libexecdir = @libexecdir@
- 
- # Directory in which the compiler finds libraries etc.
- libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
-+libsubdir_target = gcc/$(target_noncanonical)/$(version)
- # Directory in which the compiler finds executables
- libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
- # Directory in which all plugin resources are installed
-@@ -2688,6 +2689,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
- 
- PREPROCESSOR_DEFINES = \
-   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
-+  -DGCC_INCLUDE_SUBDIR_TARGET=\"$(libsubdir_target)/include\" \
-   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
-   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
-   -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
-diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index 54aaf06..7b4dd51 100644
---- a/gcc/cppdefault.c
-+++ b/gcc/cppdefault.c
-@@ -59,6 +59,10 @@ const struct default_include cpp_include_defaults[]
-     /* This is the dir for gcc's private headers.  */
-     { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
- #endif
-+#ifdef GCC_INCLUDE_SUBDIR_TARGET
-+    /* This is the dir for gcc's private headers under the specified sysroot.  */
-+    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
-+#endif
- #ifdef LOCAL_INCLUDE_DIR
-     /* /usr/local/include comes before the fixincluded header files.  */
-     { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
-diff --git a/gcc/defaults.h b/gcc/defaults.h
-index 3e18338..0f317f2 100644
---- a/gcc/defaults.h
-+++ b/gcc/defaults.h
-@@ -1492,4 +1492,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- #define DWARF_GNAT_ENCODINGS_DEFAULT DWARF_GNAT_ENCODINGS_GDB
- #endif
- 
-+/* Default prefixes to attach to command names.  */
-+
-+#ifndef STANDARD_STARTFILE_PREFIX_1
-+#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
-+#endif
-+#ifndef STANDARD_STARTFILE_PREFIX_2
-+#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
-+#endif
-+
- #endif  /* ! GCC_DEFAULTS_H */
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 04fa81d..9750cc2 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -1450,13 +1450,6 @@ static const char *gcc_libexec_prefix;
- 
- /* Default prefixes to attach to command names.  */
- 
--#ifndef STANDARD_STARTFILE_PREFIX_1
--#define STANDARD_STARTFILE_PREFIX_1 "/lib/"
--#endif
--#ifndef STANDARD_STARTFILE_PREFIX_2
--#define STANDARD_STARTFILE_PREFIX_2 "/usr/lib/"
--#endif
--
- #ifdef CROSS_DIRECTORY_STRUCTURE  /* Don't use these prefixes for a cross compiler.  */
- #undef MD_EXEC_PREFIX
- #undef MD_STARTFILE_PREFIX
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
deleted file mode 100644
index c0b001d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From ff939c5063d8f8d444bdb25651a0a48e608efaa4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 11:17:19 +0000
-Subject: [PATCH 32/46] gcc 4.8+ won't build with --disable-dependency-tracking
-
-since the *.Ppo files don't get created unless --enable-dependency-tracking is true.
-
-This patch ensures we only use those compiler options when its enabled.
-
-Upstream-Status: Submitted
-
-(Problem was already reported upstream, attached this patch there
-http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55930)
-
-RP
-2012/09/22
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libatomic/Makefile.am | 3 ++-
- libatomic/Makefile.in | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index b351244..399ce18 100644
---- a/libatomic/Makefile.am
-+++ b/libatomic/Makefile.am
-@@ -101,7 +101,8 @@ PAT_S		= $(word 3,$(PAT_SPLIT))
- IFUNC_DEF	= -DIFUNC_ALT=$(PAT_S)
- IFUNC_OPT	= $(word $(PAT_S),$(IFUNC_OPTIONS))
- 
--M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_TRUE@M_DEPS		= -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_FALSE@M_DEPS		=
- M_SIZE		= -DN=$(PAT_N)
- M_IFUNC		= $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
- M_FILE		= $(PAT_BASE)_n.c
-diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index a083d87..a92cfce 100644
---- a/libatomic/Makefile.in
-+++ b/libatomic/Makefile.in
-@@ -330,7 +330,8 @@ PAT_N = $(word 2,$(PAT_SPLIT))
- PAT_S = $(word 3,$(PAT_SPLIT))
- IFUNC_DEF = -DIFUNC_ALT=$(PAT_S)
- IFUNC_OPT = $(word $(PAT_S),$(IFUNC_OPTIONS))
--M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_TRUE@M_DEPS = -MT $@ -MD -MP -MF $(DEPDIR)/$(@F).Ppo
-+@AMDEP_FALSE@M_DEPS =
- M_SIZE = -DN=$(PAT_N)
- M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
- M_FILE = $(PAT_BASE)_n.c
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
deleted file mode 100644
index e425d71..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5092f5389d02e78cd59690cf3fca24b56a97aff2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 3 Mar 2015 08:21:19 +0000
-Subject: [PATCH 33/46] Don't search host directory during "relink" if
- $inst_prefix is provided
-
-http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltmain.sh | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 52bdbdb..82bcec3 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -6004,12 +6004,13 @@ func_mode_link ()
- 	      fi
- 	    else
- 	      # We cannot seem to hardcode it, guess we'll fake it.
-+	      # Default if $libdir is not relative to the prefix:
- 	      add_dir="-L$libdir"
--	      # Try looking first in the location we're being installed to.
-+
- 	      if test -n "$inst_prefix_dir"; then
- 		case $libdir in
- 		  [\\/]*)
--		    add_dir="$add_dir -L$inst_prefix_dir$libdir"
-+		    add_dir="-L$inst_prefix_dir$libdir"
- 		    ;;
- 		esac
- 	      fi
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
deleted file mode 100644
index 922a855..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1faa6f69f93bb95af2b2b2bd24e181b50fb5b37c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Apr 2015 23:15:27 -0700
-Subject: [PATCH 34/46] Use SYSTEMLIBS_DIR replacement instead of hardcoding
- base_libdir
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Inappropriate [OE Configuration]
-
- gcc/config/aarch64/aarch64-linux.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 5fcaa59..8588ac0 100644
---- a/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
-@@ -21,7 +21,7 @@
- #ifndef GCC_AARCH64_LINUX_H
- #define GCC_AARCH64_LINUX_H
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
- #undef MUSL_DYNAMIC_LINKER
- #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch
deleted file mode 100644
index 9dfc472..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0035-aarch64-Add-support-for-musl-ldso.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3768468c1a6cc170fff88c03b808c975ac653811 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Apr 2015 23:18:39 -0700
-Subject: [PATCH 35/46] aarch64: Add support for musl ldso
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Inappropriate [OE Configuration]
-
- gcc/config/aarch64/aarch64-linux.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 8588ac0..946b3ca 100644
---- a/gcc/config/aarch64/aarch64-linux.h
-+++ b/gcc/config/aarch64/aarch64-linux.h
-@@ -24,7 +24,7 @@
- #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
- 
- #undef  ASAN_CC1_SPEC
- #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
deleted file mode 100644
index f89a886..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From f4d3c8e970d42a43cd3d2f751e13324efa936ff8 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Sun, 5 Jul 2015 20:25:18 -0700
-Subject: [PATCH 36/46] libcc1: fix libcc1's install path and rpath
-
-* Install libcc1.so and libcc1plugin.so into
-  $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
-  had done to lto-plugin.
-* Fix bad RPATH iussue:
-  gcc-5.2.0: package gcc-plugins contains bad RPATH /patht/to/tmp/sysroots/qemux86-64/usr/lib64/../lib64 in file
- /path/to/gcc/5.2.0-r0/packages-split/gcc-plugins/usr/lib64/gcc/x86_64-poky-linux/5.2.0/plugin/libcc1plugin.so.0.0.0
- [rpaths]
-
-Upstream-Status: Inappropriate [OE configuration]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- libcc1/Makefile.am | 4 ++--
- libcc1/Makefile.in | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index b40820b..32930c5 100644
---- a/libcc1/Makefile.am
-+++ b/libcc1/Makefile.am
-@@ -35,8 +35,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
- 	    $(Wc)$(libiberty_normal)))
- libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
- 
--plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
--cc1libdir = $(libdir)/$(libsuffix)
-+cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
-+plugindir = $(cc1libdir)
- 
- if ENABLE_PLUGIN
- plugin_LTLIBRARIES = libcc1plugin.la
-diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index 79d39d3..227ec22 100644
---- a/libcc1/Makefile.in
-+++ b/libcc1/Makefile.in
-@@ -291,8 +291,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
- 	    $(Wc)$(libiberty_normal)))
- 
- libiberty_dep = $(patsubst $(Wc)%,%,$(libiberty))
--plugindir = $(libdir)/gcc/$(target_noncanonical)/$(gcc_version)/plugin
--cc1libdir = $(libdir)/$(libsuffix)
-+cc1libdir = $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version)
-+plugindir = $(cc1libdir)
- @ENABLE_PLUGIN_TRUE@plugin_LTLIBRARIES = libcc1plugin.la
- @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
- BUILT_SOURCES = compiler-name.h
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch
deleted file mode 100644
index 15efcb1..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0037-handle-sysroot-support-for-nativesdk-gcc.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-From 1475b941d7a9c9874b0fb0558d01805945467331 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Dec 2015 23:39:54 +0000
-Subject: [PATCH 37/46] handle sysroot support for nativesdk-gcc
-
-Being able to build a nativesdk gcc is useful, particularly in cases
-where the host compiler may be of an incompatible version (or a 32
-bit compiler is needed).
-
-Sadly, building nativesdk-gcc is not straight forward. We install
-nativesdk-gcc into a relocatable location and this means that its
-library locations can change. "Normal" sysroot support doesn't help
-in this case since the values of paths like "libdir" change, not just
-base root directory of the system.
-
-In order to handle this we do two things:
-
-a) Add %r into spec file markup which can be used for injected paths
-   such as SYSTEMLIBS_DIR (see gcc_multilib_setup()).
-b) Add other paths which need relocation into a .gccrelocprefix section
-   which the relocation code will notice and adjust automatically.
-
-Upstream-Status: Inappropriate
-RP 2015/7/28
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/cppdefault.c | 50 +++++++++++++++++++++++++++++++++++++-------------
- gcc/cppdefault.h |  3 ++-
- gcc/gcc.c        | 20 ++++++++++++++------
- 3 files changed, 53 insertions(+), 20 deletions(-)
-
-diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
-index 7b4dd51..9d1166c 100644
---- a/gcc/cppdefault.c
-+++ b/gcc/cppdefault.c
-@@ -35,6 +35,30 @@
- # undef CROSS_INCLUDE_DIR
- #endif
- 
-+static char GPLUSPLUS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_INCLUDE_DIR;
-+static char GCC_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GCC_INCLUDE_DIR;
-+static char GPLUSPLUS_TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_TOOL_INCLUDE_DIR;
-+static char GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = GPLUSPLUS_BACKWARD_INCLUDE_DIR;
-+static char STANDARD_STARTFILE_PREFIX_2VAR[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET;
-+#ifdef LOCAL_INCLUDE_DIR
-+static char LOCAL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = LOCAL_INCLUDE_DIR;
-+#endif
-+#ifdef PREFIX_INCLUDE_DIR
-+static char PREFIX_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = PREFIX_INCLUDE_DIR;
-+#endif
-+#ifdef FIXED_INCLUDE_DIR
-+static char FIXED_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = FIXED_INCLUDE_DIR;
-+#endif
-+#ifdef CROSS_INCLUDE_DIR
-+static char CROSS_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = CROSS_INCLUDE_DIR;
-+#endif
-+#ifdef TOOL_INCLUDE_DIR
-+static char TOOL_INCLUDE_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = TOOL_INCLUDE_DIR;
-+#endif
-+#ifdef NATIVE_SYSTEM_HEADER_DIR
-+static char NATIVE_SYSTEM_HEADER_DIRVAR[4096] __attribute__ ((section (".gccrelocprefix"))) = NATIVE_SYSTEM_HEADER_DIR;
-+#endif
-+
- const struct default_include cpp_include_defaults[]
- #ifdef INCLUDE_DEFAULTS
- = INCLUDE_DEFAULTS;
-@@ -42,38 +66,38 @@ const struct default_include cpp_include_defaults[]
- = {
- #ifdef GPLUSPLUS_INCLUDE_DIR
-     /* Pick up GNU C++ generic include files.  */
--    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
-+    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
- #endif
- #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
-     /* Pick up GNU C++ target-dependent include files.  */
--    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
-+    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
- #endif
- #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
-     /* Pick up GNU C++ backward and deprecated include files.  */
--    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,
-       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
- #endif
- #ifdef GCC_INCLUDE_DIR
-     /* This is the dir for gcc's private headers.  */
--    { GCC_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
-+    { GCC_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
- #endif
- #ifdef GCC_INCLUDE_SUBDIR_TARGET
-     /* This is the dir for gcc's private headers under the specified sysroot.  */
--    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0 },
-+    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0 },
- #endif
- #ifdef LOCAL_INCLUDE_DIR
-     /* /usr/local/include comes before the fixincluded header files.  */
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
--    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },
-+    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
- #endif
- #ifdef PREFIX_INCLUDE_DIR
--    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0 },
-+    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0 },
- #endif
- #ifdef FIXED_INCLUDE_DIR
-     /* This is the dir for fixincludes.  */
--    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
-+    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
-       /* A multilib suffix needs adding if different multilibs use
- 	 different headers.  */
- #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -85,16 +109,16 @@ const struct default_include cpp_include_defaults[]
- #endif
- #ifdef CROSS_INCLUDE_DIR
-     /* One place the target system's headers might be.  */
--    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0 },
-+    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0 },
- #endif
- #ifdef TOOL_INCLUDE_DIR
-     /* Another place the target system's headers might be.  */
--    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0 },
-+    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0 },
- #endif
- #ifdef NATIVE_SYSTEM_HEADER_DIR
-     /* /usr/include comes dead last.  */
--    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
--    { NATIVE_SYSTEM_HEADER_DIR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 2 },
-+    { NATIVE_SYSTEM_HEADER_DIRVAR, NATIVE_SYSTEM_HEADER_COMPONENT, 0, 0, 1, 0 },
- #endif
-     { 0, 0, 0, 0, 0, 0 }
-   };
-diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
-index 8a81b45..9759efd 100644
---- a/gcc/cppdefault.h
-+++ b/gcc/cppdefault.h
-@@ -33,7 +33,8 @@
- 
- struct default_include
- {
--  const char *const fname;	/* The name of the directory.  */
-+  const char *fname;     /* The name of the directory.  */
-+
-   const char *const component;	/* The component containing the directory
- 				   (see update_path in prefix.c) */
-   const char cplusplus;		/* Only look here if we're compiling C++.  */
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 9750cc2..94c240e 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -247,6 +247,8 @@ FILE *report_times_to_file = NULL;
- #endif
- static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
- 
-+static char target_relocatable_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = SYSTEMLIBS_DIR;
-+
- /* Nonzero means pass the updated target_system_root to the compiler.  */
- 
- static int target_system_root_changed;
-@@ -517,6 +519,7 @@ or with constant text in a single argument.
-  %G     process LIBGCC_SPEC as a spec.
-  %R     Output the concatenation of target_system_root and
-         target_sysroot_suffix.
-+ %r     Output the base path target_relocatable_prefix
-  %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
-  %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
-  %C     process CPP_SPEC as a spec.
-@@ -1473,10 +1476,10 @@ static const char *gcc_libexec_prefix;
-    gcc_exec_prefix is set because, in that case, we know where the
-    compiler has been installed, and use paths relative to that
-    location instead.  */
--static const char *const standard_exec_prefix = STANDARD_EXEC_PREFIX;
--static const char *const standard_libexec_prefix = STANDARD_LIBEXEC_PREFIX;
--static const char *const standard_bindir_prefix = STANDARD_BINDIR_PREFIX;
--static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
-+static char standard_exec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_EXEC_PREFIX;
-+static char standard_libexec_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_LIBEXEC_PREFIX;
-+static char standard_bindir_prefix[4096] __attribute__ ((section (".gccrelocprefix"))) = STANDARD_BINDIR_PREFIX;
-+static char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
- 
- /* For native compilers, these are well-known paths containing
-    components that may be provided by the system.  For cross
-@@ -1484,9 +1487,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
- static const char *md_exec_prefix = MD_EXEC_PREFIX;
- static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
- static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
--static const char *const standard_startfile_prefix_1
-+static char standard_startfile_prefix_1[4096] __attribute__ ((section (".gccrelocprefix")))
-   = STANDARD_STARTFILE_PREFIX_1;
--static const char *const standard_startfile_prefix_2
-+static char standard_startfile_prefix_2[4096] __attribute__ ((section (".gccrelocprefix")))
-   = STANDARD_STARTFILE_PREFIX_2;
- 
- /* A relative path to be used in finding the location of tools
-@@ -5762,6 +5765,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
- 	      }
- 	    break;
- 
-+          case 'r':
-+              obstack_grow (&obstack, target_relocatable_prefix,
-+		      strlen (target_relocatable_prefix));
-+            break;
-+
- 	  case 'S':
- 	    value = do_spec_1 (startfile_spec, 0, NULL);
- 	    if (value != 0)
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
deleted file mode 100644
index 89ee79d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 42e4cdcaad590536246866b0846ec279e124fa16 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Dec 2015 23:41:45 +0000
-Subject: [PATCH 38/46] Search target sysroot gcc version specific dirs with
- multilib.
-
-We install the gcc libraries (such as crtbegin.p) into
-<sysroot><libdir>/<target-sys>/5.2.0/
-which is a default search path for GCC (aka multi_suffix in the
-code below). <target-sys> is 'machine' in gcc's terminology. We use
-these directories so that multiple gcc versions could in theory
-co-exist on target.
-
-We only want to build one gcc-cross-canadian per arch and have this work
-for all multilibs. <target-sys> can be handled by mapping the multilib
-<target-sys> to the one used by gcc-cross-canadian, e.g.
-mips64-polkmllib32-linux
-is symlinked to by mips64-poky-linux.
-
-The default gcc search path in the target sysroot for a "lib64" mutlilib
-is:
-
-<sysroot>/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/lib32/../lib64/
-<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/usr/lib32/../lib64/
-<sysroot>/lib32/
-<sysroot>/usr/lib32/
-
-which means that the lib32 crtbegin.o will be found and the lib64 ones
-will not which leads to compiler failures.
-
-This patch injects a multilib version of that path first so the lib64
-binaries can be found first. With this change the search path becomes:
-
-<sysroot>/lib32/../lib64/mips64-poky-linux/5.2.0/
-<sysroot>/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/lib32/../lib64/
-<sysroot>/usr/lib32/../lib64/mips64-poky-linux/5.2.0/
-<sysroot>/usr/lib32/mips64-poky-linux/5.2.0/
-<sysroot>/usr/lib32/../lib64/
-<sysroot>/lib32/
-<sysroot>/usr/lib32/
-
-Upstream-Status: Pending
-RP 2015/7/31
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gcc/gcc.c | 29 ++++++++++++++++++++++++++++-
- 1 file changed, 28 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 94c240e..2812819 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -2507,7 +2507,7 @@ for_each_path (const struct path_prefix *paths,
-       if (path == NULL)
- 	{
- 	  len = paths->max_len + extra_space + 1;
--	  len += MAX (MAX (suffix_len, multi_os_dir_len), multiarch_len);
-+	  len += MAX ((suffix_len + multi_os_dir_len), multiarch_len);
- 	  path = XNEWVEC (char, len);
- 	}
- 
-@@ -2519,6 +2519,33 @@ for_each_path (const struct path_prefix *paths,
- 	  /* Look first in MACHINE/VERSION subdirectory.  */
- 	  if (!skip_multi_dir)
- 	    {
-+	      if (!(pl->os_multilib ? skip_multi_os_dir : skip_multi_dir))
-+	        {
-+	          const char *this_multi;
-+	          size_t this_multi_len;
-+
-+	          if (pl->os_multilib)
-+		    {
-+		      this_multi = multi_os_dir;
-+		      this_multi_len = multi_os_dir_len;
-+		    }
-+	          else
-+		    {
-+		      this_multi = multi_dir;
-+		      this_multi_len = multi_dir_len;
-+		    }
-+
-+	          /* Look in multilib MACHINE/VERSION subdirectory first */
-+	          if (this_multi_len)
-+	            {
-+		      memcpy (path + len, this_multi, this_multi_len + 1);
-+	              memcpy (path + len + this_multi_len, multi_suffix, suffix_len + 1);
-+	              ret = callback (path, callback_info);
-+	                if (ret)
-+		          break;
-+	            }
-+	        }
-+
- 	      memcpy (path + len, multi_suffix, suffix_len + 1);
- 	      ret = callback (path, callback_info);
- 	      if (ret)
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
deleted file mode 100644
index 0ce7aec..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0039-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 9ced49e459ccf1887feb58adf1e8836dcb4b1bdf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Dec 2015 23:42:45 +0000
-Subject: [PATCH 39/46] Fix various _FOR_BUILD and related variables
-
-When doing a FOR_BUILD thing, you have to override CFLAGS with
-CFLAGS_FOR_BUILD. And if you use C++, you also have to override
-CXXFLAGS with CXXFLAGS_FOR_BUILD.
-Without this, when building for mingw, you end up trying to use
-the mingw headers for a host build.
-
-The same goes for other variables as well, such as CPPFLAGS,
-CPP, and GMPINC.
-
-Upstream-Status: Pending
-
-Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in      | 6 ++++++
- Makefile.tpl     | 5 +++++
- gcc/Makefile.in  | 2 +-
- gcc/configure    | 2 +-
- gcc/configure.ac | 2 +-
- 5 files changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index beb9b9a..3e1c6bc 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -152,6 +152,7 @@ BUILD_EXPORTS = \
- 	CPP="$(CC_FOR_BUILD) -E"; export CPP; \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
-@@ -170,6 +171,9 @@ BUILD_EXPORTS = \
- # built for the build system to override those in BASE_FLAGS_TO_PASS.
- EXTRA_BUILD_FLAGS = \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
-+	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
-+	CPP="$(CC_FOR_BUILD) -E" \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
- 
- # This is the list of directories to built for the host system.
-@@ -187,6 +191,7 @@ HOST_SUBDIR = @host_subdir@
- HOST_EXPORTS = \
- 	$(BASE_EXPORTS) \
- 	CC="$(CC)"; export CC; \
-+	CPP="$(CC) -E"; export CPP; \
- 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
- 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-@@ -713,6 +718,7 @@ BASE_FLAGS_TO_PASS = \
- 	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
- 	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
- 	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
-+	"CXXFLAGS_FOR_BUILD=$(CXXFLAGS_FOR_BUILD)" \
- 	"EXPECT=$(EXPECT)" \
- 	"FLEX=$(FLEX)" \
- 	"INSTALL=$(INSTALL)" \
-diff --git a/Makefile.tpl b/Makefile.tpl
-index 6b2eb6a..114e462 100644
---- a/Makefile.tpl
-+++ b/Makefile.tpl
-@@ -154,6 +154,7 @@ BUILD_EXPORTS = \
- 	CC="$(CC_FOR_BUILD)"; export CC; \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS; \
- 	CXX="$(CXX_FOR_BUILD)"; export CXX; \
- 	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)"; export CXXFLAGS; \
- 	GCJ="$(GCJ_FOR_BUILD)"; export GCJ; \
-@@ -172,6 +173,9 @@ BUILD_EXPORTS = \
- # built for the build system to override those in BASE_FLAGS_TO_PASS.
- EXTRA_BUILD_FLAGS = \
- 	CFLAGS="$(CFLAGS_FOR_BUILD)" \
-+	CXXFLAGS="$(CXXFLAGS_FOR_BUILD)" \
-+	CPP="$(CC_FOR_BUILD) -E" \
-+	CPPFLAGS="$(CPPFLAGS_FOR_BUILD)" \
- 	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
- 
- # This is the list of directories to built for the host system.
-@@ -189,6 +193,7 @@ HOST_SUBDIR = @host_subdir@
- HOST_EXPORTS = \
- 	$(BASE_EXPORTS) \
- 	CC="$(CC)"; export CC; \
-+	CPP="$(CC) -E"; export CPP; \
- 	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
- 	CFLAGS="$(CFLAGS)"; export CFLAGS; \
- 	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index cc75536..0ad2dc8 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -780,7 +780,7 @@ BUILD_LDFLAGS=@BUILD_LDFLAGS@
- BUILD_NO_PIE_FLAG = @BUILD_NO_PIE_FLAG@
- BUILD_LDFLAGS += $(BUILD_NO_PIE_FLAG)
- BUILD_CPPFLAGS= -I. -I$(@D) -I$(srcdir) -I$(srcdir)/$(@D) \
--		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS)
-+		-I$(srcdir)/../include @INCINTL@ $(CPPINC) $(CPPFLAGS_FOR_BUILD)
- 
- # Actual name to use when installing a native compiler.
- GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
-diff --git a/gcc/configure b/gcc/configure
-index 377253e..78fc64a 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -11799,7 +11799,7 @@ else
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
- 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
- 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
--	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
-+	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
- 	${realsrcdir}/configure \
- 		--enable-languages=${enable_languages-all} \
- 		--target=$target_alias --host=$build_alias --build=$build_alias
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 54e7619..a94666e 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -1682,7 +1682,7 @@ else
- 	CC="${CC_FOR_BUILD}" CFLAGS="${CFLAGS_FOR_BUILD}" \
- 	CXX="${CXX_FOR_BUILD}" CXXFLAGS="${CXXFLAGS_FOR_BUILD}" \
- 	LD="${LD_FOR_BUILD}" LDFLAGS="${LDFLAGS_FOR_BUILD}" \
--	GMPINC="" CPPFLAGS="${CPPFLAGS} -DGENERATOR_FILE" \
-+	GMPINC="" CPPFLAGS="${CPPFLAGS_FOR_BUILD} -DGENERATOR_FILE" \
- 	${realsrcdir}/configure \
- 		--enable-languages=${enable_languages-all} \
- 		--target=$target_alias --host=$build_alias --build=$build_alias
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
deleted file mode 100644
index c9a6fd0..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b0412c01c275aaeb6b458461cd2425120c8bcec8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Feb 2016 10:26:10 -0800
-Subject: [PATCH 40/46] nios2: Define MUSL_DYNAMIC_LINKER
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- gcc/config/nios2/linux.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index 4ef55b5..62bc1e7 100644
---- a/gcc/config/nios2/linux.h
-+++ b/gcc/config/nios2/linux.h
-@@ -30,6 +30,7 @@
- #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
- 
- #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
-+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
- 
- #undef LINK_SPEC
- #define LINK_SPEC LINK_SPEC_ENDIAN \
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch b/meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
deleted file mode 100644
index 0744529..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 551a5db7acb56e085a101f1c222d51b2c1b039a4 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Sat, 7 Nov 2015 14:58:40 +0000
-Subject: [PATCH 41/46] ssp_nonshared
-
----
-Upstream-Status: Inappropriate [OE Configuration]
-
- gcc/gcc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/gcc.c b/gcc/gcc.c
-index 2812819..9de96ee 100644
---- a/gcc/gcc.c
-+++ b/gcc/gcc.c
-@@ -863,7 +863,8 @@ proper position among the other output files.  */
- #ifndef LINK_SSP_SPEC
- #ifdef TARGET_LIBC_PROVIDES_SSP
- #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
--		       "|fstack-protector-strong|fstack-protector-explicit:}"
-+		       "|fstack-protector-strong|fstack-protector-explicit" \
-+		       ":-lssp_nonshared}"
- #else
- #define LINK_SSP_SPEC "%{fstack-protector|fstack-protector-all" \
- 		       "|fstack-protector-strong|fstack-protector-explicit" \
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch b/meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
deleted file mode 100644
index 861f0fd..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch
+++ /dev/null
@@ -1,292 +0,0 @@
-From ba738cc411c9a54e389e336bcaa0a2428dd4a9d2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 16 Mar 2016 02:27:43 -0400
-Subject: [PATCH 42/46] gcc/libcpp: support -ffile-prefix-map=<old>=<new>
-
-Similar -fdebug-prefix-map, add option -ffile-prefix-map to map one
-directory name (old) to another (new) in __FILE__, __BASE_FILE__ and
-__builtin_FILE ().
-
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70268
-
-Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/c-family/c-opts.c     | 13 +++++++
- gcc/c-family/c.opt        |  4 +++
- gcc/dwarf2out.c           |  1 +
- gcc/gimplify.c            |  3 ++
- libcpp/Makefile.in        | 10 +++---
- libcpp/file-map.c         | 92 +++++++++++++++++++++++++++++++++++++++++++++++
- libcpp/include/file-map.h | 30 ++++++++++++++++
- libcpp/macro.c            |  2 ++
- 8 files changed, 150 insertions(+), 5 deletions(-)
- create mode 100644 libcpp/file-map.c
- create mode 100644 libcpp/include/file-map.h
-
-diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index fec58bc..7a0af43 100644
---- a/gcc/c-family/c-opts.c
-+++ b/gcc/c-family/c-opts.c
-@@ -38,6 +38,14 @@ along with GCC; see the file COPYING3.  If not see
- #include "opts.h"
- #include "plugin.h"		/* For PLUGIN_INCLUDE_FILE event.  */
- #include "mkdeps.h"
-+#include "file-map.h"
-+#include "c-target.h"
-+#include "tm.h"			/* For BYTES_BIG_ENDIAN,
-+				   DOLLARS_IN_IDENTIFIERS,
-+				   STDC_0_IN_SYSTEM_HEADERS,
-+				   TARGET_FLT_EVAL_METHOD_NON_DEFAULT and
-+				   TARGET_OPTF.  */
-+#include "tm_p.h"		/* For C_COMMON_OVERRIDE_OPTIONS.  */
- #include "dumpfile.h"
- 
- #ifndef DOLLARS_IN_IDENTIFIERS
-@@ -503,6 +511,11 @@ c_common_handle_option (size_t scode, const char *arg, int value,
-       cpp_opts->narrow_charset = arg;
-       break;
- 
-+    case OPT_ffile_prefix_map_:
-+      if (add_file_prefix_map (arg) < 0)
-+        error ("invalid argument %qs to -ffile-prefix-map", arg);
-+      break;
-+
-     case OPT_fwide_exec_charset_:
-       cpp_opts->wide_charset = arg;
-       break;
-diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 660da6c..31f7b34 100644
---- a/gcc/c-family/c.opt
-+++ b/gcc/c-family/c.opt
-@@ -1208,6 +1208,10 @@ fexec-charset=
- C ObjC C++ ObjC++ Joined RejectNegative
- -fexec-charset=<cset>	Convert all strings and character constants to character set <cset>.
- 
-+ffile-prefix-map=
-+C ObjC C++ ObjC++ Joined RejectNegative
-+-ffile-prefix-map=<old=new>	Map one directory name to another in __FILE__, __BASE_FILE__ and __builtin_FILE ()
-+
- fextended-identifiers
- C ObjC C++ ObjC++
- Permit universal character names (\\u and \\U) in identifiers.
-diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
-index 80f2df5..a2bfcc0 100644
---- a/gcc/dwarf2out.c
-+++ b/gcc/dwarf2out.c
-@@ -21672,6 +21672,7 @@ gen_producer_string (void)
-       case OPT_fltrans_output_list_:
-       case OPT_fresolution_:
-       case OPT_fdebug_prefix_map_:
-+      case OPT_ffile_prefix_map_:
- 	/* Ignore these.  */
- 	continue;
-       default:
-diff --git a/gcc/gimplify.c b/gcc/gimplify.c
-index e223e59..1433c25 100644
---- a/gcc/gimplify.c
-+++ b/gcc/gimplify.c
-@@ -57,6 +57,8 @@ along with GCC; see the file COPYING3.  If not see
- #include "gomp-constants.h"
- #include "tree-dump.h"
- #include "gimple-walk.h"
-+#include "file-map.h"
-+
- #include "langhooks-def.h"	/* FIXME: for lhd_set_decl_assembler_name */
- #include "builtins.h"
- 
-@@ -2432,6 +2434,7 @@ gimplify_call_expr (tree *expr_p, gimple_seq *pre_p, bool want_value)
-       case BUILT_IN_FILE:
- 	{
- 	  const char *locfile = LOCATION_FILE (EXPR_LOCATION (*expr_p));
-+	  locfile = remap_file_filename (locfile);
- 	  *expr_p = build_string_literal (strlen (locfile) + 1, locfile);
- 	  return GS_OK;
- 	}
-diff --git a/libcpp/Makefile.in b/libcpp/Makefile.in
-index a7d7828..3d29572 100644
---- a/libcpp/Makefile.in
-+++ b/libcpp/Makefile.in
-@@ -84,12 +84,12 @@ DEPMODE = $(CXXDEPMODE)
- 
- 
- libcpp_a_OBJS = charset.o directives.o directives-only.o errors.o \
--	expr.o files.o identifiers.o init.o lex.o line-map.o macro.o \
--	mkdeps.o pch.o symtab.o traditional.o
-+	expr.o file-map.o files.o identifiers.o init.o lex.o line-map.o \
-+	macro.o mkdeps.o pch.o symtab.o traditional.o
- 
- libcpp_a_SOURCES = charset.c directives.c directives-only.c errors.c \
--	expr.c files.c identifiers.c init.c lex.c line-map.c macro.c \
--	mkdeps.c pch.c symtab.c traditional.c
-+	expr.c file-map.c files.c identifiers.c init.c lex.c line-map.c \
-+	macro.c mkdeps.c pch.c symtab.c traditional.c
- 
- all: libcpp.a $(USED_CATALOGS)
- 
-@@ -263,7 +263,7 @@ po/$(PACKAGE).pot: $(libcpp_a_SOURCES)
- 
- TAGS_SOURCES = $(libcpp_a_SOURCES) internal.h ucnid.h \
-     include/line-map.h include/symtab.h include/cpp-id-data.h \
--    include/cpplib.h include/mkdeps.h system.h
-+    include/cpplib.h include/mkdeps.h system.h include/file-map.h
- 
- TAGS: $(TAGS_SOURCES)
- 	cd $(srcdir) && etags $(TAGS_SOURCES)
-diff --git a/libcpp/file-map.c b/libcpp/file-map.c
-new file mode 100644
-index 0000000..18035ef
---- /dev/null
-+++ b/libcpp/file-map.c
-@@ -0,0 +1,92 @@
-+/* Map one directory name to another in __FILE__, __BASE_FILE__
-+   and __builtin_FILE ().
-+   Copyright (C) 2001-2016 Free Software Foundation, Inc.
-+
-+This program is free software; you can redistribute it and/or modify it
-+under the terms of the GNU General Public License as published by the
-+Free Software Foundation; either version 3, or (at your option) any
-+later version.
-+
-+This program is distributed in the hope that it will be useful,
-+but WITHOUT ANY WARRANTY; without even the implied warranty of
-+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+GNU General Public License for more details.
-+
-+You should have received a copy of the GNU General Public License
-+along with this program; see the file COPYING3.  If not see
-+<http://www.gnu.org/licenses/>.
-+
-+ In other words, you are welcome to use, share and improve this program.
-+ You are forbidden to forbid anyone else to use, share and improve
-+ what you give them.   Help stamp out software-hoarding!  */
-+
-+#include "config.h"
-+#include "system.h"
-+#include "file-map.h"
-+
-+/* Structure recording the mapping from source file and directory
-+   names at compile time to __FILE__ */
-+typedef struct file_prefix_map
-+{
-+  const char *old_prefix;
-+  const char *new_prefix;
-+  size_t old_len;
-+  size_t new_len;
-+  struct file_prefix_map *next;
-+} file_prefix_map;
-+
-+/* Linked list of such structures.  */
-+static file_prefix_map *file_prefix_maps;
-+
-+/* Record prefix mapping of __FILE__.  ARG is the argument to
-+   -ffile-prefix-map and must be of the form OLD=NEW.  */
-+int
-+add_file_prefix_map (const char *arg)
-+{
-+  file_prefix_map *map;
-+  const char *p;
-+
-+  p = strchr (arg, '=');
-+  if (!p)
-+  {
-+      fprintf(stderr, "invalid argument %qs to -ffile-prefix-map", arg);
-+      return -1;
-+  }
-+  map = XNEW (file_prefix_map);
-+  map->old_prefix = xstrndup (arg, p - arg);
-+  map->old_len = p - arg;
-+  p++;
-+  map->new_prefix = xstrdup (p);
-+  map->new_len = strlen (p);
-+  map->next = file_prefix_maps;
-+  file_prefix_maps = map;
-+
-+  return 0;
-+}
-+
-+/* Perform user-specified mapping of __FILE__ prefixes.  Return
-+   the new name corresponding to filename.  */
-+
-+const char *
-+remap_file_filename (const char *filename)
-+{
-+  file_prefix_map *map;
-+  char *s;
-+  const char *name;
-+  size_t name_len;
-+
-+  for (map = file_prefix_maps; map; map = map->next)
-+    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
-+      break;
-+  if (!map)
-+    return filename;
-+  name = filename + map->old_len;
-+  name_len = strlen (name) + 1;
-+  s = (char *) alloca (name_len + map->new_len);
-+  memcpy (s, map->new_prefix, map->new_len);
-+  memcpy (s + map->new_len, name, name_len);
-+
-+  return xstrdup (s);
-+}
-+
-+
-diff --git a/libcpp/include/file-map.h b/libcpp/include/file-map.h
-new file mode 100644
-index 0000000..8750315
---- /dev/null
-+++ b/libcpp/include/file-map.h
-@@ -0,0 +1,30 @@
-+/* Map one directory name to another in __FILE__, __BASE_FILE__
-+   and __builtin_FILE ().
-+   Copyright (C) 2001-2016 Free Software Foundation, Inc.
-+
-+This program is free software; you can redistribute it and/or modify it
-+under the terms of the GNU General Public License as published by the
-+Free Software Foundation; either version 3, or (at your option) any
-+later version.
-+
-+This program is distributed in the hope that it will be useful,
-+but WITHOUT ANY WARRANTY; without even the implied warranty of
-+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+GNU General Public License for more details.
-+
-+You should have received a copy of the GNU General Public License
-+along with this program; see the file COPYING3.  If not see
-+<http://www.gnu.org/licenses/>.
-+
-+ In other words, you are welcome to use, share and improve this program.
-+ You are forbidden to forbid anyone else to use, share and improve
-+ what you give them.   Help stamp out software-hoarding!  */
-+
-+#ifndef LIBCPP_FILE_MAP_H
-+#define LIBCPP_FILE_MAP_H
-+
-+const char * remap_file_filename (const char *filename);
-+
-+int add_file_prefix_map (const char *arg);
-+
-+#endif /* !LIBCPP_FILE_MAP_H  */
-diff --git a/libcpp/macro.c b/libcpp/macro.c
-index c251553..3ceec3d 100644
---- a/libcpp/macro.c
-+++ b/libcpp/macro.c
-@@ -26,6 +26,7 @@ along with this program; see the file COPYING3.  If not see
- #include "system.h"
- #include "cpplib.h"
- #include "internal.h"
-+#include "file-map.h"
- 
- typedef struct macro_arg macro_arg;
- /* This structure represents the tokens of a macro argument.  These
-@@ -301,6 +302,7 @@ _cpp_builtin_macro_text (cpp_reader *pfile, cpp_hashnode *node,
- 	    if (!name)
- 	      abort ();
- 	  }
-+	name = remap_file_filename (name);
- 	len = strlen (name);
- 	buf = _cpp_unaligned_alloc (pfile, len * 2 + 3);
- 	result = buf;
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch b/meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
deleted file mode 100644
index 0077f80..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 25c87c6cc40ec5cc6965f8bfb215bec01abd6d82 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 16 Mar 2016 05:39:59 -0400
-Subject: [PATCH 43/46] Reuse -fdebug-prefix-map to replace -ffile-prefix-map
-
-The oe-core may use external toolchain to compile,
-which may not support -ffile-prefix-map.
-
-Since we use -fdebug-prefix-map to do the same thing,
-so we could reuse it to replace -ffile-prefix-map.
-
-Upstream-Status: Inappropriate[oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/opts-global.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gcc/opts-global.c b/gcc/opts-global.c
-index b7e5232..121d7b9 100644
---- a/gcc/opts-global.c
-+++ b/gcc/opts-global.c
-@@ -31,6 +31,7 @@ along with GCC; see the file COPYING3.  If not see
- #include "langhooks.h"
- #include "dbgcnt.h"
- #include "debug.h"
-+#include "file-map.h"
- #include "output.h"
- #include "plugin.h"
- #include "toplev.h"
-@@ -357,6 +358,9 @@ handle_common_deferred_options (void)
- 
- 	case OPT_fdebug_prefix_map_:
- 	  add_debug_prefix_map (opt->arg);
-+
-+	  /* Reuse -fdebug-prefix-map to replace -ffile-prefix-map */
-+	  add_file_prefix_map (opt->arg);
- 	  break;
- 
- 	case OPT_fdump_:
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
deleted file mode 100644
index 5d41af4..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 6ab23e88aef22bbabee7b9600c459ff39547bb66 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 24 Mar 2016 11:23:14 -0400
-Subject: [PATCH 44/46] gcc/final.c: -fdebug-prefix-map support to remap
- sources with relative path
-
-PR other/70428
-* final.c (remap_debug_filename): Use lrealpath to translate
-relative path before remapping
-
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70428
-Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- gcc/final.c | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/gcc/final.c b/gcc/final.c
-index 55cf509..23293e5 100644
---- a/gcc/final.c
-+++ b/gcc/final.c
-@@ -1554,16 +1554,25 @@ remap_debug_filename (const char *filename)
-   const char *name;
-   size_t name_len;
- 
-+  /* Support to remap filename with relative path  */
-+  char *realpath = lrealpath (filename);
-+  if (realpath == NULL)
-+    return filename;
-+
-   for (map = debug_prefix_maps; map; map = map->next)
--    if (filename_ncmp (filename, map->old_prefix, map->old_len) == 0)
-+    if (filename_ncmp (realpath, map->old_prefix, map->old_len) == 0)
-       break;
-   if (!map)
--    return filename;
--  name = filename + map->old_len;
-+    {
-+      free (realpath);
-+      return filename;
-+    }
-+  name = realpath + map->old_len;
-   name_len = strlen (name) + 1;
-   s = (char *) alloca (name_len + map->new_len);
-   memcpy (s, map->new_prefix, map->new_len);
-   memcpy (s + map->new_len, name, name_len);
-+  free (realpath);
-   return ggc_strdup (s);
- }
- 
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
deleted file mode 100644
index c62b727..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 5a47d404ea29e2547269e3ddf38754462d93f903 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Apr 2016 20:03:28 +0000
-Subject: [PATCH 45/46] libgcc: Add knob to use ldbl-128 on ppc
-
-musl does not support ldbl 128 so we can not assume
-that linux as a whole supports ldbl-128 bits, instead
-act upon configure option passed to gcc and assume no
-on musl and yes otherwise if no option is passed since
-default behaviour is to assume ldbl128 it does not
-change the defaults
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- libgcc/Makefile.in           |  1 +
- libgcc/config/rs6000/t-linux |  5 ++++-
- libgcc/configure             | 18 ++++++++++++++++++
- libgcc/configure.ac          | 12 ++++++++++++
- 4 files changed, 35 insertions(+), 1 deletion(-)
- mode change 100644 => 100755 libgcc/configure
-
-diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
-index f09b39b..296cf0f 100644
---- a/libgcc/Makefile.in
-+++ b/libgcc/Makefile.in
-@@ -43,6 +43,7 @@ enable_vtable_verify = @enable_vtable_verify@
- enable_decimal_float = @enable_decimal_float@
- fixed_point = @fixed_point@
- with_aix_soname = @with_aix_soname@
-+with_ldbl128 = @with_ldbl128@
- 
- host_noncanonical = @host_noncanonical@
- real_host_noncanonical = @real_host_noncanonical@
-diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-linux
-index 4f6d4c4..c50dd94 100644
---- a/libgcc/config/rs6000/t-linux
-+++ b/libgcc/config/rs6000/t-linux
-@@ -1,3 +1,6 @@
- SHLIB_MAPFILES += $(srcdir)/config/rs6000/libgcc-glibc.ver
- 
--HOST_LIBGCC2_CFLAGS += -mlong-double-128 -mno-minimal-toc
-+ifeq ($(with_ldbl128),yes)
-+HOST_LIBGCC2_CFLAGS += -mlong-double-128
-+endif
-+HOST_LIBGCC2_CFLAGS += -mno-minimal-toc
-diff --git a/libgcc/configure b/libgcc/configure
-old mode 100644
-new mode 100755
-index e7d6c75..e9a9019
---- a/libgcc/configure
-+++ b/libgcc/configure
-@@ -614,6 +614,7 @@ build_vendor
- build_cpu
- build
- with_aix_soname
-+with_ldbl128
- enable_vtable_verify
- enable_shared
- libgcc_topdir
-@@ -663,6 +664,7 @@ with_cross_host
- with_ld
- enable_shared
- enable_vtable_verify
-+with_long_double_128
- with_aix_soname
- enable_version_specific_runtime_libs
- with_slibdir
-@@ -1319,6 +1321,7 @@ Optional Packages:
-   --with-target-subdir=SUBDIR      Configuring in a subdirectory for target
-   --with-cross-host=HOST           Configuring with a cross compiler
-   --with-ld               arrange to use the specified ld (full pathname)
-+  --with-long-double-128  use 128-bit long double by default
-   --with-aix-soname=aix|svr4|both
-                           shared library versioning (aka "SONAME") variant to
-                           provide on AIX
-@@ -2201,6 +2204,21 @@ fi
- 
- 
- 
-+# Check whether --with-long-double-128 was given.
-+if test "${with_long_double_128+set}" = set; then :
-+  withval=$with_long_double_128; with_ldbl128="$with_long_double_128"
-+else
-+  case "${host}" in
-+ power*-*-musl*)
-+   with_ldbl128="no";;
-+ *) with_ldbl128="yes";;
-+ esac
-+
-+fi
-+
-+
-+
-+
- # Check whether --with-aix-soname was given.
- if test "${with_aix_soname+set}" = set; then :
-   withval=$with_aix_soname; case "${host}:${enable_shared}" in
-diff --git a/libgcc/configure.ac b/libgcc/configure.ac
-index 269997f..81dc3ba 100644
---- a/libgcc/configure.ac
-+++ b/libgcc/configure.ac
-@@ -77,6 +77,18 @@ AC_ARG_ENABLE(vtable-verify,
- [enable_vtable_verify=no])
- AC_SUBST(enable_vtable_verify)
- 
-+AC_ARG_WITH(long-double-128,
-+[AS_HELP_STRING([--with-long-double-128],
-+    [use 128-bit long double by default])],
-+      with_ldbl128="$with_long_double_128",
-+[case "${host}" in
-+ power*-*-musl*)
-+   with_ldbl128="no";;
-+ *) with_ldbl128="yes";;
-+ esac
-+])
-+AC_SUBST(with_ldbl128)
-+
- AC_ARG_WITH(aix-soname,
- [AS_HELP_STRING([--with-aix-soname=aix|svr4|both],
-     [shared library versioning (aka "SONAME") variant to provide on AIX])],
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
deleted file mode 100644
index 390037f..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 513bf3c33e2f551f08bd57605091d5ddeba3536b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 May 2016 21:11:34 -0700
-Subject: [PATCH 46/46] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
-
-Upstream-Status: Pending
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libgcc/config/t-slibgcc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgcc/config/t-slibgcc b/libgcc/config/t-slibgcc
-index 8c5f890..29be909 100644
---- a/libgcc/config/t-slibgcc
-+++ b/libgcc/config/t-slibgcc
-@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
- 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
- 
- SHLIB_LINK = $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
--	$(SHLIB_LDFLAGS) \
-+	$(LDFLAGS) $(SHLIB_LDFLAGS) \
- 	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
- 	$(SHLIB_OBJS) $(SHLIB_LC) && \
- 	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
deleted file mode 100644
index 6b5da02..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 0a9ed0479203cb7e69c3745b0c259007410f39ba Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Sat, 24 Oct 2015 20:09:53 +0000
-Subject: [PATCH 47/47] libgcc_s: Use alias for __cpu_indicator_init instead of
- symver
-
-Adapter from
-
-https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
-
-This fix was debated but hasnt been applied gcc upstream since
-they expect musl to support '@' in symbol versioning which is
-a sun/gnu versioning extention. This patch however avoids the
-need for the '@' symbols at all
-
-libgcc/Changelog:
-
-2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
-	(__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
-
-	* config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SYMVER.
-
-gcc/Changelog:
-
-2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_init
-	call __cpu_indicator_init_local instead of __cpu_indicator_init.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Denied
-
- gcc/config/i386/i386.c       | 4 ++--
- libgcc/config/i386/cpuinfo.c | 6 +++---
- libgcc/config/i386/t-linux   | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
-index 861a029..1c97d72 100644
---- a/gcc/config/i386/i386.c
-+++ b/gcc/config/i386/i386.c
-@@ -40323,10 +40323,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
-     {
-     case IX86_BUILTIN_CPU_INIT:
-       {
--	/* Make it call __cpu_indicator_init in libgcc. */
-+	/* Make it call __cpu_indicator_init_local in libgcc.a. */
- 	tree call_expr, fndecl, type;
-         type = build_function_type_list (integer_type_node, NULL_TREE); 
--	fndecl = build_fn_decl ("__cpu_indicator_init", type);
-+	fndecl = build_fn_decl ("__cpu_indicator_init_local", type);
- 	call_expr = build_call_expr (fndecl, 0); 
- 	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
-       }
-diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index 8c2248d..6c82f15 100644
---- a/libgcc/config/i386/cpuinfo.c
-+++ b/libgcc/config/i386/cpuinfo.c
-@@ -485,7 +485,7 @@ __cpu_indicator_init (void)
-   return 0;
- }
- 
--#if defined SHARED && defined USE_ELF_SYMVER
--__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8.0");
--__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
-+#ifndef SHARED
-+int __cpu_indicator_init_local (void)
-+  __attribute__ ((weak, alias ("__cpu_indicator_init")));
- #endif
-diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
-index 11bb46e..4f47f7b 100644
---- a/libgcc/config/i386/t-linux
-+++ b/libgcc/config/i386/t-linux
-@@ -3,4 +3,4 @@
- # t-slibgcc-elf-ver and t-linux
- SHLIB_MAPFILES = libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc.ver
- 
--HOST_LIBGCC2_CFLAGS += -mlong-double-80 -DUSE_ELF_SYMVER
-+HOST_LIBGCC2_CFLAGS += -mlong-double-80
--- 
-2.9.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
deleted file mode 100644
index 30c158d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 10595c03c39b4e980d2a00e16fc84e9caf82292e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Feb 2017 12:56:00 -0800
-Subject: [PATCH 48/48] sync gcc stddef.h with musl
-
-musl defines ptrdiff_t size_t and wchar_t
-so dont define them here if musl is definining them
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- gcc/ginclude/stddef.h | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/gcc/ginclude/stddef.h b/gcc/ginclude/stddef.h
-index d711530d053..c315b7a97c1 100644
---- a/gcc/ginclude/stddef.h
-+++ b/gcc/ginclude/stddef.h
-@@ -134,6 +134,7 @@ _TYPE_wchar_t;
- #ifndef ___int_ptrdiff_t_h
- #ifndef _GCC_PTRDIFF_T
- #ifndef _PTRDIFF_T_DECLARED /* DragonFly */
-+#ifndef __DEFINED_ptrdiff_t /* musl */
- #define _PTRDIFF_T
- #define _T_PTRDIFF_
- #define _T_PTRDIFF
-@@ -143,10 +144,12 @@ _TYPE_wchar_t;
- #define ___int_ptrdiff_t_h
- #define _GCC_PTRDIFF_T
- #define _PTRDIFF_T_DECLARED
-+#define __DEFINED_ptrdiff_t /* musl */
- #ifndef __PTRDIFF_TYPE__
- #define __PTRDIFF_TYPE__ long int
- #endif
- typedef __PTRDIFF_TYPE__ ptrdiff_t;
-+#endif /* __DEFINED_ptrdiff_t */
- #endif /* _PTRDIFF_T_DECLARED */
- #endif /* _GCC_PTRDIFF_T */
- #endif /* ___int_ptrdiff_t_h */
-@@ -184,6 +187,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
- #ifndef _GCC_SIZE_T
- #ifndef _SIZET_
- #ifndef __size_t
-+#ifndef __DEFINED_size_t /* musl */
- #define __size_t__	/* BeOS */
- #define __SIZE_T__	/* Cray Unicos/Mk */
- #define _SIZE_T
-@@ -200,6 +204,7 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
- #define ___int_size_t_h
- #define _GCC_SIZE_T
- #define _SIZET_
-+#define __DEFINED_size_t /* musl */
- #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
-   || defined(__DragonFly__) \
-   || defined(__FreeBSD_kernel__)
-@@ -235,6 +240,7 @@ typedef long ssize_t;
- #endif /* _SIZE_T */
- #endif /* __SIZE_T__ */
- #endif /* __size_t__ */
-+#endif /* __DEFINED_size_t */
- #undef	__need_size_t
- #endif /* _STDDEF_H or __need_size_t.  */
- 
-@@ -264,6 +270,7 @@ typedef long ssize_t;
- #ifndef ___int_wchar_t_h
- #ifndef __INT_WCHAR_T_H
- #ifndef _GCC_WCHAR_T
-+#ifndef __DEFINED_wchar_t /* musl */
- #define __wchar_t__	/* BeOS */
- #define __WCHAR_T__	/* Cray Unicos/Mk */
- #define _WCHAR_T
-@@ -279,6 +286,7 @@ typedef long ssize_t;
- #define __INT_WCHAR_T_H
- #define _GCC_WCHAR_T
- #define _WCHAR_T_DECLARED
-+#define __DEFINED_wchar_t /* musl */
- 
- /* On BSD/386 1.1, at least, machine/ansi.h defines _BSD_WCHAR_T_
-    instead of _WCHAR_T_, and _BSD_RUNE_T_ (which, unlike the other
-@@ -344,6 +352,7 @@ typedef __WCHAR_TYPE__ wchar_t;
- #endif
- #endif /* __WCHAR_T__ */
- #endif /* __wchar_t__ */
-+#endif /* __DEFINED_wchar_t musl */
- #undef	__need_wchar_t
- #endif /* _STDDEF_H or __need_wchar_t.  */
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch b/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
deleted file mode 100644
index 73ab950..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Need to pass NO_PIE_CFLAGS to ALL_* so gcc doesn't fail when
-we compile it with older gcc and pie.
-
-Upstream-Status: Inappropriate [configuration]
-
-Maintained by: Gentoo Toolchain Project <toolchain@gentoo.org>
-Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
-
---- a/gcc/Makefile.in	2015-06-25 19:18:12.000000000 +0200
-+++ b/gcc/Makefile.in	2016-04-22 00:12:54.029178860 +0200
-@@ -991,10 +991,10 @@ ALL_CXXFLAGS = $(T_CFLAGS) $(CFLAGS-$@)
- ALL_CPPFLAGS = $(INCLUDES) $(CPPFLAGS)
-
- # This is the variable to use when using $(COMPILER).
--ALL_COMPILERFLAGS = $(ALL_CXXFLAGS)
-+ALL_COMPILERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
-
- # This is the variable to use when using $(LINKER).
--ALL_LINKERFLAGS = $(ALL_CXXFLAGS)
-+ALL_LINKERFLAGS = $(NO_PIE_CFLAGS) $(ALL_CXXFLAGS)
-
- # Build and host support libraries.
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch b/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
deleted file mode 100644
index c266cfe..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-Backport and edit of patches from:
-https://gcc.gnu.org/viewcvs/gcc?limit_changes=0&view=revision&revision=249957
-by jsm28 (Joseph Myers)
-
-Current glibc no longer gives the ucontext_t type the tag struct
-ucontext, to conform with POSIX namespace rules.  This requires
-various linux-unwind.h files in libgcc, that were previously using
-struct ucontext, to be fixed to use ucontext_t instead.  This is
-similar to the removal of the struct siginfo tag from siginfo_t some
-years ago.
-
-This patch changes those files to use ucontext_t instead.  As the
-standard name that should be unconditionally safe, so this is not
-restricted to architectures supported by glibc, or conditioned on the
-glibc version.
-
-Upstream-Status: Backport
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-
---- branches/gcc-6-branch/libgcc/config/aarch64/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/aarch64/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -52,7 +52,7 @@
-   struct rt_sigframe
-   {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   };
- 
-   struct rt_sigframe *rt_;
---- branches/gcc-6-branch/libgcc/config/alpha/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/alpha/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -51,7 +51,7 @@
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       sc = &rt_->uc.uc_mcontext;
-     }
---- branches/gcc-6-branch/libgcc/config/bfin/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/bfin/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -52,7 +52,7 @@
- 	void *puc;
- 	char retcode[8];
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
- 
-       /* The void * cast is necessary to avoid an aliasing warning.
---- branches/gcc-6-branch/libgcc/config/i386/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/i386/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -58,7 +58,7 @@
-   if (*(unsigned char *)(pc+0) == 0x48
-       && *(unsigned long long *)(pc+1) == RT_SIGRETURN_SYSCALL)
-     {
--      struct ucontext *uc_ = context->cfa;
-+      ucontext_t *uc_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
-          because it does not alias anything.  */
-@@ -138,7 +138,7 @@
- 	siginfo_t *pinfo;
- 	void *puc;
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
---- branches/gcc-6-branch/libgcc/config/m68k/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/m68k/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -33,7 +33,7 @@
- /* <sys/ucontext.h> is unfortunately broken right now.  */
- struct uw_ucontext {
- 	unsigned long	  uc_flags;
--	struct ucontext  *uc_link;
-+	ucontext_t	 *uc_link;
- 	stack_t		  uc_stack;
- 	mcontext_t	  uc_mcontext;
- 	unsigned long	  uc_filler[80];
---- branches/gcc-6-branch/libgcc/config/nios2/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/nios2/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -38,7 +38,7 @@
- 
- struct nios2_ucontext {
-   unsigned long uc_flags;
--  struct ucontext *uc_link;
-+  ucontext_t *uc_link;
-   stack_t uc_stack;
-   struct nios2_mcontext uc_mcontext;
-   sigset_t uc_sigmask;	/* mask last for extensibility */
---- branches/gcc-6-branch/libgcc/config/pa/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/pa/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -80,7 +80,7 @@
-   struct sigcontext *sc;
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *frame;
- 
-   /* rt_sigreturn trampoline:
---- branches/gcc-6-branch/libgcc/config/sh/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/sh/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -180,7 +180,7 @@
-     {
-       struct rt_sigframe {
- 	siginfo_t info;
--	struct ucontext uc;
-+	ucontext_t uc;
-       } *rt_ = context->cfa;
-       /* The void * cast is necessary to avoid an aliasing warning.
-          The aliasing warning is correct, but should not be a problem
---- branches/gcc-6-branch/libgcc/config/tilepro/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/tilepro/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -61,7 +61,7 @@
-   struct rt_sigframe {
-     unsigned char save_area[C_ABI_SAVE_AREA_SIZE];
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *rt_;
- 
-   /* Return if this is not a signal handler.  */
---- branches/gcc-6-branch/libgcc/config/xtensa/linux-unwind.h	2017/07/04 10:22:56	249956
---- b/libgcc/config/xtensa/linux-unwind.h	2017/07/04 10:23:57	249957
-@@ -67,7 +67,7 @@
- 
-   struct rt_sigframe {
-     siginfo_t info;
--    struct ucontext uc;
-+    ucontext_t uc;
-   } *rt_;
- 
-   /* movi a2, __NR_rt_sigreturn; syscall */
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch b/meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
deleted file mode 100644
index 231f147..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From a582b0a53d1dc8604a201348b99ca8de48784e7e Mon Sep 17 00:00:00 2001
-From: jiwang <jiwang@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 12 May 2016 17:00:52 +0000
-Subject: [PATCH] [LRA] PR70904, relax the restriction on subreg reload for
- wide mode
-
-2016-05-12  Jiong Wang  <jiong.wang@arm.com>
-
-gcc/
-  PR rtl-optimization/70904
-  * lra-constraint.c (process_addr_reg): Relax the restriction on
-  subreg reload for wide mode.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@236181 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/lra-constraints.c | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/lra-constraints.c b/gcc/lra-constraints.c
-index f96fd458e23..73fb72a2ea5 100644
---- a/gcc/lra-constraints.c
-+++ b/gcc/lra-constraints.c
-@@ -1326,7 +1326,21 @@ process_addr_reg (rtx *loc, bool check_only_p, rtx_insn **before, rtx_insn **aft
- 
-   subreg_p = GET_CODE (*loc) == SUBREG;
-   if (subreg_p)
--    loc = &SUBREG_REG (*loc);
-+    {
-+      reg = SUBREG_REG (*loc);
-+      mode = GET_MODE (reg);
-+
-+      /* For mode with size bigger than ptr_mode, there unlikely to be "mov"
-+	 between two registers with different classes, but there normally will
-+	 be "mov" which transfers element of vector register into the general
-+	 register, and this normally will be a subreg which should be reloaded
-+	 as a whole.  This is particularly likely to be triggered when
-+	 -fno-split-wide-types specified.  */
-+      if (in_class_p (reg, cl, &new_class)
-+	  || GET_MODE_SIZE (mode) <= GET_MODE_SIZE (ptr_mode))
-+       loc = &SUBREG_REG (*loc);
-+    }
-+
-   reg = *loc;
-   mode = GET_MODE (reg);
-   if (! REG_P (reg))
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch b/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
deleted file mode 100644
index 0214ab8..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From ad5bf450aef2ffee6d57ed193fabc5f72f8eaa65 Mon Sep 17 00:00:00 2001
-From: rearnsha <rearnsha@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 19 Oct 2017 13:16:42 +0000
-Subject: [PATCH] [ARM] PR 82445 - suppress 32-bit aligned ldrd/strd peepholing
- with -mno-unaligned-access
-
-Peephole patterns exist in the arm backend to spot load/store
-operations to adjacent memory operations in order to convert them into
-ldrd/strd instructions.  However, when we have strict alignment
-enforced, then we can only do this if the accesses are known to be
-64-bit aligned; this is unlikely to be the case for most loads.  The
-patch adds some alignment checking to the code that validates the
-addresses for use in the peephole patterns.  This should also fix
-incorrect generation of ldrd/strd with unaligned accesses that could
-previously have occurred on ARMv5e where all such operations must be
-64-bit aligned.
-
-I've added some new tests as well.  In doing so I discovered that the
-ldrd/strd peephole tests could never fail since they would match the
-source file name in the scanned assembly as well as any instructions
-of the intended type.  I've fixed those by tightening the scan results
-slightly.
-
-gcc:
-
-* config/arm/arm.c (align_ok_ldrd_strd): New function.
-(mem_ok_for_ldrd_strd): New parameter align.  Extract the alignment of the
-mem into it.
-(gen_operands_ldrd_strd): Validate the alignment of the accesses.
-
-testsuite:
-
-* gcc.target/arm/peep-ldrd-1.c: Tighten test scan pattern.
-* gcc.target/arm/peep-strd-1.c: Likewise.
-* gcc.target/arm/peep-ldrd-2.c: New test.
-* gcc.target/arm/peep-strd-2.c: New test.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@253892 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/ChangeLog                                      |  8 +++++++
- gcc/config/arm/arm.c                               | 27 ++++++++++++++++++----
- gcc/testsuite/ChangeLog                            |  8 +++++++
- gcc/testsuite/gcc.target/arm/peep-ldrd-1.c         |  2 +-
- .../arm/{peep-ldrd-1.c => peep-ldrd-2.c}           |  4 ++--
- gcc/testsuite/gcc.target/arm/peep-strd-1.c         |  2 +-
- .../arm/{peep-strd-1.c => peep-strd-2.c}           |  4 ++--
- 7 files changed, 44 insertions(+), 11 deletions(-)
- copy gcc/testsuite/gcc.target/arm/{peep-ldrd-1.c => peep-ldrd-2.c} (63%)
- copy gcc/testsuite/gcc.target/arm/{peep-strd-1.c => peep-strd-2.c} (58%)
-
-diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
-index 9c0813d598d..e3da9f77fb6 100644
---- a/gcc/config/arm/arm.c
-+++ b/gcc/config/arm/arm.c
-@@ -15926,12 +15926,23 @@ operands_ok_ldrd_strd (rtx rt, rtx rt2, rtx rn, HOST_WIDE_INT offset,
-   return true;
- }
- 
-+/* Return true if a 64-bit access with alignment ALIGN and with a
-+   constant offset OFFSET from the base pointer is permitted on this
-+   architecture.  */
-+static bool
-+align_ok_ldrd_strd (HOST_WIDE_INT align, HOST_WIDE_INT offset)
-+{
-+  return (unaligned_access
-+	  ? (align >= BITS_PER_WORD && (offset & 3) == 0)
-+	  : (align >= 2 * BITS_PER_WORD && (offset & 7) == 0));
-+}
-+
- /* Helper for gen_operands_ldrd_strd.  Returns true iff the memory
-    operand MEM's address contains an immediate offset from the base
--   register and has no side effects, in which case it sets BASE and
--   OFFSET accordingly.  */
-+   register and has no side effects, in which case it sets BASE,
-+   OFFSET and ALIGN accordingly.  */
- static bool
--mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
-+mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset, HOST_WIDE_INT *align)
- {
-   rtx addr;
- 
-@@ -15950,6 +15961,7 @@ mem_ok_for_ldrd_strd (rtx mem, rtx *base, rtx *offset)
-   gcc_assert (MEM_P (mem));
- 
-   *offset = const0_rtx;
-+  *align = MEM_ALIGN (mem);
- 
-   addr = XEXP (mem, 0);
- 
-@@ -15990,7 +16002,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-                         bool const_store, bool commute)
- {
-   int nops = 2;
--  HOST_WIDE_INT offsets[2], offset;
-+  HOST_WIDE_INT offsets[2], offset, align[2];
-   rtx base = NULL_RTX;
-   rtx cur_base, cur_offset, tmp;
-   int i, gap;
-@@ -16002,7 +16014,8 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-      registers, and the corresponding memory offsets.  */
-   for (i = 0; i < nops; i++)
-     {
--      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset))
-+      if (!mem_ok_for_ldrd_strd (operands[nops+i], &cur_base, &cur_offset,
-+				 &align[i]))
-         return false;
- 
-       if (i == 0)
-@@ -16114,6 +16127,7 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-       /* Swap the instructions such that lower memory is accessed first.  */
-       std::swap (operands[0], operands[1]);
-       std::swap (operands[2], operands[3]);
-+      std::swap (align[0], align[1]);
-       if (const_store)
-         std::swap (operands[4], operands[5]);
-     }
-@@ -16127,6 +16141,9 @@ gen_operands_ldrd_strd (rtx *operands, bool load,
-   if (gap != 4)
-     return false;
- 
-+  if (!align_ok_ldrd_strd (align[0], offset))
-+    return false;
-+
-   /* Make sure we generate legal instructions.  */
-   if (operands_ok_ldrd_strd (operands[0], operands[1], base, offset,
-                              false, load))
-diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-index eb2b86ee7b6..d49eff6b87e 100644
---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
-   *p = a;
-   return a;
- }
--/* { dg-final { scan-assembler "ldrd" } } */
-+/* { dg-final { scan-assembler "ldrd\\t" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
-similarity index 63%
-copy from gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-copy to gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
-index eb2b86ee7b6..6822c2b1454 100644
---- a/gcc/testsuite/gcc.target/arm/peep-ldrd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-ldrd-2.c
-@@ -1,6 +1,6 @@
- /* { dg-do compile } */
- /* { dg-require-effective-target arm_prefer_ldrd_strd } */
--/* { dg-options "-O2" }  */
-+/* { dg-options "-O2 -mno-unaligned-access" }  */
- int foo(int a, int b, int* p, int *q)
- {
-   a = p[2] + p[3];
-@@ -8,4 +8,4 @@ int foo(int a, int b, int* p, int *q)
-   *p = a;
-   return a;
- }
--/* { dg-final { scan-assembler "ldrd" } } */
-+/* { dg-final { scan-assembler-not "ldrd\\t" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-index bd330769599..fe1beac7229 100644
---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-@@ -6,4 +6,4 @@ void foo(int a, int b, int* p)
-   p[2] = a;
-   p[3] = b;
- }
--/* { dg-final { scan-assembler "strd" } } */
-+/* { dg-final { scan-assembler "strd\\t" } } */
-diff --git a/gcc/testsuite/gcc.target/arm/peep-strd-1.c b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
-similarity index 58%
-copy from gcc/testsuite/gcc.target/arm/peep-strd-1.c
-copy to gcc/testsuite/gcc.target/arm/peep-strd-2.c
-index bd330769599..bfc5ebe9eec 100644
---- a/gcc/testsuite/gcc.target/arm/peep-strd-1.c
-+++ b/gcc/testsuite/gcc.target/arm/peep-strd-2.c
-@@ -1,9 +1,9 @@
- /* { dg-do compile } */
- /* { dg-require-effective-target arm_prefer_ldrd_strd } */
--/* { dg-options "-O2" }  */
-+/* { dg-options "-O2 -mno-unaligned-access" }  */
- void foo(int a, int b, int* p)
- {
-   p[2] = a;
-   p[3] = b;
- }
--/* { dg-final { scan-assembler "strd" } } */
-+/* { dg-final { scan-assembler-not "strd\\t" } } */
--- 
-2.15.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch b/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
deleted file mode 100644
index 3cdbb2d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
+++ /dev/null
@@ -1,223 +0,0 @@
-From 59a0e4bd8391962f62600ae3ac95ab0fba74d464 Mon Sep 17 00:00:00 2001
-From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 4 Aug 2016 16:53:18 +0000
-Subject: [PATCH] Fix for PR71696 in Libiberty Demangler
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-[BZ #71696] -- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71696
-
-2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>
-
-	PR c++/71696
-	* cplus-dem.c: Prevent infinite recursion when there is a cycle
-	in the referencing of remembered mangled types.
-	(work_stuff): New stack to keep track of the remembered mangled
-	types that are currently being processed.
-	(push_processed_type): New method to push currently processed
-	remembered type onto the stack.
-	(pop_processed_type): New method to pop currently processed
-	remembered type from the stack.
-	(work_stuff_copy_to_from): Copy values of new variables.
-	(delete_non_B_K_work_stuff): Free stack memory.
-	(demangle_args): Push/Pop currently processed remembered type.
-	(do_type): Do not demangle a cyclic reference and push/pop
-	referenced remembered type.
-
-cherry-picked from commit of
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239143 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport [master]
-CVE: CVE-2016-6131
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
----
- libiberty/ChangeLog                   | 17 ++++++++
- libiberty/cplus-dem.c                 | 78 ++++++++++++++++++++++++++++++++---
- libiberty/testsuite/demangle-expected | 18 ++++++++
- 3 files changed, 108 insertions(+), 5 deletions(-)
-
-Index: gcc-6.4.0/libiberty/cplus-dem.c
-===================================================================
---- gcc-6.4.0.orig/libiberty/cplus-dem.c
-+++ gcc-6.4.0/libiberty/cplus-dem.c
-@@ -144,6 +144,9 @@ struct work_stuff
-   string* previous_argument; /* The last function argument demangled.  */
-   int nrepeats;         /* The number of times to repeat the previous
- 			   argument.  */
-+  int *proctypevec;     /* Indices of currently processed remembered typevecs.  */
-+  int proctypevec_size;
-+  int nproctypes;
- };
- 
- #define PRINT_ANSI_QUALIFIERS (work -> options & DMGL_ANSI)
-@@ -435,6 +438,10 @@ iterate_demangle_function (struct work_s
- 
- static void remember_type (struct work_stuff *, const char *, int);
- 
-+static void push_processed_type (struct work_stuff *, int);
-+
-+static void pop_processed_type (struct work_stuff *);
-+
- static void remember_Btype (struct work_stuff *, const char *, int, int);
- 
- static int register_Btype (struct work_stuff *);
-@@ -1301,6 +1308,10 @@ work_stuff_copy_to_from (struct work_stu
-       memcpy (to->btypevec[i], from->btypevec[i], len);
-     }
- 
-+  if (from->proctypevec)
-+    to->proctypevec =
-+      XDUPVEC (int, from->proctypevec, from->proctypevec_size);
-+
-   if (from->ntmpl_args)
-     to->tmpl_argvec = XNEWVEC (char *, from->ntmpl_args);
- 
-@@ -1329,11 +1340,17 @@ delete_non_B_K_work_stuff (struct work_s
-   /* Discard the remembered types, if any.  */
- 
-   forget_types (work);
--  if (work -> typevec != NULL)
-+  if (work->typevec != NULL)
-     {
--      free ((char *) work -> typevec);
--      work -> typevec = NULL;
--      work -> typevec_size = 0;
-+      free ((char *) work->typevec);
-+      work->typevec = NULL;
-+      work->typevec_size = 0;
-+    }
-+  if (work->proctypevec != NULL)
-+    {
-+      free (work->proctypevec);
-+      work->proctypevec = NULL;
-+      work->proctypevec_size = 0;
-     }
-   if (work->tmpl_argvec)
-     {
-@@ -3552,6 +3569,8 @@ static int
- do_type (struct work_stuff *work, const char **mangled, string *result)
- {
-   int n;
-+  int i;
-+  int is_proctypevec;
-   int done;
-   int success;
-   string decl;
-@@ -3564,6 +3583,7 @@ do_type (struct work_stuff *work, const
- 
-   done = 0;
-   success = 1;
-+  is_proctypevec = 0;
-   while (success && !done)
-     {
-       int member;
-@@ -3616,8 +3636,15 @@ do_type (struct work_stuff *work, const
- 	      success = 0;
- 	    }
- 	  else
-+	    for (i = 0; i < work->nproctypes; i++)
-+	      if (work -> proctypevec [i] == n)
-+	        success = 0;
-+
-+	  if (success)
- 	    {
--	      remembered_type = work -> typevec[n];
-+	      is_proctypevec = 1;
-+	      push_processed_type (work, n);
-+	      remembered_type = work->typevec[n];
- 	      mangled = &remembered_type;
- 	    }
- 	  break;
-@@ -3840,6 +3867,9 @@ do_type (struct work_stuff *work, const
-     string_delete (result);
-   string_delete (&decl);
- 
-+  if (is_proctypevec)
-+    pop_processed_type (work);
-+
-   if (success)
-     /* Assume an integral type, if we're not sure.  */
-     return (int) ((tk == tk_none) ? tk_integral : tk);
-@@ -4252,6 +4282,41 @@ do_arg (struct work_stuff *work, const c
- }
- 
- static void
-+push_processed_type (struct work_stuff *work, int typevec_index)
-+{
-+  if (work->nproctypes >= work->proctypevec_size)
-+    {
-+      if (!work->proctypevec_size)
-+	{
-+	  work->proctypevec_size = 4;
-+	  work->proctypevec = XNEWVEC (int, work->proctypevec_size);
-+	}
-+      else
-+	{
-+	  if (work->proctypevec_size < 16)
-+	    /* Double when small.  */
-+	    work->proctypevec_size *= 2;
-+	  else
-+	    {
-+	      /* Grow slower when large.  */
-+	      if (work->proctypevec_size > (INT_MAX / 3) * 2)
-+                xmalloc_failed (INT_MAX);
-+              work->proctypevec_size = (work->proctypevec_size * 3 / 2);
-+	    }
-+          work->proctypevec
-+            = XRESIZEVEC (int, work->proctypevec, work->proctypevec_size);
-+	}
-+    }
-+    work->proctypevec [work->nproctypes++] = typevec_index;
-+}
-+
-+static void
-+pop_processed_type (struct work_stuff *work)
-+{
-+  work->nproctypes--;
-+}
-+
-+static void
- remember_type (struct work_stuff *work, const char *start, int len)
- {
-   char *tem;
-@@ -4515,10 +4580,13 @@ demangle_args (struct work_stuff *work,
- 		{
- 		  string_append (declp, ", ");
- 		}
-+	      push_processed_type (work, t);
- 	      if (!do_arg (work, &tem, &arg))
- 		{
-+		  pop_processed_type (work);
- 		  return (0);
- 		}
-+	      pop_processed_type (work);
- 	      if (PRINT_ARG_TYPES)
- 		{
- 		  string_appends (declp, &arg);
-Index: gcc-6.4.0/libiberty/testsuite/demangle-expected
-===================================================================
---- gcc-6.4.0.orig/libiberty/testsuite/demangle-expected
-+++ gcc-6.4.0/libiberty/testsuite/demangle-expected
-@@ -4491,3 +4491,21 @@ void eat<int*, Foo()::{lambda(auto:1*, a
- 
- _Z3eatIPiZ3BarIsEvvEUlPsPT_PT0_E0_EvRS3_RS5_
- void eat<int*, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}>(int*&, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}&)
-+#
-+# Tests write access violation PR70926
-+
-+0__Ot2m02R5T0000500000
-+0__Ot2m02R5T0000500000
-+#
-+
-+0__GT50000000000_
-+0__GT50000000000_
-+#
-+
-+__t2m05B500000000000000000_
-+__t2m05B500000000000000000_
-+#
-+# Tests stack overflow PR71696
-+
-+__10%0__S4_0T0T0
-+%0<>::%0(%0<>)
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
deleted file mode 100644
index bf53c5c..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian_6.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-cross-canadian.inc
-
-
-
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
deleted file mode 100644
index 4c73e5c..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross-initial_6.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-cross_${PV}.bb
-require gcc-cross-initial.inc
diff --git a/meta/recipes-devtools/gcc/gcc-cross_6.4.bb b/meta/recipes-devtools/gcc/gcc-cross_6.4.bb
deleted file mode 100644
index b43cca0..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross_6.4.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-cross.inc
-
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
deleted file mode 100644
index fd90e11..0000000
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_6.4.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
-require gcc-crosssdk-initial.inc
-
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
deleted file mode 100644
index 40a6c4f..0000000
--- a/meta/recipes-devtools/gcc/gcc-crosssdk_6.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-cross_${PV}.bb
-require gcc-crosssdk.inc
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_6.4.bb b/meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
deleted file mode 100644
index 8f31e77..0000000
--- a/meta/recipes-devtools/gcc/gcc-runtime_6.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-runtime.inc
-
-FILES_libgomp-dev += "\
-    ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/openacc.h \
-"
-
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
deleted file mode 100644
index 601f666..0000000
--- a/meta/recipes-devtools/gcc/gcc-sanitizers_6.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-sanitizers.inc
diff --git a/meta/recipes-devtools/gcc/gcc-source_6.4.bb b/meta/recipes-devtools/gcc/gcc-source_6.4.bb
deleted file mode 100644
index b890fa3..0000000
--- a/meta/recipes-devtools/gcc/gcc-source_6.4.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require recipes-devtools/gcc/gcc-source.inc
-
-EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/gcc/gcc_6.4.bb b/meta/recipes-devtools/gcc/gcc_6.4.bb
deleted file mode 100644
index 2c618df..0000000
--- a/meta/recipes-devtools/gcc/gcc_6.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-target.inc
-
-# Building with thumb enabled on armv4t fails with
-# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
-# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
-ARM_INSTRUCTION_SET_armv4 = "arm"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_6.4.bb b/meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
deleted file mode 100644
index 19f253f..0000000
--- a/meta/recipes-devtools/gcc/libgcc-initial_6.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require libgcc-initial.inc
diff --git a/meta/recipes-devtools/gcc/libgcc_6.4.bb b/meta/recipes-devtools/gcc/libgcc_6.4.bb
deleted file mode 100644
index a5152f2..0000000
--- a/meta/recipes-devtools/gcc/libgcc_6.4.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require libgcc.inc
diff --git a/meta/recipes-devtools/gcc/libgfortran_6.4.bb b/meta/recipes-devtools/gcc/libgfortran_6.4.bb
deleted file mode 100644
index 71dd8b4..0000000
--- a/meta/recipes-devtools/gcc/libgfortran_6.4.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require recipes-devtools/gcc/gcc-${PV}.inc
-require libgfortran.inc
-
-- 
2.7.4


