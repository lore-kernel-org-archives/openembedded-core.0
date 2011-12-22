Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Rdc9K-0002w5-IJ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 07:29:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 22:22:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90281179"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 22:22:01 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 14:17:23 +0800
Message-Id: <558563d22c657253c6c7dc4d5874120de222fb68.1324534102.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1324534102.git.lei.mei@intel.com>
References: <cover.1324534102.git.lei.mei@intel.com>
In-Reply-To: <cover.1324534102.git.lei.mei@intel.com>
References: <cover.1324534102.git.lei.mei@intel.com>
Subject: [PATCH 2/2] distro_tracking_fields: Update curl info and fix other recipes' typo issues
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
X-List-Received-Date: Thu, 22 Dec 2011 06:29:07 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   30 ++++++++++----------
 1 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ba261be..e2e1a6f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -882,7 +882,7 @@ RECIPE_PATCH_pn-busybox+busybox-appletlib-dependency = "added in 1.13.2; 58c556d
 RECIPE_PATCH_pn-busybox+run-parts.in.usr-bin = "aded in 1.15.3; f1b326c8; 2010; change install dir for run-parts to avoid impacting debianutils install. perhaps a local patch"
 RECIPE_INTEL_SECTION_pn-busybox = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-busybox = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-busybox = "0iJun 01, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-busybox = "Jun 01, 2010"
 RECIPE_COMMENTS_pn-busybox = "some special overrides/unsets for CFLAGS, etc. need to understand the tricks behind"
 RECIPE_LAST_UPDATE_pn-busybox = "Nov 17, 2010"
 RECIPE_MAINTAINER_pn-busybox = "Edwin Zhai <edwin.zhai@intel.com>"
@@ -1493,15 +1493,15 @@ RECIPE_COMMENTS_pn-sysfsutils = ""
 RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-curl = "green"
-RECIPE_LAST_UPDATE_pn-curl = "Sep 30, 2011"
+RECIPE_LAST_UPDATE_pn-curl = "Dec 22, 2011"
 RECIPE_MAINTAINER_pn-curl = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-curl = "not done"
-RECIPE_LATEST_VERSION_pn-curl = "7.22.0"
+RECIPE_LATEST_VERSION_pn-curl = "7.23.1"
 RECIPE_PATCH_pn-curl+noldlibpath = "no bother set LD_LIBRARY_PATH since we are cross compiling"
 RECIPE_PATCH_pn-curl+pkgconfig-fix = "fix libcurl.pc"
 RECIPE_INTEL_SECTION_pn-curl = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-curl = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-curl = "Sep 01, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-curl = "Nov 17, 2011"
 RECIPE_COMMENTS_pn-curl = ""
 
 RECIPE_STATUS_pn-gconf-dbus = "green"
@@ -1714,8 +1714,8 @@ RECIPE_MANUAL_CHECK_DATE_pn-strace = "Nov 22, 2011"
 RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
-RECIPE_LATEST_VERSION_pn-dhcp = "4.2.3
-RECIPE_LATEST_RELEASE_DATE_pn-dhcp = "Oct 19, 2011
+RECIPE_LATEST_VERSION_pn-dhcp = "4.2.3"
+RECIPE_LATEST_RELEASE_DATE_pn-dhcp = "Oct 19, 2011"
 RECIPE_LAST_UPDATE_pn-dhcp = "Sep 28, 2011"
 RECIPE_MAINTAINER_pn-dhcp = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-dhcp = "base utils"
@@ -2821,7 +2821,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofile = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-oprofile = "Nov 24, 2009"
 RECIPE_COMMENTS_pn-oprofile = ""
 RECIPE_LAST_UPDATE_pn-oprofile = "Jun 22, 2010"
-RECIPE_MANUAL_CHECK_DATE-oprofile = "Nov 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-oprofile = "Nov 17, 2011"
 RECIPE_MAINTAINER_pn-oprofile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-powertop = "green"
@@ -3089,7 +3089,7 @@ RECIPE_MAINTAINER_pn-python-gst = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_STATUS_pn-python-imaging="green"
 RECIPE_LATEST_VERSION_pn-python-imaging="1.1.7"
 RECIPE_LAST_UPDATE_pn-python-imaging = "Jul 7, 2010"
