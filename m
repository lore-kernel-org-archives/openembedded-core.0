Return-Path: <mfe@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9B47D731
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 18:09:18 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0006l3-Eg; Thu, 02 May 2019 20:09:19 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>)
	id 1hMG91-0001hg-2h; Thu, 02 May 2019 20:09:19 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: fabio.berton@ossystems.com.br,
	openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 20:09:14 +0200
Message-Id: <20190502180916.32114-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502180916.32114-1-m.felsch@pengutronix.de>
References: <20190502180916.32114-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/4] mesa: fix imx gallium driver PACKAGECONFIG option
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
X-List-Received-Date: Thu, 02 May 2019 18:09:19 -0000
Content-Transfer-Encoding: 8bit

Since commit [1] the imx-drm driver is covered by the generic kmsro
driver.

[1] https://gitlab.freedesktop.org/mesa/mesa/commit/ \
	41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2

Upstream-Status: Submitted [openembedded-core@lists.openembedded.org]

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changelog:

v2:
- added Upstream-Status line

 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 675b57b9cb..7516a06639 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -85,11 +85,11 @@ PACKAGECONFIG[gles] = "-Dgles1=true -Dgles2=true, -Dgles1=false -Dgles2=false"
 PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
 
 PACKAGECONFIG[etnaviv] = ""
-PACKAGECONFIG[imx] = ""
+PACKAGECONFIG[kmsro] = ""
 
 GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'imx', ',imx', '', d)}"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-- 
2.20.1


