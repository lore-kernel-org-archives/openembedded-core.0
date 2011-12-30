Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RgdUd-0001l7-To
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:31:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2011 06:24:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="92901740"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 30 Dec 2011 06:24:04 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 22:33:06 +0800
Message-Id: <feb9ada1e81882c9b7b3b0d59dd3ab8c7686f0e0.1325252646.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
References: <cover.1325252645.git.shane.wang@intel.com>
Subject: [PATCH 05/14] distro_tracking_fields: update the info for recipe upgrade.
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
X-List-Received-Date: Fri, 30 Dec 2011 14:31:36 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 28670e4..e8215b7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -87,7 +87,7 @@ RECIPE_LATEST_VERSION_pn-minicom = "2.5"
 RECIPE_NO_OF_PATCHES_pn-minicom = "1"
 RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Jan 29, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom = "22 months"
-RECIPE_LAST_UPDATE_pn-minicom = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-minicom = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
@@ -2392,7 +2392,7 @@ RECIPE_LATEST_VERSION_pn-libical = "0.48"
 RECIPE_NO_OF_PATCHES_pn-libical = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-libical = "Dec 13, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "2 months"
-RECIPE_LAST_UPDATE_pn-libical = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-libical = "Dec 26, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libical = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-libical = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
@@ -2806,8 +2806,8 @@ RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libsamplerate0 = "Aug 15, 2011"
-RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Apr 26, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Dec 24, 2011"
+RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
@@ -4645,7 +4645,7 @@ RECIPE_INTEL_SECTION_pn-freetype = "libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
 RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Nov 15, 2011"
 RECIPE_COMMENTS_pn-freetype = ""
-RECIPE_LAST_UPDATE_pn-freetype = "Aug 16, 2011"
+RECIPE_LAST_UPDATE_pn-freetype = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
-- 
1.7.6



