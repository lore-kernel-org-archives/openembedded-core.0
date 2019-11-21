Return-Path: <jlu@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 45D7D7F944
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 11:38:47 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWv-0000W7-7x; Thu, 21 Nov 2019 12:21:45 +0100
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWu-0003eu-RJ; Thu, 21 Nov 2019 12:21:44 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 12:12:43 +0100
Message-Id: <20191121111248.16992-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 1/6] openct: merge do_install and do_install_append
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
X-List-Received-Date: Thu, 21 Nov 2019 11:38:47 -0000
Content-Transfer-Encoding: 8bit

There is no reason why both should be used in the same recipe. Merge
them.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 67b7c2975302..08b2e3c23236 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -56,10 +56,6 @@ FILES_${PN}-dbg += " \
 
 INSANE_SKIP_${PN} += "dev-deps"
 
-do_install_append() {
-    rm -r ${D}/${localstatedir}/run
-}
-
 do_install () {
     rm -rf ${D}
     install -d ${D}/etc
@@ -87,4 +83,6 @@ do_install () {
     install -dm 755 ${D}${localstatedir}/run/openct
     touch ${D}${localstatedir}/run/openct/status
     chmod 644 ${D}${localstatedir}/run/openct/status
+
+    rm -r ${D}/${localstatedir}/run
 }
-- 
2.24.0


