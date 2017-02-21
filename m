Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 312F672FA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:30:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 07:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1100637927"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 21 Feb 2017 07:30:14 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6933D6A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 07:30:13 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 17:23:09 +0200
Message-Id: <53e586aa931e48bcca5b0ca0f315c4d9c8f01eb0.1487690169.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487690169.git.ed.bartosh@linux.intel.com>
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/6] wic: exec_native_cmd: fix undefined variable error
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
X-List-Received-Date: Tue, 21 Feb 2017 15:30:13 -0000

Defined variable 'out' to fix this exception:
UnboundLocalError: local variable 'out' referenced before assignment

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/misc.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 6769e39..216ab7b 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -121,6 +121,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
         ret, out = _exec_cmd(native_cmd_and_args, True, catch)
     else:
         ret = 127
+        out = "can't find native executable %s in %s" % (args[0], native_paths)
 
     prog = args[0]
     # shell command-not-found
-- 
2.1.4


