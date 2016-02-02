Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F3C287715A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 17:43:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 02 Feb 2016 09:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="904045783"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 09:43:31 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 221DC6A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:31:23 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 17:32:47 +0200
Message-Id: <b023768e569e2ce7429db95794102315fb3369d3.1454426922.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1454426922.git.ed.bartosh@linux.intel.com>
References: <cover.1454426922.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 07/14] oeqa/targetcontrol: support wic image type
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
X-List-Received-Date: Tue, 02 Feb 2016 17:43:34 -0000

Added 'wic' to the list image types supported by targetcontrol.

This is a preparation for booting and testing wic images
with oe-selftest.

[YOCTO #8498]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index f461651..5422a61 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -113,7 +113,7 @@ class BaseTarget(object):
 
 class QemuTarget(BaseTarget):
 
-    supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz']
+    supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
     def __init__(self, d):
 
-- 
2.1.4


