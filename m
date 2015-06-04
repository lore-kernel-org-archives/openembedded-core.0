Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA08734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:32:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 09:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,553,1427785200"; d="scan'208";a="705387228"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2015 09:32:10 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 19:31:53 +0300
Message-Id: <1433435514-28677-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 09/10] devtool: remove some unused return values
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
X-List-Received-Date: Thu, 04 Jun 2015 16:32:09 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/devtool                 | 1 -
 scripts/lib/devtool/standard.py | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 0100eb8..307846a 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -157,7 +157,6 @@ def _enable_workspace_layer(workspacedir, config, basepath):
     bblayers_conf = os.path.join(basepath, 'conf', 'bblayers.conf')
     if not os.path.exists(bblayers_conf):
         logger.error('Unable to find bblayers.conf')
-        return -1
     _, added = bb.utils.edit_bblayers_conf(bblayers_conf, workspacedir, config.workspace_path)
     if added:
         logger.info('Enabling workspace layer in bblayers.conf')
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1665ca8..2c48d69 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -416,9 +416,6 @@ def _check_preserve(config, recipename):
                     tf.write(line)
     os.rename(newfile, origfile)
 
-    return False
-
-
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
     import bb
-- 
2.1.4


