Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B854E71AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 00:14:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 20 Jun 2017 17:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,366,1493708400"; d="scan'208";a="983285193"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 20 Jun 2017 17:14:20 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 17:14:19 -0700
Message-Id: <1498004059-12231-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] x86-base.inc: Don't add live to IMAGE_FSTYPES, default instead
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
X-List-Received-Date: Wed, 21 Jun 2017 00:14:19 -0000

Using += makes it difficult to remove. Soft-set with ?= instead.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 7365953..bfacdf5 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -10,7 +10,7 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
 
-IMAGE_FSTYPES += "live"
+IMAGE_FSTYPES ?= "live"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 
-- 
2.5.5


