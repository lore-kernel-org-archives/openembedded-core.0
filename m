Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 10B6E6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 04:44:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2016 21:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,465,1459839600"; d="scan'208";a="996301594"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2016 21:44:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 16:43:39 +1200
Message-Id: <690406aca531265be05d454e9f8aaded03f563dd.1465791249.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1465791249.git.paul.eggleton@linux.intel.com>
References: <cover.1465791249.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1465791249.git.paul.eggleton@linux.intel.com>
References: <cover.1465791249.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] devtool: tweak README in created workspace layer
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
X-List-Received-Date: Mon, 13 Jun 2016 04:44:11 -0000

Clarify slightly the intended usage of the workspace layer.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index ff368dc..63d2ef9 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -179,13 +179,16 @@ def _create_workspace(workspacedir, config, basepath):
         # Add a README file
         with open(os.path.join(workspacedir, 'README'), 'w') as f:
             f.write('This layer was created by the OpenEmbedded devtool utility in order to\n')
-            f.write('contain recipes and bbappends. In most instances you should use the\n')
+            f.write('contain recipes and bbappends that are currently being worked on. The idea\n')
+            f.write('is that the contents is temporary - once you have finished working on a\n')
+            f.write('recipe you use the appropriate method to move the files you have been\n')
+            f.write('working on to a proper layer. In most instances you should use the\n')
             f.write('devtool utility to manage files within it rather than modifying files\n')
             f.write('directly (although recipes added with "devtool add" will often need\n')
             f.write('direct modification.)\n')
-            f.write('\nIf you no longer need to use devtool you can remove the path to this\n')
-            f.write('workspace layer from your conf/bblayers.conf file (and then delete the\n')
-            f.write('layer, if you wish).\n')
+            f.write('\nIf you no longer need to use devtool or the workspace layer\'s contents\n')
+            f.write('you can remove the path to this workspace layer from your conf/bblayers.conf')
+            f.write('file (and then delete the layer, if you wish).\n')
             f.write('\nNote that by default, if devtool fetches and unpacks source code, it\n')
             f.write('will place it in a subdirectory of a "sources" subdirectory of the\n')
             f.write('layer. If you prefer it to be elsewhere you can specify the source\n')
-- 
2.5.5


