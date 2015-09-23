Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDAC76E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 10:05:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Sep 2015 03:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="795471368"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.4.127])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2015 03:05:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:05:25 +0100
Message-Id: <8d0f09cb54ad2ecff7a303ea06fde698a27ca930.1443002672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443002672.git.paul.eggleton@linux.intel.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1443002672.git.paul.eggleton@linux.intel.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 3/3] devtool: upgrade: use shutil.move instead of os.rename
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
X-List-Received-Date: Wed, 23 Sep 2015 10:05:49 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Rename fails over filesystem boundaries.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index aa53c8e..4f850cf 100644
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
2.1.0


