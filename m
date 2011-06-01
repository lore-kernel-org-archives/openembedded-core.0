Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerq-000421-P2
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203826"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:50 -0700
Message-Id: <7c662ae1a889e7e4edd9102aae6970b575166293.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/32] distro tracking: updates
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   99 ++++++++++++++------
 1 files changed, 72 insertions(+), 27 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index bcf7a1a..73e6782 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -428,16 +428,16 @@ RECIPE_LATEST_RELEASE_DATE_pn-libgcrypt = "12/2009"
 RECIPE_COMMENTS_pn-libgcrypt = ""
 
 RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
-RECIPE_LAST_UPDATE_pn-gnutls = "Jun 23, 2010"
+RECIPE_LAST_UPDATE_pn-gnutls = "May 25, 2011"
 RECIPE_MAINTAINER_pn-gnutls = "Qing He <qing.he@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gnutls = "done"
-RECIPE_LATEST_VERSION_pn-gnutls = "2.8.6"
+RECIPE_LATEST_VERSION_pn-gnutls = "2.12.5"
 RECIPE_PATCH_pn-gnutls+gnutls-openssl = "unkown"
 RECIPE_PATCH_pn-gnutls+gnutls-texinfo-euro = "fix if @euro is missing in texinfo"
 RECIPE_PATCH_pn-gnutls+configure-fix = "fix Requires.private and Libs.private in autotools script"
 RECIPE_INTEL_SECTION_pn-gnutls = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnutls = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "03/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "May 14, 2011"
 RECIPE_COMMENTS_pn-gnutls = "requires libtasn1, but has an internal copy"
 
 RECIPE_STATUS_pn-lzo = "green"
@@ -528,9 +528,10 @@ RECIPE_STATUS_pn-libevent = "green"
 RECIPE_LAST_UPDATE_pn-libevent = "Jul 7, 2010"
 RECIPE_MAINTAINER_pn-libevent = "Qing He <qing.he@intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-libevent="libevent 2 is incompatible"
-RECIPE_LATEST_VERSION_pn-libevent = "1.4.14b"
+RECIPE_LATEST_VERSION_pn-libevent = "2.0.11"
 RECIPE_INTEL_SECTION_pn-libevent = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-libevent = "06/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-libevent = "Apr 11, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libevent = "May 24, 2011"
 
 RECIPE_STATUS_pn-libnfsidmap = "green"
 RECIPE_LAST_UPDATE_pn-libnfsidmap = "Jan 20, 2011"
@@ -739,6 +740,16 @@ RECIPE_COMMENTS_pn-opkg = ""
 RECIPE_LAST_UPDATE_pn-opkg = "Jul 21, 2010"
 RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com"
 
+RECIPE_STATUS_pn-opkg_nogpg = "green"
+RECIPE_DEPENDENCY_CHECK_pn-opkg_nogpg = "not done"
+RECIPE_LATEST_VERSION_pn-opkg_nogpg = "0.1.8"
+RECIPE_INTEL_SECTION_pn-opkg_nogpg = "base utils"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg_nogpg = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-opkg_nogpg = "02/2010"
+RECIPE_COMMENTS_pn-opkg_nogpg = ""
+RECIPE_LAST_UPDATE_pn-opkg_nogpg = "Jul 21, 2010"
+RECIPE_MAINTAINER_pn-opkg_nogpg = "Dongxiao Xu <dongxiao.xu@intel.com"
+
 RECIPE_STATUS_pn-dpkg = "green"
 RECIPE_LATEST_VERSION_pn-dpkg = "1.15.8.7"
 RECIPE_INTEL_SECTION_pn-dpkg = "base utils"
@@ -1324,6 +1335,7 @@ RECIPE_INTEL_SECTION_pn-bzip2 = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bzip2 = "12 months"
 RECIPE_LATEST_RELEASE_DATE_pn-bzip2 = "03/2008"
 RECIPE_COMMENTS_pn-bzip2 = "bzip2 license is 3-clause BSD plus an renaming clause"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
 
 RECIPE_STATUS_pn-portmap = "yellow"
 RECIPE_LAST_UPDATE_pn-portmap = "Aug 27, 2007"
@@ -1423,6 +1435,7 @@ RECIPE_LATEST_VERSION_pn-sysfsutils = "2.1.0"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-sysfsutils = "08/2006"
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "May 24, 2011"
 RECIPE_COMMENTS_pn-sysfsutils = ""
 
 RECIPE_STATUS_pn-curl = "green"
@@ -1469,14 +1482,15 @@ RECIPE_LATEST_RELEASE_DATE_pn-pkgconfig = "05/2010"
 RECIPE_COMMENTS_pn-pkgconfig = "git as candidate, 0.23: 01/2008, 0.24: 05/2010, 0.25: 05/2010"
 
 RECIPE_STATUS_pn-less = "green"
