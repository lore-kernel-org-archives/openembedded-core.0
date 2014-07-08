Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6B80270415
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:52:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2014 07:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="570013045"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.3])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2014 07:52:03 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jul 2014 09:51:55 -0500
Message-Id: <b9fcd4f65c6487d2ffa6e8496b0ac618b45b90b6.1404830754.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
References: <62d5079dcc2b71362fb5930ca600e8936a040049.1404830754.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1404830754.git.tom.zanussi@linux.intel.com>
References: <cover.1404830754.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/5] wic: Add dummy subcommand and usage strings
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
X-List-Received-Date: Tue, 08 Jul 2014 14:52:25 -0000

In order to reuse the existing subcommand infrastructure to display
various general-purpose help topics, add a dummy 'help_topic'
subcommand and usage string.  This allows users to invoke general help
topics by the natural form 'wic help <topic>' even though topic
doesn't correspond to a real subcommand.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/wic | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 2d3fd09..00eddfd 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -226,6 +226,19 @@ def wic_list_subcommand(args, usage_str):
         sys.exit(1)
 
 
+def wic_help_topic_subcommand(args, usage_str):
+    """
+    Command-line handling for help-only 'subcommands'.  This is
+    essentially a dummy command that doesn nothing but allow users to
+    use the existing subcommand infrastructure to display help on a
+    particular topic not attached to any particular subcommand.
+    """
+    pass
+
+
+wic_help_topic_usage = """
+"""
+
 subcommands = {
     "create": [wic_create_subcommand,
                wic_create_usage,
-- 
1.8.3.1


