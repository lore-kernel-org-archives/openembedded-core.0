Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55A6EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:37:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11174.1692625025871772278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 06:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iD/ijvOp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75978d820d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37LCumJL006509
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 06:37:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=j7U2b
	kRVkGxLHDzW/V9fZBymDYMCJTo5g3O7zUiaBTY=; b=iD/ijvOpwbRZbmJAIAUZy
	wjY8f1wetYVJR6dxQqCDXbCX+EizqsiXQbBk0MFpy/1QRotGnrC7T6j1Tl31nQNH
	ne10IrOp6MUYgH6MtfrYla5QhSB6oG2zMsljSeWPNAeoVKWK5aRBGjY/MwrY8M9m
	4NUB/YsIcoRvQdEMgw5oKz520nbn1Ur2jOH3koCQoZPmNOIarvyEVnQ/nm/FCgyY
	TaWAumwHnOi/KCFc96WcbbcVgw5t9tvweDQq1xIZR6I2BM32ISwxf3fqmzNdVAyb
	zv/05D7NnZyuhQQE1DuemWUXX/mazHrRWY1ZDhm1K51aIrrw07Wb5e8Qm2xJNTdy
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjw8f1cxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 06:37:05 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 06:37:02 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] gstreamer1.0: upgrade 1.20.6 -> 1.20.7
Date: Mon, 21 Aug 2023 13:36:51 +0000
Message-ID: <20230821133651.3955053-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: -3i8TXd6rjQw1rSttHNzbkz1oLJdAuBi
X-Proofpoint-ORIG-GUID: -3i8TXd6rjQw1rSttHNzbkz1oLJdAuBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_01,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=971 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308210126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 13:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186444

This release only contains bugfixes.

Highlighted bugfixes in 1.20.7:

Security fixes for flacparse, dvdspu, and subparse, and the RealMedia demuxer
h265parse: Fix framerate handling
filesink: Fix buffered mode writing of buffer lists and buffers with multiple memories
asfmux, rtpbin_buffer_list test: fix possible unaligned write/read on 32-bit ARM
ptp clock: Work around bug in ptpd in default configuration
qtdemux: fix reverse playback regression with edit lists
rtspsrc: various control path handling server compatibility improvements
avviddec: fix potential deadlock on seeking with FFmpeg 6.x
cerbero: Fix pango crash on 32bit Windows; move libass into non-GPL codecs
Miscellaneous bug fixes, memory leak fixes, and other stability and reliability improvements

https://nvd.nist.gov/vuln/detail/CVE-2023-37327
https://nvd.nist.gov/vuln/detail/CVE-2023-37328
https://nvd.nist.gov/vuln/detail/CVE-2023-37329

