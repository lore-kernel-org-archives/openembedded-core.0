Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA8171AB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:03:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2018 19:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,381,1515484800"; d="scan'208";a="30026596"
Received: from vsharmab-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.74.120])
	by orsmga003.jf.intel.com with ESMTP; 22 Feb 2018 19:03:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 16:02:14 +1300
Message-Id: <c68866111ab9a6dc4e9cf7c83dd158cefd512f63.1519354910.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519354910.git.paul.eggleton@linux.intel.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/8] lib/oe/recipeutils: add .txz extension to archive list
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
X-List-Received-Date: Fri, 23 Feb 2018 03:03:07 -0000

Prompted by bitbake commit 2ba8a6b25ccc12e7b543e8450121e5311c7a701d,
add .txz to the list of archives used within get_recipe_local_files()
here as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 4e0859e6d90..aa64553c06b 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -408,7 +408,7 @@ def get_recipe_local_files(d, patches=False, archives=False):
     # fetcher) though note that this only encompasses actual container formats
     # i.e. that can contain multiple files as opposed to those that only
     # contain a compressed stream (i.e. .tar.gz as opposed to just .gz)
-    archive_exts = ['.tar', '.tgz', '.tar.gz', '.tar.Z', '.tbz', '.tbz2', '.tar.bz2', '.tar.xz', '.tar.lz', '.zip', '.jar', '.rpm', '.srpm', '.deb', '.ipk', '.tar.7z', '.7z']
+    archive_exts = ['.tar', '.tgz', '.tar.gz', '.tar.Z', '.tbz', '.tbz2', '.tar.bz2', '.txz', '.tar.xz', '.tar.lz', '.zip', '.jar', '.rpm', '.srpm', '.deb', '.ipk', '.tar.7z', '.7z']
     ret = {}
     for uri in uris:
         if fetch.ud[uri].type == 'file':
-- 
2.14.3


