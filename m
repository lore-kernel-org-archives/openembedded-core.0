Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oJ7-00041r-Uo
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360968"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:05:55 -0700
Message-Id: <461cadcb158f76a64012a2b14fcedca80e5e7f04.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/29] distro_tracking: Update Manual Upgrade Checks
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:55 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   77 ++++++++++++--------
 1 files changed, 46 insertions(+), 31 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c1f15e1..47fa7bf 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -409,16 +409,17 @@ RECIPE_COMMENTS_pn-libxml2 = ""
 RECIPE_MANUAL_CHECK_DATE_pn-libxml2 = "Jun 06, 2011"
 
 RECIPE_STATUS_pn-readline = "green"
-RECIPE_LAST_UPDATE_pn-readline = "Jun 17, 2010"
+RECIPE_LAST_UPDATE_pn-readline = "May 10, 2011"
 RECIPE_MAINTAINER_pn-readline = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-readline = "not done"
-RECIPE_LATEST_VERSION_pn-readline = "6.1"
+RECIPE_LATEST_VERSION_pn-readline = "6.2"
 RECIPE_PATCH_pn-readline+configure-fix = "fix configure for build"
 RECIPE_PATCH_pn-readline+acinclude.m4 = "local include file for autotools"
 RECIPE_INTEL_SECTION_pn-readline = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-readline = "11 months"
-RECIPE_LATEST_RELEASE_DATE_pn-readline = "01/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-readline = "Feb 13, 2011"
 RECIPE_COMMENTS_pn-readline = ""
+RECIPE_MANUAL_CHECK_DATE_pn-readline = "Sept 27, 2011"
 
 RECIPE_STATUS_pn-libgcrypt = "green"
 RECIPE_LAST_UPDATE_pn-libgcrypt = "Jul 29, 2010"
@@ -452,15 +453,15 @@ RECIPE_INTEL_SECTION_pn-lzo = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-lzo = "10/2010"
 
 RECIPE_STATUS_pn-libtasn1 = "green"
-RECIPE_LAST_UPDATE_pn-libtasn1 = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-libtasn1 = "Dec 06, 2010"
 RECIPE_MAINTAINER_pn-libtasn1 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libtasn1 = "not done"
 RECIPE_LATEST_VERSION_pn-libtasn1 = "2.9"
 RECIPE_INTEL_SECTION_pn-libtasn1 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtasn1 = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libtasn1 = "05/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-libtasn1 = "Dec 06, 2010"
 RECIPE_COMMENTS_pn-libtasn1 = ""
-RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Jun 06, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Sep 27, 2011"
 
 RECIPE_STATUS_pn-openssl = "green"
 RECIPE_LAST_UPDATE_pn-openssl = "Nov 17, 2010"
@@ -481,9 +482,9 @@ RECIPE_LATEST_RELEASE_DATE_pn-libnss-mdns = "05/2007"
 RECIPE_STATUS_pn-ncurses = "green"
 RECIPE_LAST_UPDATE_pn-ncurses = "Dec 30, 2010"
 RECIPE_MAINTAINER_pn-ncurses = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-ncurses = "5.7"
+RECIPE_LATEST_VERSION_pn-ncurses = "5.9"
 RECIPE_INTEL_SECTION_pn-ncurses = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-ncurses = "11/2008"
+RECIPE_LATEST_RELEASE_DATE_pn-ncurses = "Apr 04, 2011"
 
 RECIPE_STATUS_pn-popt = "green"
 RECIPE_LAST_UPDATE_pn-popt = "Jul 5, 2010"
@@ -1457,8 +1458,8 @@ RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
 RECIPE_LATEST_VERSION_pn-sysfsutils = "2.1.0"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-sysfsutils = "08/2006"
-RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "May 24, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-sysfsutils = "Aug 23, 2006"
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Sep 27, 2011"
 RECIPE_COMMENTS_pn-sysfsutils = ""
 
 RECIPE_STATUS_pn-curl = "green"
@@ -1543,14 +1544,14 @@ RECIPE_STATUS_pn-file = "green"
 RECIPE_LAST_UPDATE_pn-file = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-file = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-file = "done"
-RECIPE_LATEST_VERSION_pn-file = "5.07"
+RECIPE_LATEST_VERSION_pn-file = "5.09"
 RECIPE_PATCH_pn-file+dump = "some new magic data"
 RECIPE_PATCH_pn-file+filesystems = "some other new magic data"
 RECIPE_INTEL_SECTION_pn-file = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-file = "1-3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-file = "05/2011"
+RECIPE_LATEST_RELEASE_DATE_pn-file = "Sep 16, 2011"
 RECIPE_COMMENTS_pn-file = "2-clause BSD"
-RECIPE_MANUAL_CHECK_DATE_pn-file = "Jul 12, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-file = "Sep 27, 2011"
 
 RECIPE_STATUS_pn-rsync = "green"
 RECIPE_LAST_UPDATE_pn-rsync = "Jul 6, 2010"
@@ -1655,7 +1656,7 @@ RECIPE_LATEST_VERSION_pn-unzip = "6.0"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-unzip = "49 months"
 RECIPE_LATEST_RELEASE_DATE_pn-unzip = "04/2009"
