Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Rb9A2-0002Dg-Ks
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 12:07:38 +0100
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Rb93E-0007KU-H9 by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Thu, 15 Dec 2011 12:00:42 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1Rb93x-0000Va-LS; Thu, 15 Dec 2011 12:01:21 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Adrian Alonso <aalonso@secretlab.ca>
Date: Thu, 15 Dec 2011 12:01:13 +0100
Message-Id: <1323946873-28584-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.7.3
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot-xilinx: Update inc file path after oe-core change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2011 11:07:38 -0000

Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
---
 recipes-bsp/uboot/u-boot-xilinx_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/uboot/u-boot-xilinx_git.bb b/recipes-bsp/uboot/u-boot-xilinx_git.bb
index 255f3b5..016a0bb 100644
--- a/recipes-bsp/uboot/u-boot-xilinx_git.bb
+++ b/recipes-bsp/uboot/u-boot-xilinx_git.bb
@@ -1,5 +1,5 @@
 inherit xilinx-boot xilinx-utils
-require recipes-bsp/uboot/u-boot.inc
+require recipes-bsp/u-boot/u-boot.inc
 
 PR = "r14"
 PV = "v2009.11"
-- 
1.7.7.3



