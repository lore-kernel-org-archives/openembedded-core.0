Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8GHW-00032X-2a
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:24:14 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 12:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121397456"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 12:15:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 12:15:16 -0700
Message-Id: <ad9b873774938e21036f367cfaa1a4e1a9bda717.1331837170.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
Subject: [PATCH 04/11] usbinit: Fix License warning
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
X-List-Received-Date: Thu, 15 Mar 2012 19:24:14 -0000

WARNING: usbinit: No generic license file exists for: GPL in any provider
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/usbinit/usbinit.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/usbinit/usbinit.bb b/meta/recipes-bsp/usbinit/usbinit.bb
index 3ec2329..e2a036e 100644
--- a/meta/recipes-bsp/usbinit/usbinit.bb
+++ b/meta/recipes-bsp/usbinit/usbinit.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Initscript to manage gadget Ethernet"
 
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PR = "r2"
-- 
1.7.7.6



