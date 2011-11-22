Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RSjhu-0005uW-Sb
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 07:19:51 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Nov 2011 22:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,551,1315206000"; d="scan'208";a="77836062"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 21 Nov 2011 22:12:14 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:24:45 +0800
Message-Id: <4cd1eab8637fde3048fa07c8fe6f52a9fb4409bf.1321942564.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1321942564.git.shane.wang@intel.com>
References: <cover.1321942564.git.shane.wang@intel.com>
In-Reply-To: <cover.1321942564.git.shane.wang@intel.com>
References: <cover.1321942564.git.shane.wang@intel.com>
Subject: [PATCH 1/1] distro_tracking: update manual checks for recipes
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
X-List-Received-Date: Tue, 22 Nov 2011 06:19:52 -0000

Updating manual checks for hdparm, screen, watchdog, freetype, oprofile, and tcf-agent.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7dc6f27..bf6489c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1016,7 +1016,7 @@ RECIPE_MAINTAINER_pn-mdadm = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-screen = "green"
 RECIPE_DEPENDENCY_CHECK_pn-screen = "not done"
 RECIPE_LATEST_VERSION_pn-screen = "4.0.3"
-RECIPE_MANUAL_CHECK_DATE_pn-screen = "June 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-screen = "Nov 17, 2011"
 RECIPE_NO_OF_PATCHES_pn-screen = "2"
 RECIPE_PATCH_pn-screen+screen_4.0.3-11+lenny1.diff.gz = "Debian's enhancement"
 RECIPE_PATCH_pn-screen+configure = "fix configure.in to make the build pass"
@@ -1134,6 +1134,7 @@ RECIPE_NO_OF_PATCHES_pn-watchdog = "0"
 RECIPE_INTEL_SECTION_pn-watchdog = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-watchdog = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Jun 01, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Nov 17, 2011"
 RECIPE_COMMENTS_pn-watchdog = ""
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 
@@ -1944,8 +1945,9 @@ RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-hdparm = "red"
-RECIPE_LATEST_VERSION_pn-hdparm = "6.3"
-RECIPE_LAST_UPDATE_pn-hdparm = "Jul 21, 2006"
+RECIPE_LATEST_VERSION_pn-hdparm = "9.37"
+RECIPE_LAST_UPDATE_pn-hdparm = "Jan 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-hdparm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-wbxml2 = "red"
@@ -2792,6 +2794,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofile = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-oprofile = "Nov 24, 2009"
 RECIPE_COMMENTS_pn-oprofile = ""
 RECIPE_LAST_UPDATE_pn-oprofile = "Jun 22, 2010"
+RECIPE_MANUAL_CHECK_DATE-oprofile = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-oprofile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-powertop = "green"
@@ -2837,6 +2840,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcf-agent = "1+ years"
 RECIPE_LATEST_RELEASE_DATE_pn-tcf-agent = "Jul 07, 2011"
 RECIPE_COMMENTS_pn-tcf-agent = ""
 RECIPE_LAST_UPDATE_pn-tcf-agent = "Jul 21, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-tcf-agent = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liburcu = "green"
@@ -4587,7 +4591,7 @@ RECIPE_MAINTAINER_pn-fontconfig = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-freetype = "green"
 RECIPE_DEPENDENCY_CHECK_pn-freetype = "not done"
-RECIPE_LATEST_VERSION_pn-freetype = "2.4.6"
+RECIPE_LATEST_VERSION_pn-freetype = "2.4.8"
 RECIPE_NO_OF_PATCHES_pn-freetype = "1"
 RECIPE_PATCH_pn-freetype+no-hardcode = "fix freetype-config.in"
 RECIPE_INTEL_SECTION_pn-freetype = "libs"
@@ -4595,6 +4599,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
 RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Jul 29, 2011"
 RECIPE_COMMENTS_pn-freetype = ""
 RECIPE_LAST_UPDATE_pn-freetype = "Aug 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-librsvg = "green"
-- 
1.7.6



