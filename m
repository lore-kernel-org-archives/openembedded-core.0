Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rgdah-00022E-Dp
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:37:52 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Dec 2011 06:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="92903118"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 30 Dec 2011 06:30:34 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 22:33:15 +0800
Message-Id: <e011c46de429f8bee6d6bffed1a9c41dc98e2844.1325252646.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
References: <cover.1325252645.git.shane.wang@intel.com>
Subject: [PATCH 14/14] distro_tracking_fields: update the info for this round of package upgrade
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
X-List-Received-Date: Fri, 30 Dec 2011 14:37:52 -0000

The update includes:
- update the info for linux-firware, quota, watchdog, hdparm, libomxil, oprofileui, puzzles, and matchbox-wm-2
- add one more recipe info for stat, which is depended by hdparm
- correct the wrong info for connman-gnome, which is updated by last manual check in error.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   45 +++++++++++---------
 1 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index e8215b7..7725cfe 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -49,12 +49,12 @@ RECIPE_MAINTAINER_pn-libtimedate-perl = "Nitin A Kamble <nitin.a.kamble@intel.co
 DISTRO_PN_ALIAS_pn-libtimedate-perl = "Debian=libtimedate-perl Ubuntu=libtimedate-perl"
 
 RECIPE_STATUS_pn-linux-firmware = "green"
-RECIPE_LATEST_VERSION_pn-linux-firmware = "97649b1e"
-RECIPE_LATEST_RELEASE_DATE_pn-linux-firmware = "Dec 01, 2010"
+RECIPE_LATEST_VERSION_pn-linux-firmware = "15888a2e"
+RECIPE_LATEST_RELEASE_DATE_pn-linux-firmware = "Oct 24, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-linux-firmware = "n/a"
 RECIPE_NO_OF_PATCHES_pn-linux-firmware = "0"
-RECIPE_LAST_UPDATE_pn-linux-firmware = "Dec 30, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-linux-firmware = "Jun 29, 2011"
+RECIPE_LAST_UPDATE_pn-linux-firmware = "Dec 30, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-linux-firmware = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-linux-firmware = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-logrotate = "red"
@@ -1011,7 +1011,7 @@ RECIPE_INTEL_SECTION_pn-quota = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quota = "13 months"
 RECIPE_LATEST_RELEASE_DATE_pn-quota = "Aug 17, 2011"
 RECIPE_COMMENTS_pn-quota = ""
-RECIPE_LAST_UPDATE_pn-quota = "Nov 15, 2010"
+RECIPE_LAST_UPDATE_pn-quota = "Dec 30, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-quota = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
@@ -1142,15 +1142,15 @@ RECIPE_LATEST_RELEASE_DATE_pn-pax = "Aug 01, 2005"
 RECIPE_COMMENTS_pn-pax = ""
 
 RECIPE_STATUS_pn-watchdog = "green"
-RECIPE_LAST_UPDATE_pn-watchdog = "Aug 20, 2010"
+RECIPE_LAST_UPDATE_pn-watchdog = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-watchdog = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-watchdog = "not done"
-RECIPE_LATEST_VERSION_pn-watchdog = "5.10"
+RECIPE_LATEST_VERSION_pn-watchdog = "5.11"
 RECIPE_NO_OF_PATCHES_pn-watchdog = "0"
 RECIPE_INTEL_SECTION_pn-watchdog = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-watchdog = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Dec 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Dec 24, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Dec 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Dec 30, 2011"
 RECIPE_COMMENTS_pn-watchdog = ""
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 
@@ -1977,9 +1977,15 @@ RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
 RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
+RECIPE_STATUS_pn-stat = "red"
+RECIPE_LATEST_VERSION_pn-stat = "3.3"
+RECIPE_LAST_UPDATE_pn-stat = "Dec 30, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-stat = "Dec 30, 2011"
+RECIPE_MAINTAINER_pn-stat = "Shane Wang <shane.wang@intel.com>"
+
 RECIPE_STATUS_pn-hdparm = "red"
 RECIPE_LATEST_VERSION_pn-hdparm = "9.37"
