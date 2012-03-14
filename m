Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmi-0004Xg-U7
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551618"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:19 -0700
Message-Id: <65fcb8c9bd8843c891e1607e73d25d20e6857cb1.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 08/14] distro_tracking: Updates for manual checks
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   36 ++++++++++++++++----
 1 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d8cb150..ee5fac3 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -636,8 +636,8 @@ DISTRO_PN_ALIAS_pn-augeas = "Ubuntu=libaugeas0 Debian=libaugeas0"
 
 RECIPE_STATUS_pn-sat-solver = "green"
 RECIPE_DEPENDENCY_CHECK_pn-sat-solver = "done"
-RECIPE_LATEST_VERSION_pn-sat-solver = "git"
-RECIPE_MANUAL_CHECK_DATE_pn-sat-solver = "Dec 01, 2011"
+RECIPE_LATEST_VERSION_pn-sat-solver = "0.0-git1+e74e0bfd23e4e95064d08e13efb5de9caf433f40"
+RECIPE_MANUAL_CHECK_DATE_pn-sat-solver = "Mar 12, 2012"
 RECIPE_INTEL_SECTION_pn-sat-solver = "base libs"
 DISTRO_PN_ALIAS_pn-sat-solver = "OSPDT OpenSuSE=satsolver-tools"
 RECIPE_COMMENTS_pn-sat-solver = ""
@@ -1681,15 +1681,25 @@ RECIPE_LATEST_RELEASE_DATE_pn-hal-info = "Nov 01, 2009"
 RECIPE_COMMENTS_pn-hal-info = ""
 
 RECIPE_STATUS_pn-avahi = "green"
-RECIPE_LAST_UPDATE_pn-avahi = "Nov 19, 2010"
+RECIPE_LATEST_VERSION_pn-avahi = "0.6.31"
+RECIPE_LATEST_RELEASE_DATE_pn-avahi = "Oct 01, 2010"
+RECIPE_LAST_UPDATE_pn-avahi = "Mar 12, 2012"
 RECIPE_MAINTAINER_pn-avahi = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-avahi = "not done"
-RECIPE_LATEST_VERSION_pn-avahi = "0.6.28"
 RECIPE_INTEL_SECTION_pn-avahi = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-avahi = "3 month"
-RECIPE_LATEST_RELEASE_DATE_pn-avahi = "Oct 01, 2010"
 RECIPE_COMMENTS_pn-avahi = ""
 
+RECIPE_STATUS_pn-avahi-ui = "green"
+RECIPE_LATEST_VERSION_pn-avahi-ui = "0.6.31"
+RECIPE_LATEST_RELEASE_DATE_pn-avahi-ui = "Oct 01, 2010"
+RECIPE_LAST_UPDATE_pn-avahi-ui = "Mar 12, 2012"
+RECIPE_MAINTAINER_pn-avahi-ui = "Zhai Edwin <edwin.zhai@intel.com>"
+RECIPE_DEPENDENCY_CHECK_pn-avahi-ui = "not done"
+RECIPE_INTEL_SECTION_pn-avahi-ui = "base utils"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-avahi-ui = "3 month"
+RECIPE_COMMENTS_pn-avahi-ui = ""
+
 RECIPE_STATUS_pn-js = "yellow"    # may not work for platforms other than 32bit x86
 RECIPE_LAST_UPDATE_pn-js = "Jul 5, 2010"
 RECIPE_MAINTAINER_pn-js = "Saul Wold <sgw@linux.intel.com>"
@@ -3146,7 +3156,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-perl = "Nov 16, 2011"
 RECIPE_MAINTAINER_pn-perl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-prelink="green" 
-RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0x7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
+RECIPE_LATEST_VERSION_pn-prelink="1.0+git1+9552f214c7faa816fdb55b289a457f0cab034f00"
 RECIPE_LAST_UPDATE_pn-prelink = "Jan 13, 2012"
 RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Jan 13, 2012"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
@@ -4632,7 +4642,7 @@ RECIPE_INTEL_SECTION_pn-pixman = "x11/libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-pixman = "Jan 18, 2012"
 RECIPE_COMMENTS_pn-pixman = ""
-RECIPE_LAST_UPDATE_pn-pixman = "Jan 22, 2012"
+RECIPE_LAST_UPDATE_pn-pixman = "Feb 29, 2012"
 RECIPE_MAINTAINER_pn-pixman = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xtrans = "green"
@@ -6215,6 +6225,18 @@ RECIPE_MANUAL_CHECK_DATE_pn-libiconv = "Nov 22, 2011"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 RECIPE_MAINTAINER_pn-libiconv = "Saul Wold <sgw@linux.intel.com>"
 
+RECIPE_STATUS_pn-xinput = "green"
+RECIPE_LATEST_VERSION_pn-xinput = "1.14"
+RECIPE_LATEST_RELEASE_DATE_pn-xinput = "Aug 07, 2011"
+RECIPE_MAINTAINER_pn-xinput = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_NO_UPDATE_REASON_pn-xinput = "Don't Update to unstable 1.5.99.1"
+
+RECIPE_STATUS_pn-socat = "green"
+RECIPE_LATEST_VERSION_pn-socat = "2.0.0"
+RECIPE_LATEST_RELEASE_DATE_pn-socat = "Aug 07, 2011"
+RECIPE_LAST_UPDATE_pn-socat = "Mar 12, 2012"
+RECIPE_MAINTAINER_pn-socat = "Saul Wold <sgw@linux.intel.com>"
+
 RECIPE_STATUS_pn-ltp = "green"
 RECIPE_LATEST_VERSION_pn-ltp = "20110915"
 RECIPE_LATEST_RELEASE_DATE_pn-ltp = "Sep 15, 2011"
-- 
1.7.7.6



