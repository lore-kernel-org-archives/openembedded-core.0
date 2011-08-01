Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzmg-0000Ju-4d
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 23:12:22 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:08:01 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp045) with SMTP; 01 Aug 2011 23:08:01 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19RC25fBHpRf9w0iZ8++tRp7IA8bVREakUbIb1T99
	pPNv8Zj5gwslLg
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:10:54 +0200
Message-Id: <1312233054-8118-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [angstrom] xfce-base-image: Add image for xfce48 desktop image
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
X-List-Received-Date: Mon, 01 Aug 2011 21:12:22 -0000

* This patch requires patch series [1] to be committed in meta-oe

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034221.html

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes-angstrom/images/xfce-base-image.bb |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes-angstrom/images/xfce-base-image.bb

diff --git a/recipes-angstrom/images/xfce-base-image.bb b/recipes-angstrom/images/xfce-base-image.bb
new file mode 100644
index 0000000..80f5062
--- /dev/null
+++ b/recipes-angstrom/images/xfce-base-image.bb
@@ -0,0 +1,26 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+PR = "r0"
+
+require console-base-image.bb
+
+export IMAGE_BASENAME = "xfce-base-image"
+
+XSERVER ?= " \
+    xserver-xorg \
+    xf86-input-evdev \
+    xf86-input-mouse \
+    xf86-video-fbdev \
+    xf86-input-keyboard \
+"
+
+IMAGE_INSTALL += " \
+    ${XSERVER} \
+    task-base-extended \
+    task-xfce-base \
+    xserver-common \
+#    xserver-nodm-init \
+    ttf-dejavu-sans ttf-dejavu-sans-mono ttf-dejavu-common \
+"
+
+inherit image
-- 
1.7.4.4



