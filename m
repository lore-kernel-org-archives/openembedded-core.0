Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSx-0002jL-7T
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:18:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2011 07:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38910895"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 07:13:24 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:20 +0800
Message-Id: <baebffba0d538a27eef44cdf829fb2eccb0c7b2b.1313503779.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 10/10] distro_tracking_fields.inc: update the info for the following recipes
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
X-List-Received-Date: Tue, 16 Aug 2011 14:18:05 -0000

cronie
mdadm
freetype
xproto
glproto
dri2proto
util-macros

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   56 ++++++++++----------
 1 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c7e5db5..984e330 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -994,13 +994,13 @@ RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mdadm = "not done"
-RECIPE_LATEST_VERSION_pn-mdadm = "3.2.1"
+RECIPE_LATEST_VERSION_pn-mdadm = "3.2.2"
 RECIPE_NO_OF_PATCHES_pn-mdadm = "0"
 RECIPE_INTEL_SECTION_pn-mdadm = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "1+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "Mar 28, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "2+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "Jun 17, 2011"
 RECIPE_COMMENTS_pn-mdadm = ""
-RECIPE_LAST_UPDATE_pn-mdadm = "Apr 20, 2011"
+RECIPE_LAST_UPDATE_pn-mdadm = "Aug 16, 2011"
 RECIPE_MAINTAINER_pn-mdadm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-screen = "green"
@@ -1986,13 +1986,13 @@ RECIPE_MAINTAINER_pn-cpio = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-cronie = "green"
 RECIPE_DEPENDENCY_CHECK_pn-cronie = "not done"
-RECIPE_LATEST_VERSION_pn-cronie = "1.4.7"
-RECIPE_MANUAL_CHECK_DATE_pn-cronie = "Apr 11, 2011"
+RECIPE_LATEST_VERSION_pn-cronie = "1.4.8"
+RECIPE_MANUAL_CHECK_DATE_pn-cronie = "Aug 16, 2011"
 RECIPE_INTEL_SECTION_pn-cronie = "base"
 RECIPE_NO_OF_PATCHES_pn-cronie = "0"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cronie = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-cronie = "Mar 17, 2011"
-RECIPE_LAST_UPDATE_pn-cronie = "Apr 11, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cronie = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-cronie = "Jun 27, 2011"
+RECIPE_LAST_UPDATE_pn-cronie = "Aug 16, 2011"
 RECIPE_MAINTAINER_pn-cronie = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-grep = "green" 
@@ -3839,13 +3839,13 @@ RECIPE_MAINTAINER_pn-fontsproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-glproto = "green"
 DISTRO_PN_ALIAS_pn-glproto = "Meego=xorg-x11-proto-glproto"
 RECIPE_DEPENDENCY_CHECK_pn-glproto = "not done"
-RECIPE_LATEST_VERSION_pn-glproto = "1.4.13"
+RECIPE_LATEST_VERSION_pn-glproto = "1.4.14"
 RECIPE_NO_OF_PATCHES_pn-glproto = "0"
 RECIPE_INTEL_SECTION_pn-glproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glproto = "9 months"
-RECIPE_LATEST_RELEASE_DATE_pn-glproto = "May 4, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glproto = "1+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-glproto = "Jun 29, 2011"
 RECIPE_COMMENTS_pn-glproto = ""
-RECIPE_LAST_UPDATE_pn-glproto = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-glproto = "Aug 16, 2011"
 RECIPE_MAINTAINER_pn-glproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-inputproto = "green"
@@ -4110,13 +4110,13 @@ RECIPE_MAINTAINER_pn-xineramaproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-dri2proto = "green"
 DISTRO_PN_ALIAS_pn-dri2proto = "Meego=xorg-x11-proto-dri2proto"
 RECIPE_DEPENDENCY_CHECK_pn-dri2proto = "not done"
