Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Pxj6i-0004Cf-Oj
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Mar 2011 17:53:00 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Mar 2011 08:51:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,297,1297065600"; d="scan'208";a="718731804"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2011 08:51:16 -0800
Message-Id: <46f9dfef13091c23e157920c6e7a1d69ae516f0a.1299775598.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299775598.git.sgw@linux.intel.com>
References: <cover.1299775598.git.sgw@linux.intel.com>
Old-Date: Wed, 9 Mar 2011 18:29:42 +0800
Date: Thu, 10 Mar 2011  8:51:13 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Liping Ke <liping.ke@intel.com>
Subject: [PATCH 2/8] distro_tracking_fields.inc: update the info for oprofileui
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
X-List-Received-Date: Thu, 10 Mar 2011 16:53:01 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1b05341..cadfac2 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2681,13 +2681,14 @@ RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-oprofileui = "green"
 DISTRO_PN_ALIAS_pn-oprofileui = "Fedora=oprofileui Ubuntu=oprofile-gui Debian=oprofile-gui"
 RECIPE_DEPENDENCY_CHECK_pn-oprofileui = "not done"
-RECIPE_LATEST_VERSION_pn-oprofileui = "0.0+svnr197"
-RECIPE_NO_OF_PATCHES_pn-oprofileui = "0"
+RECIPE_LATEST_VERSION_pn-oprofileui = "0.0+git0+e2d998d8a55dc1e49d1588841f83eff8e6809753"
+RECIPE_NO_OF_PATCHES_pn-oprofileui = "1"
+RECIPE_PATCH_pn-oprofileui+dso_linking_change_build_fix = "fix the build by explicitely passing -lm to linker"
 RECIPE_INTEL_SECTION_pn-oprofileui = "sdk-tools"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofileui = "13 days"
-RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "07/2008"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofileui = "5 months"
+RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "Dec 10, 2010"
 RECIPE_COMMENTS_pn-oprofileui = ""
-RECIPE_LAST_UPDATE_pn-oprofileui = "Jul 20, 2010"
+RECIPE_LAST_UPDATE_pn-oprofileui = "Mar 9, 2011"
 RECIPE_MAINTAINER_pn-oprofileui = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-oprofile = "green"
-- 
1.7.1.1



