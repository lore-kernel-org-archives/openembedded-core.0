Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA7561118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:49:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2013 07:46:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,944,1371106800"; d="scan'208";a="406452264"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2013 07:49:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 15:49:22 +0100
Message-Id: <1379688562-29529-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] avahi: bump INC_PR to avoid do_configure failure in existing workdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Sep 2013 14:49:24 -0000

When we split S and B for avahi in OE-Core commit
6112a07f4e9865f7ae0e5a953669c1adf789f9f0, files left over in the workdir
from a previous build seem to break re-execution of do_configure. Bump
PR to give a fresh workdir and avoid this problem.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 6495ee9..cf063db 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
-- 
1.8.1.2


