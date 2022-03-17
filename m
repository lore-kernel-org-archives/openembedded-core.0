X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: [PATCH] mesa: Fix libopencl-mesa-dev packaging
Date: Thu, 17 Mar 2022 11:29:15 +0100
Message-Id: <20220317102915.2467957-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>

From: Zoltán Böszörményi <zboszor@gmail.com>

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c6e85520f8..e8c07a4563 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -307,6 +307,7 @@ FILES:libglapi-dev = "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libgles3-mesa-dev = "${includedir}/GLES3"
+FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
 FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-- 
2.35.1

