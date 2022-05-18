Return-Path: <mangodan2003@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10A5C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 12:37:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.4321.1652877452353060374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 05:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TwFuo3ar;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: mangodan2003@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id bg25so1054366wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 05:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fc2/Pa1F2bn7ZPFJzSfgB/x9xfIcs/Tr9N50Y1EhPi8=;
        b=TwFuo3arE3ggI4E84b60PJ8zudovUb2GEzaQyYquMoJdbq8+ZCA1KoMyBySKLzH6PH
         LcvDvnhK8aSnmNeFVoKpK5UKrn3nDRtZOZdJkx7OiN14trsfYuUo6BFwoOcG1/YyKlYH
         DYahWYpgBV//B/lXfHFPv+4+DPDKcPcvd3m+pXP9uhtxTU8noFgwrG7KyvRWyhI6vgKu
         v1fpmdLzmzFWxnYRMhe24Z1ZFR7jpCaVhX1WurAfWKPxQEl8ox6lbl77POLDbuOBKGwX
         mCQWkHb2v7lTuaa2SNmoSPAm5KIM8hQlEx1Hbu0aGBpucQzlkGrKmxfUXIZz/sunG5xo
         wGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fc2/Pa1F2bn7ZPFJzSfgB/x9xfIcs/Tr9N50Y1EhPi8=;
        b=JnUusPsDajuKxbzMvgNU3ctoDyDqeKUrXf5bXP96R8Ec2mLQ4xzL4nxyGR7PbNR0yU
         VQjl9Q4187b8C4rlK7dtayaeNq6DdBm5AhLgSI7WyfA/+zNwEd2GMo6WBGM1uz/gdzv9
         8yQp/O9wDMB+3tA6roUHpSkpvfnn8gTykzREjvXIdK5pYTq4+f8U+BQvKwYM6dqwO4AL
         MYwNyvu2wPsLSjX7ywdzlxOCTPvPP9Aiz8+dpcvKV4RBRAp13WHekmBLT+VSwh1iEypP
         X3ZsuQXbkfSZRsp2xPd8BCYhisevxNjtiEa9HZt40ZilVpeJza7eKHUL7rrNcZhHjeBs
         QEwg==
X-Gm-Message-State: AOAM532Y9LS2gXIWOjLyY5Dgw4lcBF9POw+HOxD6YswcJmA92ZoukFeB
	YBKPmr5S1JxvToxz3uEPhXX2IfHnXACv6w==
X-Google-Smtp-Source: 
 ABdhPJxC0bhG19OltDewVPtV+nUmQnqG75J0UTDUW6I6y9O2zybki4P+wYiHPjzvJdeWZor38EMdMw==
X-Received: by 2002:a05:600c:1d10:b0:394:737f:e36 with SMTP id
 l16-20020a05600c1d1000b00394737f0e36mr25972643wms.202.1652877450698;
        Wed, 18 May 2022 05:37:30 -0700 (PDT)
Received: from melon.office
 (cpc160893-lutn15-2-0-cust235.9-3.cable.virginm.net. [86.16.192.236])
        by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b00394832af31csm6901475wms.0.2022.05.18.05.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 05:37:30 -0700 (PDT)
From: mangodan2003 <mangodan2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mangodan2003 <mangodan2003@gmail.com>
Subject: [PATCH] gstreamer: updated to 1.20.2 bug fix release
Date: Wed, 18 May 2022 13:37:23 +0100
Message-Id: <20220518123723.134317-1-mangodan2003@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 12:37:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165851

The second 1.20 bug-fix release (1.20.2) was released on 2 May 2022.
This release only contains bugfixes and it should be safe to update from 1.20.x.

Signed-off-by: mangodan2003 <mangodan2003@gmail.com>
---
 .../{gst-devtools_1.20.1.bb => gst-devtools_1.20.2.bb}          | 2 +-
 ...streamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} | 2 +-
 .../{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb}  | 2 +-
 ...plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} | 2 +-
 ...ugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} | 2 +-
 ...ugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} | 2 +-
 ...ugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} | 2 +-
 ...reamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} | 2 +-
 ...rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} | 2 +-
 ...streamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} | 2 +-
 .../{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb}          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.20.1.bb => gst-devtools_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.1.bb => gstreamer1.0-omx_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.20.1.bb => gstreamer1.0-python_1.20.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.1.bb => gstreamer1.0-rtsp-server_1.20.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.1.bb => gstreamer1.0-vaapi_1.20.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
index ade7cb7dc3..4819a34b26 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.20.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "81f1c7ef105b8bdb63412638952f6320723b3161c96a80f113b020e2de554b2b"
+SRC_URI[sha256sum] = "b28dba953a92532208b30467ff91076295e266f65364b1b3482b4c4372d44b2a"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
index 16a298ab14..4ef9755c07 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7"
+SRC_URI[sha256sum] = "b5c531dd8413bf771c79dab66b8e389f20b3991f745115133f0fa0b8e32809f9"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
index 835f9a31fd..c4f5d719bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "86b52e30ebd0f59fcb5cf81a163211975f73ef32e5a6782562804646316bcd7c"
+SRC_URI[sha256sum] = "7efed7cc5b0acf9a669e38c5360a7892430a4e86c858daac6faa1ade2b151668"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
index 7c4665ae80..bb33e3822e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848"
+SRC_URI[sha256sum] = "4adc4c05f41051f8136b80cda99b0d049a34e777832f9fea7c5a70347658745b"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
index 0953261a98..e47851700a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "96d8a6413ba9394fbec1217aeef63741a729d476a505a797c1d5337d8fa7c204"
+SRC_URI[sha256sum] = "ab0656f2ad4d38292a803e0cb4ca090943a9b43c8063f650b4d3e3606c317f17"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
index 1f61d9a10e..6c52fb35b9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa"
+SRC_URI[sha256sum] = "83589007bf002b8f9ef627718f308c16d83351905f0db8e85c3060f304143aae"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
index b0746c087a..edc2ece979 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "42035145e29983308d2828207bb4ef933ed0407bb587fb3a569738c6a57fdb19"
+SRC_URI[sha256sum] = "b43fb4df94459afbf67ec22003ca58ffadcd19e763f276dca25b64c848adb7bf"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
index a8ae274631..34bc4bf4f4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ba6cd59faa3db3981d8c6982351c239d823c0b8e80b1acf58d2997b050289422"
+SRC_URI[sha256sum] = "853ea35a1088c762fb703e5aea9c30031a19222b59786b6599956e154620fa2f"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
index 90d788ab80..fd6e16c2bf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4745bc528ad7de711a41d576ddce7412266e66d05c4cfcc636c9ba4da5521509"
+SRC_URI[sha256sum] = "6a8e9d136bbee4fc03858a0680dd5cbf91e2e989c43da115858eb21fb1adbcab"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
index 48b571f563..40dc21cf45 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137"
+SRC_URI[sha256sum] = "30126ab6e3105dab8da76bd9951a68886149bcd70c7fee0bac68de564de41d3d"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
index 81b94928d9..3aa9aa7048 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "de094a404a3ad8f4977829ea87edf695a4da0b5c8f613ebe54ab414bac89f031"
+SRC_URI[sha256sum] = "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.35.1


