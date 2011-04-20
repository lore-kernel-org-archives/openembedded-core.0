Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QCRwf-0008A4-41
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 09:35:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2011 00:32:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,245,1301900400"; d="scan'208";a="912088362"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2011 00:32:50 -0700
Message-Id: <06b7ad032fcea781a91348fa12db03a9baeaf491.1303284287.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1303284287.git.dexuan.cui@intel.com>
References: <cover.1303284287.git.dexuan.cui@intel.com>
Old-Date: Mon, 18 Apr 2011 11:15:59 +0800
Date: Wed, 20 Apr 2011 15:30:38 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 9/9] distro_tracking_fields.inc: update the info for the following recipes
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
X-List-Received-Date: Wed, 20 Apr 2011 07:35:29 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

powertop
latencytop
libxfixes
util-macros
mdadm
lttng-control
liburcu
lttng-ust
lttng-viewer

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   65 ++++++++++----------
 1 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 542b865..003ccd9 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -976,13 +976,13 @@ RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mdadm = "not done"
-RECIPE_LATEST_VERSION_pn-mdadm = "3.1.4"
+RECIPE_LATEST_VERSION_pn-mdadm = "3.2.1"
 RECIPE_NO_OF_PATCHES_pn-mdadm = "0"
 RECIPE_INTEL_SECTION_pn-mdadm = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "25 days"
-RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "Aug 31, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mdadm = "1+ months"
+RECIPE_LATEST_RELEASE_DATE_pn-mdadm = "Mar 28, 2011"
 RECIPE_COMMENTS_pn-mdadm = ""
-RECIPE_LAST_UPDATE_pn-mdadm = "Aug 31, 2010"
+RECIPE_LAST_UPDATE_pn-mdadm = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-mdadm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-screen = "green"
@@ -2710,13 +2710,14 @@ RECIPE_MAINTAINER_pn-oprofile = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-powertop = "green"
 DISTRO_PN_ALIAS_pn-powertop ="Meego=powertop Fedora=powertop Debian=powertop OpenSuSE=powertop Mandriva=powertop"
 RECIPE_DEPENDENCY_CHECK_pn-powertop = "not done"
-RECIPE_LATEST_VERSION_pn-powertop = "1.13"
-RECIPE_MANUAL_CHECK_DATE_pn-powertop = "Jan 28, 2011"
+RECIPE_LATEST_VERSION_pn-powertop = "1.97"
+RECIPE_MANUAL_CHECK_DATE_pn-powertop = "Apr 20, 2011"
+RECIPE_NO_UPDATE_REASON_pn-powertop = "Do not upgrade to version 1.97 since it's a beta release of the comming PowerTOP 2.0"
 RECIPE_NO_OF_PATCHES_pn-powertop = "1"
 RECIPE_PATCH_pn-powertop+stub_out_the_ncurses_calls_in_dump_mode = "stub out the ncurses calls in dump mode; this fixes a segfault"
 RECIPE_INTEL_SECTION_pn-powertop = "sdk-tools"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-powertop = "11 months"
-RECIPE_LATEST_RELEASE_DATE_pn-powertop = "07/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-powertop = "3 days"
+RECIPE_LATEST_RELEASE_DATE_pn-powertop = "Jan 5, 2011"
 RECIPE_COMMENTS_pn-powertop = ""
 RECIPE_LAST_UPDATE_pn-powertop = "Aug 27, 2010"
 RECIPE_MAINTAINER_pn-powertop = "Dexuan Cui <dexuan.cui@intel.com>"
@@ -2725,12 +2726,12 @@ RECIPE_STATUS_pn-latencytop = "green"
 DISTRO_PN_ALIAS_pn-latencytop = "Meego=latencytop Fedora=latencytop Debian=latencytop OpenSuSE=latencytop"
 RECIPE_DEPENDENCY_CHECK_pn-latencytop = "not done"
 RECIPE_LATEST_VERSION_pn-latencytop = "0.5"
-RECIPE_MANUAL_CHECK_DATE_pn-latencytop = "Jan 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-latencytop = "Apr 20, 2011"
 RECIPE_NO_OF_PATCHES_pn-latencytop = "1"
 RECIPE_PATCH_pn-latencytop+latencytop-makefile = "-lncursesw ==> -lncurses; gcc ==> CC ?= gcc, and use $(CC); install:mkdir -p $(DESTDIR)/$(SBINDIR)"
 RECIPE_INTEL_SECTION_pn-latencytop = "sdk-tools"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-latencytop = "1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-latencytop = "04/2009"
+RECIPE_LATEST_RELEASE_DATE_pn-latencytop = "Apr 28, 2009"
 RECIPE_COMMENTS_pn-latencytop = ""
 RECIPE_LAST_UPDATE_pn-latencytop = "Jul 22, 2010"
 RECIPE_MAINTAINER_pn-latencytop = "Dexuan Cui <dexuan.cui@intel.com>"
@@ -2754,31 +2755,32 @@ RECIPE_MAINTAINER_pn-tcf-agent = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-liburcu = "green"
 DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
 RECIPE_DEPENDENCY_CHECK_pn-liburcu = "not done"
-RECIPE_LATEST_VERSION_pn-liburcu = "0.5.2"
+RECIPE_LATEST_VERSION_pn-liburcu = "0.5.4"
 RECIPE_NO_OF_PATCHES_pn-liburcu = "0"
 RECIPE_INTEL_SECTION_pn-liburcu = "libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liburcu = "29 minutes"
