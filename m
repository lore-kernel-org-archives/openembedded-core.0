Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrN-0004iK-Rx
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752248"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:57 -0800
Message-Id: <8ed34b807f6d23f6d6049c59e587738c3a7fc7e3.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 071/113] distro_tracking: Updated for Upgrades and Manual Check Dates
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   51 ++++++++++----------
 1 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7085cb3..e1b7c1b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -479,6 +479,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Sep 06, 2010"
 RECIPE_LAST_UPDATE_pn-openssl = "Nov 28, 2011"
 RECIPE_MAINTAINER_pn-openssl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-openssl = "base libs"
+RECIPE_NO_UPDATE_REASON_pn-openssl = "1.0.0e is latest"
 
 RECIPE_STATUS_pn-libnss-mdns = "green"
 DISTRO_PN_ALIAS_pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
@@ -506,7 +507,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-popt = "May 01, 2010"
 RECIPE_STATUS_pn-sqlite3 = "green"   # need upgrade
 RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.9"
 RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Nov 01, 2011"
-RECIPE_LAST_UPDATE_pn-sqlite3 = "Dec 01, 2011"
+RECIPE_LAST_UPDATE_pn-sqlite3 = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-sqlite3 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sqlite3 = "not done"
@@ -535,7 +536,7 @@ RECIPE_STATUS_pn-libcap = "yellow"   # hand crafted Makefiles
 RECIPE_LATEST_VERSION_pn-libcap = "2.22"
 RECIPE_LATEST_RELEASE_DATE_pn-libcap = "Jan 01, 2010"
 RECIPE_LAST_UPDATE_pn-libcap = "Jul 25, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Dec 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-libcap = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libcap = "done"
 RECIPE_INTEL_SECTION_pn-libcap = "base libs"
@@ -593,7 +594,7 @@ RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
 RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libcheck = "Sep 23, 2009"
 RECIPE_LAST_UPDATE_pn-libcheck = "Aug 20, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-libcheck = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-libcheck = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcheck = "9 months"
@@ -1298,7 +1299,7 @@ RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-console-tools = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
-RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Dec 27, 2011"
 
 RECIPE_STATUS_pn-fuse = "red"
 RECIPE_LATEST_VERSION_pn-fuse = "2.8.4"
@@ -1339,7 +1340,7 @@ RECIPE_MAINTAINER_pn-pm-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-psmisc = "red"
 RECIPE_LATEST_VERSION_pn-psmisc = "22.14"
 RECIPE_LATEST_RELEASE_DATE_pn-psmisc = "Jun 20, 2011"
-RECIPE_LAST_UPDATE_pn-psmisc = "Dec 01, 2011"
+RECIPE_LAST_UPDATE_pn-psmisc = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-psmisc = "Saul Wold <sgw@linux.intel.com>"
 
@@ -1347,7 +1348,7 @@ RECIPE_STATUS_pn-boost = "yellow"
 RECIPE_LATEST_VERSION_pn-boost = "1.47.0"
 RECIPE_LATEST_RELEASE_DATE_pn-boost = "Jul 12, 2011"
 RECIPE_LAST_UPDATE_pn-boost = "Aug 19, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-boost = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-boost = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost-jam-native = "green"
@@ -1494,8 +1495,8 @@ RECIPE_LAST_UPDATE_pn-sysfsutils = "Jun 18, 2010"
 RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
-RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Dec 01, 2011"
-RECIPE_COMMENTS_pn-sysfsutils = ""
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Dec 27, 2011"
+RECIPE_COMMENTS_pn-sysfsutils = "No update on kernel.org"
 RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-curl = "green"
@@ -1547,7 +1548,7 @@ RECIPE_STATUS_pn-less = "green"
 RECIPE_LATEST_VERSION_pn-less = "444"
 RECIPE_LATEST_RELEASE_DATE_pn-less = "Jun 9, 2011"
 RECIPE_LAST_UPDATE_pn-less = "Dec 01, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-less = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-less = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-less = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
@@ -1705,7 +1706,7 @@ RECIPE_MAINTAINER_pn-zip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zip = "not done"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "Dec 27, 2011"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1795,7 +1796,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-shared-mime-info = "Feb 01, 2010"
 RECIPE_STATUS_pn-util-linux = "green"
 RECIPE_LATEST_VERSION_pn-util-linux = "2.20.1"
 RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "Nov 07, 2011"
