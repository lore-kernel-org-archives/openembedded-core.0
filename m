Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC676F001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 11:01:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2014 03:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,844,1384329600"; d="scan'208";a="455436510"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2014 03:01:11 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 13:01:06 +0200
Message-Id: <46bdee08ca081303dc1a2eb3d560d8f2d16ecfc5.1392375539.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392375539.git.laurentiu.palcu@intel.com>
References: <cover.1392375539.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392375539.git.laurentiu.palcu@intel.com>
References: <cover.1392375539.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/3] package-index.bb: use the new python indexing routines
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
X-List-Received-Date: Fri, 14 Feb 2014 11:01:38 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-core/meta/package-index.bb |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 3cc1239..27b6d8e 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -21,10 +21,9 @@ do_populate_sysroot[noexec] = "1"
 do_package_index[nostamp] = "1"
 do_package_index[depends] += "${PACKAGEINDEXDEPS}"
 
-do_package_index() {
-	set -ex
-	${PACKAGEINDEXES}
-	set +ex
+python do_package_index() {
+    from oe.rootfs import generate_index_files
+    generate_index_files(d)
 }
 addtask do_package_index before do_build
 EXCLUDE_FROM_WORLD = "1"
-- 
1.7.9.5


