Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEAC6B5D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:29:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457009930"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:29:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:01 +0000
Message-Id: <5eea8bd51aae2f55eb87b8846f9cd6e7aa35456e.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/38] Replace one-line DESCRIPTION with SUMMARY and tweak
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
X-List-Received-Date: Sat, 28 Dec 2013 22:29:56 -0000

These recipes had short one-line DESCRIPTION values and no SUMMARY value
set. In this case it's much better to just set SUMMARY since DESCRIPTION
is defaulted from SUMMARY anyway and then the SUMMARY is at least
useful vs. the default value ("${PN} version ${PV}-${PR}").

For these recipes, I also took the opportunity to fix up the new SUMMARY
values as the originals needed tweaking. I've tried to make them
concisely explain the function of the recipe / package where possible.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |   2 +-
 meta/recipes-bsp/acpid/acpid.inc                   |   2 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |   2 +-
 .../u-boot/u-boot-fw-utils-cross_2013.07.bb        |   2 +-
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb |   2 +-
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |   2 +-
 meta/recipes-bsp/usbinit/usbinit.bb                |   2 +-
 meta/recipes-bsp/x-load/x-load.inc                 |   2 +-
 meta/recipes-bsp/zaurusd/zaurusd_git.bb            |   2 +-
 .../connman/connman-gnome_0.7.bb                   |   2 +-
 .../libnss-mdns/libnss-mdns_0.10.bb                |   2 +-
 meta/recipes-connectivity/openssl/ocf-linux.inc    |   2 +-
 meta/recipes-connectivity/portmap/portmap.inc      |   2 +-
 .../ppp-dialin/ppp-dialin_0.1.bb                   |   2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |  16 +--
 .../telepathy/telepathy-mission-control_5.16.0.bb  |   2 +-
 .../telepathy/telepathy-python_0.15.19.bb          |   2 +-
 .../wpa-supplicant/wpa-supplicant-2.0.inc          |   2 +-
 meta/recipes-core/dbus/dbus-ptest_1.6.18.bb        |   2 +-
 .../initrdscripts/initramfs-boot_1.0.bb            |   2 +-
 .../initrdscripts/initramfs-framework_1.0.bb       |  10 +-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |   2 +-
 .../initramfs-live-install-efi_1.0.bb              |   2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |   2 +-
 meta/recipes-core/kbd/kbd_2.0.1.bb                 |   2 +-
 meta/recipes-core/meta/package-index.bb            |   2 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   2 +-
 .../systemd/systemd-systemctl-native.bb            |   2 +-
 meta/recipes-core/systemd/systemd_208.bb           |   2 +-
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   2 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   2 +-
 meta/recipes-devtools/apt/apt.inc                  |   2 +-
 meta/recipes-devtools/cmake/cmake.inc              |   2 +-
 .../desktop-file-utils-native_0.22.bb              |   2 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |   2 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   2 +-
 meta/recipes-devtools/elfutils/elfutils_0.155.bb   |   2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |   2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   2 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   2 +-
 meta/recipes-devtools/git/git.inc                  |   2 +-
 meta/recipes-devtools/guilt/guilt-native_git.bb    |   2 +-
 .../help2man/help2man-native_1.43.3.bb             |   2 +-
 meta/recipes-devtools/makedevs/makedevs_1.0.1.bb   |   2 +-
 meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |   2 +-
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |   2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |   2 +-
 meta/recipes-devtools/opkg/opkg-collateral.bb      |   2 +-
 meta/recipes-devtools/opkg/opkg.inc                |   6 +-
 meta/recipes-devtools/orc/orc.inc                  |   2 +-
 meta/recipes-devtools/perl/perl-native_5.14.3.bb   |   2 +-
 meta/recipes-devtools/perl/perl_5.14.3.bb          |   2 +-
 .../python/python-2.7-manifest.inc                 | 132 ++++++++++-----------
 meta/recipes-devtools/python/python-dbus_1.2.0.bb  |   2 +-
 .../python/python-docutils_0.11.bb                 |   2 +-
 meta/recipes-devtools/python/python-gst_0.10.22.bb |   2 +-
 .../python/python-imaging_1.1.7.bb                 |   2 +-
 .../python/python-pycairo_1.10.0.bb                |   2 +-
 .../python/python-pycurl_7.19.0.2.bb               |   2 +-
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |   2 +-
 meta/recipes-devtools/python/python-scons_2.3.0.bb |   2 +-
 .../python/python-setuptools_1.4.bb                |   2 +-
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
 meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |   2 +-
 meta/recipes-extended/bash/bash.inc                |   2 +-
 meta/recipes-extended/bc/bc_1.06.bb                |   2 +-
 meta/recipes-extended/cracklib/cracklib_2.9.1.bb   |   2 +-
 .../cwautomacros/cwautomacros_20110201.bb          |   2 +-
 meta/recipes-extended/ed/ed_0.5.bb                 |   2 +-
 meta/recipes-extended/ed/ed_1.9.bb                 |   2 +-
 meta/recipes-extended/lsb/lsbinitscripts_9.50.bb   |   2 +-
 meta/recipes-extended/lsb/lsbtest_1.0.bb           |   2 +-
 meta/recipes-extended/mc/mc_4.7.5.2.bb             |  10 +-
 meta/recipes-extended/mc/mc_4.8.10.bb              |  10 +-
 meta/recipes-extended/mdadm/mdadm_3.3.bb           |   2 +-
 meta/recipes-extended/mingetty/mingetty_1.08.bb    |   2 +-
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |   2 +-
 meta/recipes-extended/parted/parted_3.1.bb         |   2 +-
 .../perl/libconvert-asn1-perl_0.26.bb              |   2 +-
 .../recipes-extended/perl/libtimedate-perl_2.30.bb |   2 +-
 meta/recipes-extended/quota/quota_4.01.bb          |   2 +-
 meta/recipes-extended/sed/sed_4.1.2.bb             |   2 +-
 meta/recipes-extended/sed/sed_4.2.2.bb             |   2 +-
 .../recipes-extended/tzcode/tzcode-native_2013h.bb |   2 +-
 meta/recipes-extended/tzdata/tzdata_2013h.bb       |   2 +-
 meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +-
 meta/recipes-extended/wget/wget.inc                |   2 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   2 +-
 meta/recipes-extended/xz/xz_5.1.3alpha.bb          |   2 +-
 meta/recipes-extended/zip/zip.inc                  |   2 +-
 .../gnome/gsettings-desktop-schemas_3.7.3.bb       |   2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |   2 +-
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |   2 +-
 .../hicolor-icon-theme/hicolor-icon-theme_0.12.bb  |   2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |   2 +-
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |   2 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   2 +-
 meta/recipes-graphics/clutter/clutter-gst-1.0.inc  |   2 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |   2 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   2 +-
 .../matchbox-session/matchbox-session_0.1.bb       |   2 +-
 .../matchbox-wm/matchbox-wm_1.2.bb                 |   2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |   2 +-
 .../mini-x-session/mini-x-session_0.1.bb           |   2 +-
 meta/recipes-graphics/mx/mx.inc                    |   2 +-
 .../startup-notification_0.12.bb                   |   2 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   2 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |   2 +-
 .../xcursor-transparent-theme_0.1.1.bb             |   2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb     |   2 +-
 .../recipes-graphics/xorg-font/font-alias_1.0.3.bb |   2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb       |   2 +-
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |   2 +-
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |   2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |   2 +-
 .../modutils-initscripts/modutils-initscripts.bb   |   2 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |   2 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   2 +-
 .../recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |   2 +-
 .../alsa/alsa-utils-alsaconf_1.0.27.2.bb           |   3 +-
 .../recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb |  20 ++--
 .../gstreamer/gst-fluendo-mp3_0.10.19.bb           |   4 +-
 .../gstreamer/gst-fluendo-mpegdemux_0.10.72.bb     |   2 +-
 .../gstreamer/gst-meta-base_0.10.bb                |   2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |   2 +-
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |   2 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |   2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |   2 +-
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |   2 +-
 .../libsamplerate/libsamplerate0_0.1.8.bb          |   2 +-
 .../libsndfile/libsndfile1_1.0.25.bb               |   2 +-
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   2 +-
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |   2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   2 +-
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   2 +-
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   2 +-
 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb  |   2 +-
 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |   2 +-
 meta/recipes-sato/gaku/gaku_git.bb                 |   2 +-
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |   2 +-
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |   2 +-
 .../matchbox-desktop-sato_git.bb                   |   2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |   2 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |   2 +-
 .../matchbox-terminal/matchbox-terminal_git.bb     |   2 +-
 meta/recipes-sato/midori/midori_0.5.5.bb           |   2 +-
 meta/recipes-sato/puzzles/puzzles_r9765.bb         |   2 +-
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |   2 +-
 .../sato-screenshot/sato-screenshot_git.bb         |   2 +-
 .../settings-daemon/settings-daemon_git.bb         |   2 +-
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |   2 +-
 meta/recipes-support/atk/atk_2.10.0.bb             |   2 +-
 meta/recipes-support/attr/acl.inc                  |   2 +-
 meta/recipes-support/attr/attr.inc                 |   2 +-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |   2 +-
 .../recipes-support/consolekit/consolekit_0.4.6.bb |   2 +-
 .../createrepo/createrepo_0.4.11.bb                |   2 +-
 meta/recipes-support/curl/curl_7.33.0.bb           |   2 +-
 meta/recipes-support/db/db_5.3.21.bb               |   2 +-
 meta/recipes-support/gdbm/gdbm_1.10.bb             |   2 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |   2 +-
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   2 +-
 meta/recipes-support/gnupg/gnupg_2.0.22.bb         |   2 +-
 meta/recipes-support/libcap/libcap.inc             |   2 +-
 meta/recipes-support/libcheck/libcheck_0.9.11.bb   |   2 +-
 meta/recipes-support/libcroco/libcroco_0.6.8.bb    |   2 +-
 meta/recipes-support/libdaemon/libdaemon_0.14.bb   |   2 +-
 meta/recipes-support/libexif/libexif_0.6.21.bb     |   2 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   2 +-
 .../libgpg-error/libgpg-error_1.12.bb              |   2 +-
 meta/recipes-support/libksba/libksba_1.3.0.bb      |   2 +-
 meta/recipes-support/libmpc/libmpc.inc             |   1 +
 meta/recipes-support/libnl/libnl_3.2.22.bb         |   2 +-
 meta/recipes-support/liboil/liboil_0.3.17.bb       |   2 +-
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |   2 +-
 meta/recipes-support/liburcu/liburcu_0.8.1.bb      |   2 +-
 meta/recipes-support/mpfr/mpfr.inc                 |   2 +-
 meta/recipes-support/neon/neon_0.30.0.bb           |   2 +-
 meta/recipes-support/npth/npth_0.91.bb             |   2 +-
 meta/recipes-support/popt/popt_1.16.bb             |   2 +-
 meta/recipes-support/pth/pth_2.0.7.bb              |   2 +-
 .../shared-mime-info/shared-mime-info.inc          |   2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   2 +-
 meta/recipes-support/taglib/taglib_1.8.bb          |   2 +-
 .../user-creation/xuser-account_0.1.bb             |   2 +-
 meta/recipes-support/vte/vte.inc                   |   2 +-
 204 files changed, 300 insertions(+), 300 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index 3136ae7..c40b393 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "hello-world-mod tests the module.bbclass mechanism."
