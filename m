Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RT1bJ-00066Q-PR
	for openembedded-core@openembedded.org; Wed, 23 Nov 2011 02:26:15 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 17:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="88336253"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2011 17:18:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 22 Nov 2011 17:18:25 -0800
Message-Id: <bbdae9b8e5e89e1786bad75bb74a018a8cf49ff1.1322008856.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
Subject: [PATCH 4/7] distro_tracking: update manual checks for recipes
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
X-List-Received-Date: Wed, 23 Nov 2011 01:26:15 -0000

From: Shane Wang <shane.wang@intel.com>

Updating manual checks for hdparm, screen, watchdog, freetype, oprofile, and tcf-agent.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 809fe47..1092b42 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1021,7 +1021,7 @@ RECIPE_MAINTAINER_pn-mdadm = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-screen = "green"
 RECIPE_DEPENDENCY_CHECK_pn-screen = "not done"
 RECIPE_LATEST_VERSION_pn-screen = "4.0.3"
-RECIPE_MANUAL_CHECK_DATE_pn-screen = "June 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-screen = "Nov 17, 2011"
 RECIPE_NO_OF_PATCHES_pn-screen = "2"
 RECIPE_PATCH_pn-screen+screen_4.0.3-11+lenny1.diff.gz = "Debian's enhancement"
 RECIPE_PATCH_pn-screen+configure = "fix configure.in to make the build pass"
@@ -1139,6 +1139,7 @@ RECIPE_NO_OF_PATCHES_pn-watchdog = "0"
 RECIPE_INTEL_SECTION_pn-watchdog = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-watchdog = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Jun 01, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Nov 17, 2011"
 RECIPE_COMMENTS_pn-watchdog = ""
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 
@@ -1951,8 +1952,9 @@ RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-hdparm = "red"
-RECIPE_LATEST_VERSION_pn-hdparm = "6.3"
-RECIPE_LAST_UPDATE_pn-hdparm = "Jul 21, 2006"
+RECIPE_LATEST_VERSION_pn-hdparm = "9.37"
+RECIPE_LAST_UPDATE_pn-hdparm = "Jan 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-hdparm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-wbxml2 = "red"
@@ -2800,6 +2802,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofile = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-oprofile = "Nov 24, 2009"
 RECIPE_COMMENTS_pn-oprofile = ""
 RECIPE_LAST_UPDATE_pn-oprofile = "Jun 22, 2010"
+RECIPE_MANUAL_CHECK_DATE-oprofile = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-oprofile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-powertop = "green"
@@ -2845,6 +2848,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcf-agent = "1+ years"
 RECIPE_LATEST_RELEASE_DATE_pn-tcf-agent = "Jul 07, 2011"
 RECIPE_COMMENTS_pn-tcf-agent = ""
 RECIPE_LAST_UPDATE_pn-tcf-agent = "Jul 21, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-tcf-agent = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liburcu = "green"
@@ -4595,7 +4599,7 @@ RECIPE_MAINTAINER_pn-fontconfig = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-freetype = "green"
 RECIPE_DEPENDENCY_CHECK_pn-freetype = "not done"
-RECIPE_LATEST_VERSION_pn-freetype = "2.4.6"
+RECIPE_LATEST_VERSION_pn-freetype = "2.4.8"
 RECIPE_NO_OF_PATCHES_pn-freetype = "1"
 RECIPE_PATCH_pn-freetype+no-hardcode = "fix freetype-config.in"
 RECIPE_INTEL_SECTION_pn-freetype = "libs"
@@ -4603,6 +4607,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
 RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Jul 29, 2011"
 RECIPE_COMMENTS_pn-freetype = ""
 RECIPE_LAST_UPDATE_pn-freetype = "Aug 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-librsvg = "green"
-- 
1.7.5.4



