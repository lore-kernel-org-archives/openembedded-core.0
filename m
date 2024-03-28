Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6E5CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 19:41:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1274.1711654855293075270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 12:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JNv9qP0O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48170e758b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42SAtBHd000780
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 19:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=SECNp
	XBGszn2gUdMPAHwyEDwpX0X9ICdI/TxESHpzGU=; b=JNv9qP0OJJ27+sW7kc7LQ
	NX+IqNreBLrGzfSy0k7xY9BW3H4Jkw4xwuRgUeTHCKEyeP0hj/Apq7AfRqlgE/KF
	t2KTopcgebxHYwnwPihku9H5jUO4hkkeAfjIIZKx/i5xH6vK8mjwvDtS6mas7/Cr
	ndpxM9R6ByD9HXQ/YWWS8TGKCp/rdhCvBFSz6Gq/P8jLG6ibwQm+u5PW/9VqNMlN
	TTXF5ltSCjlc/atEZteinNQvqBtPjUpK7qp34nJi0k1xhe4Cm4UYIzFbNc7R8wVa
	PbzFtYd6ZIF/HAoqvQ/wX58khoWifUz+M6YfgR+IbE/zEKN82YsCiTnWUQgnas0D
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1p26qb73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 19:40:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 28 Mar 2024 12:40:52 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Thu, 28 Mar 2024 12:40:52 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gstreamer: upgrade 1.22.10 -> 1.22.11
Date: Thu, 28 Mar 2024 12:40:52 -0700
Message-ID: <20240328194052.3150232-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5vBHyjEuE-wqLY3dAfMO1WI_QfXVxq4c
X-Proofpoint-GUID: 5vBHyjEuE-wqLY3dAfMO1WI_QfXVxq4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_17,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 19:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197607

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Changelog:
   https://gstreamer.freedesktop.org/releases/1.22/#1.22.11

Change the Upstream-Status URL for patch:
   0002-ssaparse-enhance-SSA-text-lines-parsing.patch
since the bug tracker moved but the bug is not yet resolved.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../{gst-devtools_1.22.10.bb => gst-devtools_1.22.11.bb}        | 2 +-
 ...reamer1.0-libav_1.22.10.bb => gstreamer1.0-libav_1.22.11.bb} | 2 +-
 ...{gstreamer1.0-omx_1.22.10.bb => gstreamer1.0-omx_1.22.11.bb} | 2 +-
 ...ugins-bad_1.22.10.bb => gstreamer1.0-plugins-bad_1.22.11.bb} | 2 +-
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch          | 2 +-
 ...ins-base_1.22.10.bb => gstreamer1.0-plugins-base_1.22.11.bb} | 2 +-
 ...ins-good_1.22.10.bb => gstreamer1.0-plugins-good_1.22.11.bb} | 2 +-
 ...ins-ugly_1.22.10.bb => gstreamer1.0-plugins-ugly_1.22.11.bb} | 2 +-
 ...amer1.0-python_1.22.10.bb => gstreamer1.0-python_1.22.11.bb} | 2 +-
 ...sp-server_1.22.10.bb => gstreamer1.0-rtsp-server_1.22.11.bb} | 2 +-
 ...reamer1.0-vaapi_1.22.10.bb => gstreamer1.0-vaapi_1.22.11.bb} | 2 +-
 .../{gstreamer1.0_1.22.10.bb => gstreamer1.0_1.22.11.bb}        | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.10.bb => gst-devtools_1.22.11.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.10.bb => gstreamer1.0-libav_1.22.11.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.10.bb => gstreamer1.0-omx_1.22.11.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.10.bb => gstreamer1.0-plugins-bad_1.22.11.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.10.bb => gstreamer1.0-plugins-base_1.22.11.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.10.bb => gstreamer1.0-plugins-good_1.22.11.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.10.bb => gstreamer1.0-plugins-ugly_1.22.11.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.10.bb => gstreamer1.0-python_1.22.11.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.10.bb => gstreamer1.0-rtsp-server_1.22.11.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.10.bb => gstreamer1.0-vaapi_1.22.11.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.10.bb => gstreamer1.0_1.22.11.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
