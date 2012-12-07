Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1TgzUU-0001Gc-LB
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 16:05:26 +0100
Received: (qmail invoked by alias); 07 Dec 2012 14:44:20 -0000
Received: from unknown (EHLO pink.cheepee.homedns.org) [78.96.83.205]
	by mail.gmx.net (mp072) with SMTP; 07 Dec 2012 15:44:20 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX19ysO8mc6JymGn8sPK1UeqEZgq0tvlIA/5E2qUqMt
	HhHVqDb+5f4JUM
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2012 16:44:15 +0200
Message-Id: <1354891455-6846-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.8.6
X-Y-GMX-Trusted: 0
Subject: [PATCH] packagroup-base: use virtual runtime instead of keymap
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
X-List-Received-Date: Fri, 07 Dec 2012 15:05:26 -0000

---
 .../packagegroups/packagegroup-base.bb             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 347a7e1..3e75190 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -141,7 +141,7 @@ RRECOMMENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
 SUMMARY_packagegroup-base-keyboard = "Keyboard support"
 RDEPENDS_packagegroup-base-keyboard = "\
-    keymaps"
+    ${VIRTUAL-RUNTIME_keymaps}"
 
 SUMMARY_packagegroup-base-pci = "PCI bus support"
 RDEPENDS_packagegroup-base-pci = "\
-- 
1.7.8.6



