Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C18265FBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 06:11:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 May 2014 23:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,994,1389772800"; d="scan'208";a="534137092"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2014 23:11:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 23:11:52 -0700
Message-Id: <cover.1399356519.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/30] Updates and Patches
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
X-List-Received-Date: Tue, 06 May 2014 06:11:53 -0000

Richard,

This is the set of patches that we have been testing for
the last few days, it includes a kernel update, the GCC 4.9 
update, but not the bump to to use it yet.

There are a number of package updates and ptest enablements also.

Beth hopes to run the update version for Master Week in the pacific
time morning.

Thanks
	Sau!


The following changes since commit 2f922357287129f7d216393531886ed1f3ce8185:

  cleanup-workdir: Fix crosssdk reference after addition of PN (2014-05-05 09:05:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (6):
  kernel-yocto: quote kconfig mode check
  linux-yocto-custom: provide defconfig guidance
  linux-yocto/3.4: update to v3.4.88
  linux-yocto/3.10: update to v3.10.38
  linux-yocto/3.14: update to v3.14.2
  linux-yocto/3.10: mei.cfg: enable Intel chipsets

Cristian Iorga (2):
  taglib: upgrade to 1.9.1
  linux-firmware: upgrade to commit
    dec41bce44e0dff6a2c3358a958fadf22bf58858

Fathi Boudra (2):
  grub git: update to latest git (grub-2.02-beta2-81-g4b8b913)
  systemtap: update to 2.5 release

Joel Fernandes (1):
  serial-getty service: Add xterm as default TERM

Khem Raj (9):
  gcc: Add 4.9 recipes
  cairo: Fix build with gcc 4.9
  binutils: Fix building nativesdk binutils with gcc 4.9
  systemd: Fix build with gcc 4.9
  oprofile: Update to 0.9.9
  gstreamer1.0,gstreamer: Use -msse2 for x86 platforms
  mdadm: Fix build on gcc 4.9
  lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
  procps: Do not detect 32/64 bit compiler options

Koen Kooi (2):
  xdg-utils: reinstall xdg-terminal
  xinput-calibrator: fix XDG launch

Martin Jansa (2):
  defaultsetup: enable blacklist by default
  qt4: Explicitly disable sqlite2

Maxin B. John (1):
  gdbm: enable ptest support

Ming Liu (1):
  ldconfig-native: also default to lib32 and lib64 directories

Saul Wold (1):
  libgcrypt: update to 1.6.1

Valentin Popa (3):
  nettle: add nettle to oe-core
  gnutls: update to 3.2.13
  wpa-supplicant: add libgcrypt as a dependencie

 .../recipes-kernel/linux/linux-yocto-custom.bb     |   10 +
 meta/classes/kernel-yocto.bbclass                  |    2 +-
 meta/conf/distro/defaultsetup.conf                 |    3 +-
 meta/recipes-bsp/grub/grub_git.bb                  |    2 +-
 .../wpa-supplicant/wpa-supplicant.inc              |    2 +-
 .../ldconfig-default-to-all-multilib-dirs.patch    |   37 +
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |    4 +-
 .../systemd-serialgetty/serial-getty@.service      |    3 +-
 meta/recipes-core/systemd/systemd_211.bb           |    3 +
 meta/recipes-devtools/binutils/binutils-2.24.inc   |    2 +
 ...ild-breakage-from-bfd_set_section_vma-cha.patch |   31 +
 .../replace_macros_with_static_inline.patch        |  188 ++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  134 +
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
 .../gcc/gcc-4.9/0002-uclibc-conf.patch             |   53 +
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
 .../gcc/gcc-4.9/0004-uclibc-locale.patch           | 2862 ++++++++++++++++++++
 .../gcc/gcc-4.9/0005-uclibc-locale-no__x.patch     |  257 ++
 .../gcc/gcc-4.9/0006-uclibc-locale-wchar_fix.patch |   68 +
 .../gcc/gcc-4.9/0007-uclibc-locale-update.patch    |  542 ++++
 .../gcc/gcc-4.9/0008-missing-execinfo_h.patch      |   28 +
 .../gcc/gcc-4.9/0009-c99-snprintf.patch            |   28 +
 .../gcc/gcc-4.9/0010-c99-complex-ugly-hack.patch   |   29 +
 .../gcc/gcc-4.9/0011-index_macro.patch             |   44 +
 .../gcc/gcc-4.9/0013-libstdc-namespace.patch       |   54 +
 .../gcc/gcc-4.9/0014-sh-pr24836.patch              |   45 +
 ...GET_ENDIAN_OPTION-for-determining-MULTILI.patch |   39 +
 .../0016-gcc-poison-system-directories.patch       |  190 ++
 .../gcc/gcc-4.9/0017-gcc-poison-dir-extend.patch   |   39 +
 .../0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
 .../gcc/gcc-4.9/0019-64-bit-multilib-hack.patch    |   82 +
 .../gcc/gcc-4.9/0020-optional-libstdc.patch        |   98 +
 ...0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
 .../gcc/gcc-4.9/0022-COLLECT_GCC_OPTIONS.patch     |   38 +
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   88 +
 .../gcc/gcc-4.9/0024-PR-target-32219.patch         |   62 +
 .../gcc-4.9/0025-fortran-cross-compile-hack.patch  |   46 +
 .../gcc/gcc-4.9/0026-libgcc-sjlj-check.patch       |   74 +
 .../gcc/gcc-4.9/0027-cpp-honor-sysroot.patch       |   54 +
 .../gcc-4.9/0028-MIPS64-Default-to-N64-ABI.patch   |   31 +
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  209 ++
 ...0030-gcc-Fix-argument-list-too-long-error.patch |   40 +
 .../gcc/gcc-4.9/0031-Disable-sdt.patch             |  113 +
 .../gcc/gcc-4.9/0032-libtool.patch                 |   42 +
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   40 +
 ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
 .../gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch         |   66 +
 .../gcc/gcc-4.9/0040-fix-g++-sysroot.patch         |   40 +
 .../gcc/gcc-4.9/0041-libtool-avoid-libdir.patch    |   19 +
 meta/recipes-devtools/gcc/gcc-4.9/0043-cpp.patch   |   40 +
 .../gcc/gcc-4.9/0044-gengtypes.patch               |   97 +
 .../gcc/gcc-4.9/0046-libatomic-deptracking.patch   |   41 +
 .../gcc/gcc-4.9/0047-repomembug.patch              |   53 +
 ...AltiVec-generation-on-powepc-linux-target.patch |   42 +
 ...Use-dbx_reg_number-for-spanning-registers.patch |   80 +
 .../gcc/gcc-4.9/0051-eabispe.patch                 |   23 +
 .../recipes-devtools/gcc/gcc-cross-canadian_4.9.bb |    5 +
 meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb |    2 +
 meta/recipes-devtools/gcc/gcc-cross_4.9.bb         |    3 +
 .../gcc/gcc-crosssdk-initial_4.9.bb                |    3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_4.9.bb      |    2 +
 meta/recipes-devtools/gcc/gcc-runtime_4.9.bb       |    3 +
 meta/recipes-devtools/gcc/gcc_4.9.bb               |    7 +
 meta/recipes-devtools/gcc/libgcc-initial_4.9.bb    |    2 +
 meta/recipes-devtools/gcc/libgcc_4.9.bb            |    2 +
 meta/recipes-devtools/gcc/libgfortran_4.9.bb       |    3 +
 meta/recipes-extended/mdadm/files/gcc-4.9.patch    |   22 +
 meta/recipes-extended/mdadm/mdadm_3.3.bb           |    3 +-
 .../procps/procps-3.2.8/detect_bitness.patch       |   26 +
 meta/recipes-extended/procps/procps_3.2.8.bb       |    1 +
 .../xdg-utils/0001-Reinstate-xdg-terminal.patch    |  672 +++++
 .../xdg-utils/xdg-utils_1.1.0-rc1.bb               |    5 +-
 meta/recipes-graphics/cairo/cairo.inc              |    2 +
 .../xinput-calibrator/xinput-calibrator_git.bb     |    4 +
 .../linux-firmware/linux-firmware_git.bb           |   27 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |    8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |   18 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |   18 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 +-
 .../lttng/lttng-modules/fixup_block_driver.patch   |  122 +
 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |    4 +-
 meta/recipes-kernel/oprofile/oprofile.inc          |    6 +-
 ...-events-to-be-specified-with-or-without-_.patch |  208 --
 ...igure-to-look-for-libpfm4-function-first-.patch |   49 -
 ...pecific-libpfm-usage-so-it-doesn-t-break-.patch |  132 -
 ...igure-to-handle-architectures-that-do-not.patch |  163 --
 ...y-perf_events-kernel-without-PERF_RECORD_.patch |  107 -
 ...esn-t-build-for-32-bit-ppc-the-operf_util.patch |   32 -
 .../0001-Tidy-powerpc64-bfd-target-check.patch     |  123 +
 ...p-lists-events-Fix-doc-URL-for-ppc64-arch.patch |   36 -
 .../oprofile/oprofile-no-query-modules.patch       |   29 -
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |   22 -
 meta/recipes-kernel/oprofile/oprofile_0.9.9.bb     |   15 +
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    2 +-
 .../gstreamer/gst-plugins-base_0.10.36.bb          |    2 +
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    2 +
 meta/recipes-qt/qt4/qt4.inc                        |    2 +-
 meta/recipes-support/gdbm/files/ptest.patch        |   36 +
 meta/recipes-support/gdbm/files/run-ptest          |    7 +
 meta/recipes-support/gdbm/gdbm_1.11.bb             |   13 +-
 meta/recipes-support/gnutls/gnutls.inc             |   28 +-
 .../gnutls/gnutls/25_updatedgdocfrommaster.diff    |  636 -----
 .../CVE-2014-0092-corrected-return-codes.patch     |  106 -
 ...14-1959-rejection-of-v1-intermediate-cert.patch |   33 -
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   51 -
 .../gnutls/gnutls/configure-fix.patch              |   65 -
 .../correct_rpl_gettimeofday_signature.patch       |   36 +-
 .../gnutls/gnutls/fix-gettext-version.patch        |   46 -
 .../gnutls/gnutls/gnutls-openssl.patch             |  126 -
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   16 -
 meta/recipes-support/gnutls/gnutls_3.2.13.bb       |    7 +
 meta/recipes-support/libgcrypt/libgcrypt_1.5.3.bb  |    4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb  |    4 +
 meta/recipes-support/nettle/nettle_2.7.1.bb        |   24 +
 .../taglib/{taglib_1.8.bb => taglib_1.9.1.bb}      |   14 +-
 120 files changed, 7802 insertions(+), 1974 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/replace_macros_with_static_inline.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0002-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0003-gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0004-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0005-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0006-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0007-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0008-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0009-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0010-c99-complex-ugly-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0011-index_macro.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0013-libstdc-namespace.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0014-sh-pr24836.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0015-arm-Use-TARGET_ENDIAN_OPTION-for-determining-MULTILI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0016-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0017-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0018-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0019-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0020-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0021-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0022-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0023-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0024-PR-target-32219.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0025-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0026-libgcc-sjlj-check.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0027-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0028-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0029-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0030-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0031-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0032-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0040-fix-g++-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0041-libtool-avoid-libdir.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0043-cpp.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0044-gengtypes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0046-libatomic-deptracking.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0047-repomembug.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0050-Revert-Use-dbx_reg_number-for-spanning-registers.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0051-eabispe.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_4.9.bb
 create mode 100644 meta/recipes-devtools/gcc/libgfortran_4.9.bb
 create mode 100644 meta/recipes-extended/mdadm/files/gcc-4.9.patch
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/detect_bitness.patch
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Allow-ppc64-events-to-be-specified-with-or-without-_.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Change-configure-to-look-for-libpfm4-function-first-.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-PPC64-specific-libpfm-usage-so-it-doesn-t-break-.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-up-configure-to-handle-architectures-that-do-not.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Handle-early-perf_events-kernel-without-PERF_RECORD_.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-OProfile-doesn-t-build-for-32-bit-ppc-the-operf_util.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Tidy-powerpc64-bfd-target-check.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-ophelp-lists-events-Fix-doc-URL-for-ppc64-arch.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-no-query-modules.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
 create mode 100644 meta/recipes-kernel/oprofile/oprofile_0.9.9.bb
 create mode 100644 meta/recipes-support/gdbm/files/ptest.patch
 create mode 100755 meta/recipes-support/gdbm/files/run-ptest
 delete mode 100644 meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/configure-fix.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/fix-gettext-version.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/gnutls-openssl.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.23.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.2.13.bb
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.5.3.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.1.bb
 create mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb
 rename meta/recipes-support/taglib/{taglib_1.8.bb => taglib_1.9.1.bb} (64%)

-- 
1.8.3.1


