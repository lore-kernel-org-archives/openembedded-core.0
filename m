Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QHcdW-0006Jz-8q
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 16:01:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2011 06:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,314,1301900400"; d="scan'208";a="688020275"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2011 06:58:20 -0700
Message-Id: <c75b49ff5cfd10f5187af2b66a0a8d5513460374.1304515719.git.ke.yu@intel.com>
In-Reply-To: <cover.1304515719.git.ke.yu@intel.com>
References: <cover.1304515719.git.ke.yu@intel.com>
Old-Date: Thu, 28 Apr 2011 15:15:58 +0800
Date: Wed, 04 May 2011 22:05:23 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 1/1] poky-default-revisions: move the SRCREV to recipe file
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
X-List-Received-Date: Wed, 04 May 2011 14:01:10 -0000

From: Yu Ke <ke.yu@intel.com>

in this case, those non poky distro can also use these recipe normally

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |    1 +
 .../recipes-graphics/clutter/table_git.bb          |    1 +
 meta-demoapps/recipes-graphics/clutter/tidy_git.bb |    1 +
 .../matchbox-themes-extra_git.bb                   |    1 +
 .../conf/distro/include/poky-default-revisions.inc |  203 --------------------
 meta/conf/layer.conf                               |    2 -
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    1 +
 meta/recipes-bsp/uboot/u-boot_git.bb               |    1 +
 meta/recipes-bsp/x-load/x-load_git.bb              |    1 +
 meta/recipes-bsp/zaurusd/zaurusd_svn.bb            |    1 +
 meta/recipes-connectivity/connman/connman_git.bb   |    1 +
 meta/recipes-connectivity/gsm/libgsmd_svn.bb       |    1 +
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |    1 +
 meta/recipes-connectivity/ofono/ofono_git.bb       |    1 +
 meta/recipes-core/dbus-wait/dbus-wait_svn.bb       |    2 +
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +
 meta/recipes-core/psplash/psplash_svn.bb           |    1 +
 .../installer/adt-installer_1.0.bb                 |    1 +
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    1 +
 meta/recipes-devtools/opkg/opkg-nogpg_svn.bb       |    2 +
 meta/recipes-devtools/opkg/opkg_svn.bb             |    1 +
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    1 +
 meta/recipes-devtools/prelink/prelink_git.bb       |    1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    1 +
 meta/recipes-devtools/qemu/qemu_git.bb             |    2 +
 .../recipes-devtools/swabber/swabber-native_git.bb |    1 +
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    1 +
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    1 +
 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb   |    1 +
 meta/recipes-extended/libzypp/libzypp_git.bb       |    1 +
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    1 +
 meta/recipes-extended/zypper/zypper_git.bb         |    1 +
 meta/recipes-gnome/gnome/gconf-dbus_svn.bb         |    1 +
 .../gnome/gobject-introspection_git.bb             |    2 +
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |    3 +-
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |    1 +
 .../clutter/clutter-gst-1.4_git.bb                 |    1 +
 .../clutter/clutter-gtk-1.4_git.bb                 |    1 +
 meta/recipes-graphics/clutter/clutter_git.bb       |    1 +
 meta/recipes-graphics/drm/libdrm_git.bb            |    1 +
 meta/recipes-graphics/fstests/fstests_svn.bb       |    2 +
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |    2 +
 .../libmatchbox/libmatchbox_git.bb                 |    1 +
 .../matchbox-wm-2/matchbox-wm-2_svn.bb             |    1 +
 .../matchbox-wm/matchbox-wm_git.bb                 |    1 +
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    1 +
 meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +
 meta/recipes-graphics/mutter/mutter_git.bb         |    1 +
 meta/recipes-graphics/xcb/libxcb_git.bb            |    2 +
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    1 +
 .../xorg-driver/xf86-input-keyboard_git.bb         |    1 +
 .../xorg-driver/xf86-input-mouse_git.bb            |    1 +
 .../xorg-driver/xf86-input-synaptics_git.bb        |    1 +
 .../xorg-driver/xf86-video-intel_git.bb            |    1 +
 .../xorg-driver/xf86-video-omapfb_git.bb           |    1 +
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |    2 +
 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb  |    1 +
 meta/recipes-graphics/xorg-lib/libx11_git.bb       |    1 +
 .../recipes-graphics/xorg-lib/libxcalibrate_git.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxext_git.bb      |    1 +
 meta/recipes-graphics/xorg-lib/libxi_git.bb        |    1 +
 .../xorg-proto/calibrateproto_git.bb               |    2 +
 meta/recipes-graphics/xorg-proto/dri2proto_git.bb  |    3 +
 meta/recipes-graphics/xorg-proto/inputproto_git.bb |    1 +
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |    1 +
 .../xvideo-tests/xvideo-tests_svn.bb               |    2 +
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    2 +
 meta/recipes-kernel/dtc/dtc_git.inc                |    2 +
 .../kern-tools/kern-tools-native_git.bb            |    1 +
 .../linux-firmware/linux-firmware_git.bb           |    1 +
 .../linux-libc-headers-yocto_git.bb                |    1 +
 .../recipes-kernel/linux/linux-yocto-stable_git.bb |   12 ++
 meta/recipes-kernel/linux/linux-yocto_git.bb       |   14 ++
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    1 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    1 +
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    1 +
 meta/recipes-kernel/trace-cmd/kernelshark_git.bb   |    1 +
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb     |    1 +
 meta/recipes-sato/eds/eds-dbus_git.bb              |    1 +
 meta/recipes-sato/eds/eds-tools_bzr.bb             |    1 +
 meta/recipes-sato/gaku/gaku_svn.bb                 |    1 +
 .../gtk-engines/gtk-sato-engine_svn.bb             |    1 +
 meta/recipes-sato/libowl/libowl_svn.bb             |    1 +
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    1 +
 .../matchbox-desktop-sato_svn.bb                   |    1 +
 .../matchbox-desktop/matchbox-desktop_git.bb       |    1 +
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    1 +
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    1 +
 .../matchbox-stroke/matchbox-stroke_git.bb         |    1 +
 .../matchbox-terminal/matchbox-terminal_git.bb     |    1 +
 .../matchbox-theme-sato-2_svn.bb                   |    1 +
 .../matchbox-theme-sato/matchbox-theme-sato_svn.bb |    1 +
 .../recipes-sato/owl-video-widget/libowl-av_svn.bb |    1 +
 .../recipes-sato/owl-video-widget/owl-video_svn.bb |    1 +
 meta/recipes-sato/pimlico/contacts_git.bb          |    1 +
 meta/recipes-sato/pimlico/dates_git.bb             |    1 +
 meta/recipes-sato/pimlico/tasks_git.bb             |    1 +
 meta/recipes-sato/puzzles/oh-puzzles_svn.bb        |    1 +
 meta/recipes-sato/screenshot/screenshot_svn.bb     |    1 +
 .../settings-daemon/settings-daemon_git.bb         |    1 +
 meta/recipes-sato/web/web-webkit_svn.bb            |    1 +
 meta/recipes-sato/web/web_svn.bb                   |    1 +
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    1 +
 meta/recipes-support/libgdbus/libgdbus_git.bb      |    2 +
 105 files changed, 146 insertions(+), 206 deletions(-)
 delete mode 100644 meta/conf/distro/include/poky-default-revisions.inc

diff --git a/meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb b/meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
index 4dffbd0..163029e 100644
--- a/meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
+++ b/meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
@@ -1,5 +1,6 @@
 require abiword.inc
 
+SRCDATE = "20070130"
 PV="2.5.0+cvs${SRCDATE}"
 PR = "r4"
 
diff --git a/meta-demoapps/recipes-graphics/clutter/table_git.bb b/meta-demoapps/recipes-graphics/clutter/table_git.bb
index 5a5091c..d0ae184 100644
--- a/meta-demoapps/recipes-graphics/clutter/table_git.bb
+++ b/meta-demoapps/recipes-graphics/clutter/table_git.bb
@@ -3,6 +3,7 @@ require table.inc
 LIC_FILES_CHKSUM = "file://fluttr/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://script-viewer/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
+SRCREV = "4b267533ce16656cba4104fc39dc12709c1bdddf"
 PV = "0.3.0+git${SRCPV}"
 PR = "r1"
 
