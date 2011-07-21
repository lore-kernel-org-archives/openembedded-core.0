Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qju0Z-0002A2-Ta
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 16:13:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2011 07:09:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,240,1309762800"; d="scan'208";a="28532523"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2011 07:09:38 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 22:09:46 +0800
Message-Id: <63cc3215c18b3f48b1f98f5162bb42faf2e9abaa.1311256622.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1311256622.git.dexuan.cui@intel.com>
References: <cover.1311256622.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1311256622.git.dexuan.cui@intel.com>
References: <cover.1311256622.git.dexuan.cui@intel.com>
Subject: [PATCH 2/2] distro_tracking_fields.inc: update the info for tcf-agent
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
X-List-Received-Date: Thu, 21 Jul 2011 14:13:48 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index efb4c0b..4de543e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2781,17 +2781,17 @@ RECIPE_MAINTAINER_pn-latencytop = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-tcf-agent = "green"
 DISTRO_PN_ALIAS_pn-tcf-agent = "WindRiver upstream=http://www.eclipse.org/dsdp/tm/"
 RECIPE_DEPENDENCY_CHECK_pn-tcf-agent = "not done"
-RECIPE_LATEST_VERSION_pn-tcf-agent = "0.3.0+svnr1078"
-RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "June 29, 2011"
-RECIPE_NO_UPDATE_REASON_pn-tcf-agent = "Do not upgrade to version: (998)? because upstraem hasn't defined a formal release tag."
+RECIPE_LATEST_VERSION_pn-tcf-agent = "0.0+svnr1855"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Jul 21, 2011"
+RECIPE_NO_UPDATE_REASON_pn-tcf-agent = "1855 is the latest stable revision"
 RECIPE_NO_OF_PATCHES_pn-tcf-agent = "2"
-RECIPE_PATCH_pn-tcf-agent+terminals_agent = "we might get the patch from git://git.yoctoproject.org/eclipse-poky.git in future"
 RECIPE_PATCH_pn-tcf-agent+fix_tcf-agent.init = "a proper script /etc/init.d/tcf-agent"
+RECIPE_PATCH_pn-tcf-agent+fix_ranlib = "need to pass arguments to RANLIB"
 RECIPE_INTEL_SECTION_pn-tcf-agent = "sdk-tools"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcf-agent = "1+ years"
-RECIPE_LATEST_RELEASE_DATE_pn-tcf-agent = "07/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-tcf-agent = "Jul 07, 2011"
 RECIPE_COMMENTS_pn-tcf-agent = ""
-RECIPE_LAST_UPDATE_pn-tcf-agent = "Jul 23, 2010"
+RECIPE_LAST_UPDATE_pn-tcf-agent = "Jul 21, 2011"
 RECIPE_MAINTAINER_pn-tcf-agent = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liburcu = "green"
-- 
1.7.6



