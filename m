Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2251AC74A44
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.16127.1678375212343386824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GsXo+bNb;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id l25so2247232wrb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb2YUP90W3da/9BPhTpRboHrh/oevvOA5ZUGGzgn3cI=;
        b=GsXo+bNbQQ/VWmlHsxXepfPBqDRLqa2ZPHkwx+lVl9dPkRlpim6Ad8yMgpPwFcO1ZC
         nLvGpRh54EQIXNfv/xq/sqVEn54mql8wk08ne3FLMr3W5ctyq2bTDPlG9WEZ0UZE0VhB
         OfqWNPAiCO4LQzd9I3k6IYdLL3iElfXgD6H/o1zpuZRxjnAV/DWBdg+PkPxaxszrZ6ek
         K8uksYIy20/YgUEaPMc8ZriYZIGNAE24PIcqytb5MAVme4DMS+/0xSvYMVOVaUVp6G2L
         XwaL9rf3Pk+i69RFze7f0He8yu36AKnAkMKoDXvoGr8u2XQX5j6G5PB0H0agNjG6iAPL
         A0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eb2YUP90W3da/9BPhTpRboHrh/oevvOA5ZUGGzgn3cI=;
        b=Ug3uMeMydW/d+7GVye2p/g1UXNczpZAkObP9AV7gQcPC5ROCeW4L5gHUizYDZQ82xV
         SLuLZEXkD69QX0ekUoE+b2jCVfZkjqqj2eoTc4Y5Q0lvNqiMbrLz/aMpnbqEGwNW64Mh
         kbkg4xvN7vYowqxiyZnhVlD80AyYx7L4qaf1puss+Cc/x7ZljLPeuboulCenPay9snKs
         dVXpe8qbOpf2EkZx8c81fz5lMJ0hp5eY5tMnrAcuDAfuRqX741ZDEVAsnC9f74OIHKVD
         GhainQb7kOqzkpaTCC+Zh7GV/sUX7nP1MOjGyVNz104MZaZdsZ0/+BfVFRtc91phHG4z
         rx3Q==
X-Gm-Message-State: AO0yUKVeSNaeXqOYJtUXGis8cmDK5jxUDcZ9qo/78MTnRhiHLT/TDGef
	2mIGCfTztGkzHKMVayn/Rp9mTNJ38jg=
X-Google-Smtp-Source: AK7set9jofmUC/ZY57ysuq+a2WiurPHrDJ0FrZiRK5jqb0sfD0SLr5TMm7l4dixxcOXhUbh9Se3qsg==
X-Received: by 2002:adf:f44a:0:b0:2c9:ee50:b295 with SMTP id f10-20020adff44a000000b002c9ee50b295mr14898570wrp.28.1678375210753;
        Thu, 09 Mar 2023 07:20:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/26] font-alias: update 1.0.4 -> 1.0.5
Date: Thu,  9 Mar 2023 16:19:44 +0100
Message-Id: <20230309151958.3619193-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178237

Drop nocompiler.patch as upstream is now using a macro specifically for data-only items:
https://www.spinics.net/lists/xorg/msg60817.html

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../font-alias-1.0.4/nocompiler.patch         | 42 -------------------
 ...ont-alias_1.0.4.bb => font-alias_1.0.5.bb} |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
 rename meta/recipes-graphics/xorg-font/{font-alias_1.0.4.bb => font-alias_1.0.5.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch b/meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
deleted file mode 100644
index e54eee4ea9..0000000000
--- a/meta/recipes-graphics/xorg-font/font-alias-1.0.4/nocompiler.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From fa2bbd48a55d54bd2dae30edf7936e3ab7587c96 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 17 May 2011 23:03:02 +0000
-Subject: [PATCH] Improve handling of 'all' architecture recipes and their
-
-Upstream-Status: Inappropriate [configuration]
-
-XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
-
-XORG_CWARNFLAGS -> AC_PROG_CC_C99
-XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
-XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host
-
-each of which triggers the use of the host compiler. As an "all"
-architecture package, it shouldn't need a compiler (and doesn't).
-
-RP 17/5/2011
-
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3407c69..9fe1f89 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,12 +27,12 @@ AC_INIT([font-alias], [1.0.4],
-         [font-alias])
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
- 
--# Require xorg-macros: XORG_DEFAULT_OPTIONS
- m4_ifndef([XORG_MACROS_VERSION],
- 	  [m4_fatal([must install xorg-macros 1.3 or later before running autoconf/autogen])])
- XORG_MACROS_VERSION(1.3)
--XORG_DEFAULT_OPTIONS
--
-+XORG_RELEASE_VERSION
-+XORG_CHANGELOG
-+XORG_INSTALL
- AC_PROG_INSTALL
- 
- # Require X.Org's font util macros 1.2 or later
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
rename to meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb
index d80ecbeb8f..03c39a4334 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.5.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bf0158b89be493d523d69d9f29265038 \
                     file://misc/fonts.alias;md5=1bdafa7c31aa54f87f3531f2ef8ed5a6 \
                     file://100dpi/fonts.alias;md5=85bebd6ca213aa656c301a72eb4397cb \
                     "
-
-SRC_URI += "file://nocompiler.patch"
+SRC_URI_EXT = "xz"
 
 DEPENDS = "util-macros-native font-util-native"
 RDEPENDS:${PN} = "encodings font-util"
@@ -20,4 +19,4 @@ inherit allarch
 
 PE = "1"
 
-SRC_URI[sha256sum] = "f3111ae8bf2e980f5f56af400e8eefe5fc9f4207f4a412ea79637fd66c945276"
+SRC_URI[sha256sum] = "9f89e217bb73e0e3636a0a493fbf8b7c995156e0c53d9a0476d201b67c2d6b6e"
-- 
2.30.2