+SUMMARY = "Example of how to build an external Linux kernel module"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
diff --git a/meta/recipes-bsp/acpid/acpid.inc b/meta/recipes-bsp/acpid/acpid.inc
index a384265..0341094 100644
--- a/meta/recipes-bsp/acpid/acpid.inc
+++ b/meta/recipes-bsp/acpid/acpid.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "A daemon for delivering ACPI events."
+SUMMARY = "A daemon for delivering ACPI events"
 HOMEPAGE = "http://sourceforge.net/projects/acpid/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=33140&atid=407341"
 
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 0ef939e..eafe820 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Linux Kernel 2.6 Userland Utilities for the PCMCIA Subsystem"
+SUMMARY = "Linux kernel userland utilities for the PCMCIA subsystem"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html"
 SECTION = "kernel/userland"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
index 4b7fd24..e616397 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 SECTION = "bootloader"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
index be54343..14b0976 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 SECTION = "bootloader"
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
index a1b1db9..2ca6050 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
+SUMMARY = "U-Boot bootloader image creation tool"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 SECTION = "bootloader"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 10a3cf8..f49bb5d 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "U-Boot - the Universal Boot Loader"
+SUMMARY = "Universal Boot Loader for embedded devices"
 HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
 SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index 37e3b16..aba44b4 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Initscript to manage gadget Ethernet"
+SUMMARY = "Initscript for enabling USB gadget Ethernet"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-bsp/x-load/x-load.inc b/meta/recipes-bsp/x-load/x-load.inc
index 3b55eb1..05d5ff0 100644
--- a/meta/recipes-bsp/x-load/x-load.inc
+++ b/meta/recipes-bsp/x-load/x-load.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "x-load bootloader loader"
+SUMMARY = "First level bootloader for OMAP SoCs"
 SECTION = "bootloaders"
 LICENSE = "GPL"
 
diff --git a/meta/recipes-bsp/zaurusd/zaurusd_git.bb b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
index 7460337..b1c0e28 100644
--- a/meta/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Daemon to handle device specifc features."
+SUMMARY = "Daemon to handle device-specific features"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 2d422b2..f69d78c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "gtk frontend for connman"
+SUMMARY = "GTK+ frontend for the ConnMan network connection manager"
 HOMEPAGE = "http://connman.net/"
 SECTION = "libs/network"
 LICENSE = "GPLv2 & LGPLv2.1"
diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index a2712c9..86d6377 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "NSS module for Multicast DNS name resolution"
+SUMMARY = "Name Service Switch module for Multicast DNS (zeroconf) name resolution"
 HOMEPAGE = "http://0pointer.de/lennart/projects/nss-mdns/"
 SECTION = "libs"
 
diff --git a/meta/recipes-connectivity/openssl/ocf-linux.inc b/meta/recipes-connectivity/openssl/ocf-linux.inc
index 4efdc2f..d6cde9a 100644
--- a/meta/recipes-connectivity/openssl/ocf-linux.inc
+++ b/meta/recipes-connectivity/openssl/ocf-linux.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Install required headers to enable OCF Linux support"
+SUMMARY = "Installs required headers for OCF-Linux crypto acceleration support"
 LICENSE = "BSD"
 
 LIC_FILES_CHKSUM = "file://README;md5=493ffe65655667614cf24567adf22f11"
diff --git a/meta/recipes-connectivity/portmap/portmap.inc b/meta/recipes-connectivity/portmap/portmap.inc
index 0dfa78c..7588341 100644
--- a/meta/recipes-connectivity/portmap/portmap.inc
+++ b/meta/recipes-connectivity/portmap/portmap.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "RPC program number mapper."
+SUMMARY = "RPC program number mapper"
 HOMEPAGE = "http://neil.brown.name/portmap/"
 SECTION = "console/network"
 LICENSE = "BSD"
diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index d239c20..a7943f3 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -1,5 +1,5 @@
+SUMMARY = "Enables PPP dial-in through a serial connection"
 SECTION = "console/network"
-DESCRIPTION = "Enables PPP dial-in through a serial connection"
 DEPENDS = "ppp"
 RDEPENDS_${PN} = "ppp"
 PR = "r8"
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
index e951068..52bab4f 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
@@ -81,11 +81,11 @@ FILES_${PN}-minconn  = "${libdir}/pppd/${PV}/minconn.so"
 FILES_${PN}-password = "${libdir}/pppd/${PV}/pass*.so"
 FILES_${PN}-l2tp     = "${libdir}/pppd/${PV}/*l2tp.so"
 FILES_${PN}-tools    = "${sbindir}/pppstats ${sbindir}/pppdump"
-DESCRIPTION_${PN}-oa       = "Plugin for PPP needed for PPP-over-ATM"
-DESCRIPTION_${PN}-oe       = "Plugin for PPP needed for PPP-over-Ethernet"
-DESCRIPTION_${PN}-radius   = "Plugin for PPP that are related to RADIUS"
-DESCRIPTION_${PN}-winbind  = "Plugin for PPP to authenticate against Samba or Windows"
-DESCRIPTION_${PN}-minconn  = "Plugin for PPP to specify a minimum connect time before the idle timeout applies"
-DESCRIPTION_${PN}-password = "Plugin for PPP to get passwords via a pipe"
-DESCRIPTION_${PN}-l2tp     = "Plugin for PPP for l2tp support"
-DESCRIPTION_${PN}-tools    = "The pppdump and pppstats utitilities"
+SUMMARY_${PN}-oa       = "Plugin for PPP for PPP-over-ATM support"
+SUMMARY_${PN}-oe       = "Plugin for PPP for PPP-over-Ethernet support"
+SUMMARY_${PN}-radius   = "Plugin for PPP for RADIUS support"
+SUMMARY_${PN}-winbind  = "Plugin for PPP to authenticate against Samba or Windows"
+SUMMARY_${PN}-minconn  = "Plugin for PPP to set a delay before the idle timeout applies"
+SUMMARY_${PN}-password = "Plugin for PPP to get passwords via a pipe"
+SUMMARY_${PN}-l2tp     = "Plugin for PPP for l2tp support"
+SUMMARY_${PN}-tools    = "Additional tools for the PPP package"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
index bdab9c1..0716780 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Central control for Telepathy connection managers"
+SUMMARY = "Central control for Telepathy IM connection managers"
 HOMEPAGE = "http://mission-control.sourceforge.net/"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 5a02d81..1716702 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Telepathy framework - Python package"
+SUMMARY = "Telepathy IM framework - Python package"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index ce669a1..491dfbf 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
+SUMMARY = "Client for Wi-Fi Protected Access (WPA)"
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
index 94af4c5..c54e957 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.18.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "D-Bus test package, only used for D-bus functionality test."
+SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
 HOMEPAGE = "http://dbus.freedesktop.org"
 SECTION = "base"
 LICENSE = "AFL-2 | GPLv2+"
diff --git a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
index 6f9b4c2..0ede20b 100644
--- a/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-boot_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A live image init script"
+SUMMARY = "Extremely basic live image init script"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-boot.sh"
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index a2c0813..861bec3 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "initramfs modular system"
+SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS_${PN} += "busybox"
@@ -42,18 +42,18 @@ PACKAGES = "${PN}-base \
 
 FILES_${PN}-base = "/init /init.d/99-finish"
 
-DESCRIPTION_initramfs-module-mdev = "initramfs support for mdev"
+SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
 RDEPENDS_initramfs-module-mdev = "${PN}-base"
 FILES_initramfs-module-mdev = "/init.d/01-mdev"
 
-DESCRIPTION_initramfs-module-udev = "initramfs support for udev"
+SUMMARY_initramfs-module-udev = "initramfs support for udev"
 RDEPENDS_initramfs-module-udev = "${PN}-base udev udev-utils"
 FILES_initramfs-module-udev = "/init.d/01-udev"
 
-DESCRIPTION_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
+SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
 RDEPENDS_initramfs-module-e2fs = "${PN}-base"
 FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
 
-DESCRIPTION_initramfs-module-debug = "initramfs dynamic debug support"
+SUMMARY_initramfs-module-debug = "initramfs dynamic debug support"
 RDEPENDS_initramfs-module-debug = "${PN}-base"
 FILES_initramfs-module-debug = "/init.d/00-debug"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 8626bb5..2d378e2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A live image init script"
+SUMMARY = "Live image init script"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 DEPENDS = "virtual/kernel"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index 264931f..7195dc2 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A live image init script for grub-efi"
+SUMMARY = "Live image install script for grub-efi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install-efi.sh"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 3a8836d..7bf31c9 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A live image init script for grub"
+SUMMARY = "Live image install script for grub"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
diff --git a/meta/recipes-core/kbd/kbd_2.0.1.bb b/meta/recipes-core/kbd/kbd_2.0.1.bb
index b2afc60..998a2d3 100644
--- a/meta/recipes-core/kbd/kbd_2.0.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "This package contains keytable files and keyboard utilities"
+SUMMARY = "Keytable files and keyboard utilities"
 # everything minus console-fonts is GPLv2+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a5fcc36121d93e1f69d96a313078c8b5"
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 76bf331..3cc1239 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Rebuild the package index"
+SUMMARY = "Rebuilds the package index"
 LICENSE = "MIT"
 
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index e4d93d2..a94be36 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Units to make systemd work better with existing sysvinit scripts"
+SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 37c49b1..8db3d00 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Systemd serial config"
+SUMMARY = "Serial terminal support for systemd"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native.bb
index 5940584..898c204 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl-native.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Wrapper to enable of systemd services"
+SUMMARY = "Wrapper for enabling systemd services"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 372e73d..dcf68dc 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Systemd a init replacement"
+SUMMARY = "System and service manager for Linux, replacing SysVinit"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
 
 LICENSE = "GPLv2 & LGPLv2.1 & MIT"
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 05ba410..a13d509 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Inittab for sysvinit"
+SUMMARY = "Inittab configuration for SysVinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index f2d5659..dd25f71 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "System-V like init."
+SUMMARY = "System-V like init"
 DESCRIPTION = "This package is required to boot in most configurations.  It provides the /sbin/init program.  This is the first process started on boot, and the last process terminated before the system halts."
 HOMEPAGE = "http://savannah.nongnu.org/projects/sysvinit/"
 SECTION = "base"
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 83411a9..b528c00 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Advanced front-end for dpkg."
+SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 014ff5a..69f4fe2 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -1,7 +1,7 @@
 # Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-DESCRIPTION = "A cross-platform, open-source make system"
+SUMMARY = "Cross-platform, open-source make system"
 HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
index 2a77642..6f73564 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils-native_0.22.bb
@@ -1,6 +1,6 @@
 SECTION = "console/utils"
+SUMMARY = "Command line utilities for working with *.desktop files"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/desktop-file-utils"
-DESCRIPTION = "command line utilities to work with *.desktop files"
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index b1da4fb..c04c0ee 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Package maintenance system for Debian."
+SUMMARY = "Package maintenance system from Debian"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 6336a09..1106242 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A collection of utilities and DSOs to handle compiled objects."
+SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://fedorahosted.org/elfutils"
 SECTION = "base"
 LICENSE = "(GPL-2+ & Elfutils-Exception)"
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.155.bb b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
index 14eac26..b1f410c 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.155.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.155.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A collection of utilities and DSOs to handle compiled objects."
+SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://fedorahosted.org/elfutils"
 SECTION = "base"
 LICENSE = "(GPLv3 & Elfutils-Exception)"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 112e8ce..feb402e 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "The GNU cc and gcc C compilers."
+SUMMARY = "GNU cc and gcc C compilers"
 HOMEPAGE = "http://www.gnu.org/software/gcc/"
 SECTION = "devel"
 LICENSE = "GPL"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 136f267..477f499 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -1,6 +1,6 @@
 inherit cross-canadian
 
