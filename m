Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcU-0000u0-OQ
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584262"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:46 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:40 -0700
Message-Id: <82c1a5cf8fe780376b62046dfb218bd95da6d2c5.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 13/14] syslinux: Update distro-tracking fields
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
X-List-Received-Date: Tue, 10 Apr 2012 07:36:07 -0000

From: Darren Hart <dvhart@linux.intel.com>

Add reason for not updating syslinux this release.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index caaf1bc..ce640f4 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1518,15 +1518,16 @@ RECIPE_COMMENTS_pn-bash = ""
 
 RECIPE_STATUS_pn-syslinux = "yellow"
 # need mangling on LDFLAGS
-RECIPE_LAST_UPDATE_pn-syslinux = "Nov 16, 2010"
+RECIPE_LAST_UPDATE_pn-syslinux = "Apr 4, 2012"
 RECIPE_MAINTAINER_pn-syslinux = "Darren Hart <dvhart@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-syslinux = "not done"
-RECIPE_LATEST_VERSION_pn-syslinux = "3.86"
+RECIPE_LATEST_VERSION_pn-syslinux = "4.03"
 RECIPE_PATCH_pn-syslinux+cross-build = "use poky toolchain instead of host"
 RECIPE_INTEL_SECTION_pn-syslinux = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-syslinux = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-syslinux = "Apr 01, 2010"
 RECIPE_COMMENTS_pn-syslinux = ""
+RECIPE_NO_UPDATE_REASON_pn-syslinux-"Waiting for 4.06 for 3.3 kernel headers support"
 
 RECIPE_STATUS_pn-sysvinit = "green"
 RECIPE_LAST_UPDATE_pn-sysvinit = "Jun 18, 2010"
-- 
1.7.7.6



