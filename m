Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RVtGR-0003Kh-C8
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:08:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2011 15:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,273,1320652800"; d="scan'208";a="90788555"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2011 15:01:49 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 07:21:39 +0800
Message-Id: <dea69a9b71691c8a6714401e07a2c4c5436704b6.1322695203.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/5] distro_trakcing_fields: update for glib, telepathy-idle, etc
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
X-List-Received-Date: Wed, 30 Nov 2011 23:08:31 -0000

 - glib-2.0
 - telepathy-glib
 - telepathy-idle
 - telepathy-mission-control

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 785114d..60256fd 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -169,15 +169,15 @@ RECIPE_MAINTAINER_pn-libdaemon = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_STATUS_pn-glib-2.0 = "green"
 DISTRO_PN_ALIAS_pn-glib-2.0 = "Meego=glib2 Fedora=glib2 OpenSuSE=glib2 Ubuntu=glib2.0 Mandriva=glib2.0 Debian=glib2.0"
 RECIPE_DEPENDENCY_CHECK_pn-glib-2.0 = "not done"
-RECIPE_LATEST_VERSION_pn-glib-2.0 = "2.28.6"
+RECIPE_LATEST_VERSION_pn-glib-2.0 = "2.30.1"
 RECIPE_PATCH_pn-glib-2.0+60_wait-longer-for-threads-to-die = "to be pushed upstream"
 RECIPE_PATCH_pn-glib-2.0+configure-libtool = "local"
 RECIPE_PATCH_pn-glib-2.0+glib-gettextize-dir = "marked as REMOVAL"
 RECIPE_INTEL_SECTION_pn-glib-2.0 = "base libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glib-2.0 = "15 days"
-RECIPE_LATEST_RELEASE_DATE_pn-glib-2.0 = "Apr 14, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glib-2.0 = "20 days"
+RECIPE_LATEST_RELEASE_DATE_pn-glib-2.0 = "Oct 14, 2011"
 RECIPE_COMMENTS_pn-glib-2.0 = ""
-RECIPE_LAST_UPDATE_pn-glib-2.0 = "Apr 26, 2011"
+RECIPE_LAST_UPDATE_pn-glib-2.0 = "Dec 1, 2011"
 RECIPE_MAINTAINER_pn-glib-2.0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpam = "green"
@@ -2258,18 +2258,18 @@ RECIPE_MAINTAINER_pn-telepathy-gabble = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-glib = "green"
 RECIPE_NO_OF_PATCHES_pn-telepathy-glib ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "Oct 14, 2011"
-RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.16.0"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "Nov 8, 2011"
+RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.17.0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-glib = "10 days"
-RECIPE_LAST_UPDATE_pn-telepathy-glib = "Oct 28, 2011"
+RECIPE_LAST_UPDATE_pn-telepathy-glib = "Dec 1, 2011"
 RECIPE_MAINTAINER_pn-telepathy-glib = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-idle = "green"
 RECIPE_NO_OF_PATCHES_pn-telepathy-idle ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib ="May 11, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib ="Oct 28, 2011"
 RECIPE_LATEST_VERSION_pn-telepathy-idle = "0.1.10"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-idle = "1 months"
-RECIPE_LAST_UPDATE_pn-telepathy-idle = "Oct 28, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-idle = "5 months"
+RECIPE_LAST_UPDATE_pn-telepathy-idle = "Dec 1, 2011"
 RECIPE_MAINTAINER_pn-telepathy-idle = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-python = "green"
@@ -2333,11 +2333,11 @@ RECIPE_LAST_UPDATE_pn-libsyncml = "Jul 31, 2009"
 RECIPE_MAINTAINER_pn-libsyncml = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-mission-control = "green"
-RECIPE_LATEST_VERSION_pn-telepathy-mission-control = "5.9.3"
+RECIPE_LATEST_VERSION_pn-telepathy-mission-control = "5.10.1"
 RECIPE_NO_OF_PATCHES_pn-telepathy-mission-control ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-mission-control ="Apr 10, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-mission-control ="Nov 8, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-mission-control ="1 months"
-RECIPE_LAST_UPDATE_pn-telepathy-mission-control = "Oct 28, 2011"
+RECIPE_LAST_UPDATE_pn-telepathy-mission-control = "Dec 1, 2011"
 RECIPE_MAINTAINER_pn-telepathy-mission-control = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libetpan = "red"
-- 
1.7.1



