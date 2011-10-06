Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgi-0008V7-Be
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495960"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:15:00 -0700
Message-Id: <2c379feebd0a2fbcb38ee5cb80a41701ca4c1421.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 21/21] distro_tracking: Updates
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:49 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   62 ++++++++++++--------
 1 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index dd0fbf8..7b6c4a9 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -418,7 +418,7 @@ RECIPE_INTEL_SECTION_pn-readline = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-readline = "11 months"
 RECIPE_LATEST_RELEASE_DATE_pn-readline = "Feb 13, 2011"
 RECIPE_COMMENTS_pn-readline = ""
-RECIPE_MANUAL_CHECK_DATE_pn-readline = "Sept 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-readline = "Sep 27, 2011"
 
 RECIPE_STATUS_pn-libgcrypt = "green"
 RECIPE_LAST_UPDATE_pn-libgcrypt = "Jul 29, 2010"
@@ -432,16 +432,16 @@ RECIPE_LATEST_RELEASE_DATE_pn-libgcrypt = "12/2009"
 RECIPE_COMMENTS_pn-libgcrypt = ""
 
 RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
-RECIPE_LAST_UPDATE_pn-gnutls = "May 25, 2011"
+RECIPE_LATEST_VERSION_pn-gnutls = "2.12.11"
+RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "Sep 18, 2011"
+RECIPE_LAST_UPDATE_pn-gnutls = "Oct 6, 2011"
 RECIPE_MAINTAINER_pn-gnutls = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gnutls = "done"
-RECIPE_LATEST_VERSION_pn-gnutls = "2.12.5"
 RECIPE_PATCH_pn-gnutls+gnutls-openssl = "unkown"
 RECIPE_PATCH_pn-gnutls+gnutls-texinfo-euro = "fix if @euro is missing in texinfo"
 RECIPE_PATCH_pn-gnutls+configure-fix = "fix Requires.private and Libs.private in autotools script"
 RECIPE_INTEL_SECTION_pn-gnutls = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnutls = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "May 14, 2011"
 RECIPE_COMMENTS_pn-gnutls = "requires libtasn1, but has an internal copy"
 
 RECIPE_STATUS_pn-lzo = "green"
@@ -479,11 +479,12 @@ RECIPE_INTEL_SECTION_pn-libnss-mdns = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-libnss-mdns = "05/2007"
 
 RECIPE_STATUS_pn-ncurses = "green"
-RECIPE_LAST_UPDATE_pn-ncurses = "Dec 30, 2010"
-RECIPE_MAINTAINER_pn-ncurses = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_LATEST_RELEASE_DATE_pn-ncurses = "Apr 04, 2011"
 RECIPE_LATEST_VERSION_pn-ncurses = "5.9"
+RECIPE_LAST_UPDATE_pn-ncurses = "Apr 06, 2011"
 RECIPE_INTEL_SECTION_pn-ncurses = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-ncurses = "Apr 04, 2011"
+RECIPE_MAINTAINER_pn-ncurses = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-ncurses = "Sep 29, 2011"
 
 RECIPE_STATUS_pn-popt = "green"
 RECIPE_LAST_UPDATE_pn-popt = "Jul 5, 2010"
@@ -563,8 +564,8 @@ RECIPE_MAINTAINER_pn-tcp-wrappers = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-tcp-wrappers = "7.6"
 RECIPE_INTEL_SECTION_pn-tcp-wrappers = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcp-wrappers = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-tcp-wrappers = "n/a"
-RECIPE_MANUAL_CHECK_DATE_pn-tcp-wrappers = "Jul 12, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-tcp-wrappers = "Apr 04, 1997"
+RECIPE_MANUAL_CHECK_DATE_pn-tcp-wrappers = "Sep 28, 2011"
 RECIPE_COMMENTS_pn-tcp-wrappers = "Consider looking at ipv6.4 version"
 RECIPE_NO_UPDATE_REASON_pn-tcp-wrapers = "7.6 is last Stable release"
 
@@ -1170,8 +1171,9 @@ RECIPE_LAST_UPDATE_pn-apr-util = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-apr-util = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-apt = "red"
-RECIPE_LATEST_VERSION_pn-apt = "0.7.25.3"
-RECIPE_LAST_UPDATE_pn-apt = "Jun 19, 2008"
+RECIPE_LATEST_VERSION_pn-apt = "0.8.15.8"
+RECIPE_LATEST_RELEASE_DATE_pn-apt = "Sep 14, 2011"
+RECIPE_LAST_UPDATE_pn-apt = "Oct 6, 2011"
 RECIPE_MAINTAINER_pn-apt = "Mei Lei <lei.mei@intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-apt="similar to zypper, defer the upgrading"
 
@@ -1682,11 +1684,11 @@ RECIPE_LATEST_RELEASE_DATE_pn-strace = "04/2010"
 RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