-RECIPE_LATEST_VERSION_pn-dri2proto = "2.4"
+RECIPE_LATEST_VERSION_pn-dri2proto = "2.6"
 RECIPE_NO_OF_PATCHES_pn-dri2proto = "0"
 RECIPE_INTEL_SECTION_pn-dri2proto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dri2proto = "1+ years"
-RECIPE_LATEST_RELEASE_DATE_pn-dri2proto = "May 4, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dri2proto = "1+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-dri2proto = "Jun 29, 2011"
 RECIPE_COMMENTS_pn-dri2proto = ""
-RECIPE_LAST_UPDATE_pn-dri2proto = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-dri2proto = "Aug 16, 2011"
 RECIPE_MAINTAINER_pn-dri2proto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xcb-proto = "green"
@@ -4157,13 +4157,13 @@ RECIPE_MAINTAINER_pn-xf86vidmodeproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-xproto = "green"
 DISTRO_PN_ALIAS_pn-xproto = "Meego=xorg-x11-proto-xproto Fedora=xorg-x11-proto-devel Ubuntu=x11proto-core-dev Debian=x11proto-core-dev Opensuse=xorg-x11-proto-devel Mandriva=x11-proto-devel"
 RECIPE_DEPENDENCY_CHECK_pn-xproto = "not done"
-RECIPE_LATEST_VERSION_pn-xproto = "7.0.21"
+RECIPE_LATEST_VERSION_pn-xproto = "7.0.22"
 RECIPE_NO_OF_PATCHES_pn-xproto = "0"
 RECIPE_INTEL_SECTION_pn-xproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xproto = "3+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-xproto = "Mar 22, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xproto = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-xproto = "Jun 22, 2011"
 RECIPE_COMMENTS_pn-xproto = ""
-RECIPE_LAST_UPDATE_pn-xproto = "Apr 11, 2011"
+RECIPE_LAST_UPDATE_pn-xproto = "Aug 16, 2011"
 RECIPE_MAINTAINER_pn-xproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liberation-fonts = "green"
@@ -4494,12 +4494,12 @@ RECIPE_MAINTAINER_pn-xkeyboard-config = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-util-macros = "green"
 DISTRO_PN_ALIAS_pn-util-macros = "Meego=xorg-x11-util-macros Fedora=xorg-x11-util-macros Mandriva=x11-util-macros"
 RECIPE_DEPENDENCY_CHECK_pn-util-macros = "not done"
-RECIPE_LATEST_VERSION_pn-util-macros = "1.14.0"
+RECIPE_LATEST_VERSION_pn-util-macros = "1.15.0"
 RECIPE_INTEL_SECTION_pn-util-macros = "x11/utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "2+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "May 27, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "1 month"
+RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "Jun 23, 2011"
 RECIPE_COMMENTS_pn-util-macros = ""
-RECIPE_LAST_UPDATE_pn-util-macros = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-util-macros = "Aug 16, 2011"
 RECIPE_MAINTAINER_pn-util-macros = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-fontconfig = "green"
@@ -4516,14 +4516,14 @@ RECIPE_MAINTAINER_pn-fontconfig = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-freetype = "green"
 RECIPE_DEPENDENCY_CHECK_pn-freetype = "not done"
-RECIPE_LATEST_VERSION_pn-freetype = "2.4.4"
+RECIPE_LATEST_VERSION_pn-freetype = "2.4.6"
 RECIPE_NO_OF_PATCHES_pn-freetype = "1"
 RECIPE_PATCH_pn-freetype+no-hardcode = "fix freetype-config.in"
 RECIPE_INTEL_SECTION_pn-freetype = "libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Nov 28, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Jul 29, 2011"
 RECIPE_COMMENTS_pn-freetype = ""
-RECIPE_LAST_UPDATE_pn-freetype = "Jan 28, 2011"
+RECIPE_LAST_UPDATE_pn-freetype = "Aug 16, 2011"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-librsvg = "green"
-- 
1.7.6



