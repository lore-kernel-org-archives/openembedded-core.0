Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SJ74M-0007To-GC
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 19:47:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2012 10:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141743799"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2012 10:38:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 10:38:01 -0700
Message-Id: <5704268f2f47c7f99086a906ad10f64d765c7d0f.1334424952.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334424952.git.sgw@linux.intel.com>
References: <cover.1334424952.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334424952.git.sgw@linux.intel.com>
References: <cover.1334424952.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] distro_tracking: add entries for several new recipes
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
X-List-Received-Date: Sat, 14 Apr 2012 17:47:31 -0000

From: Scott Garman <scott.a.garman@intel.com>

Added distro tracking fileds for the following recipes:

qt-mobility-x11
gst-plugin-bluetooth
alsa-state
ocf-linux
avahi-ui
libjson
systemtap-uprobes
xf86-video-fbdev
u-boot-fw-utils
qt4-graphics-system
qt-mobility-embedded
lttng-tools
shadow-securetty

Also fixed a few minor typos in others (spelling of bluetooth and months)

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   84 ++++++++++++++++++--
 1 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7c9fc02..de6f3dd 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -248,6 +248,14 @@ RECIPE_MANUAL_CHECK_DATE_pn-gpgme = "Jul 28, 2011"
 RECIPE_LAST_UPDATE_pn-gpgme = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-gpgme = "Zhai Edwin <edwin.zhai@intel.com>"
 
+RECIPE_STATUS_pn-ocf-linux = "green"
+RECIPE_LATEST_VERSION_pn-ocf-linux = "20120127"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ocf-linux = "6 months"
+RECIPE_LATEST_RELEASE_DATE_pn-ocf-linux = "Jan 27, 2012"
+RECIPE_LAST_UPDATE_pn-ocf-linux = "Nov 30, 2011"
+RECIPE_MAINTAINER_pn-ocf-linux = "Saul Wold <sgw@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-ocf-linux = ""
+
 RECIPE_STATUS_pn-expat = "green"
 RECIPE_DEPENDENCY_CHECK_pn-expat = "not done"
 RECIPE_LATEST_VERSION_pn-expat = "2.0.1"
@@ -1124,6 +1132,9 @@ RECIPE_LAST_UPDATE_pn-shadow = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-shadow = "Scott Garman <scott.a.garman@intel.com>"
 DISTRO_PN_ALIAS_pn-shadow-sysroot = "Ubuntu=shadow Fedora=shadow"
 
+RECIPE_MAINTAINER_pn-shadow-securetty = "Scott Garman <scott.a.garman@intel.com>"
+DISTRO_PN_ALIAS_pn-shadow-securetty = "Ubuntu=shadow Fedora=shadow"
+
 RECIPE_STATUS_pn-coreutils = "green"
 RECIPE_LAST_UPDATE_pn-coreutils = "Jul 2, 2011"
 RECIPE_MAINTAINER_pn-coreutils = "Shane Wang <shane.wang@intel.com>"
@@ -1727,6 +1738,7 @@ RECIPE_DEPENDENCY_CHECK_pn-avahi-ui = "not done"
 RECIPE_INTEL_SECTION_pn-avahi-ui = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-avahi-ui = "3 month"
 RECIPE_COMMENTS_pn-avahi-ui = ""
+DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 
 RECIPE_STATUS_pn-js = "yellow"
 # may not work for platforms other than 32bit x86
@@ -2007,6 +2019,14 @@ RECIPE_LATEST_VERSION_pn-u-boot-mkimage = "2010.03"
 RECIPE_LAST_UPDATE_pn-u-boot-mkimage = "Dec 15, 2009"
 RECIPE_MAINTAINER_pn-u-boot-mkimage = "Saul Wold <sgw@linux.intel.com>"
 
+RECIPE_STATUS_pn-u-boot-fw-utils = "green"
+RECIPE_LATEST_VERSION_pn-u-boot-fw-utils = "2011.12"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-u-boot-fw-utils = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-u-boot-fw-utils = "Dec 23, 2011"
+RECIPE_LAST_UPDATE_pn-u-boot-fw-utils = "Feb 10, 2012"
+RECIPE_MAINTAINER_pn-u-boot-fw-utils = "Saul Wold <sgw@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-u-boot-fw-utils = "Ubuntu=u-boot-tools Debian=u-boot-tools"
+
 RECIPE_STATUS_pn-zaurusd = "green"
 RECIPE_LATEST_VERSION_pn-zaurusd = "0.0+svnr426"
 DISTRO_PN_ALIAS_pn-zaurusd = "OpenedHand"
