Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id ACB9278320
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 04:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1140753932"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2017 04:24:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E0F885800CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:22:09 +0300
Message-Id: <a78550c10270e7fd1a6ab8baf426fdb9c50aa55d.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 21/26] wic: add wic_init_parser_rm
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:20 -0000

Add parser for 'wic rm' subcommand.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index 5e81fad..fc192ec 100755
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
2.1.4


