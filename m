Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxrb-0004fO-DB
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:48 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752302"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:25 -0800
Message-Id: <248597a39b0dfbd1e01750d3c8da4d0bd9d591ca.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 099/113] distro_tracking_fields.inc: update the info
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:36 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

They are
mdadm
liburcu
lttng-ust
lttng-control
inputproto
libpciaccess
util-macros
libxi
libx11
libx11-trim
libx11-diet
xkeyboard-config

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  107 +++++++++++---------
 1 files changed, 57 insertions(+), 50 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 0fe6299..cc2d9d5 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1020,13 +1020,14 @@ RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mdadm = "not done"
-RECIPE_LATEST_VERSION_pn-mdadm = "3.2.2"
-RECIPE_NO_OF_PATCHES_pn-mdadm = "0"
+RECIPE_LATEST_VERSION_pn-mdadm = "3.2.3"
+RECIPE_NO_OF_PATCHES_pn-mdadm = "1"
+RECIPE_PATCH_pn-mdadm+mdadm-3.2.2_fix_for_x32 = "fix CC's value"
 RECIPE_INTEL_SECTION_pn-mdadm = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "2+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "Jun 17, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "4+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "Dec 23, 2011"
 RECIPE_COMMENTS_pn-mdadm = ""
-RECIPE_LAST_UPDATE_pn-mdadm = "Aug 16, 2011"
+RECIPE_LAST_UPDATE_pn-mdadm = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-mdadm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-screen = "green"
@@ -2896,38 +2897,38 @@ RECIPE_MAINTAINER_pn-tcf-agent = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-liburcu = "green"
 DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
 RECIPE_DEPENDENCY_CHECK_pn-liburcu = "not done"
-RECIPE_LATEST_VERSION_pn-liburcu = "0.5.4"
+RECIPE_LATEST_VERSION_pn-liburcu = "0.6.7"
 RECIPE_NO_OF_PATCHES_pn-liburcu = "0"
 RECIPE_INTEL_SECTION_pn-liburcu = "libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liburcu = "20 hours"
-RECIPE_LATEST_RELEASE_DATE_pn-liburcu = "Mar 4, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liburcu = "1+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-liburcu = "Dec 12, 2011"
 RECIPE_COMMENTS_pn-liburcu = ""
-RECIPE_LAST_UPDATE_pn-liburcu = "Apr 20, 2011"
+RECIPE_LAST_UPDATE_pn-liburcu = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-liburcu = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-lttng-ust = "green"
 DISTRO_PN_ALIAS_pn-lttng-ust = "OSPDT upstream=http://lttng.org/"
 RECIPE_DEPENDENCY_CHECK_pn-lttng-ust = "not done"
-RECIPE_LATEST_VERSION_pn-lttng-ust = "0.12"
+RECIPE_LATEST_VERSION_pn-lttng-ust = "0.16"
 RECIPE_NO_OF_PATCHES_pn-lttng-ust = "0"
 RECIPE_INTEL_SECTION_pn-lttng-ust = "sdk-tools"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-ust = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-lttng-ust = "Mar 15, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-ust = "5 months"
+RECIPE_LATEST_RELEASE_DATE_pn-lttng-ust = "Dec 15, 2011"
 RECIPE_COMMENTS_pn-lttng-ust = ""
-RECIPE_LAST_UPDATE_pn-lttng-ust = "Apr 20, 2011"
+RECIPE_LAST_UPDATE_pn-lttng-ust = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-lttng-ust = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-lttng-control = "green"
 DISTRO_PN_ALIAS_pn-lttng-control = "OSPDT upstream=http://lttng.org/"
 RECIPE_DEPENDENCY_CHECK_pn-lttng-control = "not done"
-RECIPE_LATEST_VERSION_pn-lttng-control = "0.88-09242010"
-RECIPE_NO_UPDATE_REASON_pn-lttng-control = "0.88-09242010 has been the latest version."
+RECIPE_LATEST_VERSION_pn-lttng-control = "0.89-05122011"
+RECIPE_NO_UPDATE_REASON_pn-lttng-control = "0.89-05122011 has been the latest version."
 RECIPE_NO_OF_PATCHES_pn-lttng-control = "0"
 RECIPE_INTEL_SECTION_pn-lttng-control = "sdk-tools"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-control = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-lttng-control = "Sep 24, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-control = "8+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-lttng-control = "May 12, 2011"
 RECIPE_COMMENTS_pn-lttng-control = ""
