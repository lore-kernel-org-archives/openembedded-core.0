Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEm-00068T-Vo
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 May 2011 18:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; 
   d="scan'208";a="2310644"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2011 18:32:24 -0700
Message-Id: <d6a464b8ba49142540811cf41b78157a2300ca5b.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 10:17:16 +0100
Date: Sat, 14 May 2011 18:32:24 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 05/15] distro_tracking_fields.inc: update for qt 4.7.3 upgrade
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
X-List-Received-Date: Sun, 15 May 2011 01:35:17 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d9fe02c..ad45b94 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3352,32 +3352,32 @@ RECIPE_LAST_UPDATE_pn-imake = "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-imake = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-qt4-tools-native = "green" # no update needed
-RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.2"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "2011/03/01"
-RECIPE_LAST_UPDATE_pn-qt4-tools-native = "Apr 6, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.3"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-native = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-native = "2011/05/04"
+RECIPE_LAST_UPDATE_pn-qt4-tools-native = "May 12, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-native = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-tools-native = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-tools-nativesdk = "green"
-RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.7.2"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "2011/03/01"
-RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "Apr 6, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-tools-nativesdk = "4.7.3"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "2011/05/04"
+RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "May 12, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-nativesdk = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 
 RECIPE_STATUS_pn-qt4-embedded = "green"
-RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.2"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "2011/03/01"
-RECIPE_LAST_UPDATE_pn-qt4-embedded = "Apr 6, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.3"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "2011/05/04"
+RECIPE_LAST_UPDATE_pn-qt4-embedded = "May 12, 2011"
 RECIPE_MAINTAINER_pn-qt4-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 
 RECIPE_STATUS_pn-qt4-x11-free = "green"
-RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.2"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "2011/03/01"
-RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Apr 6, 2011"
+RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.3"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "2011/05/04"
+RECIPE_LAST_UPDATE_pn-qt4-x11-free = "May 12, 2011"
 RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com"
 DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
 
-- 
1.7.1.1



