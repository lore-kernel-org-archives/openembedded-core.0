Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrA-0004L2-Ta
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752163"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:13 -0800
Message-Id: <9a2c4d9c4efef92818f4e4be8c020805ff1bbdc7.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 027/113] distro_tracking_fields: update the info for recipe upgrading
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:25 -0000

From: Shane Wang <shane.wang@intel.com>

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   90 ++++++++++---------
 1 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 000b7ba..5669e83 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -169,15 +169,15 @@ RECIPE_MAINTAINER_pn-libdaemon = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_STATUS_pn-glib-2.0 = "green"
 DISTRO_PN_ALIAS_pn-glib-2.0 = "Meego=glib2 Fedora=glib2 OpenSuSE=glib2 Ubuntu=glib2.0 Mandriva=glib2.0 Debian=glib2.0"
 RECIPE_DEPENDENCY_CHECK_pn-glib-2.0 = "not done"
-RECIPE_LATEST_VERSION_pn-glib-2.0 = "2.30.1"
+RECIPE_LATEST_VERSION_pn-glib-2.0 = "2.30.2"
 RECIPE_PATCH_pn-glib-2.0+60_wait-longer-for-threads-to-die = "to be pushed upstream"
 RECIPE_PATCH_pn-glib-2.0+configure-libtool = "local"
 RECIPE_PATCH_pn-glib-2.0+glib-gettextize-dir = "marked as REMOVAL"
 RECIPE_INTEL_SECTION_pn-glib-2.0 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glib-2.0 = "20 days"
-RECIPE_LATEST_RELEASE_DATE_pn-glib-2.0 = "Oct 14, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-glib-2.0 = "Nov 11, 2011"
 RECIPE_COMMENTS_pn-glib-2.0 = ""
-RECIPE_LAST_UPDATE_pn-glib-2.0 = "Dec 1, 2011"
+RECIPE_LAST_UPDATE_pn-glib-2.0 = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-glib-2.0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpam = "green"
@@ -227,10 +227,12 @@ RECIPE_MANUAL_CHECK_DATE_pn-expat = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-expat = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dbus = "green"
-RECIPE_LATEST_VERSION_pn-dbus = "1.4.1"
+RECIPE_LATEST_VERSION_pn-dbus = "1.4.16"
+RECIPE_NO_UPDATE_REASON_pn-dbus = "the odd 1.5.8 is not stable version, 1.4.16 is the latest stable version."
 RECIPE_INTEL_SECTION_pn-dbus = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-dbus = "Dec 01, 2010"
-RECIPE_LAST_UPDATE_pn-dbus = "Jan 20, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dbus = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-dbus = "Sep 21, 2011"
+RECIPE_LAST_UPDATE_pn-dbus = "Sep 21, 2011"
 RECIPE_MAINTAINER_pn-dbus = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-dbus-glib = "green"
@@ -795,12 +797,12 @@ DISTRO_PN_ALIAS_pn-opkg-utils = "OSPDT upstream=http://svn.openmoko.org/trunk/sr
 
 RECIPE_STATUS_pn-polkit = "green"
 RECIPE_DEPENDENCY_CHECK_pn-polkit = "not done"
-RECIPE_LATEST_VERSION_pn-polkit = "0.102"
+RECIPE_LATEST_VERSION_pn-polkit = "0.103"
 RECIPE_INTEL_SECTION_pn-polkit = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-polkit = "Aug 01, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-polkit = "Dec 06, 2011"
 RECIPE_COMMENTS_pn-polkit = ""
-RECIPE_LAST_UPDATE_pn-polkit = "Oct 28, 2011"
+RECIPE_LAST_UPDATE_pn-polkit = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-polkit = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-psplash = "not done"
@@ -954,12 +956,12 @@ RECIPE_MAINTAINER_pn-gperf = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-valgrind = "green"
 RECIPE_DEPENDENCY_CHECK_pn-valgrind = "not done"
-RECIPE_LATEST_VERSION_pn-valgrind = "3.6.1"
+RECIPE_LATEST_VERSION_pn-valgrind = "3.7.0"
 RECIPE_INTEL_SECTION_pn-valgrind = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-valgrind = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-valgrind = "Feb 16, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-valgrind = "Nov 05, 2011"
 RECIPE_COMMENTS_pn-valgrind = ""
