Return-Path: <stefan@agner.ch>
X-Greylist: delayed 495 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Jul 2014 07:52:51 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.102])
	by mail.openembedded.org (Postfix) with ESMTP id B32B665CD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 07:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.kmu-office.ch (Postfix) with ESMTP id 3C69E4267DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:44:28 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at kmu-office.ch
Received: from mail.kmu-office.ch ([127.0.0.1])
	by localhost (mail.kmu-office.ch [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EbDE0bDOalqs
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:44:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.kmu-office.ch (Postfix) with ESMTP id 21775426A31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:44:28 +0200 (CEST)
Received: from trochilidae.toradex.int (unknown [46.140.72.82])
	(Authenticated sender: stefan@agner.ch)
	by mail.kmu-office.ch (Postfix) with ESMTPSA id F1C944267DC;
	Thu, 24 Jul 2014 09:44:27 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 09:44:22 +0200
Message-Id: <1406187862-2819-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.0.2
Subject: [PATCH] shadow-securetty: add freescale lpuart
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
X-List-Received-Date: Thu, 24 Jul 2014 07:52:54 -0000

Add Freescale lpuart tty's (ttyLPx) to securetty. Freescale Vybrid
devices running upstream kernel use this driver.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 meta/recipes-extended/shadow/files/securetty | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index 0b1629f..d919993 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -137,6 +137,14 @@ ttymxc3
 ttymxc4
 ttymxc5
 
+# Freescale lpuart ports
+ttyLP0
+ttyLP1
+ttyLP2
+ttyLP3
+ttyLP4
+ttyLP5
+
 # Standard serial ports, with devfs
 tts/0
 tts/1
-- 
2.0.2


