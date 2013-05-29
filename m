Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8066098F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:30:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 5218EA621A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 23:30:50 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 23:30:47 +0200
Message-Id: <1369863047-3105-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.1.4
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: depend on gdk-pixbuf-native
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
X-List-Received-Date: Wed, 29 May 2013 21:30:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it's using scripts from scripts/postinst-intercepts/ which contain
gdk-pixbuf-query-loaders so it should depend on gdk-pixbuf-native
else the host binary will be used and it will try to update the
host's cache

[YOCTO #4572]

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
fix the same problem in dylan

 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 04db533..6c16a1a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -10,7 +10,7 @@ inherit gzipnative
 
 LICENSE = "MIT"
 PACKAGES = ""
-DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross"
+DEPENDS += "${MLPREFIX}qemuwrapper-cross ${MLPREFIX}depmodwrapper-cross gdk-pixbuf-native"
 RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
 RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
 
-- 
1.8.1.4


