Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOE-00085Q-L1
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115414"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:48 -0700
Message-Id: <245c5264ba4dc39562ccc05861b8b8bf6171b23a.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 09/45] distro_tracking_fields: update information for ltp
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
X-List-Received-Date: Fri, 25 May 2012 06:52:47 -0000

From: Jiajun Xu <jiajun.xu@intel.com>

Update information for recipe ltp 20120401

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5afe38f..a64316f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -6436,12 +6436,12 @@ RECIPE_MAINTAINER_pn-socat = "Saul Wold <sgw@linux.intel.com>"
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
1.7.7.6



