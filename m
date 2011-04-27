Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEM-0005Nr-5o
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2011 00:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203280"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:42 -0700
Message-Id: <e1ba8be5497302c2d8c21e66591774cd0263b9a9.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 26 Apr 2011 14:01:37 +0800
Date: Wed, 27 Apr 2011  0:29:41 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 21/52] distro_tracking_fields: cwautomacros, valgrind, etc
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:14 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   72 ++++++++++---------
 1 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index e7201b0..767c05b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -169,16 +169,15 @@ RECIPE_MAINTAINER_pn-libdaemon = "Yu Ke <ke.yu@intel.com>"
 RECIPE_STATUS_pn-glib-2.0 = "green"
 DISTRO_PN_ALIAS_pn-glib-2.0 = "Meego=glib2 Fedora=glib2 OpenSuSE=glib2 Ubuntu=glib2.0 Mandriva=glib2.0 Debian=glib2.0"
 RECIPE_DEPENDENCY_CHECK_pn-glib-2.0 = "not done"
-RECIPE_LATEST_VERSION_pn-glib-2.0 = "2.27.5"
+RECIPE_LATEST_VERSION_pn-glib-2.0 = "2.28.6"
 RECIPE_PATCH_pn-glib-2.0+60_wait-longer-for-threads-to-die = "to be pushed upstream"
 RECIPE_PATCH_pn-glib-2.0+configure-libtool = "local"
 RECIPE_PATCH_pn-glib-2.0+glib-gettextize-dir = "marked as REMOVAL"
 RECIPE_INTEL_SECTION_pn-glib-2.0 = "base libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glib-2.0 = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-glib-2.0 = "2010/12/20"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-glib-2.0 = "15 days"
+RECIPE_LATEST_RELEASE_DATE_pn-glib-2.0 = "2011/04/14"
 RECIPE_COMMENTS_pn-glib-2.0 = ""
-RECIPE_LAST_UPDATE_pn-glib-2.0 = "Dec 30, 2010"
-RECIPE_NO_UPDATE_REASON_pn-glib-2.0 ="do not upgrade to 2.27.5 because it is unstable version"
+RECIPE_LAST_UPDATE_pn-glib-2.0 = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-glib-2.0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpam = "green"
@@ -761,12 +760,12 @@ DISTRO_PN_ALIAS_pn-opkg-utils = "OSPDT upstream=http://svn.openmoko.org/trunk/sr
 
 RECIPE_STATUS_pn-polkit = "green"
 RECIPE_DEPENDENCY_CHECK_pn-polkit = "not done"
-RECIPE_LATEST_VERSION_pn-polkit = "0.99"
+RECIPE_LATEST_VERSION_pn-polkit = "0.101"
 RECIPE_INTEL_SECTION_pn-polkit = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-polkit = "2010/09/15"
+RECIPE_LATEST_RELEASE_DATE_pn-polkit = "2011/03/03"
 RECIPE_COMMENTS_pn-polkit = ""
-RECIPE_LAST_UPDATE_pn-polkit = "Nov 18, 2010"
+RECIPE_LAST_UPDATE_pn-polkit = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-polkit = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-psplash = "not done"
@@ -916,12 +915,12 @@ RECIPE_MAINTAINER_pn-gperf = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-valgrind = "green"
 RECIPE_DEPENDENCY_CHECK_pn-valgrind = "not done"
-RECIPE_LATEST_VERSION_pn-valgrind = "3.6.0"
+RECIPE_LATEST_VERSION_pn-valgrind = "3.6.1"
 RECIPE_INTEL_SECTION_pn-valgrind = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-valgrind = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-valgrind = "2010/10/21"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-valgrind = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-valgrind = "2011/02/16"
 RECIPE_COMMENTS_pn-valgrind = ""
-RECIPE_LAST_UPDATE_pn-valgrind = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-valgrind = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-valgrind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-formfactor = "green"
@@ -946,12 +945,12 @@ RECIPE_MAINTAINER_pn-makedevs = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-cwautomacros = "green"
 RECIPE_DEPENDENCY_CHECK_pn-cwautomacros = "not done"
-RECIPE_LATEST_VERSION_pn-cwautomacros = "20090610"
+RECIPE_LATEST_VERSION_pn-cwautomacros = "20110201"
 RECIPE_INTEL_SECTION_pn-cwautomacros = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cwautomacros = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-cwautomacros = "06/2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cwautomacros = "3 days"
+RECIPE_LATEST_RELEASE_DATE_pn-cwautomacros = "2011/02/01"
 RECIPE_COMMENTS_pn-cwautomacros = ""
-RECIPE_LAST_UPDATE_pn-cwautomacros = "Aug 6, 2010"
+RECIPE_LAST_UPDATE_pn-cwautomacros = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-cwautomacros = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-cwautomacros= "OSPDT upstream=http://cwautomacros.berlios.de/"
 
