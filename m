Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 27578780A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:38:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d5so4390243pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dCjYzSUA4lQr1XSLT6Vbg+B4aaTGViB2s0SLMMBJB/U=;
	b=GGAZMrgoONxa47ozbxWYkaSwTsS9MfgmbLuV3DUBOyciMSEyoloRDm9MQ3y9DMM8VW
	ia4+gKJB35ErIJeFJ0oGc9uU6UkWfzGuSyAesu4N1lkgedLDz4tShi8jtrnmCTOE+And
	RD5p41HiJvHzGP5q/DeDKpTixSYrTi0dYtZBk7HuBtbQX507/+RdtRVHPeu0KwhZFt5G
	gIVr+MVbXqqx2YlMM0fHrCdMLH5gqmWuHh01ReE64DNK9HlGPJ9usNIeH7cc0cPzoX2U
	gKrWkDuwZhYNS/Zk542ReZLZLwQmYwu3ls0wl32A4dFiUX2SvqOgYer3MIGWoCVbyjw+
	lYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dCjYzSUA4lQr1XSLT6Vbg+B4aaTGViB2s0SLMMBJB/U=;
	b=P03/gfW2+E1BoNi7N0zOhsmZ+nFxdev1fgMEQ+0DIkE/6/46dwJqBZYZtfWibuHgcd
	uksJFdPLlzRKvMJd9qeCGz/1MKRCoB5vVUbHnB3tApgJMQriR7bhOtKSgTOtUO1EcnZU
	pmoDgc015whvOrwn6bq4Dsc1RA2VhB3Q8A5yBE6TyPiMywq1TDPc/95o295HV4CBtgVN
	XHYGi1tLfpWPIpaEcfTJWOtVgq4YQa7EbS0yUgku8Sjz4HXCOzwwXaj613RnxSaaxWy4
	3TwTsF68CalwouK/7RooIQxETklA99aevJ3uXMb/Eu8WBYl/eqeLXQoiucpPayrh0+Df
	CBTg==
X-Gm-Message-State: AODbwcCCliVTnrDplKUQkH+AngFeh+9C5PzWMx0AdhXXX8R80aGUOiUL
	qNlASIoLksJBrTAZ
X-Received: by 10.84.133.3 with SMTP id 3mr57196571plf.283.1497278302808;
	Mon, 12 Jun 2017 07:38:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	62sm22006798pfr.90.2017.06.12.07.38.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:38:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:38:11 -0700
Message-Id: <cover.1497278129.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH 0/2] Add GCC 7.1 recipes
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
X-List-Received-Date: Mon, 12 Jun 2017 14:38:22 -0000

Make gcc7 as default compiler

