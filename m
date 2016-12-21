Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 727AA77404
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 07:02:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i88so10373293pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 23:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8sz4W+LYkPJbTi9Q/utjoKgx8en8ZrsPdA1TqAKJDhI=;
	b=fqPfeMjxJARE2a2GZ3A6LgHCifqAqaJY3RQNA1oQFqmAXfEVeIwH5zOX63iDRNcj7Y
	K2ATRb5NbNNClAH6dX+EreD+Xu5/9/b4hRJPfw+Psy/wskoUOj6cBH160preW82yTgtc
	Jmsc3MBej4fN/pdRib7VvkQODnaQnfkkvR+mzBxlJ/hDTiVeuwmSMM9nDpBdbRRyJCDd
	RDEAgjCrxe60W6s7h2k+95sHIi+3pf/XCdGAOyEU0BWCCBnHBoXY8m/l9sxo+skYYpTd
	AH5nRBIYw4VPAAf3w0cm8OX4zZhHlhTZovc5/Nn7qYp/n4TBvuFCfow0PmKHkgGJiFgA
	wRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8sz4W+LYkPJbTi9Q/utjoKgx8en8ZrsPdA1TqAKJDhI=;
	b=mJO5ZmyJpYRSqGjFLs/AUQVasvkfnekauTX1/cm9iHoV+J9Fd4C004Bb7uJzqru+ZA
	0s09V9dXHLWm1cT5DPPwoD4v9SfqRiphZQYrb1u+AeET7+yNr84azsuxO9GuPIVQfSTG
	6pdMGyKFaZDCqwttlnp1mDX5qmeLIHUvaSlxMrdILubjnTqdaO/Q6LZ+x/usKJi/X2jW
	3ywOWKy3ni7XVnH1+KPBuj9etxgiNaDnVU2MsTVZO2dxrGJN29vB/bmhz7YcZVpXiBLj
	m7SUkBEjc8UZ2KOyoeLye+WF1QKTTKWVsCPc8OQEKb3eo48Zf7Rfg5LD1fyHjimJ8yOF
	8zAg==
X-Gm-Message-State: AIkVDXJk6vlv6MwoaRSPiRlOnvEdeHdg3P9WtZHXRtJMTNmZ5AdUu488ot534+3AeIcTIw==
X-Received: by 10.98.79.75 with SMTP id d72mr1028962pfb.1.1482303766295;
	Tue, 20 Dec 2016 23:02:46 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	q14sm43804543pfa.40.2016.12.20.23.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 23:02:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 23:02:38 -0800