-RECIPE_LAST_UPDATE_pn-dhcp = "Nov 17, 2010"
+RECIPE_LAST_UPDATE_pn-dhcp = "Sep 28, 2011"
+RECIPE_LATEST_VERSION_pn-dhcp = "4.2.2
+RECIPE_LATEST_RELEASE_DATE_pn-dhcp = "Aug 10, 2011
 RECIPE_MAINTAINER_pn-dhcp = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-dhcp = "4.2.0-P2"
 RECIPE_INTEL_SECTION_pn-dhcp = "base utils"
-RECIPE_LATEST_RELEASE_DATE_pn-dhcp = "12/2010"
 RECIPE_COMMENTS_pn-dhcp = "several major release, others are 3.1.3, 4.0.2-P1, need to identify"
 
 RECIPE_STATUS_pn-v86d = "yellow"   # self written configure
@@ -1712,14 +1714,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-udev = "06/2010"
 RECIPE_COMMENTS_pn-udev = "may need different versions for different kernels"
 
 RECIPE_STATUS_pn-tzdata = "green"
-RECIPE_LAST_UPDATE_pn-tzdata = "May 24, 2010"
+RECIPE_LATEST_VERSION_pn-tzdata = "2011k"
+RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Sep 26, 2011"
+RECIPE_LAST_UPDATE_pn-tzdata = "Oct 6, 2011"
 RECIPE_MAINTAINER_pn-tzdata = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
-RECIPE_LATEST_VERSION_pn-tzdata = "2011g"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "05/2010"
-RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Oct 6, 2011"
 RECIPE_COMMENTS_pn-tzdata = ""
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 
@@ -1807,9 +1809,9 @@ DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 
 RECIPE_STATUS_pn-sysstat = "green"
 RECIPE_LAST_UPDATE_pn-sysstat = "Sep 27, 2011"
-RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-sysstat = "10.0.2"
 RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Sep 27, 2011"
+RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
 RECIPE_LAST_UPDATE_pn-sysklogd = "Aug 27, 2010"
@@ -3189,9 +3191,9 @@ RECIPE_LATEST_VERSION_pn-oh-puzzles = "0.1+svnr23"
 RECIPE_NO_OF_PATCHES_pn-oh-puzzles = "1"
 RECIPE_INTEL_SECTION_pn-oh-puzzles = "graphic apps"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oh-puzzles = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-oh-puzzles = "04/2008"
+RECIPE_LATEST_RELEASE_DATE_pn-oh-puzzles = "Oct 1, 2011"
 RECIPE_COMMENTS_pn-oh-puzzles = ""
-RECIPE_LAST_UPDATE_pn-oh-puzzles = "Apr 8, 2008"
+RECIPE_LAST_UPDATE_pn-oh-puzzles = "Oct 6, 2011"
 RECIPE_MAINTAINER_pn-oh-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gnome-terminal = "red"
@@ -5704,9 +5706,12 @@ RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
 RECIPE_LATEST_VERSION_pn-qmmp = "0.4.3"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
+
 RECIPE_LATEST_VERSION_pn-texinfo = "4.13a"
-RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parse directory wrong"
-RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Feb 28, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
+RECIPE_LAST_UPDATE_pn-texinfo = "Sep 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Sep 28, 2011"
+RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
 
 RECIPE_LATEST_VERSION_pn-blktrace = "a788dfde86dfaff8f1c277a233f92c1822e06b76"
 RECIPE_LATEST_VERSION_pn-dtc = "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569c6"
@@ -5833,6 +5838,12 @@ RECIPE_LAST_UPDATE_pn-slang = "Jul 28, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 28, 2011"
 RECIPE_MAINTAINER_pn-slang = "Kai Kang <kai.kang@windriver.com>"
 
+RECIPE_STATUS_pn-cups = "red"
+RECIPE_LATEST_VERSION_pn-cups = "1.5.0"
+RECIPE_LATEST_RELEASE_DATE_pn-cups = "Jul 25, 2011"
+RECIPE_LAST_UPDATE_pn-cups = "Feb 1, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-cups = "Sep 28, 2011"
+
 RECIPE_STATUS_pn-libnewt = "green"
 DISTRO_PN_ALIAS_pn-libnewt = "Debian=libnewt0.52 Fedora=newt"
 RECIPE_LATEST_VERSION_pn-libnewt = "0.52.13"
@@ -5883,8 +5894,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "Jun 7, 2011"
 
 RECIPE_STATUS_pn-gettext = "red"
 RECIPE_LATEST_VERSION_pn-gettext = "0.18.1.1"
-RECIPE_LAST_UPDATE_pn-gettext = "Jun 6, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Jun 7, 2011" 
+RECIPE_LATEST_RELEASE_DATE_pn-gettext = "Jun 06, 2010"
+RECIPE_LAST_UPDATE_pn-gettext = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Sep 29, 2011" 
 
 RECIPE_STATUS_pn-pseudo = "green"
 RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
-- 
1.7.6.2



