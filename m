Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9965676398
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 13:52:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2015 06:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,601,1432623600"; d="scan'208";a="775711758"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2015 06:52:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 260776A4005;
	Mon,  3 Aug 2015 06:51:21 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 16:51:49 +0300
Message-Id: <f8999c65e04cbc848961d4bb1404491db41ee97f.1438609723.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
References: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1438609723.git.ed.bartosh@linux.intel.com>
References: <cover.1438609723.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/6] wic: code cleanup: remove unused code
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
X-List-Received-Date: Mon, 03 Aug 2015 13:52:13 -0000

Removed unused global variable wks_vars and 2 unused functions
get_wks_var and add_wks_var.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index af831d3..0fa8a53 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -120,17 +120,6 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
 
     return (rc, out)
 
-# kickstart doesn't support variable substution in commands, so this
-# is our current simplistic scheme for supporting that
-
-wks_vars = dict()
-
-def get_wks_var(key):
-    return wks_vars[key]
-
-def add_wks_var(key, val):
-    wks_vars[key] = val
-
 BOOTDD_EXTRA_SPACE = 16384
 
 _BITBAKE_VARS = defaultdict(dict)
-- 
2.1.4


