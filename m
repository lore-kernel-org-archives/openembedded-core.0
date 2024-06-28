Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7EDC3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 13:57:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17720.1719583066523938024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jun 2024 06:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7909a800d7=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SA4fFq020007
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 06:57:46 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywsvywy2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 06:57:45 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 06:57:43 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] gstreamer: upgrade 1.22.11 -> 1.22.12
Date: Fri, 28 Jun 2024 13:57:29 +0000
Message-ID: <20240628135729.2005025-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: klVTCVw0cwo6dKhRGFba0vwWXOKU-UPH
X-Proofpoint-ORIG-GUID: klVTCVw0cwo6dKhRGFba0vwWXOKU-UPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_09,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406280104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jun 2024 13:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201223

From: Archana Polampalli <archana.polampalli@windriver.com>

https://gstreamer.freedesktop.org/releases/1.22/#1.22.12

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../{gst-devtools_1.22.11.bb => gst-devtools_1.22.12.bb}        | 2 +-
 ...reamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.22.12.bb} | 2 +-
 ...{gstreamer1.0-omx_1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} | 2 +-
 ...ugins-bad_1.22.11.bb => gstreamer1.0-plugins-bad_1.22.12.bb} | 2 +-
 ...ins-base_1.22.11.bb => gstreamer1.0-plugins-base_1.22.12.bb} | 2 +-
 ...ins-good_1.22.11.bb => gstreamer1.0-plugins-good_1.22.12.bb} | 2 +-
 ...ins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.22.12.bb} | 2 +-
 ...amer1.0-python_1.22.11.bb => gstreamer1.0-python_1.22.12.bb} | 2 +-
 ...sp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.22.12.bb} | 2 +-
 ...reamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.22.12.bb} | 2 +-
 .../{gstreamer1.0_1.22.11.bb => gstreamer1.0_1.22.12.bb}        | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.11.bb => gst-devtools_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.11.bb => gstreamer1.0-libav_1.22.12.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.11.bb => gstreamer1.0-omx_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.11.bb => gstreamer1.0-plugins-bad_1.22.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.11.bb => gstreamer1.0-plugins-base_1.22.12.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.11.bb => gstreamer1.0-plugins-good_1.22.12.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.11.bb => gstreamer1.0-plugins-ugly_1.22.12.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.11.bb => gstreamer1.0-python_1.22.12.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.22.12.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.11.bb => gstreamer1.0-vaapi_1.22.12.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.11.bb => gstreamer1.0_1.22.12.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.12.bb
index 2be406192f..c30341d1f0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.12.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "07766425ecb5bf857ab5ad3962321c55cd89f9386b720843f9df71c0a455eb9b"
+SRC_URI[sha256sum] = "015ff62789dab423edafe979b019c7de4c849a2b7e74912b20b74a70e5b68f72"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.12.bb
index f3287efa96..bd9ae2464e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6b13dcc9332ef27a7c1e7005c0196883874f91622f8aa6e52f218b05b15d2bf5"
+SRC_URI[sha256sum] = "3b60d4cac2fbcd085a93e9389ca23e0443bee1ca75574d31d4f12bb1bbecab48"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
index 97348fb398..4db16ed10b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.12.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "18dfdf5f6b773d67e62a315c6cf6247da320b83603a5819493f53c69ed2eeef6"
+SRC_URI[sha256sum] = "6b0685b92ac735032d7987d1028afaeab0a98ab726e0c51e5b9bfc8f2da7c8b1"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
index 523ee7a5ae..01c95ac85f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.12.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "808d3b33fc4c71aeb2561c364a87c2e8a3e2343319a83244c8391be4b09499c8"
+SRC_URI[sha256sum] = "388b4c4412f42e36a38b17cc34119bc11879bd4d9fbd4ff6d03b2c7fc6b4d494"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 7aa10eb646..5905c2d5b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "65eaf72296cc5edc985695a4d80affc931e64a79f4879d05615854f7a2cf5bd1"
+SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 85143aa1b9..8099d70791 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22faad52e2"
+SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.12.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.12.bb
index 61f46fbf7e..714ee178d8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.12.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "7758b7decfd20c00cae5700822bcbbf03f98c723e33e17634db2e07ca1da60bf"
+SRC_URI[sha256sum] = "d59a1aaf8dd2cc416dc5b5c0b7aecd02b1811bf1229aa724e6c2a503d3799083"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.12.bb
index 0fbb03f757..2eee5aee5e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.12.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f7a5450d93fd81bf46060dca7f4a048d095b6717961fec211731a11a994c99a7"
+SRC_URI[sha256sum] = "d98d3226efea20d5c440a28988a20319a953f7c594895df2bba4538633108e9f"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
index 554ed9ec8f..c89c22f334 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ec49d474750a6ff6729c85b448abc607fb6840b21717ad7abc967e2adbf07a24"
+SRC_URI[sha256sum] = "bf6c7871e7cf3528e4ec87ddc2f2949691cd269f98e536482ae744c1405cf451"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.12.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.12.bb
index 87eb8484a1..ef75ed64b3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6eae1360658302b9b512fa46b4d06f5b818dfce5f2f43d7d710ca8142719d8ad"
+SRC_URI[sha256sum] = "013ad729b2fe4fccda559bddc626bcb14230cfb90a2271049f8466bfec5d80df"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index 8965497d01..f4acb0977b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "3d16259e9dab8b002c57ce208a09b350d8282f5b0197306c0cdba9a0d0799744"
+SRC_URI[sha256sum] = "ac352f3d02caa67f3b169daa9aa78b04dea0fc08a727de73cb28d89bd54c6f61"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.40.0


