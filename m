Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.85.1616341550324274155
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 08:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RhenMe1M;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id o16so14121809wrn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Mar 2021 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZmt9h4Vnkk+50YyFS4n5qxEHDl+hsQ7pjdzIxNFk8Q=;
        b=RhenMe1M+U2aZzABG+DUKnEbr8M7EElZbTWreY0CT04qbTQ9XxAlWqTA8cbkjEiXFr
         sXGoUFHJ4kPJIeXthnVdKSLaXblJsxDKrqFlzDAW5QRUNfSVl3dmgefqqKGhas0rDM/r
         R6pU2Hq51GOqzmwcMaghALPy7bbcjsJoMr9hXHp238eHuKGYyGoUm5kqkZKdwVOz3rSi
         rh2Ihgjxi5sfJrZSUZu0+QbULFDa3ys5c5gbKZTgoouERjsp/P0GUtPBtdlyBFulyc/P
         SsFKUONNHmQ4NGrLFwf+ZUE3Dz0juVCxITLdemQSWX9jQqfuAAupDjQYwqnWSlEI+tkt
         T+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZmt9h4Vnkk+50YyFS4n5qxEHDl+hsQ7pjdzIxNFk8Q=;
        b=AOQ0daq9E1ENn/rDxIfvd32Igs2LxgWFQIs0cCnriBPccbc9Gg8PVY/kAdKr6NSKet
         tGBEm/BBM2B16Rpqvi5ytV665NFn9TZYXb5lqYurKSk0xnqet2+1J8d8uVHoppv7kIMC
         NrOkqX7ZkGRV3lTTQa7bZAxIzT2GPCy0qhEJwGBNS6czo6QqvHK6JlrjPkqf7sXpYp7h
         LEgJk72PRkcNtVZR1UumkBXK7Qfe4qnzE9ynqRfsVJJBapPPpCzpWhoGGJtAzaZXas6e
         D1L6yO7AZRGV0UfVKVtLklFTjjYiCxWuck20hjYJJ8TBvkVFlg25VSZTYsMWYmdVUnOZ
         YvGw==
X-Gm-Message-State: AOAM531pQkZgZcu9r+dGhCF5zECfZxA6YIWee6Pew6Lb+nJy0pST/tGb
	FObuYHbA9QAXXZwLXXUjHc4rDZNPNbAbbg==
X-Google-Smtp-Source: ABdhPJww0O3bTCZKYjTi6gbd8HH2iC2jgSCPVW/etGsQ9GG4fcl6bB4q5eELNuTNMsTLetxrxJl7Ww==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr14569150wrt.115.1616341548638;
        Sun, 21 Mar 2021 08:45:48 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([2001:818:e32f:d200:8e8c:aaff:fe9f:1141])
        by smtp.gmail.com with ESMTPSA id g9sm17169946wrp.14.2021.03.21.08.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 08:45:48 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] gstreamer1.0: upgrade 1.18.3 -> 1.18.4
Date: Sun, 21 Mar 2021 15:46:03 +0000
Message-Id: <20210321154604.818098-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../{gst-devtools_1.18.3.bb => gst-devtools_1.18.4.bb}          | 2 +-
 .../{gst-examples_1.18.3.bb => gst-examples_1.18.4.bb}          | 2 +-
 ...streamer1.0-libav_1.18.3.bb => gstreamer1.0-libav_1.18.4.bb} | 2 +-
 .../{gstreamer1.0-omx_1.18.3.bb => gstreamer1.0-omx_1.18.4.bb}  | 2 +-
 ...plugins-bad_1.18.3.bb => gstreamer1.0-plugins-bad_1.18.4.bb} | 2 +-
 ...ugins-base_1.18.3.bb => gstreamer1.0-plugins-base_1.18.4.bb} | 2 +-
 ...ugins-good_1.18.3.bb => gstreamer1.0-plugins-good_1.18.4.bb} | 2 +-
 ...ugins-ugly_1.18.3.bb => gstreamer1.0-plugins-ugly_1.18.4.bb} | 2 +-
 ...reamer1.0-python_1.18.3.bb => gstreamer1.0-python_1.18.4.bb} | 2 +-
 ...rtsp-server_1.18.3.bb => gstreamer1.0-rtsp-server_1.18.4.bb} | 2 +-
 ...streamer1.0-vaapi_1.18.3.bb => gstreamer1.0-vaapi_1.18.4.bb} | 2 +-
 .../{gstreamer1.0_1.18.3.bb => gstreamer1.0_1.18.4.bb}          | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.3.bb => gst-devtools_1.18.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.3.bb => gst-examples_1.18.4.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.3.bb => gstreamer1.0-libav_1.18.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.3.bb => gstreamer1.0-omx_1.18.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.3.bb => gstreamer1.0-plugins-bad_1.18.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.3.bb => gstreamer1.0-plugins-base_1.18.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.3.bb => gstreamer1.0-plugins-good_1.18.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.3.bb => gstreamer1.0-plugins-ugly_1.18.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.3.bb => gstreamer1.0-python_1.18.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.3.bb => gstreamer1.0-rtsp-server_1.18.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.3.bb => gstreamer1.0-vaapi_1.18.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.3.bb => gstreamer1.0_1.18.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb
