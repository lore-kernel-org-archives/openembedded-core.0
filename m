Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RT1bH-00066Q-NZ
	for openembedded-core@openembedded.org; Wed, 23 Nov 2011 02:26:11 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 17:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="88336249"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2011 17:18:30 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 22 Nov 2011 17:18:23 -0800
Message-Id: <f93ce9ccc84b4835f15ef289cf80cf36f92bb685.1322008856.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
Subject: [PATCH 2/7] distro_tracking: update manual checks for various recipes
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
X-List-Received-Date: Wed, 23 Nov 2011 01:26:12 -0000

From: Scott Garman <scott.a.garman@intel.com>

Updating manual check dates for the following recipes: tar, libpng,
expat, dosfstools, e2fsprogs

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d0b3e83..809fe47 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -223,6 +223,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-expat = "17 months"
 RECIPE_LATEST_RELEASE_DATE_pn-expat = "Jun 01, 2007"
 RECIPE_COMMENTS_pn-expat = ""
 RECIPE_LAST_UPDATE_pn-expat = "Jul 7, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-expat = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-expat = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dbus = "green"
@@ -256,7 +257,7 @@ RECIPE_MAINTAINER_pn-neon = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpng = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpng = "not done"
-RECIPE_LATEST_VERSION_pn-libpng = "1.5.4"
+RECIPE_LATEST_VERSION_pn-libpng = "1.5.6"
 RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 and later changes the API and breaks libmatchbox. Sticking with the 1.2.x series instead"
 RECIPE_PATCH_pn-libpng+makefile = "by RP; 2008; to define ECHO explicitly for lbitool 2.2.2. need check whether it's still valide for new libtool. candidate for upstream"
 RECIPE_INTEL_SECTION_pn-libpng = "base libs"
@@ -264,6 +265,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "unknown"
 RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Jul 01, 2011"
 RECIPE_COMMENTS_pn-libpng = ""
 RECIPE_LAST_UPDATE_pn-libpng = "Jul 18, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
@@ -642,6 +644,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "May 01, 2010"
 RECIPE_COMMENTS_pn-e2fsprogs = ""
 RECIPE_LAST_UPDATE_pn-e2fsprogs = "Jun 1, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-e2fsprogs = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-e2fsprogs = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-initramfs-boot = "green"
@@ -1193,7 +1196,7 @@ RECIPE_LATEST_VERSION_pn-dosfstools = "2.11"
 RECIPE_LATEST_RELEASE_DATE_pn-dosfstools = "Mar 12, 2005"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dosfstools = "15 months"
 RECIPE_LAST_UPDATE_pn-dosfstools = "Jun 4, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-dosfstools = "Jul 12, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-dosfstools = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-dosfstools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-eee-acpi-scripts = "green"
@@ -2057,6 +2060,7 @@ RECIPE_NO_OF_PATCHES_pn-tar = "2"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tar = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-tar = "Mar 01, 2011"
 RECIPE_LAST_UPDATE_pn-tar = "Jun 5, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tar = "Nov 14, 2011"
 RECIPE_MAINTAINER_pn-tar = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-lrzsz="yellow" # patch investigation needed.
-- 
1.7.5.4



