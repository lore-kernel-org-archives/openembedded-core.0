Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1SXTvu-0008W9-92
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 11:02:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 May 2012 01:50:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170770234"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga002.fm.intel.com with ESMTP; 24 May 2012 01:50:45 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 17:16:01 +0800
Message-Id: <53b31c2c9ee9ee4dd96dd609b10a9d798b1620cd.1337850757.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <c98a7b9f490e2b7ce80ceb8101e58a3401a8e072.1337850757.git.jiajun.xu@intel.com>
References: <c98a7b9f490e2b7ce80ceb8101e58a3401a8e072.1337850757.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1337850757.git.jiajun.xu@intel.com>
References: <cover.1337850757.git.jiajun.xu@intel.com>
Subject: [PATCH 2/2] distro_tracking_fields: update information for ltp
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
X-List-Received-Date: Thu, 24 May 2012 09:02:10 -0000

Update information for recipe ltp 20120401

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 8b8eeaa..518fc7f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -6438,12 +6438,12 @@ RECIPE_MAINTAINER_pn-socat = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-socat = "2.0.0 is beta"
 
 RECIPE_STATUS_pn-ltp = "green"
-RECIPE_LATEST_VERSION_pn-ltp = "20110915"
-RECIPE_LATEST_RELEASE_DATE_pn-ltp = "Sep 15, 2011"
+RECIPE_LATEST_VERSION_pn-ltp = "20120401"
+RECIPE_LATEST_RELEASE_DATE_pn-ltp = "Apr 01, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ltp = "3 months"
 RECIPE_NO_OF_PATCHES_pn-ltp = "0"
-RECIPE_LAST_UPDATE_pn-ltp = "Dec 22, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-ltp = "Mar 13, 2012"
+RECIPE_LAST_UPDATE_pn-ltp = "May 24, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-ltp = "May 24, 2012"
 RECIPE_MAINTAINER_pn-ltp = "Jiajun Xu <jiajun.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-ltp = "Ubuntu=ltp"
 
-- 
1.7.1



