Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrV-0004pi-JH
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752291"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:13 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:18 -0800
Message-Id: <0d6ac17278284248f09cd13784a6ef40d6d76690.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 092/113] distro_tracking_fields: update the info for this round of package upgrade
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:42 -0000

From: Shane Wang <shane.wang@intel.com>

The update includes:
- update the info for linux-firware, quota, watchdog, hdparm, libomxil, oprofileui, puzzles, and matchbox-wm-2
- add one more recipe info for stat, which is depended by hdparm
- correct the wrong info for connman-gnome, which is updated by last manual check in error.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   45 +++++++++++---------
 1 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 9437a23..0fe6299 100644
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
@@ -1014,7 +1014,7 @@ RECIPE_INTEL_SECTION_pn-quota = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quota = "13 months"
 RECIPE_LATEST_RELEASE_DATE_pn-quota = "Aug 17, 2011"
 RECIPE_COMMENTS_pn-quota = ""
-RECIPE_LAST_UPDATE_pn-quota = "Nov 15, 2010"
+RECIPE_LAST_UPDATE_pn-quota = "Dec 30, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-quota = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
@@ -1145,15 +1145,15 @@ RECIPE_LATEST_RELEASE_DATE_pn-pax = "Aug 01, 2005"
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
 
@@ -1980,9 +1980,15 @@ RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
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
 
@@ -2184,13 +2190,12 @@ RECIPE_LAST_UPDATE_pn-connman = "Dec 30, 2010"
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
 
@@ -2802,7 +2807,7 @@ DISTRO_PN_ALIAS_pn-gst-fluendo-mpegdemux = "Ubuntu=gstreamer0.10-fluendo-mpegdem
 RECIPE_STATUS_pn-libomxil = "red"
 RECIPE_LATEST_VERSION_pn-libomxil = "0.9.3"
 RECIPE_LATEST_RELEASE_DATE_pn-libomxil = "May 20, 2011"
-RECIPE_LAST_UPDATE_pn-libomxil = "Jan 11, 2008"
+RECIPE_LAST_UPDATE_pn-libomxil = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libomxil = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-libomxil = "Dec 24, 2011"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
@@ -2825,7 +2830,7 @@ RECIPE_INTEL_SECTION_pn-oprofileui = "sdk-tools"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofileui = "20 days"
 RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "Nov 14, 2011"
 RECIPE_COMMENTS_pn-oprofileui = ""
-RECIPE_LAST_UPDATE_pn-oprofileui = "Apr 11, 2011"
+RECIPE_LAST_UPDATE_pn-oprofileui = "Dec 30, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-oprofileui = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-oprofileui = "Dexuan Cui <dexuan.cui@intel.com>"
 
@@ -3279,9 +3284,9 @@ RECIPE_MAINTAINER_pn-gnome-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 
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
 
@@ -5572,8 +5577,8 @@ RECIPE_MAINTAINER_pn-matchbox-themes-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-matchbox-wm-2 = "green"
 DISTRO_PN_ALIAS_pn-matchbox-wm-2 = "Mandriva=matchbox-window-manager Debian=matchbox-window-manager"
-RECIPE_LATEST_VERSION_pn-matchbox-wm-2 = "0.0+svnr2106"
-RECIPE_LAST_UPDATE_pn-matchbox-wm-2= "Dec 31, 2010"
+RECIPE_LATEST_VERSION_pn-matchbox-wm-2 = "0.0+svnr01fa"
+RECIPE_LAST_UPDATE_pn-matchbox-wm-2= "Dec 31, 2011"
 RECIPE_MAINTAINER_pn-matchbox-wm-2 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-metacity = "green"
-- 
1.7.6.4



