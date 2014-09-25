Return-Path: <sledz@dresearch-fe.de>
X-Greylist: delayed 374 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Sep 2014 12:25:36 UTC
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 5284C7117E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:25:36 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 271DBE00C4;
	Thu, 25 Sep 2014 14:19:22 +0200 (CEST)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 5CC6A700D59; Thu, 25 Sep 2014 14:19:20 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 14:17:55 +0200
Message-Id: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 2.1.1
Subject: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Thu, 25 Sep 2014 12:25:37 -0000

Currently allarch recipes using useradd rebuild each time MACHINE
changes which is not desireable. Adding the useradd dependencies
to this list ensures they do not change under these circumstances.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 18609dd..a764ee0 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -30,4 +30,8 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   udev-extraconf \
   packagegroup-x11-xserver \
   systemd-serialgetty \
+  initscripts \                                                                                                                                                                                                                                    
+  shadow \
+  shadow-sysroot \
+  base-passwd \
 "
-- 
2.1.1


