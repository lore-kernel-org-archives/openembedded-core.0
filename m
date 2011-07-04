Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qdc5r-0006k6-6M
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 07:53:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2011 22:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,471,1304319600"; d="scan'208";a="22323866"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2011 22:49:27 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 14:04:38 +0800
Message-Id: <44c9ebce73253376f7494132c4fa66d81d814261.1309707957.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1309707957.git.lei.mei@intel.com>
References: <cover.1309707957.git.lei.mei@intel.com>
In-Reply-To: <cover.1309707957.git.lei.mei@intel.com>
References: <cover.1309707957.git.lei.mei@intel.com>
Subject: [PATCH 2/2] distro_tracking_fields.inc: update recipes upgrade information
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
X-List-Received-Date: Mon, 04 Jul 2011 05:53:15 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ad64581..f6ae137 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1043,11 +1043,11 @@ RECIPE_LAST_UPDATE_pn-shadow = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-shadow = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-coreutils = "green"
-RECIPE_LAST_UPDATE_pn-coreutils = "Jan 20, 2011"
+RECIPE_LAST_UPDATE_pn-coreutils = "Jul 2, 2011"
 RECIPE_MAINTAINER_pn-coreutils = "Mei Lei <lei.mei@intel.com>"
 RECIPE_INTEL_SECTION_pn-coreutils = "base utils"
-RECIPE_LATEST_VERSION_pn-coreutils = "8.9"
-RECIPE_LATEST_RELEASE_DATE_pn-coreutils = "01/2011"
+RECIPE_LATEST_VERSION_pn-coreutils = "8.12"
+RECIPE_LATEST_RELEASE_DATE_pn-coreutils = "04/2011"
 
 RECIPE_STATUS_pn-libuser = "green"
 RECIPE_LAST_UPDATE_pn-libuser = "Jan 26, 2011"
@@ -1442,15 +1442,15 @@ RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "May 24, 2011"
 RECIPE_COMMENTS_pn-sysfsutils = ""
 
 RECIPE_STATUS_pn-curl = "green"
-RECIPE_LAST_UPDATE_pn-curl = "Nov 9, 2010"
+RECIPE_LAST_UPDATE_pn-curl = "Jul 2, 2011"
 RECIPE_MAINTAINER_pn-curl = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-curl = "not done"
-RECIPE_LATEST_VERSION_pn-curl = "7.21.0"
+RECIPE_LATEST_VERSION_pn-curl = "7.21.1"
 RECIPE_PATCH_pn-curl+noldlibpath = "no bother set LD_LIBRARY_PATH since we are cross compiling"
 RECIPE_PATCH_pn-curl+pkgconfig-fix = "fix libcurl.pc"
 RECIPE_INTEL_SECTION_pn-curl = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-curl = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-curl = "06/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-curl = "06/2011"
 RECIPE_COMMENTS_pn-curl = ""
 
 RECIPE_STATUS_pn-gconf-dbus = "green"
-- 
1.6.3.3



