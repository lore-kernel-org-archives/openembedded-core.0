Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmm-00042O-G3
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535268"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:15 -0800
Message-Id: <e3fda4470766460ca3b78eab51d7d72cca2c8089.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/22] distro_tracking: Update Manual Checks
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
X-List-Received-Date: Tue, 10 Jan 2012 06:02:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   50 ++++++++++----------
 1 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cc87d5c..bc61353 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -508,7 +508,7 @@ RECIPE_STATUS_pn-sqlite3 = "green"   # need upgrade
 RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.9"
 RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Nov 01, 2011"
 RECIPE_LAST_UPDATE_pn-sqlite3 = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-sqlite3 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sqlite3 = "not done"
 RECIPE_INTEL_SECTION_pn-sqlite3 = "base libs"
@@ -536,7 +536,7 @@ RECIPE_STATUS_pn-libcap = "yellow"   # hand crafted Makefiles
 RECIPE_LATEST_VERSION_pn-libcap = "2.22"
 RECIPE_LATEST_RELEASE_DATE_pn-libcap = "Jan 01, 2010"
 RECIPE_LAST_UPDATE_pn-libcap = "Jul 25, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-libcap = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libcap = "done"
 RECIPE_INTEL_SECTION_pn-libcap = "base libs"
@@ -594,7 +594,7 @@ RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
 RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libcheck = "Sep 23, 2009"
 RECIPE_LAST_UPDATE_pn-libcheck = "Aug 20, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-libcheck = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-libcheck = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcheck = "9 months"
@@ -1300,7 +1300,7 @@ RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-console-tools = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
-RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Jan 09, 2012"
 
 RECIPE_STATUS_pn-fuse = "red"
 RECIPE_LATEST_VERSION_pn-fuse = "2.8.4"
@@ -1342,14 +1342,14 @@ RECIPE_STATUS_pn-psmisc = "red"
 RECIPE_LATEST_VERSION_pn-psmisc = "22.14"
 RECIPE_LATEST_RELEASE_DATE_pn-psmisc = "Jun 20, 2011"
 RECIPE_LAST_UPDATE_pn-psmisc = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-psmisc = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost = "yellow"
-RECIPE_LATEST_VERSION_pn-boost = "1.47.0"
-RECIPE_LATEST_RELEASE_DATE_pn-boost = "Jul 12, 2011"
-RECIPE_LAST_UPDATE_pn-boost = "Aug 19, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-boost = "Dec 27, 2011"
+RECIPE_LATEST_VERSION_pn-boost = "1.48.0"
+RECIPE_LATEST_RELEASE_DATE_pn-boost = "Nov 15, 2011"
+RECIPE_LAST_UPDATE_pn-boost = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-boost = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost-jam-native = "green"
@@ -1496,7 +1496,7 @@ RECIPE_LAST_UPDATE_pn-sysfsutils = "Jun 18, 2010"
 RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
-RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Jan 09, 2012"
 RECIPE_COMMENTS_pn-sysfsutils = "No update on kernel.org"
 RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
@@ -1549,7 +1549,7 @@ RECIPE_STATUS_pn-less = "green"
 RECIPE_LATEST_VERSION_pn-less = "444"
 RECIPE_LATEST_RELEASE_DATE_pn-less = "Jun 9, 2011"
 RECIPE_LAST_UPDATE_pn-less = "Dec 01, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-less = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-less = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-less = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
@@ -1696,7 +1696,7 @@ RECIPE_MAINTAINER_pn-unzip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-unzip = "not done"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-unzip = "49 months"
-RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Jan 09, 2012"
 RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix version"
 
 RECIPE_STATUS_pn-zip = "green"
@@ -1707,7 +1707,7 @@ RECIPE_MAINTAINER_pn-zip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zip = "not done"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "Jan 09, 2012"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1807,7 +1807,7 @@ RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
 RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "Oct 22, 2010"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-usbutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-usbutils = "done"
 RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
@@ -1852,7 +1852,7 @@ RECIPE_STATUS_pn-sysstat = "green"
 RECIPE_LATEST_VERSION_pn-sysstat = "10.0.3"
 RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Nov 27, 2011"
 RECIPE_LAST_UPDATE_pn-sysstat = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
@@ -1885,7 +1885,7 @@ RECIPE_STATUS_pn-cracklib="green"
 RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
 RECIPE_LATEST_RELEASE_DATE_pn-cracklib = "Aug 29, 2010"
 RECIPE_LAST_UPDATE_pn-cracklib = "Nov 13, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-cracklib="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-openobex = "red"
@@ -1971,7 +1971,7 @@ RECIPE_STATUS_pn-libexif = "green"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.20"
 RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Dec 12, 2010"
 RECIPE_LAST_UPDATE_pn-libexif = "Apr 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
@@ -3505,7 +3505,7 @@ RECIPE_INTEL_SECTION_pn-qemugl="graphic app"
 RECIPE_LAST_UPDATE_pn-qemugl = "Nov 28, 2010"
 RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because the upstream is broken in x86_64 build"
 RECIPE_MAINTAINER_pn-qemugl="Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Jan 09, 2012"
 
 RECIPE_STATUS_pn-fotowall="green" # no update needed
 RECIPE_LATEST_VERSION_pn-fotowall="0.9"
@@ -5787,13 +5787,13 @@ RECIPE_MAINTAINER_pn-adt-installer = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_LATEST_VERSION_pn-glew = "1.7.0"
 RECIPE_LATEST_RELEASE_DATE_pn-glew = "Aug 26, 2011"
 RECIPE_LAST_UPDATE_pn-glew = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-glew = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-squashfs-tools = "4.2"
 RECIPE_LATEST_RELEASE_DATE_pn-squashfs-tools = "Feb 28, 2011"
 RECIPE_LAST_UPDATE_pn-squashfs-tools = "Oct 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
@@ -5804,14 +5804,14 @@ RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-lame = "3.99.3"
 RECIPE_LATEST_RELEASE_DATE_pn-lame = "Nov 26, 2011"
 RECIPE_LAST_UPDATE_pn-lame = "Nov 28, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-lame = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lame = "Jan 09, 2012"
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 RECIPE_MAINTAINER_pn-lame = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
 RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004"
 RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Jan 09, 2012"
 RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
@@ -5819,7 +5819,7 @@ RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
 RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Dec 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Jan 09, 2012"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
 RECIPE_MAINTAINER_pn-lsb = "Saul Wold <sgw@linux.intel.com>"
 
@@ -5861,7 +5861,7 @@ RECIPE_STATUS_pn-man-pages = "red"
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
 RECIPE_LATEST_RELEASE_DATE_pn-man-pages = "Dec 03, 2010"
 RECIPE_LAST_UPDATE_pn-man-pages = "Dec 29, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-man-pages = "Dec 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-man-pages = "Jan 09, 2012"
 RECIPE_COMMENTS_pn-man-pages = "Kernel.org is down"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
@@ -5900,7 +5900,7 @@ RECIPE_LATEST_VERSION_pn-man = "1.6f"
 
 RECIPE_STATUS_pn-mc = "red"
 RECIPE_LATEST_VERSION_pn-mc = "4.8.1"
-RECIPE_LATEST_RELEASE_DATE_pn-mc = 
+RECIPE_LATEST_RELEASE_DATE_pn-mc = "Dec 1, 2011"
 RECIPE_LAST_UPDATE_pn-pc = "Dec 19, 2011"
 RECIPE_MAINTAINER_pn-mc = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-mc = ""
-- 
1.7.6.5



