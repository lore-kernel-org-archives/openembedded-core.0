Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 38B2E60125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 08:06:36 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1bzfhs-0007iN-Eu; Thu, 27 Oct 2016 10:06:36 +0200
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.87)
	(envelope-from <ejo@pengutronix.de>)
	id 1bzfhr-0007U5-UN; Thu, 27 Oct 2016 10:06:35 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Oct 2016 10:06:35 +0200
Message-Id: <20161027080635.28708-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.9.3
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH][krogoth] db: let fix-parallel-build.patch apply again
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
X-List-Received-Date: Thu, 27 Oct 2016 08:06:37 -0000

This patch fails to apply with quilt for the 6.0.30 version of db in
some cases. This issue is fixed in upstream, this is a minimal version
of the fix, adapted to krogoth stable branch.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/recipes-support/db/db/fix-parallel-build.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db/fix-parallel-build.patch b/meta/recipes-support/db/db/fix-parallel-build.patch
index 2c7f1e1..14ed8be 100644
--- a/meta/recipes-support/db/db/fix-parallel-build.patch
+++ b/meta/recipes-support/db/db/fix-parallel-build.patch
@@ -8,7 +8,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
 --- dist.orig/Makefile.in	2012-05-11 19:57:48.000000000 +0200
 +++ dist/Makefile.in	2013-10-31 18:17:11.875532522 +0100
-@@ -1034,7 +1034,7 @@
+@@ -1041,7 +1041,7 @@
  	    db_recover@o@ util_sig@o@ $(DEF_LIB) $(LIBS)
  	$(POSTLINK) $@
  
-- 
2.9.3


