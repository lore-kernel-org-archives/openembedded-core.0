Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 42A1760620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:45:23 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 649802751; Wed, 02 Dec 2015 05:45:20 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a44uU-0002lX-Qe; Wed, 02 Dec 2015 10:45:18 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a44uU-00059p-Pr; Wed, 02 Dec 2015 10:45:18 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 10:45:10 +0000
Message-Id: <1449053111-19775-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 1/2] libav: Remove deprecated --disable-avserver
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
X-List-Received-Date: Wed, 02 Dec 2015 10:45:25 -0000

./configure --help says:

  --disable-avserver       deprecated, does nothing

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-multimedia/libav/libav.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index d3f4b1b..a8c78be 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -63,7 +63,6 @@ EXTRA_OECONF = " \
     --cross-prefix=${TARGET_PREFIX} \
     --prefix=${prefix} \
     \
-    --enable-avserver \
     --enable-avplay \
     --ld="${CCLD}" \
     --arch=${TARGET_ARCH} \
-- 
2.1.4


