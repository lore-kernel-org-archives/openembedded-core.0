Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOE-0005aX-Fs
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:39 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351192"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:47 -0800
Message-Id: <d2f93d0249915edb31fd050b9e2dd635d60b64dd.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 05/33] Distro_tracking: Update Manual Check Date
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:39 -0000

Checked the following Upstreams:
apt
libaio
sysstat
unzip
zip
linexif
boost
libcheck
ncurses
sysfsutils
util-linux - Offline
lsb
eds-tools
libmad
lame
glew
squashfs-tools

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   94 ++++++++++++--------
 1 files changed, 57 insertions(+), 37 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c4d33a7..5cd4c37 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -484,7 +484,7 @@ RECIPE_LATEST_VERSION_pn-ncurses = "5.9"
 RECIPE_LAST_UPDATE_pn-ncurses = "Apr 06, 2011"
 RECIPE_INTEL_SECTION_pn-ncurses = "base libs"
 RECIPE_MAINTAINER_pn-ncurses = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-ncurses = "Sep 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ncurses = "Nov 08, 2011"
 
 RECIPE_STATUS_pn-popt = "green"
 RECIPE_LAST_UPDATE_pn-popt = "Jul 5, 2010"
@@ -570,20 +570,22 @@ RECIPE_COMMENTS_pn-tcp-wrappers = "Consider looking at ipv6.4 version"
 RECIPE_NO_UPDATE_REASON_pn-tcp-wrapers = "7.6 is last Stable release"
 
 RECIPE_STATUS_pn-libaio = "green"
+RECIPE_LATEST_VERSION_pn-libaio = "0.3.109"
+RECIPE_LATEST_RELEASE_DATE_pn-libaio = "Aug 30, 2011"
 RECIPE_LAST_UPDATE_pn-libaio = "Aug 27, 2010"
 RECIPE_MAINTAINER_pn-libaio = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-libaio = "0.3.107"
-RECIPE_MANUAL_CHECK_DATE_pn-libaio = "Jun 6, 2011"
-RECIPE_COMMENTS_pn-libaio = "1.0.9 is current unstable"
+RECIPE_MANUAL_CHECK_DATE_pn-libaio = "Nov 8, 2011"
+RECIPE_COMMENTS_pn-libaio = ""
 
 RECIPE_STATUS_pn-libcheck = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
+RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
+RECIPE_LATEST_RELEASE_DATE_pn-libcheck = "Sep 23, 2009"
 RECIPE_LAST_UPDATE_pn-libcheck = "Aug 20, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Nov 8, 2011"
 RECIPE_MAINTAINER_pn-libcheck = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
 RECIPE_INTEL_SECTION_pn-libcheck = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcheck = "9 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libcheck = "Sep 01, 2009"
 RECIPE_COMMENTS_pn-libcheck = ""
 DISTRO_PN_ALIAS_pn-libcheck = "Ubuntu=check Fedora=check OpenSuSE=check"
 
@@ -1171,10 +1173,10 @@ RECIPE_LAST_UPDATE_pn-apr-util = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-apr-util = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-apt = "red"
-RECIPE_LATEST_VERSION_pn-apt = "0.8.15.8"
-RECIPE_LATEST_RELEASE_DATE_pn-apt = "Sep 14, 2011"
+RECIPE_LATEST_VERSION_pn-apt = "0.8.15.9"
+RECIPE_LATEST_RELEASE_DATE_pn-apt = "Oct 14, 2011"
 RECIPE_LAST_UPDATE_pn-apt = "Oct 6, 2011"
-RECIPE_MAINTAINER_pn-apt = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-apt = "Nov 08, 2011"
 RECIPE_NO_UPDATE_REASON_pn-apt="similar to zypper, defer the upgrading"
 
 RECIPE_STATUS_pn-chrpath = "red"
@@ -1313,14 +1315,18 @@ RECIPE_LATEST_VERSION_pn-psmisc = "22.13"
 RECIPE_LAST_UPDATE_pn-psmisc = "Jan 18, 2008"
 RECIPE_MAINTAINER_pn-psmisc = "Yu Ke <ke.yu@intel.com>"
 
