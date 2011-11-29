Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RVIFz-0003vc-7W
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:37:35 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id DB217EBF02
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 08:07:51 +0100 (CET)
X-SENDER-IP: [83.227.56.19]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmBQAD6E1E5T4zgTPGdsb2JhbABDiUqhLRkBAQEBNzKBcgFcIzAfSwotiAcGtymHX4MVBJRLiQiJBg
X-IronPort-AV: E=Sophos;i="4.69,590,1315173600"; 
   d="scan'208";a="4565592"
Received: from c-1338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	theoden.atmel.com) ([83.227.56.19])
	by ipb3.telenor.se with ESMTP; 29 Nov 2011 08:07:51 +0100
From: ulf@emagii.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:07:22 +0100
Message-Id: <1322550442-2325-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] meta-ti u-boot: Add COMPATIBLE_MACHINE to avoid disturbing other builds
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
X-List-Received-Date: Tue, 29 Nov 2011 07:37:35 -0000

From: Ulf Samuelsson <ulf@emagii.com>

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 recipes-bsp/u-boot/u-boot_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_git.bb b/recipes-bsp/u-boot/u-boot_git.bb
index 022d7fc..2d39523 100644
--- a/recipes-bsp/u-boot/u-boot_git.bb
+++ b/recipes-bsp/u-boot/u-boot_git.bb
@@ -5,6 +5,7 @@ DEFAULT_PREFERENCE_ti814x = "-1"
 DEFAULT_PREFERENCE_ti816x = "-1"
 
 FILESPATHPKG =. "u-boot-git:"
+COMPATIBLE_MACHINE = "(beagleboard)"
 
 SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0001-OMAP3-Beagle-Pin-Mux-initialization-glitch-fix.patch \
-- 
1.7.4.1



