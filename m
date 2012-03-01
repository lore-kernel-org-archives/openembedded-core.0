Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S30XH-0007yy-KS
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 08:34:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 23:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113168891"
Received: from unknown (HELO swold-mobl.myhome.westell.com) ([10.255.15.82])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 23:26:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:26:10 -0800
Message-Id: <929bbf4a9e65dcdac3fbfc8f9031987be65948e7.1330586641.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330586641.git.sgw@linux.intel.com>
References: <cover.1330586641.git.sgw@linux.intel.com>
Subject: [PATCH 7/7] distro_tracking: Upgrade and Manual Checks
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
X-List-Received-Date: Thu, 01 Mar 2012 07:34:47 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 3328d96..d8cb150 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1175,7 +1175,7 @@ RECIPE_NO_OF_PATCHES_pn-watchdog = "0"
 RECIPE_INTEL_SECTION_pn-watchdog = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-watchdog = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Dec 28, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Dec 30, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Feb 29, 2012"
 RECIPE_COMMENTS_pn-watchdog = ""
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 
@@ -2013,9 +2013,10 @@ RECIPE_MANUAL_CHECK_DATE_pn-stat = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-stat = "Shane Wang <shane.wang@intel.com>"
 
 RECIPE_STATUS_pn-hdparm = "red"
-RECIPE_LATEST_VERSION_pn-hdparm = "9.37"
-RECIPE_LAST_UPDATE_pn-hdparm = "Dec 30, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Dec 24, 2011"
+RECIPE_LATEST_VERSION_pn-hdparm = "9.39"
+RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Feb 03, 2012"
+RECIPE_LAST_UPDATE_pn-hdparm = "Feb 29, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Feb 29, 2012"
 RECIPE_MAINTAINER_pn-hdparm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-wbxml2 = "red"
@@ -2891,7 +2892,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofile = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-oprofile = "Aug 12, 2011"
 RECIPE_COMMENTS_pn-oprofile = ""
 RECIPE_LAST_UPDATE_pn-oprofile = "Jun 22, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-oprofile = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-oprofile = "Feb 29, 2012"
 RECIPE_MAINTAINER_pn-oprofile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-powertop = "green"
@@ -4355,13 +4356,13 @@ RECIPE_MAINTAINER_pn-xproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liberation-fonts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-liberation-fonts = "not done"
-RECIPE_LATEST_VERSION_pn-liberation-fonts = "1.07.1"
-RECIPE_MANUAL_CHECK_DATE_pn-liberation-fonts = "Nov 30, 2011"
+RECIPE_LATEST_VERSION_pn-liberation-fonts = "1.07.2"
+RECIPE_MANUAL_CHECK_DATE_pn-liberation-fonts = "Feb 29, 2012"
 RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "Do not upgrade to version: 1.07.1 because before doing that, we need adding new native packages like libungif_4.1.3, libspiro and fontforge first"
 RECIPE_NO_OF_PATCHES_pn-liberation-fonts = "0"
 RECIPE_INTEL_SECTION_pn-liberation-fonts = "x11/fonts"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liberation-fonts = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-liberation-fonts = "Sep 21, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-liberation-fonts = "Feb 09, 2012"
 RECIPE_COMMENTS_pn-liberation-fonts = "current version 1.04 released open source under GPLv2 with exceptions"
 RECIPE_LAST_UPDATE_pn-liberation-fonts = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Dexuan Cui <dexuan.cui@intel.com>"
@@ -4713,7 +4714,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
 RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Nov 15, 2011"
 RECIPE_COMMENTS_pn-freetype = ""
 RECIPE_LAST_UPDATE_pn-freetype = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Feb 29, 2012"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-librsvg = "green"
-- 
1.7.7.6



