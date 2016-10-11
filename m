Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CF5366FF5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 16:32:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Oct 2016 09:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,329,1473145200"; d="scan'208";a="888954062"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 11 Oct 2016 09:32:30 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 09:31:32 -0700
Message-Id: <1476203492-34253-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] kernel-arch.bbclass: Add xtensa and arc into valid_archs table
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
X-List-Received-Date: Tue, 11 Oct 2016 16:32:29 -0000

Both "arc" and "xtensa" are valid Linux architectures, add
them into valid_archs table.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 8a4bef1..ea976c6 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -14,7 +14,7 @@ valid_archs = "alpha cris ia64 \
                parisc s390  v850 \
                avr32 blackfin \
                microblaze \
-               nios2"
+               nios2 arc xtensa"
 
 def map_kernel_arch(a, d):
     import re
-- 
2.7.4


