Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B832771CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:40:03 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:40:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773980"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:40:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:39:00 +1300
Message-Id: <89e98c605bec8cdb460e7978aa3a783a9e12d083.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/14] devtool: modify: tweak help description for behaviour change
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
X-List-Received-Date: Fri, 19 Feb 2016 09:40:03 -0000

I should have adjusted this in OE-Core commit
80a44e52609a89d9ffe816181ae193af491c06ac where the behaviour changed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 084039a..daf18c9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1320,7 +1320,7 @@ def register_commands(subparsers, context):
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
-                                       description='Enables modifying the source for an existing recipe. You can either provide your own pre-prepared source tree, or specify -x/--extract to extract the source being fetched by the recipe.',
+                                       description='Sets up the build environment to modify the source for an existing recipe. The default behaviour is to extract the source being fetched by the recipe into a git tree so you can work on it; alternatively if you already have your own pre-prepared source tree you can specify -n/--no-extract.',
                                        group='starting', order=90)
     parser_modify.add_argument('recipename', help='Name of existing recipe to edit (just name - no version, path or extension)')
     parser_modify.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
@@ -1331,7 +1331,7 @@ def register_commands(subparsers, context):
     group = parser_modify.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
-    parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x) (default "%(default)s")')
+    parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (when not using -n/--no-extract) (default "%(default)s")')
     parser_modify.set_defaults(func=modify)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-- 
2.5.0