Message-Id: <20161221070238.8554-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gstreamer: Upgrade to 1.10.2
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
X-List-Received-Date: Wed, 21 Dec 2016 07:02:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ibav_1.10.1.bb => gstreamer1.0-libav_1.10.2.bb} |  4 +--
 .../gstreamer/gstreamer1.0-omx_1.10.2.bb           | 10 +++++++
 ...valid-sentinels-for-gst_structure_get-etc.patch | 34 ++++++++++++----------
 ....10.1.bb => gstreamer1.0-plugins-bad_1.10.2.bb} |  4 +--
 ...10.1.bb => gstreamer1.0-plugins-base_1.10.2.bb} |  4 +--
 ...10.1.bb => gstreamer1.0-plugins-good_1.10.2.bb} |  4 +--
 ...10.1.bb => gstreamer1.0-plugins-ugly_1.10.2.bb} |  4 +--
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb   |  6 ----
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb   |  5 ++++
 .../gstreamer/gstreamer1.0-vaapi_1.10.1.bb         |  6 ----
 .../gstreamer/gstreamer1.0-vaapi_1.10.2.bb         |  5 ++++
 ...treamer1.0_1.10.1.bb => gstreamer1.0_1.10.2.bb} |  4 +--
 12 files changed, 50 insertions(+), 40 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.1.bb => gstreamer1.0-libav_1.10.2.bb} (87%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.1.bb => gstreamer1.0-plugins-bad_1.10.2.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.1.bb => gstreamer1.0-plugins-base_1.10.2.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.1.bb => gstreamer1.0-plugins-good_1.10.2.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.1.bb => gstreamer1.0-plugins-ugly_1.10.2.bb} (76%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.1.bb => gstreamer1.0_1.10.2.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.2.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.2.bb
index d44a5b24cb..a3f3d04dd8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.2.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
     file://mips64_cpu_detection.patch \
 "
-SRC_URI[md5sum] = "9dc8fb8dd01818c27230a1ed6ba9f4de"
-SRC_URI[sha256sum] = "27b28b8de0e6dff1e3952428e8ed8ba4a12f452f789ac0ae9bbe50f00a5c72c7"
+SRC_URI[md5sum] = "420d0a32f47ef02cc615f8cf6da1e94d"
+SRC_URI[sha256sum] = "a3dd7036211f061e1eda04f985b7a9dd1a91b754f767ff2587eb6ec28f44e73c"
 
 S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb
new file mode 100644
index 0000000000..643e83642e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb
@@ -0,0 +1,10 @@
+include gstreamer1.0-omx.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
+
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
+SRC_URI[md5sum] = "d8395c2d7bbe05517cd20f608813f03c"
+SRC_URI[sha256sum] = "c069a9cf775c92f889ca8f3b2fc718e428cd0579b7b805851a960c850a7aa497"
+
+S = "${WORKDIR}/gst-omx-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
index 59321f704b..20c9ffcd84 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
@@ -23,42 +23,44 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  sys/decklink/gstdecklinkvideosink.cpp |  2 +-
  3 files changed, 7 insertions(+), 7 deletions(-)
 
-Index: gst-plugins-bad-1.10.1/sys/decklink/gstdecklink.cpp
+Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
 ===================================================================
---- gst-plugins-bad-1.10.1.orig/sys/decklink/gstdecklink.cpp
-+++ gst-plugins-bad-1.10.1/sys/decklink/gstdecklink.cpp
-@@ -476,22 +476,22 @@ gst_decklink_mode_get_structure (GstDeck
+--- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklink.cpp
++++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
+@@ -476,7 +476,7 @@ gst_decklink_mode_get_structure (GstDeck
        "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
        "interlace-mode", G_TYPE_STRING,
        mode->interlaced ? "interleaved" : "progressive",
 -      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, NULL);
-+      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void *)NULL);
++      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void*)NULL);
  
-   switch (f) {
+   if (input && mode->interlaced) {
+     if (mode->tff)
+@@ -489,16 +489,16 @@ gst_decklink_mode_get_structure (GstDeck
      case bmdFormat8BitYUV:     /* '2vuy' */
        gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
            "colorimetry", G_TYPE_STRING, mode->colorimetry,
 -          "chroma-site", G_TYPE_STRING, "mpeg2", NULL);
-+          "chroma-site", G_TYPE_STRING, "mpeg2", (void *)NULL);
++          "chroma-site", G_TYPE_STRING, "mpeg2", (void*)NULL);
        break;
      case bmdFormat10BitYUV:    /* 'v210' */
 -      gst_structure_set (s, "format", G_TYPE_STRING, "v210", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "v210", (void *)NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "v210", (void*)NULL);
        break;
      case bmdFormat8BitARGB:    /* 'ARGB' */
 -      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", (void *)NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "ARGB", (void*)NULL);
        break;
      case bmdFormat8BitBGRA:    /* 'BGRA' */
 -      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", NULL);
-+      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", (void *)NULL);
++      gst_structure_set (s, "format", G_TYPE_STRING, "BGRA", (void*)NULL);
        break;
      case bmdFormat10BitRGB:    /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
      case bmdFormat12BitRGB:    /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
-Index: gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkaudiosrc.cpp
+Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
 ===================================================================
