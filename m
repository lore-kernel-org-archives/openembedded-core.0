Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8GHW-00032W-Uo
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:24:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 12:15:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121397468"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 12:15:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 12:15:18 -0700
Message-Id: <c7abbaf6b73191f5580826aac5edbbc1eb0823fa.1331837170.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
Subject: [PATCH 06/11] watchdog: Fix License warning
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
X-List-Received-Date: Thu, 15 Mar 2012 19:24:15 -0000

WARNING: watchdog: No generic license file exists for: GPL in any provider
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/watchdog/watchdog_5.11.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.11.bb b/meta/recipes-extended/watchdog/watchdog_5.11.bb
index 0b88c1f..3c4f77b 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.11.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.11.bb
@@ -5,7 +5,7 @@ it will reboot the system."
 HOMEPAGE = "http://watchdog.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
 
-LICENSE = "GPLv1+"
+LICENSE = "GPL-1.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a7258c60a71a2f04b67fb01f495889c"
 
 PR = "r0"
-- 
1.7.7.6



