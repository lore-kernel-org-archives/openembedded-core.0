Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2457CB9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 18:07:37 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q17so8362139pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LZ0uyMOVpeHEHDAOBK46FrBif8YEFxybF4meM3h7xd4=;
	b=HGP+bXac9UCLRk91zakZz04igh3cnSDPx3E/n6LdO3iGn/b8DimwZ9woKXN/Mk9hgJ
	ItjTekh0ygy/jJBX+0FoA6bASaBa++U7iI4kw3zpeoU39saJPYr7p+RxAtTVC5iv5npU
	1slezlZNzHGpFYhva/JneSD62S5HWx/Dyt8M9DZtrz0OH33rJ3cp5JBq+iyCLN3ndgsq
	1XmtV9DXtPJPpOKLp61/mSRkanwB4OPsTEzIJy1xtHtQ/rQ+EYhMb5V/Ez4S/N3ziuaW
	Xf+sbV1VaqZlg4p4iuIRexdMesSJpIO8eVKrxLIE8jYnbnwxLjjjtktTiY+YutoRXAQI
	mpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LZ0uyMOVpeHEHDAOBK46FrBif8YEFxybF4meM3h7xd4=;
	b=RQF+4Li3xiRB0iF16O7TZ0/PAav381O/yTNa0gMgLis2kjSPWgbIMuI+/D+Y4RxEAa
	Pbok8mRiFHOZIkryLZCIl+EdPZgRwqFTn0bKzzGgeXReV7uMQ8wzisdaLmPnQ6R+f+qg
	mIPPjGNFbNqA88t055GlTx/O+Fzat29FLQsskGFPygDBdJnGfbpusspoNys+sopZNiPa
	WgBMypFPJmdI7ZbBHg5OHNqpxp8YywF+VS4Vb7diQ2znmUFhPJ5ZcihlBesXR2fWBdO3
	OtfTQpD7SYXYXyAZSpT9G6MRbPj4CUio7c4UX98qnbkmNQRSSzsvu8w8k7Z5L1d5tViw
	J3tw==
X-Gm-Message-State: AHQUAuZLtmI1dZbGqLAwaUykCRI0XU8SdZLMeHn6wyVb2te3nH+Sx91R
	qAm9YA6Yu9Wtim+uV2U4wfSrvEoo
X-Google-Smtp-Source: AHgI3IY2CJvydDVqyUzMdK8ovZ7GkATjLD/9wI5H+79gIwTQ5Ks6nrqUoMfzBsYp5VsIahoRlbJT4Q==
X-Received: by 2002:a63:6a48:: with SMTP id f69mr4107232pgc.7.1551290856086;
	Wed, 27 Feb 2019 10:07:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	n75sm31863630pfb.39.2019.02.27.10.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 10:07:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 10:07:25 -0800
