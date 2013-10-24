Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 690216D3A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 13:11:43 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Oct 2013 06:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="312145546"
Received: from unknown (HELO localhost) ([10.255.14.253])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Oct 2013 06:11:44 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 08:11:42 -0500
Message-Id: <afa3e31d527432bf9ff8473d51528d9e204465ed.1382620128.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1382620128.git.tom.zanussi@linux.intel.com>
References: <cover.1382620128.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] wic: Remove selinux_check()
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
X-List-Received-Date: Thu, 24 Oct 2013 13:11:43 -0000

This seems to be an obsolete checkt - we don't have any problems with
image creation under selinux, so remove this check.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/conf.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/mic/conf.py b/scripts/lib/mic/conf.py
index 58fad51..b850d80 100644
--- a/scripts/lib/mic/conf.py
+++ b/scripts/lib/mic/conf.py
@@ -186,10 +186,6 @@ class ConfigMgr(object):
                                               self.create['name_prefix'],
                                               self.create['name_suffix'])
 
-        # check selinux, it will block arm and btrfs image creation
-        misc.selinux_check(self.create['arch'],
-                           [p.fstype for p in ks.handler.partition.partitions])
-
     def set_runtime(self, runtime):
         if runtime not in ("bootstrap", "native"):
             msger.error("Invalid runtime mode: %s" % runtime)
-- 
1.8.3.1


