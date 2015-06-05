Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A874757A7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 08:06:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 05 Jun 2015 01:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="737561384"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2015 01:06:55 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 268A56A4083;
	Fri,  5 Jun 2015 01:06:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 09:13:06 +0300
Message-Id: <1433484789-304-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 1/4] wic: removed exec_cmd_quiet and exec_native_cmd_quiet
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
X-List-Received-Date: Fri, 05 Jun 2015 08:06:54 -0000

These functions are not used anywhere.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 2f5299d..9eaf039 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -63,15 +63,6 @@ def exec_cmd(cmd_and_args, as_shell=False, catch=3):
     return out
 
 
-def exec_cmd_quiet(cmd_and_args, as_shell=False):
-    """
-    Execute command, catching nothing in the output
-
-    Exits if rc non-zero
-    """
-    return exec_cmd(cmd_and_args, as_shell, 0)
-
-
 def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
     """
     Execute native command, catching stderr, stdout
@@ -98,18 +89,6 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
 
     return (rc, out)
 
-
-def exec_native_cmd_quiet(cmd_and_args, native_sysroot):
-    """
-    Execute native command, catching nothing in the output
-
-    Need to execute as_shell if the command uses wildcards
-
-    Always need to execute native commands as_shell
-    """
-    return exec_native_cmd(cmd_and_args, native_sysroot, 0)
-
-
 # kickstart doesn't support variable substution in commands, so this
 # is our current simplistic scheme for supporting that
 
-- 
2.1.4