-RECIPE_LAST_UPDATE_pn-lttng-control = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-lttng-control = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-lttng-control = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-lttng-viewer = "green"
@@ -3982,14 +3983,14 @@ RECIPE_MAINTAINER_pn-glproto = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-inputproto = "green"
 DISTRO_PN_ALIAS_pn-inputproto = "Meego=xorg-x11-proto-inputproto"
 RECIPE_DEPENDENCY_CHECK_pn-inputproto = "not done"
-RECIPE_LATEST_VERSION_pn-inputproto = "2.1.99.2"
+RECIPE_LATEST_VERSION_pn-inputproto = "2.1.99.4"
 RECIPE_NO_OF_PATCHES_pn-inputproto = "0"
-RECIPE_NO_UPDATE_REASON_pn-inputproto = "Do not upgrade to version: 2.1.99.2 that has unstable code. 2.2 would be the next stable release."
+RECIPE_NO_UPDATE_REASON_pn-inputproto = "Do not upgrade to version: 2.1.99.4 that has unstable code. 2.2 would be the next stable release."
 RECIPE_INTEL_SECTION_pn-inputproto = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-inputproto = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-inputproto = "Nov 10, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-inputproto = "Dec 20, 2011"
 RECIPE_COMMENTS_pn-inputproto = ""
-RECIPE_LAST_UPDATE_pn-inputproto = "Nov 30, 2011"
+RECIPE_LAST_UPDATE_pn-inputproto = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-inputproto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-kbproto = "green"
@@ -4017,13 +4018,14 @@ RECIPE_MAINTAINER_pn-libdmx = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxi = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxi = "not done"
-RECIPE_LATEST_VERSION_pn-libxi = "1.4.3"
+RECIPE_LATEST_VERSION_pn-libxi = "1.5.99.2"
+RECIPE_NO_UPDATE_REASON_pn-libxi = "Do not upgrade to version: 1.5.99.2 because this is a development version that requres inputproto >= 2.0.99.1"
 RECIPE_NO_OF_PATCHES_pn-libxi = "0"
 RECIPE_INTEL_SECTION_pn-libxi = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxi = "2+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxi = "Jun 6, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxi = "1 day"
+RECIPE_LATEST_RELEASE_DATE_pn-libxi = "Dec 21, 2011"
 RECIPE_COMMENTS_pn-libxi = ""
-RECIPE_LAST_UPDATE_pn-libxi = "Jun 13, 2011"
+RECIPE_LAST_UPDATE_pn-libxi = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libxi = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxinerama = "green"
@@ -4603,35 +4605,37 @@ RECIPE_MAINTAINER_pn-libxmu = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libpciaccess = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpciaccess = "not done"
-RECIPE_LATEST_VERSION_pn-libpciaccess = "0.12.1"
-RECIPE_NO_OF_PATCHES_pn-libpciaccess = "0"
+RECIPE_LATEST_VERSION_pn-libpciaccess = "0.12.902"
+RECIPE_NO_OF_PATCHES_pn-libpciaccess = "1"
+RECIPE_PATCH_pn-libpciaccess+fix_deletion_of_last_handle.patch = "The patch is already in upstream git repo."
 RECIPE_INTEL_SECTION_pn-libpciaccess = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpciaccess = "6+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-libpciaccess = "Feb 2, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpciaccess = "1+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-libpciaccess = "Nov 09, 2011"
 RECIPE_COMMENTS_pn-libpciaccess = ""
-RECIPE_LAST_UPDATE_pn-libpciaccess = "Apr 11, 2011"
+RECIPE_LAST_UPDATE_pn-libpciaccess = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libpciaccess = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xkeyboard-config = "green"
 RECIPE_DEPENDENCY_CHECK_pn-xkeyboard-config = "not done"
-RECIPE_LATEST_VERSION_pn-xkeyboard-config = "2.1"
+RECIPE_LATEST_VERSION_pn-xkeyboard-config = "2.3.99"
+RECIPE_NO_UPDATE_REASON_pn-xkeyboard-config = "Do not upgrade to version: 2.3.99 because this is a development version"
 RECIPE_NO_OF_PATCHES_pn-xkeyboard-config = "0"
 RECIPE_INTEL_SECTION_pn-xkeyboard-config = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xkeyboard-config = "3+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-xkeyboard-config = "Jan 11, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xkeyboard-config = "8 months"
+RECIPE_LATEST_RELEASE_DATE_pn-xkeyboard-config = "Sep 15, 2011"
 RECIPE_COMMENTS_pn-xkeyboard-config = ""