https://gstreamer.freedesktop.org/releases/1.20/#1.20.7

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{gst-devtools_1.20.6.bb => gst-devtools_1.20.7.bb}          | 2 +-
 ...streamer1.0-libav_1.20.6.bb => gstreamer1.0-libav_1.20.7.bb} | 2 +-
 .../{gstreamer1.0-omx_1.20.6.bb => gstreamer1.0-omx_1.20.7.bb}  | 2 +-
 ...plugins-bad_1.20.6.bb => gstreamer1.0-plugins-bad_1.20.7.bb} | 2 +-
 ...ugins-base_1.20.6.bb => gstreamer1.0-plugins-base_1.20.7.bb} | 2 +-
 ...ugins-good_1.20.6.bb => gstreamer1.0-plugins-good_1.20.7.bb} | 2 +-
 ...ugins-ugly_1.20.6.bb => gstreamer1.0-plugins-ugly_1.20.7.bb} | 2 +-
 ...reamer1.0-python_1.20.6.bb => gstreamer1.0-python_1.20.7.bb} | 2 +-
 ...rtsp-server_1.20.6.bb => gstreamer1.0-rtsp-server_1.20.7.bb} | 2 +-
 ...streamer1.0-vaapi_1.20.6.bb => gstreamer1.0-vaapi_1.20.7.bb} | 2 +-
 .../{gstreamer1.0_1.20.6.bb => gstreamer1.0_1.20.7.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.6.bb => gst-devtools_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.6.bb => gstreamer1.0-libav_1.20.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.6.bb => gstreamer1.0-omx_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.6.bb => gstreamer1.0-plugins-bad_1.20.7.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.6.bb => gstreamer1.0-plugins-base_1.20.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.6.bb => gstreamer1.0-plugins-good_1.20.7.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.6.bb => gstreamer1.0-plugins-ugly_1.20.7.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.6.bb => gstreamer1.0-python_1.20.7.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.6.bb => gstreamer1.0-rtsp-server_1.20.7.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.6.bb => gstreamer1.0-vaapi_1.20.7.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.6.bb => gstreamer1.0_1.20.7.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.7.bb
index 2eee50e6d8..2409ea25e1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "2c64037c823fb88751a47dacf3d4752a52b7951190d6e05fc44855e912e81d71"
+SRC_URI[sha256sum] = "2df2ddfee05f6ce978207de9086ca22f00fc36e04f74a11869074da178585e35"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.7.bb
index c54913e8a1..f3f53893b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7d619a030542a4a5a11e0302742a3d9b05f8e5cfc453025683a0379bc50aa013"
+SRC_URI[sha256sum] = "65e776e366f7f3549a9a829418817f464dcc5dc9845220c64a886683d8841b56"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.7.bb
index b29d393bfe..bcbe0206d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "48e82008a2a0ad5f4b525aba8a6c49c4ca2d7d25c6b1b14d107dd747e26d5a8e"
+SRC_URI[sha256sum] = "e3dd418e3235db044104c1cb024f609e57035251fd1718e4e3e5d64780af1805"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index fdb4509691..86b5301d8e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "d98c73fa5cdddb372a91199464515cfc80c89bbe05e3d4387ea4381e4224483a"
+SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index 8d1aef1fc8..8822c6a905 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "54eac357d6cd66f183b94a26e493bf4d5781bc76bc60cad122742626caf8f1a3"
+SRC_URI[sha256sum] = "fde6696a91875095d82c1012b5777c28ba926047ffce08508e12c1d2c66f0057"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index 81f5dd0932..dfb0c0f342 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "e51365cfa9b19bd736dafe2c8828254a55d66996a3c60550bb0d50041c381a44"
+SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.7.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.7.bb
index e62e9e9815..1068bb4d80 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.7.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "ca3fb6abc9f6e981d204a736c254e50cc1786a2f5038d83023e42ea009b10246"
+SRC_URI[sha256sum] = "e761665bb3c66fb35ff3567a283b3763b494acf0fe1df8f4abeda047b22dbc55"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.7.bb
index 77745b8ba9..83445fab09 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "aa619e08ddd9f92755f4bd24ba9577e81ae4c86bff170c3e574153ec3cdc80cc"
+SRC_URI[sha256sum] = "a63db0cb502308446db3d3b0a23772f1966f9f2b98fddc22fca49560a0575adc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
index 017edec426..2901be69d2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "800122a798387bd4b18b558737d30a010d94154f41bd210d4c4cc2d80ecae90f"
+SRC_URI[sha256sum] = "2c8f46aa9df2245e5b39a2082be8e9d3edc0f61bc34f667803d7a21da1b51987"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.7.bb
index d67abf408c..21676bddde 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "57028a2cdabb749eb38a53f45cfa36f02b4e5368fb6d8684ef31d9e73ddf653b"
+SRC_URI[sha256sum] = "40b9747408c7066a1344adae001d2d53203adda012814944a1c0a5cff3f33dd6"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 7ceb319d9b..6d002198ae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "0545b030960680f71a95f9d39c95daae54b4d317d335e8f239d81138773c9b90"
+SRC_URI[sha256sum] = "1757184a07b9703219e8b1961f81cb1dd64320d147fc045ac8eb499efbea79be"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.40.0


