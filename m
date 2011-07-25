Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlFgs-0001mf-G3
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:35:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 00:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,259,1309762800"; d="scan'208";a="31038664"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 00:30:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 00:30:38 -0700
Message-Id: <83409b8847cf54b9b24808a8fa9d5748fbc6b1bd.1311578785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED 25 July PULL 2/7] distro_tracking_fields.inc: update the info for tcf-agent
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
X-List-Received-Date: Mon, 25 Jul 2011 07:35:02 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5369f75..3a3991d 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2786,17 +2786,17 @@ RECIPE_MAINTAINER_pn-latencytop = "Dexuan Cui <dexuan.cui@intel.com>"
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
1.7.3.4



