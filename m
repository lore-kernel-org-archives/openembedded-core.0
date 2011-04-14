Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAIQB-0000FO-R9
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 11:01:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2011 01:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,210,1301900400"; d="scan'208";a="628438375"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2011 01:58:48 -0700
Message-Id: <c74e00f8e6096c2b1797004770049de98a4d4374.1302770941.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302770941.git.dexuan.cui@intel.com>
References: <cover.1302770941.git.dexuan.cui@intel.com>
Old-Date: Tue, 12 Apr 2011 01:09:23 +0800
Date: Thu, 14 Apr 2011 16:56:43 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [v2 11/12] distro_tracking_fields.inc: update the info for the following recipes
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
X-List-Received-Date: Thu, 14 Apr 2011 09:01:04 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

oprofileui
tcf-agent
libxt
libxi
fixesproto
xproto
gnome-doc-utils
pixman
xextproto
libpciaccess
cronie

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   83 ++++++++++----------
 1 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 8469e96..7602cf7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1944,13 +1944,13 @@ RECIPE_MAINTAINER_pn-cpio = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-cronie = "green"
 RECIPE_DEPENDENCY_CHECK_pn-cronie = "not done"
-RECIPE_LATEST_VERSION_pn-cronie = "1.4.4"
-RECIPE_MANUAL_CHECK_DATE_pn-cronie = "Jan 28, 2011"
+RECIPE_LATEST_VERSION_pn-cronie = "1.4.7"
+RECIPE_MANUAL_CHECK_DATE_pn-cronie = "Apr 11, 2011"
 RECIPE_INTEL_SECTION_pn-cronie = "base"
 RECIPE_NO_OF_PATCHES_pn-cronie = "0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cronie = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-cronie = "02/2010"
-RECIPE_LAST_UPDATE_pn-cronie = "Nov 24, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cronie = "5 months"
+RECIPE_LATEST_RELEASE_DATE_pn-cronie = "Mar 17, 2011"
+RECIPE_LAST_UPDATE_pn-cronie = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-cronie = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-grep = "green" 
@@ -2687,14 +2687,14 @@ RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-oprofileui = "green"
 DISTRO_PN_ALIAS_pn-oprofileui = "Fedora=oprofileui Ubuntu=oprofile-gui Debian=oprofile-gui"
 RECIPE_DEPENDENCY_CHECK_pn-oprofileui = "not done"
-RECIPE_LATEST_VERSION_pn-oprofileui = "0.0+git0+e2d998d8a55dc1e49d1588841f83eff8e6809753"
+RECIPE_LATEST_VERSION_pn-oprofileui = "0.0+git0+0c3c32fa754c1d0b70e65767ea7048914f776396"
 RECIPE_NO_OF_PATCHES_pn-oprofileui = "1"
 RECIPE_PATCH_pn-oprofileui+dso_linking_change_build_fix = "fix the build by explicitely passing -lm to linker"
 RECIPE_INTEL_SECTION_pn-oprofileui = "sdk-tools"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofileui = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "Dec 10, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofileui = "20 days"
+RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "Apr 4, 2011"
 RECIPE_COMMENTS_pn-oprofileui = ""
-RECIPE_LAST_UPDATE_pn-oprofileui = "Mar 9, 2011"
+RECIPE_LAST_UPDATE_pn-oprofileui = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-oprofileui = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-oprofile = "green"
@@ -2741,6 +2741,8 @@ RECIPE_STATUS_pn-tcf-agent = "green"
 DISTRO_PN_ALIAS_pn-tcf-agent = "WindRiver upstream=http://www.eclipse.org/dsdp/tm/"
 RECIPE_DEPENDENCY_CHECK_pn-tcf-agent = "not done"
 RECIPE_LATEST_VERSION_pn-tcf-agent = "0.3.0+svnr1078"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Apr 11, 2011"
+RECIPE_NO_UPDATE_REASON_pn-tcf-agent = "Do not upgrade to version: (998)? because upstraem hasn't defined a formal release tag."
 RECIPE_NO_OF_PATCHES_pn-tcf-agent = "2"
 RECIPE_PATCH_pn-tcf-agent+terminals_agent = "we might get the patch from git://git.pokylinux.org/eclipse-poky.git in future"
 RECIPE_PATCH_pn-tcf-agent+fix_tcf-agent.init = "a proper script /etc/init.d/tcf-agent"
