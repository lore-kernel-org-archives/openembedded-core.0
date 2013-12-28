Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B8F4260E79
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:29:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:29:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457009925"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:29:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:00 +0000
Message-Id: <8b97995244fd5d4a2f641991ebde570576d41242.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/38] Replace one-line DESCRIPTION with SUMMARY
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
X-List-Received-Date: Sat, 28 Dec 2013 22:29:52 -0000

These recipes had short one-line DESCRIPTION values and no SUMMARY value
set. In this case it's much better to just set SUMMARY since DESCRIPTION
is defaulted from SUMMARY anyway and then the SUMMARY is at least
useful vs. the default value ("${PN} version ${PV}-${PR}").

(The values for these recipes needed no tweaking - this is just a
straight DESCRIPTION -> SUMMARY change.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb                     | 2 +-
 meta/recipes-bsp/formfactor/formfactor_0.0.bb                           | 2 +-
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb                              | 2 +-
 meta/recipes-bsp/pointercal/pointercal_0.0.bb                           | 2 +-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb                                    | 2 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb                            | 2 +-
 .../mobile-broadband-provider-info_git.bb                               | 2 +-
 meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb           | 2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb                            | 2 +-
 meta/recipes-core/eglibc/cross-localedef-native_2.17.bb                 | 2 +-
 meta/recipes-core/eglibc/cross-localedef-native_2.18.bb                 | 2 +-
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb                      | 2 +-
 meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb              | 2 +-
 meta/recipes-core/meta/meta-environment.bb                              | 2 +-
 meta/recipes-core/meta/meta-toolchain.bb                                | 2 +-
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb            | 2 +-
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb                       | 2 +-
 meta/recipes-devtools/intltool/intltool.inc                             | 2 +-
 meta/recipes-devtools/nasm/nasm_2.10.09.bb                              | 2 +-
 meta/recipes-devtools/opkg/opkg-config-base_1.0.bb                      | 2 +-
 meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb                   | 2 +-
 meta/recipes-devtools/pseudo/pseudo.inc                                 | 2 +-
 meta/recipes-devtools/python/python-argparse_1.2.1.bb                   | 2 +-
 meta/recipes-devtools/python/python-pygobject_2.27.91.bb                | 2 +-
 meta/recipes-devtools/python/python.inc                                 | 2 +-
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb                                | 2 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb                      | 2 +-
 meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb          | 2 +-
 meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb              | 2 +-
 meta/recipes-extended/augeas/augeas.inc                                 | 2 +-
 meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb                       | 2 +-
 meta/recipes-extended/logrotate/logrotate_3.8.1.bb                      | 2 +-
 meta/recipes-extended/lsb/lsb_4.1.bb                                    | 2 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb                        | 2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb                      | 2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                                 | 2 +-
 meta/recipes-gnome/gnome/gnome-common_3.7.4.bb                          | 2 +-
 meta/recipes-gnome/gnome/gnome-desktop.inc                              | 2 +-
 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb                     | 2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb                      | 2 +-
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb                          | 2 +-
 meta/recipes-gnome/librsvg/librsvg_2.40.1.bb                            | 2 +-
 meta/recipes-graphics/fstests/fstests_git.bb                            | 2 +-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                   | 2 +-
 meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                      | 2 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb                      | 2 +-
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb        | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc                      | 2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc                | 2 +-
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb                      | 2 +-
 meta/recipes-graphics/xorg-proto/xorg-proto-common.inc                  | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb           | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc                     | 2 +-
 meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb                  | 2 +-
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb                | 2 +-
 meta/recipes-kernel/linux/linux-dummy.bb                                | 2 +-
 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb                  | 2 +-
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb                        | 2 +-
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb                          | 2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb                       | 2 +-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc                       | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc                | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc                  | 2 +-
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb                      | 2 +-
 meta/recipes-qt/qt-apps/quicky_0.4.bb                                   | 2 +-
 meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb                             | 2 +-
 meta/recipes-rt/rt-tests/rt-tests_0.85.bb                               | 2 +-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb                           | 2 +-
 meta/recipes-sato/libowl/libowl_git.bb                                  | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb            | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb              | 2 +-
 meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb              | 2 +-
 meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb            | 2 +-
 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc           | 2 +-
 meta/recipes-sato/owl-video-widget/libowl-av_git.bb                     | 2 +-
 meta/recipes-sato/owl-video-widget/owl-video_git.bb                     | 2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb                              | 2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb                             | 2 +-
 meta/recipes-support/apr/apr-util_1.5.2.bb                              | 2 +-
 meta/recipes-support/apr/apr_1.4.8.bb                                   | 2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb                          | 2 +-
 meta/recipes-support/boost/bjam-native_1.55.0.bb                        | 2 +-
 meta/recipes-support/boost/boost.inc                                    | 2 +-
 meta/recipes-support/enchant/enchant_1.6.0.bb                           | 2 +-
 meta/recipes-support/gnutls/gnutls.inc                                  | 2 +-
 meta/recipes-support/gnutls/libtasn1_3.3.bb                             | 2 +-
 meta/recipes-support/libassuan/libassuan_2.1.1.bb                       | 2 +-
 meta/recipes-support/libfm/libfm_1.1.2.2.bb                             | 2 +-
 meta/recipes-support/libical/libical_0.48.bb                            | 2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb                      | 2 +-
 meta/recipes-support/libusb/libusb1_1.0.9.bb                            | 2 +-
 meta/recipes-support/libxslt/libxslt_1.1.28.bb                          | 2 +-
 meta/recipes-support/lzo/lzo_2.06.bb                                    | 2 +-
 meta/recipes-support/nspr/nspr_4.10.2.bb                                | 2 +-
 94 files changed, 94 insertions(+), 94 deletions(-)

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
index 427726a..2579134 100644
--- a/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
+++ b/meta-selftest/recipes-test/aspell/aspell_0.0.0.1.bb
@@ -2,7 +2,7 @@
 # It has a lower and invalid version number in order not to be accidentally used by bitbake.
 # It is used for tests that require overlayed recipe files.
 
-DESCRIPTION = "GNU Aspell spell-checker"
+SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index c9b53a1..b8d4fda 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Device formfactor information"
+SUMMARY = "Device formfactor information"
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
diff --git a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
index 466c073..0208509 100644
--- a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
+++ b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "PCMCIA-cs configuration files for wireless LAN cards based on Intersil's Prism2/2.5/3 chipset"
+SUMMARY = "PCMCIA-cs configuration files for wireless LAN cards based on Intersil's Prism2/2.5/3 chipset"
 SECTION = "kernel/modules"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta/recipes-bsp/pointercal/pointercal_0.0.bb b/meta/recipes-bsp/pointercal/pointercal_0.0.bb
index c8233ea..5029c4a 100644
--- a/meta/recipes-bsp/pointercal/pointercal_0.0.bb
+++ b/meta/recipes-bsp/pointercal/pointercal_0.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Touchscreen calibration data"
+SUMMARY = "Touchscreen calibration data"
 SECTION = "base"
 PR = "r11"
 LICENSE = "MIT"
diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index bce4f4e..a8f1d08 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "User support binary for the uvesafb kernel module"
+SUMMARY = "User support binary for the uvesafb kernel module"
 HOMEPAGE = "http://dev.gentoo.org/~spock/projects/uvesafb/"
 
 # the copyright info is at the bottom of README, expect break
diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
index 5919c21..19a9f05 100644
--- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ISC Internet Domain Name Server"
+SUMMARY = "ISC Internet Domain Name Server"
 HOMEPAGE = "http://www.isc.org/sw/bind/"
 SECTION = "console/network"
 
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 43d99b5..a0d18ef 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Mobile Broadband Service Provider Database"
+SUMMARY = "Mobile Broadband Service Provider Database"
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index b4d34bb..3aef24e 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tools for the Linux Standard Wireless Extension Subsystem"
+SUMMARY = "Tools for the Linux Standard Wireless Extension Subsystem"
 HOMEPAGE = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
 LICENSE = "GPLv2 & (LGPLv2.1 | MPL-1.1 | BSD)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index 93c782d..fdb19ba 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A simple tool to wait for a specific signal over DBus"
+SUMMARY = "A simple tool to wait for a specific signal over DBus"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
 SECTION = "base"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
index 1d3c22b..a099c18 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.17.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Cross locale generation tool for eglibc"
+SUMMARY = "Cross locale generation tool for eglibc"
 HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 LICENSE = "LGPL-2.1"
diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
index 62296b52..4e7e947 100644
--- a/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
+++ b/meta/recipes-core/eglibc/cross-localedef-native_2.18.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Cross locale generation tool for eglibc"
+SUMMARY = "Cross locale generation tool for eglibc"
 HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 LICENSE = "LGPL-2.1"
diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
index 63ef95b..d7bc444 100644
--- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A standalone native ldconfig build"
+SUMMARY = "A standalone native ldconfig build"
 
 LICENSE = "GPLv2+"
 
diff --git a/meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb b/meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
index 14f1d41..fb312f8 100644
--- a/meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
+++ b/meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Poky example feed configuration"
+SUMMARY = "Poky example feed configuration"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r2"
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 41b87b5..0a8dca2 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Package of environment files for SDK"
+SUMMARY = "Package of environment files for SDK"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 LICENSE = "MIT"
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index dccf394..6ec90aa 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Meta package for building a installable toolchain"
+SUMMARY = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
 
 PR = "r7"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index c8b5623..57480b9 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Target packages for the standalone SDK"
+SUMMARY = "Target packages for the standalone SDK"
 PR = "r8"
 LICENSE = "MIT"
 
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
index ee6aa6a..3fc75fe 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "DMI (Desktop Management Interface) table related utilities"
+SUMMARY = "DMI (Desktop Management Interface) table related utilities"
 HOMEPAGE = "http://www.nongnu.org/dmidecode/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index bf0e45b..be77704 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Utility scripts for internationalizing XML"
+SUMMARY = "Utility scripts for internationalizing XML"
 SECTION = "devel"
 LICENSE = "GPLv2"
 
diff --git a/meta/recipes-devtools/nasm/nasm_2.10.09.bb b/meta/recipes-devtools/nasm/nasm_2.10.09.bb
index 19663d6..bfba5dc 100644
--- a/meta/recipes-devtools/nasm/nasm_2.10.09.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.10.09.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "General-purpose x86 assembler"
+SUMMARY = "General-purpose x86 assembler"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
diff --git a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
index f40e981..acbe129 100644
--- a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Base configuration files for opkg"
+SUMMARY = "Base configuration files for opkg"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index 66df915..43a8a84 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "XML::Parser - A perl module for parsing XML documents"
+SUMMARY = "XML::Parser - A perl module for parsing XML documents"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e42d1cf8b51f1"
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 9411c57..f1d3db5 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -2,7 +2,7 @@
 # difficult.  To work around the current version of the wrapper use:
 # BBFETCH2=True PSEUDO_BUILD=1 ../bitbake/bin/bitbake pseudo-native [-c CMD]
 
-DESCRIPTION = "Pseudo gives fake root capabilities to a normal user"
+SUMMARY = "Pseudo gives fake root capabilities to a normal user"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/pseudo"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 SECTION = "base"
diff --git a/meta/recipes-devtools/python/python-argparse_1.2.1.bb b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
index 1f07738..b2850a3 100644
--- a/meta/recipes-devtools/python/python-argparse_1.2.1.bb
+++ b/meta/recipes-devtools/python/python-argparse_1.2.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python command-line parsing library"
+SUMMARY = "Python command-line parsing library"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=09d08bb5b7047e2688ea3faad6408aa8"
diff --git a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
index 322521b..49ee108 100644
--- a/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
+++ b/meta/recipes-devtools/python/python-pygobject_2.27.91.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Python GObject bindings"
+SUMMARY = "Python GObject bindings"
 SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index fcfeda5..87f5a39 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "The Python Programming Language"
+SUMMARY = "The Python Programming Language"
 HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index 0d6468a..be59ad1 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Tool Command Language"
+SUMMARY = "Tool Command Language"
 LICENSE = "BSD-3-Clause"
 SECTION = "devel/tcltk"
 HOMEPAGE = "http://tcl.sourceforge.net"
diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
index 8cdedf9..b13755e 100644
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A boot profiling tool"
+SUMMARY = "A boot profiling tool"
 HOMEPAGE = "http://code.google.com/p/ubootchart/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
index f65e92b..226a645 100644
--- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
+++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace NFS server"
+SUMMARY = "Userspace NFS server"
 SECTION = "console/network"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
diff --git a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
index b1869fd..9a28684 100644
--- a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
+++ b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Kernel header preprocessor"
+SUMMARY = "Kernel header preprocessor"
 SECTION = "devel"
 LICENSE = "BSD-2-Clause"
 
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index da41d42..61f81b0 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Augeas configuration API"
+SUMMARY = "Augeas configuration API"
 HOMEPAGE = "http://augeas.net/"
 BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
index e8be659..528fda7 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lightweight high-performance web server"
+SUMMARY = "Lightweight high-performance web server"
 HOMEPAGE = "http://www.lighttpd.net/"
 BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
 
diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
index e5b30d8..b12a325 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Rotates, compresses, removes and mails system log files"
+SUMMARY = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index ecb4dcc..d265731 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "LSB support for OpenEmbedded"
+SUMMARY = "LSB support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index f168416..a22b981 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Perl script that converts Texinfo to HTML"
+SUMMARY = "Perl script that converts Texinfo to HTML"
 HOMEPAGE    = "http://www.nongnu.org/texi2html/"
 SECTION     = "console/utils"
 LICENSE     = "GPLv2"
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
index b7aed7a..408178d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Image loading library for GTK+"
+SUMMARY = "Image loading library for GTK+"
 HOMEPAGE = "http://www.gtk.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 50285aa..e081ec3 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME configuration system"
+SUMMARY = "GNOME configuration system"
 SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
diff --git a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
index 70b1e29..1fd2d83 100644
--- a/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Common macros for building GNOME applications"
+SUMMARY = "Common macros for building GNOME applications"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-gnome/gnome/gnome-desktop.inc b/meta/recipes-gnome/gnome/gnome-desktop.inc
index 3c6dc24..4fcf6ab 100644
--- a/meta/recipes-gnome/gnome/gnome-desktop.inc
+++ b/meta/recipes-gnome/gnome/gnome-desktop.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME library for reading .desktop files"
+SUMMARY = "GNOME library for reading .desktop files"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2 & LGPLv2"
 DEPENDS = "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification"
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index 920ee4f..eb65224 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME 2 default icon themes"
+SUMMARY = "GNOME 2 default icon themes"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome"
diff --git a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
index fc891c7..62712fa 100644
--- a/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Base MIME and Application database for GNOME"
+SUMMARY = "Base MIME and Application database for GNOME"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
index 934ef10..4966ea4 100644
--- a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
+++ b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library of functions for 2D graphics"
+SUMMARY = "Library of functions for 2D graphics"
 SECTION = "x11/gnome"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
index 4fc0e72..7b97df5 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for rendering SVG files"
+SUMMARY = "Library for rendering SVG files"
 HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/librsvg/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index 678d1e7..2f5a872 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Various benchmarning tests for X"
+SUMMARY = "Various benchmarning tests for X"
 HOMEPAGE = "http://www.o-hand.com"
 SECTION = "devel"
 LICENSE = "Zlib"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
index e2e971e..4acac39 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox window manager core library"
+SUMMARY = "Matchbox window manager core library"
 SECTION = "x11/libs"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.com/"
diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
index 360f312..fe886f5 100644
--- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
+++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A clock combined with a game of pong"
+SUMMARY = "A clock combined with a game of pong"
 LICENSE = "GPLv2+"
 DEPENDS = "virtual/libx11 xdmcp xau"
 
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 2df1347..a2d8885 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Common X11 scripts and configuration files"
+SUMMARY = "Common X11 scripts and configuration files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 2e9dc03..7a6f79b 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
+SUMMARY = "Touchscreen calibration data from xinput-calibrator"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 40508ff..524a2d3 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "X application"
+SUMMARY = "X application"
 HOMEPAGE = "http://www.x.org/"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/apps"
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 5f5d282..b46974b 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "X driver"
+SUMMARY = "X driver"
 HOMEPAGE = "http://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/drivers"
diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
index 2e8c7e6..8b42991 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "X.Org font package creation/installation utilities"
+SUMMARY = "X.Org font package creation/installation utilities"
 
 require xorg-font-common.inc
 
diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
index 4680d0e..625a718 100644
--- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "X protocol headers: ${XORG_PN}"
+SUMMARY = "X protocol headers: ${XORG_PN}"
 HOMEPAGE = "http://www.x.org"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index b8cd27e..57b3c0c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "X.Org X server configuration file"
+SUMMARY = "X.Org X server configuration file"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index ebfb814..a0283cd 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "The X.Org X server"
+SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index bb136a6..27aacde 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple XVideo test application"
+SUMMARY = "Simple XVideo test application"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/test-xvideo.c;beginline=1;endline=20;md5=6ae3b4c3c2ff9e51dbbc35bb237afa00"
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 1b0e11f..99ce95b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Firmware files for use with Linux kernel"
+SUMMARY = "Firmware files for use with Linux kernel"
 SECTION = "kernel"
 # Notes:
 # This is kind of a mess. Each bit of firmware has their own license. Some free
diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 1c837c9..3b898f8 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -1,5 +1,5 @@
 SECTION = "kernel"
-DESCRIPTION = "Dummy Linux kernel"
+SUMMARY = "Dummy Linux kernel"
 LICENSE = "GPL"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
index 0cfcbe4..ab9acba 100644
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "UProbes kernel module for SystemTap"
+SUMMARY = "UProbes kernel module for SystemTap"
 
 require systemtap_git.inc
 
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index 00e3daa..9268a50 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Graphical trace viewer for Ftrace"
+SUMMARY = "Graphical trace viewer for Ftrace"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index e9a41d4..74eafbb 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "User interface to Ftrace"
+SUMMARY = "User interface to Ftrace"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index 0e1ea76..95ba244 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "ALSA sound library"
+SUMMARY = "ALSA sound library"
 HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "libs/multimedia"
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
index b2c7eea..c7e6595 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Fluendo closed-format GStreamer plug-in"
+SUMMARY = "Fluendo closed-format GStreamer plug-in"
 SECTION = "multimedia"
 HOMEPAGE = "http://www.fluendo.com/resources/source-plugins.php"
 DEPENDS = "gstreamer zlib"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index ec5956a..2b7123b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Libav-based GStreamer 1.x plugin"
+SUMMARY = "Libav-based GStreamer 1.x plugin"
 SECTION = "multimedia"
 LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
 LICENSE_FLAGS = "commercial"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 324d3f9..b76786b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "OpenMAX IL plugins for GStreamer"
+SUMMARY = "OpenMAX IL plugins for GStreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index bca8836..f6c6a16 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Bellagio OpenMAX Integration Layer"
+SUMMARY = "Bellagio OpenMAX Integration Layer"
 HOMEPAGE = "http://omxil.sourceforge.net/"
 LICENSE = "LGPLv2.1+"
 LICENSE_FLAGS = "commercial"
diff --git a/meta/recipes-qt/qt-apps/quicky_0.4.bb b/meta/recipes-qt/qt-apps/quicky_0.4.bb
index acacd8e..bcaa562 100644
--- a/meta/recipes-qt/qt-apps/quicky_0.4.bb
+++ b/meta/recipes-qt/qt-apps/quicky_0.4.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "A simple note-taking application with Wiki-style syntax and behaviour"
+SUMMARY = "A simple note-taking application with Wiki-style syntax and behaviour"
 HOMEPAGE = "http://qt-apps.org/content/show.php/Quicky?content=80325"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://version.h;endline=19;md5=878bdaff438dab86298301fd1a210e14"
diff --git a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
index 6cd3e17..02695bf 100644
--- a/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
+++ b/meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Init script for qtdemo"
+SUMMARY = "Init script for qtdemo"
 LICENSE = "MIT"
 SRC_URI = "file://qtdemo-init"
 PR = "r3"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb b/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
index c3964d2..ae61092 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_0.85.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Real-Time preemption testcases"
+SUMMARY = "Real-Time preemption testcases"
 HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
 SECTION = "tests"
 DEPENDS = "linux-libc-headers virtual/libc"
diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index 246bc5f..f124be9 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Simple GTK+ Text Editor"
+SUMMARY = "Simple GTK+ Text Editor"
 HOMEPAGE = "http://tarot.freeshell.org/leafpad/"
 
 LICENSE = "GPLv2 & GPLv2+"
diff --git a/meta/recipes-sato/libowl/libowl_git.bb b/meta/recipes-sato/libowl/libowl_git.bb
index a6965f0..3ccd340 100644
--- a/meta/recipes-sato/libowl/libowl_git.bb
+++ b/meta/recipes-sato/libowl/libowl_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OpenedHand Widget Library"
+SUMMARY = "OpenedHand Widget Library"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
index 30f294b..120f086 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox Window Manager Desktop"
+SUMMARY = "Matchbox Window Manager Desktop"
 LICENSE = "GPLv2.0+"
 DEPENDS = "libmatchbox startup-notification"
 SECTION = "x11/wm"
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
index 7775704..c52e7f2 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox Window Manager Desktop"
+SUMMARY = "Matchbox Window Manager Desktop"
 LICENSE = "GPLv2.0+"
 DEPENDS = "gtk+ startup-notification"
 SECTION = "x11/wm"
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index 003f440..29b472a 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox Window Manager Desktop"
+SUMMARY = "Matchbox Window Manager Desktop"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index cecaa99..00a75af 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox virtual keyboard for X11"
+SUMMARY = "Matchbox virtual keyboard for X11"
 HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 SECTION = "x11"
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
index 797d239..b0f8380 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Matchbox window manager Sato themes"
+SUMMARY = "Matchbox window manager Sato themes"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
index 572132b..2b768d5 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OpenedHand Widget Library Audio/Video"
+SUMMARY = "OpenedHand Widget Library Audio/Video"
 HOMEPAGE = "http://www.o-hand.com"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
index c881745..db83154 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OpenedHand Widget Library video widget"
+SUMMARY = "OpenedHand Widget Library video widget"
 HOMEPAGE = "http://o-hand.com/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "LGPLv2.1 & GPLv2+"
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
index e66aa2a..fe25682 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Fast lightweight tabbed filemanager"
+SUMMARY = "Fast lightweight tabbed filemanager"
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index 1de0201..bd762e9 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Portable Puzzle Collection"
+SUMMARY = "Portable Puzzle Collection"
 HOMEPAGE = "http://o-hand.com/"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
diff --git a/meta/recipes-support/apr/apr-util_1.5.2.bb b/meta/recipes-support/apr/apr-util_1.5.2.bb
index ea0f7fb..653b147 100644
--- a/meta/recipes-support/apr/apr-util_1.5.2.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Apache Portable Runtime (APR) companion library"
+SUMMARY = "Apache Portable Runtime (APR) companion library"
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "apr expat gdbm"
diff --git a/meta/recipes-support/apr/apr_1.4.8.bb b/meta/recipes-support/apr/apr_1.4.8.bb
index d834170..d23929f 100644
--- a/meta/recipes-support/apr/apr_1.4.8.bb
+++ b/meta/recipes-support/apr/apr_1.4.8.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Apache Portable Runtime (APR) library"
+SUMMARY = "Apache Portable Runtime (APR) library"
 HOMEPAGE = "http://apr.apache.org/"
 SECTION = "libs"
 DEPENDS = "util-linux"
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index b196d96..fddc6a5 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU Aspell spell-checker"
+SUMMARY = "GNU Aspell spell-checker"
 SECTION = "console/utils"
 LICENSE="LGPLv2 | LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
diff --git a/meta/recipes-support/boost/bjam-native_1.55.0.bb b/meta/recipes-support/boost/bjam-native_1.55.0.bb
index 59a0310..d85d1a9 100644
--- a/meta/recipes-support/boost/bjam-native_1.55.0.bb
+++ b/meta/recipes-support/boost/bjam-native_1.55.0.bb
@@ -1,6 +1,6 @@
 include boost-${PV}.inc
 
-DESCRIPTION = "Portable Boost.Jam build tool for boost"
+SUMMARY = "Portable Boost.Jam build tool for boost"
 SECTION = "devel"
 
 inherit native
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index f13051c..c7642be 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
+SUMMARY = "Free peer-reviewed portable C++ source libraries"
 SECTION = "libs"
 DEPENDS = "bjam-native zlib bzip2"
 
diff --git a/meta/recipes-support/enchant/enchant_1.6.0.bb b/meta/recipes-support/enchant/enchant_1.6.0.bb
index c16a2a8..68ca525 100644
--- a/meta/recipes-support/enchant/enchant_1.6.0.bb
+++ b/meta/recipes-support/enchant/enchant_1.6.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Enchant Spell checker API Library"
+SUMMARY = "Enchant Spell checker API Library"
 SECTION     = "libs"
 HOMEPAGE = "http://www.abisource.com/projects/enchant/"
 BUGTRACKER = "http://bugzilla.abisource.com/enter_bug.cgi?product=Enchant"
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 12cc4f1..18c91eb 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNU Transport Layer Security Library"
+SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
diff --git a/meta/recipes-support/gnutls/libtasn1_3.3.bb b/meta/recipes-support/gnutls/libtasn1_3.3.bb
index 53de118..573d8c8 100644
--- a/meta/recipes-support/gnutls/libtasn1_3.3.bb
+++ b/meta/recipes-support/gnutls/libtasn1_3.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for ASN.1 and DER manipulation"
+SUMMARY = "Library for ASN.1 and DER manipulation"
 HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
diff --git a/meta/recipes-support/libassuan/libassuan_2.1.1.bb b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
index 91784ea..4e6b4f8 100644
--- a/meta/recipes-support/libassuan/libassuan_2.1.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "IPC library used by GnuPG and GPGME"
+SUMMARY = "IPC library used by GnuPG and GPGME"
 HOMEPAGE = "http://www.gnupg.org/related_software/libassuan/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
diff --git a/meta/recipes-support/libfm/libfm_1.1.2.2.bb b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
index 97865e1..581ab8c 100644
--- a/meta/recipes-support/libfm/libfm_1.1.2.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.2.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library for file management"
+SUMMARY = "Library for file management"
 HOMEPAGE = "http://pcmanfm.sourceforge.net/"
 
 LICENSE = "GPLv2 & GPLv2+"
diff --git a/meta/recipes-support/libical/libical_0.48.bb b/meta/recipes-support/libical/libical_0.48.bb
index 459c5c5..f464026 100644
--- a/meta/recipes-support/libical/libical_0.48.bb
+++ b/meta/recipes-support/libical/libical_0.48.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
+SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
 HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
 LICENSE = "LGPLv2.1 | MPL-1"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
index 3325939..a7ea106 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.44.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "An HTTP library implementation in C"
+SUMMARY = "An HTTP library implementation in C"
 HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-support/libusb/libusb1_1.0.9.bb b/meta/recipes-support/libusb/libusb1_1.0.9.bb
index 012ac27..d57425b 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.9.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Userspace library to access USB (version 1.0)"
+SUMMARY = "Userspace library to access USB (version 1.0)"
 HOMEPAGE = "http://libusb.sf.net"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index a100693..24401bb 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GNOME XSLT library"
+SUMMARY = "GNOME XSLT library"
 HOMEPAGE = "http://xmlsoft.org/XSLT/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
diff --git a/meta/recipes-support/lzo/lzo_2.06.bb b/meta/recipes-support/lzo/lzo_2.06.bb
index 187a95a..23f54ed 100644
--- a/meta/recipes-support/lzo/lzo_2.06.bb
+++ b/meta/recipes-support/lzo/lzo_2.06.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Lossless data compression library"
+SUMMARY = "Lossless data compression library"
 HOMEPAGE = "http://www.oberhumer.com/opensource/lzo/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-support/nspr/nspr_4.10.2.bb b/meta/recipes-support/nspr/nspr_4.10.2.bb
index b523a9f..4db506c 100644
--- a/meta/recipes-support/nspr/nspr_4.10.2.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.2.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Netscape Portable Runtime Library"
+SUMMARY = "Netscape Portable Runtime Library"
 HOMEPAGE =  "http://www.mozilla.org/projects/nspr/"
 LICENSE = "GPL-2.0 | MPL-2.0 | LGPL-2.1"
 LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=6;md5=90c2fdee38e45d6302abcfe475c8b5c5 \
-- 
1.8.1.2


