Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2D726731EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:36:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 09:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="636294918"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2016 09:36:24 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 852CA2C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:24:19 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:39:00 +0200
Message-Id: <d9c7b7c468482699a7fa29c00925c6b14c57075d.1453217537.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453217537.git.ed.bartosh@linux.intel.com>
References: <cover.1453217537.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453217537.git.ed.bartosh@linux.intel.com>
References: <cover.1453217537.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 8/8] wic: add help for 'include' command
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
X-List-Received-Date: Tue, 19 Jan 2016 17:36:23 -0000

Added description of 'include' parser command to the
'wic help kickstart' output.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index f5587bb..405d25a 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -760,4 +760,18 @@ DESCRIPTION
       implemented by the various --source plugins that implement
       bootloader functionality; the bootloader command essentially
       provides a means of modifying bootloader configuration.
+
+    * include
+
+      This command allows the user to include the content of .wks file
+      into original .wks file.
+
+      Command uses the following syntax:
+
+         include <file>
+
+      The <file> is either path to the file or its name. If name is
+      specified wic will try to find file in the directories with canned
+      .wks files.
+
 """
-- 
2.1.4


