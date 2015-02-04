Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 23E8760017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 22:48:40 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id AE7AB3A3; Wed,  4 Feb 2015 23:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 4DCC3D;
	Wed,  4 Feb 2015 23:48:47 +0100 (CET)
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Wed,  4 Feb 2015 23:48:38 +0100
Message-Id: <1423090118-13921-1-git-send-email-alexandre.belloni@free-electrons.com>
X-Mailer: git-send-email 2.1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: print partition alignment when available
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
X-List-Received-Date: Wed, 04 Feb 2015 22:48:43 -0000

When printing a partition, the --align parameter was shown when present
but not its value.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 scripts/lib/wic/kickstart/custom_commands/micpartition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/micpartition.py b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
index 43d04f12945c..d6be008cebf2 100644
--- a/scripts/lib/wic/kickstart/custom_commands/micpartition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
@@ -32,7 +32,7 @@ class Mic_PartData(FC4_PartData):
         retval = FC4_PartData._getArgsAsStr(self)
 
         if self.align:
-            retval += " --align"
+            retval += " --align=%d" % self.align
         if self.extopts:
             retval += " --extoptions=%s" % self.extopts
         if self.part_type:
-- 
2.1.0


