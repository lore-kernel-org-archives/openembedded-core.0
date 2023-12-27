Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA94C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 13:07:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.100668.1703682428111116285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 05:07:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="133154379"
X-IronPort-AV: E=Sophos;i="6.04,309,1695654000"; 
   d="scan'208";a="133154379"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 22:07:05 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28F9CDCC16
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:07:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4AC5DD6024
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:07:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D185F2646DA
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 22:07:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 855D11A006F;
	Wed, 27 Dec 2023 21:07:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gstreamer1.0: upgrade 1.22.7 -> 1.22.8
Date: Wed, 27 Dec 2023 21:06:47 +0800
Message-Id: <1703682407-23996-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28082.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28082.007
X-TMASE-Result: 10--9.584900-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yQPZZctd3P4BArRmBtM54pRgDeovr2tertMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v85py1dA2ffkp1Hr79yIZkBgIw
	0FSZOj8RQM1QkaIYrU2hV69k6uC5s7KXQGi7fuRQF7cpFXK76TZXB4BDxCM3TjCcYoCggokuaSd
	nmo1YceSCXC32XlLoP0u1S+8bZ2UF60j/UbRmWKN0KiTeJteVBTnSpwnlY4yGbKItl61J/yUGDD
	kbg1gJkKZDgIQINiWYgBwKKRHe+r/8kDtZvf7EVU1BtERfP3Q9eCS9FjDTnDSM7nbgH6mPsj/H9
	Yrfw0xY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192945

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.22.7.bb => gst-devtools_1.22.8.bb}          | 2 +-
 ...streamer1.0-libav_1.22.7.bb => gstreamer1.0-libav_1.22.8.bb} | 2 +-
 .../{gstreamer1.0-omx_1.22.7.bb => gstreamer1.0-omx_1.22.8.bb}  | 2 +-
 ...plugins-bad_1.22.7.bb => gstreamer1.0-plugins-bad_1.22.8.bb} | 2 +-
 ...ugins-base_1.22.7.bb => gstreamer1.0-plugins-base_1.22.8.bb} | 2 +-
 ...ugins-good_1.22.7.bb => gstreamer1.0-plugins-good_1.22.8.bb} | 2 +-
 ...ugins-ugly_1.22.7.bb => gstreamer1.0-plugins-ugly_1.22.8.bb} | 2 +-
 ...reamer1.0-python_1.22.7.bb => gstreamer1.0-python_1.22.8.bb} | 2 +-
 ...rtsp-server_1.22.7.bb => gstreamer1.0-rtsp-server_1.22.8.bb} | 2 +-
 ...streamer1.0-vaapi_1.22.7.bb => gstreamer1.0-vaapi_1.22.8.bb} | 2 +-
 .../{gstreamer1.0_1.22.7.bb => gstreamer1.0_1.22.8.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.7.bb => gst-devtools_1.22.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.7.bb => gstreamer1.0-libav_1.22.8.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.7.bb => gstreamer1.0-omx_1.22.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.7.bb => gstreamer1.0-plugins-bad_1.22.8.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.7.bb => gstreamer1.0-plugins-base_1.22.8.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.7.bb => gstreamer1.0-plugins-good_1.22.8.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.7.bb => gstreamer1.0-plugins-ugly_1.22.8.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.7.bb => gstreamer1.0-python_1.22.8.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.7.bb => gstreamer1.0-rtsp-server_1.22.8.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.7.bb => gstreamer1.0-vaapi_1.22.8.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.7.bb => gstreamer1.0_1.22.8.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb
index b545f020cf..16a2dd85ce 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.22.8.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "157cf93fb2741cf0c3dea731be3af2ffae703c9f2cd3c0c91b380fbc685eb9f9"
+SRC_URI[sha256sum] = "cd634056fcb16d035b3df5953ec85ae8bd56c68f29920b720ef920ca71ea76a7"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb
index 7169223636..7c75173989 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1525b917141b895fe5cf618fe8867622b2528278a0286e9f727b5f37317daca1"
+SRC_URI[sha256sum] = "be39349bc07ab4cdbd9a5fd6ea9848c601c7560ba5a0577ad5200b83bd424981"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb
index ad40cf5513..5aa9c9cc41 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.8.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d7a18ec47d40a472bd5cba2015e0be72b732f1699895398cec5cd8e6a3a53b44"
+SRC_URI[sha256sum] = "94df10e7713618f0c8a4223f6e047f2d8f0ccecba1d585618e791f13037762df"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb
index b7d787b611..a14a4efce9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.8.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "c716f8dffa8fac3fb646941af1c6ec72fff05a045131311bf2d049fdc87bce2e"
+SRC_URI[sha256sum] = "458783f8236068991e3e296edd671c8eddb8be6fac933c1c2e1503462864ea0f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb
index 3b8923e8f2..df5eab0464 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.8.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "62519e0d8f969ebf62a9a7996f2d23efdda330217a635f4a32c0bf1c71577468"
+SRC_URI[sha256sum] = "eb6792e5c73c6defb9159c36ea6e4b78a2f8af6512678b4bd3b02c8d2d492acf"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.8.bb
index b8496a1750..dd309fc6fe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.8.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            file://0001-v4l2-Define-ioctl_req_t-for-posix-linux-case.patch"
 
-SRC_URI[sha256sum] = "b6db0e18e398b52665b7cdce301c34a8750483d5f4fbac1ede9f80b03743cd15"
+SRC_URI[sha256sum] = "e305b9f07f52743ca481da0a4e0c76c35efd60adaf1b0694eb3bb021e2137e39"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.8.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.8.bb
index 8a67531123..478fa8f318 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.8.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "520b46bca637189ad86a298ff245b2d89375dbcac8b05d74daea910f81a9e9da"
+SRC_URI[sha256sum] = "0761d96ba508e01c0271881b26828c2bffd7d8afd50872219f088f755b252ca7"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb
index a387031635..fc182af976 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.22.8.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1ef8df7608012fa469329799c950ec087737a6dabad3003c230658b58c710172"
+SRC_URI[sha256sum] = "d5cb8f144054a2a110e6672bd512e4b15d5b1b8d9879c192b9723535efb70b8f"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.8.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.8.bb
index af1c2ced44..97fa86b533 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.8.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f7fac001e20ad21e36d18397741c4657c5d43571eb1cc3b49f9a93ae127dc88f"
+SRC_URI[sha256sum] = "705177051c229976f171adcd7ab9762ae6bcc4bb77dc308a0bd80a63da6c337f"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.8.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.8.bb
index 4cad50742d..52ac7cd2a5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.22.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0e9fff768b89de6d318b34146e4e781d82b9a0f4025dc541b2c8349c7bcb7f67"
+SRC_URI[sha256sum] = "1298ba347a70c42b88cdebf91b659fea02b1bb7269eabf8e29e3c0bd58278928"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb
index 72161b272f..374a32ef96 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.8.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "01e42c6352a06bdfa4456e64b06ab7d98c5c487a25557c761554631cbda64217"
+SRC_URI[sha256sum] = "ad4e3db1771139b1db17b1afa7c05db083ae0100bd4da244b71f162dcce41bfc"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


