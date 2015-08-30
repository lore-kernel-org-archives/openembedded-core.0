Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 102BF76E2E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2015 09:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="758326778"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2015 09:08:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B8C8B6A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:05 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:38 +0300
Message-Id: <8f18ed18e0c9756d59e5688943b83575319dd2be.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/11] devtool: build-image: improve help and description
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
X-List-Received-Date: Sun, 30 Aug 2015 16:08:56 -0000

Made parser help message and description more clear in
build-image plugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index d875715..708120a 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -48,7 +48,9 @@ def build_image(args, config, basepath, workspace):
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from the build-image plugin"""
-    parser_package = subparsers.add_parser('build-image', help='Build image')
-    parser_package.add_argument('recipe', help='Image recipe to build')
-    parser_package.set_defaults(func=build_image)
-
+    parser = subparsers.add_parser('build-image',
+                                   help='Build image including workspace recipe packages',
+                                   description='Builds an image, extending it to include '
+                                   'packages from recipes in the workspace')
+    parser.add_argument('recipe', help='Image recipe to build')
+    parser.set_defaults(func=build_image)
-- 
2.1.4


