Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24C816BD9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 01:56:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7U1ugFa018311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:56:42 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 29 Aug 2013 18:56:41 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2013 09:56:36 +0800
Message-ID: <8bf69943e444d8ba061d2e20199bb96ed0403da7.1377827133.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377827133.git.jackie.huang@windriver.com>
References: <cover.1377827133.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] remove the unnecessary protocol parameters
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
X-List-Received-Date: Fri, 30 Aug 2013 01:56:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's not necessary to specify the protocol parameter when it's the
default protocol for the fetcher, e.g. the default protocol for
git fetcher it git, "protocol=git" isn't needed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/clutter.bbclass                       |    2 +-
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    2 +-
 .../u-boot/u-boot-fw-utils_2013.01.01.bb           |    2 +-
 .../u-boot/u-boot-mkimage_2013.01.01.bb            |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb       |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb          |    2 +-
 meta/recipes-bsp/x-load/x-load_git.bb              |    6 +++---
 meta/recipes-bsp/zaurusd/zaurusd_git.bb            |    2 +-
 .../connman/connman-gnome_0.7.bb                   |    2 +-
 .../mobile-broadband-provider-info_git.bb          |    2 +-
 meta/recipes-connectivity/neard/neard_0.10.bb      |    2 +-
 meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb       |    2 +-
 .../images/build-appliance-image_8.0.bb            |    2 +-
 meta/recipes-core/psplash/psplash_git.bb           |    2 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |    2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    2 +-
 .../btrfs-tools/btrfs-tools_git.bb                 |    2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 +-
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |    2 +-
 .../recipes-devtools/swabber/swabber-native_git.bb |    2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
 .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |    2 +-
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |    2 +-
 meta/recipes-graphics/drm/libdrm_git.bb            |    2 +-
 meta/recipes-graphics/fstests/fstests_git.bb       |    2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |    2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |    2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb            |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb     |    2 +-
 .../xorg-driver/xf86-input-keyboard_git.bb         |    2 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |    2 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        |    2 +-
 .../xorg-driver/xf86-video-intel_git.bb            |    2 +-
 .../xorg-driver/xf86-video-omap_git.bb             |    2 +-
 .../recipes-graphics/xorg-lib/libxcalibrate_git.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libxext_git.bb      |    2 +-
 meta/recipes-graphics/xorg-lib/libxi_git.bb        |    2 +-
 .../xorg-proto/calibrateproto_git.bb               |    2 +-
 meta/recipes-graphics/xorg-proto/dri2proto_git.bb  |    2 +-
 meta/recipes-graphics/xorg-proto/inputproto_git.bb |    2 +-
 .../xvideo-tests/xvideo-tests_git.bb               |    2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    2 +-
 meta/recipes-kernel/dtc/dtc.inc                    |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |    2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |    2 +-
 meta/recipes-kernel/lttng/babeltrace_1.1.1.bb      |    2 +-
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |    2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb     |    2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb       |    2 +-
 meta/recipes-kernel/oprofile/oprofile_git.bb       |    2 +-
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    2 +-
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    2 +-
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    2 +-
 .../gstreamer/gstreamer1.0-libav_git.bb            |    2 +-
 .../gstreamer/gstreamer1.0-omx_git.bb              |    2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 +-
 .../gstreamer/gstreamer1.0_git.bb                  |    2 +-
 meta/recipes-sato/gaku/gaku_git.bb                 |    2 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
 meta/recipes-sato/libowl/libowl_git.bb             |    2 +-
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    2 +-
 .../matchbox-desktop-sato_git.bb                   |    2 +-
 .../matchbox-desktop/matchbox-desktop_git.bb       |    2 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../matchbox-terminal/matchbox-terminal_git.bb     |    2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_git.bb |    2 +-
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    2 +-
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-sato/puzzles/puzzles_r9765.bb         |    2 +-
 .../sato-screenshot/sato-screenshot_git.bb         |    2 +-
 .../settings-daemon/settings-daemon_git.bb         |    2 +-
 meta/recipes-sato/web/web-webkit_git.bb            |    2 +-
 98 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
