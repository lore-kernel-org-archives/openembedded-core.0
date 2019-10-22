Return-Path: <chee.yang.lee@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 93A4B7CE21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 05:27:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Oct 2019 22:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="209560951"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 21 Oct 2019 22:27:07 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 13:27:06 +0800
Message-Id: <1571722026-74661-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571722026-74661-1-git-send-email-chee.yang.lee@intel.com>
References: <1571722026-74661-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 2/2] wic/engine: use 'linux-swap' for swap file system
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
X-List-Received-Date: Tue, 22 Oct 2019 05:27:07 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

[YOCTO #13312]
see https://bugzilla.yoctoproject.org/show_bug.cgi?id=13312

wic/engine.Disk._get_part_image was looking at variable fstypes for
supported fstype which is 'swap' but image build with 'linux-swap'.
supported fstype should be 'linux-swap'.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 scripts/lib/wic/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 61939ad1..18776fa 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -541,7 +541,7 @@ def wic_write(args, native_sysroot):
     """
     Write image to a target device.
     """
-    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'swap'))
+    disk = Disk(args.image, native_sysroot, ('fat', 'ext', 'linux-swap'))
     disk.write(args.target, args.expand)
 
 def find_canned(scripts_path, file_name):
-- 
2.7.4


