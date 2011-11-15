Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQC3-0001Vb-Ai
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410737"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:48 -0800
Message-Id: <708881fd1eb32a139562ec068d651259e4361d0a.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/16] distro_tracking: Refect Recipe Updates & Status
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:24 -0000

 * libnl    - NO_UPDATE_REASON due to incompatibility
 * zlib     - has wrong version in update list (121)
 * libtasn1 - Update to 2.10
 * pkgconfig - NO_UPDATE_REASON due to removal of glib-conf
 * file     - update to 5.09
 * dchp     - New version is 4.2.3, not updated yet.
 * tiff     - NO_UPDATE_REASON wait until 4.0.0
 * gobject-interopsectio - NO_UPDATE_REASON can not cross-build
 * gnu-config  - Udpate to git HEAD - requires ASSUME_PROVIDED += "git-native"
 * boost    - remove boost-jam-native since it's part of 1.47.0 Update

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   50 ++++++++++----------
 1 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5cd4c37..e15ab20 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -382,6 +382,7 @@ RECIPE_MAINTAINER_pn-libnl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-libnl = "2.0"
 RECIPE_INTEL_SECTION_pn-libnl = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-libnl = "Oct 01, 2010"
+RECIPE_NO_UPDATE_REASON_pn-libnl = "libnl-3.2.2 is incompatible with libnl2, so no Upgrade"
 
 RECIPE_STATUS_pn-zlib = "yellow"  # local config scripts
 RECIPE_LAST_UPDATE_pn-zlib = "Jun 11, 2010"
@@ -394,6 +395,7 @@ RECIPE_INTEL_SECTION_pn-zlib = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zlib = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-zlib = "Mar 01, 2010"
 RECIPE_COMMENTS_pn-zlib = "rconflicts: libxml2 (< 2.7.7) (rbreaks)"
+RECIPE_NO_UPDATE_REASON_pn-zlib = "zlib-1.2.5 is latest, version parser reports 121 in error"
 
 RECIPE_STATUS_pn-libxml2 = "yellow"
 RECIPE_LAST_UPDATE_pn-libxml2 = "Jun 18, 2010"
@@ -452,15 +454,15 @@ RECIPE_INTEL_SECTION_pn-lzo = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-lzo = "Oct 01, 2010"
 
 RECIPE_STATUS_pn-libtasn1 = "green"
-RECIPE_LAST_UPDATE_pn-libtasn1 = "Dec 06, 2010"
+RECIPE_LATEST_VERSION_pn-libtasn1 = "2.10"
+RECIPE_LATEST_RELEASE_DATE_pn-libtasn1 = "Oct 25, 2011"
+RECIPE_LAST_UPDATE_pn-libtasn1 = "Nov 08, 2011"
 RECIPE_MAINTAINER_pn-libtasn1 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libtasn1 = "not done"
-RECIPE_LATEST_VERSION_pn-libtasn1 = "2.9"
 RECIPE_INTEL_SECTION_pn-libtasn1 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtasn1 = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libtasn1 = "Dec 06, 2010"
 RECIPE_COMMENTS_pn-libtasn1 = ""
-RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Nov 08, 2011"
 
 RECIPE_STATUS_pn-openssl = "green"
 RECIPE_LAST_UPDATE_pn-openssl = "Nov 17, 2010"
@@ -1318,17 +1320,10 @@ RECIPE_MAINTAINER_pn-psmisc = "Yu Ke <ke.yu@intel.com>"
 RECIPE_STATUS_pn-boost = "yellow"
 RECIPE_LATEST_VERSION_pn-boost = "1.47.0"
 RECIPE_LATEST_RELEASE_DATE_pn-boost = "Jul 12, 2011"
-RECIPE_LAST_UPDATE_pn-boost = "Aug 19, 2010"
+RECIPE_LAST_UPDATE_pn-boost = "Nov 11, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-boost = "Nov 08, 2011"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-boost-jam-native = "green"
-RECIPE_LATEST_VERSION_pn-boost-jam-native = "3.1.18"
-RECIPE_LATEST_RELEASE_DATE_pn-boost-jam-native = "Mar 22, 2011"
-RECIPE_LAST_UPDATE_pn-boost-jam-native = "Aug 19, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-boost-jam-native = "Nov 08, 2011"
-RECIPE_MAINTAINER_pn-boost-jam-native = "Saul Wold <sgw@linux.intel.com>"
-
 RECIPE_STATUS_pn-libfribidi = "red"
 DISTRO_PN_ALIAS_pn-libfribidi = "OpenSuSE=fribidi Ubuntu=fribidi Mandriva=fribidi Debian=fribidi"
 RECIPE_LATEST_VERSION_pn-libfribidi = "0.19.2"
@@ -1504,14 +1499,15 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-elfutils="1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-elfutils="Jun 01, 2010"
 
 RECIPE_STATUS_pn-pkgconfig = "green"
