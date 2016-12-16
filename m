Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2926C773FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 17:13:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2016 09:13:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,358,1477983600"; d="scan'208";a="1072871967"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2016 09:13:13 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 124636A4080;
	Fri, 16 Dec 2016 09:12:24 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 19:12:45 +0200
Message-Id: <1481908365-21042-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH v2] wic: add kickstart file for MPC8315
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
X-List-Received-Date: Fri, 16 Dec 2016 17:13:12 -0000

Added kickstart file to produce partitioned image for
MPC8315 reference hardware.

[YOCTO #8719]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 scripts/lib/wic/canned-wks/mpc8315e-rdb.wks

diff --git a/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks b/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
new file mode 100644
index 0000000..af587b2
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/mpc8315e-rdb.wks
@@ -0,0 +1,6 @@
+# short-description: Create SD card image with a boot partition
+# long-description: Creates a partitioned SD card image. Boot files
+# are located in the first partition.
+
+part /boot --source bootimg-partition --ondisk sdb --fstype=ext3 --label boot
+part / --source rootfs --ondisk sdb --fstype=ext3 --label root
-- 
2.1.4


