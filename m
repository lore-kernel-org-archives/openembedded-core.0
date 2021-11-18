X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
Subject: [PATCH] gstreamer1.0-plugins-base: add support for graphene
Date: Thu, 18 Nov 2021 22:33:00 +0100
Message-Id: <20211118213300.1300587-1-u.oelmann@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.18.5.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
index 5e2cca3864e7..180241828fe4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
@@ -43,6 +43,7 @@ X11DISABLEOPTS = "-Dx11=disabled -Dxvideo=disabled -Dxshm=disabled"
 
 PACKAGECONFIG[alsa]         = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
 PACKAGECONFIG[cdparanoia]   = "-Dcdparanoia=enabled,-Dcdparanoia=disabled,cdparanoia"
+PACKAGECONFIG[graphene]     = "-Dgl-graphene=enabled,-Dgl-graphene=disabled,graphene"
 PACKAGECONFIG[jpeg]         = "-Dgl-jpeg=enabled,-Dgl-jpeg=disabled,jpeg"
 PACKAGECONFIG[ogg]          = "-Dogg=enabled,-Dogg=disabled,libogg"
 PACKAGECONFIG[opus]         = "-Dopus=enabled,-Dopus=disabled,libopus"
@@ -71,7 +72,6 @@ OPENGL_WINSYS = "${@bb.utils.filter('PACKAGECONFIG', 'x11 gbm wayland dispmanx e
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-    -Dgl-graphene=disabled \
     ${@get_opengl_cmdline_list('gl_api', d.getVar('OPENGL_APIS'), d)} \
     ${@get_opengl_cmdline_list('gl_platform', d.getVar('OPENGL_PLATFORMS'), d)} \
     ${@get_opengl_cmdline_list('gl_winsys', d.getVar('OPENGL_WINSYS'), d)} \
-- 
2.30.2