---- gst-plugins-bad-1.10.1.orig/sys/decklink/gstdecklinkaudiosrc.cpp
-+++ gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkaudiosrc.cpp
+--- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkaudiosrc.cpp
++++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
 @@ -322,7 +322,7 @@ gst_decklink_audio_src_set_caps (GstBase
        g_mutex_unlock (&self->input->lock);
  
@@ -68,10 +70,10 @@ Index: gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkaudiosrc.cpp
          gst_object_unref (videosrc);
  
          switch (vconn) {
-Index: gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkvideosink.cpp
+Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
 ===================================================================
---- gst-plugins-bad-1.10.1.orig/sys/decklink/gstdecklinkvideosink.cpp
-+++ gst-plugins-bad-1.10.1/sys/decklink/gstdecklinkvideosink.cpp
+--- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkvideosink.cpp
++++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
 @@ -163,7 +163,7 @@ reset_framerate (GstCapsFeatures * featu
      gpointer user_data)
  {
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
index 46df0265f9..e257a589ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
@@ -16,8 +16,8 @@ SRC_URI = " \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://0001-Prepend-PKG_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch \
 "
-SRC_URI[md5sum] = "491d2d5aab55ffc60c66e714d3d664ea"
-SRC_URI[sha256sum] = "133e0ed9fe21011b15d3898e3d3a9d17ab74eed31996da2e353353e688ca921d"
+SRC_URI[md5sum] = "823f4c33fe27c61332c0122273217988"
+SRC_URI[sha256sum] = "0795ca9303a99cc7e44dda0e6e18524de02b39892e4b68eaba488f7b9db53a3a"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.2.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.2.bb
index 82e5a84817..1b0fdacffc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.2.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "eb03953ff239b53a7d69a604edbe5c8c"
-SRC_URI[sha256sum] = "66cfee294c7aaf9d7867eaba4841ca6254ea74f1a8b53e1289f4d3b9b6c976c9"
+SRC_URI[md5sum] = "8efa9e9ad9a841a900359604da82fb8b"
+SRC_URI[sha256sum] = "fbc0d40fcb746d2efe2ea47444674029912f66e6107f232766d33b722b97de20"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
index 44703dc7e6..82635dba10 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "7d24b1412d49fa7bab763b35f4640abd"
-SRC_URI[sha256sum] = "a7642ea7e7c17fb67e94d0c17e56757b6577fa7ed244ff8c11031841d3556cc2"
+SRC_URI[md5sum] = "65c4ff9d406c3ea9383b4d38a6504349"
+SRC_URI[sha256sum] = "198f325bcce982dce1ebeb36929a5f430b8bf9528e0d519e18df0b29e1d23313"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.2.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.2.bb
index 16264301a0..c07d3ff37d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.2.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "646ab511bc8e56425e63d3fc4812e582"
-SRC_URI[sha256sum] = "a5ecd59fc2091eeb52368de81cc6a91c1a1c19dc5bdde85ce90e1eed5d4183c2"
+SRC_URI[md5sum] = "c157f3fcb87db2a0f457667f3d3e6a26"
+SRC_URI[sha256sum] = "f303dd4c2ebc963e8b0b03c3069f70657bcf1cd62224d344ad579b3dda17ec9d"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
deleted file mode 100644
index 7b6e4cb508..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "ae93aa9e5d89a53636a8c0217d8d8c30"
-SRC_URI[sha256sum] = "ddc0c2699598623c2d19d3a2856fb73365496a949783537b238f44bc51e5b005"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
new file mode 100644
index 0000000000..1c23fa074a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
@@ -0,0 +1,5 @@
+include gstreamer1.0-rtsp-server.inc
+SRC_URI[md5sum] = "3ed8878f076e84c59b3ed5bd38ab31ed"
+SRC_URI[sha256sum] = "822dd6f754fea2bbf3369a7c388372f49b74668fb57943c1888675e544b07235"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
deleted file mode 100644
index 1c727f5775..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer1.0-vaapi.inc
-
-SRC_URI[md5sum] = "514757933ff719a6b8206091f70e0221"
-SRC_URI[sha256sum] = "99aecaa609f37d65e12518b1e77cc70e3cc5dde0c7dfc8e83f508d7e64e1da34"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb
new file mode 100644
index 0000000000..f944d121fe
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb
@@ -0,0 +1,5 @@
+require gstreamer1.0-vaapi.inc
+SRC_URI[md5sum] = "cd8771280c8c00929cf7251c38a509dc"
+SRC_URI[sha256sum] = "9e31d2b85b2f30caa6b0cc1c6be10b96e1376668f13faa6a0f577d3693547fa9"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
index 428a01203b..05ef34d2c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "2c0cc6907aed5ea8005a8f332e34d92f"
-SRC_URI[sha256sum] = "f68df996e0e699382b935bb4783dd402c301377df18f57e28e0318c4b3bff6da"
+SRC_URI[md5sum] = "0d289e5bcec6353e6540ddb75b7d371b"
+SRC_URI[sha256sum] = "150e8e81febac94c161d8141cde78a38038a8f56e8ec549f353da54994278d65"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.11.0