-RECIPE_LAST_UPDATE_pn-util-linux = "Dec 01, 2011"
+RECIPE_LAST_UPDATE_pn-util-linux = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-util-linux = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
 RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Dec 01, 2011"
@@ -1805,12 +1806,12 @@ RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
 RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "Oct 22, 2010"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-usbutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-usbutils = "done"
 RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-usbutils = "2 months"
-RECIPE_COMMENTS_pn-usbutils = ""
+RECIPE_COMMENTS_pn-usbutils = "No update on kernel.org"
 
 RECIPE_STATUS_pn-pciutils = "yellow"    # custom build system, several hacks
 RECIPE_LAST_UPDATE_pn-pciutils = "Nov 10, 2010"
@@ -1849,7 +1850,7 @@ DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 RECIPE_STATUS_pn-sysstat = "green"
 RECIPE_LATEST_VERSION_pn-sysstat = "10.0.3"
 RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Nov 27, 2011"
-RECIPE_LAST_UPDATE_pn-sysstat = "Dec 01, 2011"
+RECIPE_LAST_UPDATE_pn-sysstat = "Dec 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
@@ -1883,7 +1884,7 @@ RECIPE_STATUS_pn-cracklib="green"
 RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
 RECIPE_LATEST_RELEASE_DATE_pn-cracklib = "Aug 29, 2010"
 RECIPE_LAST_UPDATE_pn-cracklib = "Nov 13, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-cracklib="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-openobex = "red"
@@ -1914,11 +1915,11 @@ RECIPE_MANUAL_CHECK_DATE_pn-parted = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-parted = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-resolvconf = "green"
-RECIPE_LATEST_VERSION_pn-resolvconf = "1.62"
-RECIPE_LATEST_RELEASE_DATE_pn-resolvconf = "Nov 30, 2011"
-RECIPE_LAST_UPDATE_pn-resolvconf = "Dec 01, 2011"
+RECIPE_LATEST_VERSION_pn-resolvconf = "1.63"
+RECIPE_LATEST_RELEASE_DATE_pn-resolvconf = "Dec 18, 2011"
+RECIPE_LAST_UPDATE_pn-resolvconf = "Dec 28, 2011"
 RECIPE_MAINTAINER_pn-resolvconf = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-resolvconf = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-resolvconf = "Dec 28, 2011"
 RECIPE_COMMENTS_pn-resolvconf = ""
 
 RECIPE_STATUS_pn-openswan = "red"
@@ -1969,7 +1970,7 @@ RECIPE_STATUS_pn-libexif = "green"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.20"
 RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Dec 12, 2010"
 RECIPE_LAST_UPDATE_pn-libexif = "Apr 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
@@ -3498,7 +3499,7 @@ RECIPE_INTEL_SECTION_pn-qemugl="graphic app"
 RECIPE_LAST_UPDATE_pn-qemugl = "Nov 28, 2010"
 RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because the upstream is broken in x86_64 build"
 RECIPE_MAINTAINER_pn-qemugl="Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Dec 27, 2011"
 
 RECIPE_STATUS_pn-fotowall="green" # no update needed
 RECIPE_LATEST_VERSION_pn-fotowall="0.9"
@@ -5780,7 +5781,7 @@ RECIPE_MAINTAINER_pn-glew = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-squashfs-tools = "4.2"
 RECIPE_LATEST_RELEASE_DATE_pn-squashfs-tools = "Feb 28, 2011"
 RECIPE_LAST_UPDATE_pn-squashfs-tools = "Oct 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
@@ -5791,14 +5792,14 @@ RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-lame = "3.99.3"
 RECIPE_LATEST_RELEASE_DATE_pn-lame = "Nov 26, 2011"
 RECIPE_LAST_UPDATE_pn-lame = "Nov 28, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-lame = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lame = "Dec 27, 2011"
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 RECIPE_MAINTAINER_pn-lame = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
 RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004"
 RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
@@ -5806,7 +5807,7 @@ RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
 RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Dec 27, 2011"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
 RECIPE_MAINTAINER_pn-lsb = "Saul Wold <sgw@linux.intel.com>"
 
-- 
1.7.6.4



