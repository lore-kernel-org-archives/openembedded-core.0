Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ED2AF7199A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 18:09:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2017 10:09:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="61460423"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga005.jf.intel.com with ESMTP; 06 Feb 2017 10:09:09 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 10:05:15 -0800
Message-Id: <1486404315-29353-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486404315-29353-1-git-send-email-juro.bystricky@intel.com>
References: <1486404315-29353-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] qemu.py: add 'elf' as supported fstype
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
X-List-Received-Date: Mon, 06 Feb 2017 18:09:10 -0000

Add 'elf' as also supported by OEQemuTarget.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/lib/oeqa/core/target/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 641dd6a..9d3f68c 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -9,7 +9,7 @@ import time
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
 
-supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
+supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic', 'elf']
 
 class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
-- 
2.7.4