The following changes since commit aea90e9ee6f34e7c1c08307080b1e29646668df6:

  package.bbclass: Restore functionality to detect RPM dependencies (2017-06-12 15:24:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/gcc7
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc7

Khem Raj (2):
  gcc: Add recipes for gcc-7
  gcc_7.1.bb: disable thumb on armv5t

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-devtools/gcc/gcc-7.1.inc              |  133 +
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
 .../gcc/gcc-7.1/0002-uclibc-conf.patch             |   30 +
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
 .../gcc/gcc-7.1/0004-uclibc-locale.patch           | 2862 ++++++++++++++++++++
 .../gcc/gcc-7.1/0005-uclibc-locale-no__x.patch     |  257 ++
 .../gcc/gcc-7.1/0006-uclibc-locale-wchar_fix.patch |   68 +
 .../gcc/gcc-7.1/0007-uclibc-locale-update.patch    |  542 ++++
 .../gcc/gcc-7.1/0008-c99-snprintf.patch            |   28 +
 .../0009-gcc-poison-system-directories.patch       |  192 ++
 .../gcc/gcc-7.1/0010-gcc-poison-dir-extend.patch   |   39 +
 .../0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
 .../gcc/gcc-7.1/0012-64-bit-multilib-hack.patch    |   85 +
 .../gcc/gcc-7.1/0013-optional-libstdc.patch        |  125 +
 ...0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
 .../gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.patch     |   38 +
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 +
 .../gcc-7.1/0017-fortran-cross-compile-hack.patch  |   46 +
 .../gcc/gcc-7.1/0018-cpp-honor-sysroot.patch       |   54 +
 .../gcc-7.1/0019-MIPS64-Default-to-N64-ABI.patch   |   57 +
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  234 ++
 ...0021-gcc-Fix-argument-list-too-long-error.patch |   40 +
 .../gcc/gcc-7.1/0022-Disable-sdt.patch             |  113 +
 .../gcc/gcc-7.1/0023-libtool.patch                 |   42 +
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
 ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
 ...-libdir-from-.la-which-usually-points-to-.patch |   31 +
 .../gcc/gcc-7.1/0027-export-CPP.patch              |   53 +
 ...AltiVec-generation-on-powepc-linux-target.patch |   56 +
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   42 +
 ...Ensure-target-gcc-headers-can-be-included.patch |   98 +
 ...-t-build-with-disable-dependency-tracking.patch |   54 +
 ...h-host-directory-during-relink-if-inst_pr.patch |   38 +
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   29 +
 .../0034-aarch64-Add-support-for-musl-ldso.patch   |   28 +
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |   54 +
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |  213 ++
 ...et-sysroot-gcc-version-specific-dirs-with.patch |  102 +
 ...-various-_FOR_BUILD-and-related-variables.patch |  137 +
 .../0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |   28 +
 .../gcc/gcc-7.1/0040-ssp_nonshared.patch           |   28 +
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |  284 ++
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |   43 +
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |   54 +
 ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |  123 +
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |   29 +
 ...e-alias-for-__cpu_indicator_init-instead-.patch |   85 +
 .../gcc-7.1/0047-sync-gcc-stddef.h-with-musl.patch |   91 +
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |    3 +-
 .../recipes-devtools/gcc/gcc-cross-canadian_7.1.bb |    5 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    3 +-
 meta/recipes-devtools/gcc/gcc-cross-initial_7.1.bb |    2 +
 meta/recipes-devtools/gcc/gcc-cross.inc            |    3 +-
 meta/recipes-devtools/gcc/gcc-cross_7.1.bb         |    3 +
 .../gcc/gcc-crosssdk-initial_7.1.bb                |    3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_7.1.bb      |    2 +
 meta/recipes-devtools/gcc/gcc-runtime.inc          |    4 +-
 meta/recipes-devtools/gcc/gcc-runtime_7.1.bb       |    7 +
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |    1 +
 meta/recipes-devtools/gcc/gcc-sanitizers_7.1.bb    |    2 +
 meta/recipes-devtools/gcc/gcc-source_7.1.bb        |    4 +
 meta/recipes-devtools/gcc/gcc_7.1.bb               |   10 +
 meta/recipes-devtools/gcc/libgcc-initial_7.1.bb    |    2 +
 meta/recipes-devtools/gcc/libgcc_7.1.bb            |    2 +
 meta/recipes-devtools/gcc/libgfortran_7.1.bb       |    3 +
 66 files changed, 7243 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0002-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0004-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0005-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0006-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0007-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0008-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0009-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0010-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0011-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0012-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0013-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0014-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0015-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0016-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0017-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0018-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0019-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0020-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0021-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0022-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0023-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0024-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0025-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0026-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0027-export-CPP.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0028-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0029-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0030-Ensure-target-gcc-headers-can-be-included.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0031-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0032-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0033-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0034-aarch64-Add-support-for-musl-ldso.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0035-libcc1-fix-libcc1-s-install-path-and-rpath.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0036-handle-sysroot-support-for-nativesdk-gcc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0037-Search-target-sysroot-gcc-version-specific-dirs-with.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0038-Fix-various-_FOR_BUILD-and-related-variables.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0039-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0040-ssp_nonshared.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0041-gcc-libcpp-support-ffile-prefix-map-old-new.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0042-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.1/0047-sync-gcc-stddef.h-with-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-source_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_7.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgfortran_7.1.bb

-- 
2.13.1


