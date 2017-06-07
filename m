Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51676780B0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 10:26:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 03:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,310,1493708400"; d="scan'208";a="110199063"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 07 Jun 2017 03:25:58 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id D4FCF5802EB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 03:25:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 13:25:25 +0300
Message-Id: <d28c2d5451cae0643e3caf2dcdd6a2e293f0e85b.1496830884.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1496830884.git.ed.bartosh@linux.intel.com>
References: <cover.1496830884.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 1/6] wic: add wic_init_parser_rm
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
X-List-Received-Date: Wed, 07 Jun 2017 10:26:06 -0000

Add parser for 'wic rm' subcommand.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 5e81fad726..fc192ec852 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -379,6 +379,12 @@ def wic_init_parser_cp(subparser):
     subparser.add_argument("-n", "--native-sysroot",
                         help="path to the native sysroot containing the tools")
 
+def wic_init_parser_rm(subparser):
+    subparser.add_argument("path", type=imgpathtype,
+                        help="path: <image>:<vfat partition><path>")
+    subparser.add_argument("-n", "--native-sysroot",
+                        help="path to the native sysroot containing the tools")
+
 def wic_init_parser_help(subparser):
     helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
     for helptopic in helptopics:
-- 
2.12.0


