Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd7H-0006Bv-1Y
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2011 20:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="68780505"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2011 20:22:20 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:50 +0800
Message-Id: <a8d0c22091831092a8649af09902c4c9d11b48d6.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 11/11] distro_tracking: polkit, libsndfile, etc
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:24 -0000

polkit
libsndfile1
neon
netbase
libogg
telepathy-idle
telepathy-glib
telepathy-mission-control
iptables

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   66 ++++++++++----------
 1 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1f3540e..96afb8b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -244,13 +244,13 @@ RECIPE_MAINTAINER_pn-dbus-glib = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-neon="green"
 RECIPE_DEPENDENCY_CHECK_pn-neon = "not done"
-RECIPE_LATEST_VERSION_pn-neon="0.29.5"
+RECIPE_LATEST_VERSION_pn-neon="0.29.6"
 RECIPE_NO_OF_PATCHES_pn-neon="0"
 RECIPE_INTEL_SECTION_pn-neon = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-neon="2010/10/14"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-neon="10 days"
+RECIPE_LATEST_RELEASE_DATE_pn-neon="2011/05/03"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-neon="7 months"
 RECIPE_COMMENTS_pn-neon = ""
-RECIPE_LAST_UPDATE_pn-neon = "Nov 15, 2010"
+RECIPE_LAST_UPDATE_pn-neon = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-neon = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpng = "green"
@@ -782,12 +782,12 @@ DISTRO_PN_ALIAS_pn-opkg-utils = "OSPDT upstream=http://svn.openmoko.org/trunk/sr
 
 RECIPE_STATUS_pn-polkit = "green"
 RECIPE_DEPENDENCY_CHECK_pn-polkit = "not done"
-RECIPE_LATEST_VERSION_pn-polkit = "0.101"
+RECIPE_LATEST_VERSION_pn-polkit = "0.102"
 RECIPE_INTEL_SECTION_pn-polkit = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-polkit = "2011/03/03"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit = "5 months"
+RECIPE_LATEST_RELEASE_DATE_pn-polkit = "2011/08/01"
 RECIPE_COMMENTS_pn-polkit = ""
-RECIPE_LAST_UPDATE_pn-polkit = "Apr 26, 2011"
+RECIPE_LAST_UPDATE_pn-polkit = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-polkit = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-psplash = "not done"
@@ -847,14 +847,14 @@ RECIPE_MAINTAINER_pn-iproute2 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-netbase = "green"
 RECIPE_DEPENDENCY_CHECK_pn-netbase = "not done"
-RECIPE_LATEST_VERSION_pn-netbase = "4.44"
+RECIPE_LATEST_VERSION_pn-netbase = "4.46"
 RECIPE_PATCH_pn-netbase+busybox = "marked as REMOVAL"
 RECIPE_PATCH_pn-many = "local scripts"
 RECIPE_INTEL_SECTION_pn-netbase = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-netbase = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-netbase = "2010/12/13"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-netbase = "5 months"
+RECIPE_LATEST_RELEASE_DATE_pn-netbase = "2011/06/26"
 RECIPE_COMMENTS_pn-netbase = ""
-RECIPE_LAST_UPDATE_pn-netbase = "Dec 30, 2010"
+RECIPE_LAST_UPDATE_pn-netbase = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-netbase = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-busybox = "green"
@@ -1034,9 +1034,9 @@ RECIPE_LAST_UPDATE_pn-gzip = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-iptables = "green"
-RECIPE_LAST_UPDATE_pn-iptables = "Nov 10, 2010"
+RECIPE_LAST_UPDATE_pn-iptables = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-iptables = "Dongxiao Xu <dongxiao.xu@intel.com>"
-RECIPE_LATEST_VERSION_pn-iptables = "1.4.8"
+RECIPE_LATEST_VERSION_pn-iptables = "1.4.12.1"
 
 RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
