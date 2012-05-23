Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SXBWv-0003H9-UY
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:23:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 06:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147416808"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 06:11:35 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 16:11:11 +0300
Message-Id: <f37fdc8b5b0eedac43556493bbda332ef82271f2.1337777033.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1337777033.git.laurentiu.palcu@intel.com>
References: <cover.1337777033.git.laurentiu.palcu@intel.com>
Subject: [PATCH 19/19] Update to distro_tracking_fields.inc
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
X-List-Received-Date: Wed, 23 May 2012 13:23:11 -0000

The fields for the following packages were updated:

libdrm
xf86-video-vmware
xf86-input-mouse
xf86-video-vesa
xf86-video-intel
xf86-input-synaptics
mdadm
xextproto
xcmiscproto
scrnsaverproto
recordproto
xproto
kbproto
fontsproto
libxt
xtrans
libpciaccess
fontconfig
xcb-proto

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  180 ++++++++++----------
 1 file changed, 89 insertions(+), 91 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 8b8eeaa..5afe38f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1071,15 +1071,15 @@ RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mdadm = "not done"
-RECIPE_LATEST_VERSION_pn-mdadm = "3.2.3"
+RECIPE_LATEST_VERSION_pn-mdadm = "3.2.5"
 RECIPE_NO_OF_PATCHES_pn-mdadm = "1"
 RECIPE_PATCH_pn-mdadm+mdadm-3.2.2_fix_for_x32 = "fix CC's value"
 RECIPE_INTEL_SECTION_pn-mdadm = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "4+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "Dec 23, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "10 days"
+RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "May 18, 2012"
 RECIPE_COMMENTS_pn-mdadm = ""
-RECIPE_LAST_UPDATE_pn-mdadm = "Dec 30, 2011"
-RECIPE_MAINTAINER_pn-mdadm = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-mdadm = "May 22, 2012"
+RECIPE_MAINTAINER_pn-mdadm = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-screen = "green"
 RECIPE_DEPENDENCY_CHECK_pn-screen = "not done"
@@ -3814,15 +3814,14 @@ RECIPE_LAST_UPDATE_pn-xf86-input-keyboard = "Feb 02, 2012"
 RECIPE_MAINTAINER_pn-xf86-input-keyboard="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-mouse="green"
-# no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-mouse = "Ubuntu=xserver-xorg-input-mouse Mandriva=x11-driver-input-mouse Debian=xserver-xorg-input-mouse"
-RECIPE_LATEST_VERSION_pn-xf86-input-mouse="1.7.1"
-RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-mouse="Jul 05, 2011"
-RECIPE_LAST_UPDATE_pn-xf86-input-mouse = "Nov 28, 2011"
+RECIPE_LATEST_VERSION_pn-xf86-input-mouse="1.7.2"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-mouse="Mar 03, 2012"
+RECIPE_LAST_UPDATE_pn-xf86-input-mouse = "May 23, 2012"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-mouse="0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-mouse="9 monthes"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-mouse="8 months"
 RECIPE_INTEL_SECTION_pn-xf86-input-mouse="graphic core"
-RECIPE_MAINTAINER_pn-xf86-input-mouse="Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-xf86-input-mouse="Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-vmmouse="green"
 # update needed
@@ -3836,14 +3835,13 @@ RECIPE_LAST_UPDATE_pn-xf86-input-vmmouse = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xf86-input-vmmouse="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libdrm="green"
-# no update needed
-RECIPE_LATEST_VERSION_pn-libdrm = "2.4.31"
-RECIPE_LATEST_RELEASE_DATE_pn-libdrm = "Feb 06, 2012"
-RECIPE_LAST_UPDATE_pn-libdrm = "Feb 27, 2012"
-RECIPE_NO_OF_PATCHES_pn-libdrm="1"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm="1 month"
+RECIPE_LATEST_VERSION_pn-libdrm = "2.4.34"
+RECIPE_LATEST_RELEASE_DATE_pn-libdrm = "May 10, 2012"
+RECIPE_LAST_UPDATE_pn-libdrm = "May 21, 2012"
+RECIPE_NO_OF_PATCHES_pn-libdrm="2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm="3 months"
 RECIPE_INTEL_SECTION_pn-libdrm="graphic core"
-RECIPE_MAINTAINER_pn-libdrm="Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-libdrm="Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-python-pycairo="green"
 # no upgrade needed
