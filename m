Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC88-0007hH-1Y
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173231"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:41 -0700
Message-Id: <cover.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/17] Misc Fixes & Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Jun 2012 22:15:05 -0000

Richard,

I have build and done simple testing on these changes

Thanks
	Sau!


The following changes since commit e2cc4a44d510e0d473d15f207c1c886db6a5ccf7:

  [PATCH] guile: fix compilation on MIPS/PPC (2012-06-21 13:41:12 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (1):
  mtd-utils: do not stage headers in sysroot

Darren Hart (1):
  cml1.bbclass: Only delay exit if the command fails

Kang Kai (1):
  runqemu-internal: qemu fails to run on ext2 image

Khem Raj (8):
  gcc-4.6: Retire into toochain-layer
  eglibc-2.13: Retire into toolchain layer
  gcc: Remove csl gcc recipes
  kconfig-frontends: New recipe
  uclibc: Fix packaging to match the new package order
  qemu.inc: Fix packageconfig options
  qemu-git: Move to tip of git
  qemu_git: set empty PACKAGECONFIG

Paul Gortmaker (1):
  linux-firmware: update to main repo on kernel.org

Richard Purdie (1):
  bitbake.conf/abi_version.conf: Update to use BasicHash signature
    generator

Saul Wold (1):
  distrodata: Fix missed VARIABLE name change

Scott Garman (2):
  gzip: upgrade to 1.5
  sudo: upgrade to 1.8.5p2

Valentin Popa (1):
  gpgme: updated to 1.3.2

 meta/classes/cml1.bbclass                          |    2 +-
 meta/classes/distrodata.bbclass                    |    2 +-
 meta/conf/abi_version.conf                         |    2 +-
 meta/conf/bitbake.conf                             |    2 +-
 .../eglibc/cross-localedef-native_2.13.bb          |   43 -
 .../eglibc/eglibc-2.13/IO-acquire-lock-fix.patch   |   17 -
 .../eglibc-2.13/armv4-eabi-compile-fix.patch       |   25 -
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 -
 .../eglibc/eglibc-2.13/generate-supported.mk       |   11 -
 .../eglibc/eglibc-2.13/ld-search-order.patch       |   56 -
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |   26 -
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   17 -
 .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 ----
 .../eglibc/eglibc-2.13/stack-protector-test.patch  |   35 -
 .../eglibc-2.13/use-sysroot-cxx-headers.patch      |   36 -
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    6 -
 meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |    1 -
 meta/recipes-core/eglibc/eglibc_2.13.bb            |  218 --
 meta/recipes-core/uclibc/uclibc.inc                |   28 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |  119 -
 .../gcc/gcc-4.6/100-uclibc-conf.patch              |   39 -
 .../gcc/gcc-4.6/103-uclibc-conf-noupstream.patch   |   17 -
 .../gcc/gcc-4.6/200-uclibc-locale.patch            | 2842 --------------------
 .../gcc/gcc-4.6/203-uclibc-locale-no__x.patch      |  235 --
 .../gcc/gcc-4.6/204-uclibc-locale-wchar_fix.patch  |   54 -
 .../gcc/gcc-4.6/205-uclibc-locale-update.patch     |  521 ----
 .../gcc/gcc-4.6/301-missing-execinfo_h.patch       |   15 -
 .../gcc/gcc-4.6/302-c99-snprintf.patch             |   15 -
 .../gcc/gcc-4.6/303-c99-complex-ugly-hack.patch    |   16 -
 .../gcc/gcc-4.6/304-index_macro.patch              |   30 -
 .../gcc/gcc-4.6/305-libmudflap-susv3-legacy.patch  |   51 -
 .../gcc/gcc-4.6/306-libstdc++-namespace.patch      |   40 -
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   68 -
 .../gcc/gcc-4.6/740-sh-pr24836.patch               |   31 -
 .../gcc/gcc-4.6/800-arm-bigendian.patch            |   36 -
 .../gcc/gcc-4.6/904-flatten-switch-stmt-00.patch   |   76 -
 .../gcc/gcc-4.6/COLLECT_GCC_OPTIONS.patch          |   25 -
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |  186 --
 .../gcc/gcc-4.6/arm-nolibfloat.patch               |   26 -
 .../gcc/gcc-4.6/arm-softfloat.patch                |   18 -
 .../gcc/gcc-4.6/cache-amnesia.patch                |   33 -
 .../gcc/gcc-4.6/cpp-honour-sysroot.patch           |   40 -
 .../gcc/gcc-4.6/disable_relax_pic_calls_flag.patch |   48 -
 .../gcc/gcc-4.6/fix-for-ice-50099.patch            |   49 -
 .../gcc/gcc-4.6/fortran-cross-compile-hack.patch   |   32 -
 .../gcc-4.6/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch  |   33 -
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  116 -
 .../gcc/gcc-4.6/gcc-argument-list-too-long.patch   |   33 -
 .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |   35 -
 .../gcc/gcc-4.6/gcc-flags-for-build.patch          |  189 --
 .../gcc/gcc-4.6/gcc-poison-dir-extend.patch        |   27 -
 .../gcc-4.6/gcc-poison-system-directories.patch    |  223 --
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   72 -
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |  196 --
 .../gcc/gcc-4.6/mips64-default-n64.patch           |   32 -
 .../gcc/gcc-4.6/optional_libstdc.patch             |   86 -
 .../gcc/gcc-4.6/powerpc-e5500.patch                |  465 ----
 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |   72 -
 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch    |  393 ---
 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch    |   64 -
 .../gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch |   80 -
 .../gcc/gcc-4.6/zecke-xgcc-cpp.patch               |   30 -
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |   23 -
 meta/recipes-devtools/gcc/gcc-cross-initial_4.6.bb |    2 -
 .../gcc/gcc-cross-initial_csl-arm-2008q1.bb        |   10 -
 .../gcc/gcc-cross-intermediate_4.6.bb              |    3 -
 .../gcc/gcc-cross-intermediate_csl-arm-2008q1.bb   |   10 -
 meta/recipes-devtools/gcc/gcc-cross-kernel.inc     |   19 -
 meta/recipes-devtools/gcc/gcc-cross_4.6.bb         |    8 -
 .../gcc/gcc-cross_csl-arm-2008q1.bb                |   24 -
 .../gcc/gcc-crosssdk-initial_4.6.bb                |    2 -
 .../gcc/gcc-crosssdk-intermediate_4.6.bb           |    3 -
 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.bb      |    2 -
 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc   |   22 -
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |   53 -
 .../gcc/gcc-csl-arm/arm-nolibfloat.patch           |   25 -
 .../gcc/gcc-csl-arm/arm-softfloat.patch            |   17 -
 .../gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch |   13 -
 .../gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch   |   30 -
 .../gcc/gcc-csl-arm/gcc-configure-no-fortran.patch | 1076 --------
 .../gcc/gcc-csl-arm/gcc-new-makeinfo.patch         |   36 -
 .../gcc/gcc-csl-arm/gcc41-configure.in.patch       |   24 -
 .../gcc/gcc-csl-arm/gcc_optab_arm.patch            |   97 -
 .../gcc/gcc-csl-arm/gfortran.patch                 |   42 -
 .../gcc/gcc-csl-arm/zecke-no-host-includes.patch   |   33 -
 .../gcc/gcc-csl-arm/zecke-xgcc-cpp.patch           |   17 -
 meta/recipes-devtools/gcc/gcc-runtime_4.6.bb       |    8 -
 meta/recipes-devtools/gcc/gcc_4.6.bb               |    5 -
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    3 -
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   71 -
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   28 +
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    6 +-
 .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |   19 +-
 meta/recipes-extended/gzip/gzip.inc                |    7 +-
 meta/recipes-extended/gzip/gzip_1.4.bb             |   10 -
 meta/recipes-extended/gzip/gzip_1.5.bb             |   10 +
 meta/recipes-extended/sudo/sudo.inc                |    2 +-
 .../sudo/{sudo_1.8.4p4.bb => sudo_1.8.5p2.bb}      |    6 +-
 .../linux-firmware/linux-firmware_git.bb           |   10 +-
 .../disable_gpgconf_check.patch                    |    0
 .../gpgme/{gpgme_1.3.1.bb => gpgme_1.3.2.bb}       |    8 +-
 scripts/runqemu-internal                           |    2 +-
 104 files changed, 84 insertions(+), 9598 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.13.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/etc/ld.so.conf
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/generate-supported.mk
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ld-search-order.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.13.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.13.bb
 delete mode 100644 meta/recipes-core/eglibc/eglibc_2.13.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/100-uclibc-conf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/103-uclibc-conf-noupstream.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/200-uclibc-locale.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/203-uclibc-locale-no__x.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/204-uclibc-locale-wchar_fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/205-uclibc-locale-update.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/301-missing-execinfo_h.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/302-c99-snprintf.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/303-c99-complex-ugly-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/304-index_macro.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/305-libmudflap-susv3-legacy.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/306-libstdc++-namespace.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/740-sh-pr24836.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/800-arm-bigendian.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/904-flatten-switch-stmt-00.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/COLLECT_GCC_OPTIONS.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/arm-nolibfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/arm-softfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/cache-amnesia.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/cpp-honour-sysroot.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/disable_relax_pic_calls_flag.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fix-for-ice-50099.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/fortran-cross-compile-hack.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-dir-extend.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-uclibc-locale-ctype_touplow_t.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n64.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/optional_libstdc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/powerpc-e5500.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/use-defaults.h-and-t-oe-in-B.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/zecke-xgcc-cpp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-kernel.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/arm-nolibfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/arm-softfloat.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-eabi-bigendian.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-3.4.4-makefile-fix.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-configure-no-fortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc-new-makeinfo.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc41-configure.in.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gcc_optab_arm.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/gfortran.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/zecke-no-host-includes.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-csl-arm/zecke-xgcc-cpp.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc_4.6.bb
 delete mode 100644 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/gcc/libgcc_4.6.bb
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
 delete mode 100644 meta/recipes-extended/gzip/gzip_1.4.bb
 create mode 100644 meta/recipes-extended/gzip/gzip_1.5.bb
 rename meta/recipes-extended/sudo/{sudo_1.8.4p4.bb => sudo_1.8.5p2.bb} (83%)
 rename meta/recipes-support/gpgme/{gpgme-1.3.1 => gpgme-1.3.2}/disable_gpgconf_check.patch (100%)
 rename meta/recipes-support/gpgme/{gpgme_1.3.1.bb => gpgme_1.3.2.bb} (83%)

-- 
1.7.7.6



