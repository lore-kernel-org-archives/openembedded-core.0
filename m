Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84576C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:00 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13214.1668953758144549955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=O7t/zAnd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id w23so8396517ply.12
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh/SaLthHQ6Yp/DyAO3mDrt41Du72zA3lISMD7gYXI8=;
        b=O7t/zAndC3vK2/zzedkT4q2hvvTc1o/EEFkj03u7EvzPT7gyirJQ7f8YOe3L2C9CXS
         C/+uXutwUmHqZPoeGgww5Hy2nK7n0Fr3T4kKgNzxbLj+eXE6ivXgoVNVxiOph5rWmA1O
         tKNzU//6yJHo8lBbUyMOIgkPGFoGAXLDLjslPlKXB84ZeJ5CC/3cgG8LgsEBoCXTU1k6
         g3Y+gmcmIFOH0u+yd8vGIhCcDQTPsIyE+4rRGEkhW8X5GijG3yNRqh39e7SHjCtaUzTJ
         xANS48QN/2wbTxbpi4OApMHovzaOUFQAPbKWGo5yU2fdheuoShrIGFB0A8DF+ZVJdLXO
         PvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dh/SaLthHQ6Yp/DyAO3mDrt41Du72zA3lISMD7gYXI8=;
        b=03cKmcFbwUHxnrks6wtaSTNsprqKSWqbIhO6fXUQRlEdv3wK4gl+NTr0zHLd2peazp
         /L3PqZ5JL+aJD6fEdOPjFUat0y0dY6RRVrjGdQfA573+aiKhdw0hq3slk5JxzM670KKx
         7fq9ZmAHY/F/7LDhppqVIRk0VcN5qMjRwP50WttiofYaKBaREwuAQkc8kuEskN+Oems7
         ssvBep0AyZlAnI1ppTd0WZZD0j1W8+yZYyKujroaxqDCQzm7XdD0n7siVsIuRUIux4Vf
         lG3WOT1wkvGlotNIH6SIMz2fGJ8ZxEa7ZBuPm8FBDRLymNXOJxR0pVNs7Ci+hwqYCZp4
         xotw==
X-Gm-Message-State: ANoB5pkNqJcJ2L6fYHtsorl8PBKoXOcmzkC1OznIKctWbC/bZDcLJOAa
	/jEXcqxwYuHKtj5Qayfuj0ne3TFVNqwVtOi/gCQ=
X-Google-Smtp-Source: AA0mqf45Ypu374ygLZWofsNkW41fOoQGo09bsje/i3ljru1+EHU6xlk5g//R6dmj9C7jheGnNtbOyw==
X-Received: by 2002:a17:902:ed94:b0:186:748f:e8c5 with SMTP id e20-20020a170902ed9400b00186748fe8c5mr7826598plj.73.1668953757097;
        Sun, 20 Nov 2022 06:15:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/35] socat: upgrade 1.7.4.3 -> 1.7.4.4
Date: Sun, 20 Nov 2022 04:15:00 -1000
Message-Id: <42942e565870bd4d0753e0dc7bed9277a71bccf9.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173611

From: Wang Mingyu <wangmy@fujitsu.com>

1.7.4.4 is a bug fix release

0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
removed since it's included in 1.7.4.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c00e9d66f0b8449ff1bf24546f232345eb6feebd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ck-getprotobynumber_r-with-AC_TRY_LI.patch | 35 -------------------
 .../{socat_1.7.4.3.bb => socat_1.7.4.4.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.3.bb => socat_1.7.4.4.bb} (89%)

diff --git a/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch b/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
deleted file mode 100644
index fbfb0816dd..0000000000
--- a/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d67d6b4f981db9612d808bd723176a1d2996d53a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 17 Jan 2022 13:21:32 +0100
-Subject: [PATCH] configure.ac: check getprotobynumber_r with AC_TRY_LINK
-
-AC_TRY_COMPILE won't error out if the function is altogether absent
-(e.g. on linux musl C library), the test needs to link all the way.
-
-Upstream-Status: Submitted [via email to socat@dest-unreach.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d4acc9e..973a7f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,13 +137,13 @@ AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
- # getprotobynumber_r() is not standardized
- AC_MSG_CHECKING(for getprotobynumber_r() variant)
- AC_CACHE_VAL(sc_cv_getprotobynumber_r,
--[AC_TRY_COMPILE([#include <stddef.h>
-+[AC_TRY_LINK([#include <stddef.h>
- #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024,NULL);],
- [sc_cv_getprotobynumber_r=1; tmp_bynum_variant=Linux],
-- [AC_TRY_COMPILE([#include <stddef.h>
-+ [AC_TRY_LINK([#include <stddef.h>
-  #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024);],
-  [sc_cv_getprotobynumber_r=2; tmp_bynum_variant=Solaris],
--  [AC_TRY_COMPILE([#include <stddef.h>
-+  [AC_TRY_LINK([#include <stddef.h>
-   #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL);],
-   [sc_cv_getprotobynumber_r=3; tmp_bynum_variant=AIX],
- 
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.3.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
similarity index 89%
rename from meta/recipes-connectivity/socat/socat_1.7.4.3.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index a4a0a8933e..5a379380d1 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -9,11 +9,9 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-           file://0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch \
-           "
+SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "d47318104415077635119dfee44bcfb41de3497374a9a001b1aff6e2f0858007"
+SRC_URI[sha256sum] = "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
 
 inherit autotools
 
-- 
2.25.1


