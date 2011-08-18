Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9i6-0006xt-2a
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:01:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980395"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:56:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:49 -0700
Message-Id: <685d0329dae67c1480bab5b0b1b2033de9ed5e74.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/32] alsa-tools: update license and add distro tracking fields
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
X-List-Received-Date: Thu, 18 Aug 2011 21:01:12 -0000

From: Kang Kai <kai.kang@windriver.com>

Update license and other informations, then bump up PR.
Update distro tracking fields.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    7 ++++---
 .../recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   11 +++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f2b0701..bce4518 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5770,10 +5770,11 @@ RECIPE_COMMENTS_pn-rxvt-unicode = ""
 RECIPE_LAST_UPDATE_pn-rxvt-unicode = "May 25, 2011"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_STATUS_pn-alsa-tools = "red"
+RECIPE_STATUS_pn-alsa-tools = "green"
 RECIPE_LATEST_VERIONS_pn-alsa-tools = "1.0.24.1
-RECIPE_LAST_UPDATE_pn-alsa-tools = "Jan 31, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Jun 7, 2011" 
+RECIPE_LAST_UPDATE_pn-alsa-tools = "Jul 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Jul 28, 2011"
+RECIPE_MAINTAINER_pn-alsa-tools = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-mesa-demos = "red"
 RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
index 1bf9cd0..ed2886d 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb
@@ -1,13 +1,16 @@
 BROKEN = "1"
 
-DESCRIPTION = "Alsa Tools"
+DESCRIPTION = "Alsa Tools package contains advanced tools for certain sound cards."
+HOMEPAGE = "http://www.alsa-project.org"
+BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
 SECTION = "console/utils"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2 & LGPLv2+"
 DEPENDS = "alsa-lib ncurses"
 
-PR = "r2"
+PR = "r3"
 
-LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://ld10k1/COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
            file://autotools.patch"
-- 
1.7.6



