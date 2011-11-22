Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzOE-0003bE-5f
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292571"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:57 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:51 -0800
Message-Id: <7187f20a53651ead75fb9c9fd332c54f69327324.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
Subject: [PATCH 08/10] distro_tracking_fields: tidy up and claim clutter recipes
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
X-List-Received-Date: Tue, 22 Nov 2011 23:04:34 -0000

As the last to touch them I'm volunteering to look after them unless
there are objections?

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   31 ++-----------------
 1 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 3eaf3e6..acdaaf4 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2366,7 +2366,7 @@ RECIPE_LATEST_VERSION_pn-task-core-clutter="1.0"
 RECIPE_NO_OF_PATCHES_pn-task-core-clutter="0"
 RECIPE_LATEST_RELEASE_DATE_pn-task-core-clutter="n/a"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-task-core-clutter="n/a"
-RECIPE_MAINTAINER_pn-task-core-clutter = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_MAINTAINER_pn-task-core-clutter = "Joshua Lock <josh@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-task-core-clutter = "OE-Core"
 
 RECIPE_STATUS_pn-task-core-boot="green"
@@ -2682,7 +2682,7 @@ RECIPE_STATUS_pn-clutter-gst-1.8 = "red"
 DISTRO_PN_ALIAS_pn-clutter-gst-1.8 = "Fedora=clutter-gst Debian=libclutter-gst"
 RECIPE_LATEST_VERSION_pn-clutter-gst-1.8 = "1.4.2"
 RECIPE_LAST_UPDATE_pn-clutter-gst-1.6 = "Nov 09, 2011"
-RECIPE_MAINTAINER_pn-clutter-gst-1.6 = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_MAINTAINER_pn-clutter-gst-1.6 = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-farsight2 = "red"
 RECIPE_LATEST_VERSION_pn-farsight2 = "0.0.20"
@@ -5401,27 +5401,10 @@ RECIPE_LAST_UPDATE_pn-gtk-engines = "Dec 1, 2010"
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
 RECIPE_STATUS_pn-clutter-gtk-1.8 = "red"
 DISTRO_PN_ALIAS_pn-clutter-gtk-1.8 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
 RECIPE_LATEST_VERSION_pn-clutter-gtk-1.8 = "0.11.4"
-RECIPE_MAINTAINER_pn-clutter-gtk-1.8 = "Zhai Edwin <edwin.zhai@intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d = "Nov 09, 2011"
-RECIPE_LAST_UPDATE_pn-clutter-box2d = "Nov 09, 2011"
+RECIPE_MAINTAINER_pn-clutter-gtk-1.8 = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-tidy = "red"
 RECIPE_LATEST_VERSION_pn-tidy = "0.1.0+git0+e25416e1293e1074bfa6727c80527dcff5b1f3cb"
@@ -5449,13 +5432,7 @@ DISTRO_PN_ALIAS_pn-clutter-1.8 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter
 RECIPE_LATEST_VERSION_pn-clutter-1.8 = "1.8.0"
 RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.8 = "Nov 9, 2011"
 RECIPE_LAST_UPDATE_pn-clutter-1.8 = "Nov 9, 2011"
-RECIPE_MAINTAINER_pn-clutter-1.8 = "Zhai Edwin <edwin.zhai@intel.com>"
-
-RECIPE_STATUS_pn-clutter = "red"
-DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-RECIPE_LATEST_VERSION_pn-clutter = "1.6.14"
-RECIPE_MANUAL_CHECK_DATE_pn-clutter = "Jun 28, 2011"
-RECIPE_MAINTAINER_pn-clutter = "Zhai Edwin <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-clutter-1.8 = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-libgnomekbd = "red"
 RECIPE_LATEST_VERSION_pn-libgnomekbd = "2.31.1"
-- 
1.7.7.3



