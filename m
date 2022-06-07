Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 00/26] Pull request (cover letter only)
Date: Mon,  6 Jun 2022 16:10:55 -1000
Message-Id: <cover.1654567798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

The following changes since commit 4eb0b7468383a1d0314b3bfd43ea37c95de464d9:

  tiff: mark CVE-2022-1622 and CVE-2022-1623 as invalid (2022-05-28 10:38:07 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.37
  linux-yocto/5.10: update to v5.10.113
  linux-yocto/5.15: update to v5.15.38
  linux-yocto/5.10: update to v5.10.114

Davide Gardenal (2):
  libpcre2: upgrade 10.39 -> 10.40
  ncurses: update to patchlevel 20220423

Ernst Sjöstrand (2):
  cve-check: Add helper for symlink handling
  cve-check: Only include installed packages for rootfs manifest

Joerg Vehlow (1):
  libseccomp: Add missing files for ptests

Khem Raj (2):
  ovmf: Fix native build with gcc-12
  gcc: Upgrade to 11.3 release

Markus Volk (1):
  mesa.inc: package 00-radv-defaults.conf

Martin Jansa (2):
  staging.bbclass: process direct dependencies in deterministic order
  insane.bbclass: make sure to close .patch files

Naveen Saini (1):
  pciutils: avoid lspci conflict with busybox

Richard Purdie (8):
  vim: Upgrade 8.2.4912 -> 8.2.5034 to fix 9 CVEs
  tiff: Add jbig PACKAGECONFIG and clarify CVE-2022-1210
  libxslt: Mark CVE-2022-29824 as not applying
  cve-extra-exclusions: Add kernel CVEs
  cve-check: Allow warnings to be disabled
  rust-common: Fix sstate signatures between arm hf and non-hf
  rust-common: Drop LLVM_TARGET and simplify
  rust-common: Fix native signature dependency issues

Sundeep KOKKONDA (2):
  rust-common: Ensure sstate signatures have correct dependencues for
    do_rust_gen_targets
  rust-common: Fix for target definitions returning 'NoneType' for arm

leimaohui (1):
  cve-check.bbclass: Added do_populate_sdk[recrdeptask].

 meta/classes/cve-check.bbclass                | 109 ++++---
 meta/classes/insane.bbclass                   |  18 +-
 meta/classes/rust-common.bbclass              |   3 +
 meta/classes/staging.bbclass                  |   2 +-
 .../distro/include/cve-extra-exclusions.inc   |  37 +++
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/recipes-bsp/pciutils/pciutils_3.7.0.bb   |   5 +-
 meta/recipes-core/ncurses/ncurses.inc         |   2 +-
 ...ncurses_6.3.bb => ncurses_6.3+20220423.bb} |   4 +-
 .../0001-BaseTools-fix-gcc12-warning-1.patch  |  51 +++
 .../0001-BaseTools-fix-gcc12-warning.patch    |  49 +++
 meta/recipes-core/ovmf/ovmf_git.bb            |   6 +
 .../cargo/cargo-cross-canadian.inc            |   2 -
 .../gcc/{gcc-11.2.inc => gcc-11.3.inc}        |  66 ++--
 ...ian_11.2.bb => gcc-cross-canadian_11.3.bb} |   0
 .../{gcc-cross_11.2.bb => gcc-cross_11.3.bb}  |   0
 ...-crosssdk_11.2.bb => gcc-crosssdk_11.3.bb} |   0
 ...cc-runtime_11.2.bb => gcc-runtime_11.3.bb} |   0
 ...itizers_11.2.bb => gcc-sanitizers_11.3.bb} |   0
 ...{gcc-source_11.2.bb => gcc-source_11.3.bb} |   0
 .../gcc/gcc/0001-CVE-2021-35465.patch         | 138 --------
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  10 +-
 .../gcc/gcc/0002-CVE-2021-35465.patch         |  39 ---
 .../0002-gcc-poison-system-directories.patch  |  26 +-
 ....patch => 0003-64-bit-multilib-hack.patch} |   2 +-
 .../gcc/gcc/0003-CVE-2021-35465.patch         | 103 ------
 .../gcc/gcc/0004-CVE-2021-35465.patch         | 304 ------------------
 ...s.h-in-B-instead-of-S-and-t-oe-in-B.patch} |  12 +-
 ...oot.patch => 0005-cpp-honor-sysroot.patch} |  54 ++--
 ...MIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} | 101 +++---
 ...gcc-Fix-argument-list-too-long-error.patch |  42 +++
 ...{0014-libtool.patch => 0008-libtool.patch} |   2 +-
 ...-fix-v4bx-to-linker-to-support-EABI.patch} |   2 +-
 ...config-files-from-B-instead-of-usin.patch} |  14 +-
 ...r-from-.la-which-usually-points-to-.patch} |   2 +-
 ...-target-gcc-headers-can-be-included.patch} |   6 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  38 ---
 ...-directory-during-relink-if-inst_pr.patch} |   2 +-
 ...fix-libcc1-s-install-path-and-rpath.patch} |   8 +-
 ...e-build-CPP-CPPFLAGS-is-used-for-bu.patch} |  89 ++---
 ...ins-something-unsupported-by-the-bu.patch} |  39 +--
 ...e-sysroot-support-for-nativesdk-gcc.patch} |  14 +-
 ...root-gcc-version-specific-dirs-with.patch} |   8 +-
 ...19-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |  28 +-
 ...-to-link-commandline-for-musl-targe.patch} |  10 +-
 ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   2 +-
 ...=> 0022-sync-gcc-stddef.h-with-musl.patch} |   2 +-
 ...e-introduce-spe-commandline-options.patch} |   4 +-
 ...s-for-__cpu_indicator_init-instead-.patch} |   6 +-
 ...-Do-not-use-__LINE__-for-maintainin.patch} |   4 +-
 ...gw32-Enable-operation_not_supported.patch} |   2 +-
 ...mic-Do-not-enforce-march-on-aarch64.patch} |  10 +-
 ...y-debug-prefix-maps-before-checksum.patch} |  24 +-
 ... 0029-Fix-install-path-of-linux64.h.patch} |  10 +-
 .../gcc/0042-Fix-thread-stack-size-init.patch |  23 --
 .../gcc/{gcc_11.2.bb => gcc_11.3.bb}          |   0
 ...initial_11.2.bb => libgcc-initial_11.3.bb} |   0
 .../gcc/{libgcc_11.2.bb => libgcc_11.3.bb}    |   0
 ...ibgfortran_11.2.bb => libgfortran_11.3.bb} |   0
 meta/recipes-devtools/rust/rust-common.inc    |  38 +--
 .../rust/rust-cross-canadian-common.inc       |   1 -
 meta/recipes-graphics/mesa/mesa.inc           |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   4 +
 .../libpcre/libpcre2/CVE-2022-1586.patch      |  58 ----
 .../{libpcre2_10.39.bb => libpcre2_10.40.bb}  |   5 +-
 .../libseccomp/libseccomp_2.5.3.bb            |   4 +
 .../recipes-support/libxslt/libxslt_1.1.35.bb |   4 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 74 files changed, 634 insertions(+), 1098 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.3.bb => ncurses_6.3+20220423.bb} (77%)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning-1.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-fix-gcc12-warning.patch
 rename meta/recipes-devtools/gcc/{gcc-11.2.inc => gcc-11.3.inc} (58%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_11.2.bb => gcc-cross-canadian_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_11.2.bb => gcc-cross_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_11.2.bb => gcc-crosssdk_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_11.2.bb => gcc-runtime_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_11.2.bb => gcc-sanitizers_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_11.2.bb => gcc-source_11.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
 rename meta/recipes-devtools/gcc/gcc/{0004-64-bit-multilib-hack.patch => 0003-64-bit-multilib-hack.patch} (99%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
 rename meta/recipes-devtools/gcc/gcc/{0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch => 0004-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch} (91%)
 rename meta/recipes-devtools/gcc/gcc/{0009-cpp-honor-sysroot.patch => 0005-cpp-honor-sysroot.patch} (41%)
 rename meta/recipes-devtools/gcc/gcc/{0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch => 0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch} (81%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0007-gcc-Fix-argument-list-too-long-error.patch
 rename meta/recipes-devtools/gcc/gcc/{0014-libtool.patch => 0008-libtool.patch} (94%)
 rename meta/recipes-devtools/gcc/gcc/{0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch => 0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch} (95%)
 rename meta/recipes-devtools/gcc/gcc/{0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch => 0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch} (89%)
 rename meta/recipes-devtools/gcc/gcc/{0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch => 0011-Avoid-using-libdir-from-.la-which-usually-points-to-.patch} (92%)
 rename meta/recipes-devtools/gcc/gcc/{0019-Ensure-target-gcc-headers-can-be-included.patch => 0012-Ensure-target-gcc-headers-can-be-included.patch} (96%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
 rename meta/recipes-devtools/gcc/gcc/{0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch => 0013-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (93%)
 rename meta/recipes-devtools/gcc/gcc/{0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch => 0014-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (90%)
 rename meta/recipes-devtools/gcc/gcc/{0018-export-CPP.patch => 0015-Makefile.in-Ensure-build-CPP-CPPFLAGS-is-used-for-bu.patch} (79%)
 rename meta/recipes-devtools/gcc/gcc/{0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch => 0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch} (68%)
 rename meta/recipes-devtools/gcc/gcc/{0024-handle-sysroot-support-for-nativesdk-gcc.patch => 0017-handle-sysroot-support-for-nativesdk-gcc.patch} (98%)
 rename meta/recipes-devtools/gcc/gcc/{0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch => 0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (92%)
 rename meta/recipes-devtools/gcc/gcc/{0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch => 0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch} (40%)
 rename meta/recipes-devtools/gcc/gcc/{0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch => 0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (84%)
 rename meta/recipes-devtools/gcc/gcc/{0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch => 0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} (93%)
 rename meta/recipes-devtools/gcc/gcc/{0030-sync-gcc-stddef.h-with-musl.patch => 0022-sync-gcc-stddef.h-with-musl.patch} (97%)
 rename meta/recipes-devtools/gcc/gcc/{0033-Re-introduce-spe-commandline-options.patch => 0023-Re-introduce-spe-commandline-options.patch} (90%)
 rename meta/recipes-devtools/gcc/gcc/{0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch => 0024-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (94%)
 rename meta/recipes-devtools/gcc/gcc/{0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch => 0025-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (98%)
 rename meta/recipes-devtools/gcc/gcc/{0036-mingw32-Enable-operation_not_supported.patch => 0026-mingw32-Enable-operation_not_supported.patch} (93%)
 rename meta/recipes-devtools/gcc/gcc/{0037-libatomic-Do-not-enforce-march-on-aarch64.patch => 0027-libatomic-Do-not-enforce-march-on-aarch64.patch} (85%)
 rename meta/recipes-devtools/gcc/gcc/{0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch => 0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch} (81%)
 rename meta/recipes-devtools/gcc/gcc/{0001-Fix-install-path-of-linux64.h.patch => 0029-Fix-install-path-of-linux64.h.patch} (81%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0042-Fix-thread-stack-size-init.patch
 rename meta/recipes-devtools/gcc/{gcc_11.2.bb => gcc_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_11.2.bb => libgcc-initial_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_11.2.bb => libgcc_11.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_11.2.bb => libgfortran_11.3.bb} (100%)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
 rename meta/recipes-support/libpcre/{libpcre2_10.39.bb => libpcre2_10.40.bb} (90%)

-- 
2.25.1

