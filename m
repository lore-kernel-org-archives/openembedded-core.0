Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RWOAm-0005qD-HK
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 09:08:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Dec 2011 00:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="81422791"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 00:00:56 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 15:55:58 +0800
Message-Id: <a03cfe06e1b32332835aa707d183b7826955461a.1322812458.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322812458.git.edwin.zhai@intel.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
Subject: [PATCH 4/4] distro-tracking: Update info after last upgrade
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
X-List-Received-Date: Fri, 02 Dec 2011 08:08:44 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   54 ++++++++++----------
 1 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 073521f..e254938 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1093,14 +1093,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-libuser = "Jan 01, 2011"
 RECIPE_COMMENTS_pn-libuser = ""
 
 RECIPE_STATUS_pn-xz = "green"
-RECIPE_LAST_UPDATE_pn-xz = "Nov 19, 2010"
+RECIPE_LAST_UPDATE_pn-xz = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-xz = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-xz = "not done"
-RECIPE_LATEST_VERSION_pn-xz = "5.0.0"
+RECIPE_LATEST_VERSION_pn-xz = "5.0.3"
 RECIPE_NO_OF_PATCHES_pn-xz = "0"
 RECIPE_INTEL_SECTION_pn-xz = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xz = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-xz = "Oct 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xz = "1 month"
+RECIPE_LATEST_RELEASE_DATE_pn-xz = "May 21, 2011"
 RECIPE_COMMENTS_pn-xz = ""
 
 RECIPE_STATUS_pn-bc = "green"
@@ -1208,8 +1208,8 @@ RECIPE_MANUAL_CHECK_DATE_pn-dosfstools = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-dosfstools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-eee-acpi-scripts = "green"
-RECIPE_LATEST_VERSION_pn-eee-acpi-scripts = "1.1.11+e224937ba51165e2a52252f9a113c8a82c01bb36"
-RECIPE_LAST_UPDATE_pn-eee-acpi-scripts = "Nov 28, 2010"
+RECIPE_LATEST_VERSION_pn-eee-acpi-scripts = "1.1.12+9d4cdedca25b396405f8587f9c4fbf8229e041c2"
+RECIPE_LAST_UPDATE_pn-eee-acpi-scripts = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-eee-acpi-scripts = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-eee-acpi-scripts = "Debian=eeepc-acpi-scripts Ubuntu=eeepc-acpi-scripts"
 
@@ -3254,15 +3254,15 @@ RECIPE_MAINTAINER_pn-gnome-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-puzzles = "red"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles"
-RECIPE_LATEST_VERSION_pn-puzzles = "r9175"
+RECIPE_LATEST_VERSION_pn-puzzles = "r9306"
 RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Nov 22, 2011"
 RECIPE_LAST_UPDATE_pn-puzzles = "May 31, 2011"
 RECIPE_MAINTAINER_pn-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 
 RECIPE_STATUS_pn-x11perf = "green"
-RECIPE_LATEST_VERSION_pn-x11perf = "1.5.2"
-RECIPE_LAST_UPDATE_pn-x11perf = "Nov 30, 2010"
+RECIPE_LATEST_VERSION_pn-x11perf = "1.5.4"
+RECIPE_LAST_UPDATE_pn-x11perf = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-x11perf = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11perf = "Fedora=xorg-x11-apps Ubuntu=x11-apps"
 
@@ -5109,13 +5109,13 @@ RECIPE_MAINTAINER_pn-dates = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libcroco = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libcroco = "not done"
-RECIPE_LATEST_VERSION_pn-libcroco = "0.6.2"
+RECIPE_LATEST_VERSION_pn-libcroco = "0.6.3"
 RECIPE_NO_OF_PATCHES_pn-libcroco = "1"
 RECIPE_INTEL_SECTION_pn-libcroco = "graphic UX"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcroco = "35 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libcroco = "Feb 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcroco = "33 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libcroco = "Nov 14, 2011"
 RECIPE_COMMENTS_pn-libcroco = ""
-RECIPE_LAST_UPDATE_pn-libcroco = "Jun 25, 2010"
+RECIPE_LAST_UPDATE_pn-libcroco = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-libcroco = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-leafpad = "green"
@@ -5143,13 +5143,13 @@ RECIPE_MAINTAINER_pn-atk = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-gtk+ = "green"
 DISTRO_PN_ALIAS_pn-gtk+ = "Meego=gtk2 Fedora=gtk2 OpenSuSE=gtk2 Ubuntu=gtk+2.0 Mandriva=gtk+2.0 Debian=gtk+2.0"
 RECIPE_DEPENDENCY_CHECK_pn-gtk+ = "not done"
