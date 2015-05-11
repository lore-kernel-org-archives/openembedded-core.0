Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5983F74000
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2015 06:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708360087"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:28 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:10 +0300
Message-Id: <1431350231-29495-11-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 10/11] devtool: deploy plugin: rename unused variables
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
X-List-Received-Date: Mon, 11 May 2015 13:17:29 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 8637f19..078c74b 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -45,7 +45,7 @@ def deploy(args, config, basepath, workspace):
     deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
     deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
 
-    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s' % args.recipename, shell=True)
+    stdout, _ = exec_build_env_command(config.init_path, basepath, 'bitbake -e %s' % args.recipename, shell=True)
     recipe_outdir = re.search(r'^D="(.*)"', stdout, re.MULTILINE).group(1)
     if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
         logger.error('No files to deploy - have you built the %s recipe? If so, the install step has not installed any files.' % args.recipename)
@@ -53,7 +53,7 @@ def deploy(args, config, basepath, workspace):
 
     if args.dry_run:
         print('Files to be deployed for %s on target %s:' % (args.recipename, args.target))
-        for root, dirs, files in os.walk(recipe_outdir):
+        for root, _, files in os.walk(recipe_outdir):
             for fn in files:
                 print('  %s' % os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn))
         return 0
-- 
2.1.4


