Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA8F609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:36:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 9F930316262E;
	Mon, 22 Sep 2014 13:36:17 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 13:35:14 +0200
Message-Id: <1411385721-22264-3-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Maciek Borzecki <maciek.borzecki@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 2/9] wic: use IMAGE_EXTRA_SPACE for vfat rootfs
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
X-List-Received-Date: Mon, 22 Sep 2014 11:36:19 -0000

Functions for generating rootfs use IMAGE_EXTRA_SPACE rather than
BOOTDD_EXTRA_SPACE. The latter is used in boot image source plugins.

Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 0b02172..f41d136 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -308,8 +308,8 @@ class Wic_PartData(Mic_PartData):
 
         extra_blocks = self.get_extra_block_count(blocks)
 
-        if extra_blocks < BOOTDD_EXTRA_SPACE:
-            extra_blocks = BOOTDD_EXTRA_SPACE
+        if extra_blocks < IMAGE_EXTRA_SPACE:
+            extra_blocks = IMAGE_EXTRA_SPACE
 
         blocks += extra_blocks
 
-- 
1.9.0


