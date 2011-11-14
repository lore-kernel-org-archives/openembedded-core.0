Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RQ6FP-0005bO-PS
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 00:47:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2011 15:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="75483398"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.81])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2011 15:41:09 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Nov 2011 15:41:07 -0800
Message-Id: <94120a3b641486ec6c9a2af720767ce77ed8c041.1321313978.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321313978.git.scott.a.garman@intel.com>
References: <cover.1321313978.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1321313978.git.scott.a.garman@intel.com>
References: <cover.1321313978.git.scott.a.garman@intel.com>
Subject: [PATCH 1/1] distro_tracking: update manual checks for various recipes
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
X-List-Received-Date: Mon, 14 Nov 2011 23:47:32 -0000

Updating manual check dates for the following recipes: tar, libpng,
expat, dosfstools, e2fsprogs

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5cd4c37..87bf5a8 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -222,6 +222,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-expat = "17 months"
 RECIPE_LATEST_RELEASE_DATE_pn-expat = "Jun 01, 2007"
 RECIPE_COMMENTS_pn-expat = ""
 RECIPE_LAST_UPDATE_pn-expat = "Jul 7, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-expat = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-expat = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dbus = "green"
@@ -255,7 +256,7 @@ RECIPE_MAINTAINER_pn-neon = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpng = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpng = "not done"
-RECIPE_LATEST_VERSION_pn-libpng = "1.5.4"
+RECIPE_LATEST_VERSION_pn-libpng = "1.5.6"
 RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 and later changes the API and breaks libmatchbox. Sticking with the 1.2.x series instead"
 RECIPE_PATCH_pn-libpng+makefile = "by RP; 2008; to define ECHO explicitly for lbitool 2.2.2. need check whether it's still valide for new libtool. candidate for upstream"
 RECIPE_INTEL_SECTION_pn-libpng = "base libs"
@@ -263,6 +264,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "unknown"
 RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Jul 01, 2011"
 RECIPE_COMMENTS_pn-libpng = ""
 RECIPE_LAST_UPDATE_pn-libpng = "Jul 18, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
@@ -639,6 +641,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "May 01, 2010"
 RECIPE_COMMENTS_pn-e2fsprogs = ""
 RECIPE_LAST_UPDATE_pn-e2fsprogs = "Jun 1, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-initramfs-boot = "green"
@@ -1190,7 +1193,7 @@ RECIPE_LATEST_VERSION_pn-dosfstools = "2.11"
 RECIPE_LATEST_RELEASE_DATE_pn-dosfstools = "Mar 12, 2005"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dosfstools = "15 months"
 RECIPE_LAST_UPDATE_pn-dosfstools = "Jun 4, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-dosfstools = "Jul 12, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-dosfstools = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-dosfstools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-eee-acpi-scripts = "green"
@@ -2052,6 +2055,7 @@ RECIPE_NO_OF_PATCHES_pn-tar = "2"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tar = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-tar = "Mar 01, 2011"
 RECIPE_LAST_UPDATE_pn-tar = "Jun 5, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tar = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-tar = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-lrzsz="yellow" # patch investigation needed.
-- 
1.7.5.4



