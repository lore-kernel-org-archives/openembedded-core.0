Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rlqgn-0003oW-UI
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jan 2012 00:37:42 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0AE8A2FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 18:30:04 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 15:29:51 -0800
Message-Id: <6e355b649dab29ebf77c5b6132a4d207c04acb1a.1326480099.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326480099.git.scott.a.garman@intel.com>
References: <cover.1326480099.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1326480099.git.scott.a.garman@intel.com>
References: <cover.1326480099.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0AE8A2FF80.A4B6C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/3] distro_tracking: recipe upgrades and manual check info
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
X-List-Received-Date: Fri, 13 Jan 2012 23:37:42 -0000

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
index 14eff32..812c46b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -183,12 +183,13 @@ RECIPE_MAINTAINER_pn-glib-2.0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
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
@@ -220,10 +221,10 @@ RECIPE_LATEST_VERSION_pn-expat = "2.0.1"
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
@@ -544,13 +545,12 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcap = "1 month"
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
@@ -643,16 +643,16 @@ RECIPE_MAINTAINER_pn-dbus-wait= "Zhai Edwin <edwin.zhai@intel.com>"
 
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
@@ -1204,8 +1204,12 @@ RECIPE_MANUAL_CHECK_DATE_pn-apt = "Nov 08, 2011"
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
1.7.5.4



