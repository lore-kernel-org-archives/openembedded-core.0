Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RYJu9-0001Jz-9A
	for openembedded-core@openembedded.org; Wed, 07 Dec 2011 16:59:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2011 07:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,313,1320652800"; d="scan'208";a="99675626"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2011 07:51:27 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@openembedded.org
Date: Wed,  7 Dec 2011 23:49:18 +0800
Message-Id: <b04e532ab7059be02bf6b27392469b5613de426c.1323272370.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1323272370.git.lei.mei@intel.com>
References: <cover.1323272370.git.lei.mei@intel.com>
In-Reply-To: <cover.1323272370.git.lei.mei@intel.com>
References: <cover.1323272370.git.lei.mei@intel.com>
Subject: [PATCH 2/2] distro_tracking_fields.inc: Update dropbear, iproute2, net-tools tracking information.
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
X-List-Received-Date: Wed, 07 Dec 2011 15:59:34 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f53fffa..890340b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -848,14 +848,15 @@ DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 
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
+RECIPE_NO_UPDATE_REASON_pn-iproute2="3.1.0 is the latest version, not 050607"
 RECIPE_COMMENTS_pn-iproute2 = ""
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
-RECIPE_LAST_UPDATE_pn-iproute2 = "Nov 10, 2010"
+RECIPE_LAST_UPDATE_pn-iproute2 = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-iproute2 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-netbase = "green"
@@ -1062,6 +1063,7 @@ RECIPE_MAINTAINER_pn-ethtool = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-net-tools = "green"
 RECIPE_LAST_UPDATE_pn-net-tools = "Aug 16, 2010"
 RECIPE_LATEST_VERSION_pn-net-tools = "1.60-23"
+RECIPE_NO_UPDATE_REASON_pn-net-tools="1.60 is the latest version, 1.60-23 just its patch version"
 RECIPE_MAINTAINER_pn-net-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_LATEST_VERSION_pn-net-tools = "1.60-23"
 
@@ -1608,10 +1610,10 @@ RECIPE_COMMENTS_pn-nfs-utils = ""
 
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
@@ -1619,10 +1621,9 @@ RECIPE_PATCH_pn-dropbear+allow-nopw = "allow login with no password, applied on
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