diff --git a/meta-demoapps/recipes-graphics/clutter/tidy_git.bb b/meta-demoapps/recipes-graphics/clutter/tidy_git.bb
index 222ac6e..623de18 100644
--- a/meta-demoapps/recipes-graphics/clutter/tidy_git.bb
+++ b/meta-demoapps/recipes-graphics/clutter/tidy_git.bb
@@ -3,6 +3,7 @@ require tidy.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://tidy/tidy.h;endline=21;md5=ac342e7aac55849bf0755d79967fa3e8"
 
+SRCREV = "e25416e1293e1074bfa6727c80527dcff5b1f3cb"
 PV = "0.1.0+git${SRCPV}"
 PR = "r7"
 
diff --git a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
index 1eb5187..ad14043 100644
--- a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
+++ b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Matchbox window manager extra themes"
 LICENSE = "GPL"
 DEPENDS = "matchbox-wm"
 SECTION = "x11/wm"
+SRCREV = "f848f9e4e577d5b9719f05b5152df1ce59399f5c"
 PV = "0.3+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://configure.ac;endline=7;md5=3c4e087662e37f10e469425f3a0ad225"
diff --git a/meta/conf/distro/include/poky-default-revisions.inc b/meta/conf/distro/include/poky-default-revisions.inc
deleted file mode 100644
index 45aa63e..0000000
--- a/meta/conf/distro/include/poky-default-revisions.inc
+++ /dev/null
@@ -1,203 +0,0 @@
-SRCREV_pn-aaina ??= "4b267533ce16656cba4104fc39dc12709c1bdddf"
-SRCDATE_abiword ??= "20070130"
-SRCREV_pn-blktrace ??= "1e09f6e9012826fca69fa07222b7bc53c3e629ee"
-SRCREV_pn-calibrateproto ??= "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
-SRCREV_pn-clipboard-manager ??= "14994"
-SRCREV_pn-clutter ??= "e957e277b8a4893ce8c99e94402036d42a8b3748"
-SRCREV_pn-clutter-0.6 ??= "62e852a51e29dd42c84d6b34fe23b80b2542be59"
-SRCREV_pn-clutter-0.8 ??= "3ba37ff115ed3fbe6c94195775941091a3ac2b30"
-SRCREV_pn-clutter-1.0 ??= "ce5025d0a2b701541ca9343686f9dac858905da4"
-SRCREV_pn-clutter-box2d ??= "92b44f79a8667a31b46b861236392bdf32b7d6c2"
-SRCREV_pn-clutter-gst-0.10 ??= "8a087fabc888a6a4a939760c392109dbb610adbf"
-SRCREV_pn-clutter-gtk-0.10 ??= "b92329c4c1288019e2dea6567e2b5e98eb0a9992"
-SRCREV_pn-clutter-imcontext ??= "2cb6f0ff153db639a489e58e36802e0e928b1968"
-SRCREV_pn-clutter-mozembed ??= "738d017beb5579b2ff6e4d992d4889b61c974751"
-SRCREV_pn-clutter-cairo-0.6 ??= "4dc4ef712ddc890d828a1cb65a69a835285af548"
-SRCREV_pn-clutter-cairo-0.8 ??= "e27e507dedddec3f279a2902ecee0da1011c78eb"
-SRCREV_pn-clutter-cairo ??= "7b45e0de2d4b9f1cd47486e5de71a1a26e8fdf27"
-SRCREV_pn-clutter-gst-0.6 ??= "1c3dc539057dbcd6dd75f2cb5b4ba39b741892bd"
-SRCREV_pn-clutter-gst-0.8 ??= "7a60a435fb0930d911e26158928ab53bda090f3e"
-SRCREV_pn-clutter-gst-0.10 ??= "8a087fabc888a6a4a939760c392109dbb610adbf"
-SRCREV_pn-clutter-gst-1.0 ??= "d48c6fc67b48304f90e51b520631c1ecc10410af"
-SRCREV_pn-clutter-gst-1.4 ??= "855826ce1111d9a2439b14b61abdbfae72c47132"
-SRCREV_pn-clutter-helix ??= "b4514a7bae2a059f4e63de64245238a246ed10bd"
-SRCREV_pn-clutter-gtk-0.6 ??= "2ba362a1a223c2b28541030a80aa11191615340a"
-SRCREV_pn-clutter-gtk-0.8 ??= "7d3c3230376e731c06c21afa9d8c1d44dbea27cd"
-SRCREV_pn-clutter-gtk-0.10 ??= "b92329c4c1288019e2dea6567e2b5e98eb0a9992"
-SRCREV_pn-clutter-gtk-1.0 ??= "e8d828ba1d87937baa571e68fdff22f3e2d79ca8"
-SRCREV_pn-clutter-gtk-1.4 ??= "1d19fc17674175f4338c8e2526e911157801e754"
-SRCREV_pn-clutter-mozembed ??= "738d017beb5579b2ff6e4d992d4889b61c974751"
-SRCREV_pn-connman ??= "36e877dece72577a3ae6197eafd505d0e6e0c1d2"
-SRCREV_pn-connman-gnome ??= "b589f4f89bff20d54682cc6b49efa86feac8adb4"
-SRCREV_pn-contacts ??= "19853893fdb595de6aa59db0d9dc2f9451ed2933"
-SRCREV_pn-dates ??= "514185dc1f6588085fda41eb59898b93d0487dd4"
-SRCREV_pn-dbus-wait ??= "426"
-SRCREV_pn-devicekit ??= "014d168ba4bf40c9bae487bacff8bf2aa054b5f6"
-SRCREV_pn-dri2proto ??= "66c56ab10d917e3f47f93178d7eac6430970d3c4"
-SRCREV_pn-dtc ??= "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
-SRCREV_pn-dtc-native ??= "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
-SRCREV_pn-eds-dbus ??= "7337d11aed576e7caaa12b4e881ad8d33668799f"
-SRCREV_pn-eds-tools ??= "2008-02-04"
-SRCREV_pn-eee-acpi-scripts ??= "e224937ba51165e2a52252f9a113c8a82c01bb36"
-EGLIBCREV = "11982"
-SRCREV_pn-eglibc ??= "${EGLIBCREV}"
-SRCREV_pn-eglibc-initial ??= "${EGLIBCREV}"
-SRCREV_pn-eglibc-nativesdk ??= "${EGLIBCREV}"
-SRCREV_pn-eglibc-initial-nativesdk ??= "${EGLIBCREV}"
-SRCREV_pn-exmap-console ??= "405"
-SRCREV_pn-fstests ??= "426"
-SRCREV_pn-gaku ??= "399"
-SRCREV_pn-gconf-dbus ??= "705"
-SRCREV_pn-gconf-dbus-native ??= "705"
-SRCREV_pn-gtkhtml2 ??= "1144"
-SRCREV_pn-gtk-sato-engine ??= "163"
-SRCREV_pn-gtk-theme-torturer ??= "99962ae39bb5aadb31929b25c58e1a053f9c9545"
-SRCREV_pn-gtk-theme-darkilouche ??= "b4ce102a303d1176107a9d9d28c14f7da78feedd"
-SRCREV_pn-gobject-introspection ??= "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
-SRCREV_pn-gobject-introspection-native ??= "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
-SRCREV_pn-gypsy ??= "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
-SRCREV_pn-inputproto ??= "7203036522ba9d4b224d282d6afc2d0b947711ee"
-SRCREV_pn-inputproto-native ??= "7203036522ba9d4b224d282d6afc2d0b947711ee"
-SRCREV_pn-inputproto-nativesdk ??= "7203036522ba9d4b224d282d6afc2d0b947711ee"
-SRCREV_pn-kern-tools-native ??= "8f61abb6344e78677450994e8930cabc86102d78"
-SRCREV_pn-libdrm ??= "3f3c5be6f908272199ccf53f108b1124bfe0a00e"
-SRCREV_pn-libfakekey ??= "e8c2e412ea4a417afc1f30e32cb7bdc508b1dccc"
-SRCREV_pn-libgdbus ??= "aeab6e3c0185b271ca343b439470491b99cc587f"
-SRCREV_pn-libgsmd ??= "5394"
-SRCREV_pn-libmatchbox ??= "c81f8f444b83b187727f046432b186d67a42c732"
-SRCREV_pn-libowl ??= "408"
-SRCREV_pn-libowl-av ??= "416"
-SRCREV_pn-libx11 ??= "d23aad31338e7d869d878d5aa1b6b91d20287005"
-SRCREV_pn-libx11-diet ??= "d23aad31338e7d869d878d5aa1b6b91d20287005"
-SRCREV_pn-libx11-native ??= "d23aad31338e7d869d878d5aa1b6b91d20287005"
-SRCREV_pn-libx11-nativesdk ??= "d23aad31338e7d869d878d5aa1b6b91d20287005"
-SRCREV_pn-libx11-trim ??= "d23aad31338e7d869d878d5aa1b6b91d20287005"
-SRCREV_pn-libxcalibrate ??= "209d83af61ed38a002c8096377deac292b3e396c"
-SRCREV_pn-libxcb ??= "625ed596cae6dd8175aeb6cb6f26784928042f22"
-SRCREV_pn-libxcb-nativesdk ??= "625ed596cae6dd8175aeb6cb6f26784928042f22"
-SRCREV_pn-libxext ??= "d1f3bc77a48c8e42771579e3fdf3370b35d3209d"
-SRCREV_pn-libxext-nativesdk ??= "d1f3bc77a48c8e42771579e3fdf3370b35d3209d"
-SRCREV_pn-libxi ??= "d0326fe8cdbb08d4f52d79fd3fd4e1b2a0951d5e"
-SRCREV_pn-libzypp = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
-SRCREV_pn-linux-firmware ??= "40c0f950be7040614dc45df54e25e54d00e3b73b"
-SRCREV_pn-linux-openmoko ??= "5ccaca2adb1c37b5955a4733f68ae08a755e3d78"
-SRCREV_pn-linux-omap ??= "58cf2f1425abfd3a449f9fe985e48be2d2555022"
-SRCREV_pn-linux-omap-zoomsync ??= "015cbaf1035cd9a61d33a27de2a22902555db3c5"
-SRCREV_pn-linux-omap2 ??= "d3b3ae0fe6c71641da19c8de466ec366d39847e3"
-SRCREV_pn-linux-omap3 ??= "de1121fdb899f762b9e717f44eaf3fae7c00cd3e"
-SRCREV_pn-linux-omap3-pm ??= "totallybroken"
-SRCREV_machine_pn-linux-yocto-stable_qemuarm ?= "a2fb081b44d6368eff8d28e2fdb991c61b1f428e"
-SRCREV_machine_pn-linux-yocto-stable_qemumips ?= "c32d40f960e3c89d07f079bec4c96dcbfc749f0b"
-SRCREV_machine_pn-linux-yocto-stable_qemuppc ?= "96d6bc31d3caaf62a966255479cc5cee0e76b1e9"
-SRCREV_machine_pn-linux-yocto-stable_qemux86 ?= "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_machine_pn-linux-yocto-stable_qemux86-64 ?= "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_machine_pn-linux-yocto-stable_atom-pc ?= "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_machine_pn-linux-yocto-stable_routerstationpro ?= "49745cd45c92a89e70c6e2334caa80818c134562"
-SRCREV_machine_pn-linux-yocto-stable_mpc8315e-rdb ?= "a1c0ed6bf4060c10874b2a8547d81b3169dcf16a"
-SRCREV_machine_pn-linux-yocto-stable_beagleboard ?= "ef7f944e773950d4016b7643f9ecf052bbe250cd"
-SRCREV_machine_pn-linux-yocto-stable ?= "72ca49ab08b8eb475cec82a10049503602325791"
-SRCREV_meta_pn-linux-yocto-stable ?= "ec26387cb168e9e0976999b528b5a9dd62e3157a"
-# development SRCREVs
-SRCREV_machine_pn-linux-yocto_qemuarm ?= "e5ca41def834db9d18b28393a45d53a8d18f3d05"
-SRCREV_machine_pn-linux-yocto_qemumips ?= "9bbc8e3432406429923fab0de038af5d3e647901"
-SRCREV_machine_pn-linux-yocto_qemuppc ?= "f0ff494e62bfaa921e844c1ec7fe6cf4a977980a"
-SRCREV_machine_pn-linux-yocto_qemux86 ?= "cb0537a40dadea20f12bc10e0986fd2a70290b42"
-SRCREV_machine_pn-linux-yocto_qemux86-64 ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_machine_pn-linux-yocto_emenlow ?= "2215a346eb4f9e09053d00bdf61ed999ff80e029"
-SRCREV_machine_pn-linux-yocto_atom-pc ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_machine_pn-linux-yocto_routerstationpro ?= "8db69980d76e1f863af409e70175963f23de83ab"
-SRCREV_machine_pn-linux-yocto_mpc8315e-rdb ?= "6861d8a4d58f8aa75997f7678cc454791544507a"
-SRCREV_machine_pn-linux-yocto_beagleboard ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_machine_pn-linux-yocto ?= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_meta_pn-linux-yocto ?= "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
-SRCREV_pn-linux-libc-headers-yocto ??= "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
-SRCREV_pn-matchbox-config-gtk ??= "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
-SRCREV_pn-matchbox-desktop-sato ??= "76"
-SRCREV_pn-matchbox-desktop ??= "af7ed6775487380be73160aa0298bf6019765fad"
-SRCREV_pn-matchbox-keyboard ??= "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
-SRCREV_pn-matchbox-panel-2 ??= "982d9ea173dc87a84db2303d1a6a12607fc4d539"
-SRCREV_pn-matchbox-panel ??= "1364"
-SRCREV_pn-matchbox-stroke ??= "8edfd9a2bf1f0d6b28d4afee4bda9d3635f26a0b"
-SRCREV_pn-matchbox-terminal ??= "3fc25cb811a8ed306de897edf9b930f4402f3852"
-SRCREV_pn-matchbox-theme-sato-2 ??= "164"
-SRCREV_pn-matchbox-theme-sato ??= "90"
-SRCREV_pn-matchbox-themes-extra ??= "f848f9e4e577d5b9719f05b5152df1ce59399f5c"
-SRCREV_pn-matchbox-wm-2 ??= "2106"
-SRCREV_pn-matchbox-wm ??= "e8236c9ab44a8af8137cac2a35fb87f9146a9656"
-SRCREV_pn-mesa-dri ??= "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
-SRCREV_pn-mesa-xlib ??= "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
-SRCDATE_minimo ??= "20070510"
-SRCREV_pn-moblin-proto ??= "8f2cb524fe06555182c25b4ba3202d7b368ac0ce"
-SRCREV_pn-mozilla-headless ??= "177d8b8bda61"
-SRCREV_pn-mozilla-headless-services ??= "c679b95dd8c2807b70186d233b3833861a499315"
-SRCREV_pn-mutter ??= "01d3bebe24d2a56bdf2d82c4a71923e1573f7b7c"
-SRCREV_pn-networkmanager-applet ??= "263"
-SRCREV_pn-networkmanager ??= "2984"
-SRCREV_pn-ofono ??= "14544d5996836f628613c2ce544380ee6fc8f514"
-SRCREV_pn-oh-puzzles ??= "23"
-SRCREV_pn-ohm ??= "edfe25d49d67884bf004de7ae0724c162bb5e65e"
-OPKGSRCREV = "596"
-SRCREV_pn-opkg ??= "${OPKGSRCREV}"
-SRCREV_pn-opkg-native ??= "${OPKGSRCREV}"
-SRCREV_pn-opkg-nativesdk ??= "${OPKGSRCREV}"
-SRCREV_pn-adt-installer ??= "${OPKGSRCREV}"
-SRCREV_pn-opkg-nogpg ??= "${OPKGSRCREV}"
-SRCREV_pn-opkg-nogpg-native ??= "${OPKGSRCREV}"
-SRCREV_pn-opkg-nogpg-nativesdk ??= "${OPKGSRCREV}"
-SRCREV_pn-opkg-utils-native ??= "4747"
-SRCREV_pn-opkg-utils ??= "4747"
-SRCREV_pn-oprofileui ??= "0c3c32fa754c1d0b70e65767ea7048914f776396"
-SRCREV_pn-tcf-agent ??= "1078"
-SRCREV_pn-osc-native ??= "9096"
-SRCREV_pn-owl-video ??= "394"
-SRCREV_pn-pkgconfig ??= "66d49f1375fec838bcd301bb4ca2ef76cee0e47c"
-PRELINKSRCREV ??= "909470ee441237563d6236c505cb2d02ddc48704"
-SRCREV_pn-prelink ??= "${PRELINKSRCREV}"
-SRCREV_pn-prelink-native ??= "${PRELINKSRCREV}"
-SRCREV_pn-psplash ??= "424"
-PSEUDOSRCREV ??= "5434325fc887817ebb2bad36313d8277992cef1d"
-SRCREV_pn-pseudo ??= "${PSEUDOSRCREV}"
-SRCREV_pn-pseudo-native ??= "${PSEUDOSRCREV}"
-SRCREV_pn-pseudo-nativesdk ??= "${PSEUDOSRCREV}"
-QEMUSRCREV ??= "72bb3c7571226af13cfe9eec020a56add3d30a70"
-SRCREV_pn-qemu-native ??= "${QEMUSRCREV}"
-SRCREV_pn-qemu-nativesdk ??= "${QEMUSRCREV}"
-SRCREV_pn-qemu ??= "${QEMUSRCREV}"
-SRCREV_pn-qemugl ??= "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
-SRCREV_pn-qemugl-nativesdk ??= "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
-SRCREV_pn-sat-solver = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
-SRCREV_pn-screenshot ??= "292"
-SRCREV_pn-settings-daemon ??= "0f174f463dfed500b65533e249cd22942e439c77"
-SRCREV_pn-swabber-native ??= "a0792390c5d6d5a5bade7ab155c80eef3f30fa52"
-SRCREV_pn-sysprof ??= "38a6af1f0a45e528fd2842983da71e0f23c70d6a"
-SRCREV_pn-systemtap ??= "4ab3a1863bf4f472acae7a809bf2b38d91658aa8"
-SRCREV_pn-table ??= "4b267533ce16656cba4104fc39dc12709c1bdddf"
-SRCREV_pn-tasks ??= "ea52d46d691c5fce4473ea4e24a35411381f3a65"
-TRACECMDREV ?= "6c696cec3f264a9399241b6e648f58bc97117d49"
-SRCREV_pn-trace-cmd ??= ${TRACECMDREV}
-SRCREV_pn-kernelshark ??= ${TRACECMDREV}
-SRCREV_pn-tidy ??= "e25416e1293e1074bfa6727c80527dcff5b1f3cb"
-SRCREV_pn-u-boot-omap3 ??= "f40f6db278f602b55820693634a7256b0b4e4b80"
-SRCREV_pn-u-boot ??= "v2010.12"
-SRCREV_pn-ubootchart ??= "10"
-SRCREV_pn-webkit-gtk ??= "72836"
-SRCREV_pn-web-webkit ??= "130"
-SRCREV_pn-web ??= "131"
-SRCREV_pn-xcb-proto ??= "d81ca233e98be8fa59e8c90d262c0516944c5a66"
-SRCREV_pn-xcb-proto-native ??= "d81ca233e98be8fa59e8c90d262c0516944c5a66"
-SRCREV_pn-xf86-video-intel ??= "87ea531c5dc5b39809395b277c330854aaaaf019"
-SRCREV_pn-xf86-video-intel-dri2 ??= "3dd7f0f9423bb891bc99cd3b77dc3d57e057a7ef"
-SRCREV_pn-xf86-video-omapfb ??= "044617665d6737f4909aab96f91b06261dff05d2"
-SRCREV_pn-xf86-input-keyboard ??= "3e28d68b50d291938734e9684b8296ca864f3892"
-SRCREV_pn-xf86-input-mouse ??= "ea5cfe804e112f320f14ad896c7802d53551d3e6"
-SRCREV_pn-xf86-input-synaptics ??= "934bc0012f948c52aadc8eda912f7728fb7394a2"
-SRCREV_pn-xserver-kdrive-glamo ??= "a51364e2f23d4b6331c5ed613ce3f7e15f8e540f"
-SRCREV_pn-xserver-xf86-dri-lite ??= "251d0d8090322b2c9dc0c8b7bef001f338d19433"
-SRCREV_pn-xserver-xf86-dri2-lite ??= "251d0d8090322b2c9dc0c8b7bef001f338d19433"
-SRCREV_pn-xvideo-tests ??= "270"
-SRCREV_pn-x-load ??= "6f3a26101303051e0f91b6213735b68ce804e94e"
-SRCDATE_yaffs2-utils-native ??= "20071107"
-SRCDATE_yaffs2-utils ??= "20071107"
-SRCREV_pn-zaurusd ??= "426"
-SRCREV_pn-zypper ??= "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
-
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 37e5d99..5287417 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -19,5 +19,3 @@ PATH := "${PATH}:${COREBASE}/scripts"
 
 QEMUIMAGETESTS := "${COREBASE}/scripts/qemuimage-tests"
 
