Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 10FB06FFD4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:31 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id e22so1565096wra.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nklm+6uz1z1xTMrt30F7JI+mFgnLnNoRX84N6ttZTGE=;
	b=ZIXEE94Od0nLCeTMXjImf/aCoYLSmt72Bb5btIL99jIt5qMxl0p7+kPX0htbANQu5k
	DgujOmNCkL+T9CTUCCdRSrbN+Ub7599MThWc3JRr02E7npu4YKYGGG0+CSHtoDbNI08s
	0GQDEQr3ZGYnKheEm50DYIkfwngh56JvzxtzGZqn8qlcb8FS3R6KxFqIH1rlXiaCWXsy
	4BBcBHeWESmvjvNV9hYl/JTAcAd0CY95h7J1pwgwqFJMPnbOJyZoKGnu/068GKSAE4RB
	gI65098a7CF0ODaqVKe/orE4K90majQVVSXGhKGKTaA8MLHkJSwGKCtb0of8sjsKCt2F
	OSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nklm+6uz1z1xTMrt30F7JI+mFgnLnNoRX84N6ttZTGE=;
	b=cCIwsTaqW6W2GaABzPDmgKgnE3uUE08HbYKAJhx2/RLrODN2TpqDSs6POU3loEfu8a
	KVNlJZZkbak9BSZBsQJTg2z0oRG4jFNOaX1465a2+QONyceipQ5EubWn6zvKJcZLvlgl
	faXK+g9jZ8kR8FIHgVlq8G3rNjJTmfNm3oWS/JoXvVq1Jq5tnlQfJ4mpHgMNFCzQQgsL
	lPT2rRQVt6fARiIJp+jDmWWsXDTunGUf1aK0OQaMkV9Kw/coGb+Ec0Jigr9eRX2X0eP3
	7RFBSCkhymMzlb06jw9Ap3VgBcvzHSgcb6V7uDEZZMnAlqHgUyi1oY2u4/ZdpiZDf4M4
	jP6A==
X-Gm-Message-State: AElRT7GC06cq9/bhiFMJUI5uplMUWkExUfwss8uuzTiBzv64z3wTKjdL
	ktF3TrGeENnqCJDbyCSPXjE=
X-Google-Smtp-Source: AG47ELv4HkN4GivFUYnU2HbNFN2UftBIxSZBferpdi22uLCkeLVQGTbboqSFnXZSTIygswK9kIzIhA==
X-Received: by 10.223.154.7 with SMTP id z7mr2508125wrb.98.1520728952646;
	Sat, 10 Mar 2018 16:42:32 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u22sm4955114wrf.86.2018.03.10.16.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:12 +0000
