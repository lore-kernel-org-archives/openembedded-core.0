Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B003A6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:07 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so665502pga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0OseQycrwKf6Dd7dIonMaVOUTsvwkHQO2IbVkaKzMnI=;
	b=FioSHjbZe8qjWB8sXnKE06nw0mP6CRLhZvOC/XE473VCzxgWPx76nXlOkvC8G4w68B
	pIvHRGsWI2Br6roYEeAUlyMyjrsSnaifqdaOSYnItYF34TAjSMKyXiqvj3m6IOhhQUAo
	pQUvGFLKYMeNwzg6bT3H21v3uNohMh5UkZOOXLbW4hpJlSpychXdaj4M3Ds0bVPmS88B
	50ZMrCQ+aAxsFopIWq7oIi7ahgYakyKN2S6+Jb/DNrDoWVpOEMy32Hlj8e/TLlHg0RKv
	E48te6QOTMys3QjlfMhmCwURovfKdLoJWKmE0X/KRSEMUb2rB4v2sZajrFPKr54gcCU7
	Izfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0OseQycrwKf6Dd7dIonMaVOUTsvwkHQO2IbVkaKzMnI=;
	b=mNV3fX8eOQo292L+91rz+rCSNDB35KS9HIDTVrqMdSv/nPKryOZZLOlUkinTzUEmjO
	mkKpcEyiKq1jvaS9/tj6YwtSAiSI1vy/OvhWV7cPM2m5nXnhdvAkAAR98c0cPwlwRjTv
	z6GQ1BLqO9DH6w7NcleSG7uDNiW03rlbJNcrrdYFTX1xA24lVFZvQDwZwsHo/XkwFzYX
	sJtyWb5CIurDUMSPNxoXD/YQ3QVpVeAK/xDbeNVaS7zBSJQRTQoe1yDd0wJg64umj8O1
	5upsGsad5HaKaMuoqoA7yv/HBj+HBGzNVimMiTNxGhcYIFttLiNHuo4dceegK1yD6GtK
	H3qA==
X-Gm-Message-State: AKaTC01/zfkshalPjmgxJG7mWPtbRUhXHJLqtkpVlDznMZXO7SWQitTfoCL8PuFePQ7ZWg==
X-Received: by 10.98.86.157 with SMTP id h29mr79326309pfj.25.1481252287770;
	Thu, 08 Dec 2016 18:58:07 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:57:54 -0800
Message-Id: <20161209025801.20775-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 1/8] gstreamer1.0: Upgrade to 1.10.1
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove backported patches and upstreamed ones
Drop --disable-trace its no more in 1.10.x

