Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from ducie-dc1.codethink.co.uk (ducie-dc1.codethink.co.uk
	[185.25.241.215])
	by mail.openembedded.org (Postfix) with ESMTP id 07D4A62137
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 20:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTP id 7E33746174E;
	Mon, 25 Apr 2016 21:44:33 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at ducie-dc1.codethink.co.uk
Received: from ducie-dc1.codethink.co.uk ([127.0.0.1])
	by localhost (ducie-dc1.codethink.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UStwuWrC1qXD; Mon, 25 Apr 2016 21:44:31 +0100 (BST)
Received: from localhost.localdomain (unknown [208.113.48.59])
	by ducie-dc1.codethink.co.uk (Postfix) with ESMTPSA id 9F5CD4602AA;
	Mon, 25 Apr 2016 21:44:30 +0100 (BST)
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 16:44:01 -0400
Message-Id: <1461617044-25526-1-git-send-email-tristan.vanberkom@codethink.co.uk>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/4] gcc-cross-initial: Split all-gcc and configure-target-libgcc
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
X-List-Received-Date: Mon, 25 Apr 2016 20:44:34 -0000

Serializing this fixes build on aarch64
---
 meta/recipes-devtools/gcc/gcc-cross-initial.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index c0fa139..98aae45 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -43,7 +43,8 @@ do_configure_prepend () {
 }
 
 do_compile () {
-    oe_runmake all-gcc configure-target-libgcc
+    oe_runmake all-gcc
+    oe_runmake configure-target-libgcc
 }
 do_install () {
 	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h )
-- 
2.8.0.rc3


