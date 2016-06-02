Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7D87740E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2016 03:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="979359515"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2016 03:13:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 1A5686A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:26 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:57 +0300
Message-Id: <b37dce8bb60a65e265c77953348866715866128d.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 11/16] scripts: python3: replace exec statement with builtin
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:58 -0000

Used exec() builtin instead of 'exec' statement as
this statement doesn't exist in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/bsp/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index 5ff6c98..2b87d33 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -1362,7 +1362,7 @@ def run_program_lines(linelist, codedump):
         of = open("bspgen.out", "w")
         of.write(buf)
         of.close()
-    exec buf
+    exec(buf)
 
 
 def gen_target(files, context = None):
-- 
2.1.4


