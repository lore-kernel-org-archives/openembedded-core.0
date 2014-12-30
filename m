Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id B282065CA0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:05:15 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id z12so3199595wgg.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BH6E7gR2DcQ33wKliEO3qp9uaZkdFPY2mOOiKUpBQeU=;
	b=G9gwL63lYxenfhXeAET73NXhz0+WYcEQm+HW1wDhS5vUN3hzL9kaJTPxm+Ojt5rY0L
	0hituJbAoy0NpU4loN/lgz/5KCM2aSDizs+1SjR5DNlNGn3wZdsdFFeUILXVjU14oiq2
	Je3/opYOnwQx03CwTs/Oz0iGfvLXfQxOuFQEL+SzOUUIJecOliQYN9u7uzPEx15JFsSh
	pNeSJkuKpyLrM7tuRNgk3h0D07z7xjnqRFOldaREFAmKLGTgpUuCnszEywdxsZDy6PVg
	eya1xNdsbiRRQGTz5oKMftblU9mfASRfctH7ddWzqOPzg6UCV9SsN+hqzg+DNMjUx6mH
	8E5Q==
X-Gm-Message-State: ALoCoQm/+ZUTz0/ko/AWxFc6j0NIqi7TThwQQTwDe/U4hJ8LD9Ovp1Iyp+5iKeyjuDgRsK7bKDV9
X-Received: by 10.180.228.108 with SMTP id sh12mr84370416wic.55.1419962716289; 
	Tue, 30 Dec 2014 10:05:16 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28854285wjc.18.2014.12.30.10.05.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:05:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 18:04:04 +0000
Message-Id: <1419962645-26989-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 6/7] gstreamer1.0-libav: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 18:05:19 -0000

License checksum changed as the file list in the license was revised.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...{gstreamer1.0-libav_1.4.1.bb => gstreamer1.0-libav_1.4.5.bb} |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.4.1.bb => gstreamer1.0-libav_1.4.5.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
index f962ff0..11b1cfb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.4.5.bb
@@ -3,7 +3,7 @@ include gstreamer1.0-libav.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-                    file://gst-libs/ext/libav/LICENSE;md5=df1087a33b5cafe5e70b3452aac81515 \
+                    file://gst-libs/ext/libav/LICENSE;md5=ea66e97a7ac1db978cf3529068a8c948 \
                     file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
@@ -13,8 +13,9 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
 "
-SRC_URI[md5sum] = "ea2d636c24d7c5ae123967ef22e37c07"
-SRC_URI[sha256sum] = "fc125521187fa84f3210269a0eecc51f8a856802f1ca4bb251f118dab90c5a9d"
+SRC_URI[md5sum] = "f4922a46adbcbe7bd01331ff5dc7979d"
+SRC_URI[sha256sum] = "605c62624604f3bb5c870844cc1f2711779cc533b004c2aa1d8c0d58557afbbc"
+
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
-- 
1.7.10.4


