Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE0CC4708E
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:14 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.22435.1672418714437945510
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=t0DCzapj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 78so14501113pgb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZXROwtIearvh33UN5WjDzbYhsZ+9twdPxOsftCvoHw=;
        b=t0DCzapjLFdTIpjSP/WQoFn8Hy0I3R8fw4G8AStjkTzXV049PsqkJHwRi0OZEZKVEV
         JgKCS2cqwRzwosqnkNAmorBkncyp6G/X57gHTgGLOIK4GCzqAMmXXrDL7e4YBj6yRA1i
         XqEYcPFdJwi2jKokpAfTYLp+uX+OOdPb+/q9gAzP766nzSYPNMVdOcbYR7ap6xWxsZ9t
         u3iTCfvPJbEakPsIpmf3cZ9fU4o1sNQtaLi3oKQ+g/GhqdzE++QdH9MRzQl6dYQGyRli
         pjppex/gmWBzwiHgzDQV0qiy4BlrgFNVy21EQEF7sO0vU4686sJcMKW6IhW1gFjVXW/E
         eYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZXROwtIearvh33UN5WjDzbYhsZ+9twdPxOsftCvoHw=;
        b=VFpMi3skOYwCgXib2zhtMz6UtuhtwSvqg9jfjwMLlG3FXwh2zcHbEUO2msvcdgHA5M
         I7V5GHIXrBWKgsaBEMqntwoVltyLx0FN4HfGDd/9cZQ4zd6hvbCT0/FOFH0FopFKs1iL
         CUdoTfl/PhvZ7Snf/bY7uL8J28kKDumUncT1GSV0qo7v2z4PvfOvd8Mqc8LVVuCUimTe
         Y9QoVXKdIZJyGKCwJxOfoAlul/Qth5FOLXWPb4AT8NWreqTs/NM/jWFnsZYXF57GeLjP
         NvK/T7EOTTTiE/dkuix2g1JwtMUksJ7vWNB5lqnFOicLnInJMuB/0VV5n49sEFv9oDr7
         w91A==
X-Gm-Message-State: AFqh2koVm3cyurV+AFRv9eVZpJB5DfuepPhwiiU8z9kxQ69Rr16RLvAN
	rv9XuxT+8bL0D89BmPvmFvmTL/fFM0GJevomXVE=
X-Google-Smtp-Source: AMrXdXuBBtwhnUscyRMRi9FUjxQc4ch0X6SqAdJJaMTNni8THVkDbPKRGFyNPtj7WNE/LoLjGUVisQ==
X-Received: by 2002:aa7:8c12:0:b0:581:6979:364 with SMTP id c18-20020aa78c12000000b0058169790364mr13615433pfd.25.1672418713484;
        Fri, 30 Dec 2022 08:45:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 15/22] libepoxy: remove upstreamed patch
Date: Fri, 30 Dec 2022 06:44:05 -1000
Message-Id: <f2541dd3ab276961d3c867014425782d0deda345.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175156

From: Ross Burton <ross.burton@arm.com>

This patch was upstreamed in 6b09a8bc, 1.5.5 onwards.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 99b6e1ecb18d595e7b66344de882c1e1db6f35c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...atch_common.h-define-also-EGL_NO_X11.patch | 27 -------------------
 .../libepoxy/libepoxy_1.5.10.bb               |  4 +--
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch

diff --git a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch b/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
deleted file mode 100644
index 971a3f54e0..0000000000
--- a/meta/recipes-graphics/libepoxy/files/0001-dispatch_common.h-define-also-EGL_NO_X11.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7211120d1e2f059d900f3379b9790484dbcf7761 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 25 Oct 2019 11:09:34 +0000
-Subject: [PATCH] dispatch_common.h: define also EGL_NO_X11
-
-MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
-https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Pending
-
----
- src/dispatch_common.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/dispatch_common.h b/src/dispatch_common.h
-index a136943..448c9b1 100644
---- a/src/dispatch_common.h
-+++ b/src/dispatch_common.h
-@@ -55,6 +55,7 @@
-  * as EGL_NO_X11
-  */
- #  define MESA_EGL_NO_X11_HEADERS 1
-+#  define EGL_NO_X11 1
- # endif
- #include "epoxy/egl.h"
- #endif
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
index d10134568a..384afa6907 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb
@@ -9,9 +9,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https \
-           file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
-           "
+SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https"
 SRCREV = "c84bc9459357a40e46e2fec0408d04fbdde2c973"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


