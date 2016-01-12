Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 1E97F731DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 14:28:00 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <ejo@pengutronix.de>)
	id 1aIzvV-00048e-A9; Tue, 12 Jan 2016 15:28:01 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.86)
	(envelope-from <ejo@pengutronix.de>)
	id 1aIzvV-0004iV-1i; Tue, 12 Jan 2016 15:28:01 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:27:25 +0100
Message-Id: <1452608845-27368-1-git-send-email-ejo@pengutronix.de>
X-Mailer: git-send-email 2.6.4
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH] autoconf: add missing perl-module-file-find to RDEPENDS
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
X-List-Received-Date: Tue, 12 Jan 2016 14:28:01 -0000

The autoscan script uses the File.pm module which was missing in the
list of RDEPENDS. This caused autoscan to fail with

  % autoscan
  [...]
  Can't locate File/Find.pm in @INC [...]

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 78b77e8..b4e3356 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -20,6 +20,7 @@ RDEPENDS_${PN} = "m4 gnu-config \
 		  perl-module-file-glob \
 		  perl-module-file-path \
 		  perl-module-file-stat \
+		  perl-module-file-find \
 		  perl-module-getopt-long \
 		  perl-module-io-file \
 		  perl-module-posix \
-- 
2.6.4