-DESCRIPTION = "The cross-canadian GNU cc and gcc C compilers for ${TARGET_ARCH} target."
+SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gcc"
 
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 6954954..31b5d73 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "gdb - GNU debugger"
+SUMMARY = "GNU debugger"
 HOMEPAGE = "http://www.gnu.org/software/gdb/"
 LICENSE="GPLv3+"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 653f52b..e594bb1 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -1,7 +1,7 @@
 inherit cross-canadian
 inherit python-dir
 
-DESCRIPTION = "cross-canadian gdb for ${TARGET_ARCH} target - GNU debugger"
+SUMMARY = "GNU debugger (cross-canadian gdb for ${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index f33069c..024bd9c 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "The git revision control system used by the Linux kernel developers"
+SUMMARY = "Distributed version control system"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 DEPENDS = "openssl curl zlib expat"
diff --git a/meta/recipes-devtools/guilt/guilt-native_git.bb b/meta/recipes-devtools/guilt/guilt-native_git.bb
index 9c75c3c..e88ae2c 100644
--- a/meta/recipes-devtools/guilt/guilt-native_git.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "guilt is quilt like tool for git"
+SUMMARY = "quilt-like tool for Git"
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6f3400dc1a01cebafe8a52b3f344135"
diff --git a/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb b/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
index d20cee1..5bf6149 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.43.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Program to create simple man pages"
+SUMMARY = "Program for creating simple man pages"
 SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 6aa75a8..dd9bea2 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A tool to make device nodes"
+SUMMARY = "Tool for creating device nodes"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "base"
diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
index 07bff64..baa8f45 100644
--- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
+++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A utility to create ELF boot images for ELF-based Linux kernel images"
+SUMMARY = "Utility for creating ELF boot images for ELF-based Linux kernel images"
 HOMEPAGE = "http://www.coreboot.org/Mkelfimage"
 SECTION = "devel"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index ea52784..6042dee 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tools for managing memory technology devices."
+SUMMARY = "Tools for managing memory technology devices"
 SECTION = "base"
 DEPENDS = "zlib lzo e2fsprogs util-linux"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 279cb74..10063e8 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OPKG Package Manager Utilities"
+SUMMARY = "Additional utilities for the opkg package manager"
 SECTION = "base"
 HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb b/meta/recipes-devtools/opkg/opkg-collateral.bb
index cacd880..b121827 100644
--- a/meta/recipes-devtools/opkg/opkg-collateral.bb
+++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "opkg configuration files"
+SUMMARY = "Constructs the main configuration file for opkg"
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index 4ffd430..c9fb505 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -1,6 +1,6 @@
-DESCRIPTION = "Open Package Manager"
-DESCRIPTION_libopkg = "Open Package Manager Library"
-DESCRIPTION_update-alternatives-cworth = "Update alternatives"
+SUMMARY = "Open Package Manager"
+SUMMARY_libopkg = "Open Package Manager library"
+SUMMARY_update-alternatives-cworth = "Utility for managing the alternatives system"
 SECTION = "base"
 HOMEPAGE = "http://code.google.com/p/opkg/"
 BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
diff --git a/meta/recipes-devtools/orc/orc.inc b/meta/recipes-devtools/orc/orc.inc
index 6fd66a3..b134831 100644
--- a/meta/recipes-devtools/orc/orc.inc
+++ b/meta/recipes-devtools/orc/orc.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "orc - The Oil Runtime Compiler"
+SUMMARY = "Optimised Inner Loop Runtime Compiler"
 HOMEPAGE = "http://code.entropywave.com/projects/orc/"
 LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
index 659baaa..e664e24 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Perl is a popular scripting language."
+SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index 3829d4b..09a3f3b 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Perl is a popular scripting language."
+SUMMARY = "Perl scripting language"
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0"
diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 8e52252..49dbc0b 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -9,268 +9,268 @@ PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-c
 
 PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
 
-DESCRIPTION_${PN}-2to3="Python Automated Python 2 to 3 code translation"
+SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
 FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python2.7/lib2to3 "
 
-DESCRIPTION_${PN}-audio="Python Audio Handling"
+SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
 FILES_${PN}-audio="${libdir}/python2.7/wave.* ${libdir}/python2.7/chunk.* ${libdir}/python2.7/sndhdr.* ${libdir}/python2.7/lib-dynload/ossaudiodev.so ${libdir}/python2.7/lib-dynload/audioop.so ${libdir}/python2.7/audiodev.* ${libdir}/python2.7/sunaudio.* ${libdir}/python2.7/sunau.* ${libdir}/python2.7/toaiff.* "
 
-DESCRIPTION_${PN}-bsddb="Python Berkeley Database Bindings"
+SUMMARY_${PN}-bsddb="Python bindings for the Berkeley Database"
 RDEPENDS_${PN}-bsddb="${PN}-core"
 FILES_${PN}-bsddb="${libdir}/python2.7/bsddb ${libdir}/python2.7/lib-dynload/_bsddb.so "
 
-DESCRIPTION_${PN}-codecs="Python Codecs, Encodings & i18n Support"
+SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
 RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
 FILES_${PN}-codecs="${libdir}/python2.7/codecs.* ${libdir}/python2.7/encodings ${libdir}/python2.7/gettext.* ${libdir}/python2.7/locale.* ${libdir}/python2.7/lib-dynload/_locale.so ${libdir}/python2.7/lib-dynload/_codecs* ${libdir}/python2.7/lib-dynload/_multibytecodec.so ${libdir}/python2.7/lib-dynload/unicodedata.so ${libdir}/python2.7/stringprep.* ${libdir}/python2.7/xdrlib.* "
 
-DESCRIPTION_${PN}-compile="Python Bytecode Compilation Support"
+SUMMARY_${PN}-compile="Python bytecode compilation support"
 RDEPENDS_${PN}-compile="${PN}-core"
 FILES_${PN}-compile="${libdir}/python2.7/py_compile.* ${libdir}/python2.7/compileall.* "
 
-DESCRIPTION_${PN}-compiler="Python Compiler Support"
+SUMMARY_${PN}-compiler="Python compiler support"
 RDEPENDS_${PN}-compiler="${PN}-core"
 FILES_${PN}-compiler="${libdir}/python2.7/compiler "
 
-DESCRIPTION_${PN}-compression="Python High Level Compression Support"
+SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
 FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.* ${libdir}/python2.7/tarfile.* ${libdir}/python2.7/lib-dynload/bz2.so "
 
-DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
+SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
 FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so \
 ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
-DESCRIPTION_${PN}-crypt="Python Basic Cryptographic and Hashing Support"
+SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
 FILES_${PN}-crypt="${libdir}/python2.7/hashlib.* ${libdir}/python2.7/md5.* ${libdir}/python2.7/sha.* ${libdir}/python2.7/lib-dynload/crypt.so ${libdir}/python2.7/lib-dynload/_hashlib.so ${libdir}/python2.7/lib-dynload/_sha256.so ${libdir}/python2.7/lib-dynload/_sha512.so "
 
-DESCRIPTION_${PN}-ctypes="Python C Types Support"
+SUMMARY_${PN}-ctypes="Python C types support"
 RDEPENDS_${PN}-ctypes="${PN}-core"
 FILES_${PN}-ctypes="${libdir}/python2.7/ctypes ${libdir}/python2.7/lib-dynload/_ctypes.so ${libdir}/python2.7/lib-dynload/_ctypes_test.so "
 
-DESCRIPTION_${PN}-curses="Python Curses Support"
+SUMMARY_${PN}-curses="Python curses support"
 RDEPENDS_${PN}-curses="${PN}-core"
 FILES_${PN}-curses="${libdir}/python2.7/curses ${libdir}/python2.7/lib-dynload/_curses.so ${libdir}/python2.7/lib-dynload/_curses_panel.so "
 
-DESCRIPTION_${PN}-datetime="Python Calendar and Time support"
+SUMMARY_${PN}-datetime="Python calendar and time support"
 RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
 FILES_${PN}-datetime="${libdir}/python2.7/_strptime.* ${libdir}/python2.7/calendar.* ${libdir}/python2.7/lib-dynload/datetime.so "
 
-DESCRIPTION_${PN}-db="Python File-Based Database Support"
+SUMMARY_${PN}-db="Python file-based database support"
 RDEPENDS_${PN}-db="${PN}-core"
 FILES_${PN}-db="${libdir}/python2.7/anydbm.* ${libdir}/python2.7/dumbdbm.* ${libdir}/python2.7/whichdb.* "
 
-DESCRIPTION_${PN}-debugger="Python Debugger"
+SUMMARY_${PN}-debugger="Python debugger"
 RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
 FILES_${PN}-debugger="${libdir}/python2.7/bdb.* ${libdir}/python2.7/pdb.* "
 
-DESCRIPTION_${PN}-dev="Python Development Package"
+SUMMARY_${PN}-dev="Python development package"
 RDEPENDS_${PN}-dev="${PN}-core"
 FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig "
 
-DESCRIPTION_${PN}-difflib="Python helpers for computing deltas between objects."
+SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
 FILES_${PN}-difflib="${libdir}/python2.7/difflib.* "
 
-DESCRIPTION_${PN}-distutils="Python Distribution Utilities"
+SUMMARY_${PN}-distutils="Python Distribution Utilities"
 RDEPENDS_${PN}-distutils="${PN}-core"
 FILES_${PN}-distutils="${libdir}/python2.7/config ${libdir}/python2.7/distutils "
 
-DESCRIPTION_${PN}-distutils-staticdev="Python Distribution Utilities (Static Libraries)"
+SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
 RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
 FILES_${PN}-distutils-staticdev="${libdir}/python2.7/config/lib*.a "
 
-DESCRIPTION_${PN}-doctest="Python framework for running examples in docstrings."
+SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
 RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
 FILES_${PN}-doctest="${libdir}/python2.7/doctest.* "
 
-DESCRIPTION_${PN}-elementtree="Python elementree"
+SUMMARY_${PN}-elementtree="Python elementree"
 RDEPENDS_${PN}-elementtree="${PN}-core"
 FILES_${PN}-elementtree="${libdir}/python2.7/lib-dynload/_elementtree.so "
 
-DESCRIPTION_${PN}-email="Python Email Support"
+SUMMARY_${PN}-email="Python email support"
 RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
 FILES_${PN}-email="${libdir}/python2.7/imaplib.* ${libdir}/python2.7/email "
 
-DESCRIPTION_${PN}-fcntl="Python's fcntl Interface"
+SUMMARY_${PN}-fcntl="Python's fcntl interface"
 RDEPENDS_${PN}-fcntl="${PN}-core"
 FILES_${PN}-fcntl="${libdir}/python2.7/lib-dynload/fcntl.so "
 
-DESCRIPTION_${PN}-gdbm="Python GNU Database Support"
+SUMMARY_${PN}-gdbm="Python GNU database support"
 RDEPENDS_${PN}-gdbm="${PN}-core"
 FILES_${PN}-gdbm="${libdir}/python2.7/lib-dynload/gdbm.so "
 
-DESCRIPTION_${PN}-hotshot="Python Hotshot Profiler"
+SUMMARY_${PN}-hotshot="Python hotshot performance profiler"
 RDEPENDS_${PN}-hotshot="${PN}-core"
 FILES_${PN}-hotshot="${libdir}/python2.7/hotshot ${libdir}/python2.7/lib-dynload/_hotshot.so "
 
-DESCRIPTION_${PN}-html="Python HTML Processing"
+SUMMARY_${PN}-html="Python HTML processing support"
 RDEPENDS_${PN}-html="${PN}-core"
 FILES_${PN}-html="${libdir}/python2.7/formatter.* ${libdir}/python2.7/htmlentitydefs.* ${libdir}/python2.7/htmllib.* ${libdir}/python2.7/markupbase.* ${libdir}/python2.7/sgmllib.* ${libdir}/python2.7/HTMLParser.* "
 