@@ -3879,25 +3877,23 @@ RECIPE_LAST_UPDATE_pn-xf86-input-evdev = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-xf86-input-evdev="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-vmware="green"
-# no update needed
 DISTRO_PN_ALIAS_pn-xf86-video-vmware = "Debian=xserver-xorg-video-vmware Fedora=xorg-x11-drv-vmware Mandriva=x11-driver-video-vmware Ubuntu=xserver-xorg-video-vmware"
-RECIPE_LATEST_VERSION_pn-xf86-video-vmware="11.0.3"
+RECIPE_LATEST_VERSION_pn-xf86-video-vmware="12.0.2"
 RECIPE_NO_OF_PATCHES_pn-xf86-video-vmware="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vmware="2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vmware="Nov 09, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vmware="Mar 21, 2012"
 RECIPE_INTEL_SECTION_pn-xf86-video-vmware="graphic core"
-RECIPE_LAST_UPDATE_pn-xf86-video-vmware = "Nov 12, 2010"
-RECIPE_MAINTAINER_pn-xf86-video-vmware="Saul Wold <sgw@linux.intel.com>"
+RECIPE_LAST_UPDATE_pn-xf86-video-vmware = "May 16, 2012"
+RECIPE_MAINTAINER_pn-xf86-video-vmware="Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-vesa = "green"
-# no update needed
-RECIPE_LATEST_VERSION_pn-xf86-video-vesa = "2.3.0"
+RECIPE_LATEST_VERSION_pn-xf86-video-vesa = "2.3.1"
 RECIPE_NO_OF_PATCHES_pn-xf86-video-vesa = "0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vesa = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vesa = "Jan 04, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vesa = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vesa = "Mar 22, 2012"
 RECIPE_INTEL_SECTION_pn-xf86-video-vesa = "graphic core"
-RECIPE_LAST_UPDATE_pn-xf86-video-vesa = "May 17, 2010"
-RECIPE_MAINTAINER_pn-xf86-video-vesa = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_LAST_UPDATE_pn-xf86-video-vesa = "May 23, 2012"
+RECIPE_MAINTAINER_pn-xf86-video-vesa = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 DISTRO_PN_ALIAS_pn-xf86-video-vesa = "Debian=xserver-xorg-video-vesa Fedora=xorg-x11-drv-vesa Mandriva=x11-driver-video-vesa Ubuntu=xserver-xorg-video-vesa"
 
 RECIPE_STATUS_pn-xf86-video-fbdev = "green"
@@ -3995,16 +3991,18 @@ DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 
 RECIPE_STATUS_pn-xf86-input-synaptics = "red"
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
-RECIPE_LATEST_VERSION_pn-xf86-input-synaptics = "1.5.0"
-RECIPE_LAST_UPDATE_pn-xf86-input-synaptics = "Nov 28, 2011"
-RECIPE_MAINTAINER_pn-xf86-input-synaptics = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_LATEST_VERSION_pn-xf86-input-synaptics = "1.6.1"
+RECIPE_LAST_UPDATE_pn-xf86-input-synaptics = "May 23, 2012"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-synaptics ="May 11, 2012"
+RECIPE_MAINTAINER_pn-xf86-input-synaptics = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-xserver-xorg = "Do not update to *99* unstable versions"
 
 RECIPE_STATUS_pn-xf86-video-intel = "red"
 DISTRO_PN_ALIAS_pn-xf86-video-intel = "Debian=xserver-xorg-video-intel Fedora=xorg-x11-drv-intel Mandriva=x11-driver-video-intel Meego=xorg-x11-drv-intel Ubuntu=xserver-xorg-video-intel"
-RECIPE_LATEST_VERSION_pn-xf86-video-intel = "2.18.0"
-RECIPE_LAST_UPDATE_pn-xf86-video-intel = "Feb 27, 2012"
-RECIPE_MAINTAINER_pn-xf86-video-intel = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_LATEST_VERSION_pn-xf86-video-intel = "2.19.0"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-intel = "Apr 29, 2012"
+RECIPE_LAST_UPDATE_pn-xf86-video-intel = "May 23, 2012"
+RECIPE_MAINTAINER_pn-xf86-video-intel = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-omapfb = "red"
 DISTRO_PN_ALIAS_pn-xf86-video-omapfb = "OSPDT"
@@ -4175,14 +4173,14 @@ RECIPE_MAINTAINER_pn-fontcacheproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-fontsproto = "green"
 DISTRO_PN_ALIAS_pn-fontsproto = "Meego=xorg-x11-proto-fontsproto"
 RECIPE_DEPENDENCY_CHECK_pn-fontsproto = "not done"
