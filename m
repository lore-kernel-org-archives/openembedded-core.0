Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RT1bN-00066N-E2
	for openembedded-core@openembedded.org; Wed, 23 Nov 2011 02:26:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 17:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="88336258"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2011 17:18:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 22 Nov 2011 17:18:28 -0800
Message-Id: <e72b57460cb7345b954f991d0051d3d0e2f2a01f.1322008856.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
Subject: [PATCH 7/7] distro_tracking_fields: Update after Manual Check
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
X-List-Received-Date: Wed, 23 Nov 2011 01:26:18 -0000

Checked upstream for updates of the following packages:
 - libiconv
 - libxml2
 - sysstat
 - tcp_wrapper
 - texinfo

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   37 ++++++++++++--------
 1 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 700a8dd..17d9f2f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -370,16 +370,16 @@ RECIPE_LATEST_RELEASE_DATE_pn-libusb = "May 01, 2010"
 RECIPE_COMMENTS_pn-libusb1 = ""
 
 RECIPE_STATUS_pn-libusb-compat = "green"
+RECIPE_LATEST_VERSION_pn-libusb-compat = "0.1.3"
+RECIPE_LATEST_RELEASE_DATE_pn-libusb-compat = "Jul 08, 2009"
 RECIPE_LAST_UPDATE_pn-libusb-compat = "Jul 16, 2010"
-RECIPE_MAINTAINER_pn-libusb-compat = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-libusb-compat = "Jun 06, 2011"
 RECIPE_DEPENDENCY_CHECK_pn-libusb-compat = "done"
-RECIPE_LATEST_VERSION_pn-libusb-compat = "0.1.3"
 RECIPE_INTEL_SECTION_pn-libusb-compat = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libusb-compat = "stable"
-RECIPE_LATEST_RELEASE_DATE_pn-libusb-compat = "Jul 08, 2009"
 RECIPE_COMMENTS_pn-libusb-compat = "replaces libusb, but doesn't provides libusbpp"
 DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
-RECIPE_MANUAL_CHECK_DATE_pn-libusb-compat = "Jun 06, 2011"
+RECIPE_MAINTAINER_pn-libusb-compat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libnl = "green"
 RECIPE_LAST_UPDATE_pn-libnl = "Nov 15, 2010"
@@ -390,29 +390,29 @@ RECIPE_LATEST_RELEASE_DATE_pn-libnl = "Oct 01, 2010"
 RECIPE_NO_UPDATE_REASON_pn-libnl = "libnl-3.2.2 is incompatible with libnl2, so no Upgrade"
 
 RECIPE_STATUS_pn-zlib = "yellow"  # local config scripts
+RECIPE_LATEST_VERSION_pn-zlib = "1.2.5"
+RECIPE_LATEST_RELEASE_DATE_pn-zlib = "Mar 01, 2010"
 RECIPE_LAST_UPDATE_pn-zlib = "Jun 11, 2010"
 RECIPE_MAINTAINER_pn-zlib = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zlib = "not done"
-RECIPE_LATEST_VERSION_pn-zlib = "1.2.5"
 RECIPE_PATCH_pn-zlib+configure.ac = "override default build method"
 RECIPE_PATCH_pn-zlib+Makefile.am = "override default build method"
 RECIPE_INTEL_SECTION_pn-zlib = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zlib = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-zlib = "Mar 01, 2010"
 RECIPE_COMMENTS_pn-zlib = "rconflicts: libxml2 (< 2.7.7) (rbreaks)"
 RECIPE_NO_UPDATE_REASON_pn-zlib = "zlib-1.2.5 is latest, version parser reports 121 in error"
 
 RECIPE_STATUS_pn-libxml2 = "yellow"
-RECIPE_LAST_UPDATE_pn-libxml2 = "Jun 18, 2010"
+RECIPE_LATEST_VERSION_pn-libxml2 = "2.7.8"
+RECIPE_LATEST_RELEASE_DATE_pn-libxml2 = "Nov 04, 2010"
+RECIPE_LAST_UPDATE_pn-libxml2 = "Apr 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libxml2 = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libxml2 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libxml2 = "done"
-RECIPE_LATEST_VERSION_pn-libxml2 = "2.7.8"
 RECIPE_PATCH_pn-libxml2+install = "use poky environment variables"
 RECIPE_INTEL_SECTION_pn-libxml2 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxml2 = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxml2 = "Mar 01, 2010"
 RECIPE_COMMENTS_pn-libxml2 = ""
-RECIPE_MANUAL_CHECK_DATE_pn-libxml2 = "Jun 06, 2011"
 
 RECIPE_STATUS_pn-readline = "green"
 RECIPE_LAST_UPDATE_pn-readline = "May 10, 2011"
@@ -571,8 +571,8 @@ RECIPE_MAINTAINER_pn-tcp-wrappers = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-tcp-wrappers = "7.6"
 RECIPE_INTEL_SECTION_pn-tcp-wrappers = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcp-wrappers = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-tcp-wrappers = "Apr 04, 1997"
-RECIPE_MANUAL_CHECK_DATE_pn-tcp-wrappers = "Sep 28, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-tcp-wrappers = "Apr 08, 1997"
+RECIPE_MANUAL_CHECK_DATE_pn-tcp-wrappers = "Nov 22, 2011"
 RECIPE_COMMENTS_pn-tcp-wrappers = "Consider looking at ipv6.4 version"
 RECIPE_NO_UPDATE_REASON_pn-tcp-wrapers = "7.6 is last Stable release"
 
@@ -1834,9 +1834,9 @@ DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 
 RECIPE_STATUS_pn-sysstat = "green"
 RECIPE_LATEST_VERSION_pn-sysstat = "10.0.2"
-RECIPE_LATEST_RELEASE_DATE_pn-systat = "Aug 28, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Aug 28, 2011"
 RECIPE_LAST_UPDATE_pn-sysstat = "Sep 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-systat = "Nov 8, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Nov 8, 2011"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
@@ -5801,7 +5801,7 @@ RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_LATEST_VERSION_pn-texinfo = "4.13a"
 RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
 RECIPE_LAST_UPDATE_pn-texinfo = "Sep 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Sep 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Nov 22, 2011"
 RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
 
 RECIPE_LATEST_VERSION_pn-blktrace = "a788dfde86dfaff8f1c277a233f92c1822e06b76"
@@ -6055,7 +6055,14 @@ RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
 RECIPE_LAST_UPDATE_pn-chkconfig = "Oct 19, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "Oct 25, 2011"
 
+RECIPE_STATUS_pn-libiconv = "green"
+RECIPE_LATEST_VERSION_pn-libiconv = "1.14"
+RECIPE_LATEST_RELEASE_DATE_pn-libiconv = "Aug 07, 2011"
+RECIPE_LAST_UPDATE_pn-libiconv = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libiconv = "Nov 22, 2011"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
+RECIPE_MAINTAINER_pn-libiconv = "Saul Wold <sgw@linux.intel.com>"
+
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
 RECIPE_MAINTAINER_pn-update-alternatives-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
-- 
1.7.5.4



