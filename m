Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbz-0005NT-BP
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233749"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:14 -0800
Message-Id: <2cd2cbc5af1d9ce2dd93c5b4151877d54a93b4d2.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/26] distro_tracking: Mark Upgrade Info
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:48 -0000

Updated the following:
 - libdrm
 - texi2html
 - mc
 - libidn
 - augeas
 - python-pycairo

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   50 +++++++++++--------
 1 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index fc54e33..3c4eca4 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -269,13 +269,12 @@ RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
-RECIPE_DEPENDENCY_CHECK_pn-libidn = "not done"
-RECIPE_LATEST_VERSION_pn-libidn = "1.19"
+RECIPE_LATEST_VERSION_pn-libidn = "1.23"
+RECIPE_LATEST_RELEASE_DATE_pn-libidn = "Nov 25, 2010"
+RECIPE_LAST_UPDATE_pn-libidn = "Dec 18, 2011"
 RECIPE_INTEL_SECTION_pn-libidn = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libidn = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libidn = "May 01, 2010"
 RECIPE_COMMENTS_pn-libidn = ""
-RECIPE_LAST_UPDATE_pn-libidn = "Jul 20, 2010"
 RECIPE_MAINTAINER_pn-libidn = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-glibc = "green"
@@ -601,12 +600,12 @@ DISTRO_PN_ALIAS_pn-libcheck = "Ubuntu=check Fedora=check OpenSuSE=check"
 
 RECIPE_STATUS_pn-augeas = "green"
 RECIPE_DEPENDENCY_CHECK_pn-augeas = "done"
-RECIPE_LAST_UPDATE_pn-augeas = "Aug 20, 2010"
+RECIPE_LATEST_VERSION_pn-augeas = "0.10.0"
+RECIPE_LATEST_RELEASE_DATE_pn-augeas = "Dec 02, 2011"
+RECIPE_LAST_UPDATE_pn-augeas = "Dec 20, 2011"
 RECIPE_MAINTAINER_pn-augeas = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-augeas = "0.7.3"
 RECIPE_INTEL_SECTION_pn-augeas = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-augeas = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-augeas = "Aug 01, 2010"
 RECIPE_COMMENTS_pn-augeas = ""
 DISTRO_PN_ALIAS_pn-augeas = "Ubuntu=libaugeas0 Debian=libaugeas0"
 
@@ -1170,6 +1169,7 @@ RECIPE_LATEST_VERSION_pn-libffi  = "3.0.10"
 RECIPE_LATEST_RELEASE_DATE_pn-libffi = "Aug 23, 2011"
 RECIPE_LAST_UPDATE_pn-libffi = "Nov 29, 2011"
 RECIPE_MAINTAINER_pn-libffi  = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_NO_UPDATE_REASON_pn-libffi="3.0.11 is still RC"
 
 RECIPE_STATUS_pn-libgdbus = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libgdbus = "not done"
@@ -3618,23 +3618,23 @@ RECIPE_LAST_UPDATE_pn-xf86-input-vmmouse = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xf86-input-vmmouse="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libdrm="green" # no update needed
-RECIPE_LATEST_VERSION_pn-libdrm="2.4.27"
-RECIPE_LATEST_RELEASE_DATE_pn-libdrm="Oct 29, 2011"
-RECIPE_LAST_UPDATE_pn-libdrm = "Nov 28, 2011"
+RECIPE_LATEST_VERSION_pn-libdrm="2.4.29"
+RECIPE_LATEST_RELEASE_DATE_pn-libdrm="Dec 13, 2011"
+RECIPE_LAST_UPDATE_pn-libdrm = "Dec 18, 2011"
 RECIPE_NO_OF_PATCHES_pn-libdrm="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm="1 month"
 RECIPE_INTEL_SECTION_pn-libdrm="graphic core"
 RECIPE_MAINTAINER_pn-libdrm="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-python-pycairo="green" # no upgrade needed
-DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
-RECIPE_LATEST_VERSION_pn-python-pycairo="1.8.10"
+RECIPE_LATEST_VERSION_pn-python-pycairo="1.10.0"
+RECIPE_LATEST_RELEASE_DATE_pn-python-pycairo="Apr 18, 2011"
+RECIPE_LAST_UPDATE_pn-python-pycairo = "Dec 19, 2011"
 RECIPE_NO_OF_PATCHES_pn-python-pycairo="0"
