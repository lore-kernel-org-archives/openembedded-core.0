Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1R9YMl-0007IC-Gv
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 10:22:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Sep 2011 01:16:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,465,1312182000"; d="scan'208";a="57288689"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 30 Sep 2011 01:16:12 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 16:16:08 +0800
Message-Id: <b4b6d355692cf04e6f8c6292424449188646c7de.1317370299.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
Subject: [PATCH 4/4] distro_tracking_fields.inc: Update upgrade information
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
X-List-Received-Date: Fri, 30 Sep 2011 08:22:43 -0000

Update dropbear,diffutils,curl upgrade tracking information.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   25 ++++++++++---------
 1 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 47fa7bf..dd0fbf8 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1,8 +1,7 @@
 RECIPE_STATUS_pn-diffutils = "green"
-RECIPE_LATEST_VERSION_pn-diffutils = "3.0"
-RECIPE_LAST_UPDATE_pn-diffutils = "Dec 10, 2010"
-RECIPE_NO_UPDATE_REASON_pn-diffutils = "3.0 is the latest version"
-RECIPE_MANUAL_CHECK_DATE_pn-diffutils = "Jul 4, 2011"
+RECIPE_LATEST_VERSION_pn-diffutils = "3.2"
+RECIPE_LAST_UPDATE_pn-diffutils = "Sep 30, 2011"
+RECIPE_NO_UPDATE_REASON_pn-diffutils = "3.2 is the latest version"
 RECIPE_MAINTAINER_pn-diffutils = "Mei Lei <lei.mei@intel.com>"
 
 RECIPE_STATUS_pn-epdfview = "red"
@@ -1463,15 +1462,15 @@ RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Sep 27, 2011"
 RECIPE_COMMENTS_pn-sysfsutils = ""
 
 RECIPE_STATUS_pn-curl = "green"
-RECIPE_LAST_UPDATE_pn-curl = "Jul 2, 2011"
+RECIPE_LAST_UPDATE_pn-curl = "Sep 30, 2011"
 RECIPE_MAINTAINER_pn-curl = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-curl = "not done"
-RECIPE_LATEST_VERSION_pn-curl = "7.21.1"
+RECIPE_LATEST_VERSION_pn-curl = "7.22.0"
 RECIPE_PATCH_pn-curl+noldlibpath = "no bother set LD_LIBRARY_PATH since we are cross compiling"
 RECIPE_PATCH_pn-curl+pkgconfig-fix = "fix libcurl.pc"
 RECIPE_INTEL_SECTION_pn-curl = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-curl = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-curl = "06/2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-curl = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-curl = "09/2011"
 RECIPE_COMMENTS_pn-curl = ""
 
 RECIPE_STATUS_pn-gconf-dbus = "green"
@@ -1579,19 +1578,21 @@ RECIPE_COMMENTS_pn-nfs-utils = ""
 
 RECIPE_STATUS_pn-dropbear = "green"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
-RECIPE_LAST_UPDATE_pn-dropbear = "Jul 5, 2010"
+RECIPE_LAST_UPDATE_pn-dropbear = "Sep 30, 2011"
 RECIPE_MAINTAINER_pn-dropbear = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-dropbear = "not done"
-RECIPE_LATEST_VERSION_pn-dropbear = "0.52"
+RECIPE_LATEST_VERSION_pn-dropbear = "0.53.1"
 RECIPE_PATCH_pn-dropbear+urandom-xauth-changes-to-options.h = "xauth path change"
 RECIPE_PATCH_pn-dropbear+configure = "use configure cache value for cross compiling"
 RECIPE_PATCH_pn-dropbear+fix-skb-keys = "enlarge key buffer size"
 RECIPE_PATCH_pn-dropbear+allow-nopw = "allow login with no password, applied on in occasions"
 RECIPE_PATCH_pn-dropbear+init = "init script"
+RECIPE_PATCH_pn-dropbear+dropbear-0.53.1-static_build_fix = "fix link error in 0.53.1 release"
 RECIPE_INTEL_SECTION_pn-dropbear = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dropbear = "8 months"
-RECIPE_LATEST_RELEASE_DATE_pn-dropbear = "11/2008"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dropbear = "1 month"
+RECIPE_LATEST_RELEASE_DATE_pn-dropbear = "03/2011"
 RECIPE_COMMENTS_pn-dropbear = ""
+RECIPE_NO_UPDATE_REASON_pn-dropbear="0.53.1 is the latest version,not 0.255"
 
 RECIPE_STATUS_pn-hal = "green"
 RECIPE_LAST_UPDATE_pn-hal = "Jul 20, 2010"
-- 
1.7.0.4