@@ -2093,12 +2092,11 @@ RECIPE_LAST_UPDATE_pn-gupnp = "Apr 15, 2011"
 RECIPE_MAINTAINER_pn-gupnp= "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gupnp-av = "green"
-RECIPE_LATEST_VERSION_pn-gupnp-av = "0.7.1"
+RECIPE_LATEST_VERSION_pn-gupnp-av = "0.8.0"
 RECIPE_NO_OF_PATCHES_pn-gupnp-av= "0"
-RECIPE_LATEST_RELEASE_DATE_pn-gupnp-av= "2010/11/08"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gupnp-av= "15 days"
-RECIPE_LAST_UPDATE_pn-gupnp-av = "Nov 25, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gupnp-av = "Jan 30, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-gupnp-av= "2011/04/08"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gupnp-av= "4 months"
+RECIPE_LAST_UPDATE_pn-gupnp-av = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-gupnp-av = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gupnp-tools = "green"
@@ -2182,9 +2180,12 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-python="4 months"
 RECIPE_LAST_UPDATE_pn-telepathy-python = "Dec 30, 2010"
 RECIPE_MAINTAINER_pn-telepathy-python = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-bluez-hcidump = "red"
-RECIPE_LATEST_VERSION_pn-bluez-hcidump = "1.42"
-RECIPE_LAST_UPDATE_pn-bluez-hcidump = "Nov 7, 2008"
+RECIPE_STATUS_pn-bluez-hcidump = "green"
+RECIPE_LATEST_VERSION_pn-bluez-hcidump = "2.0"
+RECIPE_NO_OF_PATCHES_pn-bluez-hcidump = "0"
+RECIPE_LATEST_RELEASE_DATE_pn-bluez-hcidump = "2011/01/27"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bluez-hcidump = "4 months"
+RECIPE_LAST_UPDATE_pn-bluez-hcidump = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-bluez-hcidump = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-ppp-dialin = "red"
@@ -2624,10 +2625,13 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-ffmpeg = "4 months"
 RECIPE_LAST_UPDATE_pn-gst-ffmpeg = "Dec 14, 2010"
 RECIPE_MAINTAINER_pn-gst-ffmpeg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-libsndfile1 = "red"
+RECIPE_STATUS_pn-libsndfile1 = "green"
 DISTRO_PN_ALIAS_pn-libsndfile1 = "Meego=libsndfile Fedora=libsndfile OpenSuSE=libsndfile Ubuntu=libsndfile Mandriva=libsndfile Debian=libsndfile"
-RECIPE_LATEST_VERSION_pn-libsndfile1 = "1.0.21 "
-RECIPE_LAST_UPDATE_pn-libsndfile1 = "Nov 11, 2010"
+RECIPE_LATEST_VERSION_pn-libsndfile1 = "1.0.24"
+RECIPE_NO_OF_PATCHES_pn-libsndfile1 = "0"
+RECIPE_LATEST_RELEASE_DATE_pn-libsndfile1 = "2011/03/23"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libsndfile1 = "5 months"
+RECIPE_LAST_UPDATE_pn-libsndfile1 = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-libsndfile1 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-pulseaudio = "green"
@@ -2662,11 +2666,11 @@ RECIPE_MAINTAINER_pn-gst-fluendo-mp3 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-gst-fluendo-mp3 = "Debian=gstreamer0.10-fluendo-mp3  Ubuntu=gstreamer0.10-fluendo-mp3"
 
 RECIPE_STATUS_pn-gst-fluendo-mpegdemux = "green"
-RECIPE_LATEST_VERSION_pn-gst-fluendo-mpegdemux = "0.10.20"
+RECIPE_LATEST_VERSION_pn-gst-fluendo-mpegdemux = "0.10.67"
 RECIPE_NO_OF_PATCHES_pn-gst-fluendo-mpegdemux = "0"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mpegdemux = "2010/10/20"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mpegdemux = "1 months"
-RECIPE_LAST_UPDATE_pn-gst-fluendo-mpegdemux = "Dec 7, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mpegdemux = "2011/03/17"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mpegdemux = "6 days"
+RECIPE_LAST_UPDATE_pn-gst-fluendo-mpegdemux = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-gst-fluendo-mpegdemux = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-gst-fluendo-mpegdemux = "Ubuntu=gstreamer0.10-fluendo-mpegdemux Debian=gstreamer0.10-fluendo-mpegdemux"
 
@@ -2676,11 +2680,11 @@ RECIPE_LAST_UPDATE_pn-libomxil = "Jan 11, 2008"
 RECIPE_MAINTAINER_pn-libomxil = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 
-RECIPE_STATUS_pn-libsamplerate0 = "red"
+RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.7"
-RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Nov 22, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Jan 30, 2011"
+RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Apr 26, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Apr 26, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
-- 
1.7.1.1



