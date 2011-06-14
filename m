Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOdA-0001K5-Lj
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:05:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2011 01:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="14283998"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 01:02:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2011 01:01:46 -0700
Message-Id: <8454f8c1c6c0be871aff22d2999c01fb3776dc57.1308037753.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 37/51] distro_tracking_fields.inc: update the info for the following recipes
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
X-List-Received-Date: Tue, 14 Jun 2011 08:06:48 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

screen: remove the duplicate info
tcf-agent: update MANUAL_CHECK_DATE
gnome-doc-utils
startup-notification
util-macros
liberation-fonts
resourceproto
dri2proto
glproto
inputproto
pixman
libxext
libxi
xcb-util

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  113 +++++++++----------
 1 files changed, 54 insertions(+), 59 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index babf9e0..f4aa1ea 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -104,11 +104,6 @@ RECIPE_LATEST_VERSION_pn-run-postinsts = "check"
 RECIPE_LAST_UPDATE_pn-run-postinsts = "Nov 22, 2010"
 RECIPE_MAINTAINER_pn-run-postinsts = "Dongxiao Xu <dongxiao.xu@intel.com"
 
-RECIPE_STATUS_pn-screen = "red"
-RECIPE_LATEST_VERSION_pn-screen = "check"
-RECIPE_LAST_UPDATE_pn-screen = "Aug 31, 2010"
-RECIPE_MAINTAINER_pn-screen = "Qing He <qing.he@intel.com>"
-
 RECIPE_STATUS_pn-subversion = "green"
 RECIPE_LATEST_VERSION_pn-subversion = "1.6.15"
 RECIPE_MANUAL_CHECK_DATE_pn-subversion = "Jan 25, 2011" 
@@ -2777,7 +2772,7 @@ RECIPE_STATUS_pn-tcf-agent = "green"
 DISTRO_PN_ALIAS_pn-tcf-agent = "WindRiver upstream=http://www.eclipse.org/dsdp/tm/"
 RECIPE_DEPENDENCY_CHECK_pn-tcf-agent = "not done"
 RECIPE_LATEST_VERSION_pn-tcf-agent = "0.3.0+svnr1078"
-RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Apr 11, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "June 13, 2011"
 RECIPE_NO_UPDATE_REASON_pn-tcf-agent = "Do not upgrade to version: (998)? because upstraem hasn't defined a formal release tag."
 RECIPE_NO_OF_PATCHES_pn-tcf-agent = "2"
 RECIPE_PATCH_pn-tcf-agent+terminals_agent = "we might get the patch from git://git.yoctoproject.org/eclipse-poky.git in future"
@@ -3819,25 +3814,25 @@ RECIPE_MAINTAINER_pn-fontsproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-glproto = "green"
 DISTRO_PN_ALIAS_pn-glproto = "Meego=xorg-x11-proto-glproto"
 RECIPE_DEPENDENCY_CHECK_pn-glproto = "not done"
-RECIPE_LATEST_VERSION_pn-glproto = "1.4.12"
+RECIPE_LATEST_VERSION_pn-glproto = "1.4.13"
 RECIPE_NO_OF_PATCHES_pn-glproto = "0"
 RECIPE_INTEL_SECTION_pn-glproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glproto = "7 months"
-RECIPE_LATEST_RELEASE_DATE_pn-glproto = "Aug 10, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glproto = "9 months"
+RECIPE_LATEST_RELEASE_DATE_pn-glproto = "May 4, 2011"
 RECIPE_COMMENTS_pn-glproto = ""
-RECIPE_LAST_UPDATE_pn-glproto = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-glproto = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-glproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-inputproto = "green"
 DISTRO_PN_ALIAS_pn-inputproto = "Meego=xorg-x11-proto-inputproto"
 RECIPE_DEPENDENCY_CHECK_pn-inputproto = "not done"
-RECIPE_LATEST_VERSION_pn-inputproto = "2.0.1"
+RECIPE_LATEST_VERSION_pn-inputproto = "2.0.2"
 RECIPE_NO_OF_PATCHES_pn-inputproto = "0"
 RECIPE_INTEL_SECTION_pn-inputproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-inputproto = "1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-inputproto = "Nov 10, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-inputproto = "7 months"
+RECIPE_LATEST_RELEASE_DATE_pn-inputproto = "Jun 7, 2011"
 RECIPE_COMMENTS_pn-inputproto = ""
-RECIPE_LAST_UPDATE_pn-inputproto = "Jan 5, 2011"
+RECIPE_LAST_UPDATE_pn-inputproto = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-inputproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-kbproto = "green"
@@ -3865,13 +3860,13 @@ RECIPE_MAINTAINER_pn-libdmx = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxi = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxi = "not done"
-RECIPE_LATEST_VERSION_pn-libxi = "1.4.2"
+RECIPE_LATEST_VERSION_pn-libxi = "1.4.3"
 RECIPE_NO_OF_PATCHES_pn-libxi = "0"
 RECIPE_INTEL_SECTION_pn-libxi = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxi = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxi = "Mar 18, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxi = "2+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-libxi = "Jun 6, 2011"
 RECIPE_COMMENTS_pn-libxi = ""