-RECIPE_LAST_UPDATE_pn-less = "Jul 6, 2010"
+RECIPE_LAST_UPDATE_pn-less = "May 24, 2011"
 RECIPE_MAINTAINER_pn-less = "Qing He <qing.he@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
-RECIPE_LATEST_VERSION_pn-less = "436"
+RECIPE_LATEST_VERSION_pn-less = "443"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-less = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-less = "07/2009"
+RECIPE_LATEST_RELEASE_DATE_pn-less = "Apr 10, 2011"
 RECIPE_COMMENTS_pn-less = "also licensed under less, which is a 2-clause BSD-like permissive license"
+RECIPE_MANUAL_CHECK_DATE_pn-less = "May 24, 2011"
 
 RECIPE_STATUS_pn-genext2fs = "green"
 RECIPE_LAST_UPDATE_pn-genext2fs = "Jul 12, 2010"
@@ -1616,6 +1630,7 @@ RECIPE_LATEST_VERSION_pn-unzip = "6.0"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-unzip = "49 months"
 RECIPE_LATEST_RELEASE_DATE_pn-unzip = "04/2009"
+RECIPE_MANUAL_CHECK_DATE_pn-unzip = "May 24, 2011"
 RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix version"
 
 RECIPE_STATUS_pn-zip = "green"
@@ -1626,6 +1641,7 @@ RECIPE_LATEST_VERSION_pn-zip = "3.0"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
 RECIPE_LATEST_RELEASE_DATE_pn-zip = "09/2009"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1669,13 +1685,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-udev = "06/2010"
 RECIPE_COMMENTS_pn-udev = "may need different versions for different kernels"
 
 RECIPE_STATUS_pn-tzdata = "green"
-RECIPE_LAST_UPDATE_pn-tzdata = "Nov 9, 2010"
+RECIPE_LAST_UPDATE_pn-tzdata = "May 24, 2010"
 RECIPE_MAINTAINER_pn-tzdata = "Qing He <qing.he@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
-RECIPE_LATEST_VERSION_pn-tzdata = "2010o"
+RECIPE_LATEST_VERSION_pn-tzdata = "2011g"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "05/2010"
+RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "May 24, 2011"
 RECIPE_COMMENTS_pn-tzdata = ""
 
 RECIPE_STATUS_pn-tinylogin = "yellow"    # replaced, place holder for tracking
@@ -1707,21 +1724,23 @@ RECIPE_INTEL_SECTION_pn-shared-mime-info = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-shared-mime-info = "02/2010"
 
 RECIPE_STATUS_pn-util-linux = "green"
-RECIPE_LAST_UPDATE_pn-util-linux = "Jul 21, 2010"
+RECIPE_LAST_UPDATE_pn-util-linux = "May 24, 2011"
 RECIPE_MAINTAINER_pn-util-linux = "Qing He <qing.he@intel.com>"
-RECIPE_LATEST_VERSION_pn-util-linux = "2.18"
+RECIPE_LATEST_VERSION_pn-util-linux = "2.19.1"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
-RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "06/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "May 2, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "May 24, 2011"
 
 RECIPE_STATUS_pn-usbutils = "green"
-RECIPE_LAST_UPDATE_pn-usbutils = "Jul 30, 2010"
+RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
 RECIPE_MAINTAINER_pn-usbutils = "Qing He <qing.he@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-usbutils = "done"
-RECIPE_LATEST_VERSION_pn-usbutils = "0.86"
+RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
 RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-usbutils = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "08/2009"
+RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "Oct 22, 2010"
 RECIPE_COMMENTS_pn-usbutils = ""
+RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "May 24, 2011"
 
 RECIPE_STATUS_pn-pciutils = "yellow"    # custom build system, several hacks
 RECIPE_LAST_UPDATE_pn-pciutils = "Nov 10, 2010"
@@ -1757,9 +1776,10 @@ RECIPE_INTEL_SECTION_pn-zypper = "base utils"
 RECIPE_COMMENTS_pn-zypper = ""
 
 RECIPE_STATUS_pn-sysstat = "green"
-RECIPE_LAST_UPDATE_pn-sysstat = "Nov 17, 2010"
+RECIPE_LAST_UPDATE_pn-sysstat = "May 24, 2011"
 RECIPE_MAINTAINER_pn-sysstat = "Qing He <qing.he@intel.com>"
-RECIPE_LATEST_VERSION_pn-sysstat = "9.1.6"
+RECIPE_LATEST_VERSION_pn-sysstat = "10.0.0"
+RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "May 24, 2011"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
 RECIPE_LAST_UPDATE_pn-sysklogd = "Aug 27, 2010"