-RECIPE_MAINTAINER_pnpython-imaging = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+RECIPE_MAINTAINER_pn-python-imaging = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-python-pycurl="green"
 RECIPE_LATEST_VERSION_pn-python-pycurl="7.19.0"
@@ -3348,7 +3348,7 @@ RECIPE_STATUS_pn-mkfontdir="green" # no update needed
 RECIPE_LATEST_VERSION_pn-mkfontdir="1.0.5"
 RECIPE_NO_OF_PATCHES_pn-mkfontdir="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mkfontdir="Oct 11, 2009"
-RECIPE_LATEST_RELEASE_DATE_pn-mkfontdir="16 monthes"
+RECIPE_LATEST_RELEASE_DATE_pn-mkfontdir="Nov 7, 2010"
 RECIPE_INTEL_SECTION_pn-mkfontdir="graphic apps"
 RECIPE_LAST_UPDATE_pn-mkfontdir = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-mkfontdir="Saul Wold <sgw@linux.intel.com>"
@@ -4664,19 +4664,19 @@ RECIPE_MAINTAINER_pn-libx11 = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-libx11-diet = "green"
 DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 RECIPE_LATEST_VERSION_pn-libx11-diet = "1.4.4"
-RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet = "Jul 28,2011"
+RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet = "Jul 28, 2011"
 RECIPE_LAST_UPDATE_pn-libx11-diet = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-directfb = "green"
 RECIPE_LATEST_VERSION_pn-directfb = "1.5.3"
-RECIPE_LATEST_RELEASE_DATE_pn-direcfb = "Aug 9,2011"
+RECIPE_LATEST_RELEASE_DATE_pn-direcfb = "Aug 9, 2011"
 RECIPE_LAST_UPDATE_pn-directfb = "Nov 7, 2011"
 RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-libarchive  = "green"
 RECIPE_LATEST_VERSION_pn-libarchive = "2.8.5"
-RECIPE_LATEST_RELEASE_DATE_pn-libarchive = "Sept 3, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-libarchive = "Sep 3, 2011"
 RECIPE_LAST_UPDATE_pn-libarchive = "Nov 7, 2011"
 RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
@@ -4856,7 +4856,7 @@ RECIPE_INTEL_SECTION_pn-libxprintapputil = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxprintapputil = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-libxprintapputil = "Jan 18, 2006"
 RECIPE_COMMENTS_pn-libxprintapputil = "can't find the release date of any older version in the SRC_URI link"
-RECIPE_LAST_UPDATE_pn-libxprintapputil = ""Jul 3, 2007"
+RECIPE_LAST_UPDATE_pn-libxprintapputil = "Jul 3, 2007"
 RECIPE_MAINTAINER_pn-libxprintapputil = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxprintutil = "green"
@@ -4867,7 +4867,7 @@ RECIPE_INTEL_SECTION_pn-libxprintutil = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxprintutil = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-libxprintutil = "Jan 18, 2006"
 RECIPE_COMMENTS_pn-libxprintutil = "can't find the release date of any older version in the SRC_URI link"
-RECIPE_LAST_UPDATE_pn-libxprintutil = ""Jul 3, 2007"
+RECIPE_LAST_UPDATE_pn-libxprintutil = "Jul 3, 2007"
 RECIPE_MAINTAINER_pn-libxprintutil = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxscrnsaver = "green"
@@ -4891,7 +4891,7 @@ RECIPE_INTEL_SECTION_pn-libxtrap = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxtrap = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-libxtrap = "Jan 18, 2006"
 RECIPE_COMMENTS_pn-libxtrap = "can't find the release date of any older version in the SRC_URI link"
-RECIPE_LAST_UPDATE_pn-libxtrap = ""Jul 3, 2007"
+RECIPE_LAST_UPDATE_pn-libxtrap = "Jul 3, 2007"
 RECIPE_MAINTAINER_pn-libxtrap = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xproxymanagementprotocol = "green"
-- 
1.7.0.4