-RECIPE_LAST_UPDATE_pn-valgrind = "Apr 26, 2011"
+RECIPE_LAST_UPDATE_pn-valgrind = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-valgrind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-formfactor = "green"
@@ -1243,12 +1245,12 @@ RECIPE_MAINTAINER_pn-modutils-collateral = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-mtd-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mtd-utils = "not done"
-RECIPE_LATEST_VERSION_pn-mtd-utils = "1.4.1"
+RECIPE_LATEST_VERSION_pn-mtd-utils = "1.4.9"
 RECIPE_INTEL_SECTION_pn-mtd-utils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mtd-utils = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-mtd-utils = "Oct 15, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-mtd-utils = "Dec 17, 2011"
 RECIPE_COMMENTS_pn-mtd-utils = ""
-RECIPE_LAST_UPDATE_pn-mtd-utils = "Nov 18, 2010"
+RECIPE_LAST_UPDATE_pn-mtd-utils = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-mtd-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-procps = "red"
@@ -2138,11 +2140,11 @@ RECIPE_MANUAL_CHECK_DATE_pn-bluez4 = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-bluez4 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpcap="green"
-RECIPE_LATEST_VERSION_pn-libpcap="1.1.1"
+RECIPE_LATEST_VERSION_pn-libpcap="1.2.0"
 RECIPE_NO_OF_PATCHES_pn-libpcap="2"
-RECIPE_LATEST_RELEASE_DATE_pn-libpcap="Apr 05, 2010"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpcap="2 months"
-RECIPE_LAST_UPDATE_pn-libpcap = "Jun 30, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-libpcap="Jul 24, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpcap="15 months"
+RECIPE_LAST_UPDATE_pn-libpcap = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-libpcap = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-wpa-supplicant="green"
@@ -2247,11 +2249,11 @@ RECIPE_LAST_UPDATE_pn-libopensync-plugin-syncml = "Jul 31, 2009"
 RECIPE_MAINTAINER_pn-libopensync-plugin-syncml = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-ofono = "green"
-RECIPE_LATEST_VERSION_pn-ofono = "0.45"
+RECIPE_LATEST_VERSION_pn-ofono = "1.0"
 RECIPE_NO_OF_PATCHES_pn-ofono="0"
-RECIPE_LATEST_RELEASE_DATE_pn-ofono="Mar 15, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-ofono="Dec 22, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ofono="15 days"
-RECIPE_LAST_UPDATE_pn-ofono = "Apr 15, 2011"
+RECIPE_LAST_UPDATE_pn-ofono = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-ofono = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-ofono = "Debian=ofono Ubuntu=ofono"
 
@@ -2273,10 +2275,10 @@ RECIPE_MAINTAINER_pn-telepathy-gabble = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-glib = "green"
 RECIPE_NO_OF_PATCHES_pn-telepathy-glib ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "Nov 8, 2011"
-RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.17.0"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "Dec 19, 2011"
+RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.17.4"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-glib = "10 days"
-RECIPE_LAST_UPDATE_pn-telepathy-glib = "Dec 1, 2011"
+RECIPE_LAST_UPDATE_pn-telepathy-glib = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-telepathy-glib = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-idle = "green"
@@ -2624,6 +2626,7 @@ RECIPE_STATUS_pn-gstreamer="green"
 RECIPE_LATEST_VERSION_pn-gstreamer="0.10.32"
 RECIPE_NO_OF_PATCHES_pn-gstreamer="2"
 RECIPE_LATEST_RELEASE_DATE_pn-gstreamer="Jan 31, 2011"
+RECIPE_NO_UPDATE_REASON_pn-gstreamer="upgrading to 0.11.1 causes gst-fluendo-mpegdemux compilation failure due to API conflicts. Probably 0.11 is not stable enough for some gst-* recipes"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gstreamer="2 month"
 RECIPE_LAST_UPDATE_pn-gstreamer = "Apr 15, 2011"
 RECIPE_MAINTAINER_pn-gstreamer = "Dongxiao Xu <dongxiao.xu@intel.com>"
@@ -2631,6 +2634,7 @@ RECIPE_MAINTAINER_pn-gstreamer = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-gst-plugins-base="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-base = "Meego=gst-plugins-base Fedora=gstreamer-plugins-base OpenSuSE=gstreamer-plugins-base Ubuntu=gst-plugins-base0.10 Mandriva=gstreamer0.10-plugins-base Debian=gst-plugins-base0.10"
 RECIPE_LATEST_VERSION_pn-gst-plugins-base="0.10.32"
+RECIPE_NO_UPDATE_REASON_pn-gst-plugins-base="gstreamer can not be upgraded to 0.11 and gst-plugins-base depends on gstreamer"
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-base="0"
 RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-base="Jan 21, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-base="2 months"
