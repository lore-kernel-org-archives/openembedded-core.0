Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHyGe-00043D-3k
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:11:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2012 07:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="131194273"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2012 07:02:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 07:02:03 -0700
Message-Id: <1334152923-17424-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] distro-tracking: Fix syslinux NO_UPDATE_REASON
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
X-List-Received-Date: Wed, 11 Apr 2012 14:11:28 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ce640f4..5676b1a 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1527,7 +1527,7 @@ RECIPE_INTEL_SECTION_pn-syslinux = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-syslinux = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-syslinux = "Apr 01, 2010"
 RECIPE_COMMENTS_pn-syslinux = ""
-RECIPE_NO_UPDATE_REASON_pn-syslinux-"Waiting for 4.06 for 3.3 kernel headers support"
+RECIPE_NO_UPDATE_REASON_pn-syslinux="Waiting for 4.06 for 3.3 kernel headers support"
 
 RECIPE_STATUS_pn-sysvinit = "green"
 RECIPE_LAST_UPDATE_pn-sysvinit = "Jun 18, 2010"
-- 
1.7.7.6



