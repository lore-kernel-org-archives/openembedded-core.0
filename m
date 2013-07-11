Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id DB1E460687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 00:56:42 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 02:56:37 +0200
Message-Id: <1373504197-9550-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/3] cogl-1.0: add option to enable GLES1
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
X-List-Received-Date: Thu, 11 Jul 2013 00:56:43 -0000

Only PACKAGECONFIG options for GL and GLES2 were available before.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index c0d410e..f2c1e26 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -17,6 +17,7 @@ AUTOTOOLS_AUXDIR = "${S}/build"
 
 # Extra DEPENDS for PACKAGECONFIG
 EDEPENDS_GL = "virtual/libgl libdrm"
+EDEPENDS_GLES1 = "virtual/libgles1"
 EDEPENDS_GLES2 = "virtual/libgles2"
 EDEPENDS_KMS = "libdrm virtual/egl"
 EDEPENDS_EGL = "virtual/egl"
@@ -26,6 +27,7 @@ EDEPENDS_WAYLAND = "wayland"
 # Extra RDEPENDS for PACKAGECONFIG
 # This has to be explictly listed, because cogl dlopens the backends
 ERDEPENDS_GL    = "libgl"
+ERDEPENDS_GLES1 = "libgles1"
 ERDEPENDS_GLES2 = "libgles2"
 
 EXTRA_OECONF += "--disable-introspection	\
@@ -38,6 +40,7 @@ PACKAGECONFIG[cogl-pango] = "--enable-cogl-pango,--disable-cogl-pango,pango"
 
 # GL flavours
 PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,${EDEPENDS_GL},${ERDEPENDS_GL}"
+PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,${EDEPENDS_GLES1}, ${ERDEPENDS_GLES1}"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
 
 # EGL backends
-- 
1.8.1.2