@@ -2793,6 +2813,9 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-alsa-lib="12 months"
 RECIPE_LAST_UPDATE_pn-alsa-lib = "Mar 14, 2012"
 RECIPE_MAINTAINER_pn-alsa-lib = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
+RECIPE_MAINTAINER_pn-alsa-state = "Dongxiao Xu <dongxiao.xu@intel.com>"
+DISTRO_PN_ALIAS_pn-alsa-state = "OE-Core"
+
 RECIPE_STATUS_pn-tremor="green"
 RECIPE_LATEST_VERSION_pn-tremor="20120122"
 RECIPE_NO_OF_PATCHES_pn-tremor="0"
@@ -3045,6 +3068,17 @@ RECIPE_COMMENTS_pn-lttng-viewer = ""
 RECIPE_LAST_UPDATE_pn-lttng-viewer = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-lttng-viewer = "Dexuan Cui <dexuan.cui@intel.com>"
 
+RECIPE_STATUS_pn-lttng-tools = "green"
+RECIPE_LATEST_VERSION_pn-lttng-tools = "unknown"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-tools = "unknown"
+RECIPE_LATEST_RELEASE_DATE_pn-lttng-tools = "unknown"
+RECIPE_LAST_UPDATE_pn-lttng-tools = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-lttng-tools = "Dexuan Cui <dexuan.cui@intel.com>"
+DISTRO_PN_ALIAS_pn-lttng-tools = ""
+
+RECIPE_MAINTAINER_pn-systemtap-uprobes = "Tom Zanussi <tom.zanussi@intel.com>"
+DISTRO_PN_ALIAS_pn-systemtap-uprobes = "Ubuntu=systemtap Debian=systemtap"
+
 RECIPE_STATUS_pn-blktrace = "red"
 RECIPE_LATEST_VERSION_pn-blktrace = "1.0.1"
 RECIPE_NO_OF_PATCHES_pn-blktrace = "1"
@@ -3689,6 +3723,25 @@ RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Dec 15, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
 
+RECIPE_MAINTAINER_pn-qt4-graphics-system = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-qt4-graphics-system = "OE-Core"
+
+RECIPE_STATUS_pn-qt-mobility-embedded = "green"
+RECIPE_LATEST_VERSION_pn-qt-mobility-embedded = "1.2.0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt-mobility-embedded = "1 week"
+RECIPE_LATEST_RELEASE_DATE_pn-qt-mobility-embedded = "May 10, 2011"
+RECIPE_LAST_UPDATE_pn-qt-mobility-embedded = "Apr 04, 2012"
+RECIPE_MAINTAINER_pn-qt-mobility-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-qt-mobility-embedded = "Ubuntu=qtmobility-dev Debian=qtmobility-dev"
+
+RECIPE_STATUS_pn-qt-mobility-x11 = "green"
+RECIPE_LATEST_VERSION_pn-qt-mobility-x11 = "1.2.0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt-mobility-x11 = "1 week"
+RECIPE_LATEST_RELEASE_DATE_pn-qt-mobility-x11 = "May 10, 2011"
+RECIPE_LAST_UPDATE_pn-qt-mobility-x11 = "Apr 04, 2012"
+RECIPE_MAINTAINER_pn-qt-mobility-x11 = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-qt-mobility-x11 = "Ubuntu=qtmobility-dev Debian=qtmobility-dev"
+
 RECIPE_STATUS_pn-quicky = "green"
 # no update needed
 RECIPE_LATEST_VERSION_pn-quicky = "0.4"
@@ -3818,7 +3871,7 @@ RECIPE_STATUS_pn-xf86-input-evdev="green"
 DISTRO_PN_ALIAS_pn-xf86-input-evdev = "Ubuntu=xserver-xorg-input-evdev Mandriva=x11-driver-input-evdev Debian=xserver-xorg-input-evdev Fedora=xorg-x11-drv-evdev Meego=xorg-x11-drv-evdev"
 RECIPE_LATEST_VERSION_pn-xf86-input-evdev="2.6.0"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-evdev="0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-evdev="1 monthes"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-evdev="1 months"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-evdev="Aug 23, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-input-evdev="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-input-evdev = "Jan 18, 2011"
