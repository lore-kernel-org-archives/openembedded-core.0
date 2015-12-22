Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 57FD26FFEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 14:09:01 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p187so112071967wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 06:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=NfjWWGoaxOKfPBhNzX5QRFCkaaMzdrHT11uteu8HuOk=;
	b=vBCu+Z4+0f54HlyH7SVdTPq/3NiZl0/PBaJU7N2w7XX/DfKJflvvxMY01LSBZtZ+fu
	a/0PXu+8WeROK8v0TmLioRtbNuwMMRfvxiwOSO1FWfjmgGR8R8BbSzlP5lWakE/+4VQO
	LImkiWERxgHbx4MC8U8cGJbpPMfXmZE1/5lVuq7NpzKz+hN86O5uz40LML9rwusUlhOj
	NPxzuG6/duMZIkkYnjAzg0uUpPz1HWwl/rR9NGw2ePQ0cxV3QINsYFS/LxQ/q5q+PXhS
	aiCiUfcxUjs5v4J0boLCmNiIaFM4UrM1ZgfebkdoJ1HxkYqKbKIr8kcDVEVBdjbhZicj
	R4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=NfjWWGoaxOKfPBhNzX5QRFCkaaMzdrHT11uteu8HuOk=;
	b=M/0UGbmS0EiVFbU8e6f4XkyW0wgYtUr+1Hdpgi/8hvk+7kkk/C08Or+wCZXUgil/jI
	GKz4aUCPqJ4/hOIoFpW7xVAwR/vIDwZc6LFlcqvUxoyRi16e86syxWn56UiOCjHU+EEF
	gI1ZCilg9EBqrNftysdK1Lz3X06jwdXNLuyr1dixwL+eHimWZ6CIdplbvaNyjVAEpwp0
	J0wyv4E6wRWCLPyOaePoFRy9EcL3fYtK5+XALmAFCNqzIXE/QTm0RWQepf2XIR/ITKjG
	axzTTtDhMArDMYTHRR6f/dWmen5O8dyDf57QpW1rsqzf76tqajyuGXDqvMP5aSxYPBN9
	NfMw==
X-Gm-Message-State: ALoCoQncVjERDPQa/hYj4GXDltZIY2M82OMlY54JMzFyagQsHRKYlt4APpNIDdc5iX/HlzRT9jiB9i3LQeiqYEjKCKS/oYTtKA==
X-Received: by 10.194.123.8 with SMTP id lw8mr27789854wjb.72.1450793341546;
	Tue, 22 Dec 2015 06:09:01 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i196sm13884826wmf.23.2015.12.22.06.08.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 06:09:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:08:53 +0000
Message-Id: <1450793333-31974-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Subject: [PATCH 00/26] Consolidated Pull
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
X-List-Received-Date: Tue, 22 Dec 2015 14:09:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

A consolidated pull of patches from the list, that have passed the autobuilder.
The only failures are a mystery failure in the selftest has more debugging output in my mut2 branch,
and Freescale still haven't resolved the u-boot-qoriq failure.

(poky-contrib:ross/mut)

Ross

Alejandro del Castillo (1):
  opkg: upgrade to v0.3.1

Alexander Kanavin (1):
  flex: update to 2.6.0

Andre McCurdy (7):
  feature-arm-thumb.inc: drop ARM -vs- thumb comments
  feature-arm-thumb.inc: drop legacy _thumb and _thumb-interwork
    over-rides
  feature-arm-thumb.inc: drop 'no-thumb-interwork' tuning feature
  tune-cortexm3.inc: provide an _armv7m over-ride via MACHINEOVERRIDES
  tune-cortexr4.inc: provide an _armv7r over-ride via MACHINEOVERRIDES
  gcc-configure-common.inc: add gcc-runtime ABI fixes for armv7m and
    armv7r
  pixman: check neon support via TUNE_FEATURES, not the _armv7a
    over-ride

Aníbal Limón (1):
  dev-manual: Fix errata in new kvm-vhost.

Christopher Larson (1):
  buildhistory-collect-srcrevs: hide empty sections

Daniel Istrate (1):
  selftest/buildhistory.py: Test buildhistory does not change sigs

Fan Xin (1):
  gettext: Upgrade 0.19.4 -> 0.19.6

Hongxu Jia (1):
  multilib.bbclass: install multilib and non-multilib locales in images

