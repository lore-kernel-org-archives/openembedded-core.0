Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RFLW2-00028G-HI
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Oct 2011 09:52:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2011 00:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="63341617"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by orsmga001.jf.intel.com with ESMTP; 16 Oct 2011 00:46:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Oct 2011 00:46:16 -0700
Message-Id: <61bbe287c95a4567c49a22069ee2cc0af7bfeb69.1318751027.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318751027.git.sgw@linux.intel.com>
References: <cover.1318751027.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/14] Distro Tracking: Fix dates
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
X-List-Received-Date: Sun, 16 Oct 2011 07:52:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index eeac5d2..abc2cbf 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3447,32 +3447,32 @@ DISTRO_PN_ALIAS_pn-imake = "Mandriva=xutils Ubuntu=xutils"
 RECIPE_STATUS_pn-qt4-tools-native = "green" # no update needed
 RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.4"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "2011/09/01"
-RECIPE_LAST_UPDATE_pn-qt4-tools-native = "September 10, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "Sep 01, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-tools-native = "Sep 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-native = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-native = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-tools-nativesdk = "green"
 RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.7.4"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "2011/09/01"
-RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "September 10, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "Sep 01, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "Sep 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-nativesdk = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-nativesdk = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-embedded = "green"
 RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.4"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "2011/09/01"
-RECIPE_LAST_UPDATE_pn-qt4-embedded = "September 10, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "Sep 01, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-embedded = "Sep 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-embedded = "OSPDT"
 
 RECIPE_STATUS_pn-qt4-x11-free = "green"
 RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.4"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "2011/09/01"
-RECIPE_LAST_UPDATE_pn-qt4-x11-free = "September 10, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "Sep 01, 2011"
+RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Sep 10, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com"
 DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
 
-- 
1.7.6.2