-require conf/distro/include/poky-default-revisions.inc
-
diff --git a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
index 855da11..9678814 100644
--- a/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
+++ b/meta/recipes-bsp/eee-acpi-scripts/eee-acpi-scripts_git.bb
@@ -5,6 +5,7 @@ SECTION = "base"
 LICENSE="GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=77ef83ab5f4af938a93edb61f7b74f2c"
 
+SRCREV = "e224937ba51165e2a52252f9a113c8a82c01bb36"
 PV = "1.1.11+git${SRCPV}"
 PR = "r4"
 
diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot/u-boot_git.bb
index 4686a58..66e7898 100644
--- a/meta/recipes-bsp/uboot/u-boot_git.bb
+++ b/meta/recipes-bsp/uboot/u-boot_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE}"
 
+SRCREV = "v2010.12"
 PV = "v2010.12+${PR}+git${SRCPV}"
 PR="r1"
 
diff --git a/meta/recipes-bsp/x-load/x-load_git.bb b/meta/recipes-bsp/x-load/x-load_git.bb
index fc2927e..600cd87 100644
--- a/meta/recipes-bsp/x-load/x-load_git.bb
+++ b/meta/recipes-bsp/x-load/x-load_git.bb
@@ -5,6 +5,7 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/x-load-git/${MACHINE
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=25;md5=ef08d08cb99057bbb5b9d6d0c5a4396f"
 
+SRCREV = "6f3a26101303051e0f91b6213735b68ce804e94e"
 PV = "1.42+${PR}+git${SRCPV}"
 PR="r13"
 
diff --git a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb b/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
index 455a29f..7313560 100644
--- a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
+++ b/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "tslib"
 RDEPENDS_${PN} = "xrandr"
+SRCREV = "426"
 PV = "0.0+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-connectivity/connman/connman_git.bb b/meta/recipes-connectivity/connman/connman_git.bb
index 82cd976..54ac4a5 100644
--- a/meta/recipes-connectivity/connman/connman_git.bb
+++ b/meta/recipes-connectivity/connman/connman_git.bb
@@ -1,5 +1,6 @@
 require connman.inc
 
+SRCREV = "36e877dece72577a3ae6197eafd505d0e6e0c1d2"
 PV       = "0.47+git${SRCPV}"
 PR       = "r17"
 S        = "${WORKDIR}/git"
diff --git a/meta/recipes-connectivity/gsm/libgsmd_svn.bb b/meta/recipes-connectivity/gsm/libgsmd_svn.bb
index 9d3ca19..ea8eaae 100644
--- a/meta/recipes-connectivity/gsm/libgsmd_svn.bb
+++ b/meta/recipes-connectivity/gsm/libgsmd_svn.bb
@@ -1,5 +1,6 @@
 BASEPN = "gsmd"
 CONFLICTNAME = "gsmd-devel"
 
+SRCREV = "5394"
 require gsmd.inc
 
diff --git a/meta/recipes-connectivity/gypsy/gypsy_git.bb b/meta/recipes-connectivity/gypsy/gypsy_git.bb
index 1357240..6abe96e 100644
--- a/meta/recipes-connectivity/gypsy/gypsy_git.bb
+++ b/meta/recipes-connectivity/gypsy/gypsy_git.bb
@@ -2,6 +2,7 @@ require gypsy.inc
 
 DEFAULT_PREFERENCE = "-1"
 
+SRCREV = "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
 PV = "0.8+git${SRCPV}"
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index 3e2c410..4e55745 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -1,6 +1,7 @@
 require ofono.inc
 
 S	 = "${WORKDIR}/git"
+SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
 PV	 = "0.12-git${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_svn.bb b/meta/recipes-core/dbus-wait/dbus-wait_svn.bb
index 9fa4c55..9a6130f 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_svn.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_svn.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://svn.o-hand.com/repos/misc/trunk"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "426"
 DEPENDS = "dbus"
 PV = "0.0+svnr${SRCPV}"
 PR = "r2"
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 7598c61..715b873 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -4,6 +4,8 @@ DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PR = "r13"
 
+SRCREV = "11982"
+
 EGLIBC_BRANCH="eglibc-2_12"
 SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
diff --git a/meta/recipes-core/psplash/psplash_svn.bb b/meta/recipes-core/psplash/psplash_svn.bb
index 0443fbb..477894a 100644
--- a/meta/recipes-core/psplash/psplash_svn.bb
+++ b/meta/recipes-core/psplash/psplash_svn.bb
@@ -5,6 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;md5=a87c39812c1e37f3451567cc29a29c8f"
 
+SRCREV = "424"
 PV = "0.0+svnr${SRCPV}"
 PR = "r6"
 
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index b70fb9e..4a3e4de 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -40,6 +40,7 @@ S = "${WORKDIR}/trunk"
 
 inherit deploy
 
+SRCREV = "596"
 PV = "0.1.8+svnr${SRCPV}"
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://wget_cache.patch \
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index 8560f36..0db6f80 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
+SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb b/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb
index e1b9f24..35f0581 100644
--- a/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg-nogpg_svn.bb
@@ -3,6 +3,8 @@ require opkg_svn.bb
 DEPENDS = "curl"
 PROVIDES += "opkg"
 
+SRCREV = "596"
+
 EXTRA_OECONF += "--disable-gpg"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index d8af823..5664a09 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -15,6 +15,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 
 S = "${WORKDIR}/trunk"
 
+SRCREV = "596"
 PV = "0.1.8+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index 73acb9e..6aa7f6d 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://anongit.freedesktop.org/pkg-config;protocol=git \
 
 S = "${WORKDIR}/git/"
 
+SRCREV = "66d49f1375fec838bcd301bb4ca2ef76cee0e47c"
 PV = "0.23+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 55dab8a..44aac2d 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -7,6 +7,7 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+SRCREV = "909470ee441237563d6236c505cb2d02ddc48704"
 PV = "1.0+git${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8fe3110..d15eb15 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,5 +1,6 @@
 require pseudo.inc
 
+SRCREV = "5434325fc887817ebb2bad36313d8277992cef1d"
 PV = "1.0+git${SRCPV}"
 PR = "r18"
 
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index c0d43c0..47d5f88 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -1,5 +1,7 @@
 require qemu.inc
 
+SRCREV = "72bb3c7571226af13cfe9eec020a56add3d30a70"
+
 PV = "0.12.4"
 PR = "r12"
 
diff --git a/meta/recipes-devtools/swabber/swabber-native_git.bb b/meta/recipes-devtools/swabber/swabber-native_git.bb
index 28d6b6d..5bfe87f 100644
--- a/meta/recipes-devtools/swabber/swabber-native_git.bb
+++ b/meta/recipes-devtools/swabber/swabber-native_git.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/swabber"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
+SRCREV = "a0792390c5d6d5a5bade7ab155c80eef3f30fa52"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
index 6f06a9c..f18dbe2 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
@@ -6,6 +6,7 @@ LICENSE = "EPLv1.0 | EDLv1.0"
 LIC_FILES_CHKSUM = "file://../epl-v10.html;md5=7aa4215a330a0a4f6a1cbf8da1a0879f \
                     file://../agent/edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
+SRCREV = "1078"
 PV = "0.3.0+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
index c16be82..7343e90 100644
--- a/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
+++ b/meta/recipes-devtools/ubootchart/ubootchart_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "A boot profiling tool"
 HOMEPAGE = "http://code.google.com/p/ubootchart/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
+SRCREV = "10"
 PV = "0.0+r${SRCPV}"
 PR = "r5"
 
diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
index 6171fe5..c729c7c 100644
--- a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
+++ b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
@@ -1,3 +1,4 @@
 require yaffs2-utils.inc
 PR = "r1"
 
+SRCDAT = "20071107"
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 2e4ef7e..f8535af 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -12,6 +12,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
 RDEPENDS_${PN} = "sat-solver"
 
 S = "${WORKDIR}/git"
+SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
 PR = "r9"
 
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index 2d4d299..a174e76 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "libcheck rpm zlib expat db"
 
+SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 PV = "0.0-git${SRCPV}"
 PR = "r9"
 
diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index 9258477..299fcb5 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 DEPENDS  = "libzypp augeas"
 RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
 PR = "r5"
+SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
 
diff --git a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb b/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
index 9fdd82c..16a2ddb 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
@@ -8,6 +8,7 @@ PROVIDES = "gconf"
 RPROVIDES_${PN} = "gconf"
 RPROVIDES_${PN}-dev = "gconf-dev"
 
+SRCREV = "705"
 PV = "2.16.0+svnr${SRCPV}"
 
 SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
diff --git a/meta/recipes-gnome/gnome/gobject-introspection_git.bb b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
index 17a42a9..a47e808 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_git.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
@@ -8,6 +8,8 @@ SRC_URI_virtclass-native = "git://git.gnome.org/gobject-introspection;protocol=g
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.lib;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+SRCREV = "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
 PV = "0.0+git${SRCPV}"
 PR = "r3"
 
diff --git a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
index a84ab04..0643cb6 100644
--- a/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -5,7 +5,8 @@ SECTION = "devel"
 LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://appwindow.c;endline=13;md5=8c09920de460c7ea1f64ee56986aabd9"
 
-PV = "0.0.0+git${SRCDATE}"
+SRCREV = "99962ae39bb5aadb31929b25c58e1a053f9c9545"
+PV = "0.0.0+git${SRCPV}"
 
 SRC_URI = "git://dev.laptop.org/projects/soc-gtk/;protocol=git"
 S = "${WORKDIR}/git/gtk-theme-torturer"
diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index ac921bf..33b6fea 100644
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -3,6 +3,8 @@ DEPENDS = "gtk+ glib-2.0 libxml2"
 DESCRIPTION = "A GTK+ HTML rendering library."
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+SRCREV = "1144"
 PV = "2.11.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-graphics/clutter/clutter-box2d_git.bb b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
index 62b5c80..7671530 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -2,6 +2,7 @@ require clutter-box2d.inc
 
 LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6b"
 
+SRCREV = "92b44f79a8667a31b46b861236392bdf32b7d6c2"
 PV = "0.10.1+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb b/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
index f8ba3e7..94d6885 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
@@ -1,5 +1,6 @@
 require clutter-gst.inc
 
+SRCREV = "8a087fabc888a6a4a939760c392109dbb610adbf"
 PV = "1.3.4+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
index 42a1ef2..12822c0 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
@@ -1,5 +1,6 @@
 require clutter-gtk.inc
 
+SRCREV = "b92329c4c1288019e2dea6567e2b5e98eb0a9992"
 PV = "0.90.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/clutter/clutter_git.bb b/meta/recipes-graphics/clutter/clutter_git.bb
index dd5f980..6df48e2 100644
--- a/meta/recipes-graphics/clutter/clutter_git.bb
+++ b/meta/recipes-graphics/clutter/clutter_git.bb
@@ -3,6 +3,7 @@ require clutter-package.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
+SRCREV = "e957e277b8a4893ce8c99e94402036d42a8b3748"
 PV = "1.0.0+git${SRCPV}"
 PR = "r8"
 
diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index 866da5d..7d4e1b3 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -4,5 +4,6 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/drm;protocol=git"
 
 S = ${WORKDIR}/git
 
+SRCREV = "3f3c5be6f908272199ccf53f108b1124bfe0a00e"
 PV = "2.4.15+git${SRCPV}"
 PR = "r0"
diff --git a/meta/recipes-graphics/fstests/fstests_svn.bb b/meta/recipes-graphics/fstests/fstests_svn.bb
index 3c0d7b0..ef70eb3 100644
--- a/meta/recipes-graphics/fstests/fstests_svn.bb
+++ b/meta/recipes-graphics/fstests/fstests_svn.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://www.o-hand.com"
 SECTION = "devel"
 LICENSE = "ZLIB"
 DEPENDS = "pango libxext libxft virtual/libx11 gtk+"
+
+SRCREV = "426"
 PV = "0.0+svnr${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index a7f64ff..6109ea0 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://src/libfakekey.c;endline=30;md5=602b5ccd48f6440751086
 
 DEPENDS = "libxtst"
 SECTION = "x11/wm"
+
+SRCREV = "e8c2e412ea4a417afc1f30e32cb7bdc508b1dccc"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
index 3d2fe9c..2984177 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_git.bb
@@ -1,5 +1,6 @@
 require libmatchbox.inc
 
+SRCREV = "c81f8f444b83b187727f046432b186d67a42c732"
 PV = "1.9+git${SRCPV}"
 PR = "r0"
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
index 2eb12e1..3332891 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://matchbox/core/mb-wm.h;endline=21;md5=1b1d328a52790635
 
 DEPENDS = "virtual/libx11 libxext libxrender startup-notification expat gconf pango libxdamage libxcomposite gtk+"
 
+SRCREV = "2106"
 PV = "0.0+svnr${SRCPV}"
 PR = "r4"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
index a9dfaf7..9814d67 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf"
 
+SRCREV = "e8236c9ab44a8af8137cac2a35fb87f9146a9656"
 PV = "1.2+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 20bb912..f61d23c 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -11,6 +11,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat"
 
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
 
+SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
 PV = "7.7+git${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
index 19d6557..9d5115f 100644
--- a/meta/recipes-graphics/mesa/qemugl_git.bb
+++ b/meta/recipes-graphics/mesa/qemugl_git.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://git.o-hand.com/qemugl.git;protocol=git \
            file://remove-x11r6-lib-dir.patch"
 S = "${WORKDIR}/git"
 
+SRCREV = "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
+
 PV = "0.0+git${SRCPV}"
 PR = "r7"
 
diff --git a/meta/recipes-graphics/mutter/mutter_git.bb b/meta/recipes-graphics/mutter/mutter_git.bb
index 37e2361..8d308f1 100644
--- a/meta/recipes-graphics/mutter/mutter_git.bb
+++ b/meta/recipes-graphics/mutter/mutter_git.bb
@@ -1,5 +1,6 @@
 require mutter.inc
 
+SRCREV = "01d3bebe24d2a56bdf2d82c4a71923e1573f7b7c"
 PV = "2.29.1+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/xcb/libxcb_git.bb b/meta/recipes-graphics/xcb/libxcb_git.bb
index 86ba036..f8cf2a5 100644
--- a/meta/recipes-graphics/xcb/libxcb_git.bb
+++ b/meta/recipes-graphics/xcb/libxcb_git.bb
@@ -1,6 +1,8 @@
 DEFAULT_PREFERENCE = "-1"
 
 include libxcb.inc
+
+SRCREV = "625ed596cae6dd8175aeb6cb6f26784928042f22"
 PV = "1.1.90.1+gitr${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-graphics/xcb/xcb-proto_git.bb b/meta/recipes-graphics/xcb/xcb-proto_git.bb
index e4c238c..01a7d91 100644
--- a/meta/recipes-graphics/xcb/xcb-proto_git.bb
+++ b/meta/recipes-graphics/xcb/xcb-proto_git.bb
@@ -1,6 +1,7 @@
 DEFAULT_PREFERENCE = "-1"
 
 include xcb-proto.inc
+SRCREV = "d81ca233e98be8fa59e8c90d262c0516944c5a66"
 PV = "1.2+gitr${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
index 57c601c..fe8cee9 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
@@ -7,6 +7,7 @@ driver supports the standard OS-provided keyboard interface.  The driver \
 functions as a keyboard input device, and may be used as the X server's \
 core keyboard."
 
+SRCREV = "3e28d68b50d291938734e9684b8296ca864f3892"
 PV = "1.3.2+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-keyboard;protocol=git"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
index bdf61c1..a56ef11 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
@@ -8,6 +8,7 @@ functions as a pointer input device, and may be used as the X server's \
 core pointer. Multiple mice are supported by multiple instances of this \
 driver."
 
+SRCREV = "ea5cfe804e112f320f14ad896c7802d53551d3e6"
 PV = "1.3.0+git${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
index 70478d5..dbfcef5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
@@ -8,6 +8,7 @@ operating in a compatibility mode emulating a standard mouse) can be \
 handled by the normal evdev or mouse drivers, this driver allows more \
 advanced features of the touchpad to become available."
 