@@ -3829,7 +3882,7 @@ RECIPE_STATUS_pn-xf86-video-vmware="green"
 DISTRO_PN_ALIAS_pn-xf86-video-vmware = "Debian=xserver-xorg-video-vmware Fedora=xorg-x11-drv-vmware Mandriva=x11-driver-video-vmware Ubuntu=xserver-xorg-video-vmware"
 RECIPE_LATEST_VERSION_pn-xf86-video-vmware="11.0.3"
 RECIPE_NO_OF_PATCHES_pn-xf86-video-vmware="0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vmware="2 monthes"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vmware="2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vmware="Nov 09, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-video-vmware="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-video-vmware = "Nov 12, 2010"
@@ -3839,13 +3892,21 @@ RECIPE_STATUS_pn-xf86-video-vesa = "green"
 # no update needed
 RECIPE_LATEST_VERSION_pn-xf86-video-vesa = "2.3.0"
 RECIPE_NO_OF_PATCHES_pn-xf86-video-vesa = "0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vesa = "6 monthes"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vesa = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vesa = "Jan 04, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-video-vesa = "graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-video-vesa = "May 17, 2010"
 RECIPE_MAINTAINER_pn-xf86-video-vesa = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xf86-video-vesa = "Debian=xserver-xorg-video-vesa Fedora=xorg-x11-drv-vesa Mandriva=x11-driver-video-vesa Ubuntu=xserver-xorg-video-vesa"
 
+RECIPE_STATUS_pn-xf86-video-fbdev = "green"
+RECIPE_LATEST_VERSION_pn-xf86-video-fbdev = "0.4.2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-fbdev = "unknown"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-fbdev = "unknown"
+RECIPE_LAST_UPDATE_pn-xf86-video-fbdev = "Jan 06, 2012"
+RECIPE_MAINTAINER_pn-xf86-video-fbdev = "Saul Wold <sgw@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-xf86-video-fbdev = "Ubuntu=xserver-xorg-video-fbdev Debian=xserver-xorg-video-fbdev"
+
 RECIPE_STATUS_pn-cairo="green"
 # no update needed
 RECIPE_LATEST_VERSION_pn-cairo="1.9.10"
@@ -5425,6 +5486,14 @@ RECIPE_LAST_UPDATE_pn-webkit-gtk = "Jul 11, 2011"
 RECIPE_MAINTAINER_pn-webkit-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk Ubuntu=libwebkit"
 
+RECIPE_STATUS_pn-libjson = "green"
+RECIPE_LATEST_VERSION_pn-libjson = "0.9"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libjson = "7 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libjson = "Jul 31, 2009"
+RECIPE_LAST_UPDATE_pn-libjson = "Nov 29, 2011"
+RECIPE_MAINTAINER_pn-libjson = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+DISTRO_PN_ALIAS_pn-libjson = "Ubuntu=libjson0-dev Debian=libjson0-dev"
+
 RECIPE_STATUS_pn-eds-dbus = "green"
 DISTRO_PN_ALIAS_pn-eds-dbus = "Debian=evolution-data-server Fedora=evolution-data-server Mandriva=evolution-data-server OpenSuSE=evolution-data-server Ubuntu=evolution-data-server"
 RECIPE_DEPENDENCY_CHECK_pn-eds-dbus = "not done"
@@ -6062,11 +6131,12 @@ RECIPE_COMMENTS_pn-man-pages = "Kernel.org is down"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
 
-RECIPE_LATEST_VERSION_pn-gst-plugin-bluetooh = "4.96"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-plugin-bluetooh = "Jul 31, 2011"
-RECIPE_LAST_UPDATE_pn-gst-plugin-bluetooh = "Aug 12, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gst-plugin-bluetooh = "Dec 15, 2011"
+RECIPE_LATEST_VERSION_pn-gst-plugin-bluetooth = "4.96"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-plugin-bluetooth = "Jul 31, 2011"
+RECIPE_LAST_UPDATE_pn-gst-plugin-bluetooth = "Aug 12, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gst-plugin-bluetooth = "Dec 15, 2011"
 RECIPE_COMMENTS_pn-gst-plugin-bluetooth = "Kernel.org is down"
+DISTRO_PN_ALIAS_pn-gst-plugin-bluetooth = "Ubuntu=libgstreamer-plugins-base Fedora=gstreamer-plugins-base"
 
 RECIPE_STATUS_pn-qmmp = "green"
 RECIPE_LATEST_VERSION_pn-qmmp = "0.5.2"
-- 
1.7.7.6



