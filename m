Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E753074BB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 05:04:39 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q22-v6so8384701pff.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 22:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L/ShA69goPH/RSmYJX6Wa4+JyS8HB9IsRy+Rs+M02bI=;
	b=c5L3DCwmlJEU7jL4cF/YTiraeQiExE69HqXO5aAnQ/csHZZ8XmGl/8VClOtl51powE
	94FyaxbU3Y8nRPw63mrbRQrYThnRVX9t7LpuFDJDDXffa7PCrKG6N4mRiWA1snJDuebU
	ehs8fJ6kQIFCDaDYBH9PBCBuo3eVVWuoKINXlcN57XjNsCis0Pdn+pGZMcdbAQQhsOR2
	7LX6oYJc3Fw7+Ht4DhH8PcTqWgzxG3ARjfOPPOh4IJhAhq/8/2tTHOKGvaE44aXlbypX
	aIVBw94EwkBXR55cQHQ8mJ/RPQJ/ScMWxRbwc//oh0JHm0djiRZIvJtqmgcY758OlrBE
	6ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L/ShA69goPH/RSmYJX6Wa4+JyS8HB9IsRy+Rs+M02bI=;
	b=FdrFUtzWD0kKAbn8xKoipgZ+Go4u6ZlwKxBXygX4pHWZqe1ueLs8aFoUZ8u+rgLPKc
	C/sGBn2TOntG5OadxqJHBkAV/W64Glu/rae+sk21Jg6RLM53rSuLa9chEbBt1PcJhFSx
	WnIDx/RAmAIW3RQ5tbmeSVJTiQ0JP/M03kEG7hLtLutEtj+jmQtKgolOX/k1xg88KXPb
	MmdGXeqAtux6HbIvu3J1Ttfp/jlnNK5+UB25MC7sxUFv5AqX8+Wyo1D2CZNuqUyrNSHA
	EScEp0pzYdCnKL4I2QuokVy4zUs8upoKmm+wOxqz2Kr6Dr8t7ipQBQqiSLEgpbUVxpOJ
	+Kug==
X-Gm-Message-State: ALKqPweJrj6H9k5NdKUZCpCUrScvFg11kQnZghhjmXOUzEetcpZmyF3+
	b5T0rIMV89Hx//+MwFWI1fxwWA==
X-Google-Smtp-Source: ADUXVKKxNt0Prx+lts8G9KTOZh/rjsM/2hvaSngnp+DIWXbdWaJYV1ZEpwdw0jU2z63BLPQ6jh4otg==
X-Received: by 2002:a63:87c8:: with SMTP id
	i191-v6mr1039674pge.124.1527656680229; 
	Tue, 29 May 2018 22:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	y24-v6sm61216475pfn.23.2018.05.29.22.04.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 22:04:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 22:04:39 -0700
Message-Id: <cover.1527656441.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 0/6] Add GCC-8 and make it default
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
X-List-Received-Date: Wed, 30 May 2018 05:04:40 -0000

This patch series adds the needed recipes for gcc8 support and makes it default
since SPE is relegated to obsoleted targets we disable it as well and switch qemu to not use it
For rpi3/armv7ve there is conflict between -march and -mcpu therefore we select more common
tuning which is specified by -march

The following changes since commit 760103cdaed3e820888d8984ec0b76cfc831d534:

  nativesdk-rpm: Add wrappers for nativesdk support (2018-05-29 21:06:03 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib gcc-8
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=gcc-8

Khem Raj (6):
  gcc-runtime: Remove -mcpu=cortex-a7 when building for -march=armv7ve
  qemuppc/ppc7400: Drop disabling spe
  gcc-8: Add recipes for 8.1 release
  gcc-8: Disable libssp for non mingw targets
  gcc-8: Disable float128 for ppc/musl
  tcmode-default: Switch to gcc 8.0

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/conf/machine/include/tune-ppc7400.inc    |   2 +-
 meta/conf/machine/qemuppc.conf                |   2 -
 meta/recipes-devtools/gcc/gcc-8.1.inc         | 126 +++++++++
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
 meta/recipes-devtools/gcc/gcc-common.inc      |   2 +-
 .../gcc/gcc-cross-canadian_8.1.bb             |   5 +
 .../gcc/gcc-cross-initial_8.1.bb              |   2 +
 meta/recipes-devtools/gcc/gcc-cross_8.1.bb    |   3 +
 .../gcc/gcc-crosssdk-initial_8.1.bb           |   3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_8.1.bb |   2 +
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   2 +
 meta/recipes-devtools/gcc/gcc-runtime_8.1.bb  |   7 +
 .../gcc/gcc-sanitizers_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/gcc-source_8.1.bb   |   4 +
 meta/recipes-devtools/gcc/gcc_8.1.bb          |  10 +
 .../gcc/libgcc-initial_8.1.bb                 |   2 +
 meta/recipes-devtools/gcc/libgcc_8.1.bb       |   2 +
 meta/recipes-devtools/gcc/libgfortran_8.1.bb  |   3 +
 57 files changed, 3327 insertions(+), 5 deletions(-)
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

-- 
2.17.0