-RECIPE_LATEST_VERSION_pn-fontsproto = "2.1.1"
+RECIPE_LATEST_VERSION_pn-fontsproto = "2.1.2"
 RECIPE_NO_OF_PATCHES_pn-fontsproto = "0"
 RECIPE_INTEL_SECTION_pn-fontsproto = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-fontsproto = "1+ years"
-RECIPE_LATEST_RELEASE_DATE_pn-fontsproto = "Oct 29, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-fontsproto = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-fontsproto = ""
-RECIPE_LAST_UPDATE_pn-fontsproto = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-fontsproto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-fontsproto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-fontsproto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-glproto = "green"
 DISTRO_PN_ALIAS_pn-glproto = "Meego=xorg-x11-proto-glproto"
@@ -4212,14 +4210,14 @@ RECIPE_MAINTAINER_pn-inputproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-kbproto = "green"
 DISTRO_PN_ALIAS_pn-kbproto = "Meego=xorg-x11-proto-kbproto Ubuntu=x11proto-kb-dev Debian=x11proto-kb-dev"
 RECIPE_DEPENDENCY_CHECK_pn-kbproto = "not done"
-RECIPE_LATEST_VERSION_pn-kbproto = "1.0.5"
+RECIPE_LATEST_VERSION_pn-kbproto = "1.0.6"
 RECIPE_NO_OF_PATCHES_pn-kbproto = "0"
 RECIPE_INTEL_SECTION_pn-kbproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-kbproto = "10 months"
-RECIPE_LATEST_RELEASE_DATE_pn-kbproto = "Aug 10, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-kbproto = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-kbproto = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-kbproto = ""
-RECIPE_LAST_UPDATE_pn-kbproto = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-kbproto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-kbproto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-kbproto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-libdmx = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libdmx = "not done"
@@ -4304,14 +4302,14 @@ RECIPE_MAINTAINER_pn-randrproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-recordproto = "green"
 DISTRO_PN_ALIAS_pn-recordproto = "Meego=xorg-x11-proto-recordproto"
 RECIPE_DEPENDENCY_CHECK_pn-recordproto = "not done"
-RECIPE_LATEST_VERSION_pn-recordproto = "1.14.1"
+RECIPE_LATEST_VERSION_pn-recordproto = "1.14.2"
 RECIPE_NO_OF_PATCHES_pn-recordproto = "0"
 RECIPE_INTEL_SECTION_pn-recordproto = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-recordproto = "1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-recordproto = "Oct 29, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-recordproto = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-recordproto = ""
-RECIPE_LAST_UPDATE_pn-recordproto = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-recordproto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-recordproto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-recordproto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-renderproto = "green"
 DISTRO_PN_ALIAS_pn-renderproto = "Meego=xorg-x11-proto-renderproto"
@@ -4340,14 +4338,14 @@ RECIPE_MAINTAINER_pn-resourceproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-scrnsaverproto = "green"
 DISTRO_PN_ALIAS_pn-scrnsaverproto = "Meego=xorg-x11-proto-scrnsaverproto Ubuntu=x11proto-scrnsaver-dev Debian=x11proto-scrnsaver-dev"
 RECIPE_DEPENDENCY_CHECK_pn-scrnsaverproto = "not done"
-RECIPE_LATEST_VERSION_pn-scrnsaverproto = "1.2.1"
+RECIPE_LATEST_VERSION_pn-scrnsaverproto = "1.2.2"
 RECIPE_NO_OF_PATCHES_pn-scrnsaverproto = "0"
 RECIPE_INTEL_SECTION_pn-scrnsaverproto = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-scrnsaverproto = "1+ years"
-RECIPE_LATEST_RELEASE_DATE_pn-scrnsaverproto = "Oct 29, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-scrnsaverproto = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-scrnsaverproto = ""
-RECIPE_LAST_UPDATE_pn-scrnsaverproto = "Jan 5, 2011"
-RECIPE_MAINTAINER_pn-scrnsaverproto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-scrnsaverproto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-scrnsaverproto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-trapproto = "green"
 DISTRO_PN_ALIAS_pn-trapproto = "Meego=xorg-x11-proto-trapproto"
@@ -4376,14 +4374,14 @@ RECIPE_MAINTAINER_pn-videoproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-xcmiscproto = "green"
 DISTRO_PN_ALIAS_pn-xcmiscproto = "Meego=xorg-x11-proto-xcmiscproto"
 RECIPE_DEPENDENCY_CHECK_pn-xcmiscproto = "not done"
