Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qbnnk-0004fB-Of
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 07:59:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jun 2011 22:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,441,1304319600"; d="scan'208";a="20132822"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2011 22:55:08 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 14:09:38 +0800
Message-Id: <9e7552bbe1cd10a8524f4eb51eefb739bf85ad25.1309327661.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309327661.git.dongxiao.xu@intel.com>
References: <cover.1309327661.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1309327661.git.dongxiao.xu@intel.com>
References: <cover.1309327661.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] distro_tracking: update some manual checking fields
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
X-List-Received-Date: Wed, 29 Jun 2011 05:59:05 -0000

linux-firmware
minicom
opkg
dpkg
wireless-tools
libgsmd
libsamplerate0

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index e9594cf..8a13426 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -47,11 +47,12 @@ RECIPE_MAINTAINER_pn-libtimedate-perl = "Nitin A Kamble <nitin.a.kamble@intel.co
 DISTRO_PN_ALIAS_pn-libtimedate-perl = "Debian=libtimedate-perl Ubuntu=libtimedate-perl"
 
 RECIPE_STATUS_pn-linux-firmware = "green"
-RECIPE_LATEST_VERSION_pn-linux-firmware = "40c0f950"
+RECIPE_LATEST_VERSION_pn-linux-firmware = "97649b1e"
 RECIPE_LATEST_RELEASE_DATE_pn-linux-firmware = "2010/12/01"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-linux-firmware = "n/a"
 RECIPE_NO_OF_PATCHES_pn-linux-firmware = "0"
 RECIPE_LAST_UPDATE_pn-linux-firmware = "Dec 30, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-linux-firmware = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-linux-firmware = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-logrotate = "red"
@@ -85,7 +86,7 @@ RECIPE_NO_OF_PATCHES_pn-minicom="1"
 RECIPE_LATEST_RELEASE_DATE_pn-minicom="2010/12/20"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom="22 months"
 RECIPE_LAST_UPDATE_pn-minicom = "Nov 24, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Jan 30, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-patch = "green"
@@ -740,6 +741,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg = "02/2010"
 RECIPE_COMMENTS_pn-opkg = ""
 RECIPE_LAST_UPDATE_pn-opkg = "Jul 21, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com"
 
 RECIPE_STATUS_pn-opkg_nogpg = "green"
@@ -753,11 +755,12 @@ RECIPE_LAST_UPDATE_pn-opkg_nogpg = "Jul 21, 2010"
 RECIPE_MAINTAINER_pn-opkg_nogpg = "Dongxiao Xu <dongxiao.xu@intel.com"
 
 RECIPE_STATUS_pn-dpkg = "green"
-RECIPE_LATEST_VERSION_pn-dpkg = "1.15.8.7"
+RECIPE_LATEST_VERSION_pn-dpkg = "1.16.0.3"
 RECIPE_INTEL_SECTION_pn-dpkg = "base utils"
-RECIPE_LATEST_RELEASE_DATE_pn-dpkg = "2010/12/20"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dpkg = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-dpkg = "2011/05/04"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dpkg = "1 months"
 RECIPE_LAST_UPDATE_pn-dpkg = "Dec 30, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-dpkg = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com"
 
 RECIPE_STATUS_pn-opkg-utils = "green"
@@ -2025,7 +2028,7 @@ RECIPE_NO_OF_PATCHES_pn-wireless-tools="3"
 RECIPE_LATEST_RELEASE_DATE_pn-wireless-tools="2007/09/18"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-wireless-tools="18 months"
 RECIPE_LAST_UPDATE_pn-wireless-tools = "Oct 19, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Jan 30, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-wireless-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez-dtl1-workaround="yellow" # LICENSE double check
@@ -2227,6 +2230,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libgsmd ="2009/08/06"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgsmd="n/a"
 DISTRO_PN_ALIAS_pn-libgsmd = "Fedora=gsm Ubuntu=libgsm Debian=libgsm Opensuse=libgsm"
 RECIPE_LAST_UPDATE_pn-libgsmd = "Nov 26, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-libgsmd = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-libgsmd = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-zeroconf = "red"
@@ -2712,7 +2716,7 @@ RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.7"
 RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Apr 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Apr 26, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
-- 
1.7.1



