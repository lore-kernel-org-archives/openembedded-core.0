Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVYDv-0008Ez-U2
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:40:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 16:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81378111"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 16:33:51 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:33:47 -0800
Message-Id: <ada3c6d12ad82d651f25c5f2ea41e971c1cc5fb3.1322606832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
Subject: [PATCH 11/11] distro-tracking-fields: update entries for clutter recipes
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
X-List-Received-Date: Wed, 30 Nov 2011 00:40:32 -0000

Tidy up entries for clutter related recipes
* Update to 1.8 namespace
* Move to same section of file for easier maintenance as a unit
* Update for recent recipe upgrades
* Assign myself as maintainer

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   68 ++++++++-----------
 1 files changed, 29 insertions(+), 39 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c07341e..4661264 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2391,7 +2391,7 @@ RECIPE_LATEST_VERSION_pn-task-core-clutter="1.0"
 RECIPE_NO_OF_PATCHES_pn-task-core-clutter="0"
 RECIPE_LATEST_RELEASE_DATE_pn-task-core-clutter="n/a"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-clutter="n/a"
-RECIPE_MAINTAINER_pn-task-core-clutter = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_MAINTAINER_pn-task-core-clutter = "Joshua Lock <josh@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-task-core-clutter = "OE-Core"
 
 RECIPE_STATUS_pn-task-core-boot="green"
@@ -2705,12 +2705,6 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libmusicbrainz="2 years"
 RECIPE_LAST_UPDATE_pn-libmusicbrainz = "Nov 16, 2010"
 RECIPE_MAINTAINER_pn-libmusicbrainz = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-clutter-gst-1.6 = "red"
-DISTRO_PN_ALIAS_pn-clutter-gst-1.6 = "Fedora=clutter-gst Debian=libclutter-gst"
-RECIPE_LATEST_VERSION_pn-clutter-gst-1.6 = "1.3.8"
-RECIPE_LAST_UPDATE_pn-clutter-gst-1.6 = "Mar 28, 2011"
-RECIPE_MAINTAINER_pn-clutter-gst-1.6 = "Dongxiao Xu <dongxiao.xu@intel.com>"
-
 RECIPE_STATUS_pn-farsight2 = "red"
 RECIPE_LATEST_VERSION_pn-farsight2 = "0.0.20"
 RECIPE_LAST_UPDATE_pn-farsight2 = "Aug 19, 2009"
@@ -5445,26 +5439,6 @@ RECIPE_LAST_UPDATE_pn-gtk-engines = "Dec 1, 2010"
 RECIPE_NO_UPDATE_REASON_pn-gtk-engines = "Do not upgrade to version: 2.91.1 because prefer stable tree"
 RECIPE_MAINTAINER_pn-gtk-engines = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-clutter-box2d-1.6 = "red"
-RECIPE_LATEST_VERSION_pn-clutter-box2d-1.6 = "0.10.0"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d-1.6 = "Jun 28, 2011"
-RECIPE_LAST_UPDATE_pn-clutter-box2d-1.6 = "Mar 28, 2011"
-RECIPE_MAINTAINER_pn-clutter-box2d-1.6 = "Zhai Edwin <edwin.zhai@intel.com>"
-DISTRO_PN_ALIAS_pn-clutter-box2d-1.6 = "OpenedHand"
-
-RECIPE_STATUS_pn-clutter-box2d = "red"
-RECIPE_LATEST_VERSION_pn-clutter-box2d = "0.10.0"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d = "Jun 28, 2011"
-RECIPE_LAST_UPDATE_pn-clutter-box2d = "Mar 28, 2011"
-RECIPE_MAINTAINER_pn-clutter-box2d = "Zhai Edwin <edwin.zhai@intel.com>"
-DISTRO_PN_ALIAS_pn-clutter-box2d = "OpenedHand"
-
-
-RECIPE_STATUS_pn-clutter-gtk-1.4 = "red"
-DISTRO_PN_ALIAS_pn-clutter-gtk-1.4 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-RECIPE_LATEST_VERSION_pn-clutter-gtk-1.4 = "0.90.0+git0+e8d828ba1d87937baa571e68fdff22f3e2d79ca8"
-RECIPE_MAINTAINER_pn-clutter-gtk-1.4 = "Zhai Edwin <edwin.zhai@intel.com>"
-
 RECIPE_STATUS_pn-tidy = "red"
 RECIPE_LATEST_VERSION_pn-tidy = "0.1.0+git0+e25416e1293e1074bfa6727c80527dcff5b1f3cb"
 RECIPE_LAST_UPDATE_pn-tidy = "Dec 18, 2008"
