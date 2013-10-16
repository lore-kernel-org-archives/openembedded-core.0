Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5EC6CCA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:14:33 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Oct 2013 22:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,505,1378882800"; d="scan'208";a="308360108"
Received: from unknown (HELO localhost) ([10.255.15.157])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Oct 2013 22:14:35 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 00:14:31 -0500
Message-Id: <3e3f7120140dc606369f19fbfca3e222db06274d.1381898855.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <7df25a781aad32cb4f7deaa1c4af839e8dc604a2.1381898855.git.tom.zanussi@linux.intel.com>
References: <7df25a781aad32cb4f7deaa1c4af839e8dc604a2.1381898855.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1381898855.git.tom.zanussi@linux.intel.com>
References: <cover.1381898855.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/3] wic: add fakeroot to the populate-extfs step
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
X-List-Received-Date: Wed, 16 Oct 2013 05:14:33 -0000

Without this, files in the generated filesystem pick up the wrong
ownership.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 302cace..309abee 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -216,7 +216,7 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare content for an ext2/3/4 rootfs partition.
         """
-        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
+        populate_script = "fakeroot %s/usr/bin/populate-extfs.sh" % native_sysroot
         image_extra_space = 10240
 
         image_rootfs = rootfs_dir
-- 
1.7.11.4


