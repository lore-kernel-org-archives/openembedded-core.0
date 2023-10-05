Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B86E93704
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 10:44:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12191.1696502681447826264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 03:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B8eAyseT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86422aec44=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3959pAlM016594
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Oct 2023 03:44:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PW/D1
	SyFxjFm5MvXDpNopoz/oU1gDclnmdVPgbmcF5Q=; b=B8eAyseTjDdOD6PYc/8Dx
	IicPx1mUbNoCrgj7vyVEzwjJxA4gzFVhmYew+7VgKrsRAWp9xPRPJsdS5njdWuQd
	1FDlM7ZlO+y84t0yHe0FWoHXFkFs4ylDlxZ3jTb6xn7c2kzYqCzsrZlien7G+joP
	84CNkcesDNOpP1HB2pXridiJ/tqrv6pg4SozT+6GT5CfdXC5cewHozW5SX0JexFM
	+ZtQC/QLVn+kVVptSRGTS97vhttQ6bNAuoTdf13wA8YMKlkjuxqZ43wLoiU4DU68
	gxF4JaAtBSBC9t5jp/PxPJK/oCQUTGDdqoq2+RBiXcoGBrLDGcaYAJvTnzcelBpL
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thtvgg12q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 03:44:40 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 03:44:38 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][mickledore][PATCH V2 1/1] gstreamer: upgrade 1.22.5 -> 1.22.6
Date: Thu, 5 Oct 2023 10:44:26 +0000
Message-ID: <20231005104426.3051680-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 9DjO9ZIP1d6LvofqgzKCHzoUSdPZyl8D
X-Proofpoint-ORIG-GUID: 9DjO9ZIP1d6LvofqgzKCHzoUSdPZyl8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=924
 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310050082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 10:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188715

This release only contains bugfixes and security fixes.

Highlighted bugfixes in 1.22.6:

Security fixes for the MXF demuxer and H.265 video parser
Fix latency regression in H.264 hardware decoder base class
androidmedia: fix HEVC codec profile registration and fix coded_data handling
decodebin3: fix switching from a raw stream to an encoded stream
gst-inspect: prettier and more correct signal and action signals printing
rtmp2: Allow NULL flash version, omitting the field, for better RTMP server compatibility
rtspsrc: better compatibility with buggy RTSP servers that don't set a clock-rate
rtpjitterbuffer: fix integer overflow that led to more packets being declared lost than have been lost
v4l2: fix video encoding regression on RPi and fix support for left and top padding
waylandsink: Crop surfaces to their display width height
cerbero: recognise Manjaro; add Rust support for MSVC ARM64; cmake detection fixes
various bug fixes, build fixes, memory leak fixes, and other stability and reliability improvements

https://nvd.nist.gov/vuln/detail/CVE-2023-40474
https://nvd.nist.gov/vuln/detail/CVE-2023-40475
https://nvd.nist.gov/vuln/detail/CVE-2023-40476

