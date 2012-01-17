Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b2-0006h2-03
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633034"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:26 -0800
Message-Id: <8f63338b1922b151aa46a5963eb3f8f96f67256c.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 41/62] distro_tracking: recipe upgrades and manual check info
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
X-List-Received-Date: Tue, 17 Jan 2012 08:48:19 -0000

From: Scott Garman <scott.a.garman@intel.com>

Updated info for the following recipes:

e2fsprogs
expat
chrpath
libevent
libpam

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   40 +++++++++++---------
 1 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 614d980..4d66393 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -184,12 +184,13 @@ RECIPE_MAINTAINER_pn-glib-2.0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-libpam = "green"
 DISTRO_PN_ALIAS_pn-libpam = "Meego=pam Fedora=pam OpenSuSE=pam Ubuntu=pam Mandriva=pam Debian=pam"
 RECIPE_DEPENDENCY_CHECK_pn-libpam = "not done"
-RECIPE_LATEST_VERSION_pn-libpam = "1.1.3"
+RECIPE_LATEST_VERSION_pn-libpam = "1.1.5"
 RECIPE_INTEL_SECTION_pn-libpam = "base libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpam = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libpam = "Oct 28, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpam = "unknown"
+RECIPE_LATEST_RELEASE_DATE_pn-libpam = "Oct 25, 2011"
 RECIPE_COMMENTS_pn-libpam = ""
-RECIPE_LAST_UPDATE_pn-libpam = "Nov 23, 2010"
+RECIPE_LAST_UPDATE_pn-libpam = "Jan 12, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libpam = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-libpam = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libgpg-error = "yellow" # specific .pc handle
@@ -221,10 +222,10 @@ RECIPE_LATEST_VERSION_pn-expat = "2.0.1"
 RECIPE_PATCH_pn-expat+autotools = "added in 2.0.0; 70774a74; 2006; don't include its own version of m4"
 RECIPE_INTEL_SECTION_pn-expat = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-expat = "17 months"
-RECIPE_LATEST_RELEASE_DATE_pn-expat = "Jun 01, 2007"
+RECIPE_LATEST_RELEASE_DATE_pn-expat = "Jun 5, 2007"
 RECIPE_COMMENTS_pn-expat = ""
 RECIPE_LAST_UPDATE_pn-expat = "Jul 7, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-expat = "Nov 14, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-expat = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-expat = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dbus = "green"
@@ -545,13 +546,12 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcap = "1 month"
 RECIPE_COMMENTS_pn-libcap = "Not available on kernel.org right now"
 
 RECIPE_STATUS_pn-libevent = "green"
-RECIPE_LAST_UPDATE_pn-libevent = "Jul 7, 2010"
+RECIPE_LAST_UPDATE_pn-libevent = "Jan 3, 2012"
 RECIPE_MAINTAINER_pn-libevent = "Scott Garman <scott.a.garman@intel.com>"
-RECIPE_NO_UPDATE_REASON_pn-libevent="libevent 2 is incompatible"
-RECIPE_LATEST_VERSION_pn-libevent = "2.0.11"
+RECIPE_LATEST_VERSION_pn-libevent = "2.0.16"
 RECIPE_INTEL_SECTION_pn-libevent = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-libevent = "Apr 11, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libevent = "May 24, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-libevent = "Nov 18, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libevent = "Jan 12, 2012"
 
 RECIPE_STATUS_pn-libnfsidmap = "green"
 RECIPE_LAST_UPDATE_pn-libnfsidmap = "Jan 20, 2011"
@@ -644,16 +644,16 @@ RECIPE_MAINTAINER_pn-dbus-wait= "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-e2fsprogs = "yellow" # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-e2fsprogs = "not done"
-RECIPE_LATEST_VERSION_pn-e2fsprogs = "1.41.12"
+RECIPE_LATEST_VERSION_pn-e2fsprogs = "1.42"
 RECIPE_PATCH_pn-e2fsprogs+quotefix = "to be pushed upstream"
 RECIPE_PATCH_pn-e2fsprogs+mkdir = "to be pushed upstream; no comment; MKINSTALLDIRS is not supported in new version autotool"
 RECIPE_PATCH_pn-e2fsprogs+acinclude = "to be pushed upstream;"
 RECIPE_INTEL_SECTION_pn-e2fsprogs = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "May 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "11 months"
+RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "Nov 29, 2011"
 RECIPE_COMMENTS_pn-e2fsprogs = ""
-RECIPE_LAST_UPDATE_pn-e2fsprogs = "Jun 1, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Nov 14, 2011"
+RECIPE_LAST_UPDATE_pn-e2fsprogs = "Jan 12, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-initramfs-boot = "green"
@@ -1205,8 +1205,12 @@ RECIPE_MANUAL_CHECK_DATE_pn-apt = "Nov 08, 2011"
 RECIPE_NO_UPDATE_REASON_pn-apt="similar to zypper, defer the upgrading"
 
 RECIPE_STATUS_pn-chrpath = "red"
-RECIPE_LATEST_VERSION_pn-chrpath = "0.13-2"
-RECIPE_LAST_UPDATE_pn-chrpath = "Dec 15, 2009"
+RECIPE_DEPENDENCY_CHECK_pn-chrpath = "not done"
+RECIPE_LATEST_VERSION_pn-chrpath = "0.14"
+RECIPE_LATEST_RELEASE_DATE_pn-chrpath = "Sep 27, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-chrpath = "unknown"
+RECIPE_LAST_UPDATE_pn-chrpath = "Jan 12, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-chrpath = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-chrpath = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dosfstools = "red"
-- 
1.7.6.5



