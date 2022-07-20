Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02318CCA480
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.51537.1658306704453342136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SfJ0udIE;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id z23so31809836eju.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BaY45vLgYmRNiu8TfMmEIorMkhQmAVHiuWxN4wYjxMg=;
        b=SfJ0udIERE4Sv4KZ7BZlTPdTjX8/GiCZOiSUmZGkjzqCIGJPaFMvaFvBFqpwGsJW/8
         lE2KlLJbZF9cuuwhncV1jHHCR1H05eTb/r/bPZ7ZE80eUZKD18YPQuuycpA+KjIBoufT
         E/QFF75jHAzQcmIaZQjuntPL56EC4XKvmrA3ukPDQuUKLu1TcBZDlATQ6255vwrOvd+o
         7UbovBITlf/5oZ6+E4+1TvW+xh7PzNtZ3nBEWBJEI77+7liwV8/L6U6fVaS88olGV1Oc
         pysukT36IxeLG9A61VQxDeVhW3IBp3rQWayz7Xd69EBsquQwG3PMO+JS6eRDABya01cC
         GEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BaY45vLgYmRNiu8TfMmEIorMkhQmAVHiuWxN4wYjxMg=;
        b=uNP9GElLBWM7IrMviPUvHU84uLwbO5mCvkEHDAsHTlqkQy7Dvy4ngZsyzJakIsjbO2
         v+KnlnwLq0WE3ZBgsfp8+C0ZCR5r9h38fmQgAnopqM0zTyRFpk6TJhFC4wfsI/pTj14/
         tXMbpyUTkwbECflYcUDZpMfLDCc0j2tUSCiEViyCHKbX5W8G8GUgz/gl/Bxbn09CJJSO
         8rM1O0/ajtHUKxS8S4sVOBvF76+/w2vgjDmJb6Ex736Xhv6/ph4mDoNzRyaIjtfOBSeS
         Np5RSlutnmHZGyBkRSw5tG9Xc4EGNdKO4OT2idf0ujsopzqIdYMjA/xre6rtHd82PvJ9
         kp3A==
X-Gm-Message-State: AJIora+XmigjPaB/i9v9cYYEE00gUeFbN3A9SRMZBhxV07PD0T8f362L
	phpPWRlGEWUkcQCpjIf5eSWfea69wK4=
X-Google-Smtp-Source: 
 AGRyM1s6Py24dONpOeoGXS/kOcE80jELwCCNa4Gsv1Go0LiswVYqoSPvlbmDG1Sdbg2U6elumXiosw==
X-Received: by 2002:a17:906:478d:b0:72e:e902:587 with SMTP id
 cw13-20020a170906478d00b0072ee9020587mr25851743ejc.548.1658306702831;
        Wed, 20 Jul 2022 01:45:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/51] encodings: update 1.0.5 -> 1.0.6
Date: Wed, 20 Jul 2022 10:44:04 +0200
Message-Id: <20220720084442.2940187-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168308

Add ability to tweak compressor suffix in filenames, similar
to xorg apps and drivers.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-graphics/xorg-font/encodings/nocompiler.patch | 8 ++++----
 .../xorg-font/{encodings_1.0.5.bb => encodings_1.0.6.bb}  | 6 +++---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc      | 3 ++-
 3 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.5.bb => encodings_1.0.6.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
index ec7c7d80c1..9ee7abe775 100644
--- a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
+++ b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
@@ -1,4 +1,4 @@
-From b08c43a0842076e0a94e88ad6456a9326cd7ffc9 Mon Sep 17 00:00:00 2001
+From 0c0790e90a68bf8290da5c0e57142bf7c620f039 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 17 May 2011 23:03:02 +0000
 Subject: [PATCH] Improve handling of 'all' architecture recipes and their
@@ -21,12 +21,12 @@ RP 17/5/2011
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 622c27b..5ee84ed 100644
+index b80e3de..80208bb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,12 +3,12 @@ AC_INIT([encodings], [1.0.5],
+@@ -3,12 +3,12 @@ AC_INIT([encodings], [1.0.6],
          [https://gitlab.freedesktop.org/xorg/font/encodings/issues])
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
+ AM_INIT_AUTOMAKE([foreign dist-xz])
  
 -# Require xorg-macros: XORG_DEFAULT_OPTIONS
  m4_ifndef([XORG_MACROS_VERSION],
diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
rename to meta/recipes-graphics/xorg-font/encodings_1.0.6.bb
index 8ddbaf24dd..be82414eef 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb
@@ -7,14 +7,14 @@ require xorg-font-common.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9da93f2daf2d5572faa2bfaf0dbd9e76"
 PE = "1"
-PR = "r3"
 
 DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS:${PN} = ""
 
 SRC_URI += "file://nocompiler.patch"
-SRC_URI[md5sum] = "bbae4f247b88ccde0e85ed6a403da22a"
-SRC_URI[sha256sum] = "bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41774a31"
+SRC_URI[sha256sum] = "77e301de661f35a622b18f60b555a7e7d8c4d5f43ed41410e830d5ac9084fc26"
+
+SRC_URI_EXT = "xz"
 
 inherit allarch
 
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index 2df23efed4..edf7cf7642 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -9,7 +9,8 @@ RDEPENDS:${PN} = "encodings font-util font-alias"
 
 XORG_PN = "${BPN}"
 
-SRC_URI = "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI_EXT = "bz2"
+SRC_URI = "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.${SRC_URI_EXT}"
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig features_check
-- 
2.30.2


