Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2E64660234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 15:29:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 Sep 2016 08:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,374,1470726000"; d="scan'208";a="764132063"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2016 08:29:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 41C176A4080;
	Wed, 21 Sep 2016 08:28:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2016 18:18:12 +0300
Message-Id: <1474471092-4321-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: add beaglebone.wks
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
X-List-Received-Date: Wed, 21 Sep 2016 15:29:07 -0000

Added wks to make an image for Beaglebone board.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/canned-wks/beaglebone.wks | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 scripts/lib/wic/canned-wks/beaglebone.wks

diff --git a/scripts/lib/wic/canned-wks/beaglebone.wks b/scripts/lib/wic/canned-wks/beaglebone.wks
new file mode 100644
index 0000000..753418e
--- /dev/null
+++ b/scripts/lib/wic/canned-wks/beaglebone.wks
@@ -0,0 +1,7 @@
+# short-description: Create Beaglebone disk image
+# long-description: Creates a partitioned disk image for Beaglebone board
+# which can be directly copied to SD card.
+
+part /boot --ondisk mmcblk0 --label boot --fstype vfat --source bootimg-partition --align 1024 --active
+part /     --ondisk mmcblk0 --label root --fstype ext4 --source rootfs --align 1024
+
-- 
2.1.4


