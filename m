Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3A0786F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 01:50:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 17:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,395,1515484800"; d="scan'208";a="206908227"
Received: from cthanang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.39])
	by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2018 17:50:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 14:49:59 +1300
Message-Id: <14d6d6f5343629fe03863c1fa0527bc31fa20333.1519609613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1519609613.git.paul.eggleton@linux.intel.com>
References: <cover.1519609613.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 6/8] lib/oe/recipeutils: add .txz extension to archive list
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
X-List-Received-Date: Mon, 26 Feb 2018 01:50:53 -0000

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