Add packageconfig option for kms, keep it disabled by default
in bad plugins recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...libav_1.8.3.bb => gstreamer1.0-libav_1.10.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   1 +
 ...-don-t-hardcode-libtool-name-when-running.patch |  35 +-
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  15 +-
 ...lplugin-enable-gldeinterlace-on-OpenGL-ES.patch | 634 ---------------------
 ...ert-implement-multiple-render-targets-for.patch | 244 --------
 ...ert-don-t-use-the-predefined-variable-nam.patch |  32 --
 .../0005-glshader-add-glBindFragDataLocation.patch |  77 ---
 ...ert-GLES3-deprecates-texture2D-and-it-doe.patch |  51 --
 .../0008-gl-implement-GstGLMemoryEGL.patch         | 495 ----------------
 ...valid-sentinels-for-gst_structure_get-etc.patch |  59 +-
 ...1.8.3.bb => gstreamer1.0-plugins-bad_1.10.1.bb} |  10 +-
 ....8.3.bb => gstreamer1.0-plugins-base_1.10.1.bb} |   5 +-
 ....8.3.bb => gstreamer1.0-plugins-good_1.10.1.bb} |   5 +-
 ....8.3.bb => gstreamer1.0-plugins-ugly_1.10.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb   |   6 +
 .../gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb    |   6 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 -
 ...streamer1.0_1.8.3.bb => gstreamer1.0_1.10.1.bb} |   5 +-
 19 files changed, 69 insertions(+), 1622 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.8.3.bb => gstreamer1.0-libav_1.10.1.bb} (86%)
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.8.3.bb => gstreamer1.0-plugins-bad_1.10.1.bb} (64%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.8.3.bb => gstreamer1.0-plugins-base_1.10.1.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.8.3.bb => gstreamer1.0-plugins-good_1.10.1.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.8.3.bb => gstreamer1.0-plugins-ugly_1.10.1.bb} (76%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.8.3.bb => gstreamer1.0_1.10.1.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
index 3d86221..98f5a50 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
@@ -13,8 +13,7 @@ SRC_URI = " \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
-
-SRC_URI[md5sum] = "b51a736147bacb40f85827a4e0ae0d2c"
-SRC_URI[sha256sum] = "9006a05990089f7155ee0e848042f6bb24e52ab1d0a59ff8d1b5d7e33001a495"
+SRC_URI[md5sum] = "9dc8fb8dd01818c27230a1ed6ba9f4de"
+SRC_URI[sha256sum] = "27b28b8de0e6dff1e3952428e8ed8ba4a12f452f789ac0ae9bbe50f00a5c72c7"
 
 S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 0fe5564..d26a6a9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -42,6 +42,7 @@ PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
 # ensure OpenSSL is used for HLS AES description instead of nettle
 # (OpenSSL is a shared dependency with dtls)
 PACKAGECONFIG[hls]             = "--enable-hls --with-hls-crypto=openssl,--disable-hls,openssl"
+PACKAGECONFIG[kms]             = "--enable-kms,--disable-kms,libdrm"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 33efc50..43f1ee0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -13,24 +13,24 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  gst-libs/gst/mpegts/Makefile.am    | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/gst-libs/gst/gl/Makefile.am b/gst-libs/gst/gl/Makefile.am
-index f968357..7cc2c7a 100644
---- a/gst-libs/gst/gl/Makefile.am
-+++ b/gst-libs/gst/gl/Makefile.am
-@@ -167,7 +167,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstgl-@GST_API_VERSION@
- 		--library=libgstgl-@GST_API_VERSION@.la \
+Index: gst-plugins-bad-1.10.1/gst-libs/gst/gl/Makefile.am
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/gst-libs/gst/gl/Makefile.am
++++ gst-plugins-bad-1.10.1/gst-libs/gst/gl/Makefile.am
+@@ -171,7 +171,7 @@ GstGL-@GST_API_VERSION@.gir: $(INTROSPEC
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
+ 		--include=GstVideo-@GST_API_VERSION@ \
 -		--libtool="$(top_builddir)/libtool" \
 +		--libtool="$(LIBTOOL)" \
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-base-@GST_API_VERSION@ \
  		--pkg gstreamer-video-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/insertbin/Makefile.am b/gst-libs/gst/insertbin/Makefile.am
-index 09eb97c..b746885 100644
---- a/gst-libs/gst/insertbin/Makefile.am
-+++ b/gst-libs/gst/insertbin/Makefile.am
-@@ -44,7 +44,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstinsertbin-@GS
+Index: gst-plugins-bad-1.10.1/gst-libs/gst/insertbin/Makefile.am
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/gst-libs/gst/insertbin/Makefile.am
++++ gst-plugins-bad-1.10.1/gst-libs/gst/insertbin/Makefile.am
+@@ -45,7 +45,7 @@ GstInsertBin-@GST_API_VERSION@.gir: $(IN
  		--library=libgstinsertbin-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
@@ -39,11 +39,11 @@ index 09eb97c..b746885 100644
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-base-@GST_API_VERSION@ \
  		--pkg-export gstreamer-insertbin-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/mpegts/Makefile.am b/gst-libs/gst/mpegts/Makefile.am
-index 2511d49..c1cbce6 100644
---- a/gst-libs/gst/mpegts/Makefile.am
-+++ b/gst-libs/gst/mpegts/Makefile.am
-@@ -78,7 +78,7 @@ GstMpegts-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstmpegts-@GST_API_
+Index: gst-plugins-bad-1.10.1/gst-libs/gst/mpegts/Makefile.am
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/gst-libs/gst/mpegts/Makefile.am
++++ gst-plugins-bad-1.10.1/gst-libs/gst/mpegts/Makefile.am
+@@ -79,7 +79,7 @@ GstMpegts-@GST_API_VERSION@.gir: $(INTRO
  		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-video-@GST_API_VERSION@` \
  		--library=libgstmpegts-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
@@ -52,6 +52,3 @@ index 2511d49..c1cbce6 100644
  		--pkg gstreamer-@GST_API_VERSION@ \
  		--pkg gstreamer-video-@GST_API_VERSION@ \
  		--pkg-export gstreamer-mpegts-@GST_API_VERSION@ \
--- 
-2.6.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
index e81b065..9fc91d8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch
@@ -12,16 +12,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  pkgconfig/gstreamer-gl.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/pkgconfig/gstreamer-gl.pc.in b/pkgconfig/gstreamer-gl.pc.in
-index 5589e2a..b986450 100644
---- a/pkgconfig/gstreamer-gl.pc.in
-+++ b/pkgconfig/gstreamer-gl.pc.in
+Index: gst-plugins-bad-1.10.1/pkgconfig/gstreamer-gl.pc.in
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/pkgconfig/gstreamer-gl.pc.in
++++ gst-plugins-bad-1.10.1/pkgconfig/gstreamer-gl.pc.in
 @@ -10,4 +10,4 @@ Version: @VERSION@
  Requires: gstreamer-base-@GST_API_VERSION@ gstreamer-@GST_API_VERSION@
  
  Libs: -L${libdir} -lgstgl-@GST_API_VERSION@ @GL_LIBS@
--Cflags: -I${includedir} @GL_CFLAGS@
-+Cflags: -I${includedir}
--- 
-2.7.0
-
+-Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include @GL_CFLAGS@
++Cflags: -I${includedir} -I${libdir}/gstreamer-@GST_API_VERSION@/include
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
deleted file mode 100755
index 51f4eb4..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
+++ /dev/null
@@ -1,634 +0,0 @@
-From 8a0e97f7e672301cc76e394855e8c7a3448b0249 Mon Sep 17 00:00:00 2001
-From: Haihua Hu <jared.hu@nxp.com>
-Date: Fri, 8 Apr 2016 16:47:15 +0800
-Subject: [PATCH 4/6] [glplugin] enable gldeinterlace on OpenGL ES
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-1.Porting the exist deinterlace shader and OpenGL callback
-  to be compatible with OpenGL ES.
-2.Add a our blur vertical shader to gldeinterlace.
-3.Add a property named “method” to let user choose which
-  deinterlace function to use. Default to choose blur vertical
-  method for better performance.
-
-Upstream-Status: Backport [1.9.1]
-
-https://bugzilla.gnome.org/show_bug.cgi?id=764873
-
-Signed-off-by: Haihua Hu <jared.hu@nxp.com>
----
- ext/gl/Makefile.am        |   4 +-
- ext/gl/gstgldeinterlace.c | 344 +++++++++++++++++++++++++++++++++++-----------
- ext/gl/gstgldeinterlace.h |   6 +-
- ext/gl/gstopengl.c        |  13 +-
- 4 files changed, 275 insertions(+), 92 deletions(-)
-
-diff --git a/ext/gl/Makefile.am b/ext/gl/Makefile.am
-index 5d55f54..46419a7 100644
---- a/ext/gl/Makefile.am
-+++ b/ext/gl/Makefile.am
-@@ -40,6 +40,7 @@ libgstopengl_la_SOURCES = \
- 	gstglfilterapp.c \
- 	gstglviewconvert.c \
- 	gstglstereosplit.c \
-+	gstgldeinterlace.c \
- 	gstglstereomix.c
- 
- noinst_HEADERS = \
-@@ -63,20 +64,19 @@ noinst_HEADERS = \
- 	gstglfilterapp.h \
- 	gstglstereosplit.h \
- 	gstglstereomix.h \
-+	gstgldeinterlace.h \
- 	gstglviewconvert.h
- 
- # full opengl required
- if USE_OPENGL
- libgstopengl_la_SOURCES += \
- 	gstglfilterglass.c \
--	gstgldeinterlace.c \
- 	gltestsrc.c \
- 	gstgltestsrc.c \
- 	gstglmosaic.c
- 
- noinst_HEADERS += \
- 	gstglfilterglass.h \
--	gstgldeinterlace.h \
- 	gltestsrc.h \
- 	gstgltestsrc.h \
- 	gstglmosaic.h \
-diff --git a/ext/gl/gstgldeinterlace.c b/ext/gl/gstgldeinterlace.c
-index bd0eff0..c1250dc 100644
---- a/ext/gl/gstgldeinterlace.c
-+++ b/ext/gl/gstgldeinterlace.c
-@@ -43,7 +43,8 @@ GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
- 
- enum
- {
--  PROP_0
-+  PROP_0,
-+  PROP_METHOD
- };
- 
- #define DEBUG_INIT \
-@@ -57,17 +58,23 @@ static void gst_gl_deinterlace_set_property (GObject * object,
- static void gst_gl_deinterlace_get_property (GObject * object,
-     guint prop_id, GValue * value, GParamSpec * pspec);
- 
-+static gboolean gst_gl_deinterlace_start (GstBaseTransform * trans);
- static gboolean gst_gl_deinterlace_reset (GstBaseTransform * trans);
--static gboolean gst_gl_deinterlace_init_shader (GstGLFilter * filter);
-+static gboolean gst_gl_deinterlace_init_fbo (GstGLFilter * filter);
- static gboolean gst_gl_deinterlace_filter (GstGLFilter * filter,
-     GstBuffer * inbuf, GstBuffer * outbuf);
- static gboolean gst_gl_deinterlace_filter_texture (GstGLFilter * filter,
-     guint in_tex, guint out_tex);
--static void gst_gl_deinterlace_callback (gint width, gint height,
-+static void gst_gl_deinterlace_vfir_callback (gint width, gint height,
-+    guint texture, gpointer stuff);
-+static void gst_gl_deinterlace_greedyh_callback (gint width, gint height,
-     guint texture, gpointer stuff);
- 
- /* *INDENT-OFF* */
- static const gchar *greedyh_fragment_source =
-+  "#ifdef GL_ES\n"
-+  "precision mediump float;\n"
-+  "#endif\n"
-   "uniform sampler2D tex;\n"
-   "uniform sampler2D tex_prev;\n"
-   "uniform float max_comb;\n"
-@@ -75,35 +82,35 @@ static const gchar *greedyh_fragment_source =
-   "uniform float motion_sense;\n"
-   "uniform float width;\n"
-   "uniform float height;\n"
-+  "varying vec2 v_texcoord;\n"
- 
-   "void main () {\n"
--  "  vec2 texcoord = gl_TexCoord[0].xy;\n"
--  "  if (int(mod(texcoord.y * height, 2.0)) == 0) {\n"
--  "    gl_FragColor = vec4(texture2D(tex_prev, texcoord).rgb, 1.0);\n"
-+  "  if (int(mod(v_texcoord.y * height, 2.0)) == 0) {\n"
-+  "    gl_FragColor = vec4(texture2D(tex_prev, v_texcoord).rgb, 1.0);\n"
-   "  } else {\n"
-   "    vec2 texcoord_L1_a1, texcoord_L3_a1, texcoord_L1, texcoord_L3, texcoord_L1_1, texcoord_L3_1;\n"
-   "    vec3 L1_a1, L3_a1, L1, L3, L1_1, L3_1;\n"
- 
--  "    texcoord_L1 = vec2(texcoord.x, texcoord.y - 1.0 / height);\n"
--  "    texcoord_L3 = vec2(texcoord.x, texcoord.y + 1.0 / height);\n"
-+  "    texcoord_L1 = vec2(v_texcoord.x, v_texcoord.y - 1.0 / height);\n"
-+  "    texcoord_L3 = vec2(v_texcoord.x, v_texcoord.y + 1.0 / height);\n"
-   "    L1 = texture2D(tex_prev, texcoord_L1).rgb;\n"
-   "    L3 = texture2D(tex_prev, texcoord_L3).rgb;\n"
--  "    if (texcoord.x == 1.0 && texcoord.y == 1.0) {\n"
-+  "    if (v_texcoord.x == 1.0 && v_texcoord.y == 1.0) {\n"
-   "      L1_1 = L1;\n"
-   "      L3_1 = L3;\n"
-   "    } else {\n"
--  "      texcoord_L1_1 = vec2(texcoord.x + 1.0 / width, texcoord.y - 1.0 / height);\n"
--  "      texcoord_L3_1 = vec2(texcoord.x + 1.0 / width, texcoord.y + 1.0 / height);\n"
-+  "      texcoord_L1_1 = vec2(v_texcoord.x + 1.0 / width, v_texcoord.y - 1.0 / height);\n"
-+  "      texcoord_L3_1 = vec2(v_texcoord.x + 1.0 / width, v_texcoord.y + 1.0 / height);\n"
-   "      L1_1 = texture2D(tex_prev, texcoord_L1_1).rgb;\n"
-   "      L3_1 = texture2D(tex_prev, texcoord_L3_1).rgb;\n"
-   "    }\n"
- 
--  "    if (int(ceil(texcoord.x + texcoord.y)) == 0) {\n"
-+  "    if (int(ceil(v_texcoord.x + v_texcoord.y)) == 0) {\n"
-   "      L1_a1 = L1;\n"
-   "      L3_a1 = L3;\n"
-   "    } else {\n"
--  "      texcoord_L1_a1 = vec2(texcoord.x - 1.0 / width, texcoord.y - 1.0 / height);\n"
--  "      texcoord_L3_a1 = vec2(texcoord.x - 1.0 / width, texcoord.y + 1.0 / height);\n"
-+  "      texcoord_L1_a1 = vec2(v_texcoord.x - 1.0 / width, v_texcoord.y - 1.0 / height);\n"
-+  "      texcoord_L3_a1 = vec2(v_texcoord.x - 1.0 / width, v_texcoord.y + 1.0 / height);\n"
-   "      L1_a1 = texture2D(tex_prev, texcoord_L1_a1).rgb;\n"
-   "      L3_a1 = texture2D(tex_prev, texcoord_L3_a1).rgb;\n"
-   "    }\n"
-@@ -113,8 +120,8 @@ static const gchar *greedyh_fragment_source =
-   "    vec3 avg_1 = (L1_1 + L3_1) / 2.0;\n"
-   "    vec3 avg_s = (avg_a1 + avg_1) / 2.0;\n"
-   "    vec3 avg_sc = (avg_s + avg) / 2.0;\n"
--  "    vec3 L2 = texture2D(tex, texcoord).rgb;\n"
--  "    vec3 LP2 = texture2D(tex_prev, texcoord).rgb;\n"
-+  "    vec3 L2 = texture2D(tex, v_texcoord).rgb;\n"
-+  "    vec3 LP2 = texture2D(tex_prev, v_texcoord).rgb;\n"
-   "    vec3 best;\n"
-   "    if (abs(L2.r - avg_sc.r) < abs(LP2.r - avg_sc.r)) {\n"
-   "      best.r = L2.r;\n" "    } else {\n"
-@@ -144,8 +151,87 @@ static const gchar *greedyh_fragment_source =
-   "    gl_FragColor = vec4(last, 1.0);\n"
-   "  }\n"
-   "}\n";
-+
-+const gchar *vfir_fragment_source =
-+  "#ifdef GL_ES\n"
-+  "precision mediump float;\n"
-+  "#endif\n"
-+  "uniform sampler2D tex;\n"
-+  "uniform float width;\n"
-+  "uniform float height;\n"
-+  "varying vec2 v_texcoord;\n"
-+  "void main()\n"
-+  "{\n"
-+  "  vec2 topcoord, botcoord;\n"
-+  "  vec4 cur_color, top_color, bot_color;\n"
-+  "  topcoord.x = v_texcoord.x;\n"
-+  "  botcoord.x = v_texcoord.x;\n"
-+  "  if (v_texcoord.y == 0.0 || v_texcoord.y == 1.0) {\n"
-+  "    topcoord.y = v_texcoord.y ;\n"
-+  "    botcoord.y = v_texcoord.y ;\n"
-+  "  }\n"
-+  "  else {\n"
-+  "    topcoord.y = v_texcoord.y - 1.0/height;\n"
-+  "    botcoord.y = v_texcoord.y + 1.0/height;\n"
-+  "  }\n"
-+  "  cur_color = texture2D(tex, v_texcoord);\n"
-+  "  top_color = texture2D(tex, topcoord);\n"
-+  "  bot_color = texture2D(tex, botcoord);\n"
-+  "  gl_FragColor = 0.5*cur_color + 0.25*top_color + 0.25*bot_color;\n"
-+  "}";
- /* *INDENT-ON* */
- 
-+/* dont' forget to edit the following when a new method is added */
-+typedef enum
-+{
-+  GST_GL_DEINTERLACE_VFIR,
-+  GST_GL_DEINTERLACE_GREEDYH
-+} GstGLDeinterlaceMethod;
-+
-+static const GEnumValue *
-+gst_gl_deinterlace_get_methods (void)
-+{
-+  static const GEnumValue method_types[] = {
-+    {GST_GL_DEINTERLACE_VFIR, "Blur Vertical", "vfir"},
-+    {GST_GL_DEINTERLACE_GREEDYH, "Motion Adaptive: Advanced Detection",
-+          "greedhy"},
-+    {0, NULL, NULL}
-+  };
-+  return method_types;
-+}
-+
-+#define GST_TYPE_GL_DEINTERLACE_METHODS (gst_gl_deinterlace_method_get_type ())
-+static GType
-+gst_gl_deinterlace_method_get_type (void)
-+{
-+  static GType gl_deinterlace_method_type = 0;
-+  if (!gl_deinterlace_method_type) {
-+    gl_deinterlace_method_type =
-+        g_enum_register_static ("GstGLDeinterlaceMethod",
-+        gst_gl_deinterlace_get_methods ());
-+  }
-+  return gl_deinterlace_method_type;
-+}
-+
-+static void
-+gst_gl_deinterlace_set_method (GstGLDeinterlace * deinterlace,
-+    guint method_types)
-+{
-+  switch (method_types) {
-+    case GST_GL_DEINTERLACE_VFIR:
-+      deinterlace->deinterlacefunc = gst_gl_deinterlace_vfir_callback;
-+      deinterlace->current_method = method_types;
-+      break;
-+    case GST_GL_DEINTERLACE_GREEDYH:
-+      deinterlace->deinterlacefunc = gst_gl_deinterlace_greedyh_callback;
-+      deinterlace->current_method = method_types;
-+      break;
-+    default:
-+      g_assert_not_reached ();
-+      break;
-+  }
-+}
-+
- static void
- gst_gl_deinterlace_class_init (GstGLDeinterlaceClass * klass)
- {
-@@ -163,25 +249,60 @@ gst_gl_deinterlace_class_init (GstGLDeinterlaceClass * klass)
-       "Deinterlacing based on fragment shaders",
-       "Julien Isorce <julien.isorce@mail.com>");
- 
-+  g_object_class_install_property (gobject_class,
-+      PROP_METHOD,
-+      g_param_spec_enum ("method",
-+          "Deinterlace Method",
-+          "Select which deinterlace method apply to GL video texture",
-+          GST_TYPE_GL_DEINTERLACE_METHODS,
-+          GST_GL_DEINTERLACE_VFIR, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
-+
-+  GST_BASE_TRANSFORM_CLASS (klass)->start = gst_gl_deinterlace_start;
-   GST_BASE_TRANSFORM_CLASS (klass)->stop = gst_gl_deinterlace_reset;
- 
-   GST_GL_FILTER_CLASS (klass)->filter = gst_gl_deinterlace_filter;
-   GST_GL_FILTER_CLASS (klass)->filter_texture =
-       gst_gl_deinterlace_filter_texture;
--  GST_GL_FILTER_CLASS (klass)->init_fbo = gst_gl_deinterlace_init_shader;
-+  GST_GL_FILTER_CLASS (klass)->init_fbo = gst_gl_deinterlace_init_fbo;
- 
--  GST_GL_BASE_FILTER_CLASS (klass)->supported_gl_api = GST_GL_API_OPENGL;
-+  GST_GL_BASE_FILTER_CLASS (klass)->supported_gl_api =
-+      GST_GL_API_OPENGL | GST_GL_API_GLES2 | GST_GL_API_OPENGL3;
- }
- 
- static void
- gst_gl_deinterlace_init (GstGLDeinterlace * filter)
- {
--  filter->shader = NULL;
-+  filter->shaderstable = NULL;
-+  filter->deinterlacefunc = gst_gl_deinterlace_vfir_callback;
-+  filter->current_method = GST_GL_DEINTERLACE_VFIR;
-   filter->prev_buffer = NULL;
-   filter->prev_tex = 0;
- }
- 
- static gboolean
-+gst_gl_deinterlace_start (GstBaseTransform * trans)
-+{
-+  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (trans);
-+
-+  deinterlace_filter->shaderstable = g_hash_table_new (g_str_hash, g_str_equal);
-+
-+  return GST_BASE_TRANSFORM_CLASS (parent_class)->start (trans);
-+}
-+
-+static void
-+gst_gl_deinterlace_ghash_func_clean (gpointer key, gpointer value,
-+    gpointer data)
-+{
-+  GstGLShader *shader = (GstGLShader *) value;
-+  GstGLFilter *filter = (GstGLFilter *) data;
-+
-+  //blocking call, wait the opengl thread has destroyed the shader
-+  gst_gl_context_del_shader (GST_GL_BASE_FILTER (filter)->context, shader);
-+
-+  value = NULL;
-+}
-+
-+static gboolean
- gst_gl_deinterlace_reset (GstBaseTransform * trans)
- {
-   GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (trans);
-@@ -189,10 +310,17 @@ gst_gl_deinterlace_reset (GstBaseTransform * trans)
-   gst_buffer_replace (&deinterlace_filter->prev_buffer, NULL);
- 
-   //blocking call, wait the opengl thread has destroyed the shader
--  if (deinterlace_filter->shader)
--    gst_gl_context_del_shader (GST_GL_BASE_FILTER (trans)->context,
--        deinterlace_filter->shader);
--  deinterlace_filter->shader = NULL;
-+  if (deinterlace_filter->shaderstable) {
-+    /* release shaders in the gl thread */
-+    g_hash_table_foreach (deinterlace_filter->shaderstable,
-+        gst_gl_deinterlace_ghash_func_clean, deinterlace_filter);
-+
-+    /* clean the htable without calling values destructors
-+     * because shaders have been released in the glthread
-+     * through the foreach func */
-+    g_hash_table_unref (deinterlace_filter->shaderstable);
-+    deinterlace_filter->shaderstable = NULL;
-+  }
- 
-   return GST_BASE_TRANSFORM_CLASS (parent_class)->stop (trans);
- }
-@@ -201,9 +329,12 @@ static void
- gst_gl_deinterlace_set_property (GObject * object, guint prop_id,
-     const GValue * value, GParamSpec * pspec)
- {
--  //GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
-+  GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
- 
-   switch (prop_id) {
-+    case PROP_METHOD:
-+      gst_gl_deinterlace_set_method (filter, g_value_get_enum (value));
-+      break;
-     default:
-       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
-       break;
-@@ -214,9 +345,12 @@ static void
- gst_gl_deinterlace_get_property (GObject * object, guint prop_id,
-     GValue * value, GParamSpec * pspec)
- {
--  //GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
-+  GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
- 
-   switch (prop_id) {
-+    case PROP_METHOD:
-+      g_value_set_enum (value, filter->current_method);
-+      break;
-     default:
-       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
-       break;
-@@ -224,13 +358,9 @@ gst_gl_deinterlace_get_property (GObject * object, guint prop_id,
- }
- 
- static gboolean
--gst_gl_deinterlace_init_shader (GstGLFilter * filter)
-+gst_gl_deinterlace_init_fbo (GstGLFilter * filter)
- {
--  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
--
--  //blocking call, wait the opengl thread has compiled the shader
--  return gst_gl_context_gen_shader (GST_GL_BASE_FILTER (filter)->context, 0,
--      greedyh_fragment_source, &deinterlace_filter->shader);
-+  return TRUE;
- }
- 
- static gboolean
-@@ -241,7 +371,7 @@ gst_gl_deinterlace_filter_texture (GstGLFilter * filter, guint in_tex,
- 
-   //blocking call, use a FBO
-   gst_gl_filter_render_to_target (filter, TRUE, in_tex, out_tex,
--      gst_gl_deinterlace_callback, deinterlace_filter);
-+      deinterlace_filter->deinterlacefunc, deinterlace_filter);
- 
-   return TRUE;
- }
-@@ -259,36 +389,104 @@ gst_gl_deinterlace_filter (GstGLFilter * filter, GstBuffer * inbuf,
-   return TRUE;
- }
- 
--//opengl scene, params: input texture (not the output filter->texture)
-+static GstGLShader *
-+gst_gl_deinterlace_get_fragment_shader (GstGLFilter * filter,
-+    const gchar * shader_name, const gchar * shader_source)
-+{
-+  GstGLShader *shader = NULL;
-+  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
-+  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
-+
-+  shader = g_hash_table_lookup (deinterlace_filter->shaderstable, shader_name);
-+
-+  if (!shader) {
-+    GError *error = NULL;
-+
-+    if (!(shader = gst_gl_shader_new_link_with_stages (context, &error,
-+                gst_glsl_stage_new_default_vertex (context),
-+                gst_glsl_stage_new_with_string (context, GL_FRAGMENT_SHADER,
-+                    GST_GLSL_VERSION_NONE,
-+                    GST_GLSL_PROFILE_ES | GST_GLSL_PROFILE_COMPATIBILITY,
-+                    shader_source), NULL))) {
-+      GST_ELEMENT_ERROR (deinterlace_filter, RESOURCE, NOT_FOUND,
-+          ("Failed to initialize %s shader", shader_name), (NULL));
-+    }
-+
-+    filter->draw_attr_position_loc =
-+        gst_gl_shader_get_attribute_location (shader, "a_position");
-+    filter->draw_attr_texture_loc =
-+        gst_gl_shader_get_attribute_location (shader, "a_texcoord");
-+  }
-+
-+  g_hash_table_insert (deinterlace_filter->shaderstable, (gchar *) shader_name,
-+      shader);
-+
-+  return shader;
-+}
-+
- static void
--gst_gl_deinterlace_callback (gint width, gint height, guint texture,
-+gst_gl_deinterlace_vfir_callback (gint width, gint height, guint texture,
-     gpointer stuff)
- {
--  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (stuff);
-+  GstGLShader *shader;
-   GstGLFilter *filter = GST_GL_FILTER (stuff);
--  GstGLFuncs *gl = GST_GL_BASE_FILTER (filter)->context->gl_vtable;
-+  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
-+  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
-+  GstGLFuncs *gl = context->gl_vtable;
-+
-+  shader = gst_gl_deinterlace_get_fragment_shader (deinterlace_filter, "vfir",
-+      vfir_fragment_source);
-+
-+  if (!shader)
-+    return;
-+
-+#if GST_GL_HAVE_OPENGL
-+  if (USING_OPENGL (context)) {
-+    gl->MatrixMode (GL_PROJECTION);
-+    gl->LoadIdentity ();
-+  }
-+#endif
-+
-+  gst_gl_shader_use (shader);
-+
-+  gl->ActiveTexture (GL_TEXTURE0);
-+  gl->BindTexture (GL_TEXTURE_2D, texture);
-+
-+  gst_gl_shader_set_uniform_1i (shader, "tex", 0);
-+  gst_gl_shader_set_uniform_1f (shader, "width",
-+      GST_VIDEO_INFO_WIDTH (&filter->out_info));
-+  gst_gl_shader_set_uniform_1f (shader, "height",
-+      GST_VIDEO_INFO_HEIGHT (&filter->out_info));
-+
-+  gst_gl_filter_draw_texture (filter, texture, width, height);
-+}
-+
-+static void
-+gst_gl_deinterlace_greedyh_callback (gint width, gint height, guint texture,
-+    gpointer stuff)
-+{
-+  GstGLShader *shader;
-+  GstGLFilter *filter = GST_GL_FILTER (stuff);
-+  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
-+  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
-+  GstGLFuncs *gl = context->gl_vtable;
-   guint temp;
- 
--  GLfloat verts[] = { -1.0, -1.0,
--    1.0, -1.0,
--    1.0, 1.0,
--    -1.0, 1.0
--  };
--  GLfloat texcoords0[] = { 0.0f, 0.0f,
--    1.0f, 0.0f,
--    1.0f, 1.0f,
--    0.0f, 1.0f
--  };
--  GLfloat texcoords1[] = { 0.0f, 0.0f,
--    1.0f, 0.0f,
--    1.0f, 1.0f,
--    0.0f, 1.0f
--  };
-+  shader =
-+      gst_gl_deinterlace_get_fragment_shader (deinterlace_filter, "greedhy",
-+      greedyh_fragment_source);
- 
--  gl->MatrixMode (GL_PROJECTION);
--  gl->LoadIdentity ();
-+  if (!shader)
-+    return;
- 
--  gst_gl_shader_use (deinterlace_filter->shader);
-+#if GST_GL_HAVE_OPENGL
-+  if (USING_OPENGL (context)) {
-+    gl->MatrixMode (GL_PROJECTION);
-+    gl->LoadIdentity ();
-+  }
-+#endif
-+
-+  gst_gl_shader_use (shader);
- 
-   if (G_UNLIKELY (deinterlace_filter->prev_tex == 0)) {
-     gst_gl_context_gen_texture (GST_GL_BASE_FILTER (filter)->context,
-@@ -298,44 +496,24 @@ gst_gl_deinterlace_callback (gint width, gint height, guint texture,
-         GST_VIDEO_INFO_HEIGHT (&filter->out_info));
-   } else {
-     gl->ActiveTexture (GL_TEXTURE1);
--    gst_gl_shader_set_uniform_1i (deinterlace_filter->shader, "tex_prev", 1);
-+    gst_gl_shader_set_uniform_1i (shader, "tex_prev", 1);
-     gl->BindTexture (GL_TEXTURE_2D, deinterlace_filter->prev_tex);
-   }
- 
-   gl->ActiveTexture (GL_TEXTURE0);
--  gst_gl_shader_set_uniform_1i (deinterlace_filter->shader, "tex", 0);
-+  gl->BindTexture (GL_TEXTURE_2D, texture);
- 
--  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "max_comb",
--      5.0f / 255.0f);
--  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "motion_threshold",
--      25.0f / 255.0f);
--  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "motion_sense",
--      30.0f / 255.0f);
-+  gst_gl_shader_set_uniform_1i (shader, "tex", 0);
-+  gst_gl_shader_set_uniform_1f (shader, "max_comb", 5.0f / 255.0f);
-+  gst_gl_shader_set_uniform_1f (shader, "motion_threshold", 25.0f / 255.0f);
-+  gst_gl_shader_set_uniform_1f (shader, "motion_sense", 30.0f / 255.0f);
- 
--  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "width",
-+  gst_gl_shader_set_uniform_1f (shader, "width",
-       GST_VIDEO_INFO_WIDTH (&filter->out_info));
--  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "height",
-+  gst_gl_shader_set_uniform_1f (shader, "height",
-       GST_VIDEO_INFO_HEIGHT (&filter->out_info));
- 
--  gl->ClientActiveTexture (GL_TEXTURE0);
--
--  gl->EnableClientState (GL_TEXTURE_COORD_ARRAY);
--  gl->EnableClientState (GL_VERTEX_ARRAY);
--
--  gl->VertexPointer (2, GL_FLOAT, 0, &verts);
--  gl->TexCoordPointer (2, GL_FLOAT, 0, &texcoords0);
--
--  gl->ClientActiveTexture (GL_TEXTURE1);
--  gl->EnableClientState (GL_TEXTURE_COORD_ARRAY);
--  gl->TexCoordPointer (2, GL_FLOAT, 0, &texcoords1);
--
--  gl->DrawArrays (GL_TRIANGLE_FAN, 0, 4);
--
--  gl->DisableClientState (GL_VERTEX_ARRAY);
--  gl->DisableClientState (GL_TEXTURE_COORD_ARRAY);
--
--  gl->ClientActiveTexture (GL_TEXTURE0);
--  gl->DisableClientState (GL_TEXTURE_COORD_ARRAY);
-+  gst_gl_filter_draw_texture (filter, texture, width, height);
- 
-   if (texture == filter->in_tex_id) {
-     temp = filter->in_tex_id;
-diff --git a/ext/gl/gstgldeinterlace.h b/ext/gl/gstgldeinterlace.h
-index a81a2e7..58a9c0c 100644
---- a/ext/gl/gstgldeinterlace.h
-+++ b/ext/gl/gstgldeinterlace.h
-@@ -38,9 +38,13 @@ typedef struct _GstGLDeinterlaceClass GstGLDeinterlaceClass;
- struct _GstGLDeinterlace
- {
-   GstGLFilter  filter;
--  GstGLShader  *shader;
-+
-+  GLCB	       deinterlacefunc; 
-+  GHashTable   *shaderstable;
-   GstBuffer    *prev_buffer;
-   guint         prev_tex;
-+
-+  gint	       current_method;
- };
- 
- struct _GstGLDeinterlaceClass
-diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
-index 50676c4..135862a 100644
---- a/ext/gl/gstopengl.c
-+++ b/ext/gl/gstopengl.c
-@@ -62,6 +62,7 @@
- #include "gstglstereosplit.h"
- #include "gstglstereomix.h"
- #include "gstglviewconvert.h"
-+#include "gstgldeinterlace.h"
- 
- #if HAVE_GRAPHENE
- #include "gstgltransformation.h"
-@@ -77,7 +78,6 @@
- #include "gstgltestsrc.h"
- #include "gstglfilterglass.h"
- /* #include "gstglfilterreflectedscreen.h" */
--#include "gstgldeinterlace.h"
- #include "gstglmosaic.h"
- #if HAVE_PNG
- #include "gstgldifferencematte.h"
-@@ -226,6 +226,12 @@ plugin_init (GstPlugin * plugin)
-           GST_RANK_NONE, GST_TYPE_GL_STEREO_MIX)) {
-     return FALSE;
-   }
-+
-+  if (!gst_element_register (plugin, "gldeinterlace",
-+          GST_RANK_NONE, GST_TYPE_GL_DEINTERLACE)) {
-+    return FALSE;
-+  }
-+
- #if HAVE_JPEG
- #if HAVE_PNG
-   if (!gst_element_register (plugin, "gloverlay",
-@@ -250,11 +256,6 @@ plugin_init (GstPlugin * plugin)
-     return FALSE;
-   }
- #endif
--  if (!gst_element_register (plugin, "gldeinterlace",
--          GST_RANK_NONE, GST_TYPE_GL_DEINTERLACE)) {
--    return FALSE;
--  }
--
-   if (!gst_element_register (plugin, "glmosaic",
-           GST_RANK_NONE, GST_TYPE_GL_MOSAIC)) {
-     return FALSE;
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
deleted file mode 100755
index 31d8e05..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
+++ /dev/null
@@ -1,244 +0,0 @@
-From 127e517568490fc147211d8b2fb4da01cecbbeb5 Mon Sep 17 00:00:00 2001
-From: Matthew Waters <matthew@centricular.com>
-Date: Thu, 31 Mar 2016 19:50:28 +1100
-Subject: [PATCH 5/6] glcolorconvert: implement multiple render targets for
- GLES3
-
-There are numerous slight differences required between Desktop GL and GLES3 for
-multiple render targets.
-
-1. gl_FragData doesn't exist at all and one is required to use
-   'layout (location = ?) out ...' instead.
-2. gl_FragColor doesn't exist, same as 1
-3. texture2D() has been deprecated
-
-Fortunately most of these have been taken care of with GL3 and the shader
-mangling already exists so just expand the conditions they are used in.  The
-gl_FragData issue requires a new mangle pass though.  We also use this new
-pass on desktop GL for consistency.
-
-Upstream-Status: Backport [1.9.1]
-
----
- gst-libs/gst/gl/gstglcolorconvert.c | 125 ++++++++++++++++++++++++++++--------
- 1 file changed, 99 insertions(+), 26 deletions(-)
-
-diff --git a/gst-libs/gst/gl/gstglcolorconvert.c b/gst-libs/gst/gl/gstglcolorconvert.c
-index 490ec54..f478faa 100644
---- a/gst-libs/gst/gl/gstglcolorconvert.c
-+++ b/gst-libs/gst/gl/gstglcolorconvert.c
-@@ -1802,10 +1802,11 @@ _mangle_sampler_type (const gchar * str, GstGLTextureTarget from,
- 
- static gchar *
- _mangle_varying_attribute (const gchar * str, guint shader_type,
--    GstGLAPI gl_api)
-+    GstGLAPI gl_api, guint gl_major, guint gl_minor)
- {
--  if (gl_api & GST_GL_API_OPENGL3) {
--    if (shader_type == GL_VERTEX_SHADER) {
-+  if (shader_type == GL_VERTEX_SHADER) {
-+    if ((gl_api & GST_GL_API_OPENGL3) || (gl_api & GST_GL_API_GLES2
-+            && gl_major >= 3)) {
-       gchar *tmp, *tmp2;
-       GRegex *regex;
- 
-@@ -1821,7 +1822,10 @@ _mangle_varying_attribute (const gchar * str, guint shader_type,
- 
-       g_free (tmp);
-       return tmp2;
--    } else if (shader_type == GL_FRAGMENT_SHADER) {
-+    }
-+  } else if (shader_type == GL_FRAGMENT_SHADER) {
-+    if ((gl_api & GST_GL_API_OPENGL3) || (gl_api & GST_GL_API_GLES2
-+            && gl_major > 3)) {
-       gchar *tmp;
-       GRegex *regex;
- 
-@@ -1837,28 +1841,48 @@ _mangle_varying_attribute (const gchar * str, guint shader_type,
- }
- 
- static gchar *
--_mangle_frag_color (const gchar * str)
-+_mangle_frag_color_data (const gchar * str)
- {
-   GRegex *regex;
--  gchar *ret;
-+  gchar *ret, *tmp;
- 
-   regex = g_regex_new ("gl_FragColor", 0, 0, NULL);
-   ret = g_regex_replace_literal (regex, str, -1, 0, "fragColor", 0, NULL);
-   g_regex_unref (regex);
- 
-+  tmp = ret;
-+  /* search and replace 'gl_FragData[NUM]' into fragColor_NUM */
-+  regex = g_regex_new ("gl_FragData\\[(\\d+)\\]", 0, 0, NULL);
-+  ret = g_regex_replace (regex, tmp, -1, 0, "fragColor_\\1", 0, NULL);
-+  g_regex_unref (regex);
-+  g_free (tmp);
-+
-   return ret;
- }
- 
- static void
--_mangle_version_profile_from_gl_api (GstGLAPI gl_api, GstGLSLVersion * version,
--    GstGLSLProfile * profile)
-+_mangle_version_profile_from_gl_api (GstGLAPI gl_api, gint gl_major,
-+    gint gl_minor, GstGLSLVersion * version, GstGLSLProfile * profile)
- {
-+  *version = GST_GLSL_VERSION_NONE;
-+  *profile = GST_GLSL_PROFILE_NONE;
-+
-   if (gl_api & GST_GL_API_OPENGL3) {
--    *version = GST_GLSL_VERSION_150;
--    *profile = GST_GLSL_PROFILE_NONE;
-+    if (gl_major > 3 || gl_minor >= 3) {
-+      *version = GST_GLSL_VERSION_330;
-+      *profile = GST_GLSL_PROFILE_CORE;
-+    } else {
-+      *version = GST_GLSL_VERSION_150;
-+      *profile = GST_GLSL_PROFILE_NONE;
-+    }
-   } else if (gl_api & GST_GL_API_GLES2) {
--    *version = GST_GLSL_VERSION_100;
--    *profile = GST_GLSL_PROFILE_ES;
-+    if (gl_major >= 3) {
-+      *version = GST_GLSL_VERSION_300;
-+      *profile = GST_GLSL_PROFILE_ES;
-+    } else if (gl_major >= 2) {
-+      *version = GST_GLSL_VERSION_100;
-+      *profile = GST_GLSL_PROFILE_ES;
-+    }
-   } else if (gl_api & GST_GL_API_OPENGL) {
-     *version = GST_GLSL_VERSION_110;
-     *profile = GST_GLSL_PROFILE_COMPATIBILITY;
-@@ -1867,22 +1891,28 @@ _mangle_version_profile_from_gl_api (GstGLAPI gl_api, GstGLSLVersion * version,
- 
- static gchar *
- _mangle_shader (const gchar * str, guint shader_type, GstGLTextureTarget from,
--    GstGLTextureTarget to, GstGLAPI gl_api, GstGLSLVersion * version,
--    GstGLSLProfile * profile)
-+    GstGLTextureTarget to, GstGLAPI gl_api, gint gl_major, gint gl_minor,
-+    GstGLSLVersion * version, GstGLSLProfile * profile)
- {
-   gchar *tmp, *tmp2;
- 
-+  _mangle_version_profile_from_gl_api (gl_api, gl_major, gl_minor, version,
-+      profile);
-   tmp = _mangle_texture_access (str, from, to, gl_api);
-   tmp2 = _mangle_sampler_type (tmp, from, to);
-   g_free (tmp);
--  tmp = _mangle_varying_attribute (tmp2, shader_type, gl_api);
-+  tmp =
-+      _mangle_varying_attribute (tmp2, shader_type, gl_api, gl_major, gl_minor);
-   g_free (tmp2);
--  if (shader_type == GL_FRAGMENT_SHADER && gl_api & GST_GL_API_OPENGL3) {
--    tmp2 = _mangle_frag_color (tmp);
--    g_free (tmp);
--    tmp = tmp2;
-+  if (shader_type == GL_FRAGMENT_SHADER) {
-+    if ((*profile == GST_GLSL_PROFILE_ES && *version >= GST_GLSL_VERSION_300)
-+        || (*profile == GST_GLSL_PROFILE_CORE
-+            && *version >= GST_GLSL_VERSION_150)) {
-+      tmp2 = _mangle_frag_color_data (tmp);
-+      g_free (tmp);
-+      tmp = tmp2;
-+    }
-   }
--  _mangle_version_profile_from_gl_api (gl_api, version, profile);
-   return tmp;
- }
- 
-@@ -1899,15 +1929,18 @@ _create_shader (GstGLColorConvert * convert)
-   const gchar *strings[2];
-   GError *error = NULL;
-   GstGLAPI gl_api;
-+  gint gl_major, gl_minor;
-   int i;
- 
-   gl_api = gst_gl_context_get_gl_api (convert->context);
-+  gst_gl_context_get_gl_version (convert->context, &gl_major, &gl_minor);
- 
-   ret = gst_gl_shader_new (convert->context);
- 
-   tmp =
-       _mangle_shader (text_vertex_shader, GL_VERTEX_SHADER, info->templ->target,
--      convert->priv->from_texture_target, gl_api, &version, &profile);
-+      convert->priv->from_texture_target, gl_api, gl_major, gl_minor, &version,
-+      &profile);
- 
-   tmp1 = gst_glsl_version_profile_to_string (version, profile);
-   version_str = g_strdup_printf ("#version %s\n", tmp1);
-@@ -1945,9 +1978,37 @@ _create_shader (GstGLColorConvert * convert)
-   if (info->templ->uniforms)
-     g_string_append (str, info->templ->uniforms);
- 
--  if (gl_api & GST_GL_API_OPENGL3) {
--    g_string_append_c (str, '\n');
--    g_string_append (str, "out vec4 fragColor;\n");
-+  g_string_append_c (str, '\n');
-+
-+  /* GL 3.3+ and GL ES 3.x */
-+  if ((profile == GST_GLSL_PROFILE_CORE && version >= GST_GLSL_VERSION_330)
-+      || (profile == GST_GLSL_PROFILE_ES && version >= GST_GLSL_VERSION_300)) {
-+    if (info->out_n_textures > 1) {
-+      gint i;
-+
-+      for (i = 0; i < info->out_n_textures; i++) {
-+        g_string_append_printf (str,
-+            "layout(location = %d) out vec4 fragColor_%d;\n", i, i);
-+      }
-+    } else {
-+      g_string_append (str, "layout (location = 0) out vec4 fragColor;\n");
-+    }
-+  } else if (profile == GST_GLSL_PROFILE_CORE
-+      && version >= GST_GLSL_VERSION_150) {
-+    /* no layout specifiers, use glBindFragDataLocation instead */
-+    if (info->out_n_textures > 1) {
-+      gint i;
-+
-+      for (i = 0; i < info->out_n_textures; i++) {
-+        gchar *var_name = g_strdup_printf ("fragColor_%d", i);
-+        g_string_append_printf (str, "out vec4 %s;\n", var_name);
-+        gst_gl_shader_bind_frag_data_location (ret, i, var_name);
-+        g_free (var_name);
-+      }
-+    } else {
-+      g_string_append (str, "out vec4 fragColor;\n");
-+      gst_gl_shader_bind_frag_data_location (ret, 0, "fragColor");
-+    }
-   }
- 
-   for (i = 0; i < MAX_FUNCTIONS; i++) {
-@@ -1959,7 +2020,19 @@ _create_shader (GstGLColorConvert * convert)
-     g_string_append_c (str, '\n');
-   }
- 
--  g_string_append (str, "\nvarying vec2 v_texcoord;\nvoid main (void) {\n");
-+  {
-+    const gchar *varying = NULL;
-+
-+    if ((profile == GST_GLSL_PROFILE_ES && version >= GST_GLSL_VERSION_300)
-+        || (profile == GST_GLSL_PROFILE_CORE
-+            && version >= GST_GLSL_VERSION_150)) {
-+      varying = "in";
-+    } else {
-+      varying = "varying";
-+    }
-+    g_string_append_printf (str, "\n%s vec2 v_texcoord;\nvoid main (void) {\n",
-+        varying);
-+  }
-   if (info->frag_body) {
-     g_string_append (str, "vec2 texcoord;\n");
-     if (convert->priv->from_texture_target == GST_GL_TEXTURE_TARGET_RECTANGLE
-@@ -1975,7 +2048,7 @@ _create_shader (GstGLColorConvert * convert)
-   tmp = g_string_free (str, FALSE);
-   info->frag_prog = _mangle_shader (tmp, GL_FRAGMENT_SHADER,
-       info->templ->target, convert->priv->from_texture_target, gl_api,
--      &version, &profile);
-+      gl_major, gl_minor, &version, &profile);
-   g_free (tmp);
- 
-   strings[1] = info->frag_prog;
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
deleted file mode 100755
index b75f402..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b069672ace2b762f400ca6d318571cbedf5141f2 Mon Sep 17 00:00:00 2001
-From: Matthew Waters <matthew@centricular.com>
-Date: Thu, 31 Mar 2016 20:00:37 +1100
-Subject: [PATCH 1/3] glcolorconvert: don't use the predefined variable name
- sample
-
-Using 'sample' as a variable name is an error in GLES3
-
-Upstream-Status: Backport [1.9.1]
----
- gst-libs/gst/gl/gstglcolorconvert.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gst-libs/gst/gl/gstglcolorconvert.c b/gst-libs/gst/gl/gstglcolorconvert.c
-index f478faa..c23624f 100644
---- a/gst-libs/gst/gl/gstglcolorconvert.c
-+++ b/gst-libs/gst/gl/gstglcolorconvert.c
-@@ -261,9 +261,9 @@ static const struct shader_templ templ_RGB_to_PLANAR_YUV =
-     "    for (int j = 0; j < int(chroma_sampling.y); j++) {\n"
-     "      int n = (i+1)*(j+1);\n"
-     "      delta.y = float(j);\n"
--    "      vec4 sample = texture2D(tex, (chroma_pos + delta) / unnormalization).%c%c%c%c;\n"
-+    "      vec4 s = texture2D(tex, (chroma_pos + delta) / unnormalization).%c%c%c%c;\n"
-            /* rolling average */
--    "      uv_texel = (float(n-1) * uv_texel + sample) / float(n);\n"
-+    "      uv_texel = (float(n-1) * uv_texel + s) / float(n);\n"
-     "    }\n"
-     "  }\n"
-     "}\n"
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
deleted file mode 100755
index 57e9d1a..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 38221080181229d520522a20bcb1663ca19f7aff Mon Sep 17 00:00:00 2001
-From: Matthew Waters <matthew@centricular.com>
-Date: Thu, 31 Mar 2016 19:25:32 +1100
-Subject: [PATCH 2/3] glshader: add glBindFragDataLocation
-
-There are some cases where it's needed for binding in/out variables in shaders.
-e.g. glsl 150 (gl 3.2) doesn't support the 'layout (location = ?)' specifiers in
-the shader source so we have to bind them ourselves.
-
-Upstream-Status: Backport [1.9.1]
----
- gst-libs/gst/gl/glprototypes/shaders.h | 10 ++++++++++
- gst-libs/gst/gl/gstglshader.c          | 20 ++++++++++++++++++++
- gst-libs/gst/gl/gstglshader.h          |  1 +
- 3 files changed, 31 insertions(+)
-
-diff --git a/gst-libs/gst/gl/glprototypes/shaders.h b/gst-libs/gst/gl/glprototypes/shaders.h
-index 817e479..6d828db 100644
---- a/gst-libs/gst/gl/glprototypes/shaders.h
-+++ b/gst-libs/gst/gl/glprototypes/shaders.h
-@@ -362,3 +362,13 @@ GST_GL_EXT_FUNCTION (void, UniformMatrix3x4fv,
- GST_GL_EXT_FUNCTION (void, UniformMatrix4x3fv,
-                      (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value))
- GST_GL_EXT_END ()
-+
-+GST_GL_EXT_BEGIN (bind_frag_data,
-+                  GST_GL_API_OPENGL | GST_GL_API_OPENGL3,
-+                  3, 0,
-+                  255, 255,
-+                  "\0",
-+                  "\0")
-+GST_GL_EXT_FUNCTION (void, BindFragDataLocation,
-+                     (GLuint program, GLuint index, const GLchar * name))
-+GST_GL_EXT_END ()
-diff --git a/gst-libs/gst/gl/gstglshader.c b/gst-libs/gst/gl/gstglshader.c
-index 9d96784..9f09236 100644
---- a/gst-libs/gst/gl/gstglshader.c
-+++ b/gst-libs/gst/gl/gstglshader.c
-@@ -1306,3 +1306,23 @@ gst_gl_shader_bind_attribute_location (GstGLShader * shader, GLuint index,
- 
-   gl->BindAttribLocation (priv->program_handle, index, name);
- }
-+
-+void
-+gst_gl_shader_bind_frag_data_location (GstGLShader * shader,
-+    guint index, const gchar * name)
-+{
-+  GstGLShaderPrivate *priv;
-+  GstGLFuncs *gl;
-+
-+  g_return_if_fail (shader != NULL);
-+  if (!_ensure_program (shader))
-+    g_return_if_fail (shader->priv->program_handle);
-+  priv = shader->priv;
-+  gl = shader->context->gl_vtable;
-+  g_return_if_fail (gl->BindFragDataLocation);
-+
-+  GST_TRACE_OBJECT (shader, "binding program %i frag data \'%s\' location %i",
-+      (int) priv->program_handle, name, index);
-+
-+  gl->BindFragDataLocation (priv->program_handle, index, name);
-+}
-diff --git a/gst-libs/gst/gl/gstglshader.h b/gst-libs/gst/gl/gstglshader.h
-index 21410e2..2200b89 100644
---- a/gst-libs/gst/gl/gstglshader.h
-+++ b/gst-libs/gst/gl/gstglshader.h
-@@ -104,6 +104,7 @@ void gst_gl_shader_set_uniform_matrix_4x3fv (GstGLShader *shader, const gchar *n
- 
- gint gst_gl_shader_get_attribute_location  (GstGLShader *shader, const gchar *name);
- void gst_gl_shader_bind_attribute_location (GstGLShader * shader, guint index, const gchar * name);
-+void gst_gl_shader_bind_frag_data_location (GstGLShader * shader, guint index, const gchar * name);
- 
- G_END_DECLS
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
deleted file mode 100755
index 79ef4c8..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 764fd69f8482eca9f925cefe72ebae090ae59d43 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 19 Apr 2016 19:27:33 +0300
-Subject: [PATCH 3/3] glcolorconvert: GLES3 deprecates texture2D() and it does
- not work at all in newer versions than 3.3
-
-Use the newer texture() function instead. This fixes glimagesink and other
-things on various Android devices.
-
-Upstream-Status: Backport [1.9.1]
-
-https://bugzilla.gnome.org/show_bug.cgi?id=765266
----
- gst-libs/gst/gl/gstglcolorconvert.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/gst-libs/gst/gl/gstglcolorconvert.c b/gst-libs/gst/gl/gstglcolorconvert.c
-index c23624f..f472d5d 100644
---- a/gst-libs/gst/gl/gstglcolorconvert.c
-+++ b/gst-libs/gst/gl/gstglcolorconvert.c
-@@ -1716,7 +1716,7 @@ _unbind_buffer (GstGLColorConvert * convert)
- 
- static gchar *
- _mangle_texture_access (const gchar * str, GstGLTextureTarget from,
--    GstGLTextureTarget to, GstGLAPI gl_api)
-+    GstGLTextureTarget to, GstGLAPI gl_api, guint gl_major, guint gl_minor)
- {
-   const gchar *from_str = NULL, *to_str = NULL;
-   gchar *ret, *tmp;
-@@ -1730,7 +1730,8 @@ _mangle_texture_access (const gchar * str, GstGLTextureTarget from,
-   if (from == GST_GL_TEXTURE_TARGET_EXTERNAL_OES)
-     from_str = "texture2D";
- 
--  if (gl_api & GST_GL_API_OPENGL3) {
-+  if ((gl_api & GST_GL_API_OPENGL3) || (gl_api & GST_GL_API_GLES2
-+          && gl_major >= 3)) {
-     to_str = "texture";
-   } else {
-     if (to == GST_GL_TEXTURE_TARGET_2D)
-@@ -1898,7 +1899,7 @@ _mangle_shader (const gchar * str, guint shader_type, GstGLTextureTarget from,
- 
-   _mangle_version_profile_from_gl_api (gl_api, gl_major, gl_minor, version,
-       profile);
--  tmp = _mangle_texture_access (str, from, to, gl_api);
-+  tmp = _mangle_texture_access (str, from, to, gl_api, gl_major, gl_minor);
-   tmp2 = _mangle_sampler_type (tmp, from, to);
-   g_free (tmp);
-   tmp =
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch
deleted file mode 100644
index a67381c..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-gl-implement-GstGLMemoryEGL.patch
+++ /dev/null
@@ -1,495 +0,0 @@
-From 806bbe75b0b6947f589bce3960c28fee51b5c6c2 Mon Sep 17 00:00:00 2001
-From: Gwang Yoon Hwang <yoon@igalia.com>
-Date: Thu, 21 Jan 2016 22:18:17 +0900
-Subject: [PATCH] gl: implement GstGLMemoryEGL
-
-Because current GstEGLImageMemory does not inherit GstGLMemory, GLUpload
-allocates additional GLMemory and upload the decoded contents from the decoder
-which uses EGLImage (e.g. gst-omx in RPi).
-
-This work adds GstGLMemoryEGL to avoid this overhead. Decoders allocate
-GstGLMemoryEGL and decode its contents to the EGLImage of GstGLMemoryEGL.  And
-GLUpload uses this memory without allocation of additional textures and blit
-operations.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=760916
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gst-libs/gst/gl/egl/Makefile.am        |   2 +
- gst-libs/gst/gl/egl/gstgldisplay_egl.c |   2 +
- gst-libs/gst/gl/egl/gstglmemoryegl.c   | 241 +++++++++++++++++++++++++++++++++
- gst-libs/gst/gl/egl/gstglmemoryegl.h   | 108 +++++++++++++++
- gst-libs/gst/gl/gstgl_fwd.h            |   4 +
- gst-libs/gst/gl/gstgldisplay.c         |   2 +
- gst-libs/gst/gl/gstglupload.c          |   8 ++
- 7 files changed, 367 insertions(+)
- create mode 100644 gst-libs/gst/gl/egl/gstglmemoryegl.c
- create mode 100644 gst-libs/gst/gl/egl/gstglmemoryegl.h
-
-diff --git a/gst-libs/gst/gl/egl/Makefile.am b/gst-libs/gst/gl/egl/Makefile.am
-index b808178..878f16c 100644
---- a/gst-libs/gst/gl/egl/Makefile.am
-+++ b/gst-libs/gst/gl/egl/Makefile.am
-@@ -5,6 +5,7 @@ noinst_LTLIBRARIES = libgstgl-egl.la
- libgstgl_egl_la_SOURCES = \
- 	gstgldisplay_egl.c \
- 	gstglcontext_egl.c \
-+	gstglmemoryegl.c \
- 	gsteglimagememory.c
- 
- noinst_HEADERS =
-@@ -13,6 +14,7 @@ libgstgl_eglincludedir = $(includedir)/gstreamer-@GST_API_VERSION@/gst/gl/egl
- libgstgl_eglinclude_HEADERS = \
- 	gstgldisplay_egl.h \
- 	gstglcontext_egl.h \
-+	gstglmemoryegl.h \
- 	gsteglimagememory.h \
- 	gstegl.h
- 
-diff --git a/gst-libs/gst/gl/egl/gstgldisplay_egl.c b/gst-libs/gst/gl/egl/gstgldisplay_egl.c
-index 9acf4f0..20816c2 100644
---- a/gst-libs/gst/gl/egl/gstgldisplay_egl.c
-+++ b/gst-libs/gst/gl/egl/gstgldisplay_egl.c
-@@ -24,6 +24,7 @@
- 
- #include <gst/gl/egl/gstgldisplay_egl.h>
- #include <gst/gl/egl/gsteglimagememory.h>
-+#include <gst/gl/egl/gstglmemoryegl.h>
- 
- GST_DEBUG_CATEGORY_STATIC (gst_gl_display_debug);
- #define GST_CAT_DEFAULT gst_gl_display_debug
-@@ -51,6 +52,7 @@ gst_gl_display_egl_init (GstGLDisplayEGL * display_egl)
-   display_egl->foreign_display = FALSE;
- 
-   gst_egl_image_memory_init ();
-+  gst_gl_memory_egl_init_once ();
- }
- 
- static void
-diff --git a/gst-libs/gst/gl/egl/gstglmemoryegl.c b/gst-libs/gst/gl/egl/gstglmemoryegl.c
-new file mode 100644
-index 0000000..03cf432
---- /dev/null
-+++ b/gst-libs/gst/gl/egl/gstglmemoryegl.c
-@@ -0,0 +1,241 @@
-+/*
-+ * GStreamer
-+ * Copyright (C) 2012 Collabora Ltd.
-+ *   @author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
-+ * Copyright (C) 2014 Julien Isorce <julien.isorce@gmail.com>
-+ * Copyright (C) 2015 Igalia
-+ *    Author: Gwang Yoon Hwang <yoon@igalia.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library; if not, write to the
-+ * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
-+ * Boston, MA 02110-1301, USA.
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-+
-+#include <string.h>
-+
-+#include <gst/gl/egl/gstglmemoryegl.h>
-+
-+static GstAllocator *_gl_memory_egl_allocator;
-+
-+GST_DEBUG_CATEGORY_STATIC (GST_CAT_GL_MEMORY);
-+#define GST_CAT_DEFAULT GST_CAT_GL_MEMORY
-+
-+#define parent_class gst_gl_memory_egl_allocator_parent_class
-+G_DEFINE_TYPE (GstGLMemoryEGLAllocator, gst_gl_memory_egl_allocator,
-+    GST_TYPE_GL_MEMORY_ALLOCATOR);
-+
-+gboolean
-+gst_is_gl_memory_egl (GstMemory * mem)
-+{
-+  return mem != NULL && mem->allocator != NULL
-+      && g_type_is_a (G_OBJECT_TYPE (mem->allocator),
-+      GST_TYPE_GL_MEMORY_EGL_ALLOCATOR);
-+}
-+
-+static GstGLMemoryEGL *
-+_gl_mem_get_parent (GstGLMemoryEGL * gl_mem)
-+{
-+  GstGLMemoryEGL *parent = (GstGLMemoryEGL *)gl_mem->mem.mem.mem.parent;
-+  return parent ? parent : gl_mem;
-+}
-+
-+EGLImageKHR
-+gst_gl_memory_egl_get_image (GstGLMemoryEGL * mem)
-+{
-+  g_return_val_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)),
-+                        EGL_NO_IMAGE_KHR);
-+  return _gl_mem_get_parent(mem)->image;
-+}
-+
-+EGLDisplay
-+gst_gl_memory_egl_get_display (GstGLMemoryEGL * mem)
-+{
-+  g_return_val_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)), NULL);
-+  return GST_GL_CONTEXT_EGL(_gl_mem_get_parent(mem))->egl_display;
-+}
-+
-+GstVideoGLTextureOrientation
-+gst_gl_memory_egl_get_orientation (GstGLMemoryEGL * mem)
-+{
-+  g_return_val_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)),
-+      GST_VIDEO_GL_TEXTURE_ORIENTATION_X_NORMAL_Y_NORMAL);
-+
-+  return _gl_mem_get_parent(mem)->orientation;
-+}
-+
-+void
-+gst_gl_memory_egl_set_orientation (GstGLMemoryEGL * mem,
-+    GstVideoGLTextureOrientation orientation)
-+{
-+  g_return_if_fail (gst_is_gl_memory_egl (GST_MEMORY_CAST (mem)));
-+
-+  _gl_mem_get_parent(mem)->orientation = orientation;
-+}
-+
-+static GstMemory *
-+_gl_mem_alloc (GstAllocator * allocator, gsize size,
-+               GstAllocationParams * params)
-+{
-+  g_warning ("Use gst_gl_base_memory_allocator_alloc() to allocate from this "
-+      "GstGLMemoryEGL allocator");
-+
-+  return NULL;
-+}
-+
-+static void
-+_gl_mem_destroy (GstGLMemoryEGL * mem)
-+{
-+  /* Shared memory should not destroy all the data */
-+  if (!mem->mem.mem.mem.parent) {
-+    GstGLContextEGL *context = GST_GL_CONTEXT_EGL(mem->mem.mem.context);
-+    context->eglDestroyImage (context->egl_display, mem->image);
-+  }
-+
-+  GST_GL_BASE_MEMORY_ALLOCATOR_CLASS (parent_class)->destroy ((GstGLBaseMemory
-+          *) mem);
-+}
-+
-+static void
-+_gl_mem_init (GstGLMemoryEGL * mem, GstAllocator * allocator,
-+    GstMemory * parent, GstGLContext * context, GstGLTextureTarget target,
-+    GstAllocationParams * params, GstVideoInfo * info,
-+    guint plane, GstVideoAlignment * valign, gpointer user_data,
-+    GDestroyNotify notify)
-+{
-+  gst_gl_memory_init ((GstGLMemory *) mem, allocator, parent,
-+      context, target, params, info, plane, valign, user_data, notify);
-+}
-+
-+static GstGLMemoryEGL *
-+_gl_mem_egl_alloc (GstGLBaseMemoryAllocator * allocator,
-+    GstGLVideoAllocationParams * params)
-+{
-+  guint alloc_flags = params->parent.alloc_flags;
-+  GstGLMemoryEGL *mem;
-+
-+  g_return_val_if_fail (alloc_flags & GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO,
-+      NULL);
-+  g_return_val_if_fail ((alloc_flags &
-+      GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_GPU_HANDLE) == 0, NULL);
-+  g_return_val_if_fail ((alloc_flags &
-+      GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_SYSMEM) == 0, NULL);
-+
-+  mem = g_new0 (GstGLMemoryEGL, 1);
-+  mem->image = EGL_NO_IMAGE_KHR;
-+
-+  _gl_mem_init (mem, GST_ALLOCATOR_CAST (allocator), NULL,
-+      params->parent.context, params->target, params->parent.alloc_params,
-+      params->v_info, params->plane, params->valign, params->parent.user_data,
-+      params->parent.notify);
-+
-+  return mem;
-+}
-+
-+static gboolean
-+_gl_mem_create (GstGLMemoryEGL * gl_mem, GError ** error)
-+{
-+  GstGLContextEGL *context = GST_GL_CONTEXT_EGL (gl_mem->mem.mem.context);
-+  GstGLBaseMemoryAllocatorClass *alloc_class;
-+
-+  if (!gst_gl_context_check_feature (GST_GL_CONTEXT (context),
-+                                     "EGL_KHR_image_base")) {
-+    g_set_error (error, GST_GL_CONTEXT_ERROR, GST_GL_CONTEXT_ERROR_WRONG_API,
-+                 "EGL_KHR_image_base is not supported");
-+    return FALSE;
-+  }
-+
-+  alloc_class = GST_GL_BASE_MEMORY_ALLOCATOR_CLASS (parent_class);
-+  if (!alloc_class->create ((GstGLBaseMemory *) gl_mem, error))
-+    return FALSE;
-+
-+  gl_mem->image = context->eglCreateImage (context->egl_display,
-+      context->egl_context, EGL_GL_TEXTURE_2D_KHR,
-+      (EGLClientBuffer) GSIZE_TO_POINTER (gl_mem->mem.tex_id), NULL);
-+
-+  GST_TRACE ("Generating EGLImage handle:%p from a texture:%u",
-+              gl_mem->image, gl_mem->mem.tex_id);
-+
-+  if (eglGetError () != EGL_SUCCESS) {
-+    g_set_error (error, GST_GL_CONTEXT_ERROR, GST_GL_CONTEXT_ERROR_FAILED,
-+                 "Failed to create EGLImage");
-+    return FALSE;
-+  }
-+
-+  return TRUE;
-+}
-+
-+static GstMemory *
-+_gl_mem_copy (GstGLMemoryEGL * src, gssize offset, gssize size)
-+{
-+  GST_CAT_ERROR (GST_CAT_GL_MEMORY, "GstGLMemoryEGL does not support copy");
-+  return NULL;
-+}
-+
-+static void
-+gst_gl_memory_egl_allocator_class_init (GstGLMemoryEGLAllocatorClass * klass)
-+{
-+  GstGLBaseMemoryAllocatorClass *gl_base;
-+  GstGLMemoryAllocatorClass *gl_tex;
-+  GstAllocatorClass *allocator_class;
-+
-+  gl_tex = (GstGLMemoryAllocatorClass *) klass;
-+  gl_base = (GstGLBaseMemoryAllocatorClass *) klass;
-+  allocator_class = (GstAllocatorClass *) klass;
-+
-+  gl_base->alloc = (GstGLBaseMemoryAllocatorAllocFunction) _gl_mem_egl_alloc;
-+  gl_base->create = (GstGLBaseMemoryAllocatorCreateFunction) _gl_mem_create;
-+  gl_base->destroy = (GstGLBaseMemoryAllocatorDestroyFunction) _gl_mem_destroy;
-+  gl_tex->copy = (GstGLBaseMemoryAllocatorCopyFunction) _gl_mem_copy;
-+
-+  allocator_class->alloc = _gl_mem_alloc;
-+}
-+
-+static void
-+gst_gl_memory_egl_allocator_init (GstGLMemoryEGLAllocator * allocator)
-+{
-+  GstAllocator *alloc = GST_ALLOCATOR_CAST (allocator);
-+
-+  alloc->mem_type = GST_GL_MEMORY_EGL_ALLOCATOR_NAME;
-+
-+  GST_OBJECT_FLAG_SET (allocator, GST_ALLOCATOR_FLAG_CUSTOM_ALLOC);
-+}
-+
-+/**
-+ * gst_gl_memory_egl_init_once:
-+ *
-+ * Initializes the GL Memory allocator. It is safe to call this function
-+ * multiple times.  This must be called before any other GstGLMemoryEGL operation.
-+ */
-+void
-+gst_gl_memory_egl_init_once (void)
-+{
-+  static volatile gsize _init = 0;
-+
-+  if (g_once_init_enter (&_init)) {
-+    gst_gl_memory_init_once ();
-+
-+    GST_DEBUG_CATEGORY_INIT (GST_CAT_GL_MEMORY, "glmemory", 0,
-+        "OpenGL Texture with EGLImage memory");
-+
-+    _gl_memory_egl_allocator = g_object_new (GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, NULL);
-+
-+    gst_allocator_register (GST_GL_MEMORY_EGL_ALLOCATOR_NAME,
-+        gst_object_ref (_gl_memory_egl_allocator));
-+    g_once_init_leave (&_init, 1);
-+  }
-+}
-diff --git a/gst-libs/gst/gl/egl/gstglmemoryegl.h b/gst-libs/gst/gl/egl/gstglmemoryegl.h
-new file mode 100644
-index 0000000..7256d33
---- /dev/null
-+++ b/gst-libs/gst/gl/egl/gstglmemoryegl.h
-@@ -0,0 +1,108 @@
-+/*
-+ * GStreamer
-+ * Copyright (C) 2012 Collabora Ltd.
-+ *   @author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
-+ * Copyright (C) 2014 Julien Isorce <julien.isorce@gmail.com>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Library General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Library General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Library General Public
-+ * License along with this library; if not, write to the
-+ * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
-+ * Boston, MA 02110-1301, USA.
-+ */
-+
-+#ifndef _GST_GL_MEMORY_EGL_H_
-+#define _GST_GL_MEMORY_EGL_H_
-+
-+#include <gst/gst.h>
-+#include <gst/gstallocator.h>
-+#include <gst/gstmemory.h>
-+#include <gst/video/video.h>
-+
-+#include <gst/gl/gl.h>
-+#include "gstglcontext_egl.h"
-+
-+#include <gst/gl/gstglmemory.h>
-+
-+G_BEGIN_DECLS
-+
-+#define GST_TYPE_GL_MEMORY_EGL_ALLOCATOR (gst_gl_memory_egl_allocator_get_type())
-+GType gst_gl_memory_egl_allocator_get_type(void);
-+
-+#define GST_IS_GL_MEMORY_EGL_ALLOCATOR(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR))
-+#define GST_IS_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR))
-+#define GST_GL_MEMORY_EGL_ALLOCATOR_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, GstGLMemoryEGLAllocatorClass))
-+#define GST_GL_MEMORY_EGL_ALLOCATOR(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, GstGLMemoryEGLAllocator))
-+#define GST_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_GL_MEMORY_EGL_ALLOCATOR, GstGLAllocatorClass))
-+#define GST_GL_MEMORY_EGL_ALLOCATOR_CAST(obj)            ((GstGLMemoryEGLAllocator *)(obj))
-+
-+typedef void (*GstEGLImageDestroyNotify) (GstGLContextEGL * context,
-+    gpointer data);
-+
-+typedef struct _GstEGLImageMemory GstEGLImageMemory;
-+
-+
-+/**
-+ * GstGLMemoryEGL:
-+ *
-+ * Private instance
-+ */
-+struct _GstGLMemoryEGL
-+{
-+  GstGLMemory mem;
-+
-+  EGLImageKHR image;
-+  GstVideoGLTextureOrientation orientation;
-+};
-+
-+/**
-+ * GST_GL_MEMORY_EGL_ALLOCATOR:
-+ *
-+ * The name of the GL Memory EGL allocator
-+ */
-+#define GST_GL_MEMORY_EGL_ALLOCATOR_NAME "GLMemoryEGL"
-+
-+void          gst_gl_memory_egl_init_once               (void);
-+gboolean      gst_is_gl_memory_egl                      (GstMemory * mem);
-+
-+EGLImageKHR   gst_gl_memory_egl_get_image               (GstGLMemoryEGL * mem);
-+EGLDisplay    gst_gl_memory_egl_get_display             (GstGLMemoryEGL * mem);
-+
-+GstVideoGLTextureOrientation gst_gl_memory_egl_get_orientation
-+                                                        (GstGLMemoryEGL * mem);
-+
-+void          gst_gl_memory_egl_set_orientation         (GstGLMemoryEGL * mem,
-+                                      GstVideoGLTextureOrientation orientation);
-+
-+/**
-+ * GstGLAllocator
-+ *
-+ * Opaque #GstGLAllocator struct
-+ */
-+struct _GstGLMemoryEGLAllocator
-+{
-+  GstGLMemoryAllocator parent;
-+};
-+
-+/**
-+ * GstGLAllocatorClass:
-+ *
-+ * The #GstGLAllocatorClass only contains private data
-+ */
-+struct _GstGLMemoryEGLAllocatorClass
-+{
-+  GstGLMemoryAllocatorClass parent_class;
-+};
-+
-+G_END_DECLS
-+
-+#endif /* _GST_GL_MEMORY_EGL_H_ */
-diff --git a/gst-libs/gst/gl/gstgl_fwd.h b/gst-libs/gst/gl/gstgl_fwd.h
-index fb64ff6..73e17bd 100644
---- a/gst-libs/gst/gl/gstgl_fwd.h
-+++ b/gst-libs/gst/gl/gstgl_fwd.h
-@@ -55,6 +55,10 @@ typedef struct _GstGLMemoryPBO GstGLMemoryPBO;
- typedef struct _GstGLMemoryPBOAllocator GstGLMemoryPBOAllocator;
- typedef struct _GstGLMemoryPBOAllocatorClass GstGLMemoryPBOAllocatorClass;
- 
-+typedef struct _GstGLMemoryEGL GstGLMemoryEGL;
-+typedef struct _GstGLMemoryEGLAllocator GstGLMemoryEGLAllocator;
-+typedef struct _GstGLMemoryEGLAllocatorClass GstGLMemoryEGLAllocatorClass;
-+
- typedef struct _GstGLSLStage        GstGLSLStage;
- typedef struct _GstGLSLStagePrivate GstGLSLStagePrivate;
- typedef struct _GstGLSLStageClass   GstGLSLStageClass;
-diff --git a/gst-libs/gst/gl/gstgldisplay.c b/gst-libs/gst/gl/gstgldisplay.c
-index 60dec6a..34770d0 100644
---- a/gst-libs/gst/gl/gstgldisplay.c
-+++ b/gst-libs/gst/gl/gstgldisplay.c
-@@ -68,6 +68,7 @@
- #if GST_GL_HAVE_PLATFORM_EGL
- #include <gst/gl/egl/gstgldisplay_egl.h>
- #include <gst/gl/egl/gsteglimagememory.h>
-+#include <gst/gl/egl/gstglmemoryegl.h>
- #endif
- 
- GST_DEBUG_CATEGORY_STATIC (gst_context);
-@@ -144,6 +145,7 @@ gst_gl_display_init (GstGLDisplay * display)
- 
- #if GST_GL_HAVE_PLATFORM_EGL
-   gst_egl_image_memory_init ();
-+  gst_gl_memory_egl_init_once ();
- #endif
- }
- 
-diff --git a/gst-libs/gst/gl/gstglupload.c b/gst-libs/gst/gl/gstglupload.c
-index 16ed5ea..73a9029 100644
---- a/gst-libs/gst/gl/gstglupload.c
-+++ b/gst-libs/gst/gl/gstglupload.c
-@@ -29,6 +29,7 @@
- 
- #if GST_GL_HAVE_PLATFORM_EGL
- #include "egl/gsteglimagememory.h"
-+#include "egl/gstglmemoryegl.h"
- #endif
- 
- #if GST_GL_HAVE_DMABUF
-@@ -301,6 +302,13 @@ _gl_memory_upload_propose_allocation (gpointer impl, GstQuery * decide_query,
-             context));
-     gst_query_add_allocation_param (query, allocator, &params);
-     gst_object_unref (allocator);
-+
-+#if GST_GL_HAVE_PLATFORM_EGL
-+    allocator =
-+        GST_ALLOCATOR (gst_allocator_find (GST_GL_MEMORY_EGL_ALLOCATOR_NAME));
-+    gst_query_add_allocation_param (query, allocator, &params);
-+    gst_object_unref (allocator);
-+#endif
-   }
- 
-   n_pools = gst_query_get_n_allocation_pools (query);
--- 
-2.5.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
index 369ff93..59321f7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
@@ -23,43 +23,43 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  sys/decklink/gstdecklinkvideosink.cpp |  2 +-
  3 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
-index 64637f1..bac956f 100644
---- a/sys/decklink/gstdecklink.cpp
-+++ b/sys/decklink/gstdecklink.cpp
-@@ -324,22 +324,22 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e, BMDPixelFormat f)
-       "height", G_TYPE_INT, mode->height,
+Index: gst-plugins-bad-1.10.1/sys/decklink/gstdecklink.cpp
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/sys/decklink/gstdecklink.cpp
++++ gst-plugins-bad-1.10.1/sys/decklink/gstdecklink.cpp
+@@ -476,22 +476,22 @@ gst_decklink_mode_get_structure (GstDeck
        "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
-       "interlace-mode", G_TYPE_STRING, mode->interlaced ? "interleaved" : "progressive",
+       "interlace-mode", G_TYPE_STRING,
+       mode->interlaced ? "interleaved" : "progressive",
 -      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, NULL);
-+      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void *) NULL);
++      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void *)NULL);
  
    switch (f) {
-     case bmdFormat8BitYUV: /* '2vuy' */
+     case bmdFormat8BitYUV:     /* '2vuy' */
        gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
            "colorimetry", G_TYPE_STRING, mode->colorimetry,
 -          "chroma-site", G_TYPE_STRING, "mpeg2", NULL);
-+          "chroma-site", G_TYPE_STRING, "mpeg2", (void *) NULL);
++          "chroma-site", G_TYPE_STRING, "mpeg2", (void *)NULL);
        break;
-     case bmdFormat10BitYUV: /* 'v210' */
+     case bmdFormat10BitYUV:    /* 'v210' */
 -      gst_structure_set (s, "format", G_TYPE_STRING, "v210", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "v210", (void *) NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "v210", (void *)NULL);
        break;
-     case bmdFormat8BitARGB: /* 'ARGB' */
+     case bmdFormat8BitARGB:    /* 'ARGB' */
 -      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", (void *) NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", (void *)NULL);
        break;
-     case bmdFormat8BitBGRA: /* 'BGRA' */
+     case bmdFormat8BitBGRA:    /* 'BGRA' */
 -      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", (void *) NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", (void *)NULL);
        break;
-     case bmdFormat10BitRGB: /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
-     case bmdFormat12BitRGB: /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
-diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdecklinkaudiosrc.cpp
-index 9a701ee..26fb7ec 100644
---- a/sys/decklink/gstdecklinkaudiosrc.cpp
-+++ b/sys/decklink/gstdecklinkaudiosrc.cpp
-@@ -312,7 +312,7 @@ gst_decklink_audio_src_set_caps (GstBaseSrc * bsrc, GstCaps * caps)
+     case bmdFormat10BitRGB:    /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
+     case bmdFormat12BitRGB:    /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
+Index: gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkaudiosrc.cpp
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/sys/decklink/gstdecklinkaudiosrc.cpp
++++ gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkaudiosrc.cpp
+@@ -322,7 +322,7 @@ gst_decklink_audio_src_set_caps (GstBase
        g_mutex_unlock (&self->input->lock);
  
        if (videosrc) {
@@ -68,11 +68,11 @@ index 9a701ee..26fb7ec 100644
          gst_object_unref (videosrc);
  
          switch (vconn) {
-diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdecklinkvideosink.cpp
-index eebeff3..da6e486 100644
---- a/sys/decklink/gstdecklinkvideosink.cpp
-+++ b/sys/decklink/gstdecklinkvideosink.cpp
-@@ -158,7 +158,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
+Index: gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkvideosink.cpp
+===================================================================
+--- gst-plugins-bad-1.10.1.orig/sys/decklink/gstdecklinkvideosink.cpp
++++ gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkvideosink.cpp
+@@ -163,7 +163,7 @@ reset_framerate (GstCapsFeatures * featu
      gpointer user_data)
  {
    gst_structure_set (structure, "framerate", GST_TYPE_FRACTION_RANGE, 0, 1,
@@ -81,6 +81,3 @@ index eebeff3..da6e486 100644
  
    return TRUE;
  }
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
similarity index 64%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
index ae3f04d..9cd892e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
@@ -12,16 +12,10 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
-    file://0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch \
-    file://0003-glcolorconvert-implement-multiple-render-targets-for.patch \
-    file://0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch \
-    file://0005-glshader-add-glBindFragDataLocation.patch \
-    file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
-    file://0008-gl-implement-GstGLMemoryEGL.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "955281a43e98c5464563fa049e0a0911"
-SRC_URI[sha256sum] = "7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
+SRC_URI[md5sum] = "491d2d5aab55ffc60c66e714d3d664ea"
+SRC_URI[sha256sum] = "133e0ed9fe21011b15d3898e3d3a9d17ab74eed31996da2e353353e688ca921d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
index 84cbc04..82e5a84 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
@@ -13,8 +13,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-
-SRC_URI[md5sum] = "4d03dd81828ea6b98a44c8f1ab7f4976"
-SRC_URI[sha256sum] = "114871d4d63606b4af424a8433cd923e4ff66896b244bb7ac97b9da47f71e79e"
+SRC_URI[md5sum] = "eb03953ff239b53a7d69a604edbe5c8c"
+SRC_URI[sha256sum] = "66cfee294c7aaf9d7867eaba4841ca6254ea74f1a8b53e1289f4d3b9b6c976c9"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
index 840df15..44703dc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
@@ -11,8 +11,7 @@ SRC_URI = " \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-
-SRC_URI[md5sum] = "473ebb1f15c67de99ddb6e4d027c0876"
-SRC_URI[sha256sum] = "a1d6579ba203a7734927c24b90bf6590d846c5a5fcec01a48201018c8ad2827a"
+SRC_URI[md5sum] = "7d24b1412d49fa7bab763b35f4640abd"
+SRC_URI[sha256sum] = "a7642ea7e7c17fb67e94d0c17e56757b6577fa7ed244ff8c11031841d3556cc2"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
index 4a9a437..1626430 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
@@ -7,8 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-
-SRC_URI[md5sum] = "4fc66c77253b0ad5ce224bda654b2e7d"
-SRC_URI[sha256sum] = "6fa2599fdd072d31fbaf50c34af406e2be944a010b1f4eab67a5fe32a0310693"
+SRC_URI[md5sum] = "646ab511bc8e56425e63d3fc4812e582"
+SRC_URI[sha256sum] = "a5ecd59fc2091eeb52368de81cc6a91c1a1c19dc5bdde85ce90e1eed5d4183c2"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
new file mode 100644
index 0000000..7b6e4cb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "ae93aa9e5d89a53636a8c0217d8d8c30"
+SRC_URI[sha256sum] = "ddc0c2699598623c2d19d3a2856fb73365496a949783537b238f44bc51e5b005"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb
deleted file mode 100644
index 17059d0..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "e4b07b10dd65b6c26c9ca5f72e59297b"
-SRC_URI[sha256sum] = "010f06800c1c957851d1352e5ec7a8ba3ce6a857fec1b8afc7d1a9e5f53288bf"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index cb0bd82..86c6f66 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -24,7 +24,6 @@ PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 PACKAGECONFIG[gst-tracer-hooks] = "--enable-gst-tracer-hooks,--disable-gst-tracer-hooks,"
-PACKAGECONFIG[trace-historic] = "--enable-trace,--disable-trace,"
 
 EXTRA_OECONF = " \
     --disable-dependency-tracking \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
index d3561eb..428a012 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
 "
-
-SRC_URI[md5sum] = "e88dad542df9d986822e982105d2b530"
-SRC_URI[sha256sum] = "66b37762d4fdcd63bce5a2bec57e055f92420e95037361609900278c0db7c53f"
+SRC_URI[md5sum] = "2c0cc6907aed5ea8005a8f332e34d92f"
+SRC_URI[sha256sum] = "f68df996e0e699382b935bb4783dd402c301377df18f57e28e0318c4b3bff6da"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.10.2