Humberto Ibarra (1):
  scripts/yocto-layer: Avoids duplication of "meta-" prefix

Jackie Huang (1):
  staging.bbclass: make already-stripped can be skipped

Jianxun Zhang (1):
  meta-yocto-bsp: Remove uvesafb (v86d) from generic x86 features

Joshua Lock (1):
  wic/help.py: document that mountpoint is optional for part command

Juro Bystricky (1):
  oe-buildenv-internal: fix return code

Jussi Kukkonen (1):
  xdg-utils: Do not build the in-script documentation

Khem Raj (2):
  gcc5: Upgrade gcc-5.2 -> gcc-5.3
  libxcb: Add a workaround for gcc5 bug on mips

Ross Burton (3):
  cooker: use in instead of count
  systemd: remove merge conflicts accidently left in
  cooker: fix findFilesMatchingInDir documentation

Yuanjie Huang (1):
  rpm: Fix support for db5 and db6

 bitbake/lib/bb/cooker.py                           |   9 +-
 documentation/dev-manual/dev-manual-qemu.xml       |   8 +-
 .../conf/machine/include/genericx86-common.inc     |   2 +-
 meta/classes/image.bbclass                         |  20 ++-
 meta/classes/multilib.bbclass                      |   9 ++
 meta/classes/staging.bbclass                       |   5 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |  17 --
 meta/conf/machine/include/tune-cortexm3.inc        |   1 +
 meta/conf/machine/include/tune-cortexr4.inc        |   1 +
 meta/lib/oeqa/selftest/buildhistory.py             |  69 +++++++-
 .../parallel.patch                                 |   0
 .../{gettext_0.19.4.bb => gettext_0.19.6.bb}       |   4 +-
 ...-remove-userspace-firmware-loading-suppor.patch |   5 +-
 ...fixes-Do-not-use-obsolete-bison-construct.patch |  80 ----------
 meta/recipes-devtools/flex/files/run-ptest         |  29 ----
 meta/recipes-devtools/flex/flex.inc                |  45 ------
 ...-target-for-building-tests-without-runnin.patch |  28 ++++
 .../recipes-devtools/flex/flex/disable-tests.patch |  19 +++
 .../{files => flex}/do_not_create_pdf_doc.patch    |   0
 meta/recipes-devtools/flex/flex/run-ptest          |   5 +
 meta/recipes-devtools/flex/flex_2.5.39.bb          |   9 --
 meta/recipes-devtools/flex/flex_2.6.0.bb           |  55 +++++++
 .../gcc/gcc-5.2/0037-pr65779.patch                 | 173 ---------------------
 .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           |  39 -----
 .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |  22 ---
 .../gcc/{gcc-5.2.inc => gcc-5.3.inc}               |  31 ++--
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  10 +-
 .../{gcc-5.2 => gcc-5.3}/0002-uclibc-conf.patch    |   6 +-
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   6 +-
 .../{gcc-5.2 => gcc-5.3}/0004-uclibc-locale.patch  |  18 +--
 .../0005-uclibc-locale-no__x.patch                 |   6 +-
 .../0006-uclibc-locale-wchar_fix.patch             |   6 +-
 .../0007-uclibc-locale-update.patch                |   6 +-
 .../0008-missing-execinfo_h.patch                  |   6 +-
 .../{gcc-5.2 => gcc-5.3}/0009-c99-snprintf.patch   |   6 +-
 .../0010-gcc-poison-system-directories.patch       |  26 ++--
 .../0011-gcc-poison-dir-extend.patch               |   6 +-
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   8 +-
 .../0013-64-bit-multilib-hack.patch                |   6 +-
 .../0014-optional-libstdc.patch                    |  12 +-
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  14 +-
 .../0016-COLLECT_GCC_OPTIONS.patch                 |   6 +-
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  14 +-
 .../0018-fortran-cross-compile-hack.patch          |  10 +-
 .../0019-libgcc-sjlj-check.patch                   |  10 +-
 .../0020-cpp-honor-sysroot.patch                   |   6 +-
 .../0021-MIPS64-Default-to-N64-ABI.patch           |  10 +-
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |   8 +-
 ...0023-gcc-Fix-argument-list-too-long-error.patch |  10 +-
 .../{gcc-5.2 => gcc-5.3}/0024-Disable-sdt.patch    |  22 +--
 .../gcc/{gcc-5.2 => gcc-5.3}/0025-libtool.patch    |   6 +-
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 ...tilib-config-files-from-B-instead-of-usin.patch |  14 +-
 ...-libdir-from-.la-which-usually-points-to-.patch |   6 +-
 .../gcc/{gcc-5.2 => gcc-5.3}/0029-export-CPP.patch |   6 +-
 ...AltiVec-generation-on-powepc-linux-target.patch |  10 +-
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   6 +-
 ...Ensure-target-gcc-headers-can-be-included.patch |  10 +-
 ...-t-build-with-disable-dependency-tracking.patch |   6 +-
 ...h-host-directory-during-relink-if-inst_pr.patch |   6 +-
 ...-link-the-plugins-with-libgomp-explicitly.patch |   6 +-
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |   8 +-
 .../0037-aarch64-Add-support-for-musl-ldso.patch   |  26 ++++
 .../0038-fix-g-sysroot.patch}                      |  32 ++--
 ...ibcc1-fix-libcc1-s-install-path-and-rpath.patch |  11 +-
 ...handle-sysroot-support-for-nativesdk-gcc.patch} |  21 ++-
 ...t-sysroot-gcc-version-specific-dirs-with.patch} |  38 +++--
 ...various-_FOR_BUILD-and-related-variables.patch} |  24 ++-
 .../0043-libstdc-Support-musl.patch}               |  22 ++-
 ...-as-a-musl-libc-specifier-and-the-necess.patch} | 149 +++++++++---------
 .../0045-Support-for-arm-linux-musl.patch}         | 146 +++++++++--------
 ...et-rid-of-ever-broken-fixincludes-on-musl.patch |  28 ++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   2 +
 ...s-canadian_5.2.bb => gcc-cross-canadian_5.3.bb} |   0
 ...oss-initial_5.2.bb => gcc-cross-initial_5.3.bb} |   0
 .../gcc/{gcc-cross_5.2.bb => gcc-cross_5.3.bb}     |   0
 ...-initial_5.2.bb => gcc-crosssdk-initial_5.3.bb} |   0
 .../{gcc-crosssdk_5.2.bb => gcc-crosssdk_5.3.bb}   |   0
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   4 +-
 .../gcc/{gcc-runtime_5.2.bb => gcc-runtime_5.3.bb} |   0
 ...gcc-sanitizers_5.2.bb => gcc-sanitizers_5.3.bb} |   0
 .../gcc/{gcc-source_5.2.bb => gcc-source_5.3.bb}   |   0
 .../gcc/{gcc_5.2.bb => gcc_5.3.bb}                 |   0
 ...libgcc-initial_5.2.bb => libgcc-initial_5.3.bb} |   0
 .../gcc/{libgcc_5.2.bb => libgcc_5.3.bb}           |   0
 .../gcc/{libgfortran_5.2.bb => libgfortran_5.3.bb} |   0
 ...1-configure.ac-use-pkg-config-for-libsolv.patch |  36 +++++
 ...-include-stdio.h-for-getting-FILE-defined.patch |  45 ------
 ...ver_set_arch_policy-use-correct-logic-dur.patch |  35 +++++
 ...ve-add-support-for-empty-compressed-files.patch |  64 --------
 ...ng_util-New-file-with-bin_to_hex-function.patch | 122 ---------------
 .../opkg/0002-md5-Add-md5_to_string-function.patch | 110 -------------
 ...0003-sha256-Add-sha256_to_string-function.patch | 110 -------------
 ...4-opkg_download-Use-short-cache-file-name.patch |  85 ----------
 .../opkg/{opkg_0.3.0.bb => opkg_0.3.1.bb}          |  13 +-
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |  95 ++++++-----
 .../0001-Don-t-build-the-in-script-manual.patch    |  30 ++++
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb |   1 +
 .../libxcb/gcc-mips-pr68302-mips-workaround.patch  |  22 +++
 meta/recipes-graphics/xorg-lib/libxcb_1.11.1.bb    |   4 +-
 meta/recipes-graphics/xorg-lib/pixman_0.32.8.bb    |   7 +-
 scripts/buildhistory-collect-srcrevs               |  22 ++-
 scripts/lib/wic/help.py                            |   5 +-
 scripts/oe-buildenv-internal                       |   4 +-
 scripts/yocto-layer                                |   6 +-
 105 files changed, 939 insertions(+), 1393 deletions(-)
 rename meta/recipes-core/gettext/{gettext-0.19.4 => gettext-0.19.6}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext_0.19.4.bb => gettext_0.19.6.bb} (97%)
 delete mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
 delete mode 100755 meta/recipes-devtools/flex/files/run-ptest
 delete mode 100644 meta/recipes-devtools/flex/flex.inc
 create mode 100644 meta/recipes-devtools/flex/flex/0001-tests-add-a-target-for-building-tests-without-runnin.patch
 create mode 100644 meta/recipes-devtools/flex/flex/disable-tests.patch
 rename meta/recipes-devtools/flex/{files => flex}/do_not_create_pdf_doc.patch (100%)
 create mode 100755 meta/recipes-devtools/flex/flex/run-ptest
 delete mode 100644 meta/recipes-devtools/flex/flex_2.5.39.bb
 create mode 100644 meta/recipes-devtools/flex/flex_2.6.0.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
 rename meta/recipes-devtools/gcc/{gcc-5.2.inc => gcc-5.3.inc} (83%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0002-uclibc-conf.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0004-uclibc-locale.patch (99%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0005-uclibc-locale-no__x.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0006-uclibc-locale-wchar_fix.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0007-uclibc-locale-update.patch (99%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0008-missing-execinfo_h.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0009-c99-snprintf.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0010-gcc-poison-system-directories.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0011-gcc-poison-dir-extend.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0013-64-bit-multilib-hack.patch (97%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0014-optional-libstdc.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (85%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0016-COLLECT_GCC_OPTIONS.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0018-fortran-cross-compile-hack.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0019-libgcc-sjlj-check.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0020-cpp-honor-sysroot.patch (94%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0021-MIPS64-Default-to-N64-ABI.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (98%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0023-gcc-Fix-argument-list-too-long-error.patch (86%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0024-Disable-sdt.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0025-libtool.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch (89%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (84%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0029-export-CPP.patch (95%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0032-Ensure-target-gcc-headers-can-be-included.patch (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (92%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch (87%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch (96%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (82%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0037-aarch64-Add-support-for-musl-ldso.patch
 rename meta/recipes-devtools/gcc/{gcc-5.2/0038-fix-g++-sysroot.patch => gcc-5.3/0038-fix-g-sysroot.patch} (64%)
 rename meta/recipes-devtools/gcc/{gcc-5.2 => gcc-5.3}/0039-libcc1-fix-libcc1-s-install-path-and-rpath.patch (90%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0040-nativesdk-gcc-support.patch => gcc-5.3/0040-handle-sysroot-support-for-nativesdk-gcc.patch} (93%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0041-handle-target-sysroot-multilib.patch => gcc-5.3/0041-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (73%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0042-cxxflags-for-build.patch => gcc-5.3/0042-Fix-various-_FOR_BUILD-and-related-variables.patch} (88%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0043-libstdc-musl.patch => gcc-5.3/0043-libstdc-Support-musl.patch} (56%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0044-gcc-musl-support.patch => gcc-5.3/0044-Adding-mmusl-as-a-musl-libc-specifier-and-the-necess.patch} (75%)
 rename meta/recipes-devtools/gcc/{gcc-5.2/0045-musl-dynamic-linker.patch => gcc-5.3/0045-Support-for-arm-linux-musl.patch} (68%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0046-Get-rid-of-ever-broken-fixincludes-on-musl.patch
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_5.2.bb => gcc-cross-canadian_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_5.2.bb => gcc-cross-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_5.2.bb => gcc-cross_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_5.2.bb => gcc-crosssdk-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_5.2.bb => gcc-crosssdk_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_5.2.bb => gcc-runtime_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_5.2.bb => gcc-sanitizers_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_5.2.bb => gcc-source_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_5.2.bb => gcc_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_5.2.bb => libgcc-initial_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_5.2.bb => libgcc_5.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_5.2.bb => libgfortran_5.3.bb} (100%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-configure.ac-use-pkg-config-for-libsolv.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libsolv_solver_set_arch_policy-use-correct-logic-dur.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg_archive-add-support-for-empty-compressed-files.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.0.bb => opkg_0.3.1.bb} (81%)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/0001-Don-t-build-the-in-script-manual.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch

-- 
2.6.4