@@ -3739,13 +3741,13 @@ RECIPE_MAINTAINER_pn-dmxproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-fixesproto = "green"
 DISTRO_PN_ALIAS_pn-fixesproto = "Meego=xorg-x11-proto-fixesproto"
 RECIPE_DEPENDENCY_CHECK_pn-fixesproto = "not done"
-RECIPE_LATEST_VERSION_pn-fixesproto = "4.1.2"
+RECIPE_LATEST_VERSION_pn-fixesproto = "5.0"
 RECIPE_NO_OF_PATCHES_pn-fixesproto = "0"
 RECIPE_INTEL_SECTION_pn-fixesproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-fixesproto = "1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-fixesproto = "Oct 29, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-fixesproto = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-fixesproto = "Mar 8, 2011"
 RECIPE_COMMENTS_pn-fixesproto = ""
-RECIPE_LAST_UPDATE_pn-fixesproto = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-fixesproto = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-fixesproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-fontcacheproto = "green"
@@ -3821,13 +3823,13 @@ RECIPE_MAINTAINER_pn-libdmx = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxi = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxi = "not done"
-RECIPE_LATEST_VERSION_pn-libxi = "1.3"
+RECIPE_LATEST_VERSION_pn-libxi = "1.4.2"
 RECIPE_NO_OF_PATCHES_pn-libxi = "0"
 RECIPE_INTEL_SECTION_pn-libxi = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxi = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxi = "10/2009"
+RECIPE_LATEST_RELEASE_DATE_pn-libxi = "Mar 18, 2011"
 RECIPE_COMMENTS_pn-libxi = ""
-RECIPE_LAST_UPDATE_pn-libxi = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libxi = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-libxi = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxinerama = "green"
@@ -4069,13 +4071,13 @@ RECIPE_MAINTAINER_pn-xcb-proto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-xextproto = "green"
 DISTRO_PN_ALIAS_pn-xextproto = "Meego=xorg-x11-proto-xextproto"
 RECIPE_DEPENDENCY_CHECK_pn-xextproto = "not done"
-RECIPE_LATEST_VERSION_pn-xextproto = "7.1.2"
+RECIPE_LATEST_VERSION_pn-xextproto = "7.2.0"
 RECIPE_NO_OF_PATCHES_pn-xextproto = "0"
 RECIPE_INTEL_SECTION_pn-xextproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xextproto = "1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-xextproto = "Aug 10, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xextproto = "6+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-xextproto = "Feb 27, 2011"
 RECIPE_COMMENTS_pn-xextproto = ""
-RECIPE_LAST_UPDATE_pn-xextproto = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-xextproto = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-xextproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xf86vidmodeproto = "green"
@@ -4093,13 +4095,13 @@ RECIPE_MAINTAINER_pn-xf86vidmodeproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-xproto = "green"
 DISTRO_PN_ALIAS_pn-xproto = "Meego=xorg-x11-proto-xproto Fedora=xorg-x11-proto-devel Ubuntu=x11proto-core-dev Debian=x11proto-core-dev Opensuse=xorg-x11-proto-devel Mandriva=x11-proto-devel"
 RECIPE_DEPENDENCY_CHECK_pn-xproto = "not done"
-RECIPE_LATEST_VERSION_pn-xproto = "7.0.20"
+RECIPE_LATEST_VERSION_pn-xproto = "7.0.21"
 RECIPE_NO_OF_PATCHES_pn-xproto = "0"
 RECIPE_INTEL_SECTION_pn-xproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xproto = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-xproto = "Dec 7, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xproto = "3+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-xproto = "Mar 22, 2011"
 RECIPE_COMMENTS_pn-xproto = ""
-RECIPE_LAST_UPDATE_pn-xproto = "Jan 5, 2011"
+RECIPE_LAST_UPDATE_pn-xproto = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-xproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liberation-fonts = "green"
@@ -4241,13 +4243,13 @@ RECIPE_MAINTAINER_pn-libxres = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxt = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxt = "not done"
-RECIPE_LATEST_VERSION_pn-libxt = "1.0.8"
+RECIPE_LATEST_VERSION_pn-libxt = "1.1.1"
 RECIPE_NO_OF_PATCHES_pn-libxt = "0"
 RECIPE_INTEL_SECTION_pn-libxt = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxt = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxt = "03/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxt = "6 days"
