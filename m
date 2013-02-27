Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UApZc-0001Eu-IK
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 23:34:22 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Feb 2013 14:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,750,1355126400"; d="scan'208";a="292741937"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2013 14:17:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:31 -0800
Message-Id: <cover.1362003285.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/40] Post-ELC Patches and Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 22:34:24 -0000

Richard,

Here is a batch of Updates and patches that I have reviewed
and build tested locally and Autobuilder.  The last build on
the autobuilder included the Kernel Update which is not included here.

Please take a look at Hongxu's -native CFLAGS fix, they have 
been discussed on the list. They seem correct and justified, 
but if you have a issue, please let us know.

Sau!

The following changes since commit 8e69f0ea42505e8f703893e18d73658b83d3b046:

  augeas: change SRC_URI (2013-02-26 08:01:20 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (3):
  e2fsprogs : upgrade to 1.42.7
  dbus-glib : upgrade to 1.100.2
  sudo : upgrade to 1.8.6p6

Constantin Musca (1):
  libassuan: upgrade to 2.1.0

Cristian Iorga (4):
  iproute2: upgraded to 3.8.0
  connman: enable connman client
  packagegroup-core-tools-testapps: connman-client added
  minicom: upgrade to 2.6.2

Emilia Ciobanu (1):
  distrodata: added some corner cases for svn and git repos

Hongxu Jia (5):
  glib-2.0-native:fix do_configure failed with gcc 4.3.4 on x86 host
  qemu-native:fix do_compile failed with gcc 4.3.4 on x86 host
  sstate-cache-management.sh: fix remove duplicate failed when multiple
    archs
  sstate-cache-management.sh:fix the incorrect usage of option `-d'
  sstate-cache-management.sh: don't hardcode available sstate_suffixes

Jessica Zhang (1):
  Add kernel arch variable in SDK environment variable list for
    supporting build external kernel module using SDK

Joe Slater (1):
  pull ldlinux.sys and isolinux.bin from correct places

Kang Kai (1):
  lsbtest: sync test suite packages version

Khem Raj (2):
  binutils: Fix build with newer texinfo 5.0+
  binutils: Delete recipes for 2.22

Laurentiu Palcu (1):
  gconf.bbclass: make postinstall fail silently when running offline

Martin Jansa (1):
  sanity: use lsb distro_identifier

MiLo (1):
  util-linux: Add package for libmount

Ming Liu (1):
  parted: fix several integer overflows

Muhammad Shakeel (2):
  archiver class: Use tasks with sstate instead of pre/post funcs
  archive-*-source.bbclass: Handle all package classes

Otavio Salvador (2):
  qt4-tools: Drop libx11 dependency when building without 'x11' distro
    feature
  qt4-embedded: Enable Linux Input support

Ross Burton (1):
  dbus: set correct address when using --address=systemd:

Saul Wold (11):
  sqlite: rename version to match upstream versioning change
  mini-x-session: Fix starting of x-session
  nspr: Update to 4.9.5
  socat: Update to 1.7.2.1
  boost: Update to 1.53.0
  man-pages: Update to 3.47
  lsbinitscripts: Update to 9.44
  file: Update to 5.13
  resolvconf: Update to 1.70
  kconfig-frontends: Update to 3.8
  gconf: update to 3.2.6

rongqing.li@windriver.com (1):
  gcc: make compiler to search build directory before standard system
    include directories

 meta/classes/archive-configured-source.bbclass     |    53 +-
 meta/classes/archive-original-source.bbclass       |    53 +-
 meta/classes/archive-patched-source.bbclass        |    53 +-
 meta/classes/archiver.bbclass                      |    40 +-
 meta/classes/distrodata.bbclass                    |     6 +-
 meta/classes/gconf.bbclass                         |    10 +-
 meta/classes/sanity.bbclass                        |     5 +-
 meta/classes/syslinux.bbclass                      |     6 +-
 meta/classes/toolchain-scripts.bbclass             |     5 +-
 meta/recipes-connectivity/connman/connman.inc      |     9 +-
 .../iproute2/iproute2/configure-cross.patch        |     6 +-
 .../{iproute2_3.7.0.bb => iproute2_3.8.0.bb}       |     4 +-
 .../{resolvconf_1.69.bb => resolvconf_1.70.bb}     |     4 +-
 .../socat/{socat_1.7.2.0.bb => socat_1.7.2.1.bb}   |    12 +-
 .../dbus/dbus-1.6.8/systemd-address.patch          |   187 +
 .../no-examples.patch                              |     0
 .../obsolete_automake_macros.patch                 |     0
 .../test-install-makefile.patch                    |     0
 meta/recipes-core/dbus/dbus-glib_0.100.2.bb        |     6 +
 meta/recipes-core/dbus/dbus-glib_0.100.bb          |     6 -
 meta/recipes-core/dbus/dbus.inc                    |     1 +
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |     5 +
 .../packagegroup-core-tools-testapps.bb            |     3 +-
 meta/recipes-core/util-linux/util-linux.inc        |     3 +
 meta/recipes-core/util-linux/util-linux_2.22.2.bb  |     2 +-
 meta/recipes-devtools/binutils/binutils-2.22.inc   |    51 -
 meta/recipes-devtools/binutils/binutils-2.23.1.inc |     4 +
 ...ls.texi-elfedit-Fix-use-of-itemx-in-table.patch |    68 +
 ...-Replace-with-when-it-is-part-of-the-text.patch |   196 +
 .../binutils/binutils-cross-canadian_2.22.bb       |     3 -
 .../binutils/binutils-cross_2.22.bb                |     3 -
 .../binutils/binutils-crosssdk_2.22.bb             |    14 -
 .../binutils/binutils-crosssdk_2.23.1.bb           |     3 -
 .../binutils/binutils/0001-PR-ld-13470.patch       |    82 -
 ...print_insn_micromips-Rename-local-variabl.patch |   634 -
 .../binutils/binutils/0019-PR-ld-13468.patch       |    46 -
 .../binutils/0028-Backport-from-mainline.patch     |   139 -
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |    47 -
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |   214 -
 ...19-Chung-Lin-Tang-cltang-codesourcery.com.patch |  1068 --
 ...elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch |    49 -
 .../binutils/binutils/0052-gas.patch               |    83 -
 ...55-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch |   176 -
 .../binutils/binutils/0078-PR-binutils-13622.patch |    48 -
 .../binutils/0144-timer.cc-include-unistd.h.patch  |    32 -
 ...-2012-04-27-Doug-Kwan-dougkwan-google.com.patch |   169 -
 .../binutils/binutils/0182-PR-ld-13991.patch       |  1617 --
 .../binutils/binutils-2.19.1-ld-sysroot.patch      |    39 -
 .../binutils/binutils/binutils-armv5e.patch        |    24 -
 .../binutils/binutils/binutils-poison.patch        |   255 -
 .../binutils/binutils/binutils-powerpc-e5500.patch |   936 -
 .../binutils/binutils/binutils-pr12366.patch       |   428 -
 .../binutils/binutils-uclibc-100-uclibc-conf.patch |    40 -
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    55 -
 ...binutils-uclibc-300-006_better_file_error.patch |    45 -
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    49 -
 .../binutils/binutils-uclibc-gas-needs-libm.patch  |    38 -
 .../binutils/binutils-x86_64_i386_biarch.patch     |    29 -
 .../binutils/binutils/clone-shadow.patch           |    79 -
 .../binutils/binutils/libiberty_path_fix.patch     |    22 -
 .../binutils/binutils/libtool-2.4-update.patch     | 18705 -------------------
 .../binutils/binutils/libtool-rpath-fix.patch      |    39 -
 .../binutils/mips64-default-ld-emulation.patch     |    49 -
 .../binutils/binutils/relocatable_sdk.patch        |    49 -
 .../binutils/binutils/rpath-sysroot.patch          |    38 -
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    35 -
 .../acinclude.m4                                   |     0
 .../fallocate.patch                                |     0
 .../mkdir.patch                                    |     0
 .../remove.ldconfig.call.patch                     |     0
 .../{e2fsprogs_1.42.6.bb => e2fsprogs_1.42.7.bb}   |     4 +-
 .../file/{file_5.12.bb => file_5.13.bb}            |     4 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |     2 +-
 meta/recipes-devtools/gcc/gcc_4.7.bb               |     2 +-
 ...frontends_3.6.bb => kconfig-frontends_3.8.0.bb} |    11 +-
 meta/recipes-devtools/qemu/qemu.inc                |     5 +
 ...binitscripts_9.43.bb => lsbinitscripts_9.44.bb} |     8 +-
 meta/recipes-extended/lsb/lsbtest/packages_list    |    10 +-
 meta/recipes-extended/lsb/lsbtest_1.0.bb           |     2 +-
 .../{man-pages_3.45.bb => man-pages_3.47.bb}       |     4 +-
 .../minicom/minicom-2.6.1/gcc4-scope.patch         |    46 -
 .../minicom_fix_for_automake-1.12.patch            |    21 -
 .../rename-conflicting-functions.patch             |    15 -
 .../minicom/{minicom_2.6.1.bb => minicom_2.6.2.bb} |    12 +-
 .../parted/parted-3.1/fix-dvh-overflows.patch      |    35 +
 meta/recipes-extended/parted/parted_3.1.bb         |     5 +-
 .../sudo/{sudo_1.8.6p4.bb => sudo_1.8.6p6.bb}      |     4 +-
 .../gconf-3.2.5/obsolete_automake_macros.patch     |    14 -
 .../remove_plus_from_invalid_characters_list.patch |     0
 .../gnome/{gconf_3.2.5.bb => gconf_3.2.6.bb}       |     9 +-
 .../mini-x-session/files/mini-x-session            |     5 +-
 .../mini-x-session/mini-x-session_0.1.bb           |     2 +
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |     4 +-
 meta/recipes-qt/qt4/qt4-embedded.inc               |     2 +-
 .../boost/{boost_1.52.0.bb => boost_1.53.0.bb}     |     4 +-
 .../files/libassuan-add-pkgconfig-support.patch    |    44 +-
 .../{libassuan_2.0.3.bb => libassuan_2.1.0.bb}     |     6 +-
 .../nspr/{nspr_4.9.4.bb => nspr_4.9.5.bb}          |    10 +-
 .../{sqlite3_3.7.15.2.bb => sqlite3_3071502.bb}    |     6 +-
 scripts/sstate-cache-management.sh                 |    17 +-
 100 files changed, 822 insertions(+), 25670 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.7.0.bb => iproute2_3.8.0.bb} (64%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.69.bb => resolvconf_1.70.bb} (88%)
 rename meta/recipes-connectivity/socat/{socat_1.7.2.0.bb => socat_1.7.2.1.bb} (73%)
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.8/systemd-address.patch
 rename meta/recipes-core/dbus/{dbus-glib-0.100 => dbus-glib-0.100.2}/no-examples.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100 => dbus-glib-0.100.2}/obsolete_automake_macros.patch (100%)
 rename meta/recipes-core/dbus/{dbus-glib-0.100 => dbus-glib-0.100.2}/test-install-makefile.patch (100%)
 create mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.2.bb
 delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.bb
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.22.inc
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
 delete mode 100644 meta/recipes-devtools/binutils/binutils-cross_2.22.bb
 delete mode 100644 meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-PR-ld-13470.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0006-mips-dis.c-print_insn_micromips-Rename-local-variabl.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0019-PR-ld-13468.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0028-Backport-from-mainline.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0035-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0036-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0037-2011-12-19-Chung-Lin-Tang-cltang-codesourcery.com.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0039-emulparams-elf32bmip.sh-OTHER_SECTIONS-Put-.mdebug.-.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0052-gas.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0055-Remove-ABI_64_P-check-on-R_X86_64_PCXX.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0078-PR-binutils-13622.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0144-timer.cc-include-unistd.h.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0166-2012-04-27-Doug-Kwan-dougkwan-google.com.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0182-PR-ld-13991.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-2.19.1-ld-sysroot.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-poison.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-pr12366.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/binutils-x86_64_i386_biarch.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/clone-shadow.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/relocatable_sdk.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/rpath-sysroot.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils_2.22.bb
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/acinclude.m4 (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/fallocate.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/mkdir.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42.6 => e2fsprogs-1.42.7}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.6.bb => e2fsprogs_1.42.7.bb} (93%)
 rename meta/recipes-devtools/file/{file_5.12.bb => file_5.13.bb} (86%)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.6.bb => kconfig-frontends_3.8.0.bb} (84%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.43.bb => lsbinitscripts_9.44.bb} (77%)
 rename meta/recipes-extended/man-pages/{man-pages_3.45.bb => man-pages_3.47.bb} (82%)
 delete mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/gcc4-scope.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/rename-conflicting-functions.patch
 rename meta/recipes-extended/minicom/{minicom_2.6.1.bb => minicom_2.6.2.bb} (61%)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.6p4.bb => sudo_1.8.6p6.bb} (84%)
 delete mode 100644 meta/recipes-gnome/gnome/gconf-3.2.5/obsolete_automake_macros.patch
 rename meta/recipes-gnome/gnome/{gconf-3.2.5 => gconf}/remove_plus_from_invalid_characters_list.patch (100%)
 rename meta/recipes-gnome/gnome/{gconf_3.2.5.bb => gconf_3.2.6.bb} (89%)
 rename meta/recipes-support/boost/{boost_1.52.0.bb => boost_1.53.0.bb} (52%)
 rename meta/recipes-support/libassuan/{libassuan_2.0.3.bb => libassuan_2.1.0.bb} (73%)
 rename meta/recipes-support/nspr/{nspr_4.9.4.bb => nspr_4.9.5.bb} (92%)
 rename meta/recipes-support/sqlite/{sqlite3_3.7.15.2.bb => sqlite3_3071502.bb} (63%)

-- 
1.8.0.2



