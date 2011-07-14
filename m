Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QhUTU-0007Z8-BA
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 00:33:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jul 2011 15:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,531,1304319600"; d="scan'208";a="30467045"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2011 15:29:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2011 15:21:23 -0700
Message-Id: <30c98e974bb7d8849ffc8db63c6b4d432d43ffaf.1310681919.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310681919.git.sgw@linux.intel.com>
References: <cover.1310681919.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310681919.git.sgw@linux.intel.com>
References: <cover.1310681919.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] distro tracking: Updates
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
X-List-Received-Date: Thu, 14 Jul 2011 22:33:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   21 ++++++++++++-------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index efb4c0b..48b4cf3 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -562,7 +562,9 @@ RECIPE_LATEST_VERSION_pn-tcp-wrappers = "7.6"
 RECIPE_INTEL_SECTION_pn-tcp-wrappers = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcp-wrappers = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-tcp-wrappers = "n/a"
-RECIPE_COMMENTS_pn-tcp-wrappers = ""
+RECIPE_MANUAL_CHECK_DATE_pn-tcp-wrappers = "Jul 12, 2011"
+RECIPE_COMMENTS_pn-tcp-wrappers = "Consider looking at ipv6.4 version"
+RECIPE_NO_UPDATE_REASON_pn-tcp-wrapers = "7.6 is last Stable release"
 
 RECIPE_STATUS_pn-libaio = "green"
 RECIPE_LAST_UPDATE_pn-libaio = "Aug 27, 2010"
@@ -1529,16 +1531,17 @@ RECIPE_LATEST_RELEASE_DATE_pn-findutils = "06/2009"
 RECIPE_COMMENTS_pn-findutils = ""
 
 RECIPE_STATUS_pn-file = "green"
-RECIPE_LAST_UPDATE_pn-file = "Jul 6, 2010"
+RECIPE_LAST_UPDATE_pn-file = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-file = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-file = "done"
-RECIPE_LATEST_VERSION_pn-file = "5.04"
+RECIPE_LATEST_VERSION_pn-file = "5.07"
 RECIPE_PATCH_pn-file+dump = "some new magic data"
 RECIPE_PATCH_pn-file+filesystems = "some other new magic data"
 RECIPE_INTEL_SECTION_pn-file = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-file = "8 months"
-RECIPE_LATEST_RELEASE_DATE_pn-file = "01/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-file = "1-3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-file = "05/2011"
 RECIPE_COMMENTS_pn-file = "2-clause BSD"
+RECIPE_MANUAL_CHECK_DATE_pn-file = "Jul 12, 2011"
 
 RECIPE_STATUS_pn-rsync = "green"
 RECIPE_LAST_UPDATE_pn-rsync = "Jul 6, 2010"
@@ -1872,7 +1875,8 @@ RECIPE_LATEST_VERSION_pn-zaurusd = "0.0+svnr426"
 DISTRO_PN_ALIAS_pn-zaurusd = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-zaurusd = "Jan 20, 2011"
 RECIPE_MAINTAINER_pn-zaurusd = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-zaurusd = "Jul 12, 2011"
+RECIPE_NO_UPDATE_REASON_pn-zaurusd = "SVN rev 426 is last Stable release"
 
 RECIPE_STATUS_pn-yaffs2-utils = "red"
 RECIPE_LATEST_VERSION_pn-yaffs2-utils = "HEAD"
@@ -1892,9 +1896,10 @@ RECIPE_MAINTAINER_pn-ubootchart = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-ubootchart = "OSPDT upstream=http://code.google.com/p/ubootchart"
 
 RECIPE_STATUS_pn-tiff = "red"
-RECIPE_LATEST_VERSION_pn-tiff = "3.9.4"
-RECIPE_LAST_UPDATE_pn-tiff = "Aug 25, 2008"
+RECIPE_LATEST_VERSION_pn-tiff = "3.9.5"
+RECIPE_LAST_UPDATE_pn-tiff = "Jul 12, 2011"
 RECIPE_MAINTAINER_pn-tiff = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-tiff = "Jul 12, 2011"
 
 RECIPE_STATUS_pn-libexif = "red"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.19"
-- 
1.7.3.4



