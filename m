Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C53BA719FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:31:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 04 Oct 2016 02:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,442,1473145200"; d="scan'208";a="768675553"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.185.151])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2016 02:31:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 22:31:14 +1300
Message-Id: <b2b7d77e63ab7c3f8d9c0591c4e18080f86cff04.1475573453.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1475573453.git.paul.eggleton@linux.intel.com>
References: <cover.1475573453.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1475573453.git.paul.eggleton@linux.intel.com>
References: <cover.1475573453.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] devtool: add: fix error message when only specifying a recipe name
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
X-List-Received-Date: Tue, 04 Oct 2016 09:31:44 -0000

We were supposed to be printing out the specified recipe name here but I
forgot to specify a parameter for the string.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8319145..c8d7eb1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -64,7 +64,7 @@ def add(args, config, basepath, workspace):
             args.srctree = args.recipename
             args.recipename = None
         elif os.path.isdir(args.recipename):
-            logger.warn('Ambiguous argument %s - assuming you mean it to be the recipe name')
+            logger.warn('Ambiguous argument "%s" - assuming you mean it to be the recipe name' % args.recipename)
 
     if args.srctree and os.path.isfile(args.srctree):
         args.fetchuri = 'file://' + os.path.abspath(args.srctree)
-- 
2.5.5