+RECIPE_LATEST_RELEASE_DATE_pn-libxt = "Mar 10, 2011"
 RECIPE_COMMENTS_pn-libxt = ""
-RECIPE_LAST_UPDATE_pn-libxt = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libxt = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-libxt = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxv = "green"
@@ -4374,12 +4376,12 @@ RECIPE_MAINTAINER_pn-libxkbfile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-pixman = "green"
 RECIPE_DEPENDENCY_CHECK_pn-pixman = "not done"
-RECIPE_LATEST_VERSION_pn-pixman = "0.21.4"
-RECIPE_NO_UPDATE_REASON_pn-pixman = "Do not upgrade to version: 0.21.4 because it's a development snapshot. pixman's stable releases have even minor version numbers."
+RECIPE_LATEST_VERSION_pn-pixman = "0.21.6"
+RECIPE_NO_UPDATE_REASON_pn-pixman = "Do not upgrade to version: 0.21.6 because it's a development snapshot. pixman's stable releases have even minor version numbers."
 RECIPE_NO_OF_PATCHES_pn-pixman = "0"
 RECIPE_INTEL_SECTION_pn-pixman = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-pixman = "Jan 19, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "1+ month"
+RECIPE_LATEST_RELEASE_DATE_pn-pixman = "Feb 22, 2011"
 RECIPE_COMMENTS_pn-pixman = ""
 RECIPE_LAST_UPDATE_pn-pixman = "Jan 31, 2011"
 RECIPE_MAINTAINER_pn-pixman = "Dexuan Cui <dexuan.cui@intel.com>"
@@ -4408,13 +4410,13 @@ RECIPE_MAINTAINER_pn-libxmu = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libpciaccess = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpciaccess = "not done"
-RECIPE_LATEST_VERSION_pn-libpciaccess = "0.11.0"
+RECIPE_LATEST_VERSION_pn-libpciaccess = "0.12.1"
 RECIPE_NO_OF_PATCHES_pn-libpciaccess = "0"
 RECIPE_INTEL_SECTION_pn-libpciaccess = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpciaccess = "1+ years"
-RECIPE_LATEST_RELEASE_DATE_pn-libpciaccess = "12/2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpciaccess = "6+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-libpciaccess = "Feb 2, 2011"
 RECIPE_COMMENTS_pn-libpciaccess = ""
-RECIPE_LAST_UPDATE_pn-libpciaccess = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libpciaccess = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-libpciaccess = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xkeyboard-config = "green"
@@ -4549,13 +4551,13 @@ RECIPE_MAINTAINER_pn-galago-daemon = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-gnome-doc-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-gnome-doc-utils = "not done"
-RECIPE_LATEST_VERSION_pn-gnome-doc-utils = "0.20.4"
+RECIPE_LATEST_VERSION_pn-gnome-doc-utils = "0.20.5"
 RECIPE_NO_OF_PATCHES_pn-gnome-doc-utils = "0"
 RECIPE_INTEL_SECTION_pn-gnome-doc-utils = "utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnome-doc-utils = "less than 1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-gnome-doc-utils = "Jan 10, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnome-doc-utils = "2+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-gnome-doc-utils = "Mar 22, 2011"
 RECIPE_COMMENTS_pn-gnome-doc-utils = ""
-RECIPE_LAST_UPDATE_pn-gnome-doc-utils = "Jan 28, 2011"
+RECIPE_LAST_UPDATE_pn-gnome-doc-utils = "Apr 11, 2011"
 RECIPE_MAINTAINER_pn-gnome-doc-utils = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-gnome-settings-daemon = "red"
@@ -5425,7 +5427,6 @@ DISTRO_PN_ALIAS_pn-screenshot = "OpenedHand"
 DISTRO_PN_ALIAS_pn-web-webkit = "OpenedHand"
 DISTRO_PN_ALIAS_pn-xcursor-transparent-theme = "OpenedHand"
 DISTRO_PN_ALIAS_pn-qemugl = "OpenedHand"
-DISTRO_PN_ALIAS_pn-oprofileui = "OpenedHand"
 DISTRO_PN_ALIAS_pn-gaku = "OpenedHand"
 DISTRO_PN_ALIAS_pn-xvideo-tests = "OpenedHand"
 
-- 
1.7.2



