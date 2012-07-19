Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SrqkY-00057X-25
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 15:26:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Jul 2012 06:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170371555"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 19 Jul 2012 06:15:13 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 16:22:47 +0300
Message-Id: <1342704167-16196-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Upadate upstream_tracking.inc
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
X-List-Received-Date: Thu, 19 Jul 2012 13:26:38 -0000

Added new info for tinylogin.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../conf/distro/include/upstream_tracking.inc      |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index e795895..98e7d16 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -941,8 +941,9 @@ CHECK_DATE_pn-tiff = "Feb 27, 2012"
 RECIPE_UPSTREAM_VERSION_pn-time = "1.7"
 RECIPE_UPSTREAM_DATE_pn-time = "Jul 01, 1996"
 RECIPE_UPSTREAM_VERSION_pn-tinylogin = "1.4"
-CHECK_DATE_pn-tinylogin = "Dec 24, 2011"
+CHECK_DATE_pn-tinylogin = "Jul 19, 2012"
 RECIPE_UPSTREAM_DATE_pn-tinylogin = "Jan 03, 2003"
+RECIPE_NO_UPDATE_REASON_pn-tinylogin = "TinyLogin was merged into BusyBox."
 RECIPE_UPSTREAM_DATE_pn-trace-cmd = "Nov 7, 2011"
 RECIPE_UPSTREAM_VERSION_pn-transfig = "3.2.5d"
 RECIPE_UPSTREAM_DATE_pn-transfig = "Jul 23, 2010"
-- 
1.7.9.5



