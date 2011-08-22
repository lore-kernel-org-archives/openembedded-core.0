Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvcUG-0006yF-EH
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 23:56:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2011 14:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,265,1312182000"; d="scan'208";a="43970240"
Received: from unknown (HELO swold-MOBL.lan) ([10.255.13.234])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2011 14:52:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2011 14:51:45 -0700
Message-Id: <cover.1314043945.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [CONSOLIDATED PULL 00/19] various fixes and updates
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
X-List-Received-Date: Mon, 22 Aug 2011 21:56:53 -0000

Richard,

This includes a 3.0.3 kernel update, along with changes from
many different people. Jessica is OK with the POKY-> OECORE change

Sau!


The following changes since commit 9134800548a03bfe3a7e351a15f2129bcb3cc680:

  xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds (2011-08-19 16:27:29 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bruce Ashfield (2):
  linux-yocto: move more default values into linux-yocto.inc
  linux-yocto: update SRCREVs for 3.0.3

Chris Larson (3):
  libpcre: the generated libtool uses HOST_SYS
  rpm: be certain we don't prefix our binaries
  image_types_uboot: add uboot mkimage fs types

Darren Hart (3):
  tune: add missing closing quote to arch-armv7a.inc for AVAILTUNES
  tune: remove thumb flag from non-thumb cortexa8 tune variables
  tune: Add hard floating point variants of cortexa8 tunes

Jiajun Xu (2):
  libsdl: do not inherit nativesdk
  task-core-x11-sato: add libsdl into sato image

Khem Raj (1):
  recipes: Delete patch=1, its default and replace pnum with striplevel

Lianhao Lu (1):
  adt-installer: Removed the hard coded repo url.

Martin Jansa (1):
  utils.bbclass: skip empty paths when handling FILESEXTRAPATHS

Otavio Salvador (4):
  Use OECORE_DISTRO_VERSION instead of POKY_DISTRO_VERSION
  kernel.bbclass: save kernel image name into $kerneldir
  scripts/runqemu: add support to pass bootparams to kernel
  scripts/combo-layer: fix configuration file handling

Robert Yang (1):
  bitbake meta-toolchain with gcc 4.5.1 failed

Saul Wold (1):
  at: fix RDEPENDS -> RDEPENDS_${PN}

 meta/classes/image_types_uboot.bbclass             |   21 +++++++++
 meta/classes/kernel.bbclass                        |    6 +++
 meta/classes/toolchain-scripts.bbclass             |   12 +++---
 meta/classes/utils.bbclass                         |    5 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc        |   20 ++++++--
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    4 +-
 meta/recipes-bsp/hostap/hostap-utils.inc           |    2 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    2 +-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 +-
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 +-
 meta/recipes-connectivity/gsm/gsmd.inc             |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |    2 +-
 meta/recipes-connectivity/portmap/portmap.inc      |    2 +-
 .../telepathy/libtelepathy_0.3.3.bb                |    4 +-
 meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb |    2 +-
 .../console-tools/console-tools_0.3.2.bb           |   10 ++--
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    8 ++--
 meta/recipes-core/udev/udev_145.bb                 |    2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    2 +-
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    2 +-
 .../binutils/binutils_csl-arm-2008q1.bb            |   14 +++---
 .../dosfstools/dosfstools-native_2.10.bb           |   16 +++---
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |    8 ++--
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    6 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    2 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 +-
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    8 ++--
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    8 ++--
 meta/recipes-devtools/gcc/gcc-common.inc           |    2 +-
 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc   |    4 +-
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |   46 ++++++++++----------
 meta/recipes-devtools/gdb/gdb-cross_7.3.bb         |    2 +-
 .../adt-installer/opkg/conf/opkg-sdk-i686.conf     |    2 +-
 .../adt-installer/opkg/conf/opkg-sdk-x86_64.conf   |    2 +-
 .../installer/adt-installer_1.0.bb                 |    5 ++-
 meta/recipes-devtools/m4/m4_1.4.16.bb              |    2 +-
 meta/recipes-devtools/make/make.inc                |    2 +-
 meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb   |    6 +-
 meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb       |    2 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    6 +-
 meta/recipes-devtools/patch/patch_2.5.9.bb         |    8 ++--
 meta/recipes-devtools/patch/patch_2.6.1.bb         |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    2 +-
 .../python/python-pycurl_7.19.0.bb                 |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../subversion/subversion_1.6.15.bb                |    6 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
 meta/recipes-extended/at/at_3.1.12.bb              |    2 +-
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |    4 +-
 meta/recipes-extended/hdparm/hdparm_6.3.bb         |    4 +-
 meta/recipes-extended/man/man_1.6f.bb              |   42 +++++++++---------
 meta/recipes-extended/minicom/minicom_2.4.bb       |    2 +-
 meta/recipes-extended/psmisc/psmisc.inc            |    2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   10 ++--
 meta/recipes-extended/time/time_1.7.bb             |    6 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    4 +-
 meta/recipes-gnome/gnome/gnome-common_2.28.0.bb    |    2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb |    2 +-
 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |    4 +-
 .../gnome/gobject-introspection_git.bb             |    6 +-
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |   34 +++++++-------
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |   32 +++++++-------
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb             |   32 +++++++-------
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |   12 +++---
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 meta/recipes-graphics/clutter/clutter_git.bb       |    4 +-
 .../libmatchbox/libmatchbox_1.9.bb                 |    6 +-
 .../libmatchbox/libmatchbox_git.bb                 |    6 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.11.bb      |    8 ++--
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    4 +-
 meta/recipes-graphics/mutter/mutter_git.bb         |   10 ++--
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    4 +-
 meta/recipes-graphics/xcb/libxcb.inc               |    2 +-
 .../xcursor-transparent-theme_0.1.1.bb             |    4 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |    6 +-
 meta/recipes-graphics/xorg-lib/libx11_git.inc      |    6 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb   |    2 +-
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   28 ++++++------
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb       |    4 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |    7 +++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   21 +++------
 meta/recipes-kernel/oprofile/oprofile_cvs.bb       |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb  |    2 +-
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |    4 +-
 meta/recipes-multimedia/lame/lame_3.98.4.bb        |    2 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +-
 meta/recipes-multimedia/libtiff/tiff_3.8.2.bb      |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    4 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |   10 ++--
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    2 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    4 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../matchbox-stroke/matchbox-stroke_git.bb         |    4 +-
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb         |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_svn.bb        |    2 +-
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |    3 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |    4 +-
 meta/recipes-support/libpcre/libpcre_8.12.bb       |   10 ++--
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.5.bb           |    2 +-
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    4 +-
 scripts/combo-layer                                |    4 +-
 scripts/oe-find-native-sysroot                     |    2 +-
 scripts/runqemu                                    |    3 +
 scripts/runqemu-export-rootfs                      |    2 +-
 115 files changed, 381 insertions(+), 333 deletions(-)
 create mode 100644 meta/classes/image_types_uboot.bbclass

-- 
1.7.6