-DESCRIPTION_${PN}-idle="Python Integrated Development Environment"
+SUMMARY_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
 FILES_${PN}-idle="${bindir}/idle ${libdir}/python2.7/idlelib "
 
-DESCRIPTION_${PN}-image="Python Graphical Image Handling"
+SUMMARY_${PN}-image="Python graphical image handling"
 RDEPENDS_${PN}-image="${PN}-core"
 FILES_${PN}-image="${libdir}/python2.7/colorsys.* ${libdir}/python2.7/imghdr.* ${libdir}/python2.7/lib-dynload/imageop.so ${libdir}/python2.7/lib-dynload/rgbimg.so "
 
-DESCRIPTION_${PN}-io="Python Low-Level I/O"
+SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils"
 FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
 
-DESCRIPTION_${PN}-json="Python JSON Support"
+SUMMARY_${PN}-json="Python JSON support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
 FILES_${PN}-json="${libdir}/python2.7/json ${libdir}/python2.7/lib-dynload/_json.so "
 
-DESCRIPTION_${PN}-lang="Python Low-Level Language Support"
+SUMMARY_${PN}-lang="Python low-level language support"
 RDEPENDS_${PN}-lang="${PN}-core"
 FILES_${PN}-lang="${libdir}/python2.7/lib-dynload/_bisect.so ${libdir}/python2.7/lib-dynload/_collections.so ${libdir}/python2.7/lib-dynload/_heapq.so ${libdir}/python2.7/lib-dynload/_weakref.so ${libdir}/python2.7/lib-dynload/_functools.so ${libdir}/python2.7/lib-dynload/array.so ${libdir}/python2.7/lib-dynload/itertools.so ${libdir}/python2.7/lib-dynload/operator.so ${libdir}/python2.7/lib-dynload/parser.so ${libdir}/python2.7/atexit.* ${libdir}/python2.7/bisect.* ${libdir}/python2.7/code.* ${libdir}/python2.7/codeop.* ${libdir}/python2.7/collections.* ${libdir}/python2.7/dis.* ${libdir}/python2.7/functools.* ${libdir}/python2.7/heapq.* ${libdir}/python2.7/inspect.* ${libdir}/python2.7/keyword.* ${libdir}/python2.7/opcode.* ${libdir}/python2.7/symbol.* ${libdir}/python2.7/repr.* ${libdir}/python2.7/token.* ${libdir}/python2.7/tokenize.* ${libdir}/python2.7/traceback.* ${libdir}/python2.7/weakref.* "
 
-DESCRIPTION_${PN}-logging="Python Logging Support"
+SUMMARY_${PN}-logging="Python logging support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
 FILES_${PN}-logging="${libdir}/python2.7/logging "
 
-DESCRIPTION_${PN}-mailbox="Python Mailbox Format Support"
+SUMMARY_${PN}-mailbox="Python mailbox format support"
 RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
 FILES_${PN}-mailbox="${libdir}/python2.7/mailbox.* "
 
-DESCRIPTION_${PN}-math="Python Math Support"
+SUMMARY_${PN}-math="Python math support"
 RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
 FILES_${PN}-math="${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/python2.7/lib-dynload/math.so ${libdir}/python2.7/lib-dynload/_random.so ${libdir}/python2.7/random.* ${libdir}/python2.7/sets.* "
 
-DESCRIPTION_${PN}-mime="Python MIME Handling APIs"
+SUMMARY_${PN}-mime="Python MIME handling APIs"
 RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
 FILES_${PN}-mime="${libdir}/python2.7/mimetools.* ${libdir}/python2.7/uu.* ${libdir}/python2.7/quopri.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/MimeWriter.* "
 
-DESCRIPTION_${PN}-mmap="Python Memory-Mapped-File Support"
+SUMMARY_${PN}-mmap="Python memory-mapped file support"
 RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
 FILES_${PN}-mmap="${libdir}/python2.7/lib-dynload/mmap.so "
 
-DESCRIPTION_${PN}-multiprocessing="Python Multiprocessing Support"
+SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
 RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes"
 FILES_${PN}-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so ${libdir}/python2.7/multiprocessing "
 
-DESCRIPTION_${PN}-netclient="Python Internet Protocol Clients"
+SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
 FILES_${PN}-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* "
 
-DESCRIPTION_${PN}-netserver="Python Internet Protocol Servers"
+SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
 FILES_${PN}-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer.* ${libdir}/python2.7/SocketServer.* "
 
-DESCRIPTION_${PN}-numbers="Python Number APIs"
+SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
 FILES_${PN}-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.* "
 
-DESCRIPTION_${PN}-pickle="Python Persistence Support"
+SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
 FILES_${PN}-pickle="${libdir}/python2.7/pickle.* ${libdir}/python2.7/shelve.* ${libdir}/python2.7/lib-dynload/cPickle.so ${libdir}/python2.7/pickletools.* "
 
-DESCRIPTION_${PN}-pkgutil="Python Package Extension Utility Support"
+SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
 FILES_${PN}-pkgutil="${libdir}/python2.7/pkgutil.* "
 
-DESCRIPTION_${PN}-pprint="Python Pretty-Print Support"
+SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
 FILES_${PN}-pprint="${libdir}/python2.7/pprint.* "
 
-DESCRIPTION_${PN}-profile="Python Basic Profiling Support"
+SUMMARY_${PN}-profile="Python basic performance profiling support"
 RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
 FILES_${PN}-profile="${libdir}/python2.7/profile.* ${libdir}/python2.7/pstats.* ${libdir}/python2.7/cProfile.* ${libdir}/python2.7/lib-dynload/_lsprof.so "
 
-DESCRIPTION_${PN}-pydoc="Python Interactive Help Support"
+SUMMARY_${PN}-pydoc="Python interactive help support"
 RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
 FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python2.7/pydoc.* ${libdir}/python2.7/pydoc_data "
 
-DESCRIPTION_${PN}-re="Python Regular Expression APIs"
+SUMMARY_${PN}-re="Python Regular Expression APIs"
 RDEPENDS_${PN}-re="${PN}-core"
 FILES_${PN}-re="${libdir}/python2.7/re.* ${libdir}/python2.7/sre.* ${libdir}/python2.7/sre_compile.* ${libdir}/python2.7/sre_constants* ${libdir}/python2.7/sre_parse.* "
 
-DESCRIPTION_${PN}-readline="Python Readline Support"
+SUMMARY_${PN}-readline="Python readline support"
 RDEPENDS_${PN}-readline="${PN}-core"
 FILES_${PN}-readline="${libdir}/python2.7/lib-dynload/readline.so ${libdir}/python2.7/rlcompleter.* "
 
-DESCRIPTION_${PN}-resource="Python Resource Control Interface"
+SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
 FILES_${PN}-resource="${libdir}/python2.7/lib-dynload/resource.so "
 
-DESCRIPTION_${PN}-robotparser="Python robots.txt parser"
+SUMMARY_${PN}-robotparser="Python robots.txt parser"
 RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
 FILES_${PN}-robotparser="${libdir}/python2.7/robotparser.* "
 
-DESCRIPTION_${PN}-shell="Python Shell-Like Functionality"
+SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
 FILES_${PN}-shell="${libdir}/python2.7/cmd.* ${libdir}/python2.7/commands.* ${libdir}/python2.7/dircache.* ${libdir}/python2.7/fnmatch.* ${libdir}/python2.7/glob.* ${libdir}/python2.7/popen2.* ${libdir}/python2.7/shlex.* ${libdir}/python2.7/shutil.* "
 
-DESCRIPTION_${PN}-smtpd="Python Simple Mail Transport Daemon"
+SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
 FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python2.7/smtpd.* "
 
-DESCRIPTION_${PN}-sqlite3="Python Sqlite3 Database Support"
+SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
 RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib"
 FILES_${PN}-sqlite3="${libdir}/python2.7/lib-dynload/_sqlite3.so ${libdir}/python2.7/sqlite3/dbapi2.* ${libdir}/python2.7/sqlite3/__init__.* ${libdir}/python2.7/sqlite3/dump.* "
 
-DESCRIPTION_${PN}-sqlite3-tests="Python Sqlite3 Database Support Tests"
+SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
 RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
 FILES_${PN}-sqlite3-tests="${libdir}/python2.7/sqlite3/test "
 
-DESCRIPTION_${PN}-stringold="Python String APIs [deprecated]"
+SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
 RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
 FILES_${PN}-stringold="${libdir}/python2.7/lib-dynload/strop.so ${libdir}/python2.7/string.* ${libdir}/python2.7/stringold.* "
 
-DESCRIPTION_${PN}-subprocess="Python Subprocess Support"
+SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
 FILES_${PN}-subprocess="${libdir}/python2.7/subprocess.* "
 
-DESCRIPTION_${PN}-syslog="Python Syslog Interface"
+SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
 FILES_${PN}-syslog="${libdir}/python2.7/lib-dynload/syslog.so "
 
-DESCRIPTION_${PN}-terminal="Python Terminal Controlling Support"
+SUMMARY_${PN}-terminal="Python terminal controlling support"
 RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
 FILES_${PN}-terminal="${libdir}/python2.7/pty.* ${libdir}/python2.7/tty.* "
 
-DESCRIPTION_${PN}-tests="Python Tests"
+SUMMARY_${PN}-tests="Python tests"
 RDEPENDS_${PN}-tests="${PN}-core"
 FILES_${PN}-tests="${libdir}/python2.7/test "
 
-DESCRIPTION_${PN}-textutils="Python Option Parsing, Text Wrapping and Comma-Separated-Value Support"
+SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
 RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
 FILES_${PN}-textutils="${libdir}/python2.7/lib-dynload/_csv.so ${libdir}/python2.7/csv.* ${libdir}/python2.7/optparse.* ${libdir}/python2.7/textwrap.* "
 
-DESCRIPTION_${PN}-threading="Python Threading & Synchronization Support"
+SUMMARY_${PN}-threading="Python threading & synchronization support"
 RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
 FILES_${PN}-threading="${libdir}/python2.7/_threading_local.* ${libdir}/python2.7/dummy_thread.* ${libdir}/python2.7/dummy_threading.* ${libdir}/python2.7/mutex.* ${libdir}/python2.7/threading.* ${libdir}/python2.7/Queue.* "
 
-DESCRIPTION_${PN}-tkinter="Python Tcl/Tk Bindings"
+SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
 FILES_${PN}-tkinter="${libdir}/python2.7/lib-dynload/_tkinter.so ${libdir}/python2.7/lib-tk "
 
-DESCRIPTION_${PN}-unittest="Python Unit Testing Framework"
+SUMMARY_${PN}-unittest="Python unit testing framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
 FILES_${PN}-unittest="${libdir}/python2.7/unittest/ "
 
-DESCRIPTION_${PN}-unixadmin="Python Unix Administration Support"
+SUMMARY_${PN}-unixadmin="Python Unix administration support"
 RDEPENDS_${PN}-unixadmin="${PN}-core"
 FILES_${PN}-unixadmin="${libdir}/python2.7/lib-dynload/nis.so ${libdir}/python2.7/lib-dynload/grp.so ${libdir}/python2.7/lib-dynload/pwd.so ${libdir}/python2.7/getpass.* "
 
-DESCRIPTION_${PN}-xml="Python basic XML support."
+SUMMARY_${PN}-xml="Python basic XML support"
 RDEPENDS_${PN}-xml="${PN}-core ${PN}-elementtree ${PN}-re"
 FILES_${PN}-xml="${libdir}/python2.7/lib-dynload/pyexpat.so ${libdir}/python2.7/xml ${libdir}/python2.7/xmllib.* "
 
