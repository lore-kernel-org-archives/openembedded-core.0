Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0825CC3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:46 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.16024.1672594717805454701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FVSSJRLz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 36so17132325pgp.10
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sF3PHlj44suGW/Prc5GsmT1LpYU7LSxWWR0Gdr5L93s=;
        b=FVSSJRLzfcr/fw5SwcFT7LFo/pZ4YcT3ZBN9dke0flVmv2F+HNWN3m5juMCVmZXXI9
         kj8l16pAyX6pKhXhX0KAoByGBYCySp/oMwhUw683Ji/TsBeuLMsC4n1bNrVChpeFwt/V
         zm5bwpIAZoksmNUZl7Ic7iwxRPqlm1k+D3HU98cexVP1G8AWnEudbmen0BxwRZGUB/M/
         ssrDOJ2LsHKdzQhQNsqvtmmUtXEafoQMLrb5ZaLCJB6oTV/tPB4tp7RIi4d5dH2szF9Y
         9JRHTUH3A1yIViu1k+CZrnGCe+QsEBg1pz8aViRGUjcbZQj6lYp2VdFACgNVla/ImjsV
         f4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF3PHlj44suGW/Prc5GsmT1LpYU7LSxWWR0Gdr5L93s=;
        b=HlctaSd77mb6EPFvpFwwHoykOdqpQ/owkiuE3mjp/WvfNEpBKt0H/OHKRZIp3PPGk5
         VxKPyPHgVQCOjBf4Az3ljz+R9EJiy9EugvTInUM4mmZKNjpLei4RYbhVDMGtNi3Y2HJ3
         Dan9/vCZ7toT0fZFqeTqVqpRtNRpWx5Nc7YxDyI4r2BrnndmhQgRB7zEL3NXHvyVIEyZ
         Eq857oW1Ek1BRYSYqPBml1ODuSuqV2rlKsnvS/7FHL0aAkVMFtZqY+Ad3tCwmB4wjxWH
         nwk/sCip5P+Q3OmkKf77M6p0QcY/JQsWQ8ShqeWAzI9N5MDbrcO0C9Ik3jw4+rSxGxUW
         vs6A==
X-Gm-Message-State: AFqh2krB6RxIV+E1RdGfK/S7TXQ5qW08uPH2rmE505bzKSPGiE5gVXge
	+94489cmoi0EXzCL6fqME5f+V51xU1T/oeXhP0k=
X-Google-Smtp-Source: AMrXdXu1ON8Lx9R1OJc0jSwUF6BgtRxfa/y/KAqQh6WAlRwNAvObNCU9unugEEvA5CQuD4Kx9i4NIA==
X-Received: by 2002:aa7:804c:0:b0:576:cd93:2b06 with SMTP id y12-20020aa7804c000000b00576cd932b06mr36012332pfm.6.1672594720675;
        Sun, 01 Jan 2023 09:38:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/29] libepoxy: remove upstreamed patch
Date: Sun,  1 Jan 2023 07:37:44 -1000
Message-Id: <dd861b9f61826bb08b58d45f7cfe23fd7c2e12fc.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175210

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
index c3e770dfa8..3e29935640 100644
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
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
-- 
2.25.1