Message-Id: <20190227180725.21396-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Subject: [PATCH V2] gcc: Update to 8.3 latest on 8.x release
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
X-List-Received-Date: Wed, 27 Feb 2019 18:07:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add checksums and fix version

 meta/recipes-devtools/gcc/gcc-8.2.inc         | 115 -----
 ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 465 ------------------
 .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch   |  44 --
 meta/recipes-devtools/gcc/gcc-8.3.inc         | 111 +++++
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  14 +-
 .../0002-gcc-poison-system-directories.patch} |  39 +-
 ...gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch} |  10 +-
 .../0004-64-bit-multilib-hack.patch}          |   6 +-
 .../0005-optional-libstdc.patch}              |  18 +-
 ...cc-disable-MASK_RELAX_PIC_CALLS-bit.patch} |  10 +-
 .../0007-COLLECT_GCC_OPTIONS.patch}           |   6 +-
 ...s.h-in-B-instead-of-S-and-t-oe-in-B.patch} |  10 +-
 .../0009-fortran-cross-compile-hack.patch}    |   6 +-
 .../0010-cpp-honor-sysroot.patch}             |   6 +-
 .../0011-MIPS64-Default-to-N64-ABI.patch}     |  10 +-
 ...MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} |  28 +-
 ...cc-Fix-argument-list-too-long-error.patch} |   6 +-
 .../0014-Disable-sdt.patch}                   |  16 +-
 .../0015-libtool.patch}                       |   6 +-
 ...-fix-v4bx-to-linker-to-support-EABI.patch} |   6 +-
 ...config-files-from-B-instead-of-usin.patch} |  10 +-
 ...r-from-.la-which-usually-points-to-.patch} |   6 +-
 .../0019-export-CPP.patch}                    |   8 +-
 ...LIB_OSDIRNAMES-and-other-multilib-o.patch} |   6 +-
 ...-target-gcc-headers-can-be-included.patch} |  42 +-
 ...ld-with-disable-dependency-tracking.patch} |   6 +-
 ...-directory-during-relink-if-inst_pr.patch} |   6 +-
 ...R-replacement-instead-of-hardcoding.patch} |  11 +-
 ...5-aarch64-Add-support-for-musl-ldso.patch} |  10 +-
 ...fix-libcc1-s-install-path-and-rpath.patch} |   6 +-
 ...e-sysroot-support-for-nativesdk-gcc.patch} |   6 +-
 ...root-gcc-version-specific-dirs-with.patch} |   6 +-
 ...us-_FOR_BUILD-and-related-variables.patch} |  16 +-
 ...30-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |  10 +-
 ...-to-link-commandline-for-musl-targe.patch} |  10 +-
 ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 125 +++++
 ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   6 +-
 ...s-for-__cpu_indicator_init-instead-.patch} |  19 +-
 .../0035-sync-gcc-stddef.h-with-musl.patch}   |  10 +-
 ...fault-in-precompiled-header-generat.patch} |   6 +-
 .../0037-Fix-for-testsuite-failure.patch}     |   6 +-
 ...e-introduce-spe-commandline-options.patch} |   6 +-
 .../0039-riscv-Disable-multilib-for-OE.patch} |   6 +-
 ...powerpc64-Add-support-for-musl-ldso.patch} |  12 +-
 ...adian_8.2.bb => gcc-cross-canadian_8.3.bb} |   0
 .../{gcc-cross_8.2.bb => gcc-cross_8.3.bb}    |   0
 ...cc-crosssdk_8.2.bb => gcc-crosssdk_8.3.bb} |   0
 ...{gcc-runtime_8.2.bb => gcc-runtime_8.3.bb} |   0
 ...anitizers_8.2.bb => gcc-sanitizers_8.3.bb} |   0
 .../{gcc-source_8.2.bb => gcc-source_8.3.bb}  |   0
 .../gcc/{gcc_8.2.bb => gcc_8.3.bb}            |   0
 ...c-initial_8.2.bb => libgcc-initial_8.3.bb} |   0
 .../gcc/{libgcc_8.2.bb => libgcc_8.3.bb}      |   0
 ...{libgfortran_8.2.bb => libgfortran_8.3.bb} |   0
 54 files changed, 464 insertions(+), 823 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.2.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3.inc
 rename meta/recipes-devtools/gcc/{gcc-8.2 => gcc-8.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (79%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0003-gcc-poison-system-directories.patch => gcc-8.3/0002-gcc-poison-system-directories.patch} (85%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch => gcc-8.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0006-64-bit-multilib-hack.patch => gcc-8.3/0004-64-bit-multilib-hack.patch} (97%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0007-optional-libstdc.patch => gcc-8.3/0005-optional-libstdc.patch} (92%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch => gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch} (89%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch => gcc-8.3/0007-COLLECT_GCC_OPTIONS.patch} (89%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch => gcc-8.3/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0011-fortran-cross-compile-hack.patch => gcc-8.3/0009-fortran-cross-compile-hack.patch} (91%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0012-cpp-honor-sysroot.patch => gcc-8.3/0010-cpp-honor-sysroot.patch} (94%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch => gcc-8.3/0011-MIPS64-Default-to-N64-ABI.patch} (85%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch => gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} (91%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch => gcc-8.3/0013-gcc-Fix-argument-list-too-long-error.patch} (91%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0016-Disable-sdt.patch => gcc-8.3/0014-Disable-sdt.patch} (92%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0017-libtool.patch => gcc-8.3/0015-libtool.patch} (91%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch => gcc-8.3/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch} (91%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch => gcc-8.3/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch} (92%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch => gcc-8.3/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch} (84%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0021-export-CPP.patch => gcc-8.3/0019-export-CPP.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch => gcc-8.3/0020-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch} (92%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch => gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch} (66%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch => gcc-8.3/0022-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch} (92%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch => gcc-8.3/0023-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (87%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch => gcc-8.3/0024-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch} (84%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch => gcc-8.3/0025-aarch64-Add-support-for-musl-ldso.patch} (87%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch => gcc-8.3/0026-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch => gcc-8.3/0027-handle-sysroot-support-for-nativesdk-gcc.patch} (98%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch => gcc-8.3/0028-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (95%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch => gcc-8.3/0029-Fix-various-_FOR_BUILD-and-related-variables.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch => gcc-8.3/0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch} (84%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch => gcc-8.3/0031-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (92%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
 rename meta/recipes-devtools/gcc/{gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch => gcc-8.3/0033-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} (86%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch => gcc-8.3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (88%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch => gcc-8.3/0035-sync-gcc-stddef.h-with-musl.patch} (95%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch => gcc-8.3/0036-fix-segmentation-fault-in-precompiled-header-generat.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0039-Fix-for-testsuite-failure.patch => gcc-8.3/0037-Fix-for-testsuite-failure.patch} (98%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0040-Re-introduce-spe-commandline-options.patch => gcc-8.3/0038-Re-introduce-spe-commandline-options.patch} (88%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch => gcc-8.3/0039-riscv-Disable-multilib-for-OE.patch} (88%)
 rename meta/recipes-devtools/gcc/{gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch => gcc-8.3/0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch} (85%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_8.2.bb => gcc-cross-canadian_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_8.2.bb => gcc-cross_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_8.2.bb => gcc-crosssdk_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_8.2.bb => gcc-runtime_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_8.2.bb => gcc-sanitizers_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_8.2.bb => gcc-source_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_8.2.bb => gcc_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_8.2.bb => libgcc-initial_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_8.2.bb => libgcc_8.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_8.2.bb => libgfortran_8.3.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
deleted file mode 100644
index b21c605e81..0000000000
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ /dev/null
@@ -1,115 +0,0 @@
-require gcc-common.inc
-
-# Third digit in PV should be incremented after a minor release
-
-PV = "8.2.0"
-
-# BINV should be incremented to a revision after a minor gcc release
-
-BINV = "8.2.0"
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-8.2:${FILE_DIRNAME}/gcc-8.2/backport:"
-
-DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
-NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
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
-#RELEASE = "8.0.1-RC-20180427"
-BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
-#SRCREV = "f7cf798b73fd1a07098f9a490deec1e2a36e0bed"
-#BASEURI ?= "git://github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
-#BASEURI ?= "http://mirrors.concertpass.com/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
-
-SRC_URI = "\
-           ${BASEURI} \
-           file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-           file://0003-gcc-poison-system-directories.patch \
-           file://0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
-           file://0006-64-bit-multilib-hack.patch \
-           file://0007-optional-libstdc.patch \
-           file://0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
-           file://0009-COLLECT_GCC_OPTIONS.patch \
-           file://0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
-           file://0011-fortran-cross-compile-hack.patch \
-           file://0012-cpp-honor-sysroot.patch \
-           file://0013-MIPS64-Default-to-N64-ABI.patch \
-           file://0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
-           file://0015-gcc-Fix-argument-list-too-long-error.patch \
-           file://0016-Disable-sdt.patch \
-           file://0017-libtool.patch \
-           file://0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
-           file://0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
-           file://0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
-           file://0021-export-CPP.patch \
-           file://0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch \
-           file://0023-Ensure-target-gcc-headers-can-be-included.patch \
-           file://0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
-           file://0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
-           file://0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
-           file://0027-aarch64-Add-support-for-musl-ldso.patch \
-           file://0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
-           file://0029-handle-sysroot-support-for-nativesdk-gcc.patch \
-           file://0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
-           file://0031-Fix-various-_FOR_BUILD-and-related-variables.patch \
-           file://0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
-           file://0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
-           file://0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
-           file://0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
-           file://0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
-           file://0037-sync-gcc-stddef.h-with-musl.patch \
-           file://0038-fix-segmentation-fault-in-precompiled-header-generat.patch \
-           file://0039-Fix-for-testsuite-failure.patch \
-           file://0040-Re-introduce-spe-commandline-options.patch \
-           file://0041-ARC-fix-spec-gen.patch \
-           file://0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
-           file://0043-riscv-Disable-multilib-for-OE.patch \
-           ${BACKPORTS} \
-"
-BACKPORTS = "\
-"
-SRC_URI[md5sum] = "4ab282f414676496483b3e1793d07862"
-SRC_URI[sha256sum] = "196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080"
-
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
-#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/git"
-#S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${RELEASE}"
-B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
-
-# Language Overrides
-FORTRAN = ""
-JAVA = ""
-
-LTO = "--enable-lto"
-SSP ?= "--disable-libssp"
-SSP_mingw32 = "--enable-libssp"
-
-EXTRA_OECONF_BASE = "\
-    ${LTO} \
-    ${SSP} \
-    --enable-libitm \
-    --disable-bootstrap \
-    --disable-libmudflap \
-    --with-system-zlib \
-    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
-    --enable-linker-build-id \
-    --with-ppl=no \
-    --with-cloog=no \
-    --enable-checking=release \
-    --enable-cheaders=c_global \
-    --without-isl \
-"
-
-EXTRA_OECONF_PATHS = "\
-    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
-    --with-sysroot=/not/exist \
-    --with-build-sysroot=${STAGING_DIR_TARGET} \
-"
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
deleted file mode 100644
index 391cda71d7..0000000000
--- a/meta/recipes-devtools/gcc/gcc-8.2/0034-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
+++ /dev/null
@@ -1,465 +0,0 @@
-From faf35e26740461fe1a1da5433d5a0169a663e3b5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Apr 2016 20:03:28 +0000
-Subject: [PATCH 34/39] libgcc: Add knob to use ldbl-128 on ppc
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
-index dd8cee99fd3..b5f478af382 100644
---- a/libgcc/Makefile.in
-+++ b/libgcc/Makefile.in
-@@ -48,6 +48,7 @@ unwind_header = @unwind_header@
- md_unwind_header = @md_unwind_header@
- sfp_machine_header = @sfp_machine_header@
- thread_header = @thread_header@
-+with_ldbl128 = @with_ldbl128@
- 
- host_noncanonical = @host_noncanonical@
- real_host_noncanonical = @real_host_noncanonical@
-diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-linux
-index 4f6d4c4a4d2..c50dd94a2da 100644
---- a/libgcc/config/rs6000/t-linux
-+++ b/libgcc/config/rs6000/t-linux
-@@ -1,3 +1,9 @@
- SHLIB_MAPFILES += $(srcdir)/config/rs6000/libgcc-glibc.ver
- 
--HOST_LIBGCC2_CFLAGS += -mlong-double-128 -mno-minimal-toc
-+ifeq ($(with_ldbl128),yes)
-+HOST_LIBGCC2_CFLAGS += -mlong-double-128
-+else
-+# We do not want to build ibm-ldouble.c.
-+LIB2ADD := $(filter-out %ibm-ldouble.c, $(LIB2ADD))
-+endif
-+HOST_LIBGCC2_CFLAGS += -mno-minimal-toc
-diff --git a/libgcc/config/rs6000/fixtfdi.c b/libgcc/config/rs6000/fixtfdi.c
---- a/libgcc/config/rs6000/fixtfdi.c	1969-12-31 19:00:00.000000000 -0500
-+++ b/libgcc/config/rs6000/fixtfdi.c	2018-12-12 17:54:50.110755540 -0500
-@@ -0,0 +1,42 @@
-+/* Software floating-point emulation.
-+   Convert a to 64bit signed integer
-+   Copyright (C) 1997-2016 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Contributed by Richard Henderson (rth@cygnus.com) and
-+		  Jakub Jelinek (jj@ultra.linux.cz).
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   In addition to the permissions in the GNU Lesser General Public
-+   License, the Free Software Foundation gives you unlimited
-+   permission to link the compiled version of this file into
-+   combinations with other programs, and to distribute those
-+   combinations without any restriction coming from the use of this
-+   file.  (The Lesser General Public License restrictions do apply in
-+   other respects; for example, they cover modification of the file,
-+   and distribution when not linked into a combine executable.)
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#ifdef _ARCH_PPC64
-+#include "soft-fp.h"
-+#include "quad-float128.h"
-+
-+DItype
-+__fixtfdi (TFtype a)
-+{
-+  if (a < 0)
-+    return - __fixunstfdi (-a);
-+  return __fixunstfdi (a);
-+}
-+#endif
-diff --git a/libgcc/config/rs6000/fixunstfdi.c b/libgcc/config/rs6000/fixunstfdi.c
---- a/libgcc/config/rs6000/fixunstfdi.c	1969-12-31 19:00:00.000000000 -0500
-+++ b/libgcc/config/rs6000/fixunstfdi.c	2018-12-12 17:56:06.141654537 -0500
-@@ -0,0 +1,58 @@
-+/* Software floating-point emulation.
-+   Convert a to 64bit unsigned integer
-+   Copyright (C) 1997-2016 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Contributed by Richard Henderson (rth@cygnus.com) and
-+		  Jakub Jelinek (jj@ultra.linux.cz).
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   In addition to the permissions in the GNU Lesser General Public
-+   License, the Free Software Foundation gives you unlimited
-+   permission to link the compiled version of this file into
-+   combinations with other programs, and to distribute those
-+   combinations without any restriction coming from the use of this
-+   file.  (The Lesser General Public License restrictions do apply in
-+   other respects; for example, they cover modification of the file,
-+   and distribution when not linked into a combine executable.)
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#ifdef _ARCH_PPC64
-+#include "soft-fp.h"
-+#include "quad-float128.h"
-+
-+DItype
-+__fixunstfdi (TFtype a)
-+{
-+  if (a < 0)
-+    return 0;
-+
-+  /* Compute high word of result, as a flonum.  */
-+  const TFtype b = (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
-+  /* Convert that to fixed (but not to DItype!),
-+     and shift it into the high word.  */
-+  UDItype v = (USItype) b;
-+  v <<= (sizeof (SItype) * 8);
-+  /* Remove high part from the TFtype, leaving the low part as flonum.  */
-+  a -= (TFtype) v;
-+  /* Convert that to fixed (but not to DItype!) and add it in.
-+     Sometimes A comes out negative.  This is significant, since
-+     A has more bits than a long int does.  */
-+  if (a < 0)
-+    v -= (USItype) (-a);
-+  else
-+    v += (USItype) a;
-+  return v;
-+}
-+#endif
-diff --git a/libgcc/config/rs6000/floatditf.c b/libgcc/config/rs6000/floatditf.c
---- a/libgcc/config/rs6000/floatditf.c	1969-12-31 19:00:00.000000000 -0500
-+++ b/libgcc/config/rs6000/floatditf.c	2018-12-12 17:57:55.852953553 -0500
-@@ -0,0 +1,47 @@
-+/* Software floating-point emulation.
-+   Convert a 64bit signed integer to IEEE quad
-+   Copyright (C) 1997-2016 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Contributed by Richard Henderson (rth@cygnus.com) and
-+		  Jakub Jelinek (jj@ultra.linux.cz).
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   In addition to the permissions in the GNU Lesser General Public
-+   License, the Free Software Foundation gives you unlimited
-+   permission to link the compiled version of this file into
-+   combinations with other programs, and to distribute those
-+   combinations without any restriction coming from the use of this
-+   file.  (The Lesser General Public License restrictions do apply in
-+   other respects; for example, they cover modification of the file,
-+   and distribution when not linked into a combine executable.)
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#ifdef _ARCH_PPC64
-+#include "soft-fp.h"
-+#include "double.h"
-+#include "quad-float128.h"
-+
-+TFtype
-+__floatditf (DItype u)
-+{
-+  DFtype dh, dl;
-+
-+  dh = (SItype) (u >> (sizeof (SItype) * 8));
-+  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
-+  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
-+
-+  return (TFtype) dh + (TFtype) dl;
-+}
-+#endif
-diff --git a/libgcc/config/rs6000/floatunditf.c b/libgcc/config/rs6000/floatunditf.c
---- a/libgcc/config/rs6000/floatunditf.c	1969-12-31 19:00:00.000000000 -0500
-+++ b/libgcc/config/rs6000/floatunditf.c	2018-12-12 17:57:15.262473574 -0500
-@@ -0,0 +1,47 @@
-+/* Software floating-point emulation.
-+   Convert a 64bit unsigned integer to IEEE quad
-+   Copyright (C) 1997-2016 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+   Contributed by Richard Henderson (rth@cygnus.com) and
-+		  Jakub Jelinek (jj@ultra.linux.cz).
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   In addition to the permissions in the GNU Lesser General Public
-+   License, the Free Software Foundation gives you unlimited
-+   permission to link the compiled version of this file into
-+   combinations with other programs, and to distribute those
-+   combinations without any restriction coming from the use of this
-+   file.  (The Lesser General Public License restrictions do apply in
-+   other respects; for example, they cover modification of the file,
-+   and distribution when not linked into a combine executable.)
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+#ifdef _ARCH_PPC64
-+#include "soft-fp.h"
-+#include "double.h"
-+#include "quad-float128.h"
-+
-+TFtype
-+__floatunditf (UDItype u)
-+{
-+  DFtype dh, dl;
-+
-+  dh = (USItype) (u >> (sizeof (SItype) * 8));
-+  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
-+  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
-+
-+  return (TFtype) dh + (TFtype) dl;
-+}
-+#endif
-diff --git a/libgcc/config/rs6000/ppc64-fp.c b/libgcc/config/rs6000/ppc64-fp.c
---- a/libgcc/config/rs6000/ppc64-fp.c	2018-12-12 17:53:49.540038500 -0500
-+++ b/libgcc/config/rs6000/ppc64-fp.c	2018-12-12 17:49:51.897235314 -0500
-@@ -25,34 +25,21 @@
- <http://www.gnu.org/licenses/>.  */
- 
- #if defined(__powerpc64__) || defined (__64BIT__) || defined(__ppc64__)
--#define TMODES
- #include "fp-bit.h"
- 
--extern DItype __fixtfdi (TFtype);
- extern DItype __fixdfdi (DFtype);
- extern DItype __fixsfdi (SFtype);
- extern USItype __fixunsdfsi (DFtype);
- extern USItype __fixunssfsi (SFtype);
--extern TFtype __floatditf (DItype);
--extern TFtype __floatunditf (UDItype);
- extern DFtype __floatdidf (DItype);
- extern DFtype __floatundidf (UDItype);
- extern SFtype __floatdisf (DItype);
- extern SFtype __floatundisf (UDItype);
--extern DItype __fixunstfdi (TFtype);
- 
- static DItype local_fixunssfdi (SFtype);
- static DItype local_fixunsdfdi (DFtype);
- 
- DItype
--__fixtfdi (TFtype a)
--{
--  if (a < 0)
--    return - __fixunstfdi (-a);
--  return __fixunstfdi (a);
--}
--
--DItype
- __fixdfdi (DFtype a)
- {
-   if (a < 0)
-@@ -86,30 +73,6 @@
-   return (SItype) a;
- }
- 
--TFtype
--__floatditf (DItype u)
--{
--  DFtype dh, dl;
--
--  dh = (SItype) (u >> (sizeof (SItype) * 8));
--  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
--  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
--
--  return (TFtype) dh + (TFtype) dl;
--}
--
--TFtype
--__floatunditf (UDItype u)
--{
--  DFtype dh, dl;
--
--  dh = (USItype) (u >> (sizeof (SItype) * 8));
--  dh *= 2.0 * (((UDItype) 1) << ((sizeof (SItype) * 8) - 1));
--  dl = (USItype) (u & ((((UDItype) 1) << (sizeof (SItype) * 8)) - 1));
--
--  return (TFtype) dh + (TFtype) dl;
--}
--
- DFtype
- __floatdidf (DItype u)
- {
-@@ -183,30 +146,6 @@
-   return (SFtype) f;
- }
- 
--DItype
--__fixunstfdi (TFtype a)
--{
--  if (a < 0)
--    return 0;
--
--  /* Compute high word of result, as a flonum.  */
--  const TFtype b = (a / (((UDItype) 1) << (sizeof (SItype) * 8)));
--  /* Convert that to fixed (but not to DItype!),
--     and shift it into the high word.  */
--  UDItype v = (USItype) b;
--  v <<= (sizeof (SItype) * 8);
--  /* Remove high part from the TFtype, leaving the low part as flonum.  */
--  a -= (TFtype) v;
--  /* Convert that to fixed (but not to DItype!) and add it in.
--     Sometimes A comes out negative.  This is significant, since
--     A has more bits than a long int does.  */
--  if (a < 0)
--    v -= (USItype) (-a);
--  else
--    v += (USItype) a;
--  return v;
--}
--
- /* This version is needed to prevent recursion; fixunsdfdi in libgcc
-    calls fixdfdi, which in turn calls calls fixunsdfdi.  */
- 
-diff --git a/libgcc/config/rs6000/quad-float128.h b/libgcc/config/rs6000/quad-float128.h
---- a/libgcc/config/rs6000/quad-float128.h	2018-12-12 17:53:49.540038500 -0500
-+++ b/libgcc/config/rs6000/quad-float128.h	2018-12-12 17:30:19.423468244 -0500
-@@ -104,6 +104,11 @@
- extern UTItype_ppc __fixunskfti (TFtype);
- extern TFtype __floattikf (TItype_ppc);
- extern TFtype __floatuntikf (UTItype_ppc);
-+
-+extern DItype_ppc __fixtfdi (TFtype);
-+extern DItype_ppc __fixunstfdi (TFtype);
-+extern TFtype __floatditf (DItype_ppc);
-+extern TFtype __floatunditf (UDItype_ppc);
- #endif
- 
- /* Functions using the ISA 3.0 hardware support.  If the code is compiled with
-diff --git a/libgcc/config/rs6000/t-float128 b/libgcc/config/rs6000/t-float128
---- a/libgcc/config/rs6000/t-float128	2018-12-12 17:53:49.540038500 -0500
-+++ b/libgcc/config/rs6000/t-float128	2018-12-12 17:45:12.233937136 -0500
-@@ -24,6 +24,7 @@
- 
- # New functions for software emulation
- fp128_ppc_funcs		= floattikf floatuntikf fixkfti fixunskfti \
-+			  floatditf floatunditf fixtfdi fixunstfdi \
- 			  extendkftf2-sw trunctfkf2-sw \
- 			  sfp-exceptions _mulkc3 _divkc3 _powikf2
- 
-
-diff --git a/libgcc/configure b/libgcc/configure
-old mode 100644
-new mode 100755
-index b2f3f870844..ed806587c17
---- a/libgcc/configure
-+++ b/libgcc/configure
-@@ -619,6 +619,7 @@ build_vendor
- build_cpu
- build
- with_aix_soname
-+with_ldbl128
- enable_vtable_verify
- enable_shared
- libgcc_topdir
-@@ -668,6 +669,7 @@ with_cross_host
- with_ld
- enable_shared
- enable_vtable_verify
-+with_long_double_128
- with_aix_soname
- enable_version_specific_runtime_libs
- with_slibdir
-@@ -1329,6 +1331,7 @@ Optional Packages:
-   --with-target-subdir=SUBDIR      Configuring in a subdirectory for target
-   --with-cross-host=HOST           Configuring with a cross compiler
-   --with-ld               arrange to use the specified ld (full pathname)
-+  --with-long-double-128  use 128-bit long double by default
-   --with-aix-soname=aix|svr4|both
-                           shared library versioning (aka "SONAME") variant to
-                           provide on AIX
-@@ -2213,6 +2216,21 @@ fi
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
-index b59aa746afc..42220a263c5 100644
---- a/libgcc/configure.ac
-+++ b/libgcc/configure.ac
-@@ -78,6 +78,18 @@ AC_ARG_ENABLE(vtable-verify,
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
-2.17.0
-
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
deleted file mode 100644
index cbd5e41ab1..0000000000
--- a/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 892142379c6b99fe8c3ebdfe0b79e2a435228c1d Mon Sep 17 00:00:00 2001
-From: claziss <claziss@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 17 Sep 2018 08:52:10 +0000
-Subject: [PATCH] [ARC] Update LINK_EH_SPEC linker spec.
-
-With no trailing space in LINK_EH_SPEC linker spec gets generated as:
------------------------->8---------------------
-%{!r:--build-id} --eh-frame-hdr%{h*} ...
------------------------->8---------------------
-
-or even worse if hash style is added:
------------------------->8---------------------
-%{!r:--build-id} --eh-frame-hdr--hash-style=sysv %{h*} ...
------------------------->8---------------------
-
-Now if that spec is really used by LD then it fails inevitably
-saying that it doesn't know option "--eh-frame-hdr--hash-style=sysv".
-
-2018-09-17  Alexey Brodkin  <abrodkin@synopsys.com>
-
-	* config/arc/linux.h (LINK_EH_SPEC): Add missing space.
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@264361 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-
-Upstream-Status: Backport[https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=892142379c6b]
----
- gcc/config/arc/linux.h | 2 +-
- 1 files changed, 1 insertions(+), 1 deletion(-)
-
-diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
-index 96d548eae341..62ebe4de0fc7 100644
---- a/gcc/config/arc/linux.h
-+++ b/gcc/config/arc/linux.h
-@@ -98,7 +98,7 @@ along with GCC; see the file COPYING3.  If not see
-    Signalize that because we have fde-glibc, we don't need all C shared libs
-    linked against -lgcc_s.  */
- #undef LINK_EH_SPEC
--#define LINK_EH_SPEC "--eh-frame-hdr"
-+#define LINK_EH_SPEC "--eh-frame-hdr "
- #endif
- 
- #undef SUBTARGET_CPP_SPEC
diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
new file mode 100644
index 0000000000..f7bf257fa6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -0,0 +1,111 @@
+require gcc-common.inc
+
+# Third digit in PV should be incremented after a minor release
+
+PV = "8.3.0"
+
+# BINV should be incremented to a revision after a minor gcc release
+
+BINV = "8.3.0"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-8.3:"
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
+           file://0002-gcc-poison-system-directories.patch \
+           file://0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch \
+           file://0004-64-bit-multilib-hack.patch \
+           file://0005-optional-libstdc.patch \
+           file://0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch \
+           file://0007-COLLECT_GCC_OPTIONS.patch \
+           file://0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
+           file://0009-fortran-cross-compile-hack.patch \
+           file://0010-cpp-honor-sysroot.patch \
+           file://0011-MIPS64-Default-to-N64-ABI.patch \
+           file://0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
+           file://0013-gcc-Fix-argument-list-too-long-error.patch \
+           file://0014-Disable-sdt.patch \
+           file://0015-libtool.patch \
+           file://0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
+           file://0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
+           file://0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch \
+           file://0019-export-CPP.patch \
+           file://0020-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch \
+           file://0021-Ensure-target-gcc-headers-can-be-included.patch \
+           file://0022-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch \
+           file://0023-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
+           file://0024-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
+           file://0025-aarch64-Add-support-for-musl-ldso.patch \
+           file://0026-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
+           file://0027-handle-sysroot-support-for-nativesdk-gcc.patch \
+           file://0028-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
+           file://0029-Fix-various-_FOR_BUILD-and-related-variables.patch \
+           file://0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
+           file://0031-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
+           file://0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
+           file://0033-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
+           file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
+           file://0035-sync-gcc-stddef.h-with-musl.patch \
+           file://0036-fix-segmentation-fault-in-precompiled-header-generat.patch \
+           file://0037-Fix-for-testsuite-failure.patch \
+           file://0038-Re-introduce-spe-commandline-options.patch \
+           file://0039-riscv-Disable-multilib-for-OE.patch \
+           file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
+"
+SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
+SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
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
+SSP ?= "--disable-libssp"
+SSP_mingw32 = "--enable-libssp"
+
+EXTRA_OECONF_BASE = "\
+    ${LTO} \
+    ${SSP} \
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
+EXTRA_OECONF_PATHS = "\
+    --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
+    --with-sysroot=/not/exist \
+    --with-build-sysroot=${STAGING_DIR_TARGET} \
+"
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 79%
rename from meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 423fe28e11..4ad79e44b8 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From b752fb2b6d6f6da68da5386b96abf0d74cd4bbe6 Mon Sep 17 00:00:00 2001
+From d7b284a9bede9d5059ad7e95a867254bf913c638 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
-Subject: [PATCH 01/39] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
+Subject: [PATCH 01/40] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 69c99e99cca..517fb70192e 100755
+index 0601395512f..8c5b1e9d561 100755
 --- a/configure
 +++ b/configure
-@@ -7511,7 +7511,7 @@ fi
+@@ -7507,7 +7507,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index 69c99e99cca..517fb70192e 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index a1edc369a27..f8c254f1fac 100644
+index c3433336523..69c31c65ad7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3100,7 +3100,7 @@ fi
+@@ -3096,7 +3096,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -38,5 +38,5 @@ index a1edc369a27..f8c254f1fac 100644
   *" newlib "*)
    case " $target_configargs " in
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-8.3/0002-gcc-poison-system-directories.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0002-gcc-poison-system-directories.patch
index 05138976c3..e7ff124666 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0003-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0002-gcc-poison-system-directories.patch
@@ -1,11 +1,20 @@
-From 48c670d2678e0323d88eb72205e039f393cabe05 Mon Sep 17 00:00:00 2001
+From 95ec476dd7726cc9c1bfd6fb23ba3aea8bbf61a4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:59:00 +0400
-Subject: [PATCH 03/39] gcc: poison-system-directories
+Subject: [PATCH 02/40] gcc: poison-system-directories
 
+Add /sw/include and /opt/include based on the original
+zecke-no-host-includes.patch patch.  The original patch checked for
+/usr/include, /sw/include and /opt/include and then triggered a failure and
+aborted.
+
+Instead, we add the two missing items to the current scan.  If the user
+wants this to be a failure, they can add "-Werror=poison-system-directories".
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Inappropriate [distribution: codesourcery]
+Upstream-Status: Pending
 ---
  gcc/common.opt      |  4 ++++
  gcc/config.in       |  6 ++++++
@@ -13,11 +22,11 @@ Upstream-Status: Inappropriate [distribution: codesourcery]
  gcc/configure.ac    | 10 ++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
  gcc/gcc.c           |  2 ++
- gcc/incpath.c       | 19 +++++++++++++++++++
- 7 files changed, 66 insertions(+)
+ gcc/incpath.c       | 21 +++++++++++++++++++++
+ 7 files changed, 68 insertions(+)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index d6ef85928f3..7b29efe3882 100644
+index b52ef0b38c8..0de3f0924cd 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
 @@ -679,6 +679,10 @@ Wreturn-local-addr
@@ -49,7 +58,7 @@ index 5bccb408016..1c784a8276b 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 5c345ce0fd7..cafd05fd150 100755
+index 6121e163259..3901722400c 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -953,6 +953,7 @@ with_system_zlib
@@ -69,7 +78,7 @@ index 5c345ce0fd7..cafd05fd150 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -29715,6 +29718,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -29701,6 +29704,19 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -90,10 +99,10 @@ index 5c345ce0fd7..cafd05fd150 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 65dbf1f2f80..dd5b38195ce 100644
+index b066cc609e1..1b1362f70fe 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -6341,6 +6341,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -6327,6 +6327,16 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -111,10 +120,10 @@ index 65dbf1f2f80..dd5b38195ce 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 255149fcfb8..cb71b60fe3c 100644
+index e5c4e8125aa..fb228631a42 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -303,6 +303,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -304,6 +304,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wpacked-bitfield-compat -Wpacked-not-aligned -Wpadded @gol
  -Wparentheses  -Wno-pedantic-ms-format @gol
  -Wplacement-new  -Wplacement-new=@var{n} @gol
@@ -122,7 +131,7 @@ index 255149fcfb8..cb71b60fe3c 100644
  -Wpointer-arith  -Wpointer-compare  -Wno-pointer-to-int-cast @gol
  -Wno-pragmas  -Wredundant-decls  -Wrestrict  -Wno-return-local-addr @gol
  -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar @gol
-@@ -5712,6 +5713,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -5743,6 +5744,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
@@ -151,7 +160,7 @@ index a716f708259..02b3cd39fc2 100644
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o " CHKP_SPEC " \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
 diff --git a/gcc/incpath.c b/gcc/incpath.c
-index b11c6a57939..e3b7a21966f 100644
+index b11c6a57939..9a457e02dd3 100644
 --- a/gcc/incpath.c
 +++ b/gcc/incpath.c
 @@ -26,6 +26,7 @@
@@ -190,5 +199,5 @@ index b11c6a57939..e3b7a21966f 100644
  
  /* Use given -I paths for #include "..." but not #include <...>, and
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-8.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 8b1b9769a4..e62deb2e47 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0005-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,7 +1,7 @@
-From ae3fe6e5e50937de6e4223ca90810187372a8cf5 Mon Sep 17 00:00:00 2001
+From 6640d7e39b13d1ef26d249153ab15d510fda3566 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:08:31 +0400
-Subject: [PATCH 05/39] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
+Subject: [PATCH 03/40] gcc-4.3.3: SYSROOT_CFLAGS_FOR_TARGET
 
 Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
 
@@ -26,10 +26,10 @@ Upstream-Status: Pending
  1 file changed, 32 insertions(+)
 
 diff --git a/configure b/configure
-index 517fb70192e..acd2b97df40 100755
+index 8c5b1e9d561..2d1fc6b94d9 100755
 --- a/configure
 +++ b/configure
-@@ -6772,6 +6772,38 @@ fi
+@@ -6768,6 +6768,38 @@ fi
  
  
  
@@ -69,5 +69,5 @@ index 517fb70192e..acd2b97df40 100755
  # the named directory are copied to $(tooldir)/sys-include.
  if test x"${with_headers}" != x && test x"${with_headers}" != xno ; then
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-8.3/0004-64-bit-multilib-hack.patch
similarity index 97%
rename from meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0004-64-bit-multilib-hack.patch
index 0dce95c890..371d877594 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0006-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0004-64-bit-multilib-hack.patch
@@ -1,7 +1,7 @@
-From 89af3b7399313b337f06c19cc2d787aa16d27711 Mon Sep 17 00:00:00 2001
+From 1e649d81ca662c4cdf73882ebb8a11f0f19f5baf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
-Subject: [PATCH 06/39] 64-bit multilib hack.
+Subject: [PATCH 04/40] 64-bit multilib hack.
 
 GCC has internal multilib handling code but it assumes a very specific rigid directory
 layout. The build system implementation of multilib layout is very generic and allows
@@ -81,5 +81,5 @@ index 0faa2a02df4..13fd8ca971e 100644
  rs6000-linux.o: $(srcdir)/config/rs6000/rs6000-linux.c
  	$(COMPILE) $<
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-8.3/0005-optional-libstdc.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0005-optional-libstdc.patch
index 721ea03fad..f9cf6c2087 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0007-optional-libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0005-optional-libstdc.patch
@@ -1,7 +1,7 @@
-From fb7df63e9548c29b70601d642a1850fc455f8565 Mon Sep 17 00:00:00 2001
+From b486380dcc4758e856ab6d847eb358d05bd79d64 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:12:56 +0400
-Subject: [PATCH 07/39] optional libstdc
+Subject: [PATCH 05/40] optional libstdc
 
 gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++
 will not run correctly since by default the linker will try to link against libstdc++
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [embedded specific]
  4 files changed, 37 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 5013501b232..6312f2c8f90 100644
+index f591b39be5a..2955fcea867 100644
 --- a/gcc/c-family/c.opt
 +++ b/gcc/c-family/c.opt
-@@ -1900,6 +1900,10 @@ nostdinc++
+@@ -1901,6 +1901,10 @@ nostdinc++
  C++ ObjC++
  Do not search standard system include directories for C++.
  
@@ -52,10 +52,10 @@ index 443a1746da3..e9b51be62ef 100644
  	  library = -1;
  	  break;
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index cb71b60fe3c..b0d481e3a30 100644
+index fb228631a42..310ba8109ed 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -211,6 +211,9 @@ in the following sections.
+@@ -212,6 +212,9 @@ in the following sections.
  -fno-weak  -nostdinc++ @gol
  -fvisibility-inlines-hidden @gol
  -fvisibility-ms-compat @gol
@@ -65,7 +65,7 @@ index cb71b60fe3c..b0d481e3a30 100644
  -fext-numeric-literals @gol
  -Wabi=@var{n}  -Wabi-tag  -Wconversion-null  -Wctor-dtor-privacy @gol
  -Wdelete-non-virtual-dtor  -Wliteral-suffix  -Wmultiple-inheritance @gol
-@@ -509,7 +512,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -510,7 +513,7 @@ Objective-C and Objective-C++ Dialects}.
  -s  -static -static-pie -static-libgcc  -static-libstdc++ @gol
  -static-libasan  -static-libtsan  -static-liblsan  -static-libubsan @gol
  -static-libmpx  -static-libmpxwrappers @gol
@@ -74,7 +74,7 @@ index cb71b60fe3c..b0d481e3a30 100644
  -T @var{script}  -Wl,@var{option}  -Xlinker @var{option} @gol
  -u @var{symbol}  -z @var{keyword}}
  
-@@ -12331,6 +12334,33 @@ library subroutines.
+@@ -12359,6 +12362,33 @@ library subroutines.
  constructors are called; @pxref{Collect2,,@code{collect2}, gccint,
  GNU Compiler Collection (GCC) Internals}.)
  
@@ -121,5 +121,5 @@ index 02b3cd39fc2..8cd27a5dad5 100644
  #endif
  
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
index a76b7f735b..0cea228c87 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0008-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
@@ -1,7 +1,7 @@
-From 11eb97efccb90b830c84ed077a25b1a15ad3335b Mon Sep 17 00:00:00 2001
+From 1dba090a11c40b0926f9707a543d658c95e1f156 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:14:20 +0400
-Subject: [PATCH 08/39] gcc: disable MASK_RELAX_PIC_CALLS bit
+Subject: [PATCH 06/40] gcc: disable MASK_RELAX_PIC_CALLS bit
 
 The new feature added after 4.3.3
 "http://www.pubbs.net/200909/gcc/94048-patch-add-support-for-rmipsjalr.html"
@@ -19,7 +19,7 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 14 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index cafd05fd150..19ba051d673 100755
+index 3901722400c..0c9b8ac5f55 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -27553,13 +27553,6 @@ $as_echo_n "checking assembler and linker for explicit JALR relocation... " >&6;
@@ -37,7 +37,7 @@ index cafd05fd150..19ba051d673 100755
  $as_echo "$gcc_cv_as_ld_jalr_reloc" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index dd5b38195ce..066dfe19bb6 100644
+index 1b1362f70fe..53840363115 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -4798,13 +4798,6 @@ x:
@@ -55,5 +55,5 @@ index dd5b38195ce..066dfe19bb6 100644
  
      AC_CACHE_CHECK([linker for .eh_frame personality relaxation],
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-8.3/0007-COLLECT_GCC_OPTIONS.patch
similarity index 89%
rename from meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0007-COLLECT_GCC_OPTIONS.patch
index 3abece0da7..8c7e72e1b7 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0009-COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0007-COLLECT_GCC_OPTIONS.patch
@@ -1,7 +1,7 @@
-From e19d25847f08eeb5ef26a031fa5eff732bfd0d43 Mon Sep 17 00:00:00 2001
+From 209e46f45382088caab54425b92b5dfc43ebb4fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:16:28 +0400
-Subject: [PATCH 09/39] COLLECT_GCC_OPTIONS
+Subject: [PATCH 07/40] COLLECT_GCC_OPTIONS
 
 This patch adds --sysroot into COLLECT_GCC_OPTIONS which is used to
 invoke collect2.
@@ -34,5 +34,5 @@ index 8cd27a5dad5..d355d65583a 100644
      {
        const char *const *args;
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-8.3/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 5785b58934..f9632afecc 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0010-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0008-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,7 +1,7 @@
-From 265cb883c310f3bb7e49fd13b81362476fbeb6c1 Mon Sep 17 00:00:00 2001
+From 3bcbdf5ade54a72820ad7798119d0bbad4baf6ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
-Subject: [PATCH 10/39] Use the defaults.h in ${B} instead of ${S}, and t-oe in
+Subject: [PATCH 08/40] Use the defaults.h in ${B} instead of ${S}, and t-oe in
  ${B}
 
 Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}, so that
@@ -40,7 +40,7 @@ index 20bee0494b1..1367136bfac 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 19ba051d673..a575839c1b2 100755
+index 0c9b8ac5f55..134c2c2f156 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -12158,8 +12158,8 @@ for f in $tm_file; do
@@ -55,7 +55,7 @@ index 19ba051d673..a575839c1b2 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 066dfe19bb6..676116a6d96 100644
+index 53840363115..0c3c82e4ff7 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1922,8 +1922,8 @@ for f in $tm_file; do
@@ -92,5 +92,5 @@ index 0f75c863c0b..68d8d6613cf 100644
  
  # Add multiple inclusion protection guard, part two.
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-8.3/0009-fortran-cross-compile-hack.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0009-fortran-cross-compile-hack.patch
index fe0fb7d531..50d895bfd7 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0011-fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0009-fortran-cross-compile-hack.patch
@@ -1,7 +1,7 @@
-From 71cba188d47b6ae9d9b87261eb4bc9eb68ae355d Mon Sep 17 00:00:00 2001
+From e654573352d28f160f379ee77e4067cf108714d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:20:01 +0400
-Subject: [PATCH 11/39] fortran cross-compile hack.
+Subject: [PATCH 09/40] fortran cross-compile hack.
 
 * Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
 used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
@@ -42,5 +42,5 @@ index bf6d3634dda..9dbe43cc616 100644
  
  # extra LD Flags which are required for targets
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-8.3/0010-cpp-honor-sysroot.patch
similarity index 94%
rename from meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0010-cpp-honor-sysroot.patch
index 961f96f11e..037eacf431 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0012-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0010-cpp-honor-sysroot.patch
@@ -1,7 +1,7 @@
-From b3e8e7e8ae106e3207e9edc3d23dcce1464b755f Mon Sep 17 00:00:00 2001
+From 2ae7af4eb70eff6aeda1fe96333ff50cfaa9d906 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
-Subject: [PATCH 12/39] cpp: honor sysroot.
+Subject: [PATCH 10/40] cpp: honor sysroot.
 
 Currently, if the gcc toolchain is relocated and installed from sstate, then you try and compile
 preprocessed source (.i or .ii files), the compiler will try and access the builtin sysroot location
@@ -50,5 +50,5 @@ index d355d65583a..570cdc00034 100644
    {"@assembler",
     "%{!M:%{!MM:%{!E:%{!S:as %(asm_debug) %(asm_options) %i %A }}}}", 0, 0, 0},
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-8.3/0011-MIPS64-Default-to-N64-ABI.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0011-MIPS64-Default-to-N64-ABI.patch
index 8ef8806b21..c863cff932 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0013-MIPS64-Default-to-N64-ABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0011-MIPS64-Default-to-N64-ABI.patch
@@ -1,7 +1,7 @@
-From 0f3629978cd7c98614e87d4fd190b89864221631 Mon Sep 17 00:00:00 2001
+From 1e1ea0eb55a594ac4cd7b838f74dec7405aae02b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:23:08 +0400
-Subject: [PATCH 13/39] MIPS64: Default to N64 ABI
+Subject: [PATCH 11/40] MIPS64: Default to N64 ABI
 
 MIPS64 defaults to n32 ABI, this patch makes it
 so that it defaults to N64 ABI
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE config specific]
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 8741dd1e3b2..2ffcb39d85f 100644
+index 7af8e028104..fc7c91246ed 100644
 --- a/gcc/config.gcc
 +++ b/gcc/config.gcc
-@@ -2137,29 +2137,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
+@@ -2143,29 +2143,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
  			default_mips_arch=mips32
  			;;
  		mips64el-st-linux-gnu)
@@ -53,5 +53,5 @@ index 8741dd1e3b2..2ffcb39d85f 100644
  			;;
  	esac
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 043bb9dd22..91a55c556f 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,7 +1,7 @@
-From 53f1c382b1366c5621c8edead9c766950c290fd9 Mon Sep 17 00:00:00 2001
+From 4a697387eeab14ece2796c01382cca30e8467ffa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
-Subject: [PATCH 14/39] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
+Subject: [PATCH 12/40] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
  relative to SYSTEMLIBS_DIR
 
 This patch defines GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -23,12 +23,11 @@ Upstream-Status: Inappropriate [OE configuration]
  gcc/config/i386/linux64.h    |  6 +++---
  gcc/config/linux.h           |  8 ++++----
  gcc/config/mips/linux.h      | 12 ++++++------
- gcc/config/riscv/linux.h     |  2 +-
  gcc/config/rs6000/linux64.h  | 16 ++++++----------
  gcc/config/sh/linux.h        |  2 +-
  gcc/config/sparc/linux.h     |  2 +-
  gcc/config/sparc/linux64.h   |  4 ++--
- 12 files changed, 30 insertions(+), 34 deletions(-)
+ 11 files changed, 29 insertions(+), 33 deletions(-)
 
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
 index 36b74dc1993..02373578af8 100644
@@ -153,24 +152,11 @@ index 2dfd0c18b90..12057c51b5e 100644
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
-diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index aa8a28d5d..ebf9551c9 100644
---- a/gcc/config/riscv/linux.h
-+++ b/gcc/config/riscv/linux.h
-@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
-     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
-   } while (0)
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
- 
- #define MUSL_ABI_SUFFIX \
-   "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 90fe6566255..55695dadd91 100644
+index 44eab40a234..54aa8d957e7 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -420,16 +420,11 @@ extern int dot_symbols;
+@@ -413,16 +413,11 @@ extern int dot_symbols;
  #undef	LINK_OS_DEFAULT_SPEC
  #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
  
@@ -190,7 +176,7 @@ index 90fe6566255..55695dadd91 100644
  #endif
  
  #define MUSL_DYNAMIC_LINKER32 \
-@@ -437,8 +432,9 @@ extern int dot_symbols;
+@@ -430,8 +425,9 @@ extern int dot_symbols;
  #define MUSL_DYNAMIC_LINKER64 \
    "/lib/ld-musl-powerpc64" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
  
@@ -244,5 +230,5 @@ index c1fe42165b7..26a79bfa2e3 100644
  #ifdef SPARC_BI_ARCH
  
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-8.3/0013-gcc-Fix-argument-list-too-long-error.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0013-gcc-Fix-argument-list-too-long-error.patch
index 4bff84285b..e9d2cac22e 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0015-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0013-gcc-Fix-argument-list-too-long-error.patch
@@ -1,7 +1,7 @@
-From 2e75a14cd60227e036790184f0eb400abc3c870b Mon Sep 17 00:00:00 2001
+From 9e815965fbaa90134be0e777cfc2fbcfab16b674 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:26:37 +0400
-Subject: [PATCH 15/39] gcc: Fix argument list too long error.
+Subject: [PATCH 13/40] gcc: Fix argument list too long error.
 
 There would be an "Argument list too long" error when the
 build directory is longer than 200, this is caused by:
@@ -36,5 +36,5 @@ index 1367136bfac..71a8275c39f 100644
  	for file in $$headers; do \
  	  if [ -f $$file ] ; then \
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-8.3/0014-Disable-sdt.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0014-Disable-sdt.patch
index 8197546200..2bc44515cb 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0016-Disable-sdt.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0014-Disable-sdt.patch
@@ -1,7 +1,7 @@
-From 423d87ac47d21e399d759d7ff3b638f0c721a7df Mon Sep 17 00:00:00 2001
+From 00c7a7fdd4b4aad9e57d8b541de17ad209b6cd06 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:28:10 +0400
-Subject: [PATCH 16/39] Disable sdt.
+Subject: [PATCH 14/40] Disable sdt.
 
 We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
 It may or may not exist from preivous builds though. To be determinstic, disable
@@ -25,10 +25,10 @@ Upstream-Status: Inappropriate [hack]
  4 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index a575839c1b2..872338f29b6 100755
+index 134c2c2f156..5111ec0aabb 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -29296,12 +29296,12 @@ fi
+@@ -29282,12 +29282,12 @@ fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
  $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
  have_sys_sdt_h=no
@@ -48,10 +48,10 @@ index a575839c1b2..872338f29b6 100755
  $as_echo "$have_sys_sdt_h" >&6; }
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 676116a6d96..55046e68926 100644
+index 0c3c82e4ff7..3e09af916fd 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -5957,15 +5957,15 @@ fi
+@@ -5943,15 +5943,15 @@ fi
  AC_SUBST([enable_default_ssp])
  
  # Test for <sys/sdt.h> on the target.
@@ -77,7 +77,7 @@ index 676116a6d96..55046e68926 100644
  # Check if TFmode long double should be used by default or not.
  # Some glibc targets used DFmode long double, but with glibc 2.4
 diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index c9dbaa139d5..c64a77d152b 100755
+index 5535bfa2b5a..13d793f5059 100755
 --- a/libstdc++-v3/configure
 +++ b/libstdc++-v3/configure
 @@ -21786,11 +21786,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
@@ -109,5 +109,5 @@ index 0ef96270c9c..afe55a1b215 100644
  # Check for available headers.
  AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch b/meta/recipes-devtools/gcc/gcc-8.3/0015-libtool.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0015-libtool.patch
index 0caa1ce160..750f8a244e 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0017-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0015-libtool.patch
@@ -1,7 +1,7 @@
-From c8b11e96b11910b2d4df6ae8104466e3303d933f Mon Sep 17 00:00:00 2001
+From 80f2b01b3f917cea08294328c8bbc51dadece4af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
-Subject: [PATCH 17/39] libtool
+Subject: [PATCH 15/40] libtool
 
 libstdc++ from gcc-runtime gets created with -rpath=/usr/lib/../lib for qemux86-64
 when running on am x86_64 build host.
@@ -38,5 +38,5 @@ index 9503ec85d70..0121fba707f 100644
        oldlibs=
        if test -z "$rpath"; then
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-8.3/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 643cc671ba..9b1b4d4df5 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0018-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0016-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,7 +1,7 @@
-From 7dbba844a59bdf6e7d724f8bfa7927246cb7af8f Mon Sep 17 00:00:00 2001
+From a66ec1e382bf869749588f072a4a7c09039f2b3a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
-Subject: [PATCH 18/39] gcc: armv4: pass fix-v4bx to linker to support EABI.
+Subject: [PATCH 16/40] gcc: armv4: pass fix-v4bx to linker to support EABI.
 
 The LINK_SPEC for linux gets overwritten by linux-eabi.h which
 means the value of TARGET_FIX_V4BX_SPEC gets lost and as a result
@@ -39,5 +39,5 @@ index b3af68cac57..330b6e13c5f 100644
  		       LINUX_TARGET_LINK_SPEC " " ANDROID_LINK_SPEC)
  
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-8.3/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 084918652e..382fecdbc5 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0019-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0017-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,7 +1,7 @@
-From 117140acd3c383f620ff75894276001c7405dcce Mon Sep 17 00:00:00 2001
+From 624db734f656ad8cdf8b3cf3fc8e860b70c6c251 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
-Subject: [PATCH 19/39] Use the multilib config files from ${B} instead of
+Subject: [PATCH 17/40] Use the multilib config files from ${B} instead of
  using the ones from ${S}
 
 Use the multilib config files from ${B} instead of using the ones from ${S}
@@ -18,7 +18,7 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 872338f29b6..cfcadc93a01 100755
+index 5111ec0aabb..3d9dcbdc93d 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -12138,10 +12138,20 @@ done
@@ -58,7 +58,7 @@ index 872338f29b6..cfcadc93a01 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 55046e68926..44b90478f55 100644
+index 3e09af916fd..e09c840b605 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1902,10 +1902,20 @@ done
@@ -98,5 +98,5 @@ index 55046e68926..44b90478f55 100644
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-8.3/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 911fe8521c..20e77d6eaa 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0020-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0018-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,7 +1,7 @@
-From a7266111a5ba2d146c979e86ff84f6b807ca5fdc Mon Sep 17 00:00:00 2001
+From 27cca95dcfeead8c52d292c4824ee96f178d6183 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
-Subject: [PATCH 20/39] Avoid using libdir from .la which usually points to a
+Subject: [PATCH 18/40] Avoid using libdir from .la which usually points to a
  host path
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -27,5 +27,5 @@ index 0121fba707f..52bdbdb5f9c 100644
  	    absdir="$libdir"
  	  fi
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-8.3/0019-export-CPP.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0019-export-CPP.patch
index 2e6b411062..140c67a486 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0021-export-CPP.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0019-export-CPP.patch
@@ -1,7 +1,7 @@
-From c8599fc3b5781b319707c9c0f1b0a1ef7cddb027 Mon Sep 17 00:00:00 2001
+From a2936382da81aefa9b69c1fc625f6c706b7ea1d8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:40:59 +0000
-Subject: [PATCH 21/39] export CPP
+Subject: [PATCH 19/40] export CPP
 
 The OE environment sets and exports CPP as being the target gcc. When
 building gcc-cross-canadian for a mingw targetted sdk, the following can be found
@@ -37,7 +37,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 2bf83b72265..1af45580086 100644
+index 38774f542a6..b426d4f9350 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -149,6 +149,7 @@ BUILD_EXPORTS = \
@@ -49,5 +49,5 @@ index 2bf83b72265..1af45580086 100644
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
  	CXX="$(CXX_FOR_BUILD)"; export CXX; \
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-8.3/0020-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0020-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
index 17c581f11e..b22557eaf7 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0022-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0020-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
@@ -1,7 +1,7 @@
-From 5e2ee46c720b6ce03a18da70dd4e0917c258ab0b Mon Sep 17 00:00:00 2001
+From d4326ab74a362b0fc83ed866f82c359389a36adc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:21:55 +0000
-Subject: [PATCH 22/39] Disable the MULTILIB_OSDIRNAMES and other multilib
+Subject: [PATCH 20/40] Disable the MULTILIB_OSDIRNAMES and other multilib
  options.
 
 Hard coding the MULTILIB_OSDIRNAMES with ../lib64 is causing problems on
@@ -38,5 +38,5 @@ index b9897785a89..7d06f0d0edb 100644
 -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch
similarity index 66%
rename from meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch
index 73db3e6916..60d72699d6 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0023-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0021-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,7 +1,7 @@
-From 73766424a2f71b1810fb8afdd863028855d87e5a Mon Sep 17 00:00:00 2001
+From 476eda9054df443d094273c8b61fce63d940adfc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
-Subject: [PATCH 23/39] Ensure target gcc headers can be included
+Subject: [PATCH 21/40] Ensure target gcc headers can be included
 
 There are a few headers installed as part of the OpenEmbedded
 gcc-runtime target (omp.h, ssp/*.h). Being installed from a recipe
@@ -57,6 +57,42 @@ index b36a979d5ba..e2e187dedaf 100644
  #ifdef LOCAL_INCLUDE_DIR
      /* /usr/local/include comes before the fixincluded header files.  */
      { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },
+diff --git a/gcc/defaults.h b/gcc/defaults.h
+index 9035b333be8..5982bbda61d 100644
+--- a/gcc/defaults.h
++++ b/gcc/defaults.h
+@@ -1455,4 +1455,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
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
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-8.3/0022-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0022-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
index 67b47f4ec0..6f0d3f11d3 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0024-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0022-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
@@ -1,7 +1,7 @@
-From 57beef69396f6c187014b8e61cdc966218479d07 Mon Sep 17 00:00:00 2001
+From bc192f0a07ad819dee93446c5ef6895d9550d92d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 11:17:19 +0000
-Subject: [PATCH 24/39] gcc 4.8+ won't build with --disable-dependency-tracking
+Subject: [PATCH 22/40] gcc 4.8+ won't build with --disable-dependency-tracking
 
 since the *.Ppo files don't get created unless --enable-dependency-tracking is true.
 
@@ -50,5 +50,5 @@ index c8f38be5835..4fab7cec3ea 100644
  M_IFUNC = $(if $(PAT_S),$(IFUNC_DEF) $(IFUNC_OPT))
  M_FILE = $(PAT_BASE)_n.c
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-8.3/0023-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0023-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index d8b35bbbee..fe3f3436f0 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0025-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0023-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,7 +1,7 @@
-From fd96c9b35c592f1bdd32bc5ae669157473e44063 Mon Sep 17 00:00:00 2001
+From 0409d2dd7322ecbed731cbe29b034fea43c5dddc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
-Subject: [PATCH 25/39] Don't search host directory during "relink" if
+Subject: [PATCH 23/40] Don't search host directory during "relink" if
  $inst_prefix is provided
 
 http://lists.gnu.org/archive/html/libtool-patches/2011-01/msg00026.html
@@ -34,5 +34,5 @@ index 52bdbdb5f9c..82bcec39f05 100644
  		esac
  	      fi
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-8.3/0024-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0024-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
index d3ab5aa9ce..c388a0ad02 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0026-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0024-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
@@ -1,13 +1,12 @@
-From c2e400afe8c514357859fca88af4d3e1fcbfe2ff Mon Sep 17 00:00:00 2001
+From 56e2e1fc2a27c4a5cc9b471d5d0af90bcb871bfa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:15:27 -0700
-Subject: [PATCH 26/39] Use SYSTEMLIBS_DIR replacement instead of hardcoding
- base_libdir
+Subject: [PATCH 24/40] Use SYSTEMLIBS_DIR replacement instead of hardcoding base_libdir
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  gcc/config/aarch64/aarch64-linux.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
@@ -25,5 +24,5 @@ index bf1327e98cc..64436183bc8 100644
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-8.3/0025-aarch64-Add-support-for-musl-ldso.patch
similarity index 87%
rename from meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0025-aarch64-Add-support-for-musl-ldso.patch
index 9e5ce8a60b..03f9725b89 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0027-aarch64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0025-aarch64-Add-support-for-musl-ldso.patch
@@ -1,12 +1,12 @@
-From a2cc175769fd8255750eaecae64e3d1f9c38d48f Mon Sep 17 00:00:00 2001
+From b142e77e44e1acece6da54ccdc24c4da89cf4b99 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 28 Apr 2015 23:18:39 -0700
-Subject: [PATCH 27/39] aarch64: Add support for musl ldso
+Subject: [PATCH 25/40] aarch64: Add support for musl ldso
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  gcc/config/aarch64/aarch64-linux.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
@@ -24,5 +24,5 @@ index 64436183bc8..ba156676026 100644
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc-8.3/0026-libcc1-fix-libcc1-s-install-path-and-rpath.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0026-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 2673f4e36b..8591738962 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0028-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0026-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,7 +1,7 @@
-From a8a8a02788ff98f253ce0b33adcb0e661d24b1e3 Mon Sep 17 00:00:00 2001
+From 3d4e53fc7cd71ce1181af8a5e9655398857af741 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
-Subject: [PATCH 28/39] libcc1: fix libcc1's install path and rpath
+Subject: [PATCH 26/40] libcc1: fix libcc1's install path and rpath
 
 * Install libcc1.so and libcc1plugin.so into
   $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version), as what we
@@ -50,5 +50,5 @@ index 47be10025ad..8d5481d87bd 100644
  @ENABLE_PLUGIN_TRUE@cc1lib_LTLIBRARIES = libcc1.la
  shared_source = callbacks.cc callbacks.hh connection.cc connection.hh \
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc-8.3/0027-handle-sysroot-support-for-nativesdk-gcc.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0027-handle-sysroot-support-for-nativesdk-gcc.patch
index 727bb0da3b..4b955de8a5 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0029-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0027-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,7 +1,7 @@
-From 3bb74495e45e0e798daae5556497e688b8fc4eef Mon Sep 17 00:00:00 2001
+From c033c1df11b692213d03db91d6cc145b4adedfac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
-Subject: [PATCH 29/39] handle sysroot support for nativesdk-gcc
+Subject: [PATCH 27/40] handle sysroot support for nativesdk-gcc
 
 Being able to build a nativesdk gcc is useful, particularly in cases
 where the host compiler may be of an incompatible version (or a 32
@@ -209,5 +209,5 @@ index 3fb64d453f1..cd0c7fbe961 100644
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc-8.3/0028-Search-target-sysroot-gcc-version-specific-dirs-with.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0028-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index 33566dffa8..1b25d7808b 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0030-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0028-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,7 +1,7 @@
-From f5cc8cd0c44092dc487106ade27e011c1f584ada Mon Sep 17 00:00:00 2001
+From 62240d4c725ea0b43abfb901ddad90e83e29a25c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
-Subject: [PATCH 30/39] Search target sysroot gcc version specific dirs with
+Subject: [PATCH 28/40] Search target sysroot gcc version specific dirs with
  multilib.
 
 We install the gcc libraries (such as crtbegin.p) into
@@ -98,5 +98,5 @@ index cd0c7fbe961..f6f3aa077c8 100644
  	      ret = callback (path, callback_info);
  	      if (ret)
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch b/meta/recipes-devtools/gcc/gcc-8.3/0029-Fix-various-_FOR_BUILD-and-related-variables.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0029-Fix-various-_FOR_BUILD-and-related-variables.patch
index dabc005964..0c8bdb17de 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0031-Fix-various-_FOR_BUILD-and-related-variables.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0029-Fix-various-_FOR_BUILD-and-related-variables.patch
@@ -1,7 +1,7 @@
-From 93b4e1d3a0f8417118d1c48fcd1ce51996e1420b Mon Sep 17 00:00:00 2001
+From 1377c738e31a1e1599cfab189485a9459f803e79 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:42:45 +0000
-Subject: [PATCH 31/39] Fix various _FOR_BUILD and related variables
+Subject: [PATCH 29/40] Fix various _FOR_BUILD and related variables
 
 When doing a FOR_BUILD thing, you have to override CFLAGS with
 CFLAGS_FOR_BUILD. And if you use C++, you also have to override
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  5 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 1af45580086..8966453c32c 100644
+index b426d4f9350..a2af9905cce 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -152,6 +152,7 @@ BUILD_EXPORTS = \
@@ -55,7 +55,7 @@ index 1af45580086..8966453c32c 100644
  	ADA_CFLAGS="$(ADA_CFLAGS)"; export ADA_CFLAGS; \
  	CFLAGS="$(CFLAGS)"; export CFLAGS; \
  	CONFIG_SHELL="$(SHELL)"; export CONFIG_SHELL; \
-@@ -753,6 +758,7 @@ BASE_FLAGS_TO_PASS = \
+@@ -743,6 +748,7 @@ BASE_FLAGS_TO_PASS = \
  	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
  	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
  	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
@@ -64,7 +64,7 @@ index 1af45580086..8966453c32c 100644
  	"FLEX=$(FLEX)" \
  	"INSTALL=$(INSTALL)" \
 diff --git a/Makefile.tpl b/Makefile.tpl
-index abd2bc2fb89..5822b260404 100644
+index 1f23b79b4b2..6c5652e811d 100644
 --- a/Makefile.tpl
 +++ b/Makefile.tpl
 @@ -154,6 +154,7 @@ BUILD_EXPORTS = \
@@ -107,7 +107,7 @@ index 5ae693fb06c..02ee0aa72f4 100644
  # Actual name to use when installing a native compiler.
  GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
 diff --git a/gcc/configure b/gcc/configure
-index cfcadc93a01..2f6b4f72ef3 100755
+index 3d9dcbdc93d..aa127a4f6a4 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -11797,7 +11797,7 @@ else
@@ -120,7 +120,7 @@ index cfcadc93a01..2f6b4f72ef3 100755
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 44b90478f55..9f8a51fc9bd 100644
+index e09c840b605..18bf53c7e0a 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
 @@ -1708,7 +1708,7 @@ else
@@ -133,5 +133,5 @@ index 44b90478f55..9f8a51fc9bd 100644
  		--enable-languages=${enable_languages-all} \
  		--target=$target_alias --host=$build_alias --build=$build_alias
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch b/meta/recipes-devtools/gcc/gcc-8.3/0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch
index 6dd9d54234..04e126c5c3 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0032-nios2-Define-MUSL_DYNAMIC_LINKER.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0030-nios2-Define-MUSL_DYNAMIC_LINKER.patch
@@ -1,13 +1,13 @@
-From 99f3e3b427996ac579d95e68440a0bd7af7ef0fc Mon Sep 17 00:00:00 2001
+From 75da3cc9ca2d3de8c2062f23bf4f72415741ef83 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 2 Feb 2016 10:26:10 -0800
-Subject: [PATCH 32/39] nios2: Define MUSL_DYNAMIC_LINKER
+Subject: [PATCH 30/40] nios2: Define MUSL_DYNAMIC_LINKER
+
+Upstream-Status: Pending
 
 Signed-off-by: Marek Vasut <marex@denx.de>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  gcc/config/nios2/linux.h | 1 +
  1 file changed, 1 insertion(+)
 
@@ -24,5 +24,5 @@ index 4729105626d..36181eb7b85 100644
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc-8.3/0031-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0031-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 05a6b0a1dc..002cf2becc 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0033-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0031-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,7 +1,7 @@
-From 84b55ab2f68710a583d4ec810ea8b3b68576f8aa Mon Sep 17 00:00:00 2001
+From f715aeef294b85fa593ef69e6d0114cc7b15312b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
-Subject: [PATCH 33/39] Add ssp_nonshared to link commandline for musl targets
+Subject: [PATCH 31/40] Add ssp_nonshared to link commandline for musl targets
 
 when -fstack-protector options are enabled we need to
 link with ssp_shared on musl since it does not provide
@@ -62,10 +62,10 @@ index 01b40c762f6..e7c5e92215c 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 55695dadd91..60f1ee24985 100644
+index 54aa8d957e7..619e113e2b8 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
-@@ -473,6 +473,16 @@ extern int dot_symbols;
+@@ -466,6 +466,16 @@ extern int dot_symbols;
  					   " -m elf64ppc")
  #endif
  
@@ -83,5 +83,5 @@ index 55695dadd91..60f1ee24985 100644
    %{!static-pie: \
      %{rdynamic:-export-dynamic} \
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-8.3/0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
new file mode 100644
index 0000000000..025caba318
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0032-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
@@ -0,0 +1,125 @@
+From 6dfbca78b8d253aecf9cbb5e68e04b8dd3d6a543 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 29 Apr 2016 20:03:28 +0000
+Subject: [PATCH 32/40] libgcc: Add knob to use ldbl-128 on ppc
+
+musl does not support ldbl 128 so we can not assume
+that linux as a whole supports ldbl-128 bits, instead
+act upon configure option passed to gcc and assume no
+on musl and yes otherwise if no option is passed since
+default behaviour is to assume ldbl128 it does not
+change the defaults
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
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
+2.21.0
+
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch b/meta/recipes-devtools/gcc/gcc-8.3/0033-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
similarity index 86%
rename from meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0033-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
index 5e416e010d..343f7aad1b 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0035-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0033-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
@@ -1,7 +1,7 @@
-From 775c7fafcbfebed2d4bd8a6a011f18f70f3b59d3 Mon Sep 17 00:00:00 2001
+From 7e55147e8e609ace6f9eecd86a956636687671f0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 May 2016 21:11:34 -0700
-Subject: [PATCH 35/39] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
+Subject: [PATCH 33/40] Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
 
 Upstream-Status: Pending
 
@@ -25,5 +25,5 @@ index 7e60b621a2d..ea22ede3361 100644
  	$(SHLIB_OBJS) $(SHLIB_LC) && \
  	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-8.3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 8def33a17d..92224cc561 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0036-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,8 +1,7 @@
-From b7faeed60261d7b75f2db3823926de1650ef64bc Mon Sep 17 00:00:00 2001
+From 46ca51dd413330bb8425b06283e7667bfb507c3d Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
-Subject: [PATCH 36/39] libgcc_s: Use alias for __cpu_indicator_init instead of
- symver
+Subject: [PATCH 34/40] libgcc_s: Use alias for __cpu_indicator_init instead of symver
 
 Adapter from
 
@@ -29,20 +28,20 @@ gcc/Changelog:
 	* config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_init
 	call __cpu_indicator_init_local instead of __cpu_indicator_init.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  gcc/config/i386/i386.c       | 4 ++--
  libgcc/config/i386/cpuinfo.c | 6 +++---
  libgcc/config/i386/t-linux   | 2 +-
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
-index 6a2141e48db..455fccbdd50 100644
+index a88a29b51e6..6f3f5187970 100644
 --- a/gcc/config/i386/i386.c
 +++ b/gcc/config/i386/i386.c
-@@ -36490,10 +36490,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -36555,10 +36555,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,10 +55,10 @@ index 6a2141e48db..455fccbdd50 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index 86953db2743..e0476272810 100644
+index d1853d5515b..864150c9249 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
-@@ -482,7 +482,7 @@ __cpu_indicator_init (void)
+@@ -485,7 +485,7 @@ __cpu_indicator_init (void)
    return 0;
  }
  
@@ -82,5 +81,5 @@ index 8506a635790..564296f788e 100644
 +HOST_LIBGCC2_CFLAGS += -mlong-double-80 $(CET_FLAGS)
  CRTSTUFF_T_CFLAGS += $(CET_FLAGS)
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch b/meta/recipes-devtools/gcc/gcc-8.3/0035-sync-gcc-stddef.h-with-musl.patch
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0035-sync-gcc-stddef.h-with-musl.patch
index f8a7f41ab1..6ecd6e972d 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0037-sync-gcc-stddef.h-with-musl.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0035-sync-gcc-stddef.h-with-musl.patch
@@ -1,15 +1,15 @@
-From 602abaab15ffb60bf1797187a71b485042c56360 Mon Sep 17 00:00:00 2001
+From 38d401fb6ab555d09f4a9a677721dde0743876e1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Feb 2017 12:56:00 -0800
-Subject: [PATCH 37/39] sync gcc stddef.h with musl
+Subject: [PATCH 35/40] sync gcc stddef.h with musl
 
 musl defines ptrdiff_t size_t and wchar_t
 so dont define them here if musl is definining them
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  gcc/ginclude/stddef.h | 9 +++++++++
  1 file changed, 9 insertions(+)
 
@@ -87,5 +87,5 @@ index 31b96a7e5e1..438a3ce7c56 100644
  #endif /* _STDDEF_H or __need_wchar_t.  */
  
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc-8.3/0036-fix-segmentation-fault-in-precompiled-header-generat.patch
similarity index 93%
rename from meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0036-fix-segmentation-fault-in-precompiled-header-generat.patch
index 224d2ae6d3..c4ce5db553 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0038-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0036-fix-segmentation-fault-in-precompiled-header-generat.patch
@@ -1,7 +1,7 @@
-From 00694849632dee23741925c6104df134f6bff747 Mon Sep 17 00:00:00 2001
+From a9bb29a4e9b478f9b126e483467ce9031c33fe4f Mon Sep 17 00:00:00 2001
 From: Juro Bystricky <juro.bystricky@intel.com>
 Date: Mon, 19 Mar 2018 22:31:20 -0700
-Subject: [PATCH 38/39] fix segmentation fault in precompiled header generation
+Subject: [PATCH 36/40] fix segmentation fault in precompiled header generation
 
 Prevent a segmentation fault which occurs when using incorrect
 structure trying to access name of some named operators, such as
@@ -56,5 +56,5 @@ index 37c365a3560..63480048db6 100644
  	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
        break;
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch b/meta/recipes-devtools/gcc/gcc-8.3/0037-Fix-for-testsuite-failure.patch
similarity index 98%
rename from meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0037-Fix-for-testsuite-failure.patch
index f35163099c..70999dd453 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0039-Fix-for-testsuite-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0037-Fix-for-testsuite-failure.patch
@@ -1,7 +1,7 @@
-From d151a62c252749643c850a08d1335321e5b75d42 Mon Sep 17 00:00:00 2001
+From 1e5c1ef34d92b4157e1a24ca743d45f3a7375a5e Mon Sep 17 00:00:00 2001
 From: RAGHUNATH LOLUR <raghunath.lolur@kpit.com>
 Date: Wed, 6 Dec 2017 22:52:26 -0800
-Subject: [PATCH 39/39] Fix for testsuite failure
+Subject: [PATCH 37/40] Fix for testsuite failure
 
 2017-11-16  Raghunath Lolur  <raghunath.lolur@kpit.com>
 
@@ -254,5 +254,5 @@ index 6cda1534311..26e37f5b8ba 100644
  __attribute__((vector_size((elcount)*sizeof(type)))) type
  
 -- 
-2.17.0
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-8.3/0038-Re-introduce-spe-commandline-options.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0038-Re-introduce-spe-commandline-options.patch
index 8afa0102da..8de8892b89 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0040-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0038-Re-introduce-spe-commandline-options.patch
@@ -1,7 +1,7 @@
-From 8fb8f773e117ee70be00bb0da5f343fe110da5c4 Mon Sep 17 00:00:00 2001
+From f0bea96434ac478c3cff8c29dd97cccfac5b35e3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
-Subject: [PATCH 40/40] Re-introduce spe commandline options
+Subject: [PATCH 38/40] Re-introduce spe commandline options
 
 This should ensure that we keep accepting
 spe options
@@ -37,5 +37,5 @@ index ace8a477550..d6a8f825d88 100644
  Target RejectNegative Var(rs6000_altivec_abi) Save
  Use the AltiVec ABI extensions.
 -- 
-2.17.1
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch b/meta/recipes-devtools/gcc/gcc-8.3/0039-riscv-Disable-multilib-for-OE.patch
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0039-riscv-Disable-multilib-for-OE.patch
index dc28d1bfd8..f7b222e812 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0043-riscv-Disable-multilib-for-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0039-riscv-Disable-multilib-for-OE.patch
@@ -1,7 +1,7 @@
-From ca0a6e035eef0cdbd0ef3a222c75d4b9f873c512 Mon Sep 17 00:00:00 2001
+From 24f74444c00c6c9bf076fb002614ebf6dec31f1a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 28 Dec 2018 09:59:53 -0800
-Subject: [PATCH 39/39] riscv: Disable multilib for OE
+Subject: [PATCH 39/40] riscv: Disable multilib for OE
 
 Upstream-Status: Inappropriate [OE-Specific]
 
@@ -23,5 +23,5 @@ index 216d2776a18..e4d817621fc 100644
 +#MULTILIB_OSDIRNAMES := $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
 +MULTILIB_OSDIRNAMES := ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 -- 
-2.20.1
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch b/meta/recipes-devtools/gcc/gcc-8.3/0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch
rename to meta/recipes-devtools/gcc/gcc-8.3/0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch
index b0c735bb05..9fba163778 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch
@@ -1,17 +1,17 @@
-From 3f5f5da776be86b408a15f38c9782f2185f97073 Mon Sep 17 00:00:00 2001
+From 4bd0a3866f302725cb4eddcaddaeece64900c42f Mon Sep 17 00:00:00 2001
 From: Serhey Popovych <serhe.popovych@gmail.com>
 Date: Tue, 11 Dec 2018 02:30:50 -0500
-Subject: [PATCH] powerpc/powerpc64: Add support for musl ldso
+Subject: [PATCH 40/40] powerpc/powerpc64: Add support for musl ldso
 
-Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
----
 Upstream-Status: Inappropriate [OE-Specific]
 
+Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
+---
  gcc/config/rs6000/linux64.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 619e113..ee8b44f 100644
+index 619e113e2b8..ee8b44f9374 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -421,9 +421,9 @@ extern int dot_symbols;
@@ -27,5 +27,5 @@ index 619e113..ee8b44f 100644
  #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
  #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
 -- 
-2.7.4
+2.21.0
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_8.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_8.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_8.2.bb b/meta/recipes-devtools/gcc/gcc-cross_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_8.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_8.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_8.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_8.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_8.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_8.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_8.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_8.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_8.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_8.2.bb b/meta/recipes-devtools/gcc/gcc-source_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_8.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_8.3.bb
diff --git a/meta/recipes-devtools/gcc/gcc_8.2.bb b/meta/recipes-devtools/gcc/gcc_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_8.2.bb
rename to meta/recipes-devtools/gcc/gcc_8.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_8.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_8.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_8.3.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_8.2.bb b/meta/recipes-devtools/gcc/libgcc_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_8.2.bb
rename to meta/recipes-devtools/gcc/libgcc_8.3.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_8.2.bb b/meta/recipes-devtools/gcc/libgfortran_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_8.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_8.3.bb
-- 
2.21.0


