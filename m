Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA66471A36
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 14:50:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 08 Nov 2016 06:50:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,462,1473145200"; d="scan'208";a="1056869837"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.8.222])
	by orsmga001.jf.intel.com with ESMTP; 08 Nov 2016 06:50:06 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 14:49:53 +0000
Message-Id: <31dd1686db1c6cec459989b7efe09a58198ec860.1478615920.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478615920.git.joshua.g.lock@intel.com>
References: <cover.1478615920.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1478615920.git.joshua.g.lock@intel.com>
References: <cover.1478615920.git.joshua.g.lock@intel.com>
Subject: [PATCH v2 1/4] lib/oe/path: remove duplicate import
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
X-List-Received-Date: Tue, 08 Nov 2016 14:50:05 -0000

There's no need to import glob inside copyhardlinktree() as it's
already imported for the entire path module.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/path.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 06a5af2..f73fd4a 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -81,7 +81,6 @@ def copyhardlinktree(src, dst):
         subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
         source = ''
         if os.path.isdir(src):
-            import glob
             if len(glob.glob('%s/.??*' % src)) > 0:
                 source = '%s/.??* ' % src
             source = source + '%s/*' % src
-- 
2.7.4