https://gstreamer.freedesktop.org/releases/1.22/#1.22.6

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{gst-devtools_1.22.5.bb => gst-devtools_1.22.6.bb}          | 2 +-
 ...streamer1.0-libav_1.22.5.bb => gstreamer1.0-libav_1.22.6.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb}  | 2 +-
 ...plugins-bad_1.22.5.bb => gstreamer1.0-plugins-bad_1.22.6.bb} | 2 +-
 ...ugins-base_1.22.5.bb => gstreamer1.0-plugins-base_1.22.6.bb} | 2 +-
 ...ugins-good_1.22.5.bb => gstreamer1.0-plugins-good_1.22.6.bb} | 2 +-
 ...ugins-ugly_1.22.5.bb => gstreamer1.0-plugins-ugly_1.22.6.bb} | 2 +-
 ...reamer1.0-python_1.22.5.bb => gstreamer1.0-python_1.22.6.bb} | 2 +-
 ...rtsp-server_1.22.5.bb => gstreamer1.0-rtsp-server_1.22.6.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} | 2 +-
 .../{gstreamer1.0_1.22.5.bb => gstreamer1.0_1.22.6.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.5.bb => gst-devtools_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.5.bb => gstreamer1.0-libav_1.22.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.5.bb => gstreamer1.0-omx_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.5.bb => gstreamer1.0-plugins-bad_1.22.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.5.bb => gstreamer1.0-plugins-base_1.22.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.5.bb => gstreamer1.0-plugins-good_1.22.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.5.bb => gstreamer1.0-plugins-ugly_1.22.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.5.bb => gstreamer1.0-python_1.22.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.5.bb => gstreamer1.0-rtsp-server_1.22.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.5.bb => gstreamer1.0-vaapi_1.22.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.5.bb => gstreamer1.0_1.22.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
index 3e029396a6..90bbd9c733 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "2add1519aa6eeb01d544cb94293688ee3bc2079f6bca6075bf5c23d00a0921be"
+SRC_URI[sha256sum] = "8928560efaf16137c30285e718708e5d0bab0777eb4ef8127e0274e120d3d86b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
index af9dc5d2d5..8906556b44 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8583f0c1f4fcb01eed11fa1e3c21126543a8bd739ed4fc1db31f756a5ab01d9a"
+SRC_URI[sha256sum] = "7789e6408388a25f23cbf948cfc5c6230d735bbcd8b7f37f4a01c9e348a1e3a7"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
index 5d99810cd4..2579aa3d66 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "cf0cb9c4de06c5d62eef77cb31238bbaf257dc88802010072eedd1c168f136a4"
+SRC_URI[sha256sum] = "223833c42518ad7eb1923bb4dd3726809f59a66d6e9aaaa69cb29ad0750c8758"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
index 94e5bb894c..35c6003cc1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.6.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "e64e75cdafd7ff2fc7fc34e855b06b1e3ed227cc06fa378d17bbcd76780c338c"
+SRC_URI[sha256sum] = "b4029cd2908a089c55f1d902a565d007495c95b1442d838485dc47fb12df7137"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
index 74105a44e7..45b806e800 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "edd4338b45c26a9af28c0d35aab964a024c3884ba6f520d8428df04212c8c93a"
+SRC_URI[sha256sum] = "50f2b4d17c02eefe430bbefa8c5cd134b1be78a53c0f60e951136d96cf49fd4b"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
index 93f0e76ee9..6b76ba957e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "b67b31313a54c6929b82969d41d3cfdf2f58db573fb5f491e6bba5d84aea0778"
+SRC_URI[sha256sum] = "b3b07fe3f1ce7fe93aa9be7217866044548f35c4a7792280eec7e108a32f9817"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
index 29d705aaaf..77f79a630a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.6.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "2680473b218158f18467cac3e1c50291b7ff4e0710dd350a59eaacbc29c09a54"
+SRC_URI[sha256sum] = "3e31454c98cb2f7f6d2d355eceb933a892fa0f1dc09bc36c9abc930d8e29ca48"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
index be817bf3f5..addf12c427 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "bf05232415cf6018142ae51dd3b897bb73432687b5ce1786bf46edc6298ce5b0"
+SRC_URI[sha256sum] = "51de2d6d13b12ce095eac97c0b94ee59c2aeba3712bb7462b78c4d57dde176c5"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
index 84c51e8a6c..fd79fe4324 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f343eb54964ebd4d8c071be5eecad586f28feb0156e036e06b148d0e7febb1c0"
+SRC_URI[sha256sum] = "0ae33a8b50443b62f11581a9181e906b41cd3877b2d799dbea72912c3eda4bb3"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
index 231d252323..bf4c105057 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a9a550267c9584df0e8c70434d30476e8fd0018b733c1c1ee33deaf422bdb24b"
+SRC_URI[sha256sum] = "d9ba2fc26bef98c78e982c599f585d46bbb65fe122da89c2d7ab41f468a52c7b"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
index 2dacf037f8..a898464322 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.6.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "4408d7930f381809e85917acc19712f173261ba85bdf20c5567b2a21b1193b61"
+SRC_URI[sha256sum] = "f500e6cfddff55908f937711fc26a0840de28a1e9ec49621c0b6f1adbd8f818e"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.40.0