-RECIPE_LATEST_VERSION_pn-xcmiscproto = "1.2.1"
+RECIPE_LATEST_VERSION_pn-xcmiscproto = "1.2.2"
 RECIPE_NO_OF_PATCHES_pn-xcmiscproto = "0"
 RECIPE_INTEL_SECTION_pn-xcmiscproto = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcmiscproto = "1+ years"
-RECIPE_LATEST_RELEASE_DATE_pn-xcmiscproto = "Oct 30, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-xcmiscproto = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-xcmiscproto = ""
-RECIPE_LAST_UPDATE_pn-xcmiscproto = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-xcmiscproto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-xcmiscproto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-xcmiscproto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-xf86bigfontproto = "green"
 DISTRO_PN_ALIAS_pn-xf86bigfontproto = "Meego=xorg-x11-proto-xf86bigfontproto"
@@ -4471,26 +4469,26 @@ RECIPE_MAINTAINER_pn-dri2proto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xcb-proto = "green"
 RECIPE_DEPENDENCY_CHECK_pn-xcb-proto = "not done"
-RECIPE_LATEST_VERSION_pn-xcb-proto = "1.7"
+RECIPE_LATEST_VERSION_pn-xcb-proto = "1.7.1"
 RECIPE_NO_OF_PATCHES_pn-xcb-proto = "0"
 RECIPE_INTEL_SECTION_pn-xcb-proto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcb-proto = "14 months"
-RECIPE_LATEST_RELEASE_DATE_pn-xcb-proto = "Jan 11, 2012"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcb-proto = "2+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-xcb-proto = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-xcb-proto = ""
-RECIPE_LAST_UPDATE_pn-xcb-proto = "Jun 22, 2012"
-RECIPE_MAINTAINER_pn-xcb-proto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-xcb-proto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-xcb-proto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-xextproto = "green"
 DISTRO_PN_ALIAS_pn-xextproto = "Meego=xorg-x11-proto-xextproto"
 RECIPE_DEPENDENCY_CHECK_pn-xextproto = "not done"
-RECIPE_LATEST_VERSION_pn-xextproto = "7.2.0"
+RECIPE_LATEST_VERSION_pn-xextproto = "7.2.1"
 RECIPE_NO_OF_PATCHES_pn-xextproto = "0"
 RECIPE_INTEL_SECTION_pn-xextproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xextproto = "6+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-xextproto = "Feb 27, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xextproto = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-xextproto = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-xextproto = ""
-RECIPE_LAST_UPDATE_pn-xextproto = "Apr 11, 2011"
-RECIPE_MAINTAINER_pn-xextproto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-xextproto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-xextproto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-xf86vidmodeproto = "green"
 DISTRO_PN_ALIAS_pn-xf86vidmodeproto = "Meego=xorg-x11-proto-xf86vidmodeproto Ubuntu=x11proto-xf86vidmode Debian=x11proto-xf86vidmode"
@@ -4507,14 +4505,14 @@ RECIPE_MAINTAINER_pn-xf86vidmodeproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-xproto = "green"
 DISTRO_PN_ALIAS_pn-xproto = "Meego=xorg-x11-proto-xproto Fedora=xorg-x11-proto-devel Ubuntu=x11proto-core-dev Debian=x11proto-core-dev Opensuse=xorg-x11-proto-devel Mandriva=x11-proto-devel"
 RECIPE_DEPENDENCY_CHECK_pn-xproto = "not done"
-RECIPE_LATEST_VERSION_pn-xproto = "7.0.22"
+RECIPE_LATEST_VERSION_pn-xproto = "7.0.23"
 RECIPE_NO_OF_PATCHES_pn-xproto = "0"
 RECIPE_INTEL_SECTION_pn-xproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xproto = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-xproto = "Jun 22, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xproto = "9 months"
+RECIPE_LATEST_RELEASE_DATE_pn-xproto = "Mar 16, 2012"
 RECIPE_COMMENTS_pn-xproto = ""
-RECIPE_LAST_UPDATE_pn-xproto = "Aug 16, 2011"
-RECIPE_MAINTAINER_pn-xproto = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-xproto = "May 22, 2012"
+RECIPE_MAINTAINER_pn-xproto = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-liberation-fonts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-liberation-fonts = "not done"
@@ -4655,14 +4653,14 @@ RECIPE_MAINTAINER_pn-libxres = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxt = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxt = "not done"
-RECIPE_LATEST_VERSION_pn-libxt = "1.1.1"
+RECIPE_LATEST_VERSION_pn-libxt = "1.1.3"
 RECIPE_NO_OF_PATCHES_pn-libxt = "0"
 RECIPE_INTEL_SECTION_pn-libxt = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxt = "6 days"
