Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RT1bK-00066J-Cv
	for openembedded-core@openembedded.org; Wed, 23 Nov 2011 02:26:15 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 17:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="88336254"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2011 17:18:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 22 Nov 2011 17:18:26 -0800
Message-Id: <84c2827c97ad3b3ad965c2aee8d6c7665e38893e.1322008856.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
Subject: [PATCH 5/7] distro_tracking: update manual checks for recipes
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
X-List-Received-Date: Wed, 23 Nov 2011 01:26:15 -0000

From: Shane Wang <shane.wang@intel.com>

Updating manual checks for minicom, libtirpc, opkg, which, quota, rpcbind, strace, wireless-tool, irda-utils, libical, flac, libomxil, libsamplerate0, etc.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   48 ++++++++++++-------
 1 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1092b42..565d060 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -82,13 +82,13 @@ RECIPE_LATEST_VERSION_pn-mingetty = "1.08"
 RECIPE_LAST_UPDATE_pn-mingetty = "Sep 1, 2010"
 RECIPE_MAINTAINER_pn-mingetty = "Xiaofeng.Yan <xiaofeng@windriver.com>"
 
-RECIPE_STATUS_pn-minicom="green"
-RECIPE_LATEST_VERSION_pn-minicom="2.5"
-RECIPE_NO_OF_PATCHES_pn-minicom="1"
-RECIPE_LATEST_RELEASE_DATE_pn-minicom="Dec 20, 2010"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom="22 months"
+RECIPE_STATUS_pn-minicom = "green"
+RECIPE_LATEST_VERSION_pn-minicom = "2.5"
+RECIPE_NO_OF_PATCHES_pn-minicom = "1"
+RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Dec 20, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom = "22 months"
 RECIPE_LAST_UPDATE_pn-minicom = "Nov 24, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Jun 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-patch = "green"
@@ -331,6 +331,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtirpc = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libtirpc = "Nov 01, 2009"
 RECIPE_COMMENTS_pn-libtirpc = ""
 RECIPE_LAST_UPDATE_pn-libtirpc = "Sep 1, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libtirpc = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gdbm = "green"
@@ -751,7 +752,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg = "Feb 01, 2010"
 RECIPE_COMMENTS_pn-opkg = ""
 RECIPE_LAST_UPDATE_pn-opkg = "Jul 21, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Jun 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com"
 DISTRO_PN_ALIAS_pn-opkg = "OSPDT upstream=http://svn.openmoko.org/trunk/src/tar"
 
@@ -995,6 +996,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-which = "7 months"
 RECIPE_LATEST_RELEASE_DATE_pn-which = "Aug 01, 2008"
 RECIPE_COMMENTS_pn-which = ""
 RECIPE_LAST_UPDATE_pn-which = "Aug 13, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-which = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-which = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-quota = "green"
@@ -1005,6 +1007,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quota = "13 months"
 RECIPE_LATEST_RELEASE_DATE_pn-quota = "Feb 17, 2010"
 RECIPE_COMMENTS_pn-quota = ""
 RECIPE_LAST_UPDATE_pn-quota = "Nov 15, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-quota = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
@@ -1351,6 +1354,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rpcbind = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-rpcbind = "May 01, 2009"
 RECIPE_COMMENTS_pn-rpcbind = ""
 RECIPE_LAST_UPDATE_pn-rpcbind = "Sep 1, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-rpcbind = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-rpcbind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-time = "green"
@@ -1688,13 +1692,14 @@ RECIPE_MANUAL_CHECK_DATE_pn-zip = "Nov 08, 2011"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
-RECIPE_LAST_UPDATE_pn-strace = "May 25, 2010"
+RECIPE_LAST_UPDATE_pn-strace = "Oct 14, 2011"
 RECIPE_MAINTAINER_pn-strace = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-strace = "not done"
-RECIPE_LATEST_VERSION_pn-strace = "4.5.20"
+RECIPE_LATEST_VERSION_pn-strace = "4.6"
 RECIPE_INTEL_SECTION_pn-strace = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-strace = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-strace = "Apr 01, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-strace = "Nov 22, 2011"
 RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