@@ -2222,18 +2222,18 @@ RECIPE_MAINTAINER_pn-telepathy-gabble = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-glib = "green"
 RECIPE_NO_OF_PATCHES_pn-telepathy-glib ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "2011/03/31"
-RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.14.3"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "2011/10/14"
+RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.16.0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-glib = "10 days"
-RECIPE_LAST_UPDATE_pn-telepathy-glib = "Apr 15, 2011"
+RECIPE_LAST_UPDATE_pn-telepathy-glib = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-telepathy-glib = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-idle = "green"
 RECIPE_NO_OF_PATCHES_pn-telepathy-idle ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib ="2011/02/11"
-RECIPE_LATEST_VERSION_pn-telepathy-idle = "0.1.8"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-idle = "3 months"
-RECIPE_LAST_UPDATE_pn-telepathy-idle = "Apr 15, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib ="2011/05/11"
+RECIPE_LATEST_VERSION_pn-telepathy-idle = "0.1.10"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-idle = "1 months"
+RECIPE_LAST_UPDATE_pn-telepathy-idle = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-telepathy-idle = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-python = "green"
@@ -2297,11 +2297,11 @@ RECIPE_LAST_UPDATE_pn-libsyncml = "Jul 31, 2009"
 RECIPE_MAINTAINER_pn-libsyncml = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-mission-control = "green"
-RECIPE_LATEST_VERSION_pn-telepathy-mission-control = "5.7.9"
+RECIPE_LATEST_VERSION_pn-telepathy-mission-control = "5.9.3"
 RECIPE_NO_OF_PATCHES_pn-telepathy-mission-control ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-mission-control ="2011/04/05"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-mission-control ="2 months"
-RECIPE_LAST_UPDATE_pn-telepathy-mission-control = "Apr 15, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-mission-control ="2011/10/04"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-mission-control ="1 months"
+RECIPE_LAST_UPDATE_pn-telepathy-mission-control = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-telepathy-mission-control = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libetpan = "red"
@@ -2559,11 +2559,11 @@ RECIPE_LAST_UPDATE_pn-libvorbis = "Nov 15, 2010"
 RECIPE_MAINTAINER_pn-libvorbis = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libogg="green"
-RECIPE_LATEST_VERSION_pn-libogg="1.2.2"
+RECIPE_LATEST_VERSION_pn-libogg="1.3.0"
 RECIPE_NO_OF_PATCHES_pn-libogg="0"
-RECIPE_LATEST_RELEASE_DATE_pn-libogg="2010/12/07"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libogg="1 months"
-RECIPE_LAST_UPDATE_pn-libogg = "Dec 30, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-libogg="2011/08/04"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libogg="8 months"
+RECIPE_LAST_UPDATE_pn-libogg = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-libogg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gstreamer="green"
@@ -2698,11 +2698,11 @@ RECIPE_MAINTAINER_pn-gst-ffmpeg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libsndfile1 = "green"
 DISTRO_PN_ALIAS_pn-libsndfile1 = "Meego=libsndfile Fedora=libsndfile OpenSuSE=libsndfile Ubuntu=libsndfile Mandriva=libsndfile Debian=libsndfile"
-RECIPE_LATEST_VERSION_pn-libsndfile1 = "1.0.24"
+RECIPE_LATEST_VERSION_pn-libsndfile1 = "1.0.25"
 RECIPE_NO_OF_PATCHES_pn-libsndfile1 = "0"
-RECIPE_LATEST_RELEASE_DATE_pn-libsndfile1 = "2011/03/23"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libsndfile1 = "5 months"
-RECIPE_LAST_UPDATE_pn-libsndfile1 = "Apr 26, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-libsndfile1 = "2011/07/13"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libsndfile1 = "4 months"
+RECIPE_LAST_UPDATE_pn-libsndfile1 = "Oct 28, 2011"
 RECIPE_MAINTAINER_pn-libsndfile1 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-pulseaudio = "green"
-- 
1.7.1



