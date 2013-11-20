Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B28306AF9F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 07:09:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2013 23:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="438307748"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2013 23:09:27 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 23:09:26 -0800
Message-Id: <cover.1384930936.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/51]
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
X-List-Received-Date: Wed, 20 Nov 2013 07:09:27 -0000

Richard,

This is the pending pulls since last week that we have held up due to
various issue with the autobuilder.  As I send the email, the AB had 
not completed yet, but I have reviewed these patches and build them locally
for 3 platforms.

Please review the final AB output.

There are at least 2 meta-yocto* patches that need to be merged as well for
the  acpi scripts from Paul and a patch for the format specificer.

Thanks
	Sau!

The following changes since commit 0eb947454e1c92467283e6f1adeca67c7c57698b:

  python: Fix ptest not working problems (2013-11-18 13:04:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Alexandru-Cezar Sardan (1):
  gcc: changed multilib options handling

Carlos Rafael Giani (1):
  gstreamer1.0: upgrade to 1.2.0

Chen Qi (4):
  sysvinit: fix problem in switching runlevels
  license.bbclass: fix missing of license files on ubuntu build host
  shadow-native: allow for setting password in clear text
  sysvinit: use ALTERNATIVE to manage sulogin

Chunrong Guo (1):
  mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for
    powerpc64

Cristian Iorga (1):
  telepathy-idle: upgrade to 0.2.0

Cristiana Voicu (2):
  at-spi2-core: upgrade to 2.10.2
  liburcu: upgrade to 0.8.1

Dominik Holland (1):
  dbus: Don't depend on dbus-ptest-ptest for the nativesdk-dbus package

Florin Sarbu (1):
  systemd: Fix packaging of pam config files.

Hans Beckerus (1):
  initscripts: add missing dmesg.sh to run-level S

Hongxu Jia (4):
  kernel-grub.bbclass: support /boot area within root partition
  lib32-qt4-examples: fix QA warnings and INSANE_SKIP not work
  lib32-packagegroup-core-nfs: fix qa issue - install files into a
    shared area when those files already exist
  xorg-driver: fix qa issue while multilib enabled - contains Xorg
    driver but no xorg-abi

Irina Patru (1):
  distrodata.bbclass: Add fetch2 handlers to svn case in checkpkg

Jack Mitchell (1):
  libjson: update to 0.11 and rename to json-c

Kai Kang (1):
  lsb: update directory of install_initd and remove_initd

Khem Raj (2):
  tcl: Install header into 8.6 instead of PN-PV in user/include
  libnl: Fix random segfaults due to memory corruption

Laurentiu Palcu (1):
  flex: fix m4 issue on target

Lu Chong (1):
  util-linux: Fix QA warnings about ALTERNATIVES

Mihaela Sendrea (1):
  expect: Add recipe

Ming Liu (3):
  grub: add xz RDEPENDS
  qemu: explicitly disable xen support
  kernel.bbclass: move bundle_initramfs after kernel_link_vmlinux

Otavio Salvador (1):
  lttng-modules: Update to 2.3.3 version

Paul Eggleton (1):
  ia32-base.inc: remove eee-acpi-scripts from MACHINE_EXTRA_RRECOMMENDS

Paul Woegerer (2):
  lttng-ust: Update to version 2.3.1
  lttng-tools: Update to version 2.3.1

Phil Blundell (3):
  boost: Add patch to avoid undefined references to
    boost::atomic::lockpool::get_lock_for()
  PATCH] kernel.bbclass: Use lzma not lzmash for decompressing
  bitbake.conf: Remove obsolete/unused MIRROR cruft

Qiang Chen (1):
  util-linux: collect libs for related libxx-dev package

Ross Burton (3):
  json-glib: upgrade to 0.16.2
  weston: remove reference to gles in PACKAGECONFIG
  librsvg: upgrade to 2.40.0

