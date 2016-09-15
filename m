Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id 623E56057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 21:11:25 +0000 (UTC)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
	[76.250.84.236]) by mx.zohomail.com
	with SMTPS id 1473973883599706.3432186702075;
	Thu, 15 Sep 2016 14:11:23 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2016 16:11:17 -0500
Message-Id: <1473973877-14758-2-git-send-email-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1473973877-14758-1-git-send-email-patrick@stwcx.xyz>
References: <b88d60f8-7916-b1a0-f381-b62c9111c7be@windriver.com>
	<1473973877-14758-1-git-send-email-patrick@stwcx.xyz>
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v2 2/2] util-linux: Disable bfs support
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
X-List-Received-Date: Thu, 15 Sep 2016 21:11:25 -0000

Disable building of mkfs.bfs, which is used to create
BFS file-systems used by SCO UnixWare.  This is highly
unlikely to be utilized and there are otherwise no
references to 'bfs' throughout the rest of the tree.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 608f198..c635502 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -46,7 +46,7 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
                        --disable-vipw --disable-newgrp --disable-chfn-chsh \
                        --enable-write --enable-mount \
                        --enable-libuuid --enable-libblkid --enable-fsck \
-                       --disable-minix --without-udev \
+                       --disable-minix --disable-bfs --without-udev \
                        usrsbin_execdir='${sbindir}' \
 "
 
-- 
2.7.3



