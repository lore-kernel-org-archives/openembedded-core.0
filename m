Received: from mout.gmx.net ([212.227.17.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1Tkreg-0003d3-3q
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 08:31:59 +0100
Received: from mailout-de.gmx.net ([10.1.76.70]) by mrigmx.server.lan
	(mrigmx002) with ESMTP (Nemesis) id 0MQKkE-1TfSw52FkS-00TmRw for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:04:37 +0100
Received: (qmail invoked by alias); 18 Dec 2012 07:04:37 -0000
Received: from unknown (EHLO pink.cheepee.homedns.org) [78.96.83.205]
	by mail.gmx.net (mp070) with SMTP; 18 Dec 2012 08:04:37 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX1/iQ1kQ6Arim30ZRMPOJnxtPmuwdw7nLoOz/dsHos
	Q38rtIRaNXes9K
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 09:04:15 +0200
Message-Id: <1355814255-1946-2-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1355814255-1946-1-git-send-email-cheepeero@gmx.net>
References: <20121215065958.GA3113@jama.jama.net>
	<1355814255-1946-1-git-send-email-cheepeero@gmx.net>
X-Y-GMX-Trusted: 0
Subject: [PATCH v3] packagegroup-base: use virtual runtime instead of keymap
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
X-List-Received-Date: Tue, 18 Dec 2012 07:31:59 -0000

This makes it consistent with packagegroup-core-base, and also avoids
unneeded dependencies towards sysvinit packages.
---
 .../packagegroups/packagegroup-base.bb             |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 347a7e1..4ab34bb 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -43,6 +43,9 @@ PACKAGES = ' \
 #
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+# Override by distro if needed
+VIRTUAL-RUNTIME_keymaps ?= "keymaps"
+
 #
 # packagegroup-base contain stuff needed for base system (machine related)
 #
@@ -141,7 +144,7 @@ RRECOMMENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
 SUMMARY_packagegroup-base-keyboard = "Keyboard support"
 RDEPENDS_packagegroup-base-keyboard = "\
-    keymaps"
+    ${VIRTUAL-RUNTIME_keymaps}"
 
 SUMMARY_packagegroup-base-pci = "PCI bus support"
 RDEPENDS_packagegroup-base-pci = "\
-- 
1.7.8.6



