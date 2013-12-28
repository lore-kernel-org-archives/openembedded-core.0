Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1A83D60E79
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:29:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457009906"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:29:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:28:56 +0000
Message-Id: <cover.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 00/38] Cleanup series
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
X-List-Received-Date: Sat, 28 Dec 2013 22:29:45 -0000

I got a bit tired of seeing poor SUMMARY and DESCRIPTION values in our
recipes, so I went on a bit of a quest to clean them up, and ended up
tidying up a few other things in the process.

This touches quite a few recipes, so I've tried to split the series into
logical patches to aid review. I built all of the affected recipes and
skimmed over the changes in pkgdata and they looked reasonable.
Hopefully all of the changes make sense; I'm happy to have feedback as
always.


The following changes since commit 421e927bd453259f4b3cdbd1676f6e12f97bf34f:

  openssl: use PACKAGECONFIG to disable perl bits (2013-12-21 09:09:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/cleanup3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/cleanup3

Paul Eggleton (38):
  *-basic: rename to *-standardlinux
  Drop empty/invalid BUGTRACKER values
  Replace OpenedHand Bugzilla in BUGTRACKER
  Replace one-line DESCRIPTION with SUMMARY
  Replace one-line DESCRIPTION with SUMMARY and tweak
  Add missing SUMMARY values
  alsa-utils: add missing individual package SUMMARY values
  qmmp: add SUMMARY and tweak DESCRIPTION
  gettext: set reasonable SUMMARY and DESCRIPTION
  telepathy-mission-control: fix HOMEPAGE
  libsamplerate0: add HOMEPAGE
  lame: update HOMEPAGE
  startup-notification: fix HOMEPAGE
  bash: update HOMEPAGE
  libunique: fix HOMEPAGE and touch up DESCRIPTION
  xev: add proper SUMMARY and DESCRIPTION
  gawk: set reasonable SUMMARY and DESCRIPTION
  linux-dummy: set LICENSE to GPLv2 to avoid license warning
  linux-dummy: set reasonable DESCRIPTION
  Basic recipe formatting fixes
  qt4: set SUMMARY and tweak DESCRIPTION
  xf86-input-vmmouse: set SUMMARY and DESCRIPTION
  xf86-video-fbdev: set SUMMARY and DESCRIPTION
  xf86-video-modesetting: set SUMMARY and DESCRIPTION
  gmp: set SUMMARY and DESCRIPTION
  icecc-create-env-native: add SUMMARY and tweak DESCRIPTION
  binutils: add/tweak SUMMARY
  core-image-lsb: fix DESCRIPTION
  adt-installer: tweak DESCRIPTION and add SUMMARY and HOMEPAGE
  stat: tidy up recipe
  enchant: tidy up recipe
  guilt-native: tidy up recipe
  opkg-utils: tidy up recipe
  pciutils: tidy up recipe
  speex: fix SRC_URI to use PV instead of hardcoding the version
  bitbake.conf: add full stop to default DESCRIPTION
  classes/package: set SUMMARY in do_split_packages()
  bitbake.conf: set a default for MACHINE_FEATURES

 .../recipes-test/aspell/aspell_0.0.0.1.bb          |   6 +-
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |   2 +-
 meta/classes/package.bbclass                       |   8 +-
 meta/conf/bitbake.conf                             |   3 +-
 meta/recipes-bsp/acpid/acpid.inc                   |   7 +-
 meta/recipes-bsp/formfactor/formfactor_0.0.bb      |   2 +-
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |   2 +-
 meta/recipes-bsp/pciutils/pciutils_3.2.1.bb        |  11 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |   2 +-
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   2 +-
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |   2 +-
 .../u-boot/u-boot-fw-utils-cross_2013.07.bb        |   2 +-
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb |   2 +-
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   2 +-
 meta/recipes-bsp/usbinit/usbinit.bb                |   2 +-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |   2 +-
 meta/recipes-bsp/x-load/x-load.inc                 |   2 +-
 meta/recipes-bsp/zaurusd/zaurusd_git.bb            |   2 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |   2 +-
 .../connman/connman-gnome_0.7.bb                   |   2 +-
 .../libnss-mdns/libnss-mdns_0.10.bb                |   2 +-
 .../mobile-broadband-provider-info_git.bb          |   2 +-
 meta/recipes-connectivity/openssl/ocf-linux.inc    |   2 +-
 meta/recipes-connectivity/portmap/portmap.inc      |   2 +-
 .../ppp-dialin/ppp-dialin_0.1.bb                   |   2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |  16 +-
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb   |   1 +
 .../telepathy/telepathy-mission-control_5.16.0.bb  |   4 +-
 .../telepathy/telepathy-python_0.15.19.bb          |   2 +-
 .../wireless-tools/wireless-tools_29.bb            |   2 +-
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb       |   2 +-
 meta/recipes-core/dbus/dbus-ptest_1.6.18.bb        |   2 +-
 .../eglibc/cross-localedef-native_2.17.bb          |   2 +-
 .../eglibc/cross-localedef-native_2.18.bb          |   2 +-
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |   2 +-
 .../feed-config/poky-feed-config-opkg_1.0.bb       |   2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |   3 +-
 meta/recipes-core/gettext/gettext_0.18.3.1.bb      |   4 +-
 .../glib-networking/glib-networking_2.38.0.bb      |   1 +
 .../initrdscripts/initramfs-boot_1.0.bb            |   2 +-
 .../initrdscripts/initramfs-framework_1.0.bb       |  10 +-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |   2 +-
 .../initramfs-live-install-efi_1.0.bb              |   2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |   2 +-
 meta/recipes-core/jpeg/jpeg_8d.bb                  |   1 -
 meta/recipes-core/kbd/kbd_2.0.1.bb                 |   2 +-
 meta/recipes-core/meta/meta-environment.bb         |   2 +-
 meta/recipes-core/meta/meta-ide-support.bb         |   1 +
 meta/recipes-core/meta/meta-toolchain.bb           |   2 +-
 meta/recipes-core/meta/package-index.bb            |   2 +-
 .../packagegroup-core-standalone-sdk-target.bb     |   2 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   2 +-
 .../systemd/systemd-systemctl-native.bb            |   2 +-
 meta/recipes-core/systemd/systemd_208.bb           |   2 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   2 +-
 meta/recipes-devtools/apt/apt.inc                  |   2 +-
 meta/recipes-devtools/automake/automake_1.13.4.bb  |   2 +-
 .../binutils/binutils-cross-canadian.inc           |   2 +-
 meta/recipes-devtools/binutils/binutils.inc        |   2 +-
 meta/recipes-devtools/cmake/cmake.inc              |   2 +-
 .../desktop-file-utils-native_0.22.bb              |   2 +-
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb  |   2 +-
 .../docbook-dsssl-stylesheets-native_1.79.bb       |   2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   2 +-
 meta/recipes-devtools/elfutils/elfutils_0.155.bb   |   2 +-
 meta/recipes-devtools/expect/expect_5.45.bb        |   2 +-
 meta/recipes-devtools/flex/flex_2.5.37.bb          |   2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   2 +-
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |   2 +-
 meta/recipes-devtools/gdb/gdb-7.6.1.inc            |   2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   4 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   2 +-
 meta/recipes-devtools/git/git.inc                  |   2 +-
 meta/recipes-devtools/guilt/guilt-native_git.bb    |  13 +-
 .../help2man/help2man-native_1.43.3.bb             |   2 +-
 .../icecc-create-env-native_0.1.bb                 |   5 +-
 .../installer/adt-installer_1.0.bb                 |   4 +-
 meta/recipes-devtools/intltool/intltool.inc        |   2 +-
 meta/recipes-devtools/intltool/intltool_0.50.2.bb  |   2 +-
 .../kconfig-frontends_3.12.0.0.bb                  |   1 +
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb   |   2 +-
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   2 +-
 .../mklibs/mklibs-native_0.1.38.bb                 |   1 +
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |   6 +-
 meta/recipes-devtools/nasm/nasm_2.10.09.bb         |   2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  20 +--
 meta/recipes-devtools/opkg/opkg-collateral.bb      |   2 +-
 meta/recipes-devtools/opkg/opkg-config-base_1.0.bb |   2 +-
 meta/recipes-devtools/opkg/opkg.inc                |   6 +-
 meta/recipes-devtools/orc/orc.inc                  |   2 +-
 meta/recipes-devtools/perl/liburi-perl_1.60.bb     |   1 +
 .../perl/libxml-parser-perl_2.41.bb                |   2 +-
 meta/recipes-devtools/perl/perl-native_5.14.3.bb   |   2 +-
 meta/recipes-devtools/perl/perl_5.14.3.bb          |   2 +-
 meta/recipes-devtools/pseudo/pseudo.inc            |   2 +-
 .../python/python-2.7-manifest.inc                 | 132 ++++++++---------
 .../python/python-argparse_1.2.1.bb                |   2 +-
 meta/recipes-devtools/python/python-dbus_1.2.0.bb  |   2 +-
 .../python/python-docutils_0.11.bb                 |   2 +-
 meta/recipes-devtools/python/python-gst_0.10.22.bb |   2 +-
 .../python/python-imaging_1.1.7.bb                 |   2 +-
 .../python/python-pycairo_1.10.0.bb                |   2 +-
 .../python/python-pycurl_7.19.0.2.bb               |   2 +-
 .../python/python-pygobject_2.27.91.bb             |   2 +-
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |   2 +-
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |   1 +
 meta/recipes-devtools/python/python-scons_2.3.0.bb |   2 +-
 .../python/python-setuptools_1.4.bb                |   2 +-
 meta/recipes-devtools/python/python.inc            |   2 +-
 .../qemu/qemu-helper-native_1.0.bb                 |   2 +-
 meta/recipes-devtools/qemu/qemu.inc                |   2 +-
 .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   2 +-
 meta/recipes-devtools/quilt/quilt-0.60.inc         |   2 +-
 meta/recipes-devtools/rsync/rsync.inc              |   2 +-
 meta/recipes-devtools/rsync/rsync_2.6.9.bb         |   2 +-
 .../run-postinsts/run-postinsts_1.0.bb             |   2 +-
 meta/recipes-devtools/strace/strace_4.8.bb         |   2 +-
 .../subversion/subversion_1.6.15.bb                |   2 +-
 .../subversion/subversion_1.7.10.bb                |   2 +-
 .../recipes-devtools/swabber/swabber-native_git.bb |   2 +-
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |   2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |   2 +-
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb           |   2 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |   2 +-
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |   2 +-
 .../unifdef/unifdef-native_2.6.18+git.bb           |   2 +-
 meta/recipes-devtools/vala/vala.inc                |   1 +
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |   2 +-
 meta/recipes-extended/at/at_3.1.14.bb              |   2 +-
 meta/recipes-extended/augeas/augeas.inc            |   2 +-
 meta/recipes-extended/bash/bash.inc                |   4 +-
 meta/recipes-extended/bc/bc_1.06.bb                |   3 +-
 meta/recipes-extended/byacc/byacc_20130925.bb      |   2 +-
 meta/recipes-extended/cracklib/cracklib_2.9.1.bb   |   2 +-
 .../cwautomacros/cwautomacros_20110201.bb          |   2 +-
 meta/recipes-extended/ed/ed_0.5.bb                 |   2 +-
 meta/recipes-extended/ed/ed_1.9.bb                 |   3 +-
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |   6 +-
 meta/recipes-extended/gawk/gawk_4.0.2.bb           |   6 +-
 meta/recipes-extended/hdparm/hdparm_9.43.bb        |   1 +
 meta/recipes-extended/images/core-image-lsb.bb     |   7 +-
 ...-image-basic.bb => core-image-standardlinux.bb} |   2 +-
 meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb  |   2 +-
 meta/recipes-extended/logrotate/logrotate_3.8.1.bb |   2 +-
 meta/recipes-extended/lsb/lsb_4.1.bb               |   2 +-
 meta/recipes-extended/lsb/lsbinitscripts_9.50.bb   |   2 +-
 meta/recipes-extended/lsb/lsbtest_1.0.bb           |   2 +-
 meta/recipes-extended/mc/mc_4.7.5.2.bb             |  10 +-
 meta/recipes-extended/mc/mc_4.8.10.bb              |  10 +-
 meta/recipes-extended/mdadm/mdadm_3.3.bb           |   3 +-
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |   2 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |   2 +-
 .../net-tools/net-tools_1.60-25.bb                 |   4 +-
 .../packagegroups/packagegroup-core-basic.bb       | 138 -----------------
 .../packagegroup-core-standardlinux.bb             | 163 +++++++++++++++++++++
 meta/recipes-extended/parted/parted_3.1.bb         |   2 +-
 .../perl/libconvert-asn1-perl_0.26.bb              |   2 +-
 .../recipes-extended/perl/libtimedate-perl_2.30.bb |   2 +-
 meta/recipes-extended/quota/quota_4.01.bb          |   2 +-
 meta/recipes-extended/sed/sed_4.1.2.bb             |   2 +-
 meta/recipes-extended/sed/sed_4.2.2.bb             |   2 +-
 meta/recipes-extended/stat/stat_3.3.bb             |  14 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   2 +-
 .../recipes-extended/tzcode/tzcode-native_2013h.bb |   2 +-
 meta/recipes-extended/tzdata/tzdata_2013h.bb       |   2 +-
 meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +-
 meta/recipes-extended/wget/wget.inc                |   2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   2 +-
 meta/recipes-extended/xz/xz_5.1.3alpha.bb          |   2 +-
 meta/recipes-extended/zip/zip.inc                  |   2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb |   2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |   2 +-
 meta/recipes-gnome/gnome/gnome-common_3.7.4.bb     |   2 +-
 meta/recipes-gnome/gnome/gnome-desktop.inc         |   2 +-
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |   2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb |   2 +-
 .../gnome/gsettings-desktop-schemas_3.7.3.bb       |   2 +-
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |   2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |   2 +-
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |   2 +-
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |   2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |   2 +-
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.40.1.bb       |   2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |   5 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   2 +-
 meta/recipes-graphics/clutter/clutter-gst-1.0.inc  |   2 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |   2 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   2 +-
 .../directfb/directfb-examples_1.6.0.bb            |   1 +
 meta/recipes-graphics/fstests/fstests_git.bb       |   2 +-
 meta/recipes-graphics/glew/glew_1.10.0.bb          |   1 +
 .../recipes-graphics/images/core-image-directfb.bb |   2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |   2 +-
 .../libmatchbox/libmatchbox_1.11.bb                |   2 +-
 .../libxsettings-client_0.10.bb                    |   2 +-
 .../matchbox-session/matchbox-session_0.1.bb       |   4 +-
 .../matchbox-wm/matchbox-wm_1.2.bb                 |   2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |   4 +-
 .../menu-cache/menu-cache_0.4.1.bb                 |   1 -
 .../mini-x-session/mini-x-session_0.1.bb           |   2 +-
 meta/recipes-graphics/mx/mx.inc                    |   2 +-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb |   2 +-
 .../startup-notification_0.12.bb                   |   4 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   2 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |   2 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |   2 +-
 .../xcursor-transparent-theme_0.1.1.bb             |   4 +-
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb     |   2 +-
 meta/recipes-graphics/xorg-app/xev_1.2.1.bb        |   8 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc |   2 +-
 meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb     |   2 +-
 .../xorg-driver/xf86-input-vmmouse_13.0.0.bb       |   7 +-
 .../xorg-driver/xf86-video-fbdev_0.4.4.bb          |   5 +-
 .../xorg-driver/xf86-video-modesetting_0.8.0.bb    |   3 +-
 .../xorg-driver/xorg-driver-common.inc             |   2 +-
 .../recipes-graphics/xorg-font/font-alias_1.0.3.bb |   2 +-
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb |   2 +-
 .../xorg-font/xorg-minimal-fonts.bb                |   1 -
 .../xorg-lib/libxcomposite_0.4.4.bb                |   2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb   |   2 +-
 .../xorg-proto/xorg-proto-common.inc               |   2 +-
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |   2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +-
 .../xvideo-tests/xvideo-tests_git.bb               |   2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   2 +-
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |   2 +-
 meta/recipes-kernel/kmod/kmod.inc                  |   1 +
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |   3 +-
 .../linux-firmware/linux-firmware_git.bb           |   2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |   2 +-
 meta/recipes-kernel/linux/linux-dummy.bb           |   7 +-
 .../modutils-initscripts/modutils-initscripts.bb   |   2 +-
 meta/recipes-kernel/oprofile/oprofileui.inc        |   2 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |   2 +-
 .../systemtap/systemtap-uprobes_git.bb             |   2 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   2 +-
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |   2 +-
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |   2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb  |   2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |   2 +-
 .../alsa/alsa-utils-alsaconf_1.0.27.2.bb           |   3 +-
 .../recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb |  23 +--
 .../gstreamer/gst-fluendo-mp3_0.10.19.bb           |   4 +-
 .../gstreamer/gst-fluendo-mpegdemux_0.10.72.bb     |   2 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |   2 +-
 .../gstreamer/gst-meta-base_0.10.bb                |   2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   2 +-
 .../gstreamer/gstreamer1.0-libav.inc               |   2 +-
 .../gstreamer/gstreamer1.0-omx.inc                 |   2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |   2 +-
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |   4 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |   2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |   2 +-
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |   2 +-
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |   2 +-
 .../libsamplerate/libsamplerate0_0.1.8.bb          |   3 +-
 .../libsndfile/libsndfile1_1.0.25.bb               |   2 +-
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   2 +-
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |   2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   2 +-
 meta/recipes-multimedia/speex/speex_1.2rc1.bb      |   2 +-
 meta/recipes-qt/qt-apps/fotowall_0.9.bb            |   1 +
 meta/recipes-qt/qt-apps/qmmp_0.6.6.bb              |   5 +-
 meta/recipes-qt/qt-apps/quicky_0.4.bb              |   2 +-
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |   2 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   2 +-
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   2 +-
 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb  |   2 +-
 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   2 +-
 meta/recipes-qt/qt4/qt4-embedded.inc               |   3 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |   2 +-
 meta/recipes-qt/qt4/qt4-x11-free.inc               |   1 +
 meta/recipes-rt/rt-tests/rt-tests_0.85.bb          |   2 +-
 meta/recipes-sato/gaku/gaku_git.bb                 |   2 +-
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |   4 +-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |   2 +-
 meta/recipes-sato/libowl/libowl_git.bb             |   4 +-
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |   4 +-
 .../matchbox-desktop-sato_git.bb                   |   4 +-
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |   2 +-
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |   2 +-
 .../matchbox-desktop/matchbox-desktop_git.bb       |   4 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   4 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |   4 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |   4 +-
 .../matchbox-terminal/matchbox-terminal_git.bb     |   4 +-
 .../matchbox-theme-sato/matchbox-theme-sato.inc    |   4 +-
 meta/recipes-sato/midori/midori_0.5.5.bb           |   2 +-
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |   4 +-
 .../recipes-sato/owl-video-widget/owl-video_git.bb |   4 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb         |   3 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |   4 +-
 meta/recipes-sato/puzzles/puzzles_r9765.bb         |   4 +-
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb |   1 +
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |   4 +-
 .../sato-screenshot/sato-screenshot_git.bb         |   4 +-
 .../settings-daemon/settings-daemon_git.bb         |   4 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   2 +-
 meta/recipes-support/apr/apr-util_1.5.2.bb         |   2 +-
 meta/recipes-support/apr/apr_1.4.8.bb              |   2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |   6 +-
 meta/recipes-support/atk/atk_2.10.0.bb             |   2 +-
 meta/recipes-support/attr/acl.inc                  |   2 +-
 meta/recipes-support/attr/attr.inc                 |   2 +-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  16 +-
 meta/recipes-support/boost/bjam-native_1.55.0.bb   |   2 +-
 meta/recipes-support/boost/boost.inc               |   2 +-
 .../recipes-support/consolekit/consolekit_0.4.6.bb |   6 +-
 .../createrepo/createrepo_0.4.11.bb                |   2 +-
 meta/recipes-support/curl/curl_7.33.0.bb           |   2 +-
 meta/recipes-support/db/db_5.3.21.bb               |   2 +-
 meta/recipes-support/enchant/enchant_1.6.0.bb      |  16 +-
 meta/recipes-support/gdbm/gdbm_1.10.bb             |   2 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |   2 +-
 meta/recipes-support/gmp/gmp.inc                   |   3 +-
 meta/recipes-support/gmp/gmp_4.2.1.bb              |   1 +
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   2 +-
 meta/recipes-support/gnupg/gnupg_2.0.22.bb         |   2 +-
 meta/recipes-support/gnutls/gnutls.inc             |   2 +-
 meta/recipes-support/gnutls/libtasn1_3.3.bb        |   2 +-
 meta/recipes-support/libassuan/libassuan_2.1.1.bb  |   2 +-
 meta/recipes-support/libbsd/libbsd_0.6.0.bb        |   1 +
 meta/recipes-support/libcap/libcap.inc             |   2 +-
 meta/recipes-support/libcheck/libcheck_0.9.11.bb   |   2 +-
 meta/recipes-support/libcroco/libcroco_0.6.8.bb    |   2 +-
 meta/recipes-support/libdaemon/libdaemon_0.14.bb   |   2 +-
 meta/recipes-support/libexif/libexif_0.6.21.bb     |   2 +-
 meta/recipes-support/libfm/libfm_1.1.2.2.bb        |   3 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   2 +-
 .../libgpg-error/libgpg-error_1.12.bb              |   2 +-
 meta/recipes-support/libical/libical_0.48.bb       |   2 +-
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   1 +
 meta/recipes-support/libiconv/libiconv_1.14.bb     |   1 +
 meta/recipes-support/libksba/libksba_1.3.0.bb      |   2 +-
 meta/recipes-support/libmpc/libmpc.inc             |   1 +
 meta/recipes-support/libnl/libnl_3.2.22.bb         |   2 +-
 meta/recipes-support/liboil/liboil_0.3.17.bb       |   2 +-
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |   2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb |   2 +-
 meta/recipes-support/liburcu/liburcu_0.8.1.bb      |   2 +-
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb |   1 +
 meta/recipes-support/libusb/libusb1_1.0.9.bb       |   2 +-
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |   2 +-
 meta/recipes-support/lzo/lzo_2.06.bb               |   2 +-
 meta/recipes-support/mpfr/mpfr.inc                 |   2 +-
 meta/recipes-support/mpfr/mpfr_3.1.2.bb            |   3 +-
 meta/recipes-support/neon/neon_0.30.0.bb           |   2 +-
 meta/recipes-support/npth/npth_0.91.bb             |   2 +-
 meta/recipes-support/nspr/nspr_4.10.2.bb           |   2 +-
 .../nss-myhostname/nss-myhostname_0.3.bb           |   1 +
 meta/recipes-support/popt/popt_1.16.bb             |   2 +-
 meta/recipes-support/pth/pth_2.0.7.bb              |   2 +-
 .../shared-mime-info/shared-mime-info.inc          |   2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   2 +-
 meta/recipes-support/taglib/taglib_1.8.bb          |   2 +-
 .../user-creation/xuser-account_0.1.bb             |   2 +-
 meta/recipes-support/vte/vte.inc                   |   2 +-
 367 files changed, 748 insertions(+), 669 deletions(-)
 rename meta/recipes-extended/images/{core-image-basic.bb => core-image-standardlinux.bb} (87%)
 delete mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
 create mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-standardlinux.bb

-- 
1.8.1.2


