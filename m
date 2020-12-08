Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.6164.1607419690588315434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 01:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G4zuB1K3;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id y17so6092821wrr.10
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wYfLbW27VwU/VGI+evFhuMpcuPCdqxJlF5nuBN/aAk=;
        b=G4zuB1K3lMm75qOwtxbtly6oMKCf1IdVrw7whfzGRs39j93MCikGiqI1IpoIPVgHYg
         BtAi/xF2U+l6O4RzMFvz+EI+01EeZJJWQ25noT8+sTIHXmWvNFydtQNxW+u++Y/Q7CNX
         dU82f4myeFDxriQe8Yf9xWdIHqhgLKER96860VUS2lbV9RVo8ca2M6jOJHaMGhM0Xqju
         zulQBVyVUvoZWGwdVlXRkMEdXvGyUv/sFLNhPfWVIVXve+hUAr32VfJSgQEacy3qpqIK
         hCuABFV1fVt1gqiLqCK3zmvDE08yDnnpY7+GRNQd8vxwpkiWD/C0oYROGEtE3x1EayR1
         s6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wYfLbW27VwU/VGI+evFhuMpcuPCdqxJlF5nuBN/aAk=;
        b=sxld2AwwOLtPjb7T1Tk8QCf3QZiG1+B63zdqNecdgMHIpt5EWqq+t3Woalf+CHCTcQ
         hmUwM+4U6o6qrIiNZwmnYmNC/IPVw6+WzuwJfcAtDytTTnYWLdw2HVCc4fShlhYrOTob
         9m5jWL8H7ZxjFS/Ykd/dICxNd8CT6pdGEJTfre8Hv9we1DSyMRClk/R6CLWwF892f70u
         7DBrMzBf9TuYbeyaBobzlaztuoAwMwH1aKpvpikA/1Eel8yowgKHAdEgTATjd2L6dTXs
         ZNq9s1FT+/DPoBqLxtfU8jrCuxm9MTXpmCbRMiE2tFqGUyHeBEtm8JroUNiw8whYnPaA
         0XgA==
X-Gm-Message-State: AOAM5310us4hnuRvyLeLWxwoYWO+yTC4s52SaymeA1l8rgv0zzQoZ7Q/
	ZCQBgP+3tDz4PGUNpHj5XnjNBNTBosY=
X-Google-Smtp-Source: ABdhPJySt+OHU5ZnEV694tCv9/PwWVVvA84WTzxNMZ5BoclvlPtGdgv0sZ8yUzPfJ7zk+FoQOlHjcg==
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr1437477wrx.277.1607419688566;
        Tue, 08 Dec 2020 01:28:08 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w12sm1909097wre.57.2020.12.08.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 01:28:07 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH] gstreamer1.0: upgrade 1.18.1 -> 1.18.2