-RECIPE_LATEST_VERSION_pn-gtk+ = "2.22.1"
+RECIPE_LATEST_VERSION_pn-gtk+ = "2.24.8"
 RECIPE_NO_OF_PATCHES_pn-gtk+ = "0"
 RECIPE_INTEL_SECTION_pn-gtk+ = "graphic UX"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gtk+ = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-gtk+ = "Nov 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gtk+ = "1 months"
+RECIPE_LATEST_RELEASE_DATE_pn-gtk+ = "Nov 10, 2011"
 RECIPE_COMMENTS_pn-gtk+ = ""
-RECIPE_LAST_UPDATE_pn-gtk+ = "Jan 24, 2011"
+RECIPE_LAST_UPDATE_pn-gtk+ = "Nov 29, 2011"
 RECIPE_NO_UPDATE_REASON_pn-gtk+ = "Do not upgrade to version: 2.99.2 because prefer stable tree"
 RECIPE_MAINTAINER_pn-gtk+ = "Zhai Edwin <edwin.zhai@intel.com>"
 
@@ -5199,14 +5199,14 @@ RECIPE_MAINTAINER_pn-gnome-common = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-webkit-gtk = "green"
 DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk"
 RECIPE_DEPENDENCY_CHECK_pn-webkit-gtk = "not done"
-RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.3.7+svnr89887"
-RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Jun 28, 2011"
+RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.6.1+svnr101367"
+RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Dec 2, 2011"
 RECIPE_NO_OF_PATCHES_pn-webkit-gtk = "1"
 RECIPE_INTEL_SECTION_pn-webkit-gtk = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-webkit-gtk = "1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-webkit-gtk = "Jun 01, 2011"
 RECIPE_COMMENTS_pn-webkit-gtk = ""
-RECIPE_LAST_UPDATE_pn-webkit-gtk = "Jan 14, 2011"
+RECIPE_LAST_UPDATE_pn-webkit-gtk = "Jul 11, 2011"
 RECIPE_MAINTAINER_pn-webkit-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk Ubuntu=libwebkit"
 
@@ -5296,13 +5296,13 @@ RECIPE_MAINTAINER_pn-libglade = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libsoup-2.4 = "green"
 DISTRO_PN_ALIAS_pn-libsoup-2.4 = "Meego=libsoup Fedora=libsoup OpenSuSE=libsoup Ubuntu=libsoup2.4 Mandriva=libsoup Debian=libsoup2.4"
 RECIPE_DEPENDENCY_CHECK_pn-libsoup-2.4 = "not done"
-RECIPE_LATEST_VERSION_pn-libsoup-2.4 = "2.34.2"
+RECIPE_LATEST_VERSION_pn-libsoup-2.4 = "2.36.1"
 RECIPE_NO_OF_PATCHES_pn-libsoup-2.4 = "0"
 RECIPE_INTEL_SECTION_pn-libsoup-2.4 = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libsoup-2.4 = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libsoup-2.4 = "Aug 01, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-libsoup-2.4 = "Oct 18, 2011"
 RECIPE_COMMENTS_pn-libsoup-2.4 = ""
-RECIPE_LAST_UPDATE_pn-libsoup-2.4 = "Jul 28, 2011"
+RECIPE_LAST_UPDATE_pn-libsoup-2.4 = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libxslt = "green"
@@ -5552,12 +5552,12 @@ RECIPE_MAINTAINER_pn-metacity = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-polkit-gnome = "green"
 RECIPE_DEPENDENCY_CHECK_pn-polkit-gnome = "not done"
-RECIPE_LATEST_VERSION_pn-polkit-gnome = "0.99"
+RECIPE_LATEST_VERSION_pn-polkit-gnome = "0.102"
 RECIPE_INTEL_SECTION_pn-polkit-gnome = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit-gnome = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-polkit-gnome = "Sep 15, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit-gnome = "5 months"
+RECIPE_LATEST_RELEASE_DATE_pn-polkit-gnome = "Aug 16, 2011"
 RECIPE_COMMENTS_pn-polkit-gnome = ""
-RECIPE_LAST_UPDATE_pn-polkit-gnome = "Nov 18, 2010"
+RECIPE_LAST_UPDATE_pn-polkit-gnome = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-polkit-gnome = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-pong-clock = "red"
-- 
1.7.1



