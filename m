Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF34731BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979336"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:05:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:15 +1300
Message-Id: <635fb528bc4c2f04c95a5260987ab7cde9b4b3b0.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 22/26] devtool: sync: tweak help / messages
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:12 -0000

Much of this was copy/pasted from the extract subcommand code; make it
specific to sync.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a9c4cf8..fbc49a9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -346,7 +346,7 @@ def sync(args, config, basepath, workspace):
 
     srctree = os.path.abspath(args.srctree)
     initial_rev = _extract_source(srctree, args.keep_temp, args.branch, True, rd)
-    logger.info('Source tree extracted to %s' % srctree)
+    logger.info('Source tree %s synchronized' % srctree)
 
     if initial_rev:
         return 0
@@ -1326,11 +1326,11 @@ def register_commands(subparsers, context):
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_extract.set_defaults(func=extract, no_workspace=True)
 
-    parser_sync = subparsers.add_parser('sync', help='Synchronize the source for an existing recipe',
-                                       description='Synchronize the source for an existing recipe',
+    parser_sync = subparsers.add_parser('sync', help='Synchronize the source tree for an existing recipe',
+                                       description='Synchronize the previously extracted source tree for an existing recipe',
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-    parser_sync.add_argument('recipename', help='Name for recipe to sync the source for')
-    parser_sync.add_argument('srctree', help='Path to where to sync the source tree')
+    parser_sync.add_argument('recipename', help='Name of recipe to sync the source for')
+    parser_sync.add_argument('srctree', help='Path to the source tree')
     parser_sync.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
     parser_sync.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_sync.set_defaults(func=sync)
-- 
2.5.0


