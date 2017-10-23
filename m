Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7632F7197E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 23:59:24 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2017 16:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,424,1503385200"; d="scan'208";a="166669658"
Received: from swold-mobl2.jf.intel.com ([10.24.11.5])
	by fmsmga006.fm.intel.com with ESMTP; 23 Oct 2017 16:59:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 23 Oct 2017 16:59:24 -0700
Message-Id: <20171023235925.26745-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH 1/2] wic: misc.py: Added more mtools binaries
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
X-List-Received-Date: Mon, 23 Oct 2017 23:59:24 -0000

This fixes the issue that if you don't have mtools installed on the host
thus causing host contamination, that the correct binaries would be selected
from the native sysroot.

[YOCTO #12173]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/lib/wic/misc.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 0792480f869..cc28c95fda5 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -43,6 +43,9 @@ NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "grub-mkimage": "grub-efi",
                   "isohybrid": "syslinux",
                   "mcopy": "mtools",
+                  "mdel" : "mtools",
+                  "mdeltree" : "mtools",
+                  "mdir" : "mtools",
                   "mkdosfs": "dosfstools",
                   "mkisofs": "cdrtools",
                   "mkfs.btrfs": "btrfs-tools",
-- 
2.13.5


