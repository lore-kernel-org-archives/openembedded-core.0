Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D70527316B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:19:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2016 06:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="729518385"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 18 Jan 2016 06:19:41 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 1328A2C8002
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:07:36 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:22:41 +0200
Message-Id: <886899efaeaa5a5b8d09ce44d34d8e4141d3dd25.1453119482.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 1/6] wic: add custom exception KickStartError
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
X-List-Received-Date: Mon, 18 Jan 2016 14:19:42 -0000

This exception will be raised by kickstart parser
on parsing errors and processed in the code which
calls parser to produce meaningful error output.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/kickstart.py b/scripts/lib/wic/kickstart.py
index 2208395..7f0105d 100644
--- a/scripts/lib/wic/kickstart.py
+++ b/scripts/lib/wic/kickstart.py
@@ -31,6 +31,9 @@ from argparse import ArgumentParser, ArgumentTypeError
 
 from wic.partition import Partition
 
+class KickStartError(Exception):
+    pass
+
 def sizetype(arg):
     """
     Custom type for ArgumentParser
-- 
2.1.4


