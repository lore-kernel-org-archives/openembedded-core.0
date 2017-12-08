Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 11609786B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 15:48:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Dec 2017 07:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,378,1508828400"; d="scan'208";a="10817146"
Received: from swold-mobl2.jf.intel.com ([10.24.10.24])
	by fmsmga004.fm.intel.com with ESMTP; 08 Dec 2017 07:49:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri,  8 Dec 2017 07:48:59 -0800
Message-Id: <20171208154859.15927-4-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208154859.15927-1-sgw@linux.intel.com>
References: <20171208154859.15927-1-sgw@linux.intel.com>
Subject: [PATCH 3/3] oeqa/qemu: remove elf image type
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
X-List-Received-Date: Fri, 08 Dec 2017 15:48:59 -0000

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


