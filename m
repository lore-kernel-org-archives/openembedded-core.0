Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1BDC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:48 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.16541.1644196127576540113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NHsBSMse;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id v19so7073037wrv.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppFWsSOcS0ION2/PfEqqJI1wXvhWbJWNxQsSt2yA3R0=;
        b=NHsBSMseG0lBUwF53udscfHOkdrZWGrAE39Uc2xJZD4AWkgrL/SgAe02cbX7T6wMMr
         /aTmYXZy1fPMg1rogsQ6/aGfoCpgis6UFCUsfbithBVteQUGlgq2c+iJ1El2o9H9PDcm
         LTts3hhyAW1kEQyUOOzVXMLM/QCiatR261IE+9eSmdBZ5H42fA2/752PQdtA0OSaTzqe
         PH19ouEefVL1RYG+QUGn2zlsEOZI3dLnEUab0XdVNYVD0nDvDfsD4HRVtCmrVcObi3om
         /ocjO30v3H8aFD+CFPpxq7nJcgnzHuqDgzcr5RHl1E+9GU/Hu725HzfiJlC6gbVvLsuX
         TrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppFWsSOcS0ION2/PfEqqJI1wXvhWbJWNxQsSt2yA3R0=;
        b=SIbC/kf/kprR5O7tmeXFxRrxRD3attUaMdpfdKttAjehvZ1DQbu3TrOar7ey0AB06F
         VkPwpoepD5AEr13IAhSgJMVn50YFlpPFLDI/QfJfciGxlWyDTk9rNuTJ2r166rn92cyz
         ziucQliDOeybd98WQWV499bw7ukcOdvVJtOFM/kqZE4P+zNTLcy1rhKim0EsKc3Zi/TQ
         ZnHKmrYlb2wJjSagA/rcDwGATxG5J1wYKfuuZjtzsnafRiold+3ia0qri2yaeeK1W4Zc
         uQStTMi6RsLVnSwXUUnxm2OEa5QFG0y1tZnsXpcXlwd8dTk/7+wIL5NmN2ha62gs6FwJ
         rSNA==
X-Gm-Message-State: AOAM532spKlY9yUDxUrCrfne4WTbHZVQxNRIlC3CPfUpjjvyZnTGthqM
	0JDnaWGOCYwdtsBKQG3JOUDHM2t20tQ=
X-Google-Smtp-Source: 
 ABdhPJziQI8FX8DB+ZjMXW53y/YhhZBhQtQjAHzJtjZQLXGbQrJNjRd/omeITf5kda1hrBWdrJz5LQ==
X-Received: by 2002:a5d:4943:: with SMTP id r3mr7821644wrs.130.1644196125977;
        Sun, 06 Feb 2022 17:08:45 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:45 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 08/17] gstreamer1.0-plugins-base: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:14 +0000
Message-Id: <20220207010823.143664-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161428

- License update:
  The code actually is LGPLv2.1 but the COPYING file is wrong.
  https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/e5382fe84ccaa17cad3569f2fd061ac0b499329c

- Drop unneed patches
  0004-glimagesink-Downrank-to-marginal.patch

- Add new meson options
  qt5 is needed to build some tests
   tests/examples/gl/qt/meson.build
   tests/examples/overlay/meson.build

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...004-glimagesink-Downrank-to-marginal.patch | 32 -------------------
 ...bb => gstreamer1.0-plugins-base_1.20.0.bb} |  8 ++---
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.5.bb => gstreamer1.0-plugins-base_1.20.0.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch
deleted file mode 100644
index f45ea65ef3..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 79841a02ee754eba736cb32aaf2ed2b2fc0483d4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 24 Sep 2015 19:47:32 +0300
-Subject: [PATCH 4/4] glimagesink: Downrank to marginal
-
-On desktop, where there is good OpenGL, xvimagesink will come up first,
-on other platforms, OpenGL can't be trusted because it's either software (like
-in a VM) or broken (like on embedded)., so let ximagesink come above.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=751684]
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ext/gl/gstopengl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
-index 302e845..463be9c 100644
---- a/ext/gl/gstopengl.c
-+++ b/ext/gl/gstopengl.c
-@@ -127,7 +127,7 @@ plugin_init (GstPlugin * plugin)
- #endif
- 
-   if (!gst_element_register (plugin, "glimagesink",
--          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
-+          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
-     return FALSE;
-   }
- 
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
index 180241828f..455c9fc480 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb
@@ -3,16 +3,15 @@ require gstreamer1.0-plugins-common.inc
 DESCRIPTION = "'Base' GStreamer plugins and helper libraries"
 HOMEPAGE = "https://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues"
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
-           file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] = "960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3"
+SRC_URI[sha256sum] = "4cb66fccf730b1037e6533862c2128990912a6db4e5bbd14e0ef914450eb4c7c"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
@@ -49,6 +48,7 @@ PACKAGECONFIG[ogg]          = "-Dogg=enabled,-Dogg=disabled,libogg"
 PACKAGECONFIG[opus]         = "-Dopus=enabled,-Dopus=disabled,libopus"
 PACKAGECONFIG[pango]        = "-Dpango=enabled,-Dpango=disabled,pango"
 PACKAGECONFIG[png]          = "-Dgl-png=enabled,-Dgl-png=disabled,libpng"
+PACKAGECONFIG[qt5]          = "-Dqt5=enabled,-Dqt5=disabled,qtbase qtdeclarative qtbase-native"
 PACKAGECONFIG[theora]       = "-Dtheora=enabled,-Dtheora=disabled,libtheora"
 PACKAGECONFIG[tremor]       = "-Dtremor=enabled,-Dtremor=disabled,tremor"
 PACKAGECONFIG[visual]       = "-Dlibvisual=enabled,-Dlibvisual=disabled,libvisual"
-- 
2.35.1


