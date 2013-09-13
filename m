Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E886E615F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 06:42:56 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2013 23:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,896,1371106800"; d="scan'208";a="294373585"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.78])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2013 23:42:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 23:42:54 -0700
Message-Id: <1379054574-8526-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: bjorn.arnelid@xdin.com
Subject: [PATCH] qemu.inc: Fix typo for KERNEL_FEATURES
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
X-List-Received-Date: Fri, 13 Sep 2013 06:42:57 -0000

Thans to Bjorn Arnelid for finding this

Cc: bjorn.arnelid@xdin.com

[YOCTO #5173]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index a78622d..8557777 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -26,4 +26,4 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
 
 # Provide the nfs server kernel module for all qemu images
-KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
+KERNEL_FEATURES_append_pn_linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
1.8.3.1