+RECIPE_LATEST_VERSION_pn-pkgconfig = "0.26"
+RECIPE_LATEST_RELEASE_DATE_pn-pkgconfig = "May 15, 2011"
 RECIPE_LAST_UPDATE_pn-pkgconfig = "Jul 13, 2010"
 RECIPE_MAINTAINER_pn-pkgconfig = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-pkgconfig = "not done"
-RECIPE_LATEST_VERSION_pn-pkgconfig = "0.25"
 RECIPE_INTEL_SECTION_pn-pkgconfig = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pkgconfig = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-pkgconfig = "May 01, 2010"
-RECIPE_COMMENTS_pn-pkgconfig = "git as candidate, 0.23: Jan 01, 2008, 0.24: 05/2010, 0.25: 05/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pkgconfig = "1 year"
+RECIPE_COMMENTS_pn-pkgconfig = ""
+RECIPE_NO_UPDATE_REASON_pn-pkgconfig = "0.26 removes glib-conf, adds circular depends"
 
 RECIPE_STATUS_pn-less = "green"
 RECIPE_LAST_UPDATE_pn-less = "May 24, 2011"
@@ -1548,17 +1544,17 @@ RECIPE_LATEST_RELEASE_DATE_pn-findutils = "Jun 01, 2009"
 RECIPE_COMMENTS_pn-findutils = ""
 
 RECIPE_STATUS_pn-file = "green"
+RECIPE_LATEST_VERSION_pn-file = "5.09"
+RECIPE_LATEST_RELEASE_DATE_pn-file = "Sep 16, 2011"
 RECIPE_LAST_UPDATE_pn-file = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-file = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-file = "done"
-RECIPE_LATEST_VERSION_pn-file = "5.09"
 RECIPE_PATCH_pn-file+dump = "some new magic data"
 RECIPE_PATCH_pn-file+filesystems = "some other new magic data"
 RECIPE_INTEL_SECTION_pn-file = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-file = "1-3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-file = "Sep 16, 2011"
 RECIPE_COMMENTS_pn-file = "2-clause BSD"
-RECIPE_MANUAL_CHECK_DATE_pn-file = "Sep 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-file = "Nov 08, 2011"
 
 RECIPE_STATUS_pn-rsync = "green"
 RECIPE_LAST_UPDATE_pn-rsync = "Jul 6, 2010"
@@ -1690,9 +1686,9 @@ RECIPE_LATEST_RELEASE_DATE_pn-strace = "Apr 01, 2010"
 RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
+RECIPE_LATEST_VERSION_pn-dhcp = "4.2.3
+RECIPE_LATEST_RELEASE_DATE_pn-dhcp = "Oct 19, 2011
 RECIPE_LAST_UPDATE_pn-dhcp = "Sep 28, 2011"
-RECIPE_LATEST_VERSION_pn-dhcp = "4.2.2
-RECIPE_LATEST_RELEASE_DATE_pn-dhcp = "Aug 10, 2011
 RECIPE_MAINTAINER_pn-dhcp = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-dhcp = "base utils"
 RECIPE_COMMENTS_pn-dhcp = "several major release, others are 3.1.3, 4.0.2-P1, need to identify"
@@ -1929,6 +1925,7 @@ RECIPE_LATEST_VERSION_pn-tiff = "3.9.5"
 RECIPE_LAST_UPDATE_pn-tiff = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-tiff = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-tiff = "Jul 12, 2011"
+RECIPE_NO_UPDATE_REASON_pn-tiff = "Wait until 4.0.0 releases"
 
 RECIPE_STATUS_pn-libexif = "green"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.20"
@@ -3106,10 +3103,10 @@ RECIPE_LATEST_VERSION_pn-unifdef="2.6.18+git"
 RECIPE_MAINTAINER_pn-unifdef = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gnu-config="green" 
-RECIPE_LATEST_VERSION_pn-gnu-config="svn"
+RECIPE_LATEST_VERSION_pn-gnu-config="git"
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
-RECIPE_LAST_UPDATE_pn-gnu-config = "Jun 21, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Oct 18, 2011" 
+RECIPE_LAST_UPDATE_pn-gnu-config = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Nov 08, 2011"
 RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-mpfr="green"
@@ -5137,7 +5134,10 @@ RECIPE_NO_OF_PATCHES_pn-gobject-introspection = "3"
 RECIPE_INTEL_SECTION_pn-gobject-introspection = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gobject-introspection = "1 months"
 RECIPE_LATEST_RELEASE_DATE_pn-gobject-introspection = "Sep 01, 2010"
-RECIPE_COMMENTS_pn-gobject-introspection = ""
+RECIPE_COMMENTS_pn-gobject-introspection = "m4 files are used but upstream source is not cross-compile-able"
+RECIPE_NO_UPDATE_REASON_pn-gobject_introspection = "Does not cross-compile"
+RECIPE_MAINTAINER_pn-gobject-introspection = "Kai Kang <kai.kang@windriver.org>"
+
 RECIPE_LAST_UPDATE_pn-gnome-common = "Jul 7, 2010"
 RECIPE_MAINTAINER_pn-gnome-common = "Zhai Edwin <edwin.zhai@intel.com>"
 
-- 
1.7.6.4



