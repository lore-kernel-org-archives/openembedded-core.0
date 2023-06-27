Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419D9EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7569.1687850365378666149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101083387"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101083387"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:22 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9122CC68E5
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE1AED9688
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 308C16C833;
	Tue, 27 Jun 2023 16:19:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gstreamer1.0: upgrade 1.22.3 -> 1.22.4
Date: Tue, 27 Jun 2023 15:16:59 +0800
Message-Id: <1687850250-20040-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--15.842900-10.000000
X-TMASE-MatchedRID: aJfGYVVmw3ijz0nOeth/yfgWrMZvbmeHG24YVeuZGmMd3hIj0tmc7TK2
	ieu8M5yxtIgF3DmigN6vAO51yhjzjB64+emce0/+0QlBRwJqtSOFIJL35BQIZC99T+uJIleROxf
	QLcsk9qgfMd756TZlHfuQEiPerwdAMJ06gynx7orTCZHfjFFBz7Q8Ie2EE37Tr9pZ34FqRzWK6p
	2E8ZFRSkoDGBAVRyRVSrZ3ty36Jx3cSIn8Rl1+PmDtiwcUzMIgTJDl9FKHbrnrix/QSCPuKtb2e
	7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIJQ7jSode7x9ub08
	zdX1CvJaewE2WewJc5UX5H+y+yVY8m0l4hl+oyIyByMiwk6+3vlSepWcgdLPnLpaf0HcQL4RlzZ
	w9jZp3cphH+1BVbxs0u1S+8bZ2UF60j/UbRmWKN0KiTeJteVBTnSpwnlY4yGbKItl61J/yUGDDk
	bg1gJkKZDgIQINiWYgBwKKRHe+r3XmOwAD7Pzy55afbfRpayj4xwPmIm++UbEwDrAubzsz1Einp
	KrNn7g=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183443

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
==========
-   Security fixes for flacparse, dvdspu, and subparse
-   d3d11videosink: Fix error on pause and play
-   decklink: Correctly handle SDK strings on macOS and free strings
    after usage on Linux
-   filesink: Fix buffered mode writing of buffer lists and buffers with
    multiple memories
-   gldownload: handle passthrough without a critical
-   h265parse: Fix framerate handling regression
-   oggdemux: vp8 fixes
-   mp4mux, qtmux, qtdemux: Opus audio mapping fixes
-   pngdec: Fix wrong colours output from 16bit RGB images
-   ptp clock: Work around ptpd bug in default configuration
-   srtpdec: fix critical warnings on shutdown
-   v4l2src: fix support for bayer format
-   v4l2videoenc: support force-keyframe event in v4l2 encoder
-   vtenc: apply DTS offset to ensure DTS <= PTS
-   gst-python: allow more functions to be called before gst_init()
-   cerbero: fix vaapi variant; add qt6 build on windows; ensure errors
    on unguarded use of new APIs, require macOS 10.13
-   packages: ship codecalpha, rtponvif, dvbsubenc, switchbin,
    videosignal plugins; fix pango crash on 32-bit windows
