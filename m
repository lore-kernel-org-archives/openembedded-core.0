Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yJ-0005Qe-Q9
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2012 01:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="147142457"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2012 01:16:01 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:32 +0800
Message-Id: <242c8aaec363cfc2765f5a0ff18a6706d02e572f.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
Subject: [PATCH 8/8] distro_tracking_fields: Change for ofono, iptables, etc
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:41 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   46 ++++++++++----------
 1 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c20961c..c7e6d7d 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -902,14 +902,14 @@ DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 
 RECIPE_STATUS_pn-iproute2 = "green"
 RECIPE_DEPENDENCY_CHECK_pn-iproute2 = "not done"
-RECIPE_LATEST_VERSION_pn-iproute2 = "3.2.0"
+RECIPE_LATEST_VERSION_pn-iproute2 = "3.3.0"
 RECIPE_PATCH_pn-iproute2+configure-cross = "to be pushed upstream"
 RECIPE_INTEL_SECTION_pn-iproute2 = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-iproute2 = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-iproute2 = "Jan 05, 2012"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-iproute2 = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-iproute2 = "Mar 20, 2012"
 RECIPE_COMMENTS_pn-iproute2 = ""
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
-RECIPE_LAST_UPDATE_pn-iproute2 = "Jan 22, 2012"
+RECIPE_LAST_UPDATE_pn-iproute2 = "Apr 28, 2012"
 RECIPE_MAINTAINER_pn-iproute2 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-netbase = "green"
@@ -1105,9 +1105,10 @@ RECIPE_LAST_UPDATE_pn-gzip = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-iptables = "green"
-RECIPE_LAST_UPDATE_pn-iptables = "Jan 22, 2012"
+RECIPE_LAST_UPDATE_pn-iptables = "Apr 28, 2012"
+RECIPE_LATEST_RELEASE_DATE_pn-iptables = "Apr 28, 2012"
 RECIPE_MAINTAINER_pn-iptables = "Dongxiao Xu <dongxiao.xu@intel.com>"
-RECIPE_LATEST_VERSION_pn-iptables = "1.4.12.2"
+RECIPE_LATEST_VERSION_pn-iptables = "1.4.13"
 
 RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
@@ -2360,11 +2361,11 @@ RECIPE_MANUAL_CHECK_DATE_pn-mobile-broadband-provider-info = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Shane Wang <shane.wang@intel.com>"
 
 RECIPE_STATUS_pn-ofono = "green"
-RECIPE_LATEST_VERSION_pn-ofono = "1.3"
+RECIPE_LATEST_VERSION_pn-ofono = "1.6"
 RECIPE_NO_OF_PATCHES_pn-ofono="0"
-RECIPE_LATEST_RELEASE_DATE_pn-ofono="Jan 20, 2012"
+RECIPE_LATEST_RELEASE_DATE_pn-ofono="Apr 20, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ofono="15 days"
-RECIPE_LAST_UPDATE_pn-ofono = "Jan 22, 2012"
+RECIPE_LAST_UPDATE_pn-ofono = "Apr 28, 2012"
 RECIPE_MAINTAINER_pn-ofono = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-ofono = "Debian=ofono Ubuntu=ofono"
 
@@ -2386,15 +2387,15 @@ RECIPE_MAINTAINER_pn-telepathy-gabble = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-glib = "green"
 RECIPE_NO_OF_PATCHES_pn-telepathy-glib ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "Dec 19, 2011"
-RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.17.4"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib = "Apr 20, 2012"
+RECIPE_LATEST_VERSION_pn-telepathy-glib = "0.18.1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-glib = "10 days"
-RECIPE_LAST_UPDATE_pn-telepathy-glib = "Dec 23, 2011"
+RECIPE_LAST_UPDATE_pn-telepathy-glib = "Apr 28, 2012"
 RECIPE_MAINTAINER_pn-telepathy-glib = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-idle = "green"
 RECIPE_NO_OF_PATCHES_pn-telepathy-idle ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-glib ="Oct 28, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-idle ="Oct 28, 2011"
 RECIPE_LATEST_VERSION_pn-telepathy-idle = "0.1.10"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-idle = "5 months"
 RECIPE_LAST_UPDATE_pn-telepathy-idle = "Dec 1, 2011"
@@ -2409,12 +2410,11 @@ RECIPE_LAST_UPDATE_pn-telepathy-python = "Dec 30, 2010"
 RECIPE_MAINTAINER_pn-telepathy-python = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez-hcidump = "green"
-RECIPE_LATEST_VERSION_pn-bluez-hcidump = "2.2"
+RECIPE_LATEST_VERSION_pn-bluez-hcidump = "2.4"
 RECIPE_NO_OF_PATCHES_pn-bluez-hcidump = "0"
-RECIPE_LATEST_RELEASE_DATE_pn-bluez-hcidump = "Dec 23, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-bluez-hcidump = "Apr 20, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bluez-hcidump = "4 months"
-RECIPE_LAST_UPDATE_pn-bluez-hcidump = "Jan 22, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-bluez-hcidump = "Jan 22, 2012"
+RECIPE_LAST_UPDATE_pn-bluez-hcidump = "Apr 28, 2012"
 RECIPE_MAINTAINER_pn-bluez-hcidump = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-ppp-dialin = "red"
@@ -2462,11 +2462,11 @@ RECIPE_LAST_UPDATE_pn-libsyncml = "Jul 31, 2009"
 RECIPE_MAINTAINER_pn-libsyncml = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-telepathy-mission-control = "green"
-RECIPE_LATEST_VERSION_pn-telepathy-mission-control = "5.10.1"
+RECIPE_LATEST_VERSION_pn-telepathy-mission-control = "5.12.0"
 RECIPE_NO_OF_PATCHES_pn-telepathy-mission-control ="0"
-RECIPE_LATEST_RELEASE_DATE_pn-telepathy-mission-control ="Nov 8, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-telepathy-mission-control ="Apr 2, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-telepathy-mission-control ="1 months"
-RECIPE_LAST_UPDATE_pn-telepathy-mission-control = "Dec 1, 2011"
+RECIPE_LAST_UPDATE_pn-telepathy-mission-control = "Apr 28, 2012"
 RECIPE_MAINTAINER_pn-telepathy-mission-control = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libetpan = "red"
@@ -2922,11 +2922,11 @@ RECIPE_MAINTAINER_pn-gst-fluendo-mp3 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-gst-fluendo-mp3 = "Debian=gstreamer0.10-fluendo-mp3 Ubuntu=gstreamer0.10-fluendo-mp3"
 
 RECIPE_STATUS_pn-gst-fluendo-mpegdemux = "green"
-RECIPE_LATEST_VERSION_pn-gst-fluendo-mpegdemux = "0.10.69"
+RECIPE_LATEST_VERSION_pn-gst-fluendo-mpegdemux = "0.10.70"
 RECIPE_NO_OF_PATCHES_pn-gst-fluendo-mpegdemux = "0"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mpegdemux = "Oct 19, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mpegdemux = "Mar 28, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mpegdemux = "3 months"
-RECIPE_LAST_UPDATE_pn-gst-fluendo-mpegdemux = "Dec 23, 2011"
+RECIPE_LAST_UPDATE_pn-gst-fluendo-mpegdemux = "Apr 28, 2012"
 RECIPE_MAINTAINER_pn-gst-fluendo-mpegdemux = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-gst-fluendo-mpegdemux = "Ubuntu=gstreamer0.10-fluendo-mpegdemux Debian=gstreamer0.10-fluendo-mpegdemux"
 
-- 
1.7.4.1



