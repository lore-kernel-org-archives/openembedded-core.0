Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbuaA-0002ie-Gg
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:13:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Jun 2011 06:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="19673260"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by orsmga002.jf.intel.com with ESMTP; 29 Jun 2011 06:09:48 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 21:09:40 +0800
Message-Id: <01f72fd0e9ef936bb79192891128d88317940656.1309352791.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
Subject: [PATCH 3/3] distro_tracking_fields.inc: update RECIPE_MANUAL_CHECK_DATE for screen and tcf-agent
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
X-List-Received-Date: Wed, 29 Jun 2011 13:13:30 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index e9594cf..6699ab7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1001,6 +1001,7 @@ RECIPE_MAINTAINER_pn-mdadm = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-screen = "green"
 RECIPE_DEPENDENCY_CHECK_pn-screen = "not done"
 RECIPE_LATEST_VERSION_pn-screen = "4.0.3"
+RECIPE_MANUAL_CHECK_DATE_pn-screen = "June 29, 2011"
 RECIPE_NO_OF_PATCHES_pn-screen = "2"
 RECIPE_PATCH_pn-screen+screen_4.0.3-11+lenny1.diff.gz = "Debian's enhancement"
 RECIPE_PATCH_pn-screen+configure = "fix configure.in to make the build pass"
@@ -2773,7 +2774,7 @@ RECIPE_STATUS_pn-tcf-agent = "green"
 DISTRO_PN_ALIAS_pn-tcf-agent = "WindRiver upstream=http://www.eclipse.org/dsdp/tm/"
 RECIPE_DEPENDENCY_CHECK_pn-tcf-agent = "not done"
 RECIPE_LATEST_VERSION_pn-tcf-agent = "0.3.0+svnr1078"
-RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "June 13, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "June 29, 2011"
 RECIPE_NO_UPDATE_REASON_pn-tcf-agent = "Do not upgrade to version: (998)? because upstraem hasn't defined a formal release tag."
 RECIPE_NO_OF_PATCHES_pn-tcf-agent = "2"
 RECIPE_PATCH_pn-tcf-agent+terminals_agent = "we might get the patch from git://git.yoctoproject.org/eclipse-poky.git in future"
-- 
1.7.6



