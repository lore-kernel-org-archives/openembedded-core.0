Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D874BC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 11:06:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.16305.1671620807078716054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 03:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FTFzCjZo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671620805; i=@fujitsu.com;
	bh=Rzb2uLcOsEzKMbzznZrBX3DYRCjIumi1ySgG/b6f1W4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FTFzCjZoLptYcF2058EC153OfzYrCO+zg1m/XR8VMmSj95sniQHRJLGwL62nWkUHX
	 LGWb6vYLNMr6lzCzJwng9F8nop5cKStCtGxM/XZVhFiMDACPrpoPbcQR+xoQBm4ohD
	 QlN2tLQ2Gluy984PCCdNHaXx+DjREZnv7qC4alfkaWWKdhq5Oybybmbt6YfgkE9XLU
	 951+xftiJW1VIyzhCnq6GWnZoA23VHkQPkwCrTrLhoPKA7Hy1iOJYPtXLUdEznWETp
	 DfvxGunrgScnnI0zTubpDYEG3fmjUVd8B5nykAlgETIJ+783W4m8yWQJ0ZtDiIafF6
	 CD7AkFSzZdS2A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqHvkxaJ
  kg9fbpSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyePbeZC1oLK9pvTWJtYDyf3sXIxSEk8JhR
  YuuSXkYI5xqTxL+fM1khnD2MEv0nutm6GDk52ASkJG7c/w9kc3CICOhJXP0nChJmFlCRePG7h
  x3EFhZwkVh/fCYjSAmLgKrE8RZhkDCvgJPE1rXvGUFsCQEFiSkP3zNDxAUlTs58wgIxRkLi4I
  sXzBA1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpmuolFWW
  mZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGYkpxgtMOxinL
  /ugdYpTkYFIS5V1+ZlGyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneF0+BcoJFqempFWmZOcC4g
  ElLcPAoifBmgaR5iwsSc4sz0yFSpxgVpcR5d4EkBEASGaV5cG2wWLzEKCslzMvIwMAgxFOQWp
  SbWYIq/4pRnINRSZh3EsgUnsy8Erjpr4AWMwEtnnZzIcjikkSElFQDk7hFan5ju2FF57w5XjX
  Zr7dOSdBV6uBX16qc0p/krxkWtnRHw7wgh94Kt6jrveUyZn5TH7QfZMnYtt/53NwjVv7pD0RO
  zXKeUPRgysLUZ1bcrIof5Iz43+k06M3fONVm2oYiJxbHt9vO/bzhfWLJLjE/q5Vc29r/TUkwq
  Gkyy3qgMF9gxYtJ343fXFx0ZF2gUsk8F0X5Jyt3Xm1esq7ddZbFiYhDW7M5+X+eqllQnPDF5J
  b54ucLd1+V9+pt5TFc4i7oWrXT8kPPphvFDp1+IU527xSP/njHsvKee9IStVllXD8v7zfbpG5
  ZcXdDZJ789sTTB/ouhvib7Tcs0IjS/MSYZSj+fJ+h1Zy9fcKPlFiKMxINtZiLihMBs293AkAD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1671620804!98342!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9576 invoked from network); 21 Dec 2022 11:06:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 11:06:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C678510018D
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 11:06:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BA50B100043
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 11:06:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 11:06:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] gstreamer1.0: upgrade 1.20.4 -> 1.20.5
Date: Wed, 21 Dec 2022 19:05:56 +0800
Message-ID: <1671620756-15402-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 11:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174905

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
systemclock waiting fixes for certain 32-bit platforms/libcs
alphacombine: robustness improvements for corner case scenarios
avfvideosrc: Report latency when doing screen capture
d3d11videosink: various thread-safety and stability fixes
decklink: fix performance issue when HDMI signal has been lost for a long time
flacparse: Fix handling of headers advertising 32 bits per sample
mpegts: Handle when iconv doesn't support ISO 6937 (e.g. musl libc)
opengl: fix automatic dispmanx detection for rpi4 and fix usage of eglCreate/DestroyImage
opusdec: Various channel-related fixes
textrender: event handling fixes, esp. for GAP event
subparse: Fix non-closed tag handling
videoscale: fix handling of unknown buffer metas
videosink: reverse playback handling fixes
qtmux: Prefill mode fixes, especially for raw audio
multiudpsink: allow binding to IPv6 address
rtspsrc: Fix usage of IPv6 connections in SETUP
rtspsrc: Only EOS on timeout if all streams are timed out/EOS
splitmuxsrc: fix playback stall if there are unlinked pads
v4l2: Fix SIGSEGV on state change during format changes
wavparse robustness fixes
Fix static linking on macOS (opengl, vulkan)
gstreamer-vaapi: fix headless build against mesa >= 22.3.0
GStreamer Editing Services library: Fix build with tools disabled
webrtc example/demo fixes
unit test fixes for aesdec and rtpjitterbuffer
Cerbero: Fix ios cross-compile with cmake on M1; some recipe updates and other build fixes
Binary packages: pkg-config file fixes for various recipes (ffmpeg, taglib, gstreamer)
Binary packages: Enable high bitdepth support for libvpx (VP8/VP9 encoding/decoding)
Binary packages: ship aes plugin
Miscellaneous bug fixes, memory leak fixes, and other stability and reliability improvements
Performance improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.20.4.bb => gst-devtools_1.20.5.bb}          | 2 +-
 ...streamer1.0-libav_1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} | 2 +-
 .../{gstreamer1.0-omx_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb}  | 2 +-
 ...plugins-bad_1.20.4.bb => gstreamer1.0-plugins-bad_1.20.5.bb} | 2 +-
 ...ugins-base_1.20.4.bb => gstreamer1.0-plugins-base_1.20.5.bb} | 2 +-
 ...ugins-good_1.20.4.bb => gstreamer1.0-plugins-good_1.20.5.bb} | 2 +-
 ...ugins-ugly_1.20.4.bb => gstreamer1.0-plugins-ugly_1.20.5.bb} | 2 +-
 ...reamer1.0-python_1.20.4.bb => gstreamer1.0-python_1.20.5.bb} | 2 +-
 ...rtsp-server_1.20.4.bb => gstreamer1.0-rtsp-server_1.20.5.bb} | 2 +-
 ...streamer1.0-vaapi_1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} | 2 +-
 .../{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.4.bb => gst-devtools_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.4.bb => gstreamer1.0-libav_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.4.bb => gstreamer1.0-omx_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.4.bb => gstreamer1.0-plugins-bad_1.20.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.4.bb => gstreamer1.0-plugins-base_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.4.bb => gstreamer1.0-plugins-good_1.20.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.4.bb => gstreamer1.0-plugins-ugly_1.20.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.4.bb => gstreamer1.0-python_1.20.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.4.bb => gstreamer1.0-rtsp-server_1.20.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.4.bb => gstreamer1.0-vaapi_1.20.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.4.bb => gstreamer1.0_1.20.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
index 09b6e5a497..9db31c18e4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "82a293600273f4dd3eed567aae510ca0c7d629c3807788b00e6cdbd1d2459a84"
+SRC_URI[sha256sum] = "5684436121b8bae07fd00b74395f95e44b5f26323dce4fa045fa665676807bba"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
index e23cf2e337..e5925c6510 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "04ccbdd58fb31dd94098da599209834a0e7661638c5703381dd0a862c56fc532"
+SRC_URI[sha256sum] = "b152e3cc49d014899f53c39d8a6224a44e1399b4cf76aa5f9a903fdf9793c3cc"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
index 4d63db89a7..ec5efcd408 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "70ddd485e2dcab79070164d61ad2ff3a63e15a1d7abf9075d86eb77762b0edfd"
+SRC_URI[sha256sum] = "bcccbc02548cdc123fd49944dd44a4f1adc5d107e36f010d320eb526e2107806"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
index 0eac1322a3..2f1793d1ce 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.5.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "a1a3f53b3604d9a04fdd0bf9a1a616c3d2dab5320489e9ecee1178e81e33a16a"
+SRC_URI[sha256sum] = "f431214b0754d7037adcde93c3195106196588973e5b32dcb24938805f866363"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
index a0f238a59d..c37b542c57 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "8d181b7abe4caf23ee9f9ec5b4d3e232640452464e39495bfffb6d776fc97225"
+SRC_URI[sha256sum] = "11f911ef65f3095d7cf698a1ad1fc5242ac3ad6c9270465fb5c9e7f4f9c19b35"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
index f690735989..f7ade89ef8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "b16130fbe632fa8547c2147a0ef575b0140fb521065c5cb121c72ddbd23b64da"
+SRC_URI[sha256sum] = "e83ab4d12ca24959489bbb0ec4fac9b90e32f741d49cda357cb554b2cb8b97f9"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
index 94b8c8e2cf..f765e626c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.5.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "5c9ec6bab96517e438b3f9bae0ceb84d3436f3da9bbe180cf4d28e32a7251b59"
+SRC_URI[sha256sum] = "af67d8ba7cab230f64d0594352112c2c443e2aa36a87c35f9f98a43d11430b87"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
index b514989864..05e9ace276 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5eb4136d03e2a495f4499c8b2e6d9d3e7b5e73c5a8b8acf9213d57bc6a7bd3c1"
+SRC_URI[sha256sum] = "27487652318659cfd7dc42784b713c78d29cc7a7df4fb397134c8c125f65e3b2"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
index 4137b4993b..c9cf42903d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "88d9ef634e59aeb8cc183ad5ae444557c5a88dd49d833b9072bc6e1fae6a3d7d"
+SRC_URI[sha256sum] = "ba398a7ddd559cce56ef4b91f448d174e0dccad98a493563d2d59c41a2ef39c5"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
index 81ec23d26e..716f50ebe1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ab12596144c05506e9782374c5d2cdfb3069fca89908d6de360d947bb77fd06a"
+SRC_URI[sha256sum] = "510c6fb4ff3f676d7946ce1800e04ccf5aabe5a586d4e164d1961808fab8c94b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
index d0ba2919ee..bb4dba3861 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f"
+SRC_URI[sha256sum] = "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.25.1