+SRCREV = "934bc0012f948c52aadc8eda912f7728fb7394a2"
 PV = "0.15.2+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics;protocol=git"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 4aac803..34fe533 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -10,6 +10,7 @@ Infrastructure (DRI)."
 DEPENDS += "virtual/libx11 libxvmc drm dri2proto glproto \
 	    virtual/libgl xineramaproto libpciaccess"
 
+SRCREV = "87ea531c5dc5b39809395b277c330854aaaaf019"
 PV = "2.10.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 2714786..66aa5c4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -9,6 +9,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/omapfb-driver.c;beginline=1;endline=30;md5=a44c2a37e04d1c2c5f0313afb493f833"
 DEPENDS += "virtual/libx11"
 
+SRCREV = "044617665d6737f4909aab96f91b06261dff05d2"
 PE = "1"
 PR = "r1"
 PV = "0.1.1+git${SRCPV}"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
index 458ba41..bd82b35 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
@@ -11,5 +11,7 @@ SRC_URI += "file://X18NCMSstubs.diff;patch=1 \
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
+SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
+
 EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale"
 CFLAGS += "-D_GNU_SOURCE"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
index 7044a0e..730efe1 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
@@ -4,6 +4,7 @@ require libx11_git.inc
 DESCRIPTION += " Support for XCB, and XCMS is disabled in this version."
 
 PR = "r2"
+SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_git.bb b/meta/recipes-graphics/xorg-lib/libx11_git.bb
index aa69f4a..4da80bd 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_git.bb
@@ -3,6 +3,7 @@ require libx11_git.inc
 
 inherit gettext
 
+SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
 PR = "r2"
 
 DEPENDS = "xproto xextproto xcmiscproto xf86bigfontproto kbproto inputproto \
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
index f27c595..dca4c8b 100644
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://xcalibrate.h;endline=21;md5=fa572df6439f0f235f2612f37
 
 DEPENDS = "virtual/libx11 calibrateproto libxext"
 
+SRCREV = "209d83af61ed38a002c8096377deac292b3e396c"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxext_git.bb b/meta/recipes-graphics/xorg-lib/libxext_git.bb
index 66bbbcb..372f272 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_git.bb
@@ -12,6 +12,7 @@ extensions."
 
 DEPENDS += "xproto virtual/libx11 xextproto libxau libxdmcp"
 PROVIDES = "xext"
+SRCREV = "d1f3bc77a48c8e42771579e3fdf3370b35d3209d"
 PE = "1"
 PV = "1.0.99.1+gitr${SRCPV}"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxi_git.bb b/meta/recipes-graphics/xorg-lib/libxi_git.bb
index fac3236..d4e4705 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_git.bb
@@ -8,6 +8,7 @@ client programs to select input from these devices independently from \
 each other and independently from the core devices."
 
 DEPENDS += "libxext inputproto"
