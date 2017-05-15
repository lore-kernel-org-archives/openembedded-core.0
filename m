Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE2671E02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:20:29 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 07:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; d="scan'208";a="100798363"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 15 May 2017 07:20:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 19BB56A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:20:15 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 16:57:37 +0300
Message-Id: <61f0342f30e46160fd7f16095097d200a3482e09.1494856157.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494856157.git.ed.bartosh@linux.intel.com>
References: <cover.1494856157.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 6/8] wic: add 'wic ls' command
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
X-List-Received-Date: Mon, 15 May 2017 14:20:30 -0000

Added empty 'wic ls' command that does nothing.
The functionality will be added by the next commits.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py |  4 ++++
 scripts/wic               | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 6473582..e58beb7 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -225,6 +225,10 @@ def wic_list(args, scripts_path):
 
     return False
 
+def wic_ls(args, native_sysroot):
+    """List contents of partitioned image or vfat partition."""
+    pass
+
 def find_canned(scripts_path, file_name):
     """
     Find a file either by its path or by name in the canned files dir.
diff --git a/scripts/wic b/scripts/wic
index 6c9a30d..4161f80 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -234,6 +234,14 @@ def wic_list_subcommand(args, usage_str):
         raise WicError("Bad list arguments, exiting")
 
 
+def wic_ls_subcommand(args, usage_str):
+    """
+    Command-line handling for list content of images.
+    The real work is done by engine.wic_ls()
+    """
+    engine.wic_ls(args, args.native_sysroot)
+
+
 def wic_help_subcommand(args, usage_str):
     """
     Command-line handling for help subcommand to keep the current
@@ -266,6 +274,9 @@ helptopics = {
     "create":    [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_create_help],
+    "ls":        [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_ls_help],
     "list":      [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_list_help]
@@ -359,6 +370,10 @@ subcommands = {
                   hlp.wic_list_usage,
                   hlp.wic_list_help,
                   wic_init_parser_list],
+    "ls":        [wic_ls_subcommand,
+                  hlp.wic_ls_usage,
+                  hlp.wic_ls_help,
+                  wic_init_parser_ls],
     "help":      [wic_help_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_help_help,
-- 
2.1.4


