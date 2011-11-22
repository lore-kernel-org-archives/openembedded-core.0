Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzOA-0003bD-9C
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:30 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292561"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:56 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:47 -0800
Message-Id: <3185bde538c97ae8518da5bc8415d7a647f02fea.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
Subject: [PATCH 04/10] distro-tracking-fields: add entries for clutter-1.8 recipes
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
X-List-Received-Date: Tue, 22 Nov 2011 23:04:30 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   36 ++++++++++++--------
 1 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7dc6f27..3eaf3e6 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2678,10 +2678,10 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libmusicbrainz="2 years"
 RECIPE_LAST_UPDATE_pn-libmusicbrainz = "Nov 16, 2010"
 RECIPE_MAINTAINER_pn-libmusicbrainz = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-clutter-gst-1.6 = "red"
-DISTRO_PN_ALIAS_pn-clutter-gst-1.6 = "Fedora=clutter-gst Debian=libclutter-gst"
-RECIPE_LATEST_VERSION_pn-clutter-gst-1.6 = "1.3.8"
-RECIPE_LAST_UPDATE_pn-clutter-gst-1.6 = "Mar 28, 2011"
+RECIPE_STATUS_pn-clutter-gst-1.8 = "red"
+DISTRO_PN_ALIAS_pn-clutter-gst-1.8 = "Fedora=clutter-gst Debian=libclutter-gst"
+RECIPE_LATEST_VERSION_pn-clutter-gst-1.8 = "1.4.2"
+RECIPE_LAST_UPDATE_pn-clutter-gst-1.6 = "Nov 09, 2011"
 RECIPE_MAINTAINER_pn-clutter-gst-1.6 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-farsight2 = "red"
@@ -5416,10 +5416,12 @@ RECIPE_MAINTAINER_pn-clutter-box2d = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-clutter-box2d = "OpenedHand"
 
 
-RECIPE_STATUS_pn-clutter-gtk-1.4 = "red"
-DISTRO_PN_ALIAS_pn-clutter-gtk-1.4 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-RECIPE_LATEST_VERSION_pn-clutter-gtk-1.4 = "0.90.0+git0+e8d828ba1d87937baa571e68fdff22f3e2d79ca8"
-RECIPE_MAINTAINER_pn-clutter-gtk-1.4 = "Zhai Edwin <edwin.zhai@intel.com>"
+RECIPE_STATUS_pn-clutter-gtk-1.8 = "red"
+DISTRO_PN_ALIAS_pn-clutter-gtk-1.8 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
+RECIPE_LATEST_VERSION_pn-clutter-gtk-1.8 = "0.11.4"
+RECIPE_MAINTAINER_pn-clutter-gtk-1.8 = "Zhai Edwin <edwin.zhai@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d = "Nov 09, 2011"
+RECIPE_LAST_UPDATE_pn-clutter-box2d = "Nov 09, 2011"
 
 RECIPE_STATUS_pn-tidy = "red"
 RECIPE_LATEST_VERSION_pn-tidy = "0.1.0+git0+e25416e1293e1074bfa6727c80527dcff5b1f3cb"
@@ -5436,12 +5438,18 @@ RECIPE_LATEST_VERSION_pn-libgalago = "0.5.2"
 RECIPE_LAST_UPDATE_pn-libgalago = "Apr 11, 2007"
 RECIPE_MAINTAINER_pn-libgalago = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-clutter-1.6 = "red"
-DISTRO_PN_ALIAS_pn-clutter-1.6 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
-RECIPE_LATEST_VERSION_pn-clutter-1.6 = "1.6.14"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.6 = "Jun 28, 2011"
-RECIPE_LAST_UPDATE_pn-clutter-1.6 = "Apr 19, 2011"
-RECIPE_MAINTAINER_pn-clutter-1.6 = "Zhai Edwin <edwin.zhai@intel.com>"
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
+RECIPE_MAINTAINER_pn-clutter-1.8 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-clutter = "red"
 DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-- 
1.7.7.3



