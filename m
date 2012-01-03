Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Ri4je-0007dr-Jg
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 14:49:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 05:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92470675"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.79])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 05:41:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 13:41:34 +0000
Message-Id: <5c56d82de57d408fc0e190223a9e939e455aae95.1325597850.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325597850.git.paul.eggleton@linux.intel.com>
References: <cover.1325597850.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325597850.git.paul.eggleton@linux.intel.com>
References: <cover.1325597850.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] distro-tracking-fields: update qt recipe info
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
X-List-Received-Date: Tue, 03 Jan 2012 13:49:02 -0000

* Update for Qt 4.8.0
* qt4-tools-native was replaced with qt4-native some time ago

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   38 ++++++++++----------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cc2d9d5..cc87d5c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3528,35 +3528,35 @@ RECIPE_LAST_UPDATE_pn-imake = "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-imake = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-imake = "Mandriva=xutils Ubuntu=xutils"
 
-RECIPE_STATUS_pn-qt4-tools-native = "green" # no update needed
-RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.4"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "Sep 01, 2011"
-RECIPE_LAST_UPDATE_pn-qt4-tools-native = "Sep 10, 2011"
-RECIPE_MAINTAINER_pn-qt4-tools-native = "Paul Eggleton <paul.eggleton@linux.intel.com>"
-DISTRO_PN_ALIAS_pn-qt4-tools-native = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
+RECIPE_STATUS_pn-qt4-native = "green" # no update needed
+RECIPE_LATEST_VERSION_pn-qt4-native = "4.8.0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-native = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-native = "Dec 15, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-native = "Dec 15, 2011"
+RECIPE_MAINTAINER_pn-qt4-native = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-qt4-native = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-tools-nativesdk = "green"
-RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.7.4"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "Sep 01, 2011"
-RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "Sep 10, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.8.0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "Dec 15, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "Dec 15, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-nativesdk = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-nativesdk = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-embedded = "green"
-RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.4"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "Sep 01, 2011"
-RECIPE_LAST_UPDATE_pn-qt4-embedded = "Sep 10, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.8.0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "Dec 15, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-embedded = "Dec 15, 2011"
 RECIPE_MAINTAINER_pn-qt4-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-embedded = "OSPDT"
 
 RECIPE_STATUS_pn-qt4-x11-free = "green"
-RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.4"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "Sep 01, 2011"
-RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Sep 10, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.8.0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "Dec 15, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Dec 15, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com"
 DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
 
-- 
1.7.5.4