@@ -2080,7 +2085,7 @@ RECIPE_NO_OF_PATCHES_pn-wireless-tools="3"
 RECIPE_LATEST_RELEASE_DATE_pn-wireless-tools="Sep 18, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-wireless-tools="18 months"
 RECIPE_LAST_UPDATE_pn-wireless-tools = "Oct 19, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Jun 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-wireless-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez-dtl1-workaround="yellow" # LICENSE double check
@@ -2097,6 +2102,7 @@ RECIPE_NO_OF_PATCHES_pn-irda-utils="0"
 RECIPE_LATEST_RELEASE_DATE_pn-irda-utils="Jul 10, 2006"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-irda-utils="4 months"
 RECIPE_LAST_UPDATE_pn-irda-utils = "Jun 25, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-irda-utils = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-irda-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez4="green"
@@ -2357,11 +2363,12 @@ RECIPE_LAST_UPDATE_pn-orinoco-conf = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-orinoco-conf = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libical="green"
-RECIPE_LATEST_VERSION_pn-libical="0.46"
-RECIPE_NO_OF_PATCHES_pn-libical="0"
-RECIPE_LATEST_RELEASE_DATE_pn-libical="Aug 30, 2010"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical="11 months"
+RECIPE_LATEST_VERSION_pn-libical = "0.47"
+RECIPE_NO_OF_PATCHES_pn-libical = "0"
+RECIPE_LATEST_RELEASE_DATE_pn-libical = "Oct 12, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "11 months"
 RECIPE_LAST_UPDATE_pn-libical = "Nov 16, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-libical = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libical = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-task-base="green"
@@ -2569,6 +2576,7 @@ RECIPE_NO_OF_PATCHES_pn-flac="3"
 RECIPE_LATEST_RELEASE_DATE_pn-flac="Sep 16, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-flac="2 months"
 RECIPE_LAST_UPDATE_pn-flac = "Jun 26, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-flac = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-flac = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libvorbis="green"
@@ -2637,6 +2645,7 @@ RECIPE_NO_OF_PATCHES_pn-alsa-utils="1"
 RECIPE_LATEST_RELEASE_DATE_pn-alsa-utils="Jan 31, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-alsa-utils="9 months"
 RECIPE_LAST_UPDATE_pn-alsa-utils = "Apr 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-alsa-utils = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-alsa-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-alsa-lib="green"
@@ -2767,16 +2776,17 @@ RECIPE_MAINTAINER_pn-gst-fluendo-mpegdemux = "Dongxiao Xu <dongxiao.xu@intel.com
 DISTRO_PN_ALIAS_pn-gst-fluendo-mpegdemux = "Ubuntu=gstreamer0.10-fluendo-mpegdemux Debian=gstreamer0.10-fluendo-mpegdemux"
 
 RECIPE_STATUS_pn-libomxil = "red"
-RECIPE_LATEST_VERSION_pn-libomxil = "0.9.2.1"
+RECIPE_LATEST_VERSION_pn-libomxil = "0.9.3"
 RECIPE_LAST_UPDATE_pn-libomxil = "Jan 11, 2008"
 RECIPE_MAINTAINER_pn-libomxil = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-libomxil = "Nov 22, 2011"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 
 RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
-RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.7"
+RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.8"
 RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Apr 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Jun 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
@@ -6040,7 +6050,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "Oct 25, 2011"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
-RECIPE_MAINTAINER_pn-update-alternatives-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com"
+RECIPE_MAINTAINER_pn-update-alternatives-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-update-alternatives-dpkg = "Nov 22, 2011"
+
 DISTRO_PN_ALIAS_pn-emgd-driver-bin = "Intel"
 DISTRO_PN_ALIAS_pn-external-csl-toolchain = "OE-Core"
 DISTRO_PN_ALIAS_pn-external-poky-toolchain = "OE-Core"
-- 
1.7.5.4



