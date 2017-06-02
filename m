Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 57BD077F98
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:21:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 10:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; d="scan'208";a="109728106"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2017 10:21:34 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AF0175801F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 10:21:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 20:20:00 +0300
Message-Id: <a69e649999870a428a3f67fdc5dd25f5f17c7161.1496423753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496423753.git.ed.bartosh@linux.intel.com>
References: <cover.1496423753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/6] wic: add wic_init_parser_rm
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
X-List-Received-Date: Fri, 02 Jun 2017 17:21:33 -0000

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


