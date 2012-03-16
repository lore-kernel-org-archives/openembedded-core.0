Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S8a0x-0000cK-Gx
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:28:27 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CF9842FF5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 12:19:35 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 09:19:40 -0700
Message-Id: <08f07a7e59d7568f7588574b17a71d9852d1ef89.1331914572.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331914572.git.scott.a.garman@intel.com>
References: <cover.1331914572.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331914572.git.scott.a.garman@intel.com>
References: <cover.1331914572.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CF9842FF5F.B4843
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/2] distro_tracking: updates for upgraded recipes and manual checks
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
X-List-Received-Date: Fri, 16 Mar 2012 16:28:27 -0000

Updates for upgraded recipes e2fsprogs and ...?

Manual checks done for libpng, libgdbus, expat, chrpath, opensp,
and nfs-utils.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 8ad924b..252c027 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -249,7 +249,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-expat = "17 months"
 RECIPE_LATEST_RELEASE_DATE_pn-expat = "Jun 5, 2007"
 RECIPE_COMMENTS_pn-expat = ""
 RECIPE_LAST_UPDATE_pn-expat = "Jul 7, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-expat = "Jan 12, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-expat = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-expat = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dbus = "green"
@@ -285,15 +285,15 @@ RECIPE_MAINTAINER_pn-neon = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpng = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpng = "not done"
-RECIPE_LATEST_VERSION_pn-libpng = "1.5.7"
+RECIPE_LATEST_VERSION_pn-libpng = "1.5.9"
 RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 and later changes the API and breaks libmatchbox. Sticking with the 1.2.x series instead"
 RECIPE_PATCH_pn-libpng+makefile = "by RP; 2008; to define ECHO explicitly for lbitool 2.2.2. need check whether it's still valide for new libtool. candidate for upstream"
 RECIPE_INTEL_SECTION_pn-libpng = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "unknown"
-RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Jul 01, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Mar 08, 2012"
 RECIPE_COMMENTS_pn-libpng = ""
 RECIPE_LAST_UPDATE_pn-libpng = "Jul 18, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Jan 19, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
@@ -678,16 +678,16 @@ RECIPE_MAINTAINER_pn-dbus-wait= "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-e2fsprogs = "yellow" 
 # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-e2fsprogs = "not done"
-RECIPE_LATEST_VERSION_pn-e2fsprogs = "1.42"
+RECIPE_LATEST_VERSION_pn-e2fsprogs = "1.42.1"
 RECIPE_PATCH_pn-e2fsprogs+quotefix = "to be pushed upstream"
 RECIPE_PATCH_pn-e2fsprogs+mkdir = "to be pushed upstream; no comment; MKINSTALLDIRS is not supported in new version autotool"
 RECIPE_PATCH_pn-e2fsprogs+acinclude = "to be pushed upstream;"
 RECIPE_INTEL_SECTION_pn-e2fsprogs = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "11 months"
-RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "Nov 29, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "Feb 17, 2012"
 RECIPE_COMMENTS_pn-e2fsprogs = ""
-RECIPE_LAST_UPDATE_pn-e2fsprogs = "Jan 12, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Jan 12, 2012"
+RECIPE_LAST_UPDATE_pn-e2fsprogs = "Mar 15, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-initramfs-boot = "green"
@@ -1217,7 +1217,7 @@ RECIPE_NO_OF_PATCHES_pn-libgdbus = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-libgdbus = "Sep 01, 2008"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgdbus = "unknown"
 RECIPE_LAST_UPDATE_pn-libgdbus = "Jan 4, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libgdbus = "Jan 19, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libgdbus = "Mar 15, 2012"
 DISTRO_PN_ALIAS_pn-libgdbus = "Intel"
 RECIPE_MAINTAINER_pn-libgdbus = "Scott Garman <scott.a.garman@intel.com>"
 
@@ -1245,7 +1245,7 @@ RECIPE_LATEST_VERSION_pn-chrpath = "0.14"
 RECIPE_LATEST_RELEASE_DATE_pn-chrpath = "Sep 27, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-chrpath = "unknown"
 RECIPE_LAST_UPDATE_pn-chrpath = "Jan 12, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-chrpath = "Jan 12, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-chrpath = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-chrpath = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dosfstools = "red"
@@ -1658,7 +1658,7 @@ RECIPE_PATCH_pn-nfs-utils+nfsserver = "init script"
 RECIPE_INTEL_SECTION_pn-nfs-utils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-nfs-utils = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-nfs-utils = "Feb 01, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-nfs-utils = "Jan 19, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-nfs-utils = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-nfs-utils = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dropbear = "green"
@@ -6133,7 +6133,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-opensp = "Dec 23, 2005"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opensp = "2 years"
 RECIPE_COMMENTS_pn-opensp = ""
 RECIPE_LAST_UPDATE_pn-opensp = "Jan 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-opensp = "Jan 19, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-opensp = "Mar 15, 2012"
 RECIPE_MAINTAINER_pn-opensp = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-openjade = "green"
-- 
1.7.5.4



