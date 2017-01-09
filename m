Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 65EEB62133
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 21:24:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 09 Jan 2017 13:24:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,341,1477983600"; d="scan'208";a="1081064592"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2017 13:24:11 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3A77C6A4080;
	Mon,  9 Jan 2017 13:23:17 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 23:01:46 +0200
Message-Id: <1483995706-20293-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] canned-wks: remove mpc8315e-rdb.wks
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
X-List-Received-Date: Mon, 09 Jan 2017 21:24:11 -0000

This file has been moved to meta-yocto-bsp/wic/

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks

diff --git a/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks b/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
deleted file mode 100644
index af587b2..0000000
--- a/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
+++ /dev/null
@@ -1,6 +0,0 @@
-# short-description: Create SD card image with a boot partition
-# long-description: Creates a partitioned SD card image. Boot files
-# are located in the first partition.
-
-part /boot --source bootimg-partition --ondisk sdb --fstype=ext3 --label boot
-part / --source rootfs --ondisk sdb --fstype=ext3 --label root
-- 
2.1.4