index 363d12612f..2be406192f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.11.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "0e1ec0d0b8f2d3d314a397399cd01dfc50c02ac088176996f934758119075ea9"
+SRC_URI[sha256sum] = "07766425ecb5bf857ab5ad3962321c55cd89f9386b720843f9df71c0a455eb9b"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
index 818dbf4e5e..f3287efa96 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d6dda7aa38a44173278de675ccd92acff0abf473f7bc02e7d1cdd4ce0f3b7642"
+SRC_URI[sha256sum] = "6b13dcc9332ef27a7c1e7005c0196883874f91622f8aa6e52f218b05b15d2bf5"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
index 4cb83937dc..97348fb398 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.11.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ce0126f6de908df4fa7b12136d47d6840dd9f7131ae997e55a817d96a2728a41"
+SRC_URI[sha256sum] = "18dfdf5f6b773d67e62a315c6cf6247da320b83603a5819493f53c69ed2eeef6"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
index 70b9850a49..523ee7a5ae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "dabcd60c762165bb043eba753d599212514c94684e4db9a2e25484cb6508ebbf"
+SRC_URI[sha256sum] = "808d3b33fc4c71aeb2561c364a87c2e8a3e2343319a83244c8391be4b09499c8"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index c922aadede..2adeae93d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
 some parser will pass in the original ssa text line which starts with "Dialog:"
 and there's are maybe multiple Dialog lines in one input buffer.
 
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747496]
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/178]
 
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
index d4b69b103f..7aa10eb646 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "843a3a2da28e1ee6aeea56dd2be9bffcc3b4bbcd0f974eba4abfc3aa31f0399c"
+SRC_URI[sha256sum] = "65eaf72296cc5edc985695a4d80affc931e64a79f4879d05615854f7a2cf5bd1"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
index 9a76aaf247..edd8609b7c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "f748feae922cad62f20102a84ade8f42b78e1e44a34866aa3ea766f9172e1c7f"
+SRC_URI[sha256sum] = "6ddd032381827d31820540735f0004b429436b0bdac19aaeab44fa22faad52e2"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
index 7cbbf9fda0..61f46fbf7e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "cc80a81a22c0b3b31ab7f1b8bf18dda23c72d2791b86cc6264923a68336329ea"
+SRC_URI[sha256sum] = "7758b7decfd20c00cae5700822bcbbf03f98c723e33e17634db2e07ca1da60bf"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
index b829a0fc62..0fbb03f757 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.11.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "99e37ea9f7163099734f9b0fce361bc67a0e7a65ffba9bc497127506a3fdedb3"
+SRC_URI[sha256sum] = "f7a5450d93fd81bf46060dca7f4a048d095b6717961fec211731a11a994c99a7"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
index 0e910e3dc4..554ed9ec8f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "60eb4f80b5a7ca929c21a61d50be9813a3413787959a5875de56a8ad5ca25f35"
+SRC_URI[sha256sum] = "ec49d474750a6ff6729c85b448abc607fb6840b21717ad7abc967e2adbf07a24"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
index b52b7aa4c4..87eb8484a1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.11.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "094ca144aca8f2c554a2517dfdc421fa37c80294c6f12b992c20cbc73aa2c0bd"
+SRC_URI[sha256sum] = "6eae1360658302b9b512fa46b4d06f5b818dfce5f2f43d7d710ca8142719d8ad"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
index 0c944e9e11..8965497d01 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "969aaef396f252ce925132a4be2aa004e0320f5c1baf0acaaae09c544a6759f4"
+SRC_URI[sha256sum] = "3d16259e9dab8b002c57ce208a09b350d8282f5b0197306c0cdba9a0d0799744"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.43.0


