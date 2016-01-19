Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76F657317E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:35:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jan 2016 09:35:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="730434065"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 19 Jan 2016 09:35:59 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 598EF2C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:23:54 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:38:53 +0200
Message-Id: <829f9cfed96d41002dbae6823515be03c26ff089.1453217537.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453217537.git.ed.bartosh@linux.intel.com>
References: <cover.1453217537.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453217537.git.ed.bartosh@linux.intel.com>
References: <cover.1453217537.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/8] wic: move wks parsing code to KickStart._parse
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
X-List-Received-Date: Tue, 19 Jan 2016 17:36:02 -0000

This is a preparation for implementation of include statement.
Parser will be called recursively to parse included .wks files,
so it should be available as a method.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7dbe052..e366f61 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -115,6 +115,9 @@ class KickStart(object):
         bootloader.add_argument('--timeout', type=int)
         bootloader.add_argument('--source')
 
+        self._parse(parser, confpath)
+
+    def _parse(self, parser, confpath):
         with open(confpath) as conf:
             lineno = 0
             for line in conf:
-- 
2.1.4