Date: Tue,  8 Dec 2020 09:27:38 +0000
Message-Id: <20201208092738.158048-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patches as it as merged upstream:

    * gstreamer1.0: 0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
    * gstreamer1.0-plugins-good: 0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...tools_1.18.1.bb => gst-devtools_1.18.2.bb} |  2 +-
 ...mples_1.18.1.bb => gst-examples_1.18.2.bb} |  2 +-
 ...1.18.1.bb => gstreamer1.0-libav_1.18.2.bb} |  2 +-
 ...x_1.18.1.bb => gstreamer1.0-omx_1.18.2.bb} |  2 +-
 ....bb => gstreamer1.0-plugins-bad_1.18.2.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-base_1.18.2.bb} |  2 +-
 ...hostif-library-as-it-is-required-to-.patch | 32 -----------------
 ...bb => gstreamer1.0-plugins-good_1.18.2.bb} |  3 +-
 ...bb => gstreamer1.0-plugins-ugly_1.18.2.bb} |  2 +-
 ....18.1.bb => gstreamer1.0-python_1.18.2.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.18.2.bb} |  2 +-
 ...1.18.1.bb => gstreamer1.0-vaapi_1.18.2.bb} |  2 +-
 ...crese-padding-in-struct-_GstClockEnt.patch | 34 -------------------
 ...er1.0_1.18.1.bb => gstreamer1.0_1.18.2.bb} |  3 +-
 14 files changed, 12 insertions(+), 80 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.1.bb => gst-devtools_1.18.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.1.bb => gst-examples_1.18.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.1.bb => gstreamer1.0-libav_1.18.2.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.1.bb => gstreamer1.0-omx_1.18.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.1.bb => gstreamer1.0-plugins-bad_1.18.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.1.bb => gstreamer1.0-plugins-base_1.18.2.bb} (97%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.1.bb => gstreamer1.0-plugins-good_1.18.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.1.bb => gstreamer1.0-plugins-ugly_1.18.2.bb} (93%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.1.bb => gstreamer1.0-python_1.18.2.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.1.bb => gstreamer1.0-rtsp-server_1.18.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.1.bb => gstreamer1.0-vaapi_1.18.2.bb} (95%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.1.bb => gstreamer1.0_1.18.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
index 2e09ef9c25..9fd9e0be93 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "712212babd2238233d55beecfc0fe1ea8db18e8807ac6ab05a64505b2c7ab0df"
+SRC_URI[sha256sum] = "6ea73d718bf1f9692218540ff88479c51d67c0b477fa56d6812fc7b739d30a56"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
index 048b45a08f..54a4b5df15 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "998ee69af18a5928759dbe17fffbceebbc8d72d0"
+SRCREV = "45086d8ef2d75244d9d5c8f69c0f0e1dfd4200b3"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
index 38bbffafa4..b638814aa4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "39a717bc2613efbbba19df3cf5cacff0987471fc8281ba2c5dcdeaded79c2ed8"
+SRC_URI[sha256sum] = "36969ad44c5f0756a8a90215410710d6c39713d58f6cee13d663be9774557f49"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
index 513d66f9fc..686fcc2655 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "42a8e0f9518b94655981ede441638f9f9395f4b1b9a4b329f068ee793975a965"
+SRC_URI[sha256sum] = "4c05d64544eecf4aaf5b337789916c67ed720317dfb2c8c8c335720fcc5c7cf4"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index ebd8c5a27d..f70437ccd3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -6,7 +6,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "c195978c85d97406c05eb9d43ac54b9ab35eda6ffdae32b3ed597b8f1743c1b2"
+SRC_URI[sha256sum] = "8ad5822f1118fe46a19af54422b74e3a16d79a6800dcb173b49e199a496b341a"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
index 1b2bd4fe14..531d577b0c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "1ba654d7de30f7284b4c7071b32f881b609733ce02ab6d9d9ea29386a036c641"
+SRC_URI[sha256sum] = "dd04fb1f7826e2f6d9b4d66fc22f19cc6a47c301e13041f0ee3d7f65c89b05ac"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
deleted file mode 100644
index 685ee08e50..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3ec4fe5507a39383b161f1ab7687acb4a57c32f8 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 15 Nov 2020 11:30:07 +0000
-Subject: [PATCH] rpicamsrc: add vchostif library as it is required to build
- successful
-
-fix: undefined reference to `vc_gencmd'
-/usr/src/debug/gstreamer1.0-plugins-good/1.18.1-r0/build/../gst-plugins-good-1.18.1/sys/rpicamsrc/RaspiCamControl.c:1440: undefined reference to `vc_gencmd'
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/818]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- sys/rpicamsrc/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sys/rpicamsrc/meson.build b/sys/rpicamsrc/meson.build
-index dc18a8345..48b2ceb66 100644
---- a/sys/rpicamsrc/meson.build
-+++ b/sys/rpicamsrc/meson.build
-@@ -34,7 +34,7 @@ if not cc.has_header('bcm_host.h', args: rpi_inc_args)
- endif
- 
- mmal_deps = []
--foreach rpi_lib : ['mmal_core', 'mmal_util', 'mmal_vc_client', 'vcos', 'bcm_host']
-+foreach rpi_lib : ['mmal_core', 'mmal_util', 'mmal_vc_client', 'vcos', 'vchostif', 'bcm_host']
-   l = cc.find_library(rpi_lib, dirs: rpi_lib_path, required: false)
-   if not l.found()
-     if get_option('rpicamsrc').enabled()
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
index 77e1333ddc..2e076bf884 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.2.bb
@@ -2,10 +2,9 @@ require gstreamer1.0-plugins-common.inc
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
-           file://0001-rpicamsrc-add-vchostif-library-as-it-is-required-to-.patch \
            "
 