-RECIPE_LAST_UPDATE_pn-hdparm = "Jan 24, 2011"
+RECIPE_LAST_UPDATE_pn-hdparm = "Dec 30, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-hdparm = "Dexuan Cui <dexuan.cui@intel.com>"
 
@@ -2181,13 +2187,12 @@ RECIPE_LAST_UPDATE_pn-connman = "Dec 30, 2010"
 RECIPE_MAINTAINER_pn-connman = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-connman-gnome = "green"
-RECIPE_LATEST_VERSION_pn-connman-gnome = "0.78"
-RECIPE_LATEST_RELEASE_DATE_pn-connman-gnome = "Dec 20, 2011"
+RECIPE_LATEST_VERSION_pn-connman-gnome = "0.5"
 RECIPE_NO_OF_PATCHES_pn-connman-gnome="3"
 RECIPE_LATEST_RELEASE_DATE_pn-connman-gnome="n/a"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-connman-gnome="n/a"
 RECIPE_LAST_UPDATE_pn-connman-gnome = "Dec 30, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-connman-gnome = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-connman-gnome = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-connman-gnome = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-connman-gnome = "Intel"
 
@@ -2797,7 +2802,7 @@ DISTRO_PN_ALIAS_pn-gst-fluendo-mpegdemux = "Ubuntu=gstreamer0.10-fluendo-mpegdem
 RECIPE_STATUS_pn-libomxil = "red"
 RECIPE_LATEST_VERSION_pn-libomxil = "0.9.3"
 RECIPE_LATEST_RELEASE_DATE_pn-libomxil = "May 20, 2011"
-RECIPE_LAST_UPDATE_pn-libomxil = "Jan 11, 2008"
+RECIPE_LAST_UPDATE_pn-libomxil = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libomxil = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-libomxil = "Dec 24, 2011"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
@@ -2820,7 +2825,7 @@ RECIPE_INTEL_SECTION_pn-oprofileui = "sdk-tools"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofileui = "20 days"
 RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "Nov 14, 2011"
 RECIPE_COMMENTS_pn-oprofileui = ""
-RECIPE_LAST_UPDATE_pn-oprofileui = "Apr 11, 2011"
+RECIPE_LAST_UPDATE_pn-oprofileui = "Dec 30, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-oprofileui = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-oprofileui = "Dexuan Cui <dexuan.cui@intel.com>"
 
@@ -3274,9 +3279,9 @@ RECIPE_MAINTAINER_pn-gnome-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-puzzles = "red"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles"
-RECIPE_LATEST_VERSION_pn-puzzles = "r9372"
-RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Dec 24, 2011"
-RECIPE_LAST_UPDATE_pn-puzzles = "May 31, 2011"
+RECIPE_LATEST_VERSION_pn-puzzles = "r9375"
+RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Dec 30, 2011"
+RECIPE_LAST_UPDATE_pn-puzzles = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 
@@ -5567,8 +5572,8 @@ RECIPE_MAINTAINER_pn-matchbox-themes-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-matchbox-wm-2 = "green"
 DISTRO_PN_ALIAS_pn-matchbox-wm-2 = "Mandriva=matchbox-window-manager Debian=matchbox-window-manager"
-RECIPE_LATEST_VERSION_pn-matchbox-wm-2 = "0.0+svnr2106"
-RECIPE_LAST_UPDATE_pn-matchbox-wm-2= "Dec 31, 2010"
+RECIPE_LATEST_VERSION_pn-matchbox-wm-2 = "0.0+svnr01fa"
+RECIPE_LAST_UPDATE_pn-matchbox-wm-2= "Dec 31, 2011"
 RECIPE_MAINTAINER_pn-matchbox-wm-2 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-metacity = "green"
-- 
1.7.6