+SRCREV = "d0326fe8cdbb08d4f52d79fd3fd4e1b2a0951d5e"
 PE = "1"
 PV = "1.2.99.5+gitr${SRCPV}"
 
diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
index f86ea4a..9511306 100644
--- a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
@@ -9,6 +9,8 @@ LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://xcalibratewire.h;endline=23;md5=7f86ef7b03cce6c4c9ebd59d20ca485f \
                     file://xcalibrateproto.h;endline=23;md5=e4490491edcc171ca24f98569ee580db"
 
+SRCREV = "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
+
 PV = "0.0+git${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_git.bb b/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
index c1aa35f..6e7105c 100644
--- a/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/dri2proto_git.bb
@@ -6,10 +6,13 @@ DESCRIPTION = "This package provides the wire protocol for the Direct \
 Rendering Ifnrastructure 2.  DIR is required for may hardware \
 accelerated OpenGL drivers."
 
+SRCREV = "66c56ab10d917e3f47f93178d7eac6430970d3c4"
 PV = "1.99.3+git${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/dri2proto;protocol=git"
 
+LIC_FILES_CHKSUM="file://COPYING;md5=2e396fa91834f8786032cad2da5638f3"
+
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/xorg-proto/inputproto_git.bb b/meta/recipes-graphics/xorg-proto/inputproto_git.bb
index f1cbbb8..08c72cd 100644
--- a/meta/recipes-graphics/xorg-proto/inputproto_git.bb
+++ b/meta/recipes-graphics/xorg-proto/inputproto_git.bb
@@ -8,6 +8,7 @@ keyboard and pointer."
 
 PR = "r1"
 PE = "1"
+SRCREV = "7203036522ba9d4b224d282d6afc2d0b947711ee"
 PV = "1.9.99.12+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/inputproto;protocol=git"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