Saul Wold (10):
  binutils: Add embedspu to standard binutils package
  sysstat: upgrade to 10.2.0
  libcheck: upgrade to 0.9.11
  libpcre: Cleanup FILESPATH
  squashfs-tools: remove FILESEXTRAPATH and move patches directory
  qemu-helper-native: remove unneeded FILESEXTRAPATH
  image_types: newer btrfs.mkfs needs an empty file to build the disk in
  btrfs-tools: Update to git HEAD
  kconfig-frontends: upgrade to 3.12.0.0
  santiy.bbclass: Add testfile info to error messages (more verbose)

Tobias Henkel (1):
  icecc: Use bb.utils.which instead of calling which

Wenzong Fan (1):
  udev: remove extra -dev/-dbg packages

 meta/classes/distrodata.bbclass                    |   43 +-
 meta/classes/icecc.bbclass                         |    6 +-
 meta/classes/image_types.bbclass                   |    1 +
 meta/classes/insane.bbclass                        |    3 +-
 meta/classes/kernel-grub.bbclass                   |    9 +-
 meta/classes/kernel.bbclass                        |    4 +-
 meta/classes/license.bbclass                       |    4 +-
 meta/classes/sanity.bbclass                        |    6 +-
 meta/conf/bitbake.conf                             |   11 -
 meta/conf/distro/include/seperatebuilddir.inc      |    2 +-
 meta/conf/machine/include/ia32-base.inc            |    2 +-
 meta/recipes-bsp/grub/grub_2.00.bb                 |    2 +-
 .../fix-svc-gtk-doc.h-target.patch                 |    0
 ...athy-idle_0.1.16.bb => telepathy-idle_0.2.0.bb} |    4 +-
 meta/recipes-core/dbus/dbus.inc                    |    3 +-
 .../init-ifupdown/init-ifupdown_1.0.bb             |    2 +-
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    8 +-
 .../packagegroups/packagegroup-core-nfs.bb         |    1 +
 meta/recipes-core/systemd/systemd_208.bb           |    3 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    5 +-
 meta/recipes-core/udev/udev.inc                    |   16 +-
 meta/recipes-core/util-linux/util-linux.inc        |   25 +-
 meta/recipes-core/util-linux/util-linux_2.23.2.bb  |    8 +-
 meta/recipes-devtools/binutils/binutils.inc        |    8 +-
 meta/recipes-devtools/binutils/binutils_2.23.2.bb  |    6 +
 .../btrfs-tools/btrfs-tools_git.bb                 |    8 +-
 .../expect/expect/0001-configure.in.patch          |  108 ++
 .../expect/expect/0002-tcl.m4.patch                |   17 +
 .../expect/expect/01-example-shebang.patch         |  144 +++
 meta/recipes-devtools/expect/expect_5.45.bb        |   61 ++
 meta/recipes-devtools/flex/flex.inc                |    5 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |   26 +-
 meta/recipes-devtools/json-c/json-c_0.11.bb        |   20 +
 ...s_3.11.0.0.bb => kconfig-frontends_3.12.0.0.bb} |    4 +-
 meta/recipes-devtools/libjson/libjson_0.9.bb       |   14 -
 .../qemu/qemu-helper-native_1.0.bb                 |    2 -
 meta/recipes-devtools/qemu/qemu.inc                |    1 +
 .../squashfs-4.2-fix-CVE-2012-4024.patch           |    0
 .../squashfs-4.2-fix-CVE-2012-4025.patch           |    0
 ...dd-a-commment-and-fix-some-other-comments.patch |    0
 .../squashfs-fix-open-file-limit.patch             |    0
 .../squashfs-tools/squashfs-tools_4.2.bb           |    1 -
 .../tcltk/tcl/alter-includedir.patch               |   46 +
 .../tcl/fix_issue_with_old_distro_glibc.patch      |   12 +-
 .../tcltk/tcl/fix_non_native_build_issue.patch     |   12 +-
 meta/recipes-devtools/tcltk/tcl/no_packages.patch  |   16 +-
 .../tcltk/tcl/tcl-add-soname.patch                 |   64 +-
 .../tcl/tcl-remove-hardcoded-install-path.patch    |   26 +-
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb           |   26 +-
 meta/recipes-extended/lsb/lsb_4.1.bb               |    4 +-
 meta/recipes-extended/mdadm/mdadm_3.3.bb           |    5 +
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb     |    2 +-
 .../allow-for-setting-password-in-clear-text.patch |  208 ++++
 meta/recipes-extended/shadow/shadow.inc            |    1 +
 .../sysstat/{files => sysstat}/99_sysstat          |    0
 .../{sysstat_10.1.7.bb => sysstat_10.2.0.bb}       |    4 +-
 .../{json-glib_0.16.0.bb => json-glib_0.16.2.bb}   |    5 +-
 .../librsvg/librsvg-2.32.1/doc_Makefile.patch      |   19 -
 .../librsvg-2.32.1/librsvg-CVE-2011-3146.patch     | 1088 --------------------
 .../recipes-gnome/librsvg/librsvg/gtk-option.patch |   59 ++
 meta/recipes-gnome/librsvg/librsvg/local-m4.patch  |   32 +
 meta/recipes-gnome/librsvg/librsvg/vapigen.m4      |   96 ++
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   58 --
 meta/recipes-gnome/librsvg/librsvg_2.40.0.bb       |   56 +
 meta/recipes-graphics/wayland/weston_1.3.0.bb      |    1 -
 ...lttng-modules_git.bb => lttng-modules_2.3.3.bb} |    4 +-
 .../{lttng-tools_2.3.0.bb => lttng-tools_2.3.1.bb} |    4 +-
 .../{lttng-ust_2.3.0.bb => lttng-ust_2.3.1.bb}     |    8 +-
 .../gstreamer/gstreamer1.0-libav.inc               |    2 +-
 .../gstreamer1.0-libav/libav_e500mc.patch          |   21 -
 ...-libav_1.0.9.bb => gstreamer1.0-libav_1.2.0.bb} |   13 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  110 +-
 ...uez-fix-compilation-on-big-endian-systems.patch |   35 +
 ..._1.0.9.bb => gstreamer1.0-plugins-bad_1.2.0.bb} |    8 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    2 +-
 .../gstreamer/gstreamer1.0-plugins-base_1.0.9.bb   |   10 -
 .../gstreamer/gstreamer1.0-plugins-base_1.2.0.bb   |   10 +
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   13 +-
 ...1.0.9.bb => gstreamer1.0-plugins-good_1.2.0.bb} |    6 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |    2 +-
 ...1.0.9.bb => gstreamer1.0-plugins-ugly_1.2.0.bb} |    4 +-
 ...gstreamer1.0_1.0.9.bb => gstreamer1.0_1.2.0.bb} |    8 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 meta/recipes-qt/qt4/qt4.inc                        |    4 +-
 ...-spi2-core_2.10.0.bb => at-spi2-core_2.10.2.bb} |    4 +-
 meta/recipes-support/boost/boost_1.54.0.bb         |    1 +
 .../files/boost-1.54.0-thread-link_atomic.patch    |   59 ++
 .../libcheck/ignore_automake_warning.patch         |   15 -
 .../libcheck/libcheck_fix_for_automake-1.12.patch  |   26 -
 .../{libcheck_0.9.10.bb => libcheck_0.9.11.bb}     |    6 +-
 ...free-caused-by-freeing-link-af_data-in-rt.patch |   41 +
 meta/recipes-support/libnl/libnl_3.2.22.bb         |    4 +-
 .../fix-pcre-name-collision.patch                  |    0
 .../libpcre/{files => libpcre}/pcre-cross.patch    |    0
 meta/recipes-support/libpcre/libpcre_8.33.bb       |    2 -
 meta/recipes-support/liburcu/files/fixCCflag.patch |   20 -
 .../liburcu/{files => liburcu}/fixsepbuild.patch   |    0
 .../liburcu/{liburcu_0.8.0.bb => liburcu_0.8.1.bb} |    7 +-
 98 files changed, 1326 insertions(+), 1558 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.16 => telepathy-idle}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.16.bb => telepathy-idle_0.2.0.bb} (82%)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-configure.in.patch
 create mode 100644 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
 create mode 100644 meta/recipes-devtools/expect/expect/01-example-shebang.patch
 create mode 100644 meta/recipes-devtools/expect/expect_5.45.bb
 create mode 100644 meta/recipes-devtools/json-c/json-c_0.11.bb
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.11.0.0.bb => kconfig-frontends_3.12.0.0.bb} (89%)
 delete mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
 rename meta/recipes-devtools/squashfs-tools/{patches => squashfs-tools}/squashfs-4.2-fix-CVE-2012-4024.patch (100%)
 rename meta/recipes-devtools/squashfs-tools/{patches => squashfs-tools}/squashfs-4.2-fix-CVE-2012-4025.patch (100%)
 rename meta/recipes-devtools/squashfs-tools/{patches => squashfs-tools}/squashfs-add-a-commment-and-fix-some-other-comments.patch (100%)
 rename meta/recipes-devtools/squashfs-tools/{patches => squashfs-tools}/squashfs-fix-open-file-limit.patch (100%)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
 create mode 100644 meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
 rename meta/recipes-extended/sysstat/{files => sysstat}/99_sysstat (100%)
 rename meta/recipes-extended/sysstat/{sysstat_10.1.7.bb => sysstat_10.2.0.bb} (40%)
 rename meta/recipes-gnome/json-glib/{json-glib_0.16.0.bb => json-glib_0.16.2.bb} (79%)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg-2.32.1/doc_Makefile.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg-2.32.1/librsvg-CVE-2011-3146.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/gtk-option.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/local-m4.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/vapigen.m4
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
 create mode 100644 meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
 rename meta/recipes-kernel/lttng/{lttng-modules_git.bb => lttng-modules_2.3.3.bb} (93%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.3.0.bb => lttng-tools_2.3.1.bb} (96%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.3.0.bb => lttng-ust_2.3.1.bb} (80%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/libav_e500mc.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.0.9.bb => gstreamer1.0-libav_1.2.0.bb} (68%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/bluez-fix-compilation-on-big-endian-systems.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.0.9.bb => gstreamer1.0-plugins-bad_1.2.0.bb} (61%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.0.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.0.9.bb => gstreamer1.0-plugins-good_1.2.0.bb} (62%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.0.9.bb => gstreamer1.0-plugins-ugly_1.2.0.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.0.9.bb => gstreamer1.0_1.2.0.bb} (52%)
 rename meta/recipes-support/atk/{at-spi2-core_2.10.0.bb => at-spi2-core_2.10.2.bb} (77%)
 create mode 100644 meta/recipes-support/boost/files/boost-1.54.0-thread-link_atomic.patch
 delete mode 100644 meta/recipes-support/libcheck/libcheck/ignore_automake_warning.patch
 delete mode 100644 meta/recipes-support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
 rename meta/recipes-support/libcheck/{libcheck_0.9.10.bb => libcheck_0.9.11.bb} (70%)
 create mode 100644 meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
 rename meta/recipes-support/libpcre/{files => libpcre}/fix-pcre-name-collision.patch (100%)
 rename meta/recipes-support/libpcre/{files => libpcre}/pcre-cross.patch (100%)
 delete mode 100644 meta/recipes-support/liburcu/files/fixCCflag.patch
 rename meta/recipes-support/liburcu/{files => liburcu}/fixsepbuild.patch (100%)
 rename meta/recipes-support/liburcu/{liburcu_0.8.0.bb => liburcu_0.8.1.bb} (75%)

-- 
1.8.3.1