-DESCRIPTION_${PN}-xmlrpc="Python XMLRPC Support"
+SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
 RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
 FILES_${PN}-xmlrpc="${libdir}/python2.7/xmlrpclib.* ${libdir}/python2.7/SimpleXMLRPCServer.* ${libdir}/python2.7/DocXMLRPCServer.* "
 
-DESCRIPTION_${PN}-zlib="Python zlib Support."
+SUMMARY_${PN}-zlib="Python zlib compression support"
 RDEPENDS_${PN}-zlib="${PN}-core"
 FILES_${PN}-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
 
-DESCRIPTION_${PN}-modules="All Python modules"
+SUMMARY_${PN}-modules="All Python modules"
 RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
diff --git a/meta/recipes-devtools/python/python-dbus_1.2.0.bb b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
index a185d84..e64f99f 100644
--- a/meta/recipes-devtools/python/python-dbus_1.2.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python bindings for DBus, a socket-based message bus system for interprocess communication"
+SUMMARY = "Python bindings for the DBus inter-process communication system"
 SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
diff --git a/meta/recipes-devtools/python/python-docutils_0.11.bb b/meta/recipes-devtools/python/python-docutils_0.11.bb
index 7987244..f5da973 100644
--- a/meta/recipes-devtools/python/python-docutils_0.11.bb
+++ b/meta/recipes-devtools/python/python-docutils_0.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Text processing system"
+SUMMARY = "Text processing system for documentation"
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
diff --git a/meta/recipes-devtools/python/python-gst_0.10.22.bb b/meta/recipes-devtools/python/python-gst_0.10.22.bb
index 8b041c3..a551adb 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.22.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.22.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python Gstreamer bindings"
+SUMMARY = "Python bindings for the GStreamer multimedia framework"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 DEPENDS = "gstreamer gst-plugins-base python-pygobject"
diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index efc57cf..ed8cfcc 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python Imaging Library"
+SUMMARY = "Python Imaging Library (PIL)"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=92;endline=120;md5=c4371af4579f1e489cf881c1443dd4ec"
diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
index dc009b3..5b59b6c 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python Bindings for the Cairo canvas library"
+SUMMARY = "Python bindings for the Cairo canvas library"
 HOMEPAGE = "http://cairographics.org/pycairo"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "python-devel"
diff --git a/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb b/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
index fb57b49..aceaab3 100644
--- a/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
+++ b/meta/recipes-devtools/python/python-pycurl_7.19.0.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "libcurl python bindings."
+SUMMARY = "Python bindings for libcurl"
 HOMEPAGE = "http://pycurl.sourceforge.net/"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1+ | MIT"
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 475ea17..3dbef89 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python GTK+ 2.17.x Bindings"
+SUMMARY = "Python bindings for the GTK+ UI toolkit"
 SECTION = "devel/python"
 # needs gtk+ 2.17.x
 DEPENDS = "gtk+ libglade python-pycairo python-pygobject"
diff --git a/meta/recipes-devtools/python/python-scons_2.3.0.bb b/meta/recipes-devtools/python/python-scons_2.3.0.bb
index 1110f6e..eb2735d 100644
--- a/meta/recipes-devtools/python/python-scons_2.3.0.bb
+++ b/meta/recipes-devtools/python/python-scons_2.3.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A Software Construction Tool"
+SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=98e9a1e6029e715255c52032a1eba637"
diff --git a/meta/recipes-devtools/python/python-setuptools_1.4.bb b/meta/recipes-devtools/python/python-setuptools_1.4.bb
index 3cfda56..4138d28 100644
--- a/meta/recipes-devtools/python/python-setuptools_1.4.bb
+++ b/meta/recipes-devtools/python/python-setuptools_1.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Download, build, install, upgrade, and uninstall Python packages"
+SUMMARY = "Downloads, builds, installs, upgrades, and uninstalls Python packages"
 HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
 SECTION = "devel/python"
 LICENSE = "PSF"
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index e3eb8dc..8d27c4d 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Qemu helper utilities from Poky"
+SUMMARY = "Helper utilities needed by the runqemu script"
 LICENSE = "GPLv2"
 RDEPENDS_${PN} = "qemu-native"
 PR = "r1"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 230fdaf..fa9306d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "open source processor emulator"
+SUMMARY = "Fast open source processor emulator"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPLv2 & LGPLv2.1"
 DEPENDS = "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 501d803..3bfb5bd 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Qemu wrapper script"
+SUMMARY = "QEMU wrapper script"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-devtools/quilt/quilt-0.60.inc b/meta/recipes-devtools/quilt/quilt-0.60.inc
index 5fe201f..18105bc 100644
--- a/meta/recipes-devtools/quilt/quilt-0.60.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.60.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tool to work with series of patches."
+SUMMARY = "Tool for working with series of patches"
 HOMEPAGE = "http://savannah.nongnu.org/projects/quilt/"
 SECTION = "devel"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-devtools/rsync/rsync.inc b/meta/recipes-devtools/rsync/rsync.inc
index fd337df..4223c59 100644
--- a/meta/recipes-devtools/rsync/rsync.inc
+++ b/meta/recipes-devtools/rsync/rsync.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "A file-synchronization tool"
+SUMMARY = "File synchronization tool"
 HOMEPAGE = "http://rsync.samba.org/"
 BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
index 8c8b115..6854c77 100644
--- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A file-synchronization tool"
+SUMMARY = "File synchronization tool"
 HOMEPAGE = "http://rsync.samba.org/"
 BUGTRACKER = "http://rsync.samba.org/bugzilla.html"
 SECTION = "console/network"
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index e18e7b6..9c4de03 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Run postinstall scripts on device"
+SUMMARY = "Runs postinstall scripts on first boot of the target device"
 SECTION = "devel"
 PR = "r9"
 LICENSE = "MIT"
diff --git a/meta/recipes-devtools/strace/strace_4.8.bb b/meta/recipes-devtools/strace/strace_4.8.bb
index 9fedb6b..2482745 100644
--- a/meta/recipes-devtools/strace/strace_4.8.bb
+++ b/meta/recipes-devtools/strace/strace_4.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "strace is a system call tracing tool."
+SUMMARY = "System call tracing tool"
 HOMEPAGE = "http://strace.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "BSD"
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index ef679b3..f225671 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Subversion (svn) client"
+SUMMARY = "Subversion (svn) version control system client"
 SECTION = "console/network"
 DEPENDS = "apr-util neon sqlite3"
 RDEPENDS_${PN} = "neon"
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index 489bddf..acef3bd 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Subversion (svn) client"
+SUMMARY = "Subversion (svn) version control system client"
 SECTION = "console/network"
 DEPENDS = "apr-util neon sqlite3 file"
 RDEPENDS_${PN} = "neon"
diff --git a/meta/recipes-devtools/swabber/swabber-native_git.bb b/meta/recipes-devtools/swabber/swabber-native_git.bb
index 2648c61..2f313bb 100644
--- a/meta/recipes-devtools/swabber/swabber-native_git.bb
+++ b/meta/recipes-devtools/swabber/swabber-native_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Swabber is a tool that can help with understanding a program's use of host files."
+SUMMARY = "Tool to monitor and report on host system file usage"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/swabber"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 1c240de..078f8bc 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A multi-purpose linux bootloader"
+SUMMARY = "Multi-purpose linux bootloader"
 HOMEPAGE = "http://syslinux.zytor.com/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index e7779cd..1eb0021 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Target Communication Framework"
+SUMMARY = "Target Communication Framework for the Eclipse IDE"
 HOMEPAGE = "http://wiki.eclipse.org/TCF"
 BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
index 80aac62..216fdab 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Valgrind memory debugger"
+SUMMARY = "Valgrind memory debugger and instrumentation framework"
 HOMEPAGE = "http://valgrind.org/"
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPLv2 & GPLv2+ & BSD"
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 99875bf..107c48f 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "An sh-compatible command language interpreter."
+SUMMARY = "An sh-compatible command language interpreter"
 HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
 SECTION = "base/shell"
 
diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
index 3013c10..0550318 100644
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ b/meta/recipes-extended/bc/bc_1.06.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "An arbitrary precision calculator language."
+SUMMARY = "Arbitrary precision calculator language"
 HOMEPAGE = "http://www.gnu.org/software/bc/bc.html"
 
 LICENSE = "GPLv2+ & LGPLv2.1"
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
index 5e6156f..b4354a4 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A pro-active password checker library"
+SUMMARY = "Password strength checker library"
 HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 
 LICENSE = "LGPLv2.1+"
diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 3f16225..ee4b890 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "cwautomacros: a collection of autoconf m4 macros"
+SUMMARY = "Collection of autoconf m4 macros"
 SECTION = "base"
 HOMEPAGE = "http://cwautomacros.berlios.de/"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes-extended/ed/ed_0.5.bb
index d251e4e..a696c0c 100644
--- a/meta/recipes-extended/ed/ed_0.5.bb
+++ b/meta/recipes-extended/ed/ed_0.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU ed is a line-oriented text editor"
+SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 SECTION = "base"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.9.bb
index 90c46e6..8ae99cc 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "a line-oriented text editor"
+SUMMARY = "Line-oriented text editor"
 HOMEPAGE = "http://www.gnu.org/software/ed/"
 
 LICENSE = "GPLv3+"
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
index 3071b6a..347fa7f 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.50.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "SysV init scripts which only is used in an LSB image"
+SUMMARY = "SysV init scripts which are only used in an LSB image"
 SECTION = "base"
 LICENSE = "GPLv2"
 DEPENDS = "popt glib-2.0"
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 520c1e7..a877beb 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "automate test for lsb"
+SUMMARY = "Automates Linux Standard Base (LSB) tests"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 PR = "r3"
diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
index 52e4f40..ac2216d 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Midnight Commander is an ncurses based file manager."
+SUMMARY = "Midnight Commander is an ncurses based file manager"
 HOMEPAGE = "http://www.midnight-commander.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