-RECIPE_LATEST_RELEASE_DATE_pn-python-pycairo="May 20, 2010"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-python-pycairo="9 months"
 RECIPE_INTEL_SECTION_pn-python-pycairo="graphic core"
-RECIPE_LAST_UPDATE_pn-python-pycairo = "Aug 16, 2010"
 RECIPE_MAINTAINER_pn-python-pycairo="Saul Wold <sgw@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
 
 RECIPE_STATUS_pn-libxfontcache="green" # no update neededd
 RECIPE_LATEST_VERSION_pn-libxfontcache="1.0.5"
@@ -5727,7 +5727,6 @@ RECIPE_STATUS_pn-dtc = "red"
 RECIPE_STATUS_pn-gcalctool = "red"
 RECIPE_STATUS_pn-swabber = "red"
 RECIPE_STATUS_pn-man = "red"
-RECIPE_STATUS_pn-man-pages = "red"
 RECIPE_STATUS_pn-guilt-native = "red"
 RECIPE_STATUS_pn-icon-naming-utils = "red"
 RECIPE_STATUS_pn-groff = "red"
@@ -5828,8 +5827,9 @@ RECIPE_LATEST_VERSION_pn-libgdata = "0.8.0"
 RECIPE_LAST_UPDATE_pn-libgdata = "Dec 29, 2010"
 RECIPE_MAINTAINER_pn-libgdata = "Zhai Edwin <edwin.zhai@intel.com>"
 
+RECIPE_STATUS_pn-man-pages = "red"
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
-RECIPE_LATEST_RELEASE_DATE_pn-man-pages = "Sep 02, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-man-pages = "Dec 03, 2010"
 RECIPE_LAST_UPDATE_pn-man-pages = "Dec 29, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-man-pages = "Dec 15, 2011"
 RECIPE_COMMENTS_pn-man-pages = "Kernel.org is down"
@@ -5837,8 +5837,8 @@ RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
 
 RECIPE_LATEST_VERSION_pn-gst-plugin-bluetooh = "4.96"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-plugin-bluetooh = "Sep 02, 2011"
-RECIPE_LAST_UPDATE_pn-gst-plugin-bluetooh = "Dec 29, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-plugin-bluetooh = "Jul 31, 2011"
+RECIPE_LAST_UPDATE_pn-gst-plugin-bluetooh = "Aug 12, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-gst-plugin-bluetooh = "Dec 15, 2011"
 RECIPE_COMMENTS_pn-gst-plugin-bluetooth = "Kernel.org is down"
 
@@ -5853,7 +5853,13 @@ RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
 RECIPE_LAST_UPDATE_pn-texinfo = "Sep 16, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Nov 22, 2011"
 RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
-RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-texinfo = "Saul Wold <sgw@linux.intel.com>"
+
+RECIPE_LATEST_VERSION_pn-texi2html = "5.0
+RECIPE_LATEST_RELEASE_DATE_pn-texi2html = "Jul 01, 2010"
+RECIPE_LAST_UPDATE_pn-texi2html = "Dec 18, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-texi2html = "Dec 18, 2011"
+RECIPE_MAINTAINER_pn-texi2html = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-blktrace = "a788dfde86dfaff8f1c277a233f92c1822e06b76"
 RECIPE_LATEST_VERSION_pn-dtc = "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569c6"
@@ -5863,9 +5869,11 @@ RECIPE_NO_UPDATE_REASON_pn-bind = "Latest Stable version, newer versions are Alp
 RECIPE_LATEST_VERSION_pn-man = "1.6f"
 
 RECIPE_STATUS_pn-mc = "red"
-RECIPE_LATEST_VERSION_pn-mc = "4.8.0-pre2"
+RECIPE_LATEST_VERSION_pn-mc = "4.8.1"
+RECIPE_LATEST_RELEASE_DATE_pn-mc = 
+RECIPE_LAST_UPDATE_pn-pc = "Dec 19, 2011"
 RECIPE_MAINTAINER_pn-mc = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_NO_UPDATE_REASON_pn-mc = "4.7.5.5 is latest stable version, 4.8.0-pre2 is Alpha/Beta"
+RECIPE_NO_UPDATE_REASON_pn-mc = ""
 
 RECIPE_STATUS_pn-sgml-common = "green"
 RECIPE_DEPENDENCY_CHECK_pn-sgml-common = "not done"
-- 
1.7.6.4