-RECIPE_MANUAL_CHECK_DATE_pn-unzip = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Sep 27, 2011"
 RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix version"
 
 RECIPE_STATUS_pn-zip = "green"
@@ -1666,7 +1667,7 @@ RECIPE_LATEST_VERSION_pn-zip = "3.0"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
 RECIPE_LATEST_RELEASE_DATE_pn-zip = "09/2009"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "Sep 27, 2011"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1756,7 +1757,7 @@ RECIPE_MAINTAINER_pn-util-linux = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-util-linux = "2.19.1"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "May 2, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Sep 27, 2011"
 
 RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
@@ -1804,10 +1805,10 @@ RECIPE_COMMENTS_pn-zypper = ""
 DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 
 RECIPE_STATUS_pn-sysstat = "green"
-RECIPE_LAST_UPDATE_pn-sysstat = "May 24, 2011"
+RECIPE_LAST_UPDATE_pn-sysstat = "Sep 27, 2011"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-sysstat = "10.0.0"
-RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "May 24, 2011"
+RECIPE_LATEST_VERSION_pn-sysstat = "10.0.2"
+RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Sep 27, 2011"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
 RECIPE_LAST_UPDATE_pn-sysklogd = "Aug 27, 2010"
@@ -1867,11 +1868,13 @@ RECIPE_LAST_UPDATE_pn-parted = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-parted = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-resolvconf = "green"
-RECIPE_LATEST_VERSION_pn-resolvconf = "1.48"
+RECIPE_LATEST_VERSION_pn-resolvconf = "1.59"
+RECIPE_LATEST_RELEASE_DATE_pn-resolvconf = "Sep 26, 2011"
 RECIPE_LAST_UPDATE_pn-resolvconf = "Jan 20, 2011"
 RECIPE_MAINTAINER_pn-resolvconf = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-resolvconf = "Jun 06, 2011"
-RECIPE_COMMENTS_pn-resolvconf = "Lastest Unstable version is 1.56"
+RECIPE_MANUAL_CHECK_DATE_pn-resolvconf = "Sep 27, 2011"
+RECIPE_NO_UPDATE_REASON_pn-resolvconf = "1.61 is latest UNSTABLE"
+RECIPE_COMMENTS_pn-resolvconf = ""
 
 RECIPE_STATUS_pn-openswan = "red"
 RECIPE_LATEST_VERSION_pn-openswan = "2.6.26"
@@ -5615,7 +5618,9 @@ DISTRO_PN_ALIAS_pn-table = "Intel"
 RECIPE_STATUS_pn-eds-tools = "red"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
 RECIPE_LATEST_VERSION_pn-eds-tools = "bzr"
-RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "May 24, 2011"
+RECIPE_LAST_UPDATE_pn-eds-tools = "Sep 12, 2007"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Sep 27, 2011"
+RECIPE_NO_UPDATE_REASON_pn-eds-tools = "Possibly convert to GIT based fetch"
 
 RECIPE_STATUS_pn-abiword-embedded = "red"
 DISTRO_PN_ALIAS_pn-abiword-embedded = "Fedora=abiword Ubuntu=abiword"
@@ -5649,22 +5654,32 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lighttpd = "11 month"
 RECIPE_LATEST_RELEASE_DATE_pn-lighttpd = "07/2011"
 RECIPE_COMMENTS_pn-lighttpd = ""
 
-RECIPE_LATEST_VERSION_pn-adt-installer = "1.0"
-RECIPE_MANUAL_CHECK_DATE_pn-adt-installer = "May 24, 2011"
+RECIPE_LATEST_VERSION_pn-adt-installer = "1.1"
+RECIPE_MANUAL_CHECK_DATE_pn-adt-installer = "Sep 27, 2011"
 DISTRO_PN_ALIAS_pn-adt-installer = "Intel"
-RECIPE_MAINTAINER_pn-adt-install = "Jessica Zhang <jessica.zhang@intel.com>"
+RECIPE_MAINTAINER_pn-adt-installer = "Jessica Zhang <jessica.zhang@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-glew = "1.7.0"
+RECIPE_LATEST_RELEASE_DATE_pn-glew = "Aug 26, 2011"
+RECIPE_LAST_UPDATE_pn-glew = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "Sep 27, 2011"
 
-RECIPE_LATEST_VERSION_pn-glew = "1.6.0"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "May 24, 2011"
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
-RECIPE_NO_UPDATE_REASON_pn-libtheora = "Why are we currently at 0.4.1?"
+RECIPE_NO_UPDATE_REASON_pn-mpeg2dec = "Why are we currently at 0.4.1?"
 RECIPE_MANUAL_CHECK_DATE_pn-mpeg2dec = "May 24, 2011"
 RECIPE_LATEST_VERSION_pn-lame = "3.98.4"
+
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "May 24, 2011"
+RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
+RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Sep 27, 2011"
+
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
+
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "May 24, 2011"
+RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Sep 27, 2011"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
 
 RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
-- 
1.7.6



