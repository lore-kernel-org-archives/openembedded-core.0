Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 80AE677176
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:51:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 46F96608B77
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:51:23 +0100
Message-Id: <8356a5ea7fbfc8d60811e507aaee69d9798bf20b.1445010543.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445010332.git.joshua.lock@collabora.co.uk>
References: <cover.1445010332.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445010543.git.joshua.lock@collabora.co.uk>
References: <cover.1445010543.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 6/6] xserver-xorg: drop empty ${PN}-security-policy package
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
X-List-Received-Date: Fri, 16 Oct 2015 15:51:46 -0000

The SecurityPolicy hasn't been included since 2007[1] and the
last remnants were removed from the code base in 2010[2].

1. http://cgit.freedesktop.org/xorg/xserver/commit/?id=9d03cad1446c27b397c198cf6247e71e46bc9e6d
2. http://cgit.freedesktop.org/xorg/xserver/commit/?id=19d03d4f49e08442f58cf02240e3e6bab04633d2

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 30b3485..91df2b7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -44,8 +44,7 @@ DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 #          libextmod.so
 #          libdbe.so
 
-PACKAGES =+ "${PN}-security-policy \
-             ${PN}-sdl \
+PACKAGES =+ "${PN}-sdl \
              ${PN}-fbdev \
              ${PN}-xvfb \
              ${PN}-utils \
@@ -72,7 +71,7 @@ PACKAGES =+ "${PN}-security-policy \
 SUMMARY_xf86-video-modesetting = "X.Org X server -- modesetting display driver"
 INSANE_SKIP_xf86-video-modesetting = "xorg-driver-abi"
 
-XSERVER_RRECOMMENDS = "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config xkbcomp"
+XSERVER_RRECOMMENDS = "xkeyboard-config rgb xserver-xf86-config xkbcomp"
 RRECOMMENDS_${PN} += "${XSERVER_RRECOMMENDS}"
 RRECOMMENDS_${PN}-xwayland += "${XSERVER_RRECOMMENDS}"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
@@ -85,7 +84,6 @@ FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
                     ${libdir}/xorg/modules/*/.debug \
                     ${libdir}/xorg/modules/*/*/.debug \
                     "
-FILES_${PN}-security-policy += "${libdir}/xserver/SecurityPolicy"
 FILES_${PN}-sdl = "${bindir}/Xsdl"
 FILES_${PN}-fbdev = "${bindir}/Xfbdev"
 FILES_${PN}-xvfb = "${bindir}/Xvfb"
-- 
2.1.4