-RECIPE_STATUS_pn-boost = "red"
-RECIPE_LATEST_VERSION_pn-boost = "1.44.0"
+RECIPE_STATUS_pn-boost = "yellow"
+RECIPE_LATEST_VERSION_pn-boost = "1.47.0"
+RECIPE_LATEST_RELEASE_DATE_pn-boost = "Jul 12, 2011"
 RECIPE_LAST_UPDATE_pn-boost = "Aug 19, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-boost = "Nov 08, 2011"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-boost-jam-native = "red"
+RECIPE_STATUS_pn-boost-jam-native = "green"
 RECIPE_LATEST_VERSION_pn-boost-jam-native = "3.1.18"
+RECIPE_LATEST_RELEASE_DATE_pn-boost-jam-native = "Mar 22, 2011"
 RECIPE_LAST_UPDATE_pn-boost-jam-native = "Aug 19, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-boost-jam-native = "Nov 08, 2011"
 RECIPE_MAINTAINER_pn-boost-jam-native = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libfribidi = "red"
@@ -1453,15 +1459,15 @@ RECIPE_LATEST_RELEASE_DATE_pn-sysvinit = "Apr 01, 2010"
 RECIPE_COMMENTS_pn-sysvinit = ""
 
 RECIPE_STATUS_pn-sysfsutils = "green"
+RECIPE_LATEST_VERSION_pn-sysfsutils = "2.1.0"
+RECIPE_LATEST_RELEASE_DATE_pn-sysfsutils = "Aug 23, 2006"
 RECIPE_LAST_UPDATE_pn-sysfsutils = "Jun 18, 2010"
-RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
-RECIPE_LATEST_VERSION_pn-sysfsutils = "2.1.0"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-sysfsutils = "Aug 23, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Nov 08, 2011"
 RECIPE_COMMENTS_pn-sysfsutils = ""
+RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-curl = "green"
 RECIPE_LAST_UPDATE_pn-curl = "Sep 30, 2011"
@@ -1652,25 +1658,25 @@ RECIPE_LATEST_RELEASE_DATE_pn-pcmciautils = "Jan 01, 2010"
 RECIPE_COMMENTS_pn-pcmciautils = ""
 
 RECIPE_STATUS_pn-unzip = "green"
+RECIPE_LATEST_VERSION_pn-unzip = "6.0"
+RECIPE_LATEST_RELEASE_DATE_pn-unzip = "Apr 25, 2009"
 RECIPE_LAST_UPDATE_pn-unzip = "Jul 5, 2010"
 RECIPE_MAINTAINER_pn-unzip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-unzip = "not done"
-RECIPE_LATEST_VERSION_pn-unzip = "6.0"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-unzip = "49 months"
-RECIPE_LATEST_RELEASE_DATE_pn-unzip = "Apr 01, 2009"
-RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Nov 08, 2011"
 RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix version"
 
 RECIPE_STATUS_pn-zip = "green"
+RECIPE_LATEST_VERSION_pn-zip = "3.0"
+RECIPE_LATEST_RELEASE_DATE_pn-zip = "Sep 01, 2009"
 RECIPE_LAST_UPDATE_pn-zip = "Jul 6, 2010"
 RECIPE_MAINTAINER_pn-zip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zip = "not done"
-RECIPE_LATEST_VERSION_pn-zip = "3.0"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
-RECIPE_LATEST_RELEASE_DATE_pn-zip = "Sep 01, 2009"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "Nov 08, 2011"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1755,12 +1761,13 @@ RECIPE_INTEL_SECTION_pn-shared-mime-info = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-shared-mime-info = "Feb 01, 2010"
 
 RECIPE_STATUS_pn-util-linux = "green"
+RECIPE_LATEST_VERSION_pn-util-linux = "2.19.1"
 RECIPE_LAST_UPDATE_pn-util-linux = "May 24, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "May 2, 2011"
 RECIPE_MAINTAINER_pn-util-linux = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-util-linux = "2.19.1"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
-RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "May 2, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Nov 08, 2011"
+RECIPE_COMMENTS_pn-util-linux = "kernel.org still has this off-line"
 
 RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
@@ -1808,9 +1815,10 @@ RECIPE_COMMENTS_pn-zypper = ""
 DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 
 RECIPE_STATUS_pn-sysstat = "green"
-RECIPE_LAST_UPDATE_pn-sysstat = "Sep 27, 2011"
 RECIPE_LATEST_VERSION_pn-sysstat = "10.0.2"
-RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Sep 27, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-systat = "Aug 28, 2011"
+RECIPE_LAST_UPDATE_pn-sysstat = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-systat = "Nov 8, 2011"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
@@ -1922,9 +1930,11 @@ RECIPE_LAST_UPDATE_pn-tiff = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-tiff = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-tiff = "Jul 12, 2011"
 
-RECIPE_STATUS_pn-libexif = "red"
-RECIPE_LATEST_VERSION_pn-libexif = "0.6.19"
-RECIPE_LAST_UPDATE_pn-libexif = "Nov 22, 2010"
+RECIPE_STATUS_pn-libexif = "green"
+RECIPE_LATEST_VERSION_pn-libexif = "0.6.20"
+RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Dec 12, 2010"
+RECIPE_LAST_UPDATE_pn-libexif = "Apr 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Nov 08, 2011"
 RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
@@ -5645,11 +5655,12 @@ RECIPE_STATUS_pn-aaina = "red"
 DISTRO_PN_ALIAS_pn-aaina = "Intel"
 RECIPE_STATUS_pn-table = "red"
 DISTRO_PN_ALIAS_pn-table = "Intel"
+
 RECIPE_STATUS_pn-eds-tools = "red"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
 RECIPE_LATEST_VERSION_pn-eds-tools = "bzr"
 RECIPE_LAST_UPDATE_pn-eds-tools = "Sep 12, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Nov 08, 2011"
 RECIPE_NO_UPDATE_REASON_pn-eds-tools = "Possibly convert to GIT based fetch"
 
 RECIPE_STATUS_pn-abiword-embedded = "red"
@@ -5691,24 +5702,34 @@ RECIPE_MAINTAINER_pn-adt-installer = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_LATEST_VERSION_pn-glew = "1.7.0"
 RECIPE_LATEST_RELEASE_DATE_pn-glew = "Aug 26, 2011"
 RECIPE_LAST_UPDATE_pn-glew = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "Nov 08, 2011"
+
+RECIPE_LATEST_VERSION_pn-squashfs-tools = "4.2"
+RECIPE_LATEST_RELEASE_DATE_pn-squashfs-tools = "Feb 28, 2011"
+RECIPE_LAST_UPDATE_pn-squashfs-tools = "Oct 21, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Nov 08, 2011"
 
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
 RECIPE_NO_UPDATE_REASON_pn-mpeg2dec = "Why are we currently at 0.4.1?"
 RECIPE_MANUAL_CHECK_DATE_pn-mpeg2dec = "May 24, 2011"
-RECIPE_LATEST_VERSION_pn-lame = "3.98.4"
+
+RECIPE_LATEST_VERSION_pn-lame = "3.99"
+RECIPE_LATEST_RELEASE_DATE_pn-lame = "Nov 05, 2004
+RECIPE_LAST_UPDATE_pn-lame = "Jul 04, 2006"
+RECIPE_MANUAL_CHECK_DATE_pn-lame = "Nov 08, 2011"
+DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
-RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
 RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Sep 27, 2011"
+RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Nov 08, 2011"
 
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
 RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Nov 08, 2011"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
 
 RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
@@ -5995,7 +6016,6 @@ RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
 RECIPE_LAST_UPDATE_pn-chkconfig = "Oct 19, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "Oct 25, 2011"
 
-DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
-- 
1.7.6.4