-SRC_URI[sha256sum] = "e210e91a5590ecb6accc9d06c949a58ca6897d8edb3b3d55828e424c624f626c"
+SRC_URI[sha256sum] = "f71752dde434d9ec55fa5e8d2e2a3be3fc6eb5b34f397b065f84aead25b449a4"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
index 614ef8d740..e482aa10b2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.2.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "18cd6cb829eb9611ca63cbcbf46aca0f0de1dd28b2df18caa2834326a75ff725"
+SRC_URI[sha256sum] = "a337a022ed472209b38cab5918dc2f4e7a6adc1f4afacd226a6345e5cb668bdb"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
index c0c5d271d0..5711744b4d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "42b289422f7ab32757670848cf2245c5a8a8b08a665a9cab65ded8d69364f6f6"
+SRC_URI[sha256sum] = "e19d0f760b353e88161b3712193cffbd79bf1314418da792b5fec4d8ecef389c"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
index 30534c9782..b680aa38d6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "10a82865c3d199e66731017ca4b120bad071df9889e60cfe4dd6c49d953ef754"
+SRC_URI[sha256sum] = "973922aba65a1672a131527dee965fb09bab4bb996c351f0ee7f42f0d5b954e2"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
index acf5598a62..f237191d5f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "400d3c42810b50b4566df03f37319a6bdd758f969560c40147e7d9a3b0e8a6ea"
+SRC_URI[sha256sum] = "8c7b2c74fda095d83dea67accde6a68ba9f608d97ed969fdcf278930f9b1c7c0"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
deleted file mode 100644
index a2d215d72d..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4449246a8d788e71dfe4679fba95955cec5894c1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 3 Nov 2020 22:58:26 -0800
-Subject: [PATCH] gst_private.h: increse padding in struct _GstClockEntryImpl
-
-When compiling for 32bit architectures with 64bit time_t e.g. riscv32,
-the static assert that the GstClockEntryImpl smaller or
-equal to the struct _GstClockEntryImpl triggered.
-(they were 12bytes off).
-
-To fix this, the padding is increased by 8 bytes (on 32bit).
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/694]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gst/gst_private.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gst/gst_private.h b/gst/gst_private.h
-index a8897e1..8252ede 100644
---- a/gst/gst_private.h
-+++ b/gst/gst_private.h
-@@ -522,7 +522,7 @@ struct _GstClockEntryImpl
-   GstClockEntry entry;
-   GWeakRef clock;
-   GDestroyNotify destroy_entry;
--  gpointer padding[19];                 /* padding for allowing e.g. systemclock
-+  gpointer padding[21];                 /* padding for allowing e.g. systemclock
-                                          * to add data in lieu of overridable
-                                          * virtual functions on the clock */
- };
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
index d55b2871e7..0fb0bcebc1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.2.bb
@@ -19,9 +19,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
-           file://0001-gst_private.h-increse-padding-in-struct-_GstClockEnt.patch \
            "
-SRC_URI[sha256sum] = "79df8de21f284a105a5c1568527f8c559c583c85c0f2bd7bdb5b0372b8beecba"
+SRC_URI[sha256sum] = "66cdeb4f970c2e55932a2f427177d438fe2c55c0b6d29e80fda80263f2ae5446"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.29.2

