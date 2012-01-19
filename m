Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rnync-0002pt-7V
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:41:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2012 12:33:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="98431994"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2012 12:33:49 -0800
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 12:33:47 -0800
Message-Id: <c09efcc5bfb89318462dd6955d8983fc6c704570.1327005173.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1327005173.git.scott.a.garman@intel.com>
References: <cover.1327005173.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1327005173.git.scott.a.garman@intel.com>
References: <cover.1327005173.git.scott.a.garman@intel.com>
Subject: [PATCH 1/1] distro_tracking: update libpng, libgdbus, opensp, nfs-utils manual check dates
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
X-List-Received-Date: Thu, 19 Jan 2012 20:41:32 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 90924ed..b7af42c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -282,7 +282,7 @@ RECIPE_MAINTAINER_pn-neon = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpng = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libpng = "not done"
-RECIPE_LATEST_VERSION_pn-libpng = "1.5.6"
+RECIPE_LATEST_VERSION_pn-libpng = "1.5.7"
 RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 and later changes the API and breaks libmatchbox. Sticking with the 1.2.x series instead"
 RECIPE_PATCH_pn-libpng+makefile = "by RP; 2008; to define ECHO explicitly for lbitool 2.2.2. need check whether it's still valide for new libtool. candidate for upstream"
 RECIPE_INTEL_SECTION_pn-libpng = "base libs"
@@ -290,7 +290,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "unknown"
 RECIPE_LATEST_RELEASE_DATE_pn-libpng = "Jul 01, 2011"
 RECIPE_COMMENTS_pn-libpng = ""
 RECIPE_LAST_UPDATE_pn-libpng = "Jul 18, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Nov 14, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Jan 19, 2012"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
@@ -1205,8 +1205,10 @@ RECIPE_NO_OF_PATCHES_pn-libgdbus = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-libgdbus = "Sep 01, 2008"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgdbus = "unknown"
 RECIPE_LAST_UPDATE_pn-libgdbus = "Jan 4, 2011"
-RECIPE_MAINTAINER_pn-libgdbus = "Scott Garman <scott.a.garman@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-libgdbus = "Jan 19, 2012"
 DISTRO_PN_ALIAS_pn-libgdbus = "Intel"
+RECIPE_MAINTAINER_pn-libgdbus = "Scott Garman <scott.a.garman@intel.com>"
+
 
 RECIPE_STATUS_pn-apr = "green"
 RECIPE_LATEST_VERSION_pn-apr = "1.4.5"
@@ -1632,15 +1634,15 @@ RECIPE_COMMENTS_pn-rsync = ""
 
 RECIPE_STATUS_pn-nfs-utils = "yellow"   # no auto stage
 RECIPE_LAST_UPDATE_pn-nfs-utils = "Nov 9, 2010"
-RECIPE_MAINTAINER_pn-nfs-utils = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-nfs-utils = "done"  # still missing libwrap, libgss, libtirpc
-RECIPE_LATEST_VERSION_pn-nfs-utils = "1.2.3"
+RECIPE_LATEST_VERSION_pn-nfs-utils = "1.2.5"
 RECIPE_PATCH_pn-nfs-utils+nfs-utils-1.0.6-uclibc.patch = "uclibc missing some functions"
 RECIPE_PATCH_pn-nfs-utils+nfsserver = "init script"
 RECIPE_INTEL_SECTION_pn-nfs-utils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-nfs-utils = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-nfs-utils = "Feb 01, 2010"
-RECIPE_COMMENTS_pn-nfs-utils = ""
+RECIPE_MANUAL_CHECK_DATE_pn-nfs-utils = "Jan 19, 2012"
+RECIPE_MAINTAINER_pn-nfs-utils = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dropbear = "green"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
@@ -5995,12 +5997,13 @@ DISTRO_PN_ALIAS_pn-sgmlspl = "Debian=sgmlspl Ubuntu=sgmlspl"
 
 RECIPE_STATUS_pn-opensp = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opensp = "not done"
-RECIPE_LATEST_VERSION_pn-opensp = ""
+RECIPE_LATEST_VERSION_pn-opensp = "1.5.2"
 RECIPE_NO_OF_PATCHES_pn-opensp = "4"
-RECIPE_LATEST_RELEASE_DATE_pn-opensp = "Nov 24, 2002"
+RECIPE_LATEST_RELEASE_DATE_pn-opensp = "Dec 23, 2005"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opensp = "2 years"
 RECIPE_COMMENTS_pn-opensp = ""
 RECIPE_LAST_UPDATE_pn-opensp = "Jan 26, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-opensp = "Jan 19, 2012"
 RECIPE_MAINTAINER_pn-opensp = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-openjade = "green"
-- 
1.7.5.4