@@ -26,7 +26,7 @@ do_install_append () {
 
 PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers ${BPN}-fish"
 
-DESCRIPTION_${BPN}-helpers-perl = "Midnight Commander perl based helper scripts" 
+SUMMARY_${BPN}-helpers-perl = "Midnight Commander Perl-based helper scripts"
 FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
                              ${libexecdir}/mc/extfs.d/deb ${libexecdir}/mc/extfs.d/deba \
                              ${libexecdir}/mc/extfs.d/debd ${libexecdir}/mc/extfs.d/dpkg+ \
@@ -35,13 +35,13 @@ FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.
                              ${libexecdir}/mc/extfs.d/uzip"
 RDEPENDS_${BPN}-helpers-perl = "perl"
 
-DESCRIPTION_${BPN}-helpers-python = "Midnight Commander python based helper scripts" 
+SUMMARY_${BPN}-helpers-python = "Midnight Commander Python-based helper scripts"
 FILES_${BPN}-helpers-python = "${libexecdir}/mc/extfs.d/s3+ ${libexecdir}/mc/extfs.d/uc1541"
 RDEPENDS_${BPN}-helpers-python = "python"
 
-DESCRIPTION_${BPN}-helpers = "Midnight Commander shell helper scripts" 
+SUMMARY_${BPN}-helpers = "Midnight Commander shell helper scripts"
 FILES_${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
 
-DESCRIPTION_${BPN}-fish = "Midnight Commander Fish scripts"
+SUMMARY_${BPN}-fish = "Midnight Commander Fish scripts"
 FILES_${BPN}-fish = "${libexecdir}/mc/fish"
 
diff --git a/meta/recipes-extended/mc/mc_4.8.10.bb b/meta/recipes-extended/mc/mc_4.8.10.bb
index 51b6772..09cfa3c 100644
--- a/meta/recipes-extended/mc/mc_4.8.10.bb
+++ b/meta/recipes-extended/mc/mc_4.8.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Midnight Commander is an ncurses based file manager."
+SUMMARY = "Midnight Commander is an ncurses based file manager"
 HOMEPAGE = "http://www.midnight-commander.org/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
@@ -24,7 +24,7 @@ do_install_append () {
 
 PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers ${BPN}-fish"
 
-DESCRIPTION_${BPN}-helpers-perl = "Midnight Commander perl based helper scripts" 
+SUMMARY_${BPN}-helpers-perl = "Midnight Commander Perl-based helper scripts"
 FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
                              ${libexecdir}/mc/extfs.d/deb ${libexecdir}/mc/extfs.d/deba \
                              ${libexecdir}/mc/extfs.d/debd ${libexecdir}/mc/extfs.d/dpkg+ \
@@ -33,12 +33,12 @@ FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.
                              ${libexecdir}/mc/extfs.d/uzip"
 RDEPENDS_${BPN}-helpers-perl = "perl"
 
-DESCRIPTION_${BPN}-helpers-python = "Midnight Commander python based helper scripts" 
+SUMMARY_${BPN}-helpers-python = "Midnight Commander Python-based helper scripts"
 FILES_${BPN}-helpers-python = "${libexecdir}/mc/extfs.d/s3+ ${libexecdir}/mc/extfs.d/uc1541"
 RDEPENDS_${BPN}-helpers-python = "python"
 
-DESCRIPTION_${BPN}-helpers = "Midnight Commander shell helper scripts" 
+SUMMARY_${BPN}-helpers = "Midnight Commander shell helper scripts"
 FILES_${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
 
-DESCRIPTION_${BPN}-fish = "Midnight Commander Fish scripts"
+SUMMARY_${BPN}-fish = "Midnight Commander Fish scripts"
 FILES_${BPN}-fish = "${libexecdir}/mc/fish"
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.bb b/meta/recipes-extended/mdadm/mdadm_3.3.bb
index 5362396..cfb9ccd 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = " A tool for managing Soft RAID under Linux"
+SUMMARY = "Tool for managing software RAID under Linux"
 HOMEPAGE = "http://www.kernel.org/pub/linux/utils/raid/mdadm/"
 
 # Some files are GPLv2+ while others are GPLv2.
diff --git a/meta/recipes-extended/mingetty/mingetty_1.08.bb b/meta/recipes-extended/mingetty/mingetty_1.08.bb
index fbd9cb4..f1936af 100644
--- a/meta/recipes-extended/mingetty/mingetty_1.08.bb
+++ b/meta/recipes-extended/mingetty/mingetty_1.08.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = " A compact getty program for virtual consoles only"
+SUMMARY = "Compact getty terminal handler for virtual consoles only"
 SECTION = "console/utils"
 HOMEPAGE = "http://sourceforge.net/projects/mingetty/"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index 170a183..b53fc11 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Allow safe temporary file creation from shell scripts."
+SUMMARY = "Enables safe temporary file creation from shell scripts"
 HOMEPAGE = "http://www.mktemp.org/"
 BUGTRACKER = "http://www.mktemp.org/bugs"
 SECTION = "console/utils"
diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.1.bb
index 079b295..2d72027 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "parted, the GNU partition resizing program"
+SUMMARY = "Disk partition editing/resizing utility"
 HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
index 95682ee..9c2c9d5 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
+SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index fb396f1..c8fcde4 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TimeDate - parser for absolute times"
+SUMMARY = "Perl modules useful for manipulating date and time information"
 SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
 LICENSE = "Artistic-1.0 | GPL-1.0+"
diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index a5f69b3..d62834f 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "display disk usage and limits"
+SUMMARY = "Tools for monitoring & limiting user disk usage per filesystem"
 SECTION = "base"
 HOMEPAGE = "http://sourceforge.net/projects/linuxquota/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=18136&atid=118136"
diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index 5fa4e87..5607b0a 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "sed is a Stream EDitor."
+SUMMARY = "Stream EDitor (text filtering utility)"
 HOMEPAGE = "http://www.gnu.org/software/sed/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index c3eca27..cf8347c 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "sed is a Stream EDitor."
+SUMMARY = "Stream EDitor (text filtering utility)"
 HOMEPAGE = "http://www.gnu.org/software/sed/"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
index 5cdc7ef..9e1c8f8 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+SUMMARY = "Timezone zoneinfo utils (zic, zdump, tzselect)"
 LICENSE = "PD & BSD"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8f"
diff --git a/meta/recipes-extended/tzdata/tzdata_2013h.bb b/meta/recipes-extended/tzdata/tzdata_2013h.bb
index 16d67d3..f2b513c 100644
--- a/meta/recipes-extended/tzdata/tzdata_2013h.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2013h.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Timezone data"
+SUMMARY = "Timezone database"
 HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
 SECTION = "base"
 LICENSE = "PD & BSD"
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 0f634c8..584802a 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A (de)compression library for the ZIP format"
+SUMMARY = "Utilities for extracting and viewing files in .zip archives"
 HOMEPAGE = "http://www.info-zip.org"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 7af55c4..3f2193d 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
+SUMMARY = "Console URL download utility supporting HTTP, FTP, etc."
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 0e28172..1928949 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Highly configurable, modular and secure inetd"
+SUMMARY = "Socket-based service activation daemon"
 HOMEPAGE = "http://www.xinetd.org"
 
 # xinetd is a BSD-like license
diff --git a/meta/recipes-extended/xz/xz_5.1.3alpha.bb b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
index 9e2c933..b8501a5 100644
--- a/meta/recipes-extended/xz/xz_5.1.3alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "utils for managing LZMA compressed files"
+SUMMARY = "Utilities for managing LZMA compressed files"
 HOMEPAGE = "http://tukaani.org/xz/"
 SECTION = "base"
 
diff --git a/meta/recipes-extended/zip/zip.inc b/meta/recipes-extended/zip/zip.inc
index c73571a..6221c5e 100644
--- a/meta/recipes-extended/zip/zip.inc
+++ b/meta/recipes-extended/zip/zip.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Archiver for .zip files"
+SUMMARY = "Compressor/archiver for creating and modifying .zip files"
 HOMEPAGE = "http://www.info-zip.org"
 SECTION = "console/utils"
 
diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
index 874f9cb..40e5b11 100644
--- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
+++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A collection of GSettings schemas for settings shared by various components of a desktop"
+SUMMARY = "GNOME desktop-wide GSettings schemas"
 HOMEPAGE = "http://live.gnome.org/gsettings-desktop-schemas"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index f899307..ba07ac0 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GTK theme engines"
+SUMMARY = "GTK+ theme engines"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
index 3a10ea7..889fd89 100644
--- a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Gtk+ Theme Benchmark Program"
+SUMMARY = "GTK+ Theme benchmark program"
 DEPENDS = "gtk+"
 HOMEPAGE = "http://wiki.laptop.org/go/GTK_for_OLPC"
 SECTION = "devel"
diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
index 9a8e5a6..ba0c27f 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "default icon theme that all icon themes automatically inherit from."
+SUMMARY = "Default icon theme that all icon themes automatically inherit from"
 HOMEPAGE = "http://icon-theme.freedesktop.org/wiki/HicolorTheme"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index c8a2fac..72f4c56 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Runtime support for GTK interface builder"
+SUMMARY = "Runtime support for the GTK+ interface builder"
 HOMEPAGE = "http://library.gnome.org/devel/libglade/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
index 0a590e3..61ae5e6 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Send desktop notifications to a notification daemon"
+SUMMARY = "Library for sending desktop notifications to a notification daemon"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index d9311fe..3ca19b3 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Clutter graphics library"
+SUMMARY = "Graphics library for creating hardware-accelerated user interfaces"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1+"
 
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.0.inc b/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
index b5edcae..bb05ede 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.0.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Clutter GStreamer"
+SUMMARY = "GStreamer integration library for Clutter"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
index 3717f48..45898b4 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "ClutterGtk"
+SUMMARY = "Library for embedding a Clutter canvas in a GTK+ application"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2+"
 
diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index d4df009..15bfea2 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "a modern 3D graphics API with associated utility APIs"
+SUMMARY = "Modern 3D graphics API with associated utility APIs"
 HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
 LICENSE = "LGPLv2.1+"
 
diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index 9453eae..cbaf054 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Custom MB session files for poky"
+SUMMARY = "Custom Matchbox session files"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
index b009c4b..8ee42c3 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.bb
@@ -1,5 +1,5 @@
+SUMMARY = "Matchbox lightweight window manager"
 SECTION = "x11/wm"
-DESCRIPTION = "Matchbox window manager"
 LICENSE = "GPLv2.0+"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxcomposite libxfixes libxcursor xdamage libxrender startup-notification expat"
 PR = "r5"
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 7d112ef..154b967 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox window manager"
+SUMMARY = "Matchbox lightweight window manager"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
index 3819ee3..4e89d63 100644
--- a/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
+++ b/meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Mini X session files for poky"
+SUMMARY = "Very simple session manager for X"
 HOMEPAGE = "http://www.yoctoproject.org"
 BUGTRACKER = "http://bugzilla.pokylinux.org"
 
diff --git a/meta/recipes-graphics/mx/mx.inc b/meta/recipes-graphics/mx/mx.inc
index e3b4b15..0b02c10 100644
--- a/meta/recipes-graphics/mx/mx.inc
+++ b/meta/recipes-graphics/mx/mx.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Clutter based widget library"
+SUMMARY = "Clutter based UI widget library"
 LICENSE = "LGPLv2.1"
 
 inherit clutter
diff --git a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
index 036058a..db66f6e 100644
--- a/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
+++ b/meta/recipes-graphics/startup-notification/startup-notification_0.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Startup-notification contains a reference implementation of the startup notification protocol."
+SUMMARY = "Enables monitoring and display of application startup"
 HOMEPAGE = "http://www.freedesktop.org/wiki/software/startup-notification/"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=Specifications"
 
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 4ebda8b..9a2e84c 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "startup for weston"
+SUMMARY = "Startup script for the Weston Wayland compositor"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 7b3501d..162c2dd 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Export your X session on-the-fly via VNC"
+SUMMARY = "Exports your X session on-the-fly via VNC"
 HOMEPAGE = "http://www.karlrunge.com/x11vnc/"
 
 SECTION = "x11/utils"
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
index 0dcfbea..5e668ab 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Transparent xcursor theme for handheld systems"
+SUMMARY = "Transparent X11 cursor theme for touchscreens"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 1ffd6d8..783bcd7 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+SUMMARY = "Touchscreen calibration program for X11"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
index 176bacb..15e1015 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "X font aliases."
+SUMMARY = "X font aliases"
 
 require xorg-font-common.inc
 
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index cdb2026..7a32993 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "blktrace - generate traces of the I/O traffic on block devices"
+SUMMARY = "Generates traces of I/O traffic on block devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 8c68ff3..1a2f881 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Scripts and utilities for managing Yocto branched kernels."
+SUMMARY = "Tools for managing Yocto Project style branched kernels"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70cd5f52972f8884b80743d"
 
diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 7d3aca2..ec20bf8 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Depmod wrapper script"
+SUMMARY = "Wrapper script for the Linux kernel module dependency indexer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index 4b1f16f..af44eb6 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "LatencyTOP, a Linux tool measuring and fixing latency"
+SUMMARY = "Linux tool for measuring and fixing latency"
 HOMEPAGE = "http://www.latencytop.org/"
 
 LICENSE = "GPLv2"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index f44b61c..3f27afa 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Sanitized set of kernel headers for the C library's use."
+SUMMARY = "Sanitized set of kernel headers for the C library's use"
 SECTION = "devel"
 LICENSE = "GPLv2"
 
diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index 594e554..44a1bfc 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -1,5 +1,5 @@
+SUMMARY = "Initscript for auto-loading kernel modules on boot"
 SECTION = "base"
-DESCRIPTION = "modutils configuration files"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7bf87fc37976e93ec66ad84fac58c098"
 SRC_URI = "file://modutils.sh \
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 7ffab03..73e617f 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "sysprof - System-wide Performance Profiler for Linux"
+SUMMARY = "System-wide Performance Profiler for Linux"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index bcc826a..e346ce2 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analysis tool for Linux"
+SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Linux"
 
 require systemtap_git.inc
 
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index a18cb46..c3b97a3 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Alsa Tools package contains advanced tools for certain sound cards."
+SUMMARY = "Advanced tools for certain ALSA sound card drivers"
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
index cacc37c..968c81e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.27.2.bb
@@ -1,11 +1,12 @@
 require alsa-utils_${PV}.bb
 
+SUMMARY = "Shell script that creates ALSA configuration files"
+
 FILESEXTRAPATHS_prepend := "${THISDIR}/alsa-utils:"
 
 PACKAGES = "${PN}"
 RDEPENDS_${PN} += "bash"
 
-DESCRIPTION_${PN}     = "a bash script that creates ALSA configuration files"
 FILES_${PN} = "${sbindir}/alsaconf"
 
 S = "${WORKDIR}/alsa-utils-${PV}"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index a894171..325c465 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ALSA Utilities"
+SUMMARY = "ALSA sound utilities"
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
@@ -59,15 +59,15 @@ FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
 FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
 
 
-DESCRIPTION_alsa-utils-aplay        = "play (and record) sound files via ALSA"
-DESCRIPTION_alsa-utils-amixer       = "command-line based control for ALSA mixer and settings"
-DESCRIPTION_alsa-utils-alsamixer    = "ncurses based control for ALSA mixer and settings"
-DESCRIPTION_alsa-utils-speakertest  = "ALSA surround speaker test utility"
-DESCRIPTION_alsa-utils-midi         = "miscalleanous MIDI utilities for ALSA"
-DESCRIPTION_alsa-utils-aconnect     = "ALSA sequencer connection manager"
-DESCRIPTION_alsa-utils-aseqnet      = "network client/server on ALSA sequencer"
-DESCRIPTION_alsa-utils-alsactl      = "saves/restores ALSA-settings in /etc/asound.state"
-DESCRIPTION_alsa-utils-alsaucm      = "ALSA Use Case Manager"
+SUMMARY_alsa-utils-aplay        = "Play (and record) sound files using ALSA"
+SUMMARY_alsa-utils-amixer       = "Command-line control for ALSA mixer and settings"
+SUMMARY_alsa-utils-alsamixer    = "ncurses-based control for ALSA mixer and settings"
+SUMMARY_alsa-utils-speakertest  = "ALSA surround speaker test utility"
+SUMMARY_alsa-utils-midi         = "Miscellaneous MIDI utilities for ALSA"
+SUMMARY_alsa-utils-aconnect     = "ALSA sequencer connection manager"
+SUMMARY_alsa-utils-aseqnet      = "Network client/server for ALSA sequencer"
+SUMMARY_alsa-utils-alsactl      = "Saves/restores ALSA-settings in /etc/asound.state"
+SUMMARY_alsa-utils-alsaucm      = "ALSA Use Case Manager"
 
 RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
index 196a317..47dbc34 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.19.bb
@@ -1,13 +1,11 @@
 require gst-fluendo.inc
 
+SUMMARY = "Fluendo closed-format mp3 GStreamer plug-in"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=259a43dd1c9854b71fc396f74699f4d2"
 LICENSE_FLAGS = "commercial"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-
-DESCRIPTION = "Fluendo closed-format mp3 GStreamer plug-in"
-
 SRC_URI[md5sum] = "5d95a9a216dd15bc5c00c9414061115c"
 SRC_URI[sha256sum] = "30c79d24d8926f75dd4ef0f572942ce155ad541734b36a95591b9c0524dcc0f3"
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
index f4bdce1..f790154 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mpegdemux_0.10.72.bb
@@ -1,6 +1,6 @@
 require gst-fluendo.inc
-DESCRIPTION = "Fluendo closed-format mpeg video GStreamer plug-in"
 
+SUMMARY = "Fluendo closed-format mpeg video GStreamer plug-in"
 LICENSE = "MPLv1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=be282f1c3cc9a98cc0dc5c2b25dfc510 \
                     file://src/gstmpegdemux.h;beginline=1;endline=19;md5=a9e90033f59897b91664d9f2a2ff01dd"
diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 210da37..c273fb7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Gstreamer package groups"
+SUMMARY = "GStreamer package groups"
 LICENSE = "MIT"
 DEPENDS = "gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index 4c9716d..b2d3d3c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Plugins for GStreamer"
+SUMMARY = "Plugins for the GStreamer multimedia framework"
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 651119e..4ab8ea8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Plugins for GStreamer 1.x"
+SUMMARY = "Plugins for the GStreamer multimedia framework 1.x"
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index 978636a..ed825d2 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "LAME is an educational tool to be used for learning about MP3 encoding."
+SUMMARY = "High quality MP3 audio encoder"
 HOMEPAGE = "http://sourceforge.net/projects/lame/files/lame/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index a7f1fae..94b66b1 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for reading some sort of media format."
+SUMMARY = "ATSC A/52 surround sound stream decoder"
 HOMEPAGE = "http://liba52.sourceforge.net/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index d81f58b..dd1f82b 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for interacting with ID3 tags."
+SUMMARY = "Library for interacting with ID3 tags in MP3 files"
 HOMEPAGE = "http://sourceforge.net/projects/mad/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index 22bc3fe..58d68a6 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "MPEG Audio Decoder Library"
+SUMMARY = "MPEG Audio Decoder library"
 HOMEPAGE = "http://sourceforge.net/projects/mad/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
index 25e97b4..f598b1c 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "An audio Sample Rate Conversion library"
+SUMMARY = "Audio Sample Rate Conversion library"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
index 0c91fe3..d3ec7a8 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "An audio format Conversion library"
+SUMMARY = "Audio format Conversion library"
 HOMEPAGE = "http://www.mega-nerd.com/libsndfile"
 AUTHOR = "Erik de Castro Lopo"
 DEPENDS = "sqlite3"
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
index d918b5a..2400b54 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "This software provides support for the Tag Image File Format (TIFF)"
+SUMMARY = "Provides support for the Tag Image File Format (TIFF)"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index f38066a..aee2f3b 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library and test program for decoding mpeg-2 and mpeg-1 video streams"
+SUMMARY = "Library and test program for decoding MPEG-2 and MPEG-1 video streams"
 HOMEPAGE = "http://libmpeg2.sourceforge.net/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index dce8555..103f72e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Pulseaudio is a sound server for Linux and Unix-like operating systems."
+SUMMARY = "Sound server for Linux and Unix-like operating systems"
 HOMEPAGE = "http://www.pulseaudio.org"
 AUTHOR = "Lennart Poettering"
 SECTION = "libs/multimedia"
diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
index e816a90..ff3f3da 100644
--- a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
+++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Set default Qt4 Graphics System to ${QT_GRAPHICS_SYSTEM}"
+SUMMARY = "Sets default Qt4 Graphics System to ${QT_GRAPHICS_SYSTEM}"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 2c806e0..1c9ee2e 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
+SUMMARY = "SDK tools for Qt version 4.x"
 DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt-project.org/"
diff --git a/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
index 0c30e5f..998de2a 100644
--- a/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
+++ b/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Qt Mobility 1.2.0 - version for Qt/Embedded"
+SUMMARY = "Mobile device API extensions for Qt/Embedded 4.x"
 DEPENDS = "qt4-embedded"
 SECTION = "libs"
 qtm_embedded := "embedded"
diff --git a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
index cd7d5b5..5fe7bc9 100644
--- a/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
+++ b/meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Qt Mobility 1.2.0 - version for Qt/X11"
+SUMMARY = "Mobile device API extensions for Qt/X11 4.x"
 DEPENDS = "qt4-x11-free"
 SECTION = "x11/libs"
 qtm_embedded := ""
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index ddb790d..bb16da6 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Native version of Qt/[X11|Mac|Embedded]"
+SUMMARY = "Qt version 4 tools and support files for the build host"
 DEPENDS = "zlib-native dbus-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt-project.org/"
diff --git a/meta/recipes-sato/gaku/gaku_git.bb b/meta/recipes-sato/gaku/gaku_git.bb
index dea250a..5e1cba5 100644
--- a/meta/recipes-sato/gaku/gaku_git.bb
+++ b/meta/recipes-sato/gaku/gaku_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Music player"
+SUMMARY = "Simple music player using GTK+ and GStreamer"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://main.c;beginline=1;endline=20;md5=0c02b4ef945956832b37a036b9cc103a"
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
index e5dedad..6457fee 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Sato theme engine for GTK"
+SUMMARY = "Sato theme engine for GTK+"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
index 8103005..f0119b7 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox GTK+ theme configuration application."
+SUMMARY = "Matchbox GTK+ theme configuration application"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
index 1b0f9ed..1979cbb 100644
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
+++ b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Sato desktop folders"
+SUMMARY = "Matchbox desktop folders for the Sato environment"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 603f292..31d32c6 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A simple GTK+ based panel for handheld devices."
+SUMMARY = "Simple GTK+ based panel for handheld devices"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index 5e19396..fe84a0f 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Custom MB session files for poky"
+SUMMARY = "Custom Matchbox session files for the Sato environment"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
index 432b8ea..91fd150 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox Terminal"
+SUMMARY = "Lightweight GTK+ terminal application"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato/midori/midori_0.5.5.bb
index 7795617..b359037 100644
--- a/meta/recipes-sato/midori/midori_0.5.5.bb
+++ b/meta/recipes-sato/midori/midori_0.5.5.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Midori is a lightweight web browser."
+SUMMARY = "A lightweight web browser"
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
diff --git a/meta/recipes-sato/puzzles/puzzles_r9765.bb b/meta/recipes-sato/puzzles/puzzles_r9765.bb
index 242c94a..6d0e480 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9765.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9765.bb
@@ -1,4 +1,4 @@
-DESCRIPTION="Simon Tatham's Portable Puzzle Collection"
+SUMMARY = "Simon Tatham's Portable Puzzle Collection"
 HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 
 DEPENDS = "gtk+ libxt"
diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
index 2b0b729..ced735f 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Sato Icon Theme"
+SUMMARY = "Sato icon theme"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index 2460e03..a079e03 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "An ultra-simple screen capture utility, aimed at handheld devices"
+SUMMARY = "Ultra-simple screen capture utility, aimed at handheld devices"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
index a11e5a0..ba48d90 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Settings-daemon provides a bridge between gconf and xsettings"
+SUMMARY = "Provides a bridge between gconf and xsettings"
 HOMEPAGE = "http://svn.o-hand.com/view/matchbox/trunk/settings-daemon/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "MIT-style"
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 8c78b5b..cd571b1 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "WebKitGTK+ is the port of the portable web rendering engine WebKitK to the GTK+ platform."
+SUMMARY = "WebKit web rendering engine for the GTK+ platform"
 HOMEPAGE = "http://www.webkitgtk.org/"
 BUGTRACKER = "http://bugs.webkit.org/"
 
diff --git a/meta/recipes-support/atk/atk_2.10.0.bb b/meta/recipes-support/atk/atk_2.10.0.bb
index 2e8216a..538d614 100644
--- a/meta/recipes-support/atk/atk_2.10.0.bb
+++ b/meta/recipes-support/atk/atk_2.10.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "An accessibility toolkit for GNOME."
+SUMMARY = "Accessibility toolkit for GNOME"
 HOMEPAGE = "http://live.gnome.org/GAP/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/libs"
diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index b504517..a461232 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "utilities for access control list"
+SUMMARY = "Utilities for managing POSIX Access Control Lists"
 HOMEPAGE = "http://savannah.nongnu.org/projects/acl/"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 6deb004..4961ba7 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "utilities for manipulating filesystem extended attributes"
+SUMMARY = "Utilities for manipulating filesystem extended attributes"
 HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 5874f9e..eaab2e3 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2004-2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-DESCRIPTION="Beecrypt is a general-purpose cryptography library."
+SUMMARY = "A general-purpose cryptography library"
 HOMEPAGE="http://sourceforge.net/projects/beecrypt"
 SRC_URI="${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
 	 file://disable-icu-check.patch \
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 63da028..ebd2dcf 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login sessions, and seats."
+SUMMARY = "Framework for defining and tracking users, login sessions, and seats"
 HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
 BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
 
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 523d31b..159a6c4 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "createrepo creates rpm-metadata for rpms to build the repository"
+SUMMARY = "Creates metadata indexes for RPM package repositories"
 HOMEPAGE = "http://createrepo.baseurl.org/"
 
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-support/curl/curl_7.33.0.bb b/meta/recipes-support/curl/curl_7.33.0.bb
index 8539fec..db68fee 100644
--- a/meta/recipes-support/curl/curl_7.33.0.bb
+++ b/meta/recipes-support/curl/curl_7.33.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Command line tool and library for client-side URL transfers."
+SUMMARY = "Command line tool and library for client-side URL transfers"
 HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/db/db_5.3.21.bb
index 328f9db..608d406 100644
--- a/meta/recipes-support/db/db_5.3.21.bb
+++ b/meta/recipes-support/db/db_5.3.21.bb
@@ -9,7 +9,7 @@
 # at once - DB3 and DB5 can both be installed on the
 # same system at the same time if really necessary.
 SECTION = "libs"
-DESCRIPTION = "Berkeley DB v5."
+SUMMARY = "Berkeley Database v5"
 HOMEPAGE = "http://www.oracle.com/technology/products/berkeley-db/db/index.html"
 LICENSE = "Sleepycat"
 VIRTUAL_NAME ?= "virtual/db"
diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
index 498ad99..c031f4a 100644
--- a/meta/recipes-support/gdbm/gdbm_1.10.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU dbm is a set of database routines that use extensible hashing."
+SUMMARY = "Key/value database library with extensible hashing"
 HOMEPAGE = "http://www.gnu.org/software/gdbm/"
 SECTION = "libs"
 LICENSE = "GPLv3"
diff --git a/meta/recipes-support/gdbm/gdbm_1.8.3.bb b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
index 28f578c..bcf6b99 100644
--- a/meta/recipes-support/gdbm/gdbm_1.8.3.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU dbm is a set of database routines that use extensible hashing."
+SUMMARY = "Key/value database library with extensible hashing"
 HOMEPAGE = "http://www.gnu.org/software/gdbm/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index 7fbc3d3..fcc5fba 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "gnupg - GNU privacy guard"
+SUMMARY = "GNU Privacy Guard - encryption and signing tools"
 HOMEPAGE = "http://www.gnupg.org/"
 DEPENDS = "zlib bzip2 readline"
 SECTION = "console/utils"
diff --git a/meta/recipes-support/gnupg/gnupg_2.0.22.bb b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
index 8f572d4..7f36df5 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU privacy guard - a free PGP replacement (new v2.x)"
+SUMMARY = "GNU Privacy Guard - encryption and signing tools (2.x)"
 HOMEPAGE = "http://www.gnupg.org/"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 5319bc3..ccc0fde 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "support for getting/setting POSIX.1e capabilities"
+SUMMARY = "Library for getting/setting POSIX.1e capabilities"
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 
 # no specific GPL version required
diff --git a/meta/recipes-support/libcheck/libcheck_0.9.11.bb b/meta/recipes-support/libcheck/libcheck_0.9.11.bb
index 781b950..7fc352c 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.11.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION  = "Check Test Framework"
+SUMMARY  = "Check - unit testing framework for C code"
 HOMEPAGE = "http://check.sourceforge.net/"
 SECTION = "devel"
 
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index d175c46..61cd818 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Libcroco project is an effort to build a generic Cascading Style Sheet (CSS) parsing and manipulation toolkit"
+SUMMARY = "Cascading Style Sheet (CSS) parsing and manipulation toolkit"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-support/libdaemon/libdaemon_0.14.bb b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
index bcba1d5..e928781 100644
--- a/meta/recipes-support/libdaemon/libdaemon_0.14.bb
+++ b/meta/recipes-support/libdaemon/libdaemon_0.14.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "libdaemon is a lightweight C library which eases the writing of UNIX daemons."
+SUMMARY = "Lightweight C library which eases the writing of UNIX daemons"
 SECTION = "libs"
 AUTHOR = "Lennart Poettering <lennart@poettering.net>"
 HOMEPAGE = "http://0pointer.de/lennart/projects/libdaemon/"
diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
index 301c25d..cff4cae 100644
--- a/meta/recipes-support/libexif/libexif_0.6.21.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.21.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library to read the extended image information (EXIF) from JPEG pictures"
+SUMMARY = "Library for reading extended image information (EXIF) from JPEG files"
 HOMEPAGE = "http://sourceforge.net/projects/libexif"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 5ab0c11..249939d 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "A general purpose cryptographic library based on the code from GnuPG"
+SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
 HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 SECTION = "libs"
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
index 0b44ea3..a47e31d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "a small library that defines common error values for all GnuPG components"
+SUMMARY = "Small library that defines common error values for all GnuPG components"
 HOMEPAGE = "http://www.gnupg.org/related_software/libgpg-error/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
diff --git a/meta/recipes-support/libksba/libksba_1.3.0.bb b/meta/recipes-support/libksba/libksba_1.3.0.bb
index 45bc35a..4690ba9 100644
--- a/meta/recipes-support/libksba/libksba_1.3.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Libksba provides an easy API to create and parse X.509 and CMS related objects."
+SUMMARY = "Easy API to create and parse X.509 and CMS related objects"
 HOMEPAGE = "http://www.gnupg.org/related_software/libksba/"
 LICENSE = "GPLv2+ | LGPLv3+ | GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd541d83f75d038c4e0617b672ed8bda \
diff --git a/meta/recipes-support/libmpc/libmpc.inc b/meta/recipes-support/libmpc/libmpc.inc
index 0788dc2..61b71c6 100644
--- a/meta/recipes-support/libmpc/libmpc.inc
+++ b/meta/recipes-support/libmpc/libmpc.inc
@@ -1,3 +1,4 @@
+SUMMARY = "C library for complex number arithmetic with arbitrary precision and correct rounding"
 DESCRIPTION = "Mpc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result. It is built upon and follows the same principles as Mpfr"
 HOMEPAGE = "http://www.multiprecision.org/"
 LICENSE = "LGPLv3"
diff --git a/meta/recipes-support/libnl/libnl_3.2.22.bb b/meta/recipes-support/libnl/libnl_3.2.22.bb
index 3c31b1a..73b10c5 100644
--- a/meta/recipes-support/libnl/libnl_3.2.22.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.22.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
+SUMMARY = "A library for applications dealing with netlink sockets"
 HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
 SECTION = "libs/network"
 
diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
index b1e21ab..03b7785 100644
--- a/meta/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta/recipes-support/liboil/liboil_0.3.17.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Liboil is a library of simple functions that are optimized for various CPUs."
+SUMMARY = "Library of simple functions optimized for various CPUs"
 HOMEPAGE = "http://liboil.freedesktop.org/"
 BUGTRACKER = "https://bugs.freedesktop.org/"
 
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index 30abc27..3838cb8 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A library that provides automatic proxy configuration management"
+SUMMARY = "Library providing automatic proxy configuration management"
 HOMEPAGE = "http://code.google.com/p/libproxy/"
 BUGTRACKER = "http://code.google.com/p/libproxy/issues/list"
 SECTION = "libs"
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.1.bb b/meta/recipes-support/liburcu/liburcu_0.8.1.bb
index bcdd32a..a9e7b2c 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.8.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
+SUMMARY = "Userspace RCU (read-copy-update) library"
 HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
diff --git a/meta/recipes-support/mpfr/mpfr.inc b/meta/recipes-support/mpfr/mpfr.inc
index dbb859f..ecee731 100644
--- a/meta/recipes-support/mpfr/mpfr.inc
+++ b/meta/recipes-support/mpfr/mpfr.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "A C library for multiple-precision floating-point computations with exact rounding"
+SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
 HOMEPAGE = "http://www.mpfr.org/"
 LICENSE = "LGPLv3+"
 SECTION = "devel"
diff --git a/meta/recipes-support/neon/neon_0.30.0.bb b/meta/recipes-support/neon/neon_0.30.0.bb
index dbc43bb..f6c5a6f 100644
--- a/meta/recipes-support/neon/neon_0.30.0.bb
+++ b/meta/recipes-support/neon/neon_0.30.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "neon is an HTTP and WebDAV client library, with a C interface."
+SUMMARY = "An HTTP and WebDAV client library with a C interface"
 HOMEPAGE = "http://www.webdav.org/neon/"
 SECTION = "libs"
 LICENSE = "LGPLv2+"
diff --git a/meta/recipes-support/npth/npth_0.91.bb b/meta/recipes-support/npth/npth_0.91.bb
index 57fe55a..56a9d9b 100644
--- a/meta/recipes-support/npth/npth_0.91.bb
+++ b/meta/recipes-support/npth/npth_0.91.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "New GNU Portable Threads"
+SUMMARY = "New GNU Portable Threads library"
 HOMEPAGE = "http://www.gnupg.org/software/pth/"
 SECTION = "libs"
 LICENSE = "LGPLv3+ & GPLv2+"
diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index 32110f2..cb13a815 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The popt library for parsing command line options."
+SUMMARY = "Library for parsing command line options"
 HOMEPAGE = "http://rpm5.org/"
 SECTION = "libs"
 
diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 8cbab7d..4a85332 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU Portable Threads"
+SUMMARY = "GNU Portable Threads library"
 HOMEPAGE = "http://www.gnu.org/software/pth/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 93f6010..6eedb6d 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "shared MIME database and spec"
+SUMMARY = "Shared MIME type database and specification"
 HOMEPAGE = "http://freedesktop.org/wiki/Software/shared-mime-info"
 SECTION = "base"
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 064d78c..d75363a 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "An Embeddable SQL Database Engine"
+SUMMARY = "Embeddable SQL database engine"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
 DEPENDS = "readline ncurses"
diff --git a/meta/recipes-support/taglib/taglib_1.8.bb b/meta/recipes-support/taglib/taglib_1.8.bb
index 4c151b7..7327bc8 100644
--- a/meta/recipes-support/taglib/taglib_1.8.bb
+++ b/meta/recipes-support/taglib/taglib_1.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "TagLib is a library for reading and editing the meta-data of several popular audio formats"
+SUMMARY = "Library for reading and editing the meta-data of popular audio formats"
 SECTION = "libs/multimedia"
 HOMEPAGE = "http://developer.kde.org/~wheeler/taglib.html"
 LICENSE = "LGPLv2.1 | MPL-1"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 58e8139..77ba97d 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Creates an 'xuser' account"
+SUMMARY = "Creates an 'xuser' account used for running X11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index b653fab..4081a7f 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "vte is a virtual terminal emulator"
+SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.1+"
 DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
-- 
1.8.1.2


