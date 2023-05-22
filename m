Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F12C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 18:42:15 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web10.3253.1684780931128474322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 11:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=ITo0pzMK;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Gt1kUOCtr81ev7nhSk9tIOdFFTngbjtr+JuBbzPRCE0=; b=ITo0pzMKoiXwgt1SRff6ykgmXr
	K3ztMPeIhTIQqh//s4jAGFsJHb02eKJsHzBSEQ+7JBXdtKuIGsgQBZo9ioAg7UJtxXhLbgztANj9J
	NMFk3iQWV5kxFVu1P81JdoTDyA6c95CDlRlRjYYHuXWu5OkVeE5+UkiC8jxd4w/10Uw6NFhLFSvnA
	+XBrOVlT8JfTHlX1YiDJaSavF6/W4pSdY3eH/W4omrJ1RVRzKNrRgkNT522XUxFyxNDzpjvFqg1Qn
	/EUffZvM/r610XMBbSN75SwQnJJkFGn07zEb6UEdpeVwDNxHoLGFr2z52G6KMVVEvGuHmQcMTIpSX
	NB1Sy+AQ==;
Received: from static-70-65-62-95.ipcom.comunitel.net ([95.62.65.70] helo=golpe.local.igalia.com)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1q1ATw-00GH8s-W4; Mon, 22 May 2023 20:42:09 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [OE-core][kirkstone][PATCH] gstreamer1.0: upgrade 1.20.5 -> 1.20.6
Date: Mon, 22 May 2023 20:40:39 +0200
Message-Id: <20230522184039.1346552-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 18:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181611

Changelog:
===========
audio: channel-mix: allow up to 64 channels instead of up to 63 channels
AOM AV1 encoder timestamp handling improvements
AV1 video codec caps handling improvements in aom plugin, isomp4 and matroska muxers/demuxers.
avvidenc: fix bitrate control and timestamps off FFmpeg-based video encoders
h264parse: fix missing timestamps on outputs when splitting a frame
rtspsrc: more workarounds for servers with broken control uri handling
playbin3: fix issue with UDP streams, making sure there's enough buffering
qmlglsrc: Fix deadlock when stopping and some other fixes
qtmux: fix default timescale unit for N/1001 framerates
v4l2h264dec: Fix Raspberry Pi4 will not play video in application
vtdec: Fix non-deterministic frame output after seeks
wasapi2src: Fix loopback capture on Windows 10 Anniversary Update
macOS, iOS: Fix Xcode 14 ABI breakage with older Xcode
cerbero: Fix some regressions for CentOS in the 1.20 branch
cerbero: Fix setuptools site.py breakage in Python 3.11
Fix gst-libav build against FFmpeg from git
gobject-introspection annotation fixes for bindings
Miscellaneous bug fixes, memory leak fixes, and other stability and reliability improvements
Performance improvements
---
 ...tools_1.20.5.bb => gst-devtools_1.20.6.bb} |   2 +-
 ...1.20.5.bb => gstreamer1.0-libav_1.20.6.bb} |   2 +-
 ...x_1.20.5.bb => gstreamer1.0-omx_1.20.6.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.20.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.20.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.20.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.20.6.bb} |   2 +-
 ....20.5.bb => gstreamer1.0-python_1.20.6.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.20.6.bb} |   2 +-
 ...1.20.5.bb => gstreamer1.0-vaapi_1.20.6.bb} |   2 +-
 ...005-bin-Fix-race-conditions-in-tests.patch | 300 ------------------
 ...er1.0_1.20.5.bb => gstreamer1.0_1.20.6.bb} |   3 +-
 12 files changed, 11 insertions(+), 312 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.5.bb => gst-devtools_1.20.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.5.bb => gstreamer1.0-libav_1.20.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.5.bb => gstreamer1.0-omx_1.20.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.5.bb => gstreamer1.0-plugins-bad_1.20.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.5.bb => gstreamer1.0-plugins-base_1.20.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.5.bb => gstreamer1.0-plugins-good_1.20.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.5.bb => gstreamer1.0-plugins-ugly_1.20.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.5.bb => gstreamer1.0-python_1.20.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.5.bb => gstreamer1.0-rtsp-server_1.20.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.5.bb => gstreamer1.0-vaapi_1.20.6.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.5.bb => gstreamer1.0_1.20.6.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb
index 9db31c18e4..2eee50e6d8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "5684436121b8bae07fd00b74395f95e44b5f26323dce4fa045fa665676807bba"
+SRC_URI[sha256sum] = "2c64037c823fb88751a47dacf3d4752a52b7951190d6e05fc44855e912e81d71"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb
index e5925c6510..c54913e8a1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b152e3cc49d014899f53c39d8a6224a44e1399b4cf76aa5f9a903fdf9793c3cc"
+SRC_URI[sha256sum] = "7d619a030542a4a5a11e0302742a3d9b05f8e5cfc453025683a0379bc50aa013"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb
index ec5efcd408..b29d393bfe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "bcccbc02548cdc123fd49944dd44a4f1adc5d107e36f010d320eb526e2107806"
+SRC_URI[sha256sum] = "48e82008a2a0ad5f4b525aba8a6c49c4ca2d7d25c6b1b14d107dd747e26d5a8e"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb
index 80766b9166..fdb4509691 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "f431214b0754d7037adcde93c3195106196588973e5b32dcb24938805f866363"
+SRC_URI[sha256sum] = "d98c73fa5cdddb372a91199464515cfc80c89bbe05e3d4387ea4381e4224483a"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb
index c37b542c57..8d1aef1fc8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "11f911ef65f3095d7cf698a1ad1fc5242ac3ad6c9270465fb5c9e7f4f9c19b35"
+SRC_URI[sha256sum] = "54eac357d6cd66f183b94a26e493bf4d5781bc76bc60cad122742626caf8f1a3"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb
index 80aed01973..81f5dd0932 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "e83ab4d12ca24959489bbb0ec4fac9b90e32f741d49cda357cb554b2cb8b97f9"
+SRC_URI[sha256sum] = "e51365cfa9b19bd736dafe2c8828254a55d66996a3c60550bb0d50041c381a44"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb
index f765e626c9..e62e9e9815 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "af67d8ba7cab230f64d0594352112c2c443e2aa36a87c35f9f98a43d11430b87"
+SRC_URI[sha256sum] = "ca3fb6abc9f6e981d204a736c254e50cc1786a2f5038d83023e42ea009b10246"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb
index 05e9ace276..77745b8ba9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "27487652318659cfd7dc42784b713c78d29cc7a7df4fb397134c8c125f65e3b2"
+SRC_URI[sha256sum] = "aa619e08ddd9f92755f4bd24ba9577e81ae4c86bff170c3e574153ec3cdc80cc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb
index c9cf42903d..017edec426 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ba398a7ddd559cce56ef4b91f448d174e0dccad98a493563d2d59c41a2ef39c5"
+SRC_URI[sha256sum] = "800122a798387bd4b18b558737d30a010d94154f41bd210d4c4cc2d80ecae90f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb
index 716f50ebe1..d67abf408c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "510c6fb4ff3f676d7946ce1800e04ccf5aabe5a586d4e164d1961808fab8c94b"
+SRC_URI[sha256sum] = "57028a2cdabb749eb38a53f45cfa36f02b4e5368fb6d8684ef31d9e73ddf653b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
deleted file mode 100644
index f1fac2df57..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bin-Fix-race-conditions-in-tests.patch
+++ /dev/null
@@ -1,300 +0,0 @@
-From e1e2d8d58c1e09e065849cdb1f6466c0537a7c51 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 21 Jun 2022 11:51:35 +0300
-Subject: [PATCH] bin: Fix race conditions in tests
-
-The latency messages are non-deterministic and can arrive before/after
-async-done or during state-changes as they are posted by e.g. sinks from
-their streaming thread but bins are finishing asynchronous state changes
-from a secondary helper thread.
-
-To solve this, expect latency messages at any time and assert that we
-receive one at some point during the test.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/2643]
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- .../gstreamer/tests/check/gst/gstbin.c        | 132 ++++++++++++------
- 1 file changed, 92 insertions(+), 40 deletions(-)
-
-diff --git a/subprojects/gstreamer/tests/check/gst/gstbin.c b/subprojects/gstreamer/tests/check/gst/gstbin.c
-index e366d5fe20f..88ff44db0c3 100644
---- a/subprojects/gstreamer/tests/check/gst/gstbin.c
-+++ b/subprojects/gstreamer/tests/check/gst/gstbin.c
-@@ -27,50 +27,95 @@
- #include <gst/base/gstbasesrc.h>
- 
- static void
--pop_async_done (GstBus * bus)
-+pop_async_done (GstBus * bus, gboolean * had_latency)
- {
-   GstMessage *message;
-+  GstMessageType types = GST_MESSAGE_ASYNC_DONE;
-+
-+  if (!*had_latency)
-+    types |= GST_MESSAGE_LATENCY;
- 
-   GST_DEBUG ("popping async-done message");
--  message = gst_bus_poll (bus, GST_MESSAGE_ASYNC_DONE, -1);
- 
--  fail_unless (message && GST_MESSAGE_TYPE (message)
--      == GST_MESSAGE_ASYNC_DONE, "did not get GST_MESSAGE_ASYNC_DONE");
-+  do {
-+    message = gst_bus_poll (bus, types, -1);
- 
--  gst_message_unref (message);
--  GST_DEBUG ("popped message");
-+    fail_unless (message);
-+    GST_DEBUG ("popped message %s",
-+        gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
-+
-+    if (GST_MESSAGE_TYPE (message) == GST_MESSAGE_LATENCY) {
-+      fail_unless (*had_latency == FALSE);
-+      *had_latency = TRUE;
-+      gst_clear_message (&message);
-+      types &= ~GST_MESSAGE_LATENCY;
-+      continue;
-+    }
-+
-+    fail_unless (GST_MESSAGE_TYPE (message)
-+        == GST_MESSAGE_ASYNC_DONE, "did not get GST_MESSAGE_ASYNC_DONE");
-+
-+    gst_clear_message (&message);
-+    break;
-+  } while (TRUE);
- }
- 
- static void
--pop_latency (GstBus * bus)
-+pop_latency (GstBus * bus, gboolean * had_latency)
- {
-   GstMessage *message;
- 
--  GST_DEBUG ("popping async-done message");
-+  if (*had_latency)
-+    return;
-+
-+  GST_DEBUG ("popping latency message");
-   message = gst_bus_poll (bus, GST_MESSAGE_LATENCY, -1);
- 
--  fail_unless (message && GST_MESSAGE_TYPE (message)
-+  fail_unless (message);
-+  fail_unless (GST_MESSAGE_TYPE (message)
-       == GST_MESSAGE_LATENCY, "did not get GST_MESSAGE_LATENCY");
- 
--  gst_message_unref (message);
--  GST_DEBUG ("popped message");
-+  GST_DEBUG ("popped message %s",
-+      gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
-+  gst_clear_message (&message);
-+
-+  *had_latency = TRUE;
- }
- 
- static void
--pop_state_changed (GstBus * bus, int count)
-+pop_state_changed (GstBus * bus, int count, gboolean * had_latency)
- {
-   GstMessage *message;
--
-+  GstMessageType types = GST_MESSAGE_STATE_CHANGED;
-   int i;
- 
-+  if (!*had_latency)
-+    types |= GST_MESSAGE_LATENCY;
-+
-   GST_DEBUG ("popping %d messages", count);
-   for (i = 0; i < count; ++i) {
--    message = gst_bus_poll (bus, GST_MESSAGE_STATE_CHANGED, -1);
--
--    fail_unless (message && GST_MESSAGE_TYPE (message)
--        == GST_MESSAGE_STATE_CHANGED, "did not get GST_MESSAGE_STATE_CHANGED");
--
--    gst_message_unref (message);
-+    do {
-+      message = gst_bus_poll (bus, types, -1);
-+
-+      fail_unless (message);
-+      GST_DEBUG ("popped message %s",
-+          gst_message_type_get_name (GST_MESSAGE_TYPE (message)));
-+
-+      if (GST_MESSAGE_TYPE (message) == GST_MESSAGE_LATENCY) {
-+        fail_unless (*had_latency == FALSE);
-+        *had_latency = TRUE;
-+        gst_clear_message (&message);
-+        types &= ~GST_MESSAGE_LATENCY;
-+        continue;
-+      }
-+
-+      fail_unless (GST_MESSAGE_TYPE (message)
-+          == GST_MESSAGE_STATE_CHANGED,
-+          "did not get GST_MESSAGE_STATE_CHANGED");
-+
-+      gst_message_unref (message);
-+      break;
-+    } while (TRUE);
-   }
-   GST_DEBUG ("popped %d messages", count);
- }
-@@ -538,6 +583,7 @@ GST_START_TEST (test_message_state_changed_children)
-   GstBus *bus;
-   GstStateChangeReturn ret;
-   GstState current, pending;
-+  gboolean had_latency = FALSE;
- 
-   pipeline = GST_PIPELINE (gst_pipeline_new (NULL));
-   fail_unless (pipeline != NULL, "Could not create pipeline");
-@@ -576,7 +622,7 @@ GST_START_TEST (test_message_state_changed_children)
-   ASSERT_OBJECT_REFCOUNT (sink, "sink", 2);
-   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 2);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
-   fail_if (gst_bus_have_pending (bus), "unexpected pending messages");
- 
-   ASSERT_OBJECT_REFCOUNT (bus, "bus", 2);
-@@ -619,9 +665,9 @@ GST_START_TEST (test_message_state_changed_children)
-    * its state_change message */
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (pipeline, "pipeline", 3, 4);
- 
--  pop_state_changed (bus, 3);
--  pop_async_done (bus);
--  pop_latency (bus);
-+  pop_state_changed (bus, 3, &had_latency);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
-   fail_if ((gst_bus_pop (bus)) != NULL);
- 
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (bus, "bus", 2, 3);
-@@ -648,7 +694,7 @@ GST_START_TEST (test_message_state_changed_children)
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (sink, "sink", 2, 4);
-   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 3);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
-   fail_if ((gst_bus_pop (bus)) != NULL);
- 
-   ASSERT_OBJECT_REFCOUNT (bus, "bus", 2);
-@@ -669,7 +715,7 @@ GST_START_TEST (test_message_state_changed_children)
-   ASSERT_OBJECT_REFCOUNT_BETWEEN (sink, "sink", 3, 4);
-   ASSERT_OBJECT_REFCOUNT (pipeline, "pipeline", 3);
- 
--  pop_state_changed (bus, 6);
-+  pop_state_changed (bus, 6, &had_latency);
-   fail_if ((gst_bus_pop (bus)) != NULL);
- 
-   ASSERT_OBJECT_REFCOUNT (src, "src", 1);
-@@ -696,6 +742,7 @@ GST_START_TEST (test_watch_for_state_change)
-   GstElement *src, *sink, *bin;
-   GstBus *bus;
-   GstStateChangeReturn ret;
-+  gboolean had_latency = FALSE;
- 
-   bin = gst_element_factory_make ("bin", NULL);
-   fail_unless (bin != NULL, "Could not create bin");
-@@ -722,9 +769,9 @@ GST_START_TEST (test_watch_for_state_change)
-       GST_CLOCK_TIME_NONE);
-   fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
- 
--  pop_state_changed (bus, 6);
--  pop_async_done (bus);
--  pop_latency (bus);
-+  pop_state_changed (bus, 6, &had_latency);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
- 
-   fail_unless (gst_bus_have_pending (bus) == FALSE,
-       "Unexpected messages on bus");
-@@ -732,16 +779,17 @@ GST_START_TEST (test_watch_for_state_change)
-   ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PLAYING);
-   fail_unless (ret == GST_STATE_CHANGE_SUCCESS);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
- 
-+  had_latency = FALSE;
-   /* this one might return either SUCCESS or ASYNC, likely SUCCESS */
-   ret = gst_element_set_state (GST_ELEMENT (bin), GST_STATE_PAUSED);
-   gst_element_get_state (GST_ELEMENT (bin), NULL, NULL, GST_CLOCK_TIME_NONE);
- 
--  pop_state_changed (bus, 3);
-+  pop_state_changed (bus, 3, &had_latency);
-   if (ret == GST_STATE_CHANGE_ASYNC) {
--    pop_async_done (bus);
--    pop_latency (bus);
-+    pop_async_done (bus, &had_latency);
-+    pop_latency (bus, &had_latency);
-   }
- 
-   fail_unless (gst_bus_have_pending (bus) == FALSE,
-@@ -898,6 +946,7 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
-   GstStateChangeReturn ret;
-   GstState current, pending;
-   GstBus *bus;
-+  gboolean had_latency = FALSE;
- 
-   pipeline = gst_pipeline_new (NULL);
-   fail_unless (pipeline != NULL, "Could not create pipeline");
-@@ -951,10 +1000,11 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
-   ASSERT_STATE_CHANGE_MSG (bus, sink, GST_STATE_READY, GST_STATE_PAUSED, 107);
- #else
- 
--  pop_state_changed (bus, 2);   /* pop remaining ready => paused messages off the bus */
-+  pop_state_changed (bus, 2, &had_latency);     /* pop remaining ready => paused messages off the bus */
-   ASSERT_STATE_CHANGE_MSG (bus, pipeline, GST_STATE_READY, GST_STATE_PAUSED,
-       108);
--  pop_async_done (bus);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
- #endif
-   /* PAUSED => PLAYING */
-   GST_DEBUG ("popping PAUSED -> PLAYING messages");
-@@ -972,8 +1022,8 @@ GST_START_TEST (test_children_state_change_order_flagged_sink)
-   fail_if (ret != GST_STATE_CHANGE_SUCCESS, "State change to READY failed");
- 
-   /* TODO: do we need to check downwards state change order as well? */
--  pop_state_changed (bus, 4);   /* pop playing => paused messages off the bus */
--  pop_state_changed (bus, 4);   /* pop paused => ready messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop playing => paused messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop paused => ready messages off the bus */
- 
-   while (GST_OBJECT_REFCOUNT_VALUE (pipeline) > 1)
-     THREAD_SWITCH ();
-@@ -1002,6 +1052,7 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
-   GstStateChangeReturn ret;
-   GstState current, pending;
-   GstBus *bus;
-+  gboolean had_latency = FALSE;
- 
-   /* (2) Now again, but check other code path where we don't have
-    *     a proper sink correctly flagged as such, but a 'semi-sink' */
-@@ -1056,10 +1107,11 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
-   ASSERT_STATE_CHANGE_MSG (bus, src, GST_STATE_READY, GST_STATE_PAUSED, 206);
-   ASSERT_STATE_CHANGE_MSG (bus, sink, GST_STATE_READY, GST_STATE_PAUSED, 207);
- #else
--  pop_state_changed (bus, 2);   /* pop remaining ready => paused messages off the bus */
-+  pop_state_changed (bus, 2, &had_latency);     /* pop remaining ready => paused messages off the bus */
-   ASSERT_STATE_CHANGE_MSG (bus, pipeline, GST_STATE_READY, GST_STATE_PAUSED,
-       208);
--  pop_async_done (bus);
-+  pop_async_done (bus, &had_latency);
-+  pop_latency (bus, &had_latency);
- 
-   /* PAUSED => PLAYING */
-   GST_DEBUG ("popping PAUSED -> PLAYING messages");
-@@ -1076,8 +1128,8 @@ GST_START_TEST (test_children_state_change_order_semi_sink)
-   fail_if (ret != GST_STATE_CHANGE_SUCCESS, "State change to READY failed");
- 
-   /* TODO: do we need to check downwards state change order as well? */
--  pop_state_changed (bus, 4);   /* pop playing => paused messages off the bus */
--  pop_state_changed (bus, 4);   /* pop paused => ready messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop playing => paused messages off the bus */
-+  pop_state_changed (bus, 4, &had_latency);     /* pop paused => ready messages off the bus */
- 
-   GST_DEBUG ("waiting for pipeline to reach refcount 1");
-   while (GST_OBJECT_REFCOUNT_VALUE (pipeline) > 1)
--- 
-GitLab
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb
index ce9c1c116f..7ceb319d9b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb
@@ -21,9 +21,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 \
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
-           file://0005-bin-Fix-race-conditions-in-tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
+SRC_URI[sha256sum] = "0545b030960680f71a95f9d39c95daae54b4d317d335e8f239d81138773c9b90"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


