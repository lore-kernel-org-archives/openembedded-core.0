Received: from mout.gmx.net ([212.227.15.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1TjgYw-0005vo-9J
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 02:29:16 +0100
Received: from mailout-de.gmx.net ([10.1.76.34]) by mrigmx.server.lan
	(mrigmx001) with ESMTP (Nemesis) id 0LpAT4-1TFrVq3oeq-00eptX for
	<openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2012 01:50:30 +0100
Received: (qmail invoked by alias); 15 Dec 2012 00:50:30 -0000
Received: from unknown (EHLO pink.cheepee.homedns.org) [78.96.83.205]
	by mail.gmx.net (mp034) with SMTP; 15 Dec 2012 01:50:30 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX1/y7RtKranyvYHn1zyaf5fcmukBLz4N/mhzRUfAFq
	OS1mOaQsQdwqhl
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 02:50:14 +0200
Message-Id: <1355532614-5923-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <4610754.7ihuexEZvz@helios>
References: <4610754.7ihuexEZvz@helios>
X-Y-GMX-Trusted: 0
Subject: [PATCH v2] packagegroup-base: use virtual runtime instead of keymap
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
X-List-Received-Date: Sat, 15 Dec 2012 01:29:16 -0000

This makes it consistent with packagegroup-core-base, and also avoids
unneeded dependencies towards sysvinit packages.
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



