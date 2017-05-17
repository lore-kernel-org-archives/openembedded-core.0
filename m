Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE8577E1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:40:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 17 May 2017 06:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1148911127"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2017 06:40:24 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id D67EA6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:40:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:39:51 +0000
Message-Id: <844a941ee5ff3306e0ae87485d8e9a15bd7404c0.1495028274.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028274.git.ed.bartosh@linux.intel.com>
References: <cover.1495028274.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 6/8] wic: add 'wic ls' command
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
X-List-Received-Date: Wed, 17 May 2017 13:40:26 -0000

Added empty 'wic ls' command that does nothing.
The functionality will be added by the next commits.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py |  4 ++++
 scripts/wic               | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 647358287f..e58beb7dce 100644
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
index 6c9a30da7d..4161f80367 100755
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
2.12.0


