Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iH-0001ng-NN
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065344"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:24 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:14:58 -0700
Message-Id: <0700ea83098d8002ec0a8d61765886c648526a0a.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 04/28] distro-tracking: update for guile automake & autoconf
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
X-List-Received-Date: Thu, 03 May 2012 18:25:13 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f74c8d3..beddd03 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -48,9 +48,9 @@ RECIPE_LAST_UPDATE_pn-libunistring = "Jan 17, 2012"
 RECIPE_MANUAL_CHECK_DATE_pn-libunistring = "Jan 17, 2012"
 RECIPE_MAINTAINER_pn-libunistring = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
-RECIPE_LATEST_VERSION_pn-guile = "2.0.3"
-RECIPE_LAST_UPDATE_pn-guile = "Jan 17, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-guile = "Jan 17, 2012"
+RECIPE_LATEST_VERSION_pn-guile = "2.0.5"
+RECIPE_LAST_UPDATE_pn-guile = "May 03, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-guile = "May 03, 2012"
 RECIPE_MAINTAINER_pn-guile = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-autogen = "5.12"
@@ -3128,16 +3128,17 @@ RECIPE_LATEST_VERSION_pn-gcc-runtime = "4.6.2+git"
 RECIPE_LAST_UPDATE_pn-gcc-runtime = "May 1, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-gcc-runtime = "Jan 10, 2012"
 
-RECIPE_STATUS_pn-autoconf="red"
-RECIPE_LATEST_VERSION_pn-autoconf="2.68"
-RECIPE_LAST_UPDATE_pn-autoconf = "Jan 29, 2010"
+RECIPE_STATUS_pn-autoconf="green"
+RECIPE_LATEST_VERSION_pn-autoconf="2.69"
+RECIPE_LAST_UPDATE_pn-autoconf = "May 03, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-autoconf = "May 03, 2012"
 RECIPE_NO_UPDATE_REASON_pn-autoconf="seeing rpm issue with the 2.68 version, a bug is open"
 RECIPE_MAINTAINER_pn-autoconf = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-automake="green"
-RECIPE_LATEST_VERSION_pn-automake="1.11.3"
-RECIPE_LAST_UPDATE_pn-automake = "Mar 14, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-automake = "Mar 14, 2012"
+RECIPE_LATEST_VERSION_pn-automake="1.12"
+RECIPE_LAST_UPDATE_pn-automake = "May 03, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-automake = "May 03, 2012"
 RECIPE_MAINTAINER_pn-automake = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-bison="green"
-- 
1.7.7



