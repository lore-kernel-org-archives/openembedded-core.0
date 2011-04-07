Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q7mUJ-0002Re-Vk
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 12:30:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Apr 2011 03:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,315,1299484800"; d="scan'208";a="730280356"
Received: from unknown (HELO helios) ([10.255.13.38])
	by orsmga001.jf.intel.com with SMTP; 07 Apr 2011 03:27:41 -0700
Received: by helios (sSMTP sendmail emulation); Thu, 07 Apr 2011 11:27:40 +0100
Message-Id: <2293220e47f6a671ac752ac446b543533a0fce83.1302171837.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1302171837.git.paul.eggleton@linux.intel.com>
References: <cover.1302171837.git.paul.eggleton@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 11:18:08 +0100
Date: Thu, 07 Apr 2011 11:27:40 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] Update distro-tracking-fields.inc for recent qt4 changes
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
X-List-Received-Date: Thu, 07 Apr 2011 10:30:56 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

* Add qt4-embedded and qt4-tools-native
* Latest version is 4.7.2
* Move all qt4 definitions to the same place

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   39 ++++++++++++++------
 1 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cadfac2..522295a 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3336,15 +3336,35 @@ RECIPE_LAST_UPDATE_pn-imake = "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-imake = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-qt4-tools-native = "green" # no update needed
-RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.6.3"
-RECIPE_NO_OF_PATCHES_pn-qt4-tools-native = "3"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "4 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "2010/06/02"
-RECIPE_INTEL_SECTION_pn-qt4-tools-native = "graphic app"
-RECIPE_LAST_UPDATE_pn-qt4-tools-native = "Aug 25, 2010"
-RECIPE_MAINTAINER_pn-qt4-tools-native = "Yu Ke <ke.yu@intel.com>"
+RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "2011/03/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-native = "Apr 6, 2011"
+RECIPE_MAINTAINER_pn-qt4-tools-native = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-native = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
+RECIPE_STATUS_pn-qt4-tools-nativesdk = "green"
+RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.7.2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "2011/03/01"
+RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "Apr 6, 2011"
+RECIPE_MAINTAINER_pn-qt4-tools-nativesdk = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+
+RECIPE_STATUS_pn-qt4-embedded = "green"
+RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "2011/03/01"
+RECIPE_LAST_UPDATE_pn-qt4-embedded = "Apr 6, 2011"
+RECIPE_MAINTAINER_pn-qt4-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+
+RECIPE_STATUS_pn-qt4-x11-free = "green"
+RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.2"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "2011/03/01"
+RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Apr 6, 2011"
+RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com"
+DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
+
 RECIPE_STATUS_pn-quicky = "green" # no update needed
 RECIPE_LATEST_VERSION_pn-quicky = "0.4"
 RECIPE_NO_OF_PATCHES_pn-quicky = "0"
@@ -5334,11 +5354,6 @@ RECIPE_LATEST_VERSION_pn-mutter = "2.29.1_0.4"
 RECIPE_LAST_UPDATE_pn-mutter = "Jan 13, 2010"
 RECIPE_MAINTAINER_pn-mutter = "Edwin Zhai <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-qt4-x11-free = "green"
-DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
-RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.6.3"
-RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Aug 25, 2010"
-RECIPE_MAINTAINER_pn-qt4-x11-free = "Yu Ke <ke.yu@intel.com>"
 DISTRO_PN_ALIAS_pn-poky-feed-config-opkg = "Poky"
 DISTRO_PN_ALIAS_pn-poky-image-base = "Poky"
 DISTRO_PN_ALIAS_pn-poky-image-basic = "Poky"
-- 
1.7.1



