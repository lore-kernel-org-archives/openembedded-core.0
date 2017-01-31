Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0A03D76536
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 21:03:26 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id w20so177150701qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 13:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=BgAKwwNopVPrOfeEs+FbFrlTWRRB6EdG5OtM5xNZ6aw=;
	b=iCj2Zr9WTDASuAQiVaAjpmrVVwRxM24z6QJFaO1OGpyoM4L0akuIXBIHW+030fw1C0
	X8VI8/iESde32jE1OTTvyUfqIZj7C3Z8pt/9iRkwbJ1QL+vDesAhpmtYIrUqjyvsKKKW
	QwXAg99XgbSoEV8P5jG2oOlN/RxeCL+pNTK4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BgAKwwNopVPrOfeEs+FbFrlTWRRB6EdG5OtM5xNZ6aw=;
	b=JLHpvKgC7gO25u3/T0t/hEWmSm16asUkuD+b83RkQ1H6x6DX4byMGstuzqWWJ/h3HC
	HL1Fu0W9EX8020SQPvzCTUmz+cxCF2zljAbC/rwpqzRDbXGZSyjmoF99HEfiNs1qkGgp
	GpV5UCdS0USFaqhGkBgR6tx958AZ4QSyB+SXZ6JPHsxFNPLW+O7gLg9Z7psFrMuWGFzd
	BHg5a9DTv1tMghN+GjQBPo9sGWL35G1L9MOlUCWsji7OlGuTbwfpt5N66G8OvZJ9gU6C
	CQeCeHwQ0k1hlrRtFS/stZ6gQswERf03Pt4ckjzY/Zq4qntUDo4JoygG4oKUiigz5Gjh
	KMoA==
X-Gm-Message-State: AIkVDXKjbOXmk3TvV+QNKQxyiJuWRjAFRGEgCWCRLdm7mZt1Fu6TdjlRlucGH8e8jPNpGMAm
X-Received: by 10.200.45.5 with SMTP id n5mr26642349qta.174.1485896606675;
	Tue, 31 Jan 2017 13:03:26 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	z123sm13916808qkd.45.2017.01.31.13.03.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 13:03:26 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 22:03:03 +0100
Message-Id: <20170131210303.19551-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] gstreamer: update to 1.10.3
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
X-List-Received-Date: Tue, 31 Jan 2017 21:03:27 -0000

New bugfix release:
* updated version/checksums
* removed 1 patch in -good which was merged upstream

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...ibav_1.10.2.bb => gstreamer1.0-libav_1.10.3.bb} |  4 +--
 ....0-omx_1.10.2.bb => gstreamer1.0-omx_1.10.3.bb} |  4 +--
 ....10.2.bb => gstreamer1.0-plugins-bad_1.10.3.bb} |  4 +--
 ...10.2.bb => gstreamer1.0-plugins-base_1.10.3.bb} |  4 +--
 ...e-seqh-after-calling-qtdemux_parse_svq3_s.patch | 33 ----------------------
 ...10.2.bb => gstreamer1.0-plugins-good_1.10.3.bb} |  5 ++--
 ...10.2.bb => gstreamer1.0-plugins-ugly_1.10.3.bb} |  4 +--
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb   |  6 ----
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb   |  6 ++++
 .../gstreamer/gstreamer1.0-vaapi_1.10.2.bb         |  5 ----
 .../gstreamer/gstreamer1.0-vaapi_1.10.3.bb         |  5 ++++
 ...treamer1.0_1.10.2.bb => gstreamer1.0_1.10.3.bb} |  4 +--
 12 files changed, 25 insertions(+), 59 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.2.bb => gstreamer1.0-libav_1.10.3.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.2.bb => gstreamer1.0-omx_1.10.3.bb} (69%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.2.bb => gstreamer1.0-plugins-bad_1.10.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.2.bb => gstreamer1.0-plugins-base_1.10.3.bb} (86%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.2.bb => gstreamer1.0-plugins-good_1.10.3.bb} (78%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.2.bb => gstreamer1.0-plugins-ugly_1.10.3.bb} (76%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.2.bb => gstreamer1.0_1.10.3.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.3.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.3.bb
index ed51a4fdaf..39afbebefc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.3.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
     file://mips64_cpu_detection.patch \
 "
-SRC_URI[md5sum] = "420d0a32f47ef02cc615f8cf6da1e94d"
-SRC_URI[sha256sum] = "a3dd7036211f061e1eda04f985b7a9dd1a91b754f767ff2587eb6ec28f44e73c"
+SRC_URI[md5sum] = "ce1ea598f07c8bf728a33c7da39ec308"
+SRC_URI[sha256sum] = "9a6bc165b1862b18b98d9f1755c43806e4839a80f69ec7ea9a2dab61b65752a9"
 
 S = "${WORKDIR}/gst-libav-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.3.bb
similarity index 69%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.3.bb
index 643e83642e..7d06a56612 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.10.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
-SRC_URI[md5sum] = "d8395c2d7bbe05517cd20f608813f03c"
-SRC_URI[sha256sum] = "c069a9cf775c92f889ca8f3b2fc718e428cd0579b7b805851a960c850a7aa497"
+SRC_URI[md5sum] = "1eead212796151d6ac08e091bacbd190"
+SRC_URI[sha256sum] = "dd88451e175df7a6b6f619eff0f43a6078054ec7068787b19faf89af94cdb6e1"
 
 S = "${WORKDIR}/gst-omx-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.3.bb
index c469acafd3..5bb1543651 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.3.bb
@@ -19,8 +19,8 @@ SRC_URI = " \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
 "
-SRC_URI[md5sum] = "823f4c33fe27c61332c0122273217988"
-SRC_URI[sha256sum] = "0795ca9303a99cc7e44dda0e6e18524de02b39892e4b68eaba488f7b9db53a3a"
+SRC_URI[md5sum] = "e59798c86a670041de2e61856ea43d2a"
+SRC_URI[sha256sum] = "24099351fb6984c9e7560de06e072ff2e33d0b2db38b8fcc7afefb536e5094e7"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.3.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.3.bb
index b756ed91e2..e02974c10c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.3.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "8efa9e9ad9a841a900359604da82fb8b"
-SRC_URI[sha256sum] = "fbc0d40fcb746d2efe2ea47444674029912f66e6107f232766d33b722b97de20"
+SRC_URI[md5sum] = "12fe89a5536a0c7536c19875928637c2"
+SRC_URI[sha256sum] = "e6299617d705a0cbfb535107c1d3a8fc0f0967f14193a8c5c7583f46a88b1710"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch
deleted file mode 100644
index 3428790003..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 29433495d697e4dcb3bc50ff0e0d866acb949890 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Wed, 11 Jan 2017 17:53:32 -0800
-Subject: [PATCH] qtdemux: free seqh after calling
- qtdemux_parse_svq3_stsd_data()
-
-The seqh buffer allocated in qtdemux_parse_svq3_stsd_data() needs to
-be freed by the caller after use.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=777157
-
-Upstream-Status: Backport
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- gst/isomp4/qtdemux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
-index e105809..7a431e0 100644
---- a/gst/isomp4/qtdemux.c
-+++ b/gst/isomp4/qtdemux.c
-@@ -10375,6 +10375,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
-              * than its own fourcc */
-             gst_caps_set_simple (stream->caps, "seqh", GST_TYPE_BUFFER, seqh,
-                 NULL);
-+            gst_buffer_unref (seqh);
-           }
- 
-           GST_DEBUG_OBJECT (qtdemux, "found codec_data in stsd");
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.3.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.3.bb
index 6c119e5c76..0fc899cab0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.3.bb
@@ -10,9 +10,8 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-    file://qtdemux-free-seqh-after-calling-qtdemux_parse_svq3_s.patch \
 "
