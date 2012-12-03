Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TfXgX-0005Kn-Iw
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 16:11:53 +0100
Received: from localhost ([127.0.0.1]:43684 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TfXSd-0001Ku-Sn; Mon, 03 Dec 2012 14:57:31 +0000
Received: from [195.171.99.130] (port=33675 helo=archhp.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TfXSd-0001Kb-OI; Mon, 03 Dec 2012 14:57:31 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2012 14:59:14 +0000
Message-Id: <1354546754-18857-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0.1
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] latencytop: add missing signed-off-by and re-add upstream status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2012 15:11:54 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

When I made a change to this patch in git commit 1b41a4660d0
I accidently removed the Upstream Status line and also didn't
add the required signed-off-by tag.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 .../latencytop/latencytop-0.5/latencytop-makefile.patch    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
index 596450c..0cf217f 100644
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
@@ -1,9 +1,13 @@
---- a/Makefile 2010-07-20 18:51:32.000000000 +0800
-+++ b/Makefile 2010-07-20 18:54:54.000000000 +0800
-@@ -1,10 +1,8 @@
+diff --git a/Makefile.orig b/Makefile
+index 16a2369..fa797a2 100644
+--- a/Makefile.orig
++++ b/Makefile
+@@ -1,10 +1,11 @@
 -# FIXME: Use autoconf ?
 -HAS_GTK_GUI = 1
--
++# Upstream-Status: Inappropriate [configuration]
++# Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
+ 
  DESTDIR =
  SBINDIR = /usr/sbin
  XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
@@ -13,7 +17,7 @@
  
  OBJS= latencytop.o text_display.o translate.o fsync.o
  
-@@ -26,16 +24,17 @@
+@@ -26,16 +27,17 @@ endif
  
  # We write explicity this "implicit rule"
  %.o : %.c
-- 
1.8.0.1



