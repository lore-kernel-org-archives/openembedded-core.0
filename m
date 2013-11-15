Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E151A6D1D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 11:58:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Nov 2013 03:55:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435767846"
Received: from paulonei-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.149])
	by orsmga002.jf.intel.com with ESMTP; 15 Nov 2013 03:58:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 11:58:39 +0000
Message-Id: <1384516719-17939-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] ia32-base.inc: remove eee-acpi-scripts from MACHINE_EXTRA_RRECOMMENDS
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
X-List-Received-Date: Fri, 15 Nov 2013 11:58:49 -0000

We shouldn't bring this in unconditionally for all ia32 machines.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/machine/include/ia32-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index e58a314..8a20bca 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -8,7 +8,7 @@
 MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
                      acpi serial usbgadget alsa"
 
-MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
+MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
 
 IMAGE_FSTYPES += "ext3 cpio.gz live"
 
-- 
1.8.1.2