index 0dc4850..66a49bc 100644
--- a/meta/classes/clutter.bbclass
+++ b/meta/classes/clutter.bbclass
@@ -15,7 +15,7 @@ FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${REALNAME}-${PV}", "${FILE
 
 CLUTTER_SRC_FTP = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
 
-CLUTTER_SRC_GIT = "git://git.gnome.org/${REALNAME};protocol=git"
+CLUTTER_SRC_GIT = "git://git.gnome.org/${REALNAME}"
 
 SRC_URI = "${CLUTTER_SRC_FTP}"
 S = "${WORKDIR}/${REALNAME}-${PV}"
diff --git a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
index 1ded416..ef48884 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
+++ b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
@@ -11,7 +11,7 @@ PR = "r0"
 
 RDEPENDS_${PN} = "pm-utils"
 
-SRC_URI = "git://git.debian.org/git/debian-eeepc/eeepc-acpi-scripts.git;protocol=git \
+SRC_URI = "git://git.debian.org/git/debian-eeepc/eeepc-acpi-scripts.git \
 	   file://remove-doc-check.patch \
 	   file://powerbtn.patch \
 	   file://policy-funcs "
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
index efa418f..e1c2d46 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.01.01.bb
@@ -16,7 +16,7 @@ SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
 
 PV = "v2013.01.01+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
index 2b39998..dc6e2f6 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
@@ -14,7 +14,7 @@ SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
 
 PV = "v2013.01.01+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
index a9cbeca..0b8651a 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -17,7 +17,7 @@ SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
 PV = "v2011.03+git${SRCPV}"
 PR = "r8"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
index a115ed2..4eb00a2 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -17,7 +17,7 @@ SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 PV = "v2011.06+git${SRCPV}"
 PR = "r3"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
index 8ffb8f3..0876eb3 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
@@ -22,7 +22,7 @@ SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
 PV = "v2013.01.01+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
index f3f4b62..3141a2d 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -16,7 +16,7 @@ SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
 
 PV = "v2013.07+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/x-load/x-load_git.bb b/meta/recipes-bsp/x-load/x-load_git.bb
index 220419e..910c078 100644
--- a/meta/recipes-bsp/x-load/x-load_git.bb
+++ b/meta/recipes-bsp/x-load/x-load_git.bb
@@ -9,9 +9,9 @@ SRCREV = "9f94c6577e3a018b6b75cbe39f32bb331871f915"
 PV = "1.5.0+git${SRCPV}"
 PR="r0"
 
-#SRC_URI = "git://www.sakoman.net/git/x-load-omap3.git;branch=master;protocol=git"
-#SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master;protocol=git"
-SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master;protocol=git"
+#SRC_URI = "git://www.sakoman.net/git/x-load-omap3.git;branch=master"
+#SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master"
+SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master"
 
 SRC_URI_append_beagleboard = " file://name.patch "
 
diff --git a/meta/recipes-bsp/zaurusd/zaurusd_git.bb b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
index 79bb0d1..37aaee8 100644
--- a/meta/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -9,7 +9,7 @@ SRCREV = "85d941d87f0c41b196766a173feaafffa6de2dc2"
 PV = "0.1+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index f2ed672..2d422b2 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+ dbus-glib intltool-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
+SRC_URI = "git://github.com/connectivity/connman-gnome.git \
 	   file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
        file://null_check_for_ipv4_config.patch \
 	   file://images/* \
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index b797f8c..96d1e51 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -7,7 +7,7 @@ PV = "20120614+gitr${SRCPV}"
 PE = "1"
 PR = "r0"
 
-SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info;protocol=git"
+SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info"
 S = "${WORKDIR}/git"
 
 inherit autotools
diff --git a/meta/recipes-connectivity/neard/neard_0.10.bb b/meta/recipes-connectivity/neard/neard_0.10.bb
index 0e590b1..1ba7bce 100644
--- a/meta/recipes-connectivity/neard/neard_0.10.bb
+++ b/meta/recipes-connectivity/neard/neard_0.10.bb
@@ -1,6 +1,6 @@
 require neard.inc
 
-SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git \
            file://neard.in \
            file://neard.service.in \
           "
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index db0bf73..beafb77 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -5,7 +5,7 @@ SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
 PV	 = "0.12-git${SRCPV}"
 PR = "r5"
 
-SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
+SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git \
 	    file://ofono"
 
 do_configure_prepend () {
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index cb3735b..93c782d 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -10,7 +10,7 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/recipes-core/images/build-appliance-image_8.0.bb
index 27cdd6f..1b5efbb 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -22,7 +22,7 @@ IMAGE_FSTYPES = "vmdk"
 inherit core-image
 
 SRCREV ?= "ac60aa8cf707eec58e2cb51e7c406250d0b43ef1"
-SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
+SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
           "
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 2228963..5122d38 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -9,7 +9,7 @@ SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
            ${SPLASH_IMAGES}"
 
diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 6fca9e4..2005ae1 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -4,7 +4,7 @@ PV = "0.9.33+git${SRCPV}"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
-SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
+SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
 	file://uClibc.machine \
 	file://uClibc.distro \
 	file://obstack.cfg \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index bfcbd97..add8234 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -10,7 +10,7 @@ PR = "r5"
 # Revision corresponding to tag update-rc.d_0.7
 SRCREV = "eca680ddf28d024954895f59a241a622dd575c11"
 
-SRC_URI = "git://github.com/philb/update-rc.d.git;protocol=git \
+SRC_URI = "git://github.com/philb/update-rc.d.git \
            file://add-verbose.patch \
            file://check-if-symlinks-are-valid.patch \
           "
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 07e8529..51120a0 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -13,7 +13,7 @@ SECTION = "base"
 DEPENDS = "util-linux attr"
 
 SRCREV = "194aa4a1bd6447bb545286d0bcb0b0be8204d79f"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 8112690..b12ab7d 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ SRCREV = "a47f842264fc19837f8a00eb1d2d254a4c527334"
 PV = "1.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.sv.gnu.org/config.git;protocol=git \
+SRC_URI = "git://git.sv.gnu.org/config.git \
 	   file://config-guess-uclibc.patch \
            file://gnu-configize.in"
 
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index 5797204..ea52784 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
 SRCREV = "ca39eb1d98e736109c64ff9c1aa2a6ecca222d8f"
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git \
+SRC_URI = "git://git.infradead.org/mtd-utils.git \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
         file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch "
 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index f3cbc53..279cb74 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -9,7 +9,7 @@ RDEPENDS_${PN}_class-native = ""
 SRCREV = "757a1664a440c60e8126443bf984e4bdf374c327"
 PV = "0.1.8+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
+SRC_URI = "git://git.yoctoproject.org/opkg-utils \
            "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index d5ec8fc..cc0814b 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -1,6 +1,6 @@
 require pkgconfig.inc
 
-SRC_URI = "git://anongit.freedesktop.org/pkg-config;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://autofoo.patch \
            file://glibconfig-sysdefs.h"
 
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 8c55b91..744a55f 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -26,7 +26,7 @@ FILES_${PN}-cron = "${sysconfdir}/cron.daily ${sysconfdir}/default"
 
 PACKAGES =+ "${PN}-cron"
 
-SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;protocol=git \
+SRC_URI = "git://git.yoctoproject.org/prelink-cross.git \
            file://prelink.conf \
            file://prelink.cron.daily \
            file://prelink.default \
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 87684ef..226ff96 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/pseudo"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index ed7ad32..5f5f0dd 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 PV = "1.3.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI_prepend = "git://git.qemu.org/qemu.git;protocol=git"
+SRC_URI_prepend = "git://git.qemu.org/qemu.git"
 S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-devtools/swabber/swabber-native_git.bb b/meta/recipes-devtools/swabber/swabber-native_git.bb
index 9faae5d..2648c61 100644
--- a/meta/recipes-devtools/swabber/swabber-native_git.bb
+++ b/meta/recipes-devtools/swabber/swabber-native_git.bb
@@ -8,7 +8,7 @@ PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.yoctoproject.org/swabber;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/swabber"
 
 inherit native
 
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 5df661c..09b153e 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -9,7 +9,7 @@ SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
 PV = "0.4.0+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git \
            file://fix_ranlib.patch \
            file://fix_tcf-agent.init.patch \
           "
diff --git a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
index da2eca6..0e2f428 100644
--- a/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
+++ b/meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
@@ -10,7 +10,7 @@ SRCREV = "3dfd0a09de696ec8c544762747f8a0f77153622e"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.gnome.org/${BPN};protocol=git"
+SRC_URI = "git://git.gnome.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
index f5a398a..3a10ea7 100644
--- a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://appwindow.c;endline=13;md5=8c09920de460c7ea1f64ee5698
 SRCREV = "99962ae39bb5aadb31929b25c58e1a053f9c9545"
 PV = "0.0.0+git${SRCPV}"
 
-SRC_URI = "git://dev.laptop.org/projects/soc-gtk/;protocol=git"
+SRC_URI = "git://dev.laptop.org/projects/soc-gtk/"
 S = "${WORKDIR}/git/gtk-theme-torturer"
 
 CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index e3051c7..d7245ee 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -1,6 +1,6 @@
 require libdrm.inc
 
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/drm;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/drm"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-graphics/fstests/fstests_git.bb
index e1623f4..4b31900 100644
--- a/meta/recipes-graphics/fstests/fstests_git.bb
+++ b/meta/recipes-graphics/fstests/fstests_git.bb
@@ -9,7 +9,7 @@ PV = "0.1+git${SRCPV}"
 PR = "r0"
 
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://dso_linking_change_build_fix.patch"
 
 S = "${WORKDIR}/git/tests"
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index b72f911..187e5e8 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 SRCREV = "e327ff049b8503af2dadffa84370a0860b9fb682"
 PV = "0.0+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index 015fbc0..55480d7 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -14,7 +14,7 @@ SRCREV = "29544f0e61cc281fc60061443a537271e1081b78"
 PV = "1.2+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;protocol=git \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index e3e5150..6397ece 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -8,7 +8,7 @@ PR = "${INC_PR}.0"
 SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
 PV = "9.1.3+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
            file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
diff --git a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
index 4c4c8eb..5657469 100644
--- a/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
+++ b/meta/recipes-graphics/mx/mx-1.0_1.4.7.bb
@@ -4,7 +4,7 @@ require mx.inc
 SRCREV = "9b1db6b8060bd00b121a692f942404a24ae2960f"
 PV = "1.4.7+git${SRCPV}"
 
-SRC_URI = "git://github.com/clutter-project/mx.git;protocol=git \
+SRC_URI = "git://github.com/clutter-project/mx.git \
 	   file://fix-build-dir.patch \
 	   file://fix-test-includes.patch \
 	  "
diff --git a/meta/recipes-graphics/xcb/libxcb_git.bb b/meta/recipes-graphics/xcb/libxcb_git.bb
index 66934b4..1482b7a 100644
--- a/meta/recipes-graphics/xcb/libxcb_git.bb
+++ b/meta/recipes-graphics/xcb/libxcb_git.bb
@@ -6,7 +6,7 @@ SRCREV = "625ed596cae6dd8175aeb6cb6f26784928042f22"
 PV = "1.1.90.1+gitr${SRCPV}"
 PR = "r1"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xcb/libxcb;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xcb/libxcb"
 S = "${WORKDIR}/git"
 
 PACKAGES =+ "libxcb-xinerama"
diff --git a/meta/recipes-graphics/xcb/xcb-proto_git.bb b/meta/recipes-graphics/xcb/xcb-proto_git.bb
index 1813d65..2ea4d04 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_git.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_git.bb
@@ -5,5 +5,5 @@ SRCREV = "d81ca233e98be8fa59e8c90d262c0516944c5a66"
 PV = "1.2+gitr${SRCPV}"
 PR = "r4"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xcb/proto;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xcb/proto"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index d0f07c9..d6b3021 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -10,7 +10,7 @@ PR = "r6"
 inherit autotools
 
 SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git \
+SRC_URI = "git://github.com/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
index 5bc0558..dfb08f7 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
@@ -11,6 +11,6 @@ SRCREV = "3e28d68b50d291938734e9684b8296ca864f3892"
 PV = "1.3.2+git${SRCPV}"
 PR = "${INC_PR}.0"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-keyboard;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-keyboard"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
index 392892e..d79a2e4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
@@ -12,7 +12,7 @@ SRCREV = "ea5cfe804e112f320f14ad896c7802d53551d3e6"
 PV = "1.3.0+git${SRCPV}"
 PR = "${INC_PR}.0"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-mouse;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-mouse \
            file://unbreak.patch"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
index 73b8089..6dc5f8a 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
@@ -12,7 +12,7 @@ SRCREV = "934bc0012f948c52aadc8eda912f7728fb7394a2"
 PV = "0.15.2+git${SRCPV}"
 PR = "${INC_PR}.1"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics"
 S = "${WORKDIR}/git"
 
 DEPENDS += "libxi mtdev"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index cb48fc2..d4c7654 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -16,7 +16,7 @@ PR = "${INC_PR}.1"
 
 EXTRA_OECONF += "--disable-xvmc --enable-dri --disable-static"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index f74419f..97941ec 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -28,7 +28,7 @@ SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
 PR = "${INC_PR}.3"
 PV = "0.4.2+gitr${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap \
            file://configure.patch \
 "
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
index dca4c8b..81f5709 100644
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
@@ -15,7 +15,7 @@ SRCREV = "209d83af61ed38a002c8096377deac292b3e396c"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate \
            file://fix-xcb.patch"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xorg-lib/libxext_git.bb b/meta/recipes-graphics/xorg-lib/libxext_git.bb
index 372f272..b799186 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_git.bb
@@ -18,7 +18,7 @@ PV = "1.0.99.1+gitr${SRCPV}"
 
 XORG_PN = "libXext"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/${XORG_PN};protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/${XORG_PN}"
 S = "${WORKDIR}/git/"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxi_git.bb b/meta/recipes-graphics/xorg-lib/libxi_git.bb
index d4e4705..c17c1f7 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_git.bb
@@ -14,5 +14,5 @@ PV = "1.2.99.5+gitr${SRCPV}"
 
 XORG_PN = "libXi"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/${XORG_PN};protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/${XORG_PN}"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
index 9511306..b88d157 100644
--- a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
@@ -14,6 +14,6 @@ SRCREV = "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
 PV = "0.0+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto;protocol=git \
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto \
            file://fix.patch;apply=yes"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_git.bb b/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
index 6e7105c..9074f48 100644
--- a/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
@@ -10,7 +10,7 @@ SRCREV = "66c56ab10d917e3f47f93178d7eac6430970d3c4"
 PV = "1.99.3+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/dri2proto;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/dri2proto"
 
 LIC_FILES_CHKSUM="file://COPYING;md5=2e396fa91834f8786032cad2da5638f3"
 
diff --git a/meta/recipes-graphics/xorg-proto/inputproto_git.bb b/meta/recipes-graphics/xorg-proto/inputproto_git.bb
index 08c72cd..6520f3b 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_git.bb
@@ -11,7 +11,7 @@ PE = "1"
 SRCREV = "7203036522ba9d4b224d282d6afc2d0b947711ee"
 PV = "1.9.99.12+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/inputproto;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/inputproto"
 S = "${WORKDIR}/git"
 
 inherit gettext
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index 166b50b..8c6d107 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -8,7 +8,7 @@ SRCREV = "f8f320d0254c09ce483fc1d8ee99ecf5bc940965"
 PV = "0.1+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/test-xvideo;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/test-xvideo"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index a318f0e..cdb2026 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -9,7 +9,7 @@ SRCREV = "d6918c8832793b4205ed3bfede78c2f915c23385"
 PR = "r6"
 PV = "1.0.5+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;protocol=git \
+SRC_URI = "git://git.kernel.dk/blktrace.git \
            file://ldflags.patch"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 6888c55..de375d7 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -6,7 +6,7 @@ DEPENDS = "flex-native bison-native"
 
 inherit autotools
 
-SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git \
+SRC_URI = "git://www.jdl.com/software/dtc.git \
            file://make_install.patch \
 	  "
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 4d891d7..2c82199 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -10,7 +10,7 @@ PV = "0.2+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
 S = "${WORKDIR}"
 
 do_compile() { 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ee33f50..3825889 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -28,7 +28,7 @@ PE = "1"
 PV = "0.0+git${SRCPV}"
 PR = "r1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index c2ce3f6..ccca2df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -15,7 +15,7 @@ KBRANCH = "standard/base"
 KBRANCH_DEFAULT = "${KBRANCH}"
 KMETA = "meta"
 
-SRC_URI = "git://git.pokylinux.org/linux-yocto-dev.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.pokylinux.org/linux-yocto-dev.git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
 # to the korg v3.7 tag, and hence prevent network access during parsing. If
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 0e137ff..cfcb711 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -7,7 +7,7 @@ SRCREV_machine ?= "8a9b4902683f586f7d656c2e6747e314a5e1ed0e"
 SRCREV_machine_qemuppc ?= "655d20d4f64dc053b40ac8d8fe44b82dec5e130a"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 LINUX_VERSION ?= "3.10.9"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 632d624..438b511 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -15,7 +15,7 @@ SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 # Omit broken machines from COMPATIBLE_MACHINE
 #   qemuppc hangs at boot
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 647ace6..f1327d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -15,7 +15,7 @@ SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 # Omit broken machines from COMPATIBLE_MACHINE
 #   qemuppc hangs at boot
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 82dea9c..5b84620 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -14,7 +14,7 @@ SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemux86)"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 7e01a96..d28da9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -18,7 +18,7 @@ SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemux86)"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 06d6b12..5c53207 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -18,7 +18,7 @@ SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemux86)"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index cacb873..7121881 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -12,7 +12,7 @@ SRCREV_machine_qemumips64 ?= "10a8db0603d7186633a6bf90e2308710763e718e"
 SRCREV_machine ?= "7144bcc4b8091675bfcf1941479067857b6242da"
 SRCREV_meta ?= "cd502a88148ab214b54860f97a96f41858fd6446"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
 LINUX_VERSION ?= "3.10.9"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 3aea1f9..f1bb343 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -11,7 +11,7 @@ SRCREV_machine_qemux86-64 ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
 SRCREV_machine ?= "ea977edd05ae2ebfa82731e0bee309bdfd08abee"
 SRCREV_meta ?= "f36797c2df3fbe9491c8ac5977fb691f4a75e9b7"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
 LINUX_VERSION ?= "3.4.59"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 790e3e3..4a2ddea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -12,7 +12,7 @@ SRCREV_machine_qemux86-64 ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_machine ?= "f20047520a57322f05d95a18a5fbd082fb15cb87"
 SRCREV_meta ?= "e7f42a416a60499db3771181357b29b3b3c424cc"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
 LINUX_VERSION ?= "3.8.13"
 
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb b/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
index 8aa3ae1..beb79be 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.1.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "glib-2.0 util-linux popt"
 SRCREV = "a386e24609752742b100120db6798d311fab512a"
 PV = "1.1+git${SRCPV}"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
+SRC_URI = "git://git.efficios.com/babeltrace.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 351b0c8..9959a74 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -13,7 +13,7 @@ inherit module
 SRCREV = "10fe4e3f10c9ce1f2963bd118b91895a67e955ee"
 PV = "2.2.1+git${SRCPV}"
 
-SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
+SRC_URI = "git://git.lttng.org/lttng-modules.git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
index e664d85..b8215e8 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb
@@ -14,7 +14,7 @@ DEPENDS = "liburcu popt lttng-ust"
 SRCREV = "eff0b2c38d24092c41bbb51926ac4e3b8c6acb83"
 PV = "v2.2.0"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
+SRC_URI = "git://git.lttng.org/lttng-tools.git"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
index d03f207..37b52c4 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb
@@ -21,7 +21,7 @@ SRCREV = "cfaee541fea7f5760b5501913c6902f5e4da9dba"
 PV = "2.2.0"
 PE = "2"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
+SRC_URI = "git://git.lttng.org/lttng-ust.git \
 	   file://depends-liblttng-ust-tracepoin.patch \
 	   file://build-Fix-out-of-tree-build.patch \
 	   "
diff --git a/meta/recipes-kernel/oprofile/oprofile_git.bb b/meta/recipes-kernel/oprofile/oprofile_git.bb
index c345548..ca562db 100644
--- a/meta/recipes-kernel/oprofile/oprofile_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_git.bb
@@ -4,7 +4,7 @@ SRCREV = "88f43190d412d28ebf5c75a76ba20343d0fe4c41"
 PV = "0.9.7+git${SRCPV}"
 PR = "${INC_PR}.0"
 
-SRC_URI += "git://oprofile.git.sourceforge.net/gitroot/${BPN}/${BPN};protocol=git"
+SRC_URI += "git://oprofile.git.sourceforge.net/gitroot/${BPN}/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index a872acc..200bab3 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -5,7 +5,7 @@ PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git \
+SRC_URI = "git://git.yoctoproject.org/oprofileui \
            file://init"
 
 EXTRA_OECONF += "--disable-client --enable-server"
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index 03a7932..316c61a 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -7,7 +7,7 @@ PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.yoctoproject.org/oprofileui;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/oprofileui"
 
 EXTRA_OECONF += "--enable-client --disable-server"
 
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index c7506fe..7ffab03 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+ libglade"
 SRCREV = "cd44ee6644c3641507fb53b8a2a69137f2971219"
 PV = "1.2.0+git${SRCPV}"
 
-SRC_URI = "git://git.gnome.org/sysprof;protocol=git \
+SRC_URI = "git://git.gnome.org/sysprof \
            file://define-NT_GNU_BUILD_ID.patch \
           "
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 0632746..d8c6408 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "e58138572ebddac9498b93c76770eeca7d45e3b1"
 PV = "2.3+git${SRCPV}"
 
-SRC_URI = "git://sourceware.org/git/systemtap.git;protocol=git \
+SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://docproc-build-fix.patch \
            file://obsolete_automake_macros.patch \
           "
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
index 70cfd96..00e3daa 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "trace-cmd"
 
 inherit pkgconfig pythonnative
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
            file://addldflags.patch \
            file://make-docs-optional.patch \
            file://blktrace-api-compatibility.patch"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index ff895f8..e9a41d4 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -11,7 +11,7 @@ PV = "1.2+git${SRCPV}"
 
 inherit pkgconfig pythonnative
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git \
            file://addldflags.patch \
            file://make-docs-optional.patch \
            file://blktrace-api-compatibility.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 69b771d..5ce28cc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
 S = "${WORKDIR}/git"
 
 SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
index 2282b72..11c77ae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master;protocol=git \
+    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master \
     file://0001-omx-fixed-type-error-in-printf-call.patch \    
     "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 9484b20..6f27957 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -43,7 +43,7 @@ python __anonymous () {
     branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
 
     if pv == "git":
-        d.setVar("SRC_URI", "git://anongit.freedesktop.org/gstreamer/%s;branch=%s;protocol=git" % (gstpkg_basename, branch))
+        d.setVar("SRC_URI", "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch))
     else:
         d.setVar("SRC_URI", "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv))
 }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index e343255..424c90a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -5,7 +5,7 @@ include gstreamer1.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master;protocol=git"
+SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
 S = "${WORKDIR}/git"
 
 SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
diff --git a/meta/recipes-sato/gaku/gaku_git.bb b/meta/recipes-sato/gaku/gaku_git.bb
index 9f1bad2..e17ebc7 100644
--- a/meta/recipes-sato/gaku/gaku_git.bb
+++ b/meta/recipes-sato/gaku/gaku_git.bb
@@ -19,7 +19,7 @@ SRCREV = "a0be2fe4b5f12b8b07f4e3bd624b3729657f0ac5"
 PV = "0.1+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
index c2e4854..5526a648 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
@@ -8,7 +8,7 @@ SRCREV = "4740ad8d53aba4368ce3e03b06cfdc69eb86dcdc"
 PV = "0.3.3+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/libowl/libowl_git.bb b/meta/recipes-sato/libowl/libowl_git.bb
index 20bc059..54ca62b 100644
--- a/meta/recipes-sato/libowl/libowl_git.bb
+++ b/meta/recipes-sato/libowl/libowl_git.bb
@@ -14,7 +14,7 @@ SRCREV = "6ebc8ac8f8575278dd40a535cadefa26374e44b1"
 PV = "0.1+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
index 1d93b73..fb35f98 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
@@ -15,7 +15,7 @@ PR = "r0"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
         file://no-handed.patch;striplevel=0"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
index e1a7e0e..148cc55 100644
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
+++ b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
@@ -13,7 +13,7 @@ SRCREV = "810b0b08eb79e4685202da2ec347b990bb467e07"
 PV = "0.1+git${SRCPV}"
 PR = "r1"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index e2e3047..b17a766 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -14,7 +14,7 @@ SRCREV = "71e3e6e04271e9d5a14f1c231ef100c7f320134d"
 PV = "2.0+git${SRCPV}"
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2"
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 6944a07..ffcabca 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -14,7 +14,7 @@ SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
 PR = "r4"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://configure_fix.patch;maxrev=1819 \
            file://single-instance.patch \
            file://80matchboxkeyboard.shbg \
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index ba2780b..1e2a7ae 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -19,7 +19,7 @@ RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
index 93d01f9..45549d9 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
@@ -11,7 +11,7 @@ SECTION = "x11/utils"
 SRCREV = "452bca253492a97a587f440289b9ab27d217353e"
 PV = "0.0+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
index bb41fdf..0cebd02 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
@@ -6,7 +6,7 @@ PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato"
 
 EXTRA_OECONF += "${@base_contains('MACHINE_FEATURES', 'qvga', '--with-mode=qvga', '',d)}"
 
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
index 62a4a7d..1b5d38c 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
@@ -17,7 +17,7 @@ PV = "0.1+git${SRCPV}"
 PR = "r3"
 
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/owl-video-widget/owl-video_git.bb b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
index ae08383..51c0149 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_git.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_git.bb
@@ -14,7 +14,7 @@ PR = "r2"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://owl-video-widget.png \
            file://stock_media-play.png \
            file://stock_volume-0.png \
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index 98b09f8..3ddb32f 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -15,7 +15,7 @@ SRCREV = "92f1a20e4b72eed7a35b00984d9793b51dc2fb3b"
 PV = "0.2+git${SRCPV}"
 PR = "r10"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;striplevel=0 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/puzzles/puzzles_r9765.bb b/meta/recipes-sato/puzzles/puzzles_r9765.bb
index 5ab3161..d13a87e 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9765.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9765.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=31790deb1e1aac4626e7d1bc04587eb0"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
-SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV};protocol=svn"
+SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
 S = "${WORKDIR}/${BPN}"
 
 #SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index 3bad853..5d23f41 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -12,7 +12,7 @@ SRCREV = "3a9688e8a01b63a78f402b4e7c0b8b005fcdfa29"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git"
+SRC_URI = "git://git.yoctoproject.org/screenshot"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
index 168d778..238348a 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
@@ -11,7 +11,7 @@ PV = "0.0+git${SRCPV}"
 
 PR = "r0"
 
-SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;protocol=git \
+SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
            file://addsoundkeys.patch;apply=yes \
            file://70settings-daemon.sh \
            file://dso_linking_change_build_fix.patch"
diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index b335800..f32304e 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -15,7 +15,7 @@ SRCREV = "b0676c190f876cbdb1df202fbcec42f212374503"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1