-RECIPE_LATEST_RELEASE_DATE_pn-liburcu = "Nov 18, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liburcu = "20 hours"
+RECIPE_LATEST_RELEASE_DATE_pn-liburcu = "Mar 4, 2011"
 RECIPE_COMMENTS_pn-liburcu = ""
-RECIPE_LAST_UPDATE_pn-liburcu = "Jan 28, 2011"
+RECIPE_LAST_UPDATE_pn-liburcu = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-liburcu = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-lttng-ust = "green"
 DISTRO_PN_ALIAS_pn-lttng-ust = "OSPDT upstream=http://lttng.org/"
 RECIPE_DEPENDENCY_CHECK_pn-lttng-ust = "not done"
-RECIPE_LATEST_VERSION_pn-lttng-ust = "0.11"
+RECIPE_LATEST_VERSION_pn-lttng-ust = "0.12"
 RECIPE_NO_OF_PATCHES_pn-lttng-ust = "0"
 RECIPE_INTEL_SECTION_pn-lttng-ust = "sdk-tools"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-ust = "12+ hours"
-RECIPE_LATEST_RELEASE_DATE_pn-lttng-ust = "Jan 14, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-ust = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-lttng-ust = "Mar 15, 2011"
 RECIPE_COMMENTS_pn-lttng-ust = ""
-RECIPE_LAST_UPDATE_pn-lttng-ust = "Jan 28, 2011"
+RECIPE_LAST_UPDATE_pn-lttng-ust = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-lttng-ust = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-lttng-control = "green"
 DISTRO_PN_ALIAS_pn-lttng-control = "OSPDT upstream=http://lttng.org/"
 RECIPE_DEPENDENCY_CHECK_pn-lttng-control = "not done"
 RECIPE_LATEST_VERSION_pn-lttng-control = "0.88-09242010"
+RECIPE_NO_UPDATE_REASON_pn-lttng-control = "0.88-09242010 has been the latest version."
 RECIPE_NO_OF_PATCHES_pn-lttng-control = "0"
 RECIPE_INTEL_SECTION_pn-lttng-control = "sdk-tools"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-control = "3 months"
@@ -2790,13 +2792,14 @@ RECIPE_MAINTAINER_pn-lttng-control = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-lttng-viewer = "green"
 DISTRO_PN_ALIAS_pn-lttng-viewer = "OSPDT upstream=http://lttng.org/"
 RECIPE_DEPENDENCY_CHECK_pn-lttng-viewer = "not done"
-RECIPE_LATEST_VERSION_pn-lttng-viewer = "0.12.36-18112010"
+RECIPE_LATEST_VERSION_pn-lttng-viewer = "0.12.38-21032011"
+RECIPE_NO_UPDATE_REASON_pn-lttng-viewer = "0.12.38-21032011 has been the latest version."
 RECIPE_NO_OF_PATCHES_pn-lttng-viewer = "0"
 RECIPE_INTEL_SECTION_pn-lttng-viewer = "sdk-tools"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-viewer = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-lttng-viewer = "Nov 18, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lttng-viewer = "1 month"
+RECIPE_LATEST_RELEASE_DATE_pn-lttng-viewer = "Mar 21, 2011"
 RECIPE_COMMENTS_pn-lttng-viewer = ""
-RECIPE_LAST_UPDATE_pn-lttng-viewer = "Jan 28, 2011"
+RECIPE_LAST_UPDATE_pn-lttng-viewer = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-lttng-viewer = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-blktrace = "red"
@@ -4340,13 +4343,13 @@ RECIPE_MAINTAINER_pn-libxext = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxfixes = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxfixes = "not done"
-RECIPE_LATEST_VERSION_pn-libxfixes = "4.0.4"
+RECIPE_LATEST_VERSION_pn-libxfixes = "5.0"
 RECIPE_NO_OF_PATCHES_pn-libxfixes = "0"
 RECIPE_INTEL_SECTION_pn-libxfixes = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxfixes = "3 years"
-RECIPE_LATEST_RELEASE_DATE_pn-libxfixes = "10/2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxfixes = "9 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libxfixes = "Mar 8, 2011"
 RECIPE_COMMENTS_pn-libxfixes = ""
-RECIPE_LAST_UPDATE_pn-libxfixes = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libxfixes = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-libxfixes = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxft = "green"
@@ -4431,14 +4434,12 @@ RECIPE_MAINTAINER_pn-xkeyboard-config = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-util-macros = "green"
 DISTRO_PN_ALIAS_pn-util-macros = "Meego=xorg-x11-util-macros Fedora=xorg-x11-util-macros Mandriva=x11-util-macros"
 RECIPE_DEPENDENCY_CHECK_pn-util-macros = "not done"
-RECIPE_LATEST_VERSION_pn-util-macros = "1.10.0"
-RECIPE_NO_OF_PATCHES_pn-util-macros = "1"
-RECIPE_PATCH_pn-util-macros+unbreak_cross_compile = "the patch isn't needed any longer since the upstream has fixed the cross-compile issue, so is removed from the recipe file"
+RECIPE_LATEST_VERSION_pn-util-macros = "1.13.0"
 RECIPE_INTEL_SECTION_pn-util-macros = "x11/utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "2 days"
-RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "06/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "17 days"
+RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "Mar 14, 2011"
 RECIPE_COMMENTS_pn-util-macros = ""
-RECIPE_LAST_UPDATE_pn-util-macros = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-util-macros = "Apr 20, 2011"
 RECIPE_MAINTAINER_pn-util-macros = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-fontconfig = "green"
-- 
1.7.2