-SRC_URI[md5sum] = "65c4ff9d406c3ea9383b4d38a6504349"
-SRC_URI[sha256sum] = "198f325bcce982dce1ebeb36929a5f430b8bf9528e0d519e18df0b29e1d23313"
+SRC_URI[md5sum] = "fd841c574c081dc205ac07b587704fc8"
+SRC_URI[sha256sum] = "4e07e93e34d4b93208f1579c21e7d91a236577b36f128a5332ffee85b4465955"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.3.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.3.bb
index 95e3a2f309..87d5ba2686 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.3.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "c157f3fcb87db2a0f457667f3d3e6a26"
-SRC_URI[sha256sum] = "f303dd4c2ebc963e8b0b03c3069f70657bcf1cd62224d344ad579b3dda17ec9d"
+SRC_URI[md5sum] = "198b7a8eff3e0206d3b5660389df83ef"
+SRC_URI[sha256sum] = "c91597d03abff9df435ad4892eae44df1ee14159c7cc7317ac9d2766ff446bd2"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
deleted file mode 100644
index 85b4d0af4b..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require gstreamer1.0-rtsp-server.inc
-
-SRC_URI[md5sum] = "3ed8878f076e84c59b3ed5bd38ab31ed"
-SRC_URI[sha256sum] = "822dd6f754fea2bbf3369a7c388372f49b74668fb57943c1888675e544b07235"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb
new file mode 100644
index 0000000000..b1c56c0800
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.3.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-rtsp-server.inc
+
+SRC_URI[md5sum] = "2c6bdf872443a8b5bb567462c267bdb1"
+SRC_URI[sha256sum] = "baf9f7d229711cb3d823a447a930132f809b3321eab3535491bb01c8a21566fe"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb
deleted file mode 100644
index f944d121fe..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require gstreamer1.0-vaapi.inc
-SRC_URI[md5sum] = "cd8771280c8c00929cf7251c38a509dc"
-SRC_URI[sha256sum] = "9e31d2b85b2f30caa6b0cc1c6be10b96e1376668f13faa6a0f577d3693547fa9"
-
-DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb
new file mode 100644
index 0000000000..ae0b709f65
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.3.bb
@@ -0,0 +1,5 @@
+require gstreamer1.0-vaapi.inc
+SRC_URI[md5sum] = "ddd78e8f24b4736ad856c0de88531277"
+SRC_URI[sha256sum] = "cea827066a152a6afa1d0c43544dfbda285238156d4c3b77f9d4037bbe79361e"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.3.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.3.bb
index 4a01e8c731..ae2c1cf351 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.3.bb
@@ -7,7 +7,7 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://deterministic-unwind.patch \
 "
-SRC_URI[md5sum] = "0d289e5bcec6353e6540ddb75b7d371b"
-SRC_URI[sha256sum] = "150e8e81febac94c161d8141cde78a38038a8f56e8ec549f353da54994278d65"
+SRC_URI[md5sum] = "8c1806916107f79e88bc6ab5f6f7754e"
+SRC_URI[sha256sum] = "85b9dc1b2991f224fa90d534ec57014896c479e061dc9fa1bc16ae17cbebb63d"
 
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
2.11.0


