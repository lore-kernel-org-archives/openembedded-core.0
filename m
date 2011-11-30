Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RVdJV-0007g2-11
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 07:06:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 21:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,595,1315206000"; d="scan'208";a="90460149"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2011 21:58:49 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Wed, 30 Nov 2011 13:57:54 +0800
Message-Id: <f51667062ba70fd10984b2fe7aefca0927cbbd96.1322619553.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322619553.git.lei.mei@intel.com>
References: <cover.1322619553.git.lei.mei@intel.com>
In-Reply-To: <cover.1322619553.git.lei.mei@intel.com>
References: <cover.1322619553.git.lei.mei@intel.com>
Subject: [PATCH 3/3] distro_tracking_fields.inc: Update dropbear, iproute2, net-tools tracking information.
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
X-List-Received-Date: Wed, 30 Nov 2011 06:06:37 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c07341e..d94e1c5 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -846,14 +846,15 @@ DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 
 RECIPE_STATUS_pn-iproute2 = "green"
 RECIPE_DEPENDENCY_CHECK_pn-iproute2 = "not done"
-RECIPE_LATEST_VERSION_pn-iproute2 = "2.6.34"
+RECIPE_LATEST_VERSION_pn-iproute2 = "3.1.0"
 RECIPE_PATCH_pn-iproute2+configure-cross = "to be pushed upstream"
 RECIPE_INTEL_SECTION_pn-iproute2 = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-iproute2 = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-iproute2 = "May 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-iproute2 = "1 months"
+RECIPE_LATEST_RELEASE_DATE_pn-iproute2 = "Nov 17, 2011"
+RECIPE_NO_UPDATE_REASON_pn-iproute2="3.1.0 is the latest version, not 760"
 RECIPE_COMMENTS_pn-iproute2 = ""
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
-RECIPE_LAST_UPDATE_pn-iproute2 = "Nov 10, 2010"
+RECIPE_LAST_UPDATE_pn-iproute2 = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-iproute2 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-netbase = "green"
@@ -1060,6 +1061,7 @@ RECIPE_MAINTAINER_pn-ethtool = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-net-tools = "green"
 RECIPE_LAST_UPDATE_pn-net-tools = "Aug 16, 2010"
 RECIPE_LATEST_VERSION_pn-net-tools = "1.60-23"
+RECIPE_NO_UPDATE_REASON_pn-net-tools="1.60 is the latest version, 1.60-23 just its patch version"
 RECIPE_MAINTAINER_pn-net-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_LATEST_VERSION_pn-net-tools = "1.60-23"
 
@@ -1603,21 +1605,19 @@ RECIPE_COMMENTS_pn-nfs-utils = ""
 
 RECIPE_STATUS_pn-dropbear = "green"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
-RECIPE_LAST_UPDATE_pn-dropbear = "Sep 30, 2011"
+RECIPE_LAST_UPDATE_pn-dropbear = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-dropbear = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-dropbear = "not done"
-RECIPE_LATEST_VERSION_pn-dropbear = "0.53.1"
+RECIPE_LATEST_VERSION_pn-dropbear = "2011.54"
 RECIPE_PATCH_pn-dropbear+urandom-xauth-changes-to-options.h = "xauth path change"
 RECIPE_PATCH_pn-dropbear+configure = "use configure cache value for cross compiling"
 RECIPE_PATCH_pn-dropbear+fix-skb-keys = "enlarge key buffer size"
-RECIPE_PATCH_pn-dropbear+allow-nopw = "allow login with no password, applied on in occasions"
 RECIPE_PATCH_pn-dropbear+init = "init script"
 RECIPE_PATCH_pn-dropbear+dropbear-0.53.1-static_build_fix = "fix link error in 0.53.1 release"
 RECIPE_INTEL_SECTION_pn-dropbear = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dropbear = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-dropbear = "Mar 01, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dropbear = "8 month"
+RECIPE_LATEST_RELEASE_DATE_pn-dropbear = "Nov 08, 2011"
 RECIPE_COMMENTS_pn-dropbear = ""
-RECIPE_NO_UPDATE_REASON_pn-dropbear="0.53.1 is the latest version,not 0.255"
 
 RECIPE_STATUS_pn-hal = "green"
 RECIPE_LAST_UPDATE_pn-hal = "Jul 20, 2010"
-- 
1.7.0.4



