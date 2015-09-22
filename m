Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DCCA173243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:24:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 22 Sep 2015 04:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,572,1437462000"; d="scan'208";a="794683013"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2015 04:24:05 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 14:24:04 +0300
Message-Id: <1442921044-20967-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH] devtool: upgrade: use shutil.move instead of os.rename
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
X-List-Received-Date: Tue, 22 Sep 2015 11:24:07 -0000

Rename fails over filesystem boundaries.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index e74e795..18e010c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -53,7 +53,7 @@ def _copy_source_code(orig, dest):
         dest_dir = os.path.join(dest, os.path.dirname(path))
         bb.utils.mkdirhier(dest_dir)
         dest_path = os.path.join(dest, path)
-        os.rename(os.path.join(orig, path), dest_path)
+        shutil.move(os.path.join(orig, path), dest_path)
 
 def _get_checksums(rf):
     import re
-- 
2.1.4