index 99804a2..850db49 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
@@ -1,5 +1,6 @@
 require xserver-xf86-dri-lite.inc
 
+SRCREV = "251d0d8090322b2c9dc0c8b7bef001f338d19433"
 PE = "1"
 PR = "r0"
 PV = "1.7.99+git${SRCPV}"
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_svn.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_svn.bb
index a5ac251..0c6ca3f 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_svn.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_svn.bb
@@ -3,6 +3,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/test-xvideo.c;beginline=1;endline=20;md5=6ae3b4c3c2ff9e51dbbc35bb237afa00"
 DEPENDS = "libxv"
+
+SRCREV = "270"
 PV = "0.0+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index 7cd8127..37b7f51 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
+SRCREV = "1e09f6e9012826fca69fa07222b7bc53c3e629ee"
+
 PR = r2
 PV = "1.0.1+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/dtc/dtc_git.inc b/meta/recipes-kernel/dtc/dtc_git.inc
index 96542f9..6b7acd5 100644
--- a/meta/recipes-kernel/dtc/dtc_git.inc
+++ b/meta/recipes-kernel/dtc/dtc_git.inc
@@ -1,4 +1,6 @@
 SRC_URI = "git://www.jdl.com/software/dtc.git;protocol=git"
+
+SRCREV = "73dca9ae0b9abe6924ba640164ecce9f8df69c5a"
 PV = "1.2.0+git${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 10dd921..00cc666 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
+SRCREV = "8f61abb6344e78677450994e8930cabc86102d78"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 3d3c579..3d822c5 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef
 
 PROVIDES += "linux-firmware-sd8686"
 
+SRCREV = "40c0f950be7040614dc45df54e25e54d00e3b73b"
 PV = "0.0+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git;protocol=git"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
index 8e6239c..a9b041f 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
@@ -8,6 +8,7 @@ DEPENDS += "unifdef-native"
 PROVIDES = "linux-libc-headers"
 RPROVIDES_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dbg = "linux-libc-headers-dbg"
+SRCREV = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
 PV = "2.6.37+git-${SRCPV}"
 PR = "r3"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
index ce9d6d7..93b06fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-stable_git.bb
@@ -18,6 +18,18 @@ LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE_EXTENSION}"
 KMETA = wrs_meta
 KBRANCH = ${KMACHINE}-${LINUX_KERNEL_TYPE_EXTENSION}
 
+SRCREV_machine_qemuarm = "a2fb081b44d6368eff8d28e2fdb991c61b1f428e"
+SRCREV_machine_qemumips = "c32d40f960e3c89d07f079bec4c96dcbfc749f0b"
+SRCREV_machine_qemuppc = "96d6bc31d3caaf62a966255479cc5cee0e76b1e9"
+SRCREV_machine_qemux86 = "72ca49ab08b8eb475cec82a10049503602325791"
+SRCREV_machine_qemux86-64 = "72ca49ab08b8eb475cec82a10049503602325791"
+SRCREV_machine_atom-pc = "72ca49ab08b8eb475cec82a10049503602325791"
+SRCREV_machine_routerstationpro = "49745cd45c92a89e70c6e2334caa80818c134562"
+SRCREV_machine_mpc8315e-rdb = "a1c0ed6bf4060c10874b2a8547d81b3169dcf16a"
+SRCREV_machine_beagleboard = "ef7f944e773950d4016b7643f9ecf052bbe250cd"
+SRCREV_machine = "72ca49ab08b8eb475cec82a10049503602325791"
+SRCREV_meta = "ec26387cb168e9e0976999b528b5a9dd62e3157a"
+
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 7279793..8a46e02 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -17,6 +17,20 @@ KMETA = meta
 
 LINUX_VERSION ?= "2.6.37"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
+
+SRCREV_machine_qemuarm = "e5ca41def834db9d18b28393a45d53a8d18f3d05"
+SRCREV_machine_qemumips = "9bbc8e3432406429923fab0de038af5d3e647901"
+SRCREV_machine_qemuppc = "f0ff494e62bfaa921e844c1ec7fe6cf4a977980a"
+SRCREV_machine_qemux86 = "cb0537a40dadea20f12bc10e0986fd2a70290b42"
+SRCREV_machine_qemux86-64 = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_machine_emenlow = "2215a346eb4f9e09053d00bdf61ed999ff80e029"
+SRCREV_machine_atom-pc = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_machine_routerstationpro = "8db69980d76e1f863af409e70175963f23de83ab"
+SRCREV_machine_mpc8315e-rdb = "6861d8a4d58f8aa75997f7678cc454791544507a"
+SRCREV_machine_beagleboard = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_machine = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
+SRCREV_meta = "ecab1e2bc12a8b0c4d064a00acc3260f6e8528c5"
+
 PR = "r16"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index b5e86dd..aac33ea 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -1,5 +1,6 @@
 require oprofileui.inc
 
+SRCREV = "0c3c32fa754c1d0b70e65767ea7048914f776396"
 PV = "0.0+git${SRCPV}"
 PR = "r4"
 
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index d649c16..2246803 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ libglade"
 
+SRCREV = "38a6af1f0a45e528fd2842983da71e0f23c70d6a"
 PR = r0
 PV = "1.1.6+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index f28c946..4df0947 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "elfutils"
 
+SRCREV = "4ab3a1863bf4f472acae7a809bf2b38d91658aa8"
 PR = r0
 PV = "1.4+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
index bfe7d99..6b4692e 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_git.bb
@@ -3,6 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
+SRCREV = "6c696cec3f264a9399241b6e648f58bc97117d49"
 PR = r0
 PV = "1.0.5+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
index 8fe62d4..ba7413d 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
@@ -3,6 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
 
+SRCREV = "6c696cec3f264a9399241b6e648f58bc97117d49"
 PR = r0
 PV = "1.0.5+git${SRCPV}"
 
diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
index 51657a4..a8100ad 100644
--- a/meta/recipes-sato/eds/eds-dbus_git.bb
+++ b/meta/recipes-sato/eds/eds-dbus_git.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical gnome-keyring gperf-native"
 
+SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-sato/eds/eds-tools_bzr.bb b/meta/recipes-sato/eds/eds-tools_bzr.bb
index 9cead16..bd693db 100644
--- a/meta/recipes-sato/eds/eds-tools_bzr.bb
+++ b/meta/recipes-sato/eds/eds-tools_bzr.bb
@@ -4,6 +4,7 @@ DEPENDS = "dbus-glib eds-dbus"
 RDEPENDS_${PN} = "libedata-book"
 DESCRIPTION = "Test applications for EDS"
 
+SRCREV = "2008-02-04"
 PR = "r1"
 
 SRC_URI = "bzr://burtonini.com/bzr/eds-tools;proto=http"
diff --git a/meta/recipes-sato/gaku/gaku_svn.bb b/meta/recipes-sato/gaku/gaku_svn.bb
index 037da2e..4a2e907 100644
--- a/meta/recipes-sato/gaku/gaku_svn.bb
+++ b/meta/recipes-sato/gaku/gaku_svn.bb
@@ -15,6 +15,7 @@ RRECOMMENDS_${PN} = "gst-plugins-good-id3demux \
                gst-plugins-base-ogg \
                ${COMMERCIAL_AUDIO_PLUGINS}"
 
+SRCREV = "399"
 PV = "0.0+svnr${SRCPV}"
 
 PR = "r4"
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb b/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
index 3c7f1b5..230ccbc 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine_svn.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/sato-utils.h;endline=24;md5=708f28cfe7fe028d497aaf4389b80b62 \
                     file://src/sato-main.c;endline=24;md5=b5e5dddebca570275becb51b526e4c5a"
 
+SRCREV = "163"
 PV = "0.3.2+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-sato/libowl/libowl_svn.bb b/meta/recipes-sato/libowl/libowl_svn.bb
index 81ebf8e..147a332 100644
--- a/meta/recipes-sato/libowl/libowl_svn.bb
+++ b/meta/recipes-sato/libowl/libowl_svn.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "libs"
 DEPENDS = "gtk+"
+SRCREV = "408"
 PV = "0.0+svnr${SRCPV}"
 PR = "r6"
 
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
index 73c8934..d3873ad 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "gconf gtk+"
 RDEPENDS_${PN} = "settings-daemon"
 