@@ -5480,18 +5454,34 @@ RECIPE_LATEST_VERSION_pn-libgalago = "0.5.2"
 RECIPE_LAST_UPDATE_pn-libgalago = "Apr 11, 2007"
 RECIPE_MAINTAINER_pn-libgalago = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-clutter-1.6 = "red"
-DISTRO_PN_ALIAS_pn-clutter-1.6 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
-RECIPE_LATEST_VERSION_pn-clutter-1.6 = "1.6.14"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.6 = "Jun 28, 2011"
-RECIPE_LAST_UPDATE_pn-clutter-1.6 = "Apr 19, 2011"
-RECIPE_MAINTAINER_pn-clutter-1.6 = "Zhai Edwin <edwin.zhai@intel.com>"
-
-RECIPE_STATUS_pn-clutter = "red"
-DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-RECIPE_LATEST_VERSION_pn-clutter = "1.6.14"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter = "Jun 28, 2011"
-RECIPE_MAINTAINER_pn-clutter = "Zhai Edwin <edwin.zhai@intel.com>"
+RECIPE_STATUS_pn-cogl = "green"
+DISTRO_PN_ALIAS_pn-cogl = "Fedora=cogl OpenSuse=cogl Ubuntu=cogl Mandriva=cogl Debian=cogl"
+RECIPE_LATEST_VERSION_pn-cogl = "1.8.0"
+RECIPE_MANUAL_CHECK_DATE_pn-cogl = "Nov 9, 2011"
+RECIPE_LAST_UPDATE_pn-cogl = "Nov 9, 2011"
+
+RECIPE_STATUS_pn-clutter-1.8 = "green"
+DISTRO_PN_ALIAS_pn-clutter-1.8 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
+RECIPE_LATEST_VERSION_pn-clutter-1.8 = "1.8.0"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.8 = "Nov 9, 2011"
+RECIPE_LAST_UPDATE_pn-clutter-1.8 = "Nov 9, 2011"
+RECIPE_MAINTAINER_pn-clutter-1.8 = "Joshua Lock <josh@linux.intel.com>"
+
+RECIPE_STATUS_pn-clutter-gtk-1.8 = "red"
+DISTRO_PN_ALIAS_pn-clutter-gtk-1.8 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
+RECIPE_LATEST_VERSION_pn-clutter-gtk-1.8 = "0.11.4"
+RECIPE_MAINTAINER_pn-clutter-gtk-1.8 = "Joshua Lock <josh@linux.intel.com>"
+
+RECIPE_STATUS_pn-clutter-gst-1.8 = "red"
+DISTRO_PN_ALIAS_pn-clutter-gst-1.8 = "Fedora=clutter-gst Debian=libclutter-gst"
+RECIPE_LATEST_VERSION_pn-clutter-gst-1.8 = "1.4.2"
+RECIPE_LAST_UPDATE_pn-clutter-gst-1.8 = "Nov 09, 2011"
+RECIPE_MAINTAINER_pn-clutter-gst-1.8 = "Joshua Lock <josh@linux.intel.com>"
+
+RECIPE_STATUS_pn-clutter-box2d = "red"
+RECIPE_LATEST_VERSION_pn-clutter-box2d = "10.0.0"
+RECIPE_LAST_UPDATE_pn-clutter-box2d = "Nov 29, 2011"
+RECIPE_MAINTAINER_pn-clutter-box2d = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-libgnomekbd = "red"
 RECIPE_LATEST_VERSION_pn-libgnomekbd = "2.31.1"
-- 
1.7.7.3



