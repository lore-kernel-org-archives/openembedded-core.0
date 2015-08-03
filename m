Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 23E4E76419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 13:52:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2015 06:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,601,1432623600"; d="scan'208";a="741153023"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2015 06:52:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 165546A4005;
	Mon,  3 Aug 2015 06:51:17 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Aug 2015 16:51:46 +0300
Message-Id: <de1bbbaa8743b765d169fb233b6485e86f5904c0.1438609723.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438609723.git.ed.bartosh@linux.intel.com>
References: <cover.1438609723.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/6] wic: improved usage text
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
X-List-Received-Date: Mon, 03 Aug 2015 13:52:08 -0000

Made command line specification less confusing.
Reformatted usage output.

[YOCTO #7938]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/image/help.py | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index 0666d80..a14ef20 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -101,19 +101,17 @@ wic_usage = """
 
  Create a customized OpenEmbedded image
 
- usage: wic [--version] [--help] COMMAND [ARGS]
+ usage: wic [--version] | [--help] | [COMMAND [ARGS]]
 
  Current 'wic' commands are:
+    help              Show help for command or one of the topics (see below)
     create            Create a new OpenEmbedded image
     list              List available values for options and image properties
 
  Help topics:
-    overview           wic overview - General overview of wic
-    plugins            wic plugins - Overview and API
-    kickstart          wic kickstart - wic kickstart reference
-
- See 'wic help <COMMAND or HELP TOPIC>' for more information on a specific
- command or help topic.
+    overview          wic overview - General overview of wic
+    plugins           wic plugins - Overview and API
+    kickstart         wic kickstart - wic kickstart reference
 """
 
 wic_help_usage = """
-- 
2.1.4