-RECIPE_LAST_UPDATE_pn-libxi = "Apr 11, 2011"
+RECIPE_LAST_UPDATE_pn-libxi = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-libxi = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxinerama = "green"
@@ -3958,13 +3953,13 @@ RECIPE_MAINTAINER_pn-renderproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-resourceproto = "green"
 DISTRO_PN_ALIAS_pn-resourceproto = "Meego=xorg-x11-proto-resourceproto"
 RECIPE_DEPENDENCY_CHECK_pn-resourceproto = "not done"
-RECIPE_LATEST_VERSION_pn-resourceproto = "1.1.1"
+RECIPE_LATEST_VERSION_pn-resourceproto = "1.2.0"
 RECIPE_NO_OF_PATCHES_pn-resourceproto = "0"
 RECIPE_INTEL_SECTION_pn-resourceproto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-resourceproto = "1+ years"
-RECIPE_LATEST_RELEASE_DATE_pn-resourceproto = "Dec 8, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-resourceproto = "5+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-resourceproto = "May 27, 2011"
 RECIPE_COMMENTS_pn-resourceproto = ""
-RECIPE_LAST_UPDATE_pn-resourceproto = "Jan 5, 2011"
+RECIPE_LAST_UPDATE_pn-resourceproto = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-resourceproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-scrnsaverproto = "green"
@@ -4090,13 +4085,13 @@ RECIPE_MAINTAINER_pn-xineramaproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-dri2proto = "green"
 DISTRO_PN_ALIAS_pn-dri2proto = "Meego=xorg-x11-proto-dri2proto"
 RECIPE_DEPENDENCY_CHECK_pn-dri2proto = "not done"
-RECIPE_LATEST_VERSION_pn-dri2proto = "2.3"
+RECIPE_LATEST_VERSION_pn-dri2proto = "2.4"
 RECIPE_NO_OF_PATCHES_pn-dri2proto = "0"
 RECIPE_INTEL_SECTION_pn-dri2proto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dri2proto = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-dri2proto = "02/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dri2proto = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-dri2proto = "May 4, 2011"
 RECIPE_COMMENTS_pn-dri2proto = ""
-RECIPE_LAST_UPDATE_pn-dri2proto = "Jun 29, 2010"
+RECIPE_LAST_UPDATE_pn-dri2proto = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-dri2proto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xcb-proto = "green"
@@ -4148,15 +4143,15 @@ RECIPE_MAINTAINER_pn-xproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-liberation-fonts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-liberation-fonts = "not done"
-RECIPE_LATEST_VERSION_pn-liberation-fonts = "1.06.0.20100721"
-RECIPE_MANUAL_CHECK_DATE_pn-liberation-fonts = "Jan 28, 2011"
-RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "Do not upgrade to version: 1.06.0.20100721 because before doing that, we need adding new native packages like libungif_4.1.3, libspiro and fontforge first"
+RECIPE_LATEST_VERSION_pn-liberation-fonts = "1.07.0"
+RECIPE_MANUAL_CHECK_DATE_pn-liberation-fonts = "Jun 13, 2011"
+RECIPE_NO_UPDATE_REASON_pn-liberation-fonts = "Do not upgrade to version: 1.07.0 because before doing that, we need adding new native packages like libungif_4.1.3, libspiro and fontforge first"
 RECIPE_NO_OF_PATCHES_pn-liberation-fonts = "0"
 RECIPE_INTEL_SECTION_pn-liberation-fonts = "x11/fonts"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liberation-fonts = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-liberation-fonts = "Jul 21, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liberation-fonts = "10 months"
+RECIPE_LATEST_RELEASE_DATE_pn-liberation-fonts = "May 30, 2011"
 RECIPE_COMMENTS_pn-liberation-fonts = "current version 1.04 released open source under GPLv2 with exceptions"
-RECIPE_LAST_UPDATE_pn-liberation-fonts = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-liberation-fonts = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-liberation-fonts = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libfontenc = "green"
@@ -4373,13 +4368,13 @@ RECIPE_MAINTAINER_pn-libxdmcp = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxext = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxext = "not done"
-RECIPE_LATEST_VERSION_pn-libxext = "1.1.2"
+RECIPE_LATEST_VERSION_pn-libxext = "1.3.0"
 RECIPE_NO_OF_PATCHES_pn-libxext = "0"
 RECIPE_INTEL_SECTION_pn-libxext = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxext = "1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-libxext = "06/2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxext = "6+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-libxext = "May 6, 2011"
 RECIPE_COMMENTS_pn-libxext = ""
-RECIPE_LAST_UPDATE_pn-libxext = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libxext = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-libxext = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxfixes = "green"
@@ -4418,14 +4413,13 @@ RECIPE_MAINTAINER_pn-libxkbfile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-pixman = "green"
 RECIPE_DEPENDENCY_CHECK_pn-pixman = "not done"
