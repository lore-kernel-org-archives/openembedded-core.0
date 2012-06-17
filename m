Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SgDsr-0000mW-0N
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 13:43:09 +0200
Received: from localhost (83.252.253.85) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.245.1; Sun, 17 Jun 2012
	13:31:17 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jun 2012 13:31:46 +0200
Message-ID: <5b10b328ed39fd43464ed1f97fdc8964237252e7.1339932526.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1339932526.git.anders@chargestorm.se>
References: <cover.1339932526.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [oe-core, for-denzil][PATCH 1/1] qt4-embedded: fix QT_ARCH usage in QT_CONFIG_FLAGS
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
X-List-Received-Date: Sun, 17 Jun 2012 11:43:09 -0000
Content-Type: text/plain

After the change to shell style functions (from python style), the
ability to use oe_filter_out on QT_CONFIG_FLAGS got broken.

This patch solves that by referring to QT_ARCH in a more correct way.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 05803d1..9c5b4af 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -10,7 +10,7 @@ QT_BASE_LIB  ?= "libqt-embedded"
 SRC_URI += "file://qte.sh"
 
 QT_CONFIG_FLAGS += " \
-    -embedded ${QT_ARCH} \
+    -embedded $QT_ARCH \
     -qtlibinfix ${QT_LIBINFIX} \
     -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
-- 
1.7.10



