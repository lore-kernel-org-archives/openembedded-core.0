Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E7972787D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:42:15 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356287"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:42:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:21 +1300
Message-Id: <f59236ba5566de12de1205a0c75a975945e1736b.1512438001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/12] lib/oe/recipeutils: add .txz extension to archive list
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
X-List-Received-Date: Tue, 05 Dec 2017 01:42:16 -0000

Prompted by bitbake commit 2ba8a6b25ccc12e7b543e8450121e5311c7a701d,
add .txz to the list of archives used within get_recipe_local_files()
here as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index f4a40c2..ac3b027 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -413,7 +413,7 @@ def get_recipe_local_files(d, patches=False, archives=False):
     # fetcher) though note that this only encompasses actual container formats
     # i.e. that can contain multiple files as opposed to those that only
     # contain a compressed stream (i.e. .tar.gz as opposed to just .gz)
-    archive_exts = ['.tar', '.tgz', '.tar.gz', '.tar.Z', '.tbz', '.tbz2', '.tar.bz2', '.tar.xz', '.tar.lz', '.zip', '.jar', '.rpm', '.srpm', '.deb', '.ipk', '.tar.7z', '.7z']
+    archive_exts = ['.tar', '.tgz', '.tar.gz', '.tar.Z', '.tbz', '.tbz2', '.tar.bz2', '.txz', '.tar.xz', '.tar.lz', '.zip', '.jar', '.rpm', '.srpm', '.deb', '.ipk', '.tar.7z', '.7z']
     ret = {}
     for uri in uris:
         if fetch.ud[uri].type == 'file':
-- 
2.9.5


