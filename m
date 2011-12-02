Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWJse-0007Am-VN
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 04:33:45 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 19:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="43150733"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 19:27:01 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 11:27:02 +0800
Message-Id: <0adba3548205bd7acb766ed5799e30eeb565164f.1322796369.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322796369.git.dexuan.cui@intel.com>
References: <cover.1322796369.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322796369.git.dexuan.cui@intel.com>
References: <cover.1322796369.git.dexuan.cui@intel.com>
Subject: [PATCH 3/3] distro_tracking_fields.inc: update the info
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
X-List-Received-Date: Fri, 02 Dec 2011 03:33:45 -0000

They are
pixman
libxrandr
lzo
libxfont
libxcursor
xcb-util
inputproto
liberation-fonts

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   65 ++++++++++---------
 1 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 073521f..ce1a8f5 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -453,11 +453,13 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnutls = "4 months"
 RECIPE_COMMENTS_pn-gnutls = "requires libtasn1, but has an internal copy"
 
 RECIPE_STATUS_pn-lzo = "green"
-RECIPE_LAST_UPDATE_pn-lzo = "Dec 31, 2010"
+RECIPE_LATEST_VERSION_pn-lzo = "2.06"
+RECIPE_NO_OF_PATCHES_pn-lzo="0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lzo="4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-lzo = "Aug 12, 2011"
+RECIPE_LAST_UPDATE_pn-lzo = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-lzo = "Dexuan Cui <dexuan.cui@intel.com>"
-RECIPE_LATEST_VERSION_pn-lzo = "2.04"
 RECIPE_INTEL_SECTION_pn-lzo = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-lzo = "Oct 01, 2010"
 
 RECIPE_STATUS_pn-libtasn1 = "green"
 RECIPE_LATEST_VERSION_pn-libtasn1 = "2.11"
@@ -3948,13 +3950,14 @@ RECIPE_MAINTAINER_pn-glproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-inputproto = "green"
 DISTRO_PN_ALIAS_pn-inputproto = "Meego=xorg-x11-proto-inputproto"
 RECIPE_DEPENDENCY_CHECK_pn-inputproto = "not done"
-RECIPE_LATEST_VERSION_pn-inputproto = "2.0.2"
+RECIPE_LATEST_VERSION_pn-inputproto = "2.1.99.2"
 RECIPE_NO_OF_PATCHES_pn-inputproto = "0"
+RECIPE_NO_UPDATE_REASON_pn-inputproto = "Do not upgrade to version: 2.1.99.2 that has unstable code. 2.2 would be the next stable release."
 RECIPE_INTEL_SECTION_pn-inputproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-inputproto = "7 months"
-RECIPE_LATEST_RELEASE_DATE_pn-inputproto = "Jun 7, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-inputproto = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-inputproto = "Nov 10, 2011"
 RECIPE_COMMENTS_pn-inputproto = ""
-RECIPE_LAST_UPDATE_pn-inputproto = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-inputproto = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-inputproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-kbproto = "green"
@@ -4265,15 +4268,15 @@ RECIPE_MAINTAINER_pn-xproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liberation-fonts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-liberation-fonts = "not done"
-RECIPE_LATEST_VERSION_pn-liberation-fonts = "1.07.0"
-RECIPE_MANUAL_CHECK_DATE_pn-liberation-fonts = "Jun 13, 2011"
-RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "Do not upgrade to version: 1.07.0 because before doing that, we need adding new native packages like libungif_4.1.3, libspiro and fontforge first"
+RECIPE_LATEST_VERSION_pn-liberation-fonts = "1.07.1"
+RECIPE_MANUAL_CHECK_DATE_pn-liberation-fonts = "Nov 30, 2011"
+RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "Do not upgrade to version: 1.07.1 because before doing that, we need adding new native packages like libungif_4.1.3, libspiro and fontforge first"
 RECIPE_NO_OF_PATCHES_pn-liberation-fonts = "0"
 RECIPE_INTEL_SECTION_pn-liberation-fonts = "x11/fonts"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liberation-fonts = "10 months"
-RECIPE_LATEST_RELEASE_DATE_pn-liberation-fonts = "May 30, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liberation-fonts = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-liberation-fonts = "Sep 21, 2011"
 RECIPE_COMMENTS_pn-liberation-fonts = "current version 1.04 released open source under GPLv2 with exceptions"
