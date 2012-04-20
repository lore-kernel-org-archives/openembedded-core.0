Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7D-0005g2-3V
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167931"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:33 -0700
Message-Id: <2b68959d16bd97c3009065346560e40802ad16f0.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 42/43] distro_tracking: Update Manual Check
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:23 -0000

Update the manual check dates for:
sqlite3
libcap
libcheck
console-tools
psmisc
boost
sysfsutils
less
unzip
zip
usbutils
sysstat
cracklib
libexif
qemugl
glew
squashfs-tools
lame
libmad
lsb

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   58 ++++++++++----------
 1 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index de6f3dd..dc36833 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -552,10 +552,10 @@ RECIPE_LATEST_RELEASE_DATE_pn-popt = "May 01, 2010"
 
 RECIPE_STATUS_pn-sqlite3 = "green"
 # need upgrade
-RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.10"
-RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Jan 16, 2012"
-RECIPE_LAST_UPDATE_pn-sqlite3 = "Feb 27, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Feb 26, 2012"
+RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.11"
+RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Mar 20, 2012"
+RECIPE_LAST_UPDATE_pn-sqlite3 = "Apr 18, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-sqlite3 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sqlite3 = "not done"
 RECIPE_INTEL_SECTION_pn-sqlite3 = "base libs"
@@ -585,7 +585,7 @@ RECIPE_STATUS_pn-libcap = "yellow"
 RECIPE_LATEST_VERSION_pn-libcap = "2.22"
 RECIPE_LATEST_RELEASE_DATE_pn-libcap = "Jan 01, 2010"
 RECIPE_LAST_UPDATE_pn-libcap = "Jul 25, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-libcap = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libcap = "done"
 RECIPE_INTEL_SECTION_pn-libcap = "base libs"
@@ -644,7 +644,7 @@ RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
 RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libcheck = "Sep 23, 2009"
 RECIPE_LAST_UPDATE_pn-libcheck = "Aug 20, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-libcheck = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-libcheck = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcheck = "9 months"
@@ -1357,7 +1357,7 @@ RECIPE_MAINTAINER_pn-consolekit = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-console-tools = "red"
 RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-console-tools = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
 
@@ -1401,14 +1401,14 @@ RECIPE_STATUS_pn-psmisc = "red"
 RECIPE_LATEST_VERSION_pn-psmisc = "22.16"
 RECIPE_LATEST_RELEASE_DATE_pn-psmisc = "Feb 25, 2012"
 RECIPE_LAST_UPDATE_pn-psmisc = "Feb 27, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-psmisc = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost = "yellow"
 RECIPE_LATEST_VERSION_pn-boost = "1.49.0"
 RECIPE_LATEST_RELEASE_DATE_pn-boost = "Feb 24, 2012"
 RECIPE_LAST_UPDATE_pn-boost = "Feb 27, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-boost = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-boost = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost-jam-native = "green"
@@ -1559,7 +1559,7 @@ RECIPE_LAST_UPDATE_pn-sysfsutils = "Jun 18, 2010"
 RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
-RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Apr 18, 2012"
 RECIPE_COMMENTS_pn-sysfsutils = "No update on kernel.org"
 RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
@@ -1613,7 +1613,7 @@ RECIPE_STATUS_pn-less = "green"
 RECIPE_LATEST_VERSION_pn-less = "444"
 RECIPE_LATEST_RELEASE_DATE_pn-less = "Jun 9, 2011"
 RECIPE_LAST_UPDATE_pn-less = "Dec 01, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-less = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-less = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-less = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
@@ -1774,7 +1774,7 @@ RECIPE_MAINTAINER_pn-unzip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-unzip = "not done"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-unzip = "49 months"
-RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Apr 18, 2012"
 RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix version"
 
 RECIPE_STATUS_pn-zip = "green"
@@ -1785,7 +1785,7 @@ RECIPE_MAINTAINER_pn-zip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zip = "not done"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "Apr 18, 2012"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1888,7 +1888,7 @@ RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
 RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "Oct 22, 2010"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-usbutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-usbutils = "done"
 RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
@@ -1931,10 +1931,10 @@ RECIPE_COMMENTS_pn-zypper = ""
 DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 
 RECIPE_STATUS_pn-sysstat = "green"
-RECIPE_LATEST_VERSION_pn-sysstat = "10.0.3"
-RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Nov 27, 2011"
-RECIPE_LAST_UPDATE_pn-sysstat = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Feb 26, 2012"
+RECIPE_LATEST_VERSION_pn-sysstat = "10.0.4"
+RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Mar 07, 2012"
+RECIPE_LAST_UPDATE_pn-sysstat = "Apr 19, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-sysklogd = "red"
@@ -1969,7 +1969,7 @@ RECIPE_STATUS_pn-cracklib="green"
 RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
 RECIPE_LATEST_RELEASE_DATE_pn-cracklib = "Aug 29, 2010"
 RECIPE_LAST_UPDATE_pn-cracklib = "Nov 13, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-cracklib="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-openobex = "red"
@@ -2063,7 +2063,7 @@ RECIPE_STATUS_pn-libexif = "green"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.20"
 RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Dec 12, 2010"
 RECIPE_LAST_UPDATE_pn-libexif = "Apr 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
@@ -3666,7 +3666,7 @@ RECIPE_INTEL_SECTION_pn-qemugl="graphic app"
 RECIPE_LAST_UPDATE_pn-qemugl = "Nov 28, 2010"
 RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because the upstream is broken in x86_64 build"
 RECIPE_MAINTAINER_pn-qemugl="Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Apr 18, 2012"
 
 RECIPE_STATUS_pn-fotowall="green"
 # no update needed
@@ -6048,13 +6048,13 @@ RECIPE_MAINTAINER_pn-adt-installer = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_LATEST_VERSION_pn-glew = "1.7.0"
 RECIPE_LATEST_RELEASE_DATE_pn-glew = "Aug 26, 2011"
 RECIPE_LAST_UPDATE_pn-glew = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-glew = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-squashfs-tools = "4.2"
 RECIPE_LATEST_RELEASE_DATE_pn-squashfs-tools = "Feb 28, 2011"
 RECIPE_LAST_UPDATE_pn-squashfs-tools = "Oct 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
@@ -6062,17 +6062,17 @@ RECIPE_NO_UPDATE_REASON_pn-mpeg2dec = "Why are we currently at 0.4.1?"
 RECIPE_MANUAL_CHECK_DATE_pn-mpeg2dec = "May 24, 2011"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_LATEST_VERSION_pn-lame = "3.99.3"
-RECIPE_LATEST_RELEASE_DATE_pn-lame = "Nov 26, 2011"
-RECIPE_LAST_UPDATE_pn-lame = "Nov 28, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-lame = "Jan 09, 2012"
+RECIPE_LATEST_VERSION_pn-lame = "3.99.5"
+RECIPE_LATEST_RELEASE_DATE_pn-lame = "Feb 28, 2012"
+RECIPE_LAST_UPDATE_pn-lame = "Apr 19, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-lame = "Apr 18, 2012"
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 RECIPE_MAINTAINER_pn-lame = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
 RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004"
 RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Jan 09, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Apr 18, 2012"
 RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
@@ -6080,7 +6080,7 @@ RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
 RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Feb 26, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Apr 18, 2012"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
 RECIPE_MAINTAINER_pn-lsb = "Saul Wold <sgw@linux.intel.com>"
 
-- 
1.7.7.6