-RECIPE_LATEST_VERSION_pn-pixman = "0.21.6"
-RECIPE_NO_UPDATE_REASON_pn-pixman = "Do not upgrade to version: 0.21.6 because it's a development snapshot. pixman's stable releases have even minor version numbers."
+RECIPE_LATEST_VERSION_pn-pixman = "0.22.0"
 RECIPE_NO_OF_PATCHES_pn-pixman = "0"
 RECIPE_INTEL_SECTION_pn-pixman = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "1+ month"
-RECIPE_LATEST_RELEASE_DATE_pn-pixman = "Feb 22, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "14 days"
+RECIPE_LATEST_RELEASE_DATE_pn-pixman = "May 2, 2011"
 RECIPE_COMMENTS_pn-pixman = ""
-RECIPE_LAST_UPDATE_pn-pixman = "Jan 31, 2011"
+RECIPE_LAST_UPDATE_pn-pixman = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-pixman = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xtrans = "green"
@@ -4475,12 +4469,12 @@ RECIPE_MAINTAINER_pn-xkeyboard-config = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-util-macros = "green"
 DISTRO_PN_ALIAS_pn-util-macros = "Meego=xorg-x11-util-macros Fedora=xorg-x11-util-macros Mandriva=x11-util-macros"
 RECIPE_DEPENDENCY_CHECK_pn-util-macros = "not done"
-RECIPE_LATEST_VERSION_pn-util-macros = "1.13.0"
+RECIPE_LATEST_VERSION_pn-util-macros = "1.14.0"
 RECIPE_INTEL_SECTION_pn-util-macros = "x11/utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "17 days"
-RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "Mar 14, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "2+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "May 27, 2011"
 RECIPE_COMMENTS_pn-util-macros = ""
-RECIPE_LAST_UPDATE_pn-util-macros = "Apr 20, 2011"
+RECIPE_LAST_UPDATE_pn-util-macros = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-util-macros = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-fontconfig = "green"
@@ -4559,24 +4553,24 @@ RECIPE_MAINTAINER_pn-gnome-vfs = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xcb-util = "green"
 RECIPE_DEPENDENCY_CHECK_pn-xcb-util = "not done"
-RECIPE_LATEST_VERSION_pn-xcb-util = "0.3.6"
+RECIPE_LATEST_VERSION_pn-xcb-util = "0.3.8"
 RECIPE_NO_OF_PATCHES_pn-xcb-util = "0"
 RECIPE_INTEL_SECTION_pn-xcb-util = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcb-util = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-xcb-util = "08/24/2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcb-util = "1+ years"
+RECIPE_LATEST_RELEASE_DATE_pn-xcb-util = "Apr 25, 2011"
 RECIPE_COMMENTS_pn-xcb-util = ""
-RECIPE_LAST_UPDATE_pn-xcb-util = "Jul 22, 2010"
+RECIPE_LAST_UPDATE_pn-xcb-util = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-xcb-util = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-startup-notification = "green"
 RECIPE_DEPENDENCY_CHECK_pn-startup-notification = "not done"
-RECIPE_LATEST_VERSION_pn-startup-notification = "0.10"
+RECIPE_LATEST_VERSION_pn-startup-notification = "0.12"
 RECIPE_NO_OF_PATCHES_pn-startup-notification = "0"
 RECIPE_INTEL_SECTION_pn-startup-notification = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-startup-notification = "2 years"
-RECIPE_LATEST_RELEASE_DATE_pn-startup-notification = "04/13/2009"
-RECIPE_COMMENTS_pn-startup-notification = "in recipe, SECTION is libs but to be more accurate it should be x11/libs"
-RECIPE_LAST_UPDATE_pn-startup-notification = "Jul 22, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-startup-notification = "11 days"
+RECIPE_LATEST_RELEASE_DATE_pn-startup-notification = "May 16, 2011"
+RECIPE_COMMENTS_pn-startup-notification = ""
+RECIPE_LAST_UPDATE_pn-startup-notification = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-startup-notification = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-galago-daemon = "green"
@@ -4591,13 +4585,14 @@ RECIPE_MAINTAINER_pn-galago-daemon = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-gnome-doc-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-gnome-doc-utils = "not done"
-RECIPE_LATEST_VERSION_pn-gnome-doc-utils = "0.20.5"
-RECIPE_NO_OF_PATCHES_pn-gnome-doc-utils = "0"
+RECIPE_LATEST_VERSION_pn-gnome-doc-utils = "0.20.6"
+RECIPE_NO_OF_PATCHES_pn-gnome-doc-utils = "1"
+RECIPE_PATCH_pn-gnome-doc-utils+xsltproc_nonet = "add -nonet option to fix compile errors"
 RECIPE_INTEL_SECTION_pn-gnome-doc-utils = "utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnome-doc-utils = "2+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-gnome-doc-utils = "Mar 22, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnome-doc-utils = "1+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-gnome-doc-utils = "Apr 25, 2011"
 RECIPE_COMMENTS_pn-gnome-doc-utils = ""
-RECIPE_LAST_UPDATE_pn-gnome-doc-utils = "Apr 11, 2011"
+RECIPE_LAST_UPDATE_pn-gnome-doc-utils = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-gnome-doc-utils = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-gnome-settings-daemon = "red"
-- 
1.7.3.4



