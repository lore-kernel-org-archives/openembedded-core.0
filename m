Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C143F78857
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 00:32:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 16:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,393,1508828400"; 
   d="scan'208";a="2042599"
Received: from swold-mobl2.jf.intel.com (HELO swold-mobl2.amr.intel.com)
	([10.254.41.228])
	by orsmga006.jf.intel.com with ESMTP; 11 Dec 2017 16:32:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 11 Dec 2017 16:32:00 -0800
Message-Id: <20171212003202.4209-3-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171212003202.4209-1-sgw@linux.intel.com>
References: <20171212003202.4209-1-sgw@linux.intel.com>
Subject: [PATCH v2 2/4] oeqa/qemu: remove elf image type
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
X-List-Received-Date: Tue, 12 Dec 2017 00:32:05 -0000

Since we are depercating the ELF image type, we should not test it
here either.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oeqa/core/target/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index d359bf9fe35..bf3b633f047 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -9,7 +9,7 @@ import time
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
 
-supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic', 'elf']
+supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
 class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
-- 
2.13.6


