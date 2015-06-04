Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 136497581C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 16:32:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 04 Jun 2015 09:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,553,1427785200"; d="scan'208";a="705387204"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2015 09:32:06 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 19:31:50 +0300
Message-Id: <1433435514-28677-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 06/10] devtool: slight simplification of path splitting logic
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
X-List-Received-Date: Thu, 04 Jun 2015 16:32:06 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index dfa45e8..c860094 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -468,7 +468,7 @@ def modify(args, config, basepath, workspace):
     if s.startswith(workdir):
         # Handle if S is set to a subdirectory of the source
         if s != workdir and os.path.dirname(s) != workdir:
-            srcsubdir = os.sep.join(os.path.relpath(s, workdir).split(os.sep)[1:])
+            srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
             srctree = os.path.join(srctree, srcsubdir)
 
     appendpath = os.path.join(config.workspace_path, 'appends')
-- 
2.1.4