+SRCREV = "3ed74dfb7c57be088a5ab36e446c0ccde9fa1028"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_svn.bb b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_svn.bb
index 617fb6d..7a68138 100644
--- a/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_svn.bb
+++ b/meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_svn.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "x11"
 DEPENDS = ""
 CONFLICTS = "matchbox-common"
+SRCREV = "76"
 PV = "0.0+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index 019fb76..a3dcec3 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "gtk+ startup-notification dbus"
 SECTION = "x11/wm"
+SRCREV = "af7ed6775487380be73160aa0298bf6019765fad"
 PV = "2.0+git${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 84c71d0..7d7a1b9 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
 RDEPENDS_${PN} = "formfactor dbus-wait"
 SECTION = "x11"
+SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 9c1aa01..b74ae47 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -12,6 +12,7 @@ DEPENDS = "gtk+ startup-notification dbus dbus-glib"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
+SRCREV = "982d9ea173dc87a84db2303d1a6a12607fc4d539"
 PV = "0.0+git${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
index 81a4d7d..94ccd3f 100644
--- a/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
+++ b/meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://src/matchbox-stroke.h;endline=12;md5=8ed5c5bbec2321fb
 
 DEPENDS = "libfakekey expat libxft"
 SECTION = "x11/wm"
+SRCREV = "8edfd9a2bf1f0d6b28d4afee4bda9d3635f26a0b"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
index 0e0a753..f4ad463 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 DEPENDS = "gtk+ vte"
 SECTION = "x11/utils"
+SRCREV = "3fc25cb811a8ed306de897edf9b930f4402f3852"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_svn.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_svn.bb
index 36bde38..89e01b1 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_svn.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato-2_svn.bb
@@ -1,6 +1,7 @@
 require matchbox-theme-sato.inc
 
 DEPENDS = "matchbox-wm-2"
+SRCREV = "164"
 PV = "0.1+svnr${SRCPV}"
 
 SRC_URI = "svn://svn.o-hand.com/repos/sato/trunk;module=matchbox-sato;proto=http \
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_svn.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_svn.bb
index 16ea825..bb610b5 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_svn.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_svn.bb
@@ -1,5 +1,6 @@
 require matchbox-theme-sato.inc
 
+SRCREV = "90"
 PV = "0.1+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb b/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
index 99d0df7..9d5fd89 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
@@ -12,6 +12,7 @@ DEPENDS = "gtk+ gstreamer gst-plugins-base"
 RDEPENDS_${PN} = "gst-meta-base"
 RRECOMMENDS_${PN} = "gst-meta-audio gst-meta-video"
 
+SRCREV = "416"
 PV = "0.0+svnr${SRCPV}"
 PR = "r6"
 
diff --git a/meta/recipes-sato/owl-video-widget/owl-video_svn.bb b/meta/recipes-sato/owl-video-widget/owl-video_svn.bb
index f83dbdc..52883ce 100644
--- a/meta/recipes-sato/owl-video-widget/owl-video_svn.bb
+++ b/meta/recipes-sato/owl-video-widget/owl-video_svn.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ac14b7ca45afea5af040da54db270eb0 \
 SECTION = "x11"
 DEPENDS = "libowl-av"
 
+SRCREV = "394"
 PV = "0.0+svnr${SRCPV}"
 PR = "r3"
 
diff --git a/meta/recipes-sato/pimlico/contacts_git.bb b/meta/recipes-sato/pimlico/contacts_git.bb
index a86ecc4..57ee3b7 100644
--- a/meta/recipes-sato/pimlico/contacts_git.bb
+++ b/meta/recipes-sato/pimlico/contacts_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/contacts-dbus.c;endline=20;md5=95e02d77f155fbd07a14dba3348b9b03 \
                     file://src/contacts-gtk.c;endline=23;md5=e1ee9b9e72045f2d3aa44cf17313b46e"
 
+SRCREV = "19853893fdb595de6aa59db0d9dc2f9451ed2933"
 PV = "0.12+git${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-sato/pimlico/dates_git.bb b/meta/recipes-sato/pimlico/dates_git.bb
index f0a12f8..4b6a3e9 100644
--- a/meta/recipes-sato/pimlico/dates_git.bb
+++ b/meta/recipes-sato/pimlico/dates_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/dates_hildon.c;endline=19;md5=63938904198b25de429abb65fbdbdb8a \
                     file://src/gconf-bridge.c;endline=22;md5=ad7626c6daf4aec590474a243f4912fa"
 
+SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
 PV = "0.4.11+git${SRCPV}"
 PR = "r3"
 
diff --git a/meta/recipes-sato/pimlico/tasks_git.bb b/meta/recipes-sato/pimlico/tasks_git.bb
index 8f708ba..2cab47d 100644
--- a/meta/recipes-sato/pimlico/tasks_git.bb
+++ b/meta/recipes-sato/pimlico/tasks_git.bb
@@ -2,6 +2,7 @@ require tasks.inc
 
 SRC_URI = "git://git.gnome.org/${BPN};protocol=git"
 
+SRCREV = "ea52d46d691c5fce4473ea4e24a35411381f3a65"
 PV = "0.13+git${SRCPV}"
 PR = "r1"
 
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb b/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
index 3bee486..d00b060 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
@@ -11,6 +11,7 @@ SECTION = "x11"
 DEPENDS = "gtk+ gconf intltool-native librsvg"
 DEPENDS_append_poky = " libowl"
 
+SRCREV = "23"
 PV = "0.1+svnr${SRCPV}"
 PR = "r10"
 
diff --git a/meta/recipes-sato/screenshot/screenshot_svn.bb b/meta/recipes-sato/screenshot/screenshot_svn.bb
index 2f1b5ba..96f5da1 100644
--- a/meta/recipes-sato/screenshot/screenshot_svn.bb
+++ b/meta/recipes-sato/screenshot/screenshot_svn.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 PRIORITY = "optional"
 DEPENDS = "matchbox-panel-2"
+SRCREV = "292"
 PV = "0.0+svnr${SRCPV}"
 PR = "r2"
 
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
index 1adfa70..b76f4d8 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
 DEPENDS = "gconf glib-2.0 gtk+"
 SECTION = "x11"
+SRCREV = "0f174f463dfed500b65533e249cd22942e439c77"
 PV = "0.0+git${SRCPV}"
 
 PR = "r0"
diff --git a/meta/recipes-sato/web/web-webkit_svn.bb b/meta/recipes-sato/web/web-webkit_svn.bb
index 3df2bd8..a625929 100644
--- a/meta/recipes-sato/web/web-webkit_svn.bb
+++ b/meta/recipes-sato/web/web-webkit_svn.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SECTION = "x11"
 DEPENDS = "libxml2 glib-2.0 gtk+ libglade webkit-gtk curl gconf js libowl"
 
+SRCREV = "130"
 PV = "0.0+svnr${SRCPV}"
 PR = "r3"
 
diff --git a/meta/recipes-sato/web/web_svn.bb b/meta/recipes-sato/web/web_svn.bb
index 9dffa83..0cfe89f 100644
--- a/meta/recipes-sato/web/web_svn.bb
+++ b/meta/recipes-sato/web/web_svn.bb
@@ -4,6 +4,7 @@ DEPENDS = "libxml2 glib-2.0 gtk+ libglade gtkhtml2 curl gconf js libowl"
 DESCRIPTION = "Web is a multi-platform web browsing application."
 PR = "r4"
 
+SRCREV = "131"
 PV = "0.0+svnr${SRCPV}"
 
 SRC_URI = 	"svn://svn.o-hand.com/repos/${BPN};module=trunk;proto=http \
diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 1b5e276..3c5101b 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -12,6 +12,7 @@ DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer f
 
 SRCREV_FORMAT = "webcore-rwebkit"
 
+SRCREV = "72836"
 PV = "1.3.7+svnr${SRCPV}"
 PR = "r0"
 
diff --git a/meta/recipes-support/libgdbus/libgdbus_git.bb b/meta/recipes-support/libgdbus/libgdbus_git.bb
index 40b44de..76fa134 100644
--- a/meta/recipes-support/libgdbus/libgdbus_git.bb
+++ b/meta/recipes-support/libgdbus/libgdbus_git.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09"
 
 DEPENDS = "glib-2.0 dbus"
+
+SRCREV = "aeab6e3c0185b271ca343b439470491b99cc587f"
 PV = "0.0+git${SRCPV}"
 PR = "r0"
 
-- 
1.7.0.4



