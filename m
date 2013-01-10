Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tt6ro-0006zB-LJ
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 02:23:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Jan 2013 17:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,440,1355126400"; d="scan'208";a="270266920"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.147])
	by orsmga002.jf.intel.com with ESMTP; 09 Jan 2013 17:08:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 17:08:21 -0800
Message-Id: <cover.1357779856.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [CONSOLIDATED PULL 00/43] Updates, fixes and groundwork for automake and eglibc
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
X-List-Received-Date: Thu, 10 Jan 2013 01:23:37 -0000


Richard,

This is a subset of patches that are pending on the list currently, 
mostly things build cleanly, there is a oprofile issue on PPC, that
I am digging into, but I do not beleive it's related to this patch
set.

This set includes patches for the upcoming Eglibc and automake updates.

I have build bits of wayland and systemd, but there are still some issues
that need to be resolved.

Thanks
	Sau!


The following changes since commit 0cfec10c4c7b0597f0e0c8f85539d901861a2f83:

  guile: add explicit dependency to avoid parallel build issue (2013-01-09 13:41:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bogdan Marinescu (6):
  python-smartpm: add dependency on python-pprint
  byacc: updated to 20121003
  nasm: updated to 2.10.07
  lsof: updated to 4.87
  lttng-2.0: components updated to version 2.1.0
  bdwgc: updated to version 7.2d

Chen Qi (1):
  rootfs_rpm.bbclass: export INSTALL_PLATFORM_EXTRA_RPM

Cristian Iorga (3):
  libtelepathy: python-native is now used during build
  telepathy-idle: upgrade to 0.1.14
  telepathy-mission-control: upgrade to 5.14.0

Giuseppe CONDORELLI (1):
  libpcre: change BUILD_CPPFLAGS and BUILD_CFLAGS values

Khem Raj (2):
  ofono: Fix build with eglibc 2.17
  udev: Fix build with eglibc 2.17

Laurentiu Palcu (3):
  qemu.bbclass: add qemu_run_binary() function
  gtk-immodules-cache.bbclass: allow for offline cache generation
  matchbox-keyboard: use the gtk-immodules-cache.bbclass

Marcin Juszkiewicz (1):
  gmp: add patch from upstream to unbreak AArch64

Marco Cavallini (1):
  kernel.bbclass: kernel_do_install fails with kernel <2.6.30

Marko Lindqvist (17):
  gettext: update to upstream version 0.18.2
  gettext-minimal: update files from gettext 0.18.2
  bluez-hcidump: updated to upstream version 2.5
  file: replace obsolete automake macros with working ones
  popt: disable tests
  glib-2.0: replace obsolete automake macros with working ones
  libx11: disable tests
  libpng: replace obsolete automake macros with working ones
  libusb: replace obsolete automake macros with working ones
  pixman: replace obsolete automake macros with working ones
  libid3tag: replace obsolete automake macros with working ones
  libgcrypt: replace obsolete automake macros with working ones
  gnutls: replace obsolete automake macros with working ones
  flac: replace obsolete automake macros with working ones
  pkg-config: replace obsolete automake macros with working ones
  harfbuzz: add recipe, version 0.9.10
  pango: update to upstream version 1.32.5

Noor Ahsan (1):
  cairo: Adds libxext in X11DEPENDS.

Otavio Salvador (1):
  libnl: Update to 3.2.18

Robert P. J. Day (1):
  kernel.bbclass: Define MODULE_IMAGE_BASE_NAME for layer convenience.

Ross Burton (4):
  pkgconfig: add -native script that uses the native sysroot instead of
    target
  musicbrainz: handle rebuilds
  mesa: bump to 9.0.1
  directfb: fix build against Mesa 9

Saul Wold (1):
  valgrind: update configure for eglibc 2.17

 meta/classes/gtk-immodules-cache.bbclass           |  17 +-
 meta/classes/kernel.bbclass                        |  10 +-
 meta/classes/qemu.bbclass                          |  17 +
 meta/classes/rootfs_rpm.bbclass                    |   2 +-
 .../{bluez-hcidump_2.4.bb => bluez-hcidump_2.5.bb} |   4 +-
 .../ofono/ofono/missing-ssize_t.patch              |  23 +
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |   3 +-
 .../telepathy/libtelepathy_0.3.3.bb                |   2 +-
 .../build-fix-for-make-j-safety.patch              |  39 --
 .../fix-svc-gtk-doc.h-target.patch                 |   0
 ...thy-idle_0.1.12.bb => telepathy-idle_0.1.14.bb} |  11 +-
 ...13.0.bb => telepathy-mission-control_5.14.0.bb} |  10 +-
 .../gettext/gettext-0.18.1.1/remove_gets.patch     |  58 --
 .../gnulib-uclibc-sched_param-def.patch            |   0
 .../parallel.patch                                 |   0
 .../wchar-uclibc.patch                             |   0
 .../gettext/gettext-minimal-0.18.1.1/aclocal.tgz   | Bin 36374 -> 0 bytes
 .../COPYING                                        |   0
 .../Makefile.in.in                                 |  19 +-
 .../Makevars.template                              |  12 +
 .../gettext/gettext-minimal-0.18.2/aclocal.tgz     | Bin 0 -> 37504 bytes
 .../config.rpath                                   | 106 ++--
 .../remove-potcdate.sin                            |   0
 ....18.1.1.bb => gettext-minimal-native_0.18.2.bb} |   2 +-
 .../{gettext_0.18.1.1.bb => gettext_0.18.2.bb}     |   7 +-
 .../glib-2.0/obsolete_automake_macros.patch        |  13 +
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   3 +-
 meta/recipes-core/udev/udev.inc                    |   3 +-
 meta/recipes-core/udev/udev_182.bb                 |   2 +-
 .../file/file/obsolete_automake_macros.patch       |  15 +
 meta/recipes-devtools/file/file_5.11.bb            |   3 +-
 .../nasm/{nasm_2.10.06.bb => nasm_2.10.07.bb}      |   4 +-
 .../pkgconfig-0.25/obsolete_automake_macros.patch  |  35 ++
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |  14 +-
 .../pkgconfig/pkgconfig/pkg-config-native.in       |   7 +
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  |   2 +-
 .../python/python-smartpm_1.4.1.bb                 |   4 +-
 ...2.16.patch => configure-with-newer-glibc.patch} |  18 +-
 meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |   4 +-
 .../byacc/{byacc_20120526.bb => byacc_20121003.bb} |   7 +-
 .../lsof/{lsof_4.86.bb => lsof_4.87.bb}            |   4 +-
 meta/recipes-graphics/cairo/cairo.inc              |   6 +-
 meta/recipes-graphics/directfb/directfb.inc        |   3 +-
 .../recipes-graphics/directfb/directfb/mesa9.patch |  29 +
 .../harfbuzz-0.9.10/disable_graphite.patch         |  15 +
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb  |  29 +
 meta/recipes-graphics/mesa/mesa-8.0.5.inc          |  18 -
 meta/recipes-graphics/mesa/mesa-9.0.1.inc          |  11 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   3 +-
 .../recipes-graphics/mesa/mesa-dri-glsl-native.inc |   7 -
 .../mesa/mesa-dri-glsl-native_8.0.5.bb             |  22 -
 .../mesa/{mesa-dri_8.0.5.bb => mesa-dri_9.0.1.bb}  |   0
 .../mesa/mesa/0001-Compile-with-uclibc.patch       |  52 --
 .../mesa/mesa/0003-fix-for-x32.patch               |  50 --
 ...-gross-hack-to-prevent-from-install-libgl.patch |  29 -
 meta/recipes-graphics/mesa/mesa/cross-glsl.patch   | 632 +++++++++++++++++++++
 .../pango/pango-1.30.1/multilib-fix-clean.patch    |  42 --
 .../pango/pango-1.32.5/multilib-fix-clean.patch    |  75 +++
 .../{pango-1.30.1 => pango-1.32.5}/no-tests.patch  |   0
 meta/recipes-graphics/pango/pango.inc              |   6 +-
 .../pango/{pango_1.30.1.bb => pango_1.32.5.bb}     |   4 +-
 .../xorg-lib/libx11/disable_tests.patch            |  17 +
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |   6 +-
 .../xorg-lib/pixman/obsolete_automake_macros.patch |  14 +
 meta/recipes-graphics/xorg-lib/pixman_0.28.2.bb    |   3 +-
 ...tng-modules_2.0.5.bb => lttng-modules_2.1.0.bb} |   6 +-
 .../{lttng-tools_2.0.4.bb => lttng-tools_2.1.0.bb} |   6 +-
 .../{lttng2-ust_2.0.5.bb => lttng2-ust_2.1.0.bb}   |   4 +-
 .../flac/flac-1.2.1/obsolete_automake_macros.patch |  14 +
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |   6 +-
 .../libid3tag/obsolete_automake_macros.patch       |  14 +
 .../libid3tag/libid3tag_0.15.1b.bb                 |   6 +-
 .../libpng-1.5.13/obsolete_automake_macros.patch   |  15 +
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb    |   6 +-
 .../musicbrainz/libmusicbrainz_git.bb              |   6 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |  18 +-
 .../bdwgc/{bdwgc_20110107.bb => bdwgc_7.2.bb}      |  14 +-
 .../gmp/gmp-5.1.0/187b7b1646ee.patch               |  44 ++
 meta/recipes-support/gmp/gmp_5.1.0.bb              |   1 +
 .../gnutls/gnutls/obsolete_automake_macros.patch   |  39 ++
 meta/recipes-support/gnutls/gnutls_2.12.21.bb      |   3 +-
 .../libgcrypt-1.5.0/obsolete_automake_macros.patch |  15 +
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb  |   4 +-
 .../libnl/libnl/fix-build-using-flex.patch         |  55 --
 .../libnl/libnl/fix-pktloc_syntax_h-race.patch     |   2 +-
 .../libnl/{libnl_3.2.16.bb => libnl_3.2.18.bb}     |   7 +-
 meta/recipes-support/libpcre/libpcre_8.32.bb       |   5 +-
 .../obsolete_automake_macros.patch                 |  15 +
 meta/recipes-support/libusb/libusb-compat_0.1.4.bb |   3 +-
 .../libusb1-1.0.9/obsolete_automake_macros.patch   |  15 +
 meta/recipes-support/libusb/libusb1_1.0.9.bb       |   6 +-
 meta/recipes-support/popt/popt/disable_tests.patch |  21 +
 meta/recipes-support/popt/popt_1.16.bb             |   3 +-
 93 files changed, 1375 insertions(+), 531 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.4.bb => bluez-hcidump_2.5.bb} (83%)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.12 => telepathy-idle-0.1.14}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.12.bb => telepathy-idle_0.1.14.bb} (67%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.13.0.bb => telepathy-mission-control_5.14.0.bb} (85%)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_gets.patch
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/gnulib-uclibc-sched_param-def.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/parallel.patch (100%)
 rename meta/recipes-core/gettext/{gettext-0.18.1.1 => gettext-0.18.2}/wchar-uclibc.patch (100%)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.1.1/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/Makefile.in.in (95%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/Makevars.template (76%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.2/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/config.rpath (92%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.18.1.1 => gettext-minimal-0.18.2}/remove-potcdate.sin (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.18.1.1.bb => gettext-minimal-native_0.18.2.bb} (98%)
 rename meta/recipes-core/gettext/{gettext_0.18.1.1.bb => gettext_0.18.2.bb} (96%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/file/file/obsolete_automake_macros.patch
 rename meta/recipes-devtools/nasm/{nasm_2.10.06.bb => nasm_2.10.07.bb} (81%)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig-0.25/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
 rename meta/recipes-devtools/valgrind/valgrind-3.7.0/{configure-with-glibc-2.16.patch => configure-with-newer-glibc.patch} (62%)
 rename meta/recipes-extended/byacc/{byacc_20120526.bb => byacc_20121003.bb} (73%)
 rename meta/recipes-extended/lsof/{lsof_4.86.bb => lsof_4.87.bb} (91%)
 create mode 100644 meta/recipes-graphics/directfb/directfb/mesa9.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.10/disable_graphite.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-8.0.5.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-9.0.1.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.5.bb
 rename meta/recipes-graphics/mesa/{mesa-dri_8.0.5.bb => mesa-dri_9.0.1.bb} (100%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
 delete mode 100644 meta/recipes-graphics/pango/pango-1.30.1/multilib-fix-clean.patch
 create mode 100644 meta/recipes-graphics/pango/pango-1.32.5/multilib-fix-clean.patch
 rename meta/recipes-graphics/pango/{pango-1.30.1 => pango-1.32.5}/no-tests.patch (100%)
 rename meta/recipes-graphics/pango/{pango_1.30.1.bb => pango_1.32.5.bb} (59%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/obsolete_automake_macros.patch
 rename meta/recipes-kernel/lttng-2.0/{lttng-modules_2.0.5.bb => lttng-modules_2.1.0.bb} (85%)
 rename meta/recipes-kernel/lttng-2.0/{lttng-tools_2.0.4.bb => lttng-tools_2.1.0.bb} (88%)
 rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_2.0.5.bb => lttng2-ust_2.1.0.bb} (93%)
 create mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.5.13/obsolete_automake_macros.patch
 rename meta/recipes-support/bdwgc/{bdwgc_20110107.bb => bdwgc_7.2.bb} (83%)
 create mode 100644 meta/recipes-support/gmp/gmp-5.1.0/187b7b1646ee.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt-1.5.0/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-build-using-flex.patch
 rename meta/recipes-support/libnl/{libnl_3.2.16.bb => libnl_3.2.18.bb} (87%)
 create mode 100644 meta/recipes-support/libusb/libusb-compat-0.1.4/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/popt/popt/disable_tests.patch

-- 
1.8.0.2



