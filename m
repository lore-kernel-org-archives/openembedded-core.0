Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 744AF73FE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2015 06:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708360040"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:24 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:07 +0300
Message-Id: <1431350231-29495-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 07/11] devtool: deploy plugin: fix bad indentation
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
X-List-Received-Date: Mon, 11 May 2015 13:17:23 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index f016b23..62c97fb 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -91,8 +91,8 @@ def undeploy(args, config, basepath, workspace):
 
     deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
     if not os.path.exists(deploy_file):
-         logger.error('%s has not been deployed' % args.recipename)
-         return -1
+        logger.error('%s has not been deployed' % args.recipename)
+        return -1
 
     if args.dry_run:
         print('Previously deployed files to be un-deployed for %s on target %s:' % (args.recipename, args.target))
-- 
2.1.4