-RECIPE_LAST_UPDATE_pn-xkeyboard-config = "Jan 28, 2011"
+RECIPE_LAST_UPDATE_pn-xkeyboard-config = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-xkeyboard-config = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-util-macros = "green"
 DISTRO_PN_ALIAS_pn-util-macros = "Meego=xorg-x11-util-macros Fedora=xorg-x11-util-macros Mandriva=x11-util-macros"
 RECIPE_DEPENDENCY_CHECK_pn-util-macros = "not done"
-RECIPE_LATEST_VERSION_pn-util-macros = "1.15.0"
+RECIPE_LATEST_VERSION_pn-util-macros = "1.16.0"
 RECIPE_INTEL_SECTION_pn-util-macros = "x11/utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "Jun 23, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "5+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "Dec 07, 2011"
 RECIPE_COMMENTS_pn-util-macros = ""
-RECIPE_LAST_UPDATE_pn-util-macros = "Aug 16, 2011"
+RECIPE_LAST_UPDATE_pn-util-macros = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-util-macros = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-fontconfig = "green"
@@ -4673,23 +4677,25 @@ RECIPE_MAINTAINER_pn-librsvg = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-libx11 = "green"
 DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 RECIPE_DEPENDENCY_CHECK_pn-libx11 = "not done"
-RECIPE_LATEST_VERSION_pn-libx11 = "1.3.4"
+RECIPE_LATEST_VERSION_pn-libx11 = "1.4.99.1"
+RECIPE_NO_UPDATE_REASON_pn-libx11 = "Do not upgrade to version: 1.4.99.1 because this is a development version"
 RECIPE_NO_OF_PATCHES_pn-libx11 = "3"
 RECIPE_PATCH_pn-libx11+x11_disable_makekeys = "fix to src/util/Makefile.am"
 RECIPE_PATCH_pn-libx11+nodolt = "fix to configure.ac"
 RECIPE_PATCH_pn-libx11+include_fix = "fix to configure.ac"
 RECIPE_INTEL_SECTION_pn-libx11 = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libx11 = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libx11 = "Jun 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libx11 = "3+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-libx11 = "Nov 10, 2011"
 RECIPE_COMMENTS_pn-libx11 = ""
-RECIPE_LAST_UPDATE_pn-libx11 = "Jul 9, 2010"
+RECIPE_LAST_UPDATE_pn-libx11 = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libx11 = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libx11-diet = "green"
 DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
-RECIPE_LATEST_VERSION_pn-libx11-diet = "1.4.4"
-RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet = "Jul 28, 2011"
-RECIPE_LAST_UPDATE_pn-libx11-diet = "Nov 22, 2011"
+RECIPE_NO_UPDATE_REASON_pn-libx11-diet = "Do not upgrade to version: 1.4.99.1 because this is a development version"
+RECIPE_LATEST_VERSION_pn-libx11-diet = "1.4.99.1"
+RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet = "Nov 10, 2011"
+RECIPE_LAST_UPDATE_pn-libx11-diet = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-directfb = "green"
@@ -4716,16 +4722,17 @@ RECIPE_MAINTAINER_pn-xserver-xorg-lite  = "Xiaofeng Yan <xiaofeng.yan@windriver.
 RECIPE_STATUS_pn-libx11-trim = "green"
 DISTRO_PN_ALIAS_pn-libx11-trim = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 RECIPE_DEPENDENCY_CHECK_pn-libx11-trim = "not done"
-RECIPE_LATEST_VERSION_pn-libx11-trim = "1.3.4"
+RECIPE_LATEST_VERSION_pn-libx11-trim = "1.4.99.1"
+RECIPE_NO_UPDATE_REASON_pn-libx11-trim = "Do not upgrade to version: 1.4.99.1 because this is a development version"
 RECIPE_NO_OF_PATCHES_pn-libx11-trim = "3"
 RECIPE_PATCH_pn-libx11-trim+x11_disable_makekeys = "fix to src/util/Makefile.am"
 RECIPE_PATCH_pn-libx11-trim+include_fix = "fix to configure.ac"
 RECIPE_PATCH_pn-libx11-trim+nodolt = "fix to configure.ac"
 RECIPE_INTEL_SECTION_pn-libx11-trim = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libx11-trim = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libx11-trim = "Jun 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libx11-trim = "3+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-libx11-trim = "Nov 10, 2011"
 RECIPE_COMMENTS_pn-libx11-trim = ""
-RECIPE_LAST_UPDATE_pn-libx11-trim = "Jul 9, 2010"
+RECIPE_LAST_UPDATE_pn-libx11-trim = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libx11-trim = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-gnome-vfs = "green"
-- 
1.7.6.4