@@ -2648,20 +2652,20 @@ RECIPE_MAINTAINER_pn-gst-plugins-good = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gst-plugins-ugly="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-ugly = "OpenSuSE=gstreamer-plugins-ugly Mandriva=gstreamer0.10-plugins-ugly Debian=gst-plugins-ugly0.10"
-RECIPE_LATEST_VERSION_pn-gst-plugins-ugly="0.10.17"
+RECIPE_LATEST_VERSION_pn-gst-plugins-ugly="0.10.18"
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-ugly="0"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-ugly="Jan 21, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-ugly="May 10, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-ugly="4 months"
-RECIPE_LAST_UPDATE_pn-gst-plugins-ugly = "Apr 15, 2011"
+RECIPE_LAST_UPDATE_pn-gst-plugins-ugly = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-gst-plugins-ugly = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gst-plugins-bad="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-bad = "Fedora=gstreamer-plugins-bad-free OpenSuSE=gstreamer-plugins-bad Debian=gst-plugins-bad0.10"
-RECIPE_LATEST_VERSION_pn-gst-plugins-bad="0.10.21"
+RECIPE_LATEST_VERSION_pn-gst-plugins-bad="0.10.22"
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-bad="0"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-bad="Jan 21, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-bad="May 10, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-bad="4 months"
-RECIPE_LAST_UPDATE_pn-gst-plugins-bad = "Apr 15, 2011"
+RECIPE_LAST_UPDATE_pn-gst-plugins-bad = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-gst-plugins-bad = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-alsa-utils="green"
@@ -2738,11 +2742,11 @@ DISTRO_PN_ALIAS_pn-gst-openmax="OSPDT upstream=http://cgit.freedesktop.org/gstre
 
 RECIPE_STATUS_pn-gst-ffmpeg = "green"
 DISTRO_PN_ALIAS_pn-gst-ffmpeg = "Mandriva=gstreamer0.10-ffmpeg Debian=gstreamer0.10-ffmpeg"
-RECIPE_LATEST_VERSION_pn-gst-ffmpeg = "0.10.11"
+RECIPE_LATEST_VERSION_pn-gst-ffmpeg = "0.10.13"
 RECIPE_NO_OF_PATCHES_pn-gst-ffmpeg = "1"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-ffmpeg = "Jul 15, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-ffmpeg = "Nov 02, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-ffmpeg = "4 months"
-RECIPE_LAST_UPDATE_pn-gst-ffmpeg = "Dec 14, 2010"
+RECIPE_LAST_UPDATE_pn-gst-ffmpeg = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-gst-ffmpeg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libsndfile1 = "green"
@@ -2777,20 +2781,20 @@ RECIPE_LAST_UPDATE_pn-libnice = "Aug 19, 2009"
 RECIPE_MAINTAINER_pn-libnice = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gst-fluendo-mp3 = "green"
-RECIPE_LATEST_VERSION_pn-gst-fluendo-mp3 = "0.10.15"
+RECIPE_LATEST_VERSION_pn-gst-fluendo-mp3 = "0.10.16"
 RECIPE_NO_OF_PATCHES_pn-gst-fluendo-mp3 = "1"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mp3 = "Oct 21, 2010"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mp3 = "3 months"
-RECIPE_LAST_UPDATE_pn-gst-fluendo-mp3 = "Dec 7, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mp3 = "Dec 5, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mp3 = "14 months"
+RECIPE_LAST_UPDATE_pn-gst-fluendo-mp3 = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-gst-fluendo-mp3 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-gst-fluendo-mp3 = "Debian=gstreamer0.10-fluendo-mp3 Ubuntu=gstreamer0.10-fluendo-mp3"
 
 RECIPE_STATUS_pn-gst-fluendo-mpegdemux = "green"
-RECIPE_LATEST_VERSION_pn-gst-fluendo-mpegdemux = "0.10.67"
+RECIPE_LATEST_VERSION_pn-gst-fluendo-mpegdemux = "0.10.69"
 RECIPE_NO_OF_PATCHES_pn-gst-fluendo-mpegdemux = "0"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mpegdemux = "Mar 17, 2011"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mpegdemux = "6 days"
-RECIPE_LAST_UPDATE_pn-gst-fluendo-mpegdemux = "Apr 26, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mpegdemux = "Oct 19, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mpegdemux = "3 months"
+RECIPE_LAST_UPDATE_pn-gst-fluendo-mpegdemux = "Dec 23, 2011"
 RECIPE_MAINTAINER_pn-gst-fluendo-mpegdemux = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-gst-fluendo-mpegdemux = "Ubuntu=gstreamer0.10-fluendo-mpegdemux Debian=gstreamer0.10-fluendo-mpegdemux"
 
-- 
1.7.6.4



