Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sr1Ee-0007cs-Gv
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 08:26:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2012 23:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="167261161"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2012 23:14:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 23:14:55 -0700
Message-Id: <cover.1342505369.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [CONSOLIDATED PULL 00/45] Eglic, Automake (cover letter Only)
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
X-List-Received-Date: Tue, 17 Jul 2012 06:26:17 -0000

Richard,

I have continued to wokr on this get of changes from Khem and Nitin
and Ross.

I am OK with them at this point, I have done a variety of builds over
the weekend and beyond.

They will still need another QA pass and the only to get that
to happen is to get them into Master now and deal with any additional
fallout.

These should go in after the set I sent earlier today, as I had to 
tweak some of the patches.

Thanks

Sau!


The following changes since commit 7e88895c46ffa9b379c34035fb687b6f1ee15460:

  busybox: Include sys/resource.h for rusage definition (2012-07-16 08:36:58 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Khem Raj (20):
  coreutils: Fix build with eglibc 2.16
  diffutils: Fix build with eglibc 2.16
  udev: Fix build with eglibc 2.16
  gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16
  bison: Fix for gets being removed from eglibc 2.16
  grub,guile,cpio,tar,wget: Fix gnulib for absense of gets in eglibc
  boost: Upgrade recipe to 1.50.0
  valgrind: Fix build with eglibc 2.16
  libpam: Fix build with eglibc 2.16
  strace: Fix build on eglibc 2.16
  gcc: Convert do_headerfix into a definitive patch
  binutils: Backport the e5500/e6500 patches from mainline
  gcc: Refresh support for fsl E5500/E6500
  qemu: Explicitly add --disable-gl-accel when gl is not enabled
  lib/oe/sstatesig.py: Exclude git-native from sstate checksum
  gcc: Switch to git SRC_URI
  guile: Fix missing depends and broken arm build
  kernel.bbclass: Dont package kxgettext.o
  mkelfimage: Fix cross build
  eglibc: Add recipes for 2.16 release

Nitin A Kamble (23):
  automake: upgrade from 1.11.3 to 1.12.1
  jpeg: fix configure with automake 1.12.1
  gnutls: Fix build with automake 1.12.1
  pcmanfm: fix build with automake 1.12.x
  avahi: fix build with automake 1.12.1
  dates: fix build with automake 1.12.x
  librsvg: fix build with automake 1.12.x
  evolution-data-server: fix build with automake 1.12.x
  libgcrypt: fix build with automake 1.12.x
  telepathy-glib: fix build with automake 1.12.x
  xf86-video-vmware: fix build with automake 1.12.x
  libfm: fix build with automake 1.12.x
  pango: fix dependencies to avoid build issue
  libunistring: fix build with automake 1.12
  telepathy-python: fix build with automake 1.12
  libidn: fix build with automake 1.12
  webgit-gtk: fix build with automake 1.12.1
  gpgme: fix build with automake 1.12.x
  tar: fix build with automake 1.12.x
  gawk-3.1.5: fix build with automake 1.12.x
  sed-4.1.2: fix build with automake 1.12.x
  lame: fix build with automake 1.12.x
  gnutls: Fix build with automake 1.12.1

Ross Burton (2):
  webkit-gtk: add 1.8.1 recipe from tarball
  webkit-gtk: remove svn recipe

 meta/classes/kernel.bbclass                        |    2 +-
 meta/lib/oe/sstatesig.py                           |    6 +-
 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch  |   20 +
 meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    3 +-
 .../avahi/files/fix_for_automake_1.12.x.patch      |   34 +
 .../telepathy/telepathy-glib_0.19.2.bb             |    6 -
 .../telepathy-python_fix_for_automake_1.12.patch   |   26 +
 .../telepathy/telepathy-python_0.15.19.bb          |    5 +-
 .../coreutils/coreutils-8.14/remove-gets.patch     |   23 +
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    3 +-
 .../eglibc/cross-localedef-native_2.16.bb          |   44 +
 .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 ++
 .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
 .../eglibc_fix_findidx_parameters.patch            |   38 +
 .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
 .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
 .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 +
 .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
 .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
 .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 ++++++++
 .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 ++
 .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 ++
 .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 +
 .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 +
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
 meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
 meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 +++
 .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 +
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 .../jpeg/jpeg-8d/fix_for_automake_1.12.1.patch     |   44 +
 meta/recipes-core/jpeg/jpeg_8d.bb                  |    5 +-
 meta/recipes-core/udev/udev/include_resource.patch |   31 +
 meta/recipes-core/udev/udev_164.bb                 |    7 +-
 .../automake/automake/path_prog_fixes.patch        |   40 +-
 .../{automake_1.11.3.bb => automake_1.12.1.bb}     |    5 +-
 meta/recipes-devtools/binutils/binutils-2.22.inc   |    2 +-
 .../binutils/binutils/binutils-powerpc-e5500.patch |  918 +++++++++++++-
 .../recipes-devtools/bison/bison/remove-gets.patch |   20 +
 meta/recipes-devtools/bison/bison_2.5.bb           |    6 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   19 +-
 .../gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch         |  165 +++
 .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 ++
 .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 +++++++++++
 ...pc-e5500.patch => ppce5500-e6500-support.patch} |  560 ++++++---
 .../gcc/gcc-4.7/rs6000-tables.patch                |  135 ++
 meta/recipes-devtools/gcc/gcc-common.inc           |   18 -
 .../guile/files/arm_endianness.patch               |   23 +
 .../recipes-devtools/guile/files/remove-gets.patch |   23 +
 meta/recipes-devtools/guile/guile_2.0.5.bb         |    6 +-
 meta/recipes-devtools/m4/m4-1.4.16.inc             |    6 +-
 meta/recipes-devtools/m4/m4/remove-gets.patch      |   21 +
 .../mkelfimage/mkelfimage/cross-compile.patch      |   71 ++
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   17 -
 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb |   30 +
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 .../strace/strace-4.7/strace-eglibc-2.16.patch     |   52 +
 .../strace/strace-4.7/strace-x32.patch             |   88 ++
 meta/recipes-devtools/strace/strace_4.7.bb         |    7 +-
 .../valgrind-3.7.0/configure-with-glibc-2.16.patch |   32 +
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    4 +-
 .../augeas/augeas/remove-gets.patch                |   20 +
 meta/recipes-extended/augeas/augeas_0.10.0.bb      |    4 +-
 .../cpio/cpio-2.11/remove-gets.patch               |   20 +
 meta/recipes-extended/cpio/cpio_2.11.bb            |    5 +-
 .../diffutils/diffutils-3.2/remove-gets.patch      |   22 +
 meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 +-
 ...atch => gawk-3.1.5_fix_for_automake-1.12.patch} |    0
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    5 +-
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   25 +
 meta/recipes-extended/libidn/libidn_1.25.bb        |    5 +-
 .../pam/libpam/include-sys-resource.patch          |   12 +
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 +-
 .../sed-4.1.2_fix_for_automake-1.12.patch          |   37 +
 meta/recipes-extended/sed/sed_4.1.2.bb             |    5 +-
 .../tar/tar-1.26/remove-gets.patch                 |   20 +
 meta/recipes-extended/tar/tar.inc                  |    1 -
 meta/recipes-extended/tar/tar_1.26.bb              |    5 +-
 .../wget/wget-1.13.4/remove-gets.patch             |   23 +
 meta/recipes-extended/wget/wget_1.13.4.bb          |    3 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    8 +-
 meta/recipes-graphics/pango/pango.inc              |    2 +-
 .../xorg-driver/xf86-video-vmware_12.0.2.bb        |    5 -
 .../lame/lame-3.99.5_fix_for_automake-1.12.x.patch |   59 +
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |   14 +-
 .../avoid_automake_errors.patch                    |   83 ++
 .../fix_for_automake-1.12.x.patch                  |   28 +
 meta/recipes-sato/eds/evolution-data-server_git.bb |    4 +-
 .../files/pcmanfm_fix_for_automake_1.12.patch      |   35 +
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb        |    5 +-
 meta/recipes-sato/pimlico/dates_git.bb             |    6 +-
 meta/recipes-sato/webkit/files/GNUmakefile.am      |  280 -----
 meta/recipes-sato/webkit/files/Makefile            |   17 -
 meta/recipes-sato/webkit/files/Makefile.shared     |   18 -
 meta/recipes-sato/webkit/files/WebKit.pri          |  107 --
 meta/recipes-sato/webkit/files/WebKit.pro          |   21 -
 meta/recipes-sato/webkit/files/autogen.sh          |   23 -
 meta/recipes-sato/webkit/files/configure.ac        | 1315 --------------------
 .../recipes-sato/webkit/files/function-scope.patch |   21 -
 meta/recipes-sato/webkit/files/gtk-doc.make        |  173 ---
 meta/recipes-sato/webkit/files/no-gtkdoc.patch     |   20 +
 meta/recipes-sato/webkit/files/update-webkit.sh    |    8 -
 .../webgit-gtk_fix_build_with_automake_1.12.patch  |   62 +
 .../{webkit-gtk_svn.bb => webkit-gtk_1.8.1.bb}     |   33 +-
 .../boost/{boost_1.49.0.bb => boost_1.50.0.bb}     |    5 +-
 ..._MKDIR_P_warning_error_with_automake_1.12.patch |   51 +
 .../gnutls/gnutls_fix_for_automake_1.12.1.patch    |   43 +
 .../gnutls/gnutls/remove-gets.patch                |   41 +
 meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    5 +-
 meta/recipes-support/gpgme/gpgme_1.3.2.bb          |    6 +-
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    5 -
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 -
 .../libunistring_fix_for_automake_1.12.patch       |   81 ++
 .../libunistring/libunistring_0.9.3.bb             |    5 +-
 115 files changed, 5242 insertions(+), 2382 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.12.x.patch
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
 create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
 create mode 100644 meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
 create mode 100644 meta/recipes-core/udev/udev/include_resource.patch
 rename meta/recipes-devtools/automake/{automake_1.11.3.bb => automake_1.12.1.bb} (93%)
 create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/GLIBC_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
 rename meta/recipes-devtools/gcc/gcc-4.7/{powerpc-e5500.patch => ppce5500-e6500-support.patch} (41%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
 create mode 100644 meta/recipes-devtools/guile/files/arm_endianness.patch
 create mode 100644 meta/recipes-devtools/guile/files/remove-gets.patch
 create mode 100644 meta/recipes-devtools/m4/m4/remove-gets.patch
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage/cross-compile.patch
 delete mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
 create mode 100644 meta/recipes-devtools/mkelfimage/mkelfimage_svn.bb
 create mode 100644 meta/recipes-devtools/strace/strace-4.7/strace-eglibc-2.16.patch
 create mode 100644 meta/recipes-devtools/strace/strace-4.7/strace-x32.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-with-glibc-2.16.patch
 create mode 100644 meta/recipes-extended/augeas/augeas/remove-gets.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
 create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
 rename meta/recipes-extended/gawk/gawk-3.1.5/{gawk_fix_for_automake-1.12.patch => gawk-3.1.5_fix_for_automake-1.12.patch} (100%)
 create mode 100644 meta/recipes-extended/libidn/libidn/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch
 create mode 100644 meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-extended/tar/tar-1.26/remove-gets.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.patch
 create mode 100644 meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/avoid_automake_errors.patch
 create mode 100644 meta/recipes-sato/eds/evolution-data-server/fix_for_automake-1.12.x.patch
 create mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
 delete mode 100644 meta/recipes-sato/webkit/files/GNUmakefile.am
 delete mode 100644 meta/recipes-sato/webkit/files/Makefile
 delete mode 100644 meta/recipes-sato/webkit/files/Makefile.shared
 delete mode 100644 meta/recipes-sato/webkit/files/WebKit.pri
 delete mode 100644 meta/recipes-sato/webkit/files/WebKit.pro
 delete mode 100755 meta/recipes-sato/webkit/files/autogen.sh
 delete mode 100644 meta/recipes-sato/webkit/files/configure.ac
 delete mode 100644 meta/recipes-sato/webkit/files/function-scope.patch
 delete mode 100644 meta/recipes-sato/webkit/files/gtk-doc.make
 create mode 100644 meta/recipes-sato/webkit/files/no-gtkdoc.patch
 delete mode 100755 meta/recipes-sato/webkit/files/update-webkit.sh
 create mode 100644 meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
 rename meta/recipes-sato/webkit/{webkit-gtk_svn.bb => webkit-gtk_1.8.1.bb} (86%)
 rename meta/recipes-support/boost/{boost_1.49.0.bb => boost_1.50.0.bb} (53%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/avoid_AM_PROG_MKDIR_P_warning_error_with_automake_1.12.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/gnutls_fix_for_automake_1.12.1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch
 create mode 100644 meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch

-- 
1.7.7.6