-RECIPE_LAST_UPDATE_pn-liberation-fonts = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-liberation-fonts = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libfontenc = "green"
@@ -4289,13 +4292,13 @@ RECIPE_MAINTAINER_pn-libfontenc = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxfont = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxfont = "not done"
-RECIPE_LATEST_VERSION_pn-libxfont = "1.4.2"
+RECIPE_LATEST_VERSION_pn-libxfont = "1.4.4"
 RECIPE_NO_OF_PATCHES_pn-libxfont = "0"
 RECIPE_INTEL_SECTION_pn-libxfont = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxfont = "8 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxfont = "Oct 01, 2009"
-RECIPE_COMMENTS_pn-libxfont = "the recipe file has a commented-out no-scalable-crash.patch"
-RECIPE_LAST_UPDATE_pn-libxfont = "Nov 24, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxfont = "10 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libxfont = "Aug 10, 2011"
+RECIPE_COMMENTS_pn-libxfont = ""
+RECIPE_LAST_UPDATE_pn-libxfont = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-libxfont = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libice = "green"
@@ -4369,13 +4372,13 @@ RECIPE_MAINTAINER_pn-libxcomposite = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxrandr = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxrandr = "not done"
-RECIPE_LATEST_VERSION_pn-libxrandr = "1.3.0"
+RECIPE_LATEST_VERSION_pn-libxrandr = "1.3.2"
 RECIPE_NO_OF_PATCHES_pn-libxrandr = "0"
 RECIPE_INTEL_SECTION_pn-libxrandr = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxrandr = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxrandr = "Mar 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxrandr = "8 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libxrandr = "Jun 29, 2011"
 RECIPE_COMMENTS_pn-libxrandr = ""
-RECIPE_LAST_UPDATE_pn-libxrandr = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libxrandr = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-libxrandr = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxrender = "green"
@@ -4457,13 +4460,13 @@ RECIPE_MAINTAINER_pn-libxxf86vm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxcursor = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxcursor = "not done"
-RECIPE_LATEST_VERSION_pn-libxcursor = "1.1.10"
+RECIPE_LATEST_VERSION_pn-libxcursor = "1.1.12"
 RECIPE_NO_OF_PATCHES_pn-libxcursor = "0"
 RECIPE_INTEL_SECTION_pn-libxcursor = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxcursor = "2 years"
-RECIPE_LATEST_RELEASE_DATE_pn-libxcursor = "Aug 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxcursor = "8 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libxcursor = "Jun 30, 2011"
 RECIPE_COMMENTS_pn-libxcursor = ""
-RECIPE_LAST_UPDATE_pn-libxcursor = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libxcursor = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-libxcursor = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxdamage = "green"
@@ -4535,13 +4538,13 @@ RECIPE_MAINTAINER_pn-libxkbfile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-pixman = "green"
 RECIPE_DEPENDENCY_CHECK_pn-pixman = "not done"
-RECIPE_LATEST_VERSION_pn-pixman = "0.22.0"
+RECIPE_LATEST_VERSION_pn-pixman = "0.24.0"
 RECIPE_NO_OF_PATCHES_pn-pixman = "0"
 RECIPE_INTEL_SECTION_pn-pixman = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "14 days"
-RECIPE_LATEST_RELEASE_DATE_pn-pixman = "May 2, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "8 days"
+RECIPE_LATEST_RELEASE_DATE_pn-pixman = "Nov 06, 2011"
 RECIPE_COMMENTS_pn-pixman = ""
-RECIPE_LAST_UPDATE_pn-pixman = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-pixman = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-pixman = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xtrans = "green"
@@ -4712,7 +4715,7 @@ RECIPE_INTEL_SECTION_pn-xcb-util = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcb-util = "1+ years"
 RECIPE_LATEST_RELEASE_DATE_pn-xcb-util = "Apr 25, 2011"
 RECIPE_COMMENTS_pn-xcb-util = ""
-RECIPE_LAST_UPDATE_pn-xcb-util = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-xcb-util = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-xcb-util = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-startup-notification = "green"
-- 
1.7.6



