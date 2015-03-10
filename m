Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id EA38773689
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 22:05:11 +0000 (UTC)
Received: from [192.168.2.78] (helo=serenity.kc.loc)
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1YVSGy-0004hD-W7; Tue, 10 Mar 2015 23:05:09 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 23:04:56 +0100
Message-Id: <1426025096-24078-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.10.4
Cc: Florian Boor <florian@kernelconcepts.de>
Subject: [PATCH v2] directfb: Allow native builds of directfb 1.7.6
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
X-List-Received-Date: Tue, 10 Mar 2015 22:05:14 -0000

From: Florian Boor <florian@kernelconcepts.de>

Required by some DirectFB applications like dfbsee.

Signed-off-by: Florian Boor <florian@kernelconcepts.de>
---
 meta/recipes-graphics/directfb/directfb_1.7.6.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
index d25d987..7acb7e6 100644
--- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
@@ -19,3 +19,17 @@ LEAD_SONAME = "libdirectfb-1.7.so.0"
 
 SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
 SRC_URI[sha256sum] = "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
+
+BBCLASSEXTEND = "native"
+DEPENDS_class-native = "jpeg-native libpng-native"
+EXTRA_OECONF_class-native = "\
+  --enable-freetype=no \
+  --disable-zlib \
+  --with-gfxdrivers=none \
+  --disable-sdl \
+  --disable-vnc \
+  --disable-x11 \
+  --disable-imlib2 \
+  --disable-mesa \
+  --with-inputdrivers=none \
+"
-- 
1.7.10.4


