Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8Lep-0003PR-Of
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 02:08:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:59:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121482643"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:58:51 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:57 +0800
Message-Id: <6b9b845d46f801f42dfb509ba8b7d88df17a83a9.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 60/60] distro_tracking: update those NOT UPDATE REASON
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
X-List-Received-Date: Fri, 16 Mar 2012 01:08:40 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 9db4ed4..9ef2bda 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -200,6 +200,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glib-2.0 = "20 days"
 RECIPE_LATEST_RELEASE_DATE_pn-glib-2.0 = "Mar 12, 2012"
 RECIPE_COMMENTS_pn-glib-2.0 = ""
 RECIPE_LAST_UPDATE_pn-glib-2.0 = "Mar 15, 2012"
+RECIPE_NO_UPDATE_REASON_pn-glib-2.0 = "The version 2.32.x is the unstable version."
 RECIPE_MAINTAINER_pn-glib-2.0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpam = "green"
@@ -2680,7 +2681,7 @@ RECIPE_STATUS_pn-gstreamer="green"
 RECIPE_LATEST_VERSION_pn-gstreamer="0.10.36"
 RECIPE_NO_OF_PATCHES_pn-gstreamer="2"
 RECIPE_LATEST_RELEASE_DATE_pn-gstreamer="Feb 21, 2012"
-RECIPE_NO_UPDATE_REASON_pn-gstreamer="upgrading to 0.11.1 causes gst-fluendo-mpegdemux compilation failure due to API conflicts. Probably 0.11 is not stable enough for some gst-* recipes"
+RECIPE_NO_UPDATE_REASON_pn-gstreamer="0.11.x is unstable release."
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gstreamer="2 month"
 RECIPE_LAST_UPDATE_pn-gstreamer = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-gstreamer = "Dongxiao Xu <dongxiao.xu@intel.com>"
@@ -2688,7 +2689,7 @@ RECIPE_MAINTAINER_pn-gstreamer = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-gst-plugins-base="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-base = "Meego=gst-plugins-base Fedora=gstreamer-plugins-base OpenSuSE=gstreamer-plugins-base Ubuntu=gst-plugins-base0.10 Mandriva=gstreamer0.10-plugins-base Debian=gst-plugins-base0.10"
 RECIPE_LATEST_VERSION_pn-gst-plugins-base="0.10.36"
-RECIPE_NO_UPDATE_REASON_pn-gst-plugins-base="gstreamer can not be upgraded to 0.11 and gst-plugins-base depends on gstreamer"
+RECIPE_NO_UPDATE_REASON_pn-gst-plugins-base="0.10.36 is the latest stable release."
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-base="0"
 RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-base="Feb 21, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-base="2 months"
@@ -2698,6 +2699,7 @@ RECIPE_MAINTAINER_pn-gst-plugins-base = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-gst-plugins-good="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-good = "Meego=gst-plugins-good Fedora=gstreamer-plugins-good OpenSuSE=gstreamer-plugins-good Ubuntu=gst-plugins-good0.10 Mandriva=gstreamer0.10-plugins-good Debian=gst-plugins-good0.10"
 RECIPE_LATEST_VERSION_pn-gst-plugins-good="0.10.31"
+RECIPE_NO_UPDATE_REASON_pn-gst-plugins-good="0.10.31 is the latest stable release."
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-good="0"
 RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-good="Feb 21, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-good="1 month"
@@ -2707,6 +2709,7 @@ RECIPE_MAINTAINER_pn-gst-plugins-good = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-gst-plugins-ugly="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-ugly = "OpenSuSE=gstreamer-plugins-ugly Mandriva=gstreamer0.10-plugins-ugly Debian=gst-plugins-ugly0.10"
 RECIPE_LATEST_VERSION_pn-gst-plugins-ugly="0.10.19"
+RECIPE_NO_UPDATE_REASON_pn-gst-plugins-ugly="0.10.19 is the latest stable release."
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-ugly="0"
 RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-ugly="Feb 21, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-ugly="4 months"
@@ -2716,6 +2719,7 @@ RECIPE_MAINTAINER_pn-gst-plugins-ugly = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-gst-plugins-bad="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-bad = "Fedora=gstreamer-plugins-bad-free OpenSuSE=gstreamer-plugins-bad Debian=gst-plugins-bad0.10"
 RECIPE_LATEST_VERSION_pn-gst-plugins-bad="0.10.23"
+RECIPE_NO_UPDATE_REASON_pn-gst-plugins-bad="0.10.23 is the latest stable release."
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-bad="0"
 RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-bad="Feb 21, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-bad="4 months"
@@ -4072,14 +4076,14 @@ RECIPE_MAINTAINER_pn-libdmx = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxi = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxi = "not done"
-RECIPE_LATEST_VERSION_pn-libxi = "1.5.99.2"
-RECIPE_NO_UPDATE_REASON_pn-libxi = "Do not upgrade to version: 1.5.99.2 because this is a development version that requres inputproto >= 2.0.99.1"
+RECIPE_LATEST_VERSION_pn-libxi = "1.6.0"
+RECIPE_NO_UPDATE_REASON_pn-libxi = "Cannot upgrade to 1.6.0 because it requires X11 > 1.4.99.1, which is an unstable version."
 RECIPE_NO_OF_PATCHES_pn-libxi = "0"
 RECIPE_INTEL_SECTION_pn-libxi = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxi = "1 day"
 RECIPE_LATEST_RELEASE_DATE_pn-libxi = "Dec 21, 2011"
 RECIPE_COMMENTS_pn-libxi = ""
-RECIPE_LAST_UPDATE_pn-libxi = "Dec 30, 2011"
+RECIPE_LAST_UPDATE_pn-libxi = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-libxi = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxinerama = "green"
@@ -5251,8 +5255,9 @@ RECIPE_MAINTAINER_pn-gtk+ = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gdk-pixbuf = "green"
 DISTRO_PN_ALIAS_pn-gdk-pixbuf = "Debian=libgdk-pixbuf2.0 Fedora=gdk-pixbuf"
-RECIPE_LATEST_VERSION_pn-gdk-pixbuf = "2.22.1"
-RECIPE_LAST_UPDATE_pn-gdk-pixbuf = "Nov 25, 2010"
+RECIPE_LATEST_VERSION_pn-gdk-pixbuf = "2.24.1"
+RECIPE_LAST_UPDATE_pn-gdk-pixbuf = "Mar 15, 2012"
+RECIPE_NO_UPDATE_REASON_pn-gdk-pixbuf = "The lastest version for gdk-pixbuf is 2.25.2, but it requires glib-2.0 >= 2.31.0, which is unstable version."
 RECIPE_MAINTAINER_pn-gdk-pixbuf = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gdk-pixbuf-csource-native = "red" # update needed
-- 
1.7.6