-   various bug fixes, memory leak fixes, and other stability and
    reliability improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.22.3.bb => gst-devtools_1.22.4.bb}          | 2 +-
 ...streamer1.0-libav_1.22.3.bb => gstreamer1.0-libav_1.22.4.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.3.bb => gstreamer1.0-omx_1.22.4.bb}  | 2 +-
 ...plugins-bad_1.22.3.bb => gstreamer1.0-plugins-bad_1.22.4.bb} | 2 +-
 ...ugins-base_1.22.3.bb => gstreamer1.0-plugins-base_1.22.4.bb} | 2 +-
 ...ugins-good_1.22.3.bb => gstreamer1.0-plugins-good_1.22.4.bb} | 2 +-
 ...ugins-ugly_1.22.3.bb => gstreamer1.0-plugins-ugly_1.22.4.bb} | 2 +-
 ...reamer1.0-python_1.22.3.bb => gstreamer1.0-python_1.22.4.bb} | 2 +-
 ...rtsp-server_1.22.3.bb => gstreamer1.0-rtsp-server_1.22.4.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.3.bb => gstreamer1.0-vaapi_1.22.4.bb} | 2 +-
 .../{gstreamer1.0_1.22.3.bb => gstreamer1.0_1.22.4.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.3.bb => gst-devtools_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.3.bb => gstreamer1.0-libav_1.22.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.3.bb => gstreamer1.0-omx_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.3.bb => gstreamer1.0-plugins-bad_1.22.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.3.bb => gstreamer1.0-plugins-base_1.22.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.3.bb => gstreamer1.0-plugins-good_1.22.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.3.bb => gstreamer1.0-plugins-ugly_1.22.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.3.bb => gstreamer1.0-python_1.22.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.3.bb => gstreamer1.0-rtsp-server_1.22.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.3.bb => gstreamer1.0-vaapi_1.22.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.3.bb => gstreamer1.0_1.22.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
index fa82ef7861..beaf1a9b91 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "446ac9c42d502cbfd9081737cc1b853b3c1f50db77ca7ccd01aea10f687550c1"
+SRC_URI[sha256sum] = "4c52053ce8c1df72fd81721e9f53de3b146edcf2de28f607be705bce4cf909d1"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
index c5af676a95..4d59353e08 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2ec5c805808b4371a7e32b1da0202a1c8a6b36b6ce905080bf5c34097d12a923"
+SRC_URI[sha256sum] = "9a751bc740de768e791c37a95f0a924c6a41d12fd7f37f54ce6a4e834be122d3"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
index 694a12b1c1..fc70805daf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6f51c2331c334593c2c3cf12e9f22b9e3b419a3247cfb2fec0e1bd845569863a"
+SRC_URI[sha256sum] = "5fcb872d977b035fb75a2d0ea955ba052dc3bdae282f8f60aa9d865808784211"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
index 3aa53193af..16d53203a4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "e1798fee2d86127f0637481c607f983293bf0fd81aad70a5c7b47205af3621d8"
+SRC_URI[sha256sum] = "eaaf53224565eaabd505ca39c6d5769719b45795cf532ce1ceb60e1b2ebe99ac"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
index 44056b04e9..7b78c7d5c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "1c596289a0d4207380233eba8c36a932c4d1aceba19932937d9b57c24cef89f3"
+SRC_URI[sha256sum] = "292424e82dea170528c42b456f62a89532bcabc0508f192e34672fb86f68e5b8"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
index 8de1d1c5f5..0ae1758a3f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "af81154b3a2ef3f4d2feba395f25696feea6fd13ec62c92d3c7a973470710273"
+SRC_URI[sha256sum] = "d7120c1146a9d723d53d5bfe8074da2575a81f0598438752937f39bb7c833b6a"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
index 21102d59b6..1b3d3b6da7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.4.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "3dc98ed5c2293368b3c4e6ce55d89be834a0a62e9bf88ef17928cf03b7d5a360"
+SRC_URI[sha256sum] = "ffb461fda6c06d316c4be5682632cc8901454ed72b1098b1e0221bc55e673cd7"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
index 0cf1908e76..e35bef3d56 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "70bed3fabe634bc622ef6de4e6eb1c33bc9cefd64bdab200f6fa316b468c731c"
+SRC_URI[sha256sum] = "e1302dcc0f2451b64380dcc0dd3b82735795e8951dc812d938d8ba91f388163e"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
index 0f8a89db7c..29eb4bb011 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d02a39dfa9bdbf99a3dd2d378e17942b3ce42dfe36fb0c27e2d0b01722fc561d"
+SRC_URI[sha256sum] = "4666612d7a99c60dcd6f0bdba1b7a74d2562a0501b2a3e0576f0916bf1d8811b"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
index 6e0014c090..34c15bb377 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a27867062e8b69305fca5b7d3f13ed7c318b703e7d72756c94395bd305c7b32c"
+SRC_URI[sha256sum] = "967b8e353d82d0081a68dc53639b25d9fb4ca89bfa1e061403e0cd7d23585ba6"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
index ca7548758c..2eadb79637 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "9ffeab95053f9f6995eb3b3da225e88f21c129cd60da002d3f795db70d6d5974"
+SRC_URI[sha256sum] = "11cb0498bc16b93d8b99d22f75f829b8d0abfd8254840b2120618db5532dc655"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