-RECIPE_LATEST_RELEASE_DATE_pn-libxt = "Mar 10, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxt = "8 days"
+RECIPE_LATEST_RELEASE_DATE_pn-libxt = "Mar 16, 2012"
 RECIPE_COMMENTS_pn-libxt = ""
-RECIPE_LAST_UPDATE_pn-libxt = "Apr 11, 2011"
-RECIPE_MAINTAINER_pn-libxt = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-libxt = "May 22, 2012"
+RECIPE_MAINTAINER_pn-libxt = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-libxv = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxv = "not done"
@@ -4800,14 +4798,14 @@ RECIPE_MAINTAINER_pn-pixman = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xtrans = "green"
 RECIPE_DEPENDENCY_CHECK_pn-xtrans = "not done"
-RECIPE_LATEST_VERSION_pn-xtrans = "1.2.5"
+RECIPE_LATEST_VERSION_pn-xtrans = "1.2.7"
 RECIPE_NO_OF_PATCHES_pn-xtrans = "0"
 RECIPE_INTEL_SECTION_pn-xtrans = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xtrans = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-xtrans = "Oct 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xtrans = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-xtrans = "Mar 23, 2012"
 RECIPE_COMMENTS_pn-xtrans = ""
-RECIPE_LAST_UPDATE_pn-xtrans = "Nov 24, 2010"
-RECIPE_MAINTAINER_pn-xtrans = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-xtrans = "May 22, 2012"
+RECIPE_MAINTAINER_pn-xtrans = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-libxmu = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxmu = "not done"
@@ -4822,15 +4820,15 @@ RECIPE_MAINTAINER_pn-libxmu = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libpciaccess = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpciaccess = "not done"
-RECIPE_LATEST_VERSION_pn-libpciaccess = "0.12.902"
-RECIPE_NO_OF_PATCHES_pn-libpciaccess = "1"
+RECIPE_LATEST_VERSION_pn-libpciaccess = "0.13.1"
+RECIPE_NO_OF_PATCHES_pn-libpciaccess = "0"
 RECIPE_PATCH_pn-libpciaccess+fix_deletion_of_last_handle.patch = "The patch is already in upstream git repo."
 RECIPE_INTEL_SECTION_pn-libpciaccess = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpciaccess = "1+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-libpciaccess = "Nov 09, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-libpciaccess = "Apr 09, 2012"
 RECIPE_COMMENTS_pn-libpciaccess = ""
-RECIPE_LAST_UPDATE_pn-libpciaccess = "Dec 30, 2011"
-RECIPE_MAINTAINER_pn-libpciaccess = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-libpciaccess = "May 23, 2012"
+RECIPE_MAINTAINER_pn-libpciaccess = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-xkeyboard-config = "green"
 RECIPE_DEPENDENCY_CHECK_pn-xkeyboard-config = "not done"
@@ -4857,15 +4855,15 @@ RECIPE_MAINTAINER_pn-util-macros = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-fontconfig = "green"
 RECIPE_DEPENDENCY_CHECK_pn-fontconfig = "not done"
-RECIPE_LATEST_VERSION_pn-fontconfig = "2.8.0"
+RECIPE_LATEST_VERSION_pn-fontconfig = "2.9.0"
 RECIPE_NO_OF_PATCHES_pn-fontconfig = "1"
 RECIPE_PATCH_pn-fontconfig+fix-pkgconfig = "an one-line patch; fix the linkage to freetype in fontconfig.pc.in"
 RECIPE_INTEL_SECTION_pn-fontconfig = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-fontconfig = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-fontconfig = "Nov 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-fontconfig = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-fontconfig = "Mar 10, 2012"
 RECIPE_COMMENTS_pn-fontconfig = ""
-RECIPE_LAST_UPDATE_pn-fontconfig = "Jul 2, 2010"
-RECIPE_MAINTAINER_pn-fontconfig = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_LAST_UPDATE_pn-fontconfig = "May 22, 2012"
+RECIPE_MAINTAINER_pn-fontconfig = "Laurentiu Palcu <laurentiu.palcu@intel.com>"
 
 RECIPE_STATUS_pn-freetype = "green"
 RECIPE_DEPENDENCY_CHECK_pn-freetype = "not done"
-- 
1.7.9.5



