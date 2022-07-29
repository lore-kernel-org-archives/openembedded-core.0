Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850B3C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:47:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.50.1659106064985200198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IRAAruH9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id iw1so4811020plb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4KC+ONGuUkbXEMAR6ruUrU0SGAUS0wLhXf4ng2UKhPw=;
        b=IRAAruH9Q5hRTDo/7MnoCvHJEH/TjYEVXlLcuVPYxFjdRseM3V1Fw8DNsQH3Is4sHM
         wHTOLVINR29pADa4WsfQxNzF7AAIUzZ+Q6IyamfFwNe1SrCDVJz7Nu8IeqyCurIcQ1q+
         pqdCr0oegqzsGm7O9D9bF86Pa2vItdIbZw0hNl+ebIUHbifVrYSKxWVTO+O3efhjDbsy
         N67J4pM8hjGLHEVU5LkjAEBUd5n3YNBKqojxHYKhrO2fi7cn91I39sLrCX/X3vW7nQ6f
         7zvDYFDXpyNA+0kkpeAwdt10RpRY2Z6Cyua3fPnmHl3BB4oP+vuoTOOKlp3ct2/FILWY
         POlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4KC+ONGuUkbXEMAR6ruUrU0SGAUS0wLhXf4ng2UKhPw=;
        b=uy7jNmhuY9JQjJVL7N3Lt4hAJTyzyeFoM8z5nY2KXL5JfumHtjbx9amSBMJtjhR4ea
         CNO+4epHhWfXMV1R/yhZPUMm5isSgsHG+4ElkMzpGP6aFm+RRMG/GoOrMcMje52F3bai
         SpRrp2g6CqwmEoad3jfECQKUFjq0U9umAO4/RFCY/ZwJFKF9QO/Sp1n9l6ZXGpC+/Jee
         dpsDowrL7uL4fOQsYzM+oq1r0HS9fNlXOrhNrKUt74r8OKXE97HKBbi51TdcZ1v9yRcQ
         StdfdmbDQWsR7ZnIcKdcxxtCMF38FZovTFxg5iq3Au3pL/fEE2emZUyeYiLMrLanDdtr
         Slaw==
X-Gm-Message-State: ACgBeo2pTEZqHsVdw5+ilhIL7RDcflJKF/DllOmD2Zjr4YBLM12zXaRB
	gUqfhhDy+042LS5Ps1C6589FYq1SgdVgynUb
X-Google-Smtp-Source: 
 AA6agR4x9TVM/wRos4apufqw5dPXCEFBdbLNi3frLh1pXBFdJ+WrfUZcmKfNpTfyiXJpE/VB9fQ4HQ==
X-Received: by 2002:a17:903:191:b0:16c:3d49:b0b3 with SMTP id
 z17-20020a170903019100b0016c3d49b0b3mr4320047plg.174.1659106063959;
        Fri, 29 Jul 2022 07:47:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.47.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:47:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/29] encodings: update 1.0.5 -> 1.0.6
Date: Fri, 29 Jul 2022 04:46:25 -1000
Message-Id: 
 <73ca8c3e8639929ed78a3c605056f7fd42e500cf.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168644

From: Alexander Kanavin <alex.kanavin@gmail.com>

CHanges:

      gitlab CI: add a basic build test
      Build xz tarballs instead of bzip2
      adjust descriptions for the Unicode mapping to match the Unicode.org data file.
      add mapping for 0x80-0x9f, as per Unicode.org data files.
      use descriptions from UnicodeData.txt except for two obsolete or incorrect maps
      correct a typo (in original), and use appropriate description
      use Armenian eternity symbol from Unicode 6.
      whitespace-only changes for consistency, using luit's annotate-enc script
      add descriptions from UnicodeData.txt, using annotate-enc
      add descriptions from UnicodeData.txt, using annotate-enc
      add descriptions from UnicodeData.txt, using annotate-enc
      add descriptions from UnicodeData.txt, with annotate-enc
      add descriptions from UnicodeData.txt, with annotate-enc
      whitespace-only, reformat with annotate-enc

Add ability to tweak compressor suffix in filenames, similar
to xorg apps and drivers.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1fb0fbfbf0bcf50906a26421435d7165be64281)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


