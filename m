Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E75172D6C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:55:07 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 03:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="518910008"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by orsmga003.jf.intel.com with ESMTP; 28 Jan 2015 03:47:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:54:41 +0000
Message-Id: <35eaa7f0a58f17d40ec7d90e7eca66dceacc45a3.1422445957.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422445957.git.paul.eggleton@linux.intel.com>
References: <cover.1422445957.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] lib/oe/rootfs.py: rename _uninstall_uneeded to fix spelling error
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
X-List-Received-Date: Wed, 28 Jan 2015 11:55:08 -0000

Rename it to _uninstall_unneeded.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 72d32f7..536efcc 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -118,7 +118,7 @@ class Rootfs(object):
         if self.d.getVar('USE_DEVFS', True) != "1":
             self._create_devfs()
 
-        self._uninstall_uneeded()
+        self._uninstall_unneeded()
 
         self._insert_feed_uris()
 
@@ -128,7 +128,7 @@ class Rootfs(object):
 
         self._cleanup()
 
-    def _uninstall_uneeded(self):
+    def _uninstall_unneeded(self):
         # Remove unneeded init script symlinks
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
-- 
1.9.3


