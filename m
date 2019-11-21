Return-Path: <jlu@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2CB7F971
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 11:38:49 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWv-0000WB-B7; Thu, 21 Nov 2019 12:21:45 +0100
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWv-0003gM-0F; Thu, 21 Nov 2019 12:21:45 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 12:12:47 +0100
Message-Id: <20191121111248.16992-5-jlu@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121111248.16992-1-jlu@pengutronix.de>
References: <20191121111248.16992-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 5/6] libp11: add support for native builds
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
X-List-Received-Date: Thu, 21 Nov 2019 11:38:49 -0000
Content-Transfer-Encoding: 8bit

This is needed as a dependency when using SoftHSM from the PKCS#11
OpenSSL engine for code singing.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/libp11/libp11_0.4.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
index b40223e8abcb..fc2ec9935f56 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
@@ -24,3 +24,5 @@ do_install_append () {
 
 FILES_${PN} += "${libdir}/engines*/pkcs11.so"
 FILES_${PN}-dev += "${libdir}/engines*/libpkcs11${SOLIBSDEV}"
+
+BBCLASSEXTEND="native"
-- 
2.24.0


