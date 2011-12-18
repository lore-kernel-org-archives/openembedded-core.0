Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Rc5GH-0008S0-Cw
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Dec 2011 02:09:57 +0100
Received: (qmail invoked by alias); 18 Dec 2011 01:02:53 -0000
Received: from p5B0A29E7.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.41.231]
	by mail.gmx.net (mp011) with SMTP; 18 Dec 2011 02:02:53 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/nz0JGgDDnVxP0USqjT7rOw0Wlj7Rwk/0AQD5NLN
	h9RbSc3VxP7CpM
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 02:03:17 +0100
Message-Id: <1324170197-10720-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH] xorg-font-common.inc: break runtime dependency loop
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
X-List-Received-Date: Sun, 18 Dec 2011 01:09:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

required since opkg update [1]

[1] http://cgit.openembedded.org/openembedded-core/commit/?id=2feba313c991170747381c7cf821a45c2cd04632

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../xorg-font/xorg-font-common.inc                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index d93b4ee..5a8ae56 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -5,10 +5,10 @@ SECTION = "x11/fonts"
 LICENSE = "MIT-X"
 
 DEPENDS = " encodings font-alias font-util-native mkfontdir-native mkfontscale-native"
-RDEPENDS_${PN} = "encodings font-util font-alias"
+RRECOMMENDS_${PN} = "encodings font-util font-alias"
 
 XORG_PN = "${BPN}"
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.bz2"
 S = "${WORKDIR}/${XORG_PN}-${PV}"
-- 
1.7.4.4



