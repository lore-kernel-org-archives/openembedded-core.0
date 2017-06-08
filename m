Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E1B6F7813F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:15:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="978408345"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 08 Jun 2017 09:15:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id F210C58029B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:15:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 19:12:48 +0300
Message-Id: <39b3e2707cc0b7555c46b972e0c94ad92b0ee629.1496938139.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496938139.git.ed.bartosh@linux.intel.com>
References: <cover.1496938139.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/25] wic: add 'wic ls' command
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
X-List-Received-Date: Thu, 08 Jun 2017 16:15:18 -0000

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