Message-Id: <cover.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [morty][PATCH 00/16] Backports for morty
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit ee49a37d096a76cce349d6eff7964daada58efb1:

  p11-kit: take source code from official git (2018-03-03 17:07:18 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/morty-backports
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/morty-backports

Andre McCurdy (1):
  gcc6: enable FL_LPAE flag for armv7ve cores

Juro Bystricky (2):
  gcc-6.3.inc: Use ucontext_t not struct ucontext.
  gcc6: Backport few more patches

Jussi Kukkonen (1):
  gcc: Remove unused patch

Khem Raj (9):
  gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
  gcc6: Upgrade to 6.3.0
  gcc-6: Sync gcc stddef.h with musl stddef.h
  gcc-6.3: Backport patch to fix ICE on ARM
  gcc-runtime: Disable libitm on riscv
  gcc: Link libssp_nonshared.a only on musl targets
  gcc: Fix libssh_nonshared linker specs for ppc/musl
  gcc6: Upgrade to 6.4
  gcc6: Fix unaligned STRD issue on ARM

Pavel Modilaynen (1):
  buildstats.bbclass: Avoid index exception in /proc/PID/io parsing

Stephen Arnold (1):
  gcc-6: Add fix for missing no-PIE flags

Yuanjie Huang (1):
  gcc: Fix CVE-2016-6131 in libiberty

 meta/classes/buildstats.bbclass                    |    5 +
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-devtools/gcc/gcc-5.4.inc              |    1 +
 .../gcc/gcc-5.4/CVE-2016-6131.patch                |  251 +++
 .../gcc/gcc-6.2/0041-ssp_nonshared.patch           |   28 -
 ...et-71056-Don-t-use-vectorized-builtins-wh.patch |   92 -
 .../gcc/gcc-6.2/CVE-2016-4490.patch                |  290 ---
 .../gcc/gcc-6.2/ubsan-fix-check-empty-string.patch |   28 -
 .../gcc/{gcc-6.2.inc => gcc-6.4.inc}               |   35 +-
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |    0
 .../{gcc-6.2 => gcc-6.4}/0002-uclibc-conf.patch    |    0
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |    0
 .../{gcc-6.2 => gcc-6.4}/0004-uclibc-locale.patch  |    0
 .../0005-uclibc-locale-no__x.patch                 |    0
 .../0006-uclibc-locale-wchar_fix.patch             |    0
 .../0007-uclibc-locale-update.patch                |    0
 .../0008-missing-execinfo_h.patch                  |    0
 .../{gcc-6.2 => gcc-6.4}/0009-c99-snprintf.patch   |    0
 .../0010-gcc-poison-system-directories.patch       |    0
 .../0011-gcc-poison-dir-extend.patch               |    0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |    0
 .../0013-64-bit-multilib-hack.patch                |    0
 .../0014-optional-libstdc.patch                    |    0
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |    0
 .../0016-COLLECT_GCC_OPTIONS.patch                 |    0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |    0
 .../0018-fortran-cross-compile-hack.patch          |    0
 .../0019-cpp-honor-sysroot.patch                   |    0
 .../0020-MIPS64-Default-to-N64-ABI.patch           |    0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |    0
 ...0022-gcc-Fix-argument-list-too-long-error.patch |    0
 .../{gcc-6.2 => gcc-6.4}/0023-Disable-sdt.patch    |    0
 .../gcc/{gcc-6.2 => gcc-6.4}/0024-libtool.patch    |    0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |    0
 ...tilib-config-files-from-B-instead-of-usin.patch |    0
 ...-libdir-from-.la-which-usually-points-to-.patch |    0
 .../gcc/{gcc-6.2 => gcc-6.4}/0028-export-CPP.patch |    0
 ...AltiVec-generation-on-powepc-linux-target.patch |    0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |    0
 ...Ensure-target-gcc-headers-can-be-included.patch |    0
 ...-t-build-with-disable-dependency-tracking.patch |    0
 ...h-host-directory-during-relink-if-inst_pr.patch |    0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |    0
 .../0035-aarch64-Add-support-for-musl-ldso.patch   |    0
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |    0
 ...-handle-sysroot-support-for-nativesdk-gcc.patch |    0
 ...et-sysroot-gcc-version-specific-dirs-with.patch |    0
 ...-various-_FOR_BUILD-and-related-variables.patch |    0
 .../0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch    |    0
 ...shared-to-link-commandline-for-musl-targe.patch |   87 +
 ...c-libcpp-support-ffile-prefix-map-old-new.patch |    0
 ...ug-prefix-map-to-replace-ffile-prefix-map.patch |    0
 ...-fdebug-prefix-map-support-to-remap-sourc.patch |    0
 ...45-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch |    0
 ...bgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch |    0
 ...e-alias-for-__cpu_indicator_init-instead-.patch |    2 +-
 .../gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch |   91 +
 .../gcc/gcc-6.4/0054_all_nopie-all-flags.patch     |   22 +
 .../gcc/gcc-6.4/0055-unwind_h-glibc26.patch        |  139 ++
 ...-relax-the-restriction-on-subreg-reload-f.patch |   51 +
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch |  194 ++
 ...001-enable-FL_LPAE-flag-for-armv7ve-cores.patch |   67 +
 ...ove-struct-ix86_frame-to-machine_function.patch |  247 +++
 ...ference-of-struct-ix86_frame-to-avoid-cop.patch |   74 +
 ...nst-reference-of-struct-ix86_frame-to-avo.patch |  131 ++
 .../backport/0004-x86-Add-mindirect-branch.patch   | 2154 ++++++++++++++++++++
 .../backport/0005-x86-Add-mfunction-return.patch   | 1570 ++++++++++++++
 .../0006-x86-Add-mindirect-branch-register.patch   |  946 +++++++++
 .../0007-x86-Add-V-register-operand-modifier.patch |  139 ++
 ...w-mindirect-branch-mfunction-return-with-.patch |  304 +++
 ...VALID_REGNUM-in-indirect-thunk-processing.patch |  126 ++
 ...INVALID_REGNUM-as-invalid-register-number.patch |   46 +
 ...date-mfunction-return-for-return-with-pop.patch |  453 ++++
 ...-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch | 1004 +++++++++
 .../gcc/gcc-6.4/backport/CVE-2016-6131.patch       |  223 ++
 ...s-canadian_6.2.bb => gcc-cross-canadian_6.4.bb} |    0
 ...oss-initial_6.2.bb => gcc-cross-initial_6.4.bb} |    0
 .../gcc/{gcc-cross_6.2.bb => gcc-cross_6.4.bb}     |    0
 ...-initial_6.2.bb => gcc-crosssdk-initial_6.4.bb} |    0
 .../{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.4.bb}   |    0
 meta/recipes-devtools/gcc/gcc-runtime.inc          |    2 +
 .../gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.4.bb} |    0
 ...gcc-sanitizers_6.2.bb => gcc-sanitizers_6.4.bb} |    0
 .../gcc/{gcc-source_6.2.bb => gcc-source_6.4.bb}   |    0
 .../gcc/{gcc_6.2.bb => gcc_6.4.bb}                 |    0
 ...libgcc-initial_6.2.bb => libgcc-initial_6.4.bb} |    0
 .../gcc/{libgcc_6.2.bb => libgcc_6.4.bb}           |    0
 .../gcc/{libgfortran_6.2.bb => libgfortran_6.4.bb} |    0
 .../gnutls/gnutls/check_SYS_getrandom.patch        |   35 +
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        |    1 +
 90 files changed, 8392 insertions(+), 448 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0041-ssp_nonshared.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/0048-ARM-PR-target-71056-Don-t-use-vectorized-builtins-wh.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
 rename meta/recipes-devtools/gcc/{gcc-6.2.inc => gcc-6.4.inc} (74%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0002-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0004-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0005-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0006-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0007-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0019-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0020-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0021-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0022-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0023-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0024-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0025-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0026-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0027-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0028-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0029-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0030-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0031-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0032-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0033-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0034-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0035-aarch64-Add-support-for-musl-ldso.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0036-libcc1-fix-libcc1-s-install-path-and-rpath.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0037-handle-sysroot-support-for-nativesdk-gcc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0038-Search-target-sysroot-gcc-version-specific-dirs-with.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0039-Fix-various-_FOR_BUILD-and-related-variables.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0040-nios2-Define-MUSL_DYNAMIC_LINKER.patch (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0042-gcc-libcpp-support-ffile-prefix-map-old-new.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0043-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0044-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0045-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0046-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-6.2 => gcc-6.4}/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch (99%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0048-sync-gcc-stddef.h-with-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0054_all_nopie-all-flags.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0055-unwind_h-glibc26.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0001-i386-Move-struct-ix86_frame-to-machine_function.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0004-x86-Add-mindirect-branch.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0005-x86-Add-mfunction-return.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0006-x86-Add-mindirect-branch-register.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0007-x86-Add-V-register-operand-modifier.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0011-i386-Update-mfunction-return-for-return-with-pop.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/backport/CVE-2016-6131.patch
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_6.2.bb => gcc-cross-canadian_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_6.2.bb => gcc-cross-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_6.2.bb => gcc-cross_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_6.2.bb => gcc-crosssdk-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_6.2.bb => gcc-crosssdk_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_6.2.bb => gcc-runtime_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_6.2.bb => gcc-sanitizers_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_6.2.bb => gcc-source_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_6.2.bb => gcc_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_6.2.bb => libgcc-initial_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_6.2.bb => libgcc_6.4.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_6.2.bb => libgfortran_6.4.bb} (100%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch

-- 
2.15.1


