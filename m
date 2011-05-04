Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QHcdY-0006K1-E3
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 16:01:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2011 06:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,314,1301900400"; d="scan'208";a="917907868"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2011 06:58:18 -0700
Message-Id: <cover.1304515719.git.ke.yu@intel.com>
Old-Date: Wed, 4 May 2011 21:28:39 +0800
Date: Wed, 04 May 2011 22:05:22 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Wed, 04 May 2011 14:01:09 -0000

From: Yu Ke <ke.yu@intel.com>

move the SRCREV from poky-default-revisions.inc to its corresponding recipe,
in this case, those non poky distro can also use its SRCREV.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: kyu3/srcrev-recipe
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/srcrev-recipe

Thanks,
    Yu Ke <ke.yu@intel.com>
---


Yu Ke (1):
  poky-default-revisions: move the SRCREV to recipe file

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



