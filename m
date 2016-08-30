Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 91AEE731BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 13:18:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 30 Aug 2016 06:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1022262954"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2016 06:18:31 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9B6F56A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:18:11 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 16:18:01 +0300
Message-Id: <1472563081-14118-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1472563081-14118-1-git-send-email-maxin.john@intel.com>
References: <1472563081-14118-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] gstreamer1.0: upgrade to 1.8.3
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
X-List-Received-Date: Tue, 30 Aug 2016 13:18:40 -0000

1.8.2 -> 1.8.3

Remove backported patch from 1.8.3:
        0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-libav_1.8.2.bb => gstreamer1.0-libav_1.8.3.bb} |  4 +-
 .../gstreamer/gstreamer1.0-omx.inc                 |  1 -
 ...effects-fix-little-rectangel-appears-at-t.patch | 46 ----------------------
 ..._1.8.2.bb => gstreamer1.0-plugins-bad_1.8.3.bb} |  5 +--
 ...1.8.2.bb => gstreamer1.0-plugins-base_1.8.3.bb} |  4 +-
 ...1.8.2.bb => gstreamer1.0-plugins-good_1.8.3.bb} |  4 +-
 ...1.8.2.bb => gstreamer1.0-plugins-ugly_1.8.3.bb} |  4 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb    |  6 ---
 .../gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb    |  6 +++
 ...gstreamer1.0_1.8.2.bb => gstreamer1.0_1.8.3.bb} |  4 +-
 10 files changed, 18 insertions(+), 66 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.8.2.bb => gstreamer1.0-libav_1.8.3.bb} (87%)
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.8.2.bb => gstreamer1.0-plugins-bad_1.8.3.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.8.2.bb => gstreamer1.0-plugins-base_1.8.3.bb} (84%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.8.2.bb => gstreamer1.0-plugins-good_1.8.3.bb} (83%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.8.2.bb => gstreamer1.0-plugins-ugly_1.8.3.bb} (72%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.8.2.bb => gstreamer1.0_1.8.3.bb} (69%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.3.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.3.bb
index 57e8785..3d86221 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.8.3.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
 
-SRC_URI[md5sum] = "95bc3dd0ea2dc664b4f3a96897005013"
-SRC_URI[sha256sum] = "b5f3c7a27b39b5f5c2f0bfd546b0c655020faf6b38d27b64b346c43e5ebf687a"
+SRC_URI[md5sum] = "b51a736147bacb40f85827a4e0ae0d2c"
+SRC_URI[sha256sum] = "9006a05990089f7155ee0e848042f6bb24e52ab1d0a59ff8d1b5d7e33001a495"
 
 S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 0fff612..aa3e820 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -11,7 +11,6 @@ inherit autotools pkgconfig gettext
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-PR = "r1"
 
 GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
 GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch
deleted file mode 100755
index 90bfba9..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 43549773608b4f58dc664b7115a1ef0dcb32f251 Mon Sep 17 00:00:00 2001
-From: Haihua Hu <jared.hu@nxp.com>
-Date: Tue, 14 Jun 2016 13:48:09 +0800
-Subject: [PATCH 1/2] [glplugin]gleffects: fix little rectangel appears at the
- center when use squeeze and tunnel effects
-
-These two shader will calculate the verctor length and use it as denominator.
-But length could be zero which will cause undefine behaviour. Add protection for
-this condition
-
-Upstream-Status: Backport [1.8.3]
-
-https://bugzilla.gnome.org/show_bug.cgi?id=767635
-
-Signed-off-by: Haihua Hu <jared.hu@nxp.com>
----
- ext/gl/effects/gstgleffectssources.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/ext/gl/effects/gstgleffectssources.c b/ext/gl/effects/gstgleffectssources.c
-index 6bdc155..3e87b8b 100644
---- a/ext/gl/effects/gstgleffectssources.c
-+++ b/ext/gl/effects/gstgleffectssources.c
-@@ -100,7 +100,8 @@ const gchar *squeeze_fragment_source_gles2 =
-   "void main () {"
-   "  vec2 texturecoord = v_texcoord.xy;"
-   "  vec2 normcoord = texturecoord - 0.5;"
--  "  float r = length (normcoord);"
-+  /* Add a very small value to length otherwise it could be 0 */
-+  "  float r = length (normcoord)+0.01;"
-   "  r = pow(r, 0.40)*1.3;"
-   "  normcoord = normcoord / r;"
-   "  texturecoord = (normcoord + 0.5);"
-@@ -136,7 +137,8 @@ const gchar *tunnel_fragment_source_gles2 =
-    * rect textures */
-   "  normcoord = (texturecoord - 0.5);"
-   "  float r = length(normcoord);"
--  "  normcoord *= clamp (r, 0.0, 0.275) / r;"
-+  "  if (r > 0.0)"
-+  "    normcoord *= clamp (r, 0.0, 0.275) / r;"
-   "  texturecoord = normcoord + 0.5;"
-   "  gl_FragColor = texture2D (tex, texturecoord);"
-   "}";
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
index fb974a5..928d2d4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
@@ -17,11 +17,10 @@ SRC_URI = " \
     file://0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch \
     file://0005-glshader-add-glBindFragDataLocation.patch \
     file://0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch \
-    file://0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch \
     file://0008-gl-implement-GstGLMemoryEGL.patch \
 "
-SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
-SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
+SRC_URI[md5sum] = "955281a43e98c5464563fa049e0a0911"
+SRC_URI[sha256sum] = "7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
index 3af6af2..986b5ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.3.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
 "
 
-SRC_URI[md5sum] = "f55254ca18b845a9a7d8fe671bc09c24"
-SRC_URI[sha256sum] = "9d7109c8fb0a5dec8edb17b0053c59a46aba7ddf48dc48ea822ebbbd4339d38d"
+SRC_URI[md5sum] = "4d03dd81828ea6b98a44c8f1ab7f4976"
+SRC_URI[sha256sum] = "114871d4d63606b4af424a8433cd923e4ff66896b244bb7ac97b9da47f71e79e"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
similarity index 83%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
index b1728db..5cc6578 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
 "
 
-SRC_URI[md5sum] = "1ad652a98c2106f6d839dfba8d310d23"
-SRC_URI[sha256sum] = "8d7549118a3b7a009ece6bb38a05b66709c551d32d2adfd89eded4d1d7a23944"
+SRC_URI[md5sum] = "473ebb1f15c67de99ddb6e4d027c0876"
+SRC_URI[sha256sum] = "a1d6579ba203a7734927c24b90bf6590d846c5a5fcec01a48201018c8ad2827a"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
index d313ef3..2745937 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.8.3.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "f781790cf64b44522b01ab560f16d4de"
-SRC_URI[sha256sum] = "9c5b33a2a98fc1d6d6c99a1b536b1fb2de45f53cc8bf8ab85a8b8141fed1a8ac"
+SRC_URI[md5sum] = "4fc66c77253b0ad5ce224bda654b2e7d"
+SRC_URI[sha256sum] = "6fa2599fdd072d31fbaf50c34af406e2be944a010b1f4eab67a5fe32a0310693"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb
deleted file mode 100644
index 01abafb..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-include gstreamer1.0-rtsp-server.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
-
-SRC_URI[md5sum] = "193ae75a676f39294f64b162bbe2369d"
-SRC_URI[sha256sum] = "7d414cd4302ae253821dcb22d483fadc9d21cf96b5fd4c0a33fd41960f8e0459"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb
new file mode 100644
index 0000000..17059d0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.8.3.bb
@@ -0,0 +1,6 @@
+include gstreamer1.0-rtsp-server.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+
+SRC_URI[md5sum] = "e4b07b10dd65b6c26c9ca5f72e59297b"
+SRC_URI[sha256sum] = "010f06800c1c957851d1352e5ec7a8ba3ce6a857fec1b8afc7d1a9e5f53288bf"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.3.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.3.bb
index 98f2d1a..d3561eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.8.3.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "0f011ee793cbcfa96d6b51d8271349fa"
-SRC_URI[sha256sum] = "9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341"
+SRC_URI[md5sum] = "e88dad542df9d986822e982105d2b530"
+SRC_URI[sha256sum] = "66b37762d4fdcd63bce5a2bec57e055f92420e95037361609900278c0db7c53f"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.4.0