index bad9921757..2a56967f7b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "3025fee3607caf5069154c099533785675916e044ee92c936bbeacdda3750f26"
+SRC_URI[sha256sum] = "ffbd194c40912cb5e7fca2863648bf9dd8257b7af97d3a60c4fcd4efd8526ccf"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
index b49201fb0e..4670ab34db 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "06599904baa5d0e47b5cb9501372156567760f8e"
+SRCREV = "959bb246a5b1f5f9c78557da11c3f22b42ff89c0"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
index baf87fd871..6a84f92f31 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ad20546bcd78ac1e7cf194666d73c4f33efeb62647d2b6af22993b540699e91c"
+SRC_URI[sha256sum] = "344a463badca216c2cef6ee36f9510c190862bdee48dc4591c0a430df7e8c396"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
index d55f45ac6a..d38be035f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ed0f26504e9a60e15055134410f156e40952336410f2a59bdbbda45e61e8b93f"
+SRC_URI[sha256sum] = "e35051cf891eb2f31d6fcf176ff37d985f97f33874ac31b0b3ad3b5b95035043"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
index b1e3664cbf..ce2082ee32 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "b7e34b6b86272588fbd8b314dadfa6ceff895198cfb59e2950378e9e31ff22e0"
+SRC_URI[sha256sum] = "74e806bc5595b18c70e9ca93571e27e79dfb808e5d2e7967afa952b52e99c85f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
index 86b0f2790e..728a99e08b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "dbfa20283848f0347a223dd8523dfb62e09e5220b21b1d157a8b0c8b67ba9f52"
+SRC_URI[sha256sum] = "29e53229a84d01d722f6f6db13087231cdf6113dd85c25746b9b58c3d68e8323"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
index 93c6616c33..9fdc31549f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "9b3b8e05d4d6073bf929fb33e2d8f74dd81ff21fa5b50c3273c78dfa2ab9c5cb"
+SRC_URI[sha256sum] = "b6e50e3a9bbcd56ee6ec71c33aa8332cc9c926b0c1fae995aac8b3040ebe39b0"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb
index 876a9268a2..932fa7f6fb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "70f7429b25dd2f714eb18e80af61b1363b1f63019e16cd28e086e3a619eaa992"
+SRC_URI[sha256sum] = "218df0ce0d31e8ca9cdeb01a3b0c573172cc9c21bb3d41811c7820145623d13c"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb
index 90b6fc38df..49de3dac84 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4e630735276e08ff4d70337aa5d91fd008e5f1ed3dc0993674cd5820e264259a"
+SRC_URI[sha256sum] = "cb68e08a7e825e08b83a12a22dcd6e4f1b328a7b02a7ac84f42f68f4ddc7098e"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb
index d6aaa5df79..f7bfe98985 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4f7757293b3d73dc49768b7392791668c4d0c21d41824624ffbd75c7f9ee0168"
+SRC_URI[sha256sum] = "a46bb8de40b971a048580279d2660e616796f871ad3ed00c8a95fe4d273a6c94"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb
index 7c702ba95f..a268d79541 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ae9877f15757a661d4dfe6a09755a2faa959ab60752f14ca26b7ff10765e1f12"
+SRC_URI[sha256sum] = "92db98af86f3150d429c9ab17e88d2364f9c07a140c8f445ed739e8f10252aea"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
index b6e064e79d..8562070968 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-meson-Add-option-for-installed-tests.patch \
            file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
            "
-SRC_URI[sha256sum] = "0c2e09e18f2df69a99b5cb3bd53c597b3cc2e35cf6c98043bb86a66f3d312100"
+SRC_URI[sha256sum] = "9aeec99b38e310817012aa2d1d76573b787af47f8a725a65b833880a094dfbc5"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.31.0

