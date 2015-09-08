Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 68F8B76EBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:58:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2015 03:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="764592823"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2015 03:58:21 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 13:58:15 +0300
Message-Id: <1441709895-1304-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/4] devtool: modify: enable do_shared_workdir for kernel
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
X-List-Received-Date: Tue, 08 Sep 2015 10:58:21 -0000

Do not put 'do_shared_workdir' into SRCTREECOVEREDTASKS when creating
bbappend for kernel packages. This will allow building packages that
depend on the shared build artifacts of kernel.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e59fb5e..ee00c6d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -493,7 +493,7 @@ def modify(args, config, basepath, workspace):
             f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
 
         if bb.data.inherits_class('kernel', rd):
-            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_shared_workdir do_fetch do_unpack"\n')
+            f.write('SRCTREECOVEREDTASKS = "do_validate_branches do_kernel_checkout do_fetch do_unpack"\n')
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
             for commit in commits:
-- 
2.1.4