@@ -1838,6 +1858,7 @@ RECIPE_LATEST_VERSION_pn-zaurusd = "0.0+svnr426"
 DISTRO_PN_ALIAS_pn-zaurusd = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-zaurusd = "Jan 20, 2011"
 RECIPE_MAINTAINER_pn-zaurusd = "Qing He <qing.he@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
 
 RECIPE_STATUS_pn-yaffs2-utils = "red"
 RECIPE_LATEST_VERSION_pn-yaffs2-utils = ""
@@ -5485,6 +5506,9 @@ RECIPE_STATUS_pn-table = "red"
 DISTRO_PN_ALIAS_pn-table = "Intel"
 RECIPE_STATUS_pn-eds-tools = "red"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
+RECIPE_LATEST_VERSION_pn-eds-tools = "bzr"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "May 24, 2011"
+
 RECIPE_STATUS_pn-abiword-embedded = "red"
 DISTRO_PN_ALIAS_pn-abiword-embedded = "Fedora=abiword Ubuntu=abiword"
 RECIPE_STATUS_pn-libsync = "red"
@@ -5520,18 +5544,23 @@ RECIPE_LATEST_RELEASE_DATE_pn-lighttpd = "08/2010"
 RECIPE_COMMENTS_pn-lighttpd = ""
 
 RECIPE_LATEST_VERSION_pn-adt-installer = "1.0"
-RECIPE_MANUAL_CHECK_DATE_pn-adt-installer = "Jan 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-adt-installer = "May 24, 2011"
 DISTRO_PN_ALIAS_pn-adt-installer = "Intel"
-RECIPE_LATEST_VERSION_pn-glew = "1.5.7"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "Feb 28, 2011"
-RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.4.1"
-RECIPE_MANUAL_CHECK_DATE_pn-mpeg2dec = "Jan 17, 2011"
+RECIPE_MAINTAINER_pn-adt-install = "Jessica Zhang <jessica.zhang@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-glew = "1.6.0"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "May 24, 2011"
+RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
+RECIPE_NO_UPDATE_REASON_pn-libtheora = "Why are we currently at 0.4.1?"
+RECIPE_MANUAL_CHECK_DATE_pn-mpeg2dec = "May 24, 2011"
 RECIPE_LATEST_VERSION_pn-lame = "3.98.4"
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Apr 6, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "May 24, 2011"
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Jan 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "May 24, 2011"
+RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
+
 RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
 RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Jan 17, 2011"
 RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
@@ -5673,12 +5702,15 @@ RECIPE_MANUAL_CHECK_DATE_pn-slang = "Apr 6, 2011"
 RECIPE_STATUS_pn-libnewt = "green"
 RECIPE_LATEST_VERSION_pn-libnewt = "2.2.3"
 RECIPE_LAST_UPDATE_pn-libnewt = "Feb 25, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Apr 6, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "May 24, 2011"
+RECIPE_NO_UPDATE_REASON_pn-libnewt = "fedora hosted version is at 0.52.12"
 
 RECIPE_STATUS_pn-createrepo = "green"
-RECIPE_LATEST_VERSION_pn-createrepo = "2.2.3"
+RECIPE_LATEST_VERSION_pn-createrepo = "0.9.9"
 RECIPE_MAINTAINER_pn-createrepo = "Qing He <qing.he@intel.com>"
 RECIPE_LAST_UPDATE_pn-createrepo = "Apr 6, 2011"
+RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
+
 
 RECIPE_STATUS_pn-cdrtools = "green"
 RECIPE_DEPENDENCY_CHECK_pn-cdrtools = "not done"
@@ -5690,3 +5722,16 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cdrtools = "6 years 2 months"
 RECIPE_COMMENTS_pn-cdrtools = "This is the last GPL licensed version of cdrtools"
 RECIPE_LAST_UPDATE_pn-cdrtools = "Apr 25, 2011"
 RECIPE_MAINTAINER_pn-cdrtools = "Scott Garman <scott.a.garman@intel.com>"
+
+RECIPE_STATUS_pn-rxvt-unicode = "green"
+RECIPE_DEPENDENCY_CHECK_pn-rxvt-unicode = "not done"
+RECIPE_LATEST_VERSION_pn-rxvt-unicode = "9.11"
+RECIPE_NO_UPDATE_REASON_pn-rxvt-unicode = ""
+RECIPE_NO_OF_PATCHES_pn-rxvt-unicode = "1"
+RECIPE_LATEST_RELEASE_DATE_pn-rxvt-unicode = "May 02, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rxvt-unicode = ""
+RECIPE_COMMENTS_pn-rxvt-unicode = ""
+RECIPE_LAST_UPDATE_pn-rxvt-unicode = "May 25, 2011"
+RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
+
+
-- 
1.7.3.4



