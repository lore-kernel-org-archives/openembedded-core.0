Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BA6CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.32821.1654526336879000736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yCrDbtYE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d22so12242951plr.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=976X42LxbSydfTIiyhHGLBB72C4ZGtfkTLUss341mbM=;
        b=yCrDbtYETZee1wVZsPphhoEOAKeK7MOVW0X+VUmFVMAhmZdTKf7/WbxR6+shIKJLXY
         /I7oX/oXAigkyyUEeM9+KfO2CHUvkiv15NdiGKKAGEEdxEBesvmib+KAb1GgzpzdWOhz
         B34bMd5z3dsLLGohotCKnD9XuH9sUYVaY5Ja6/YZTbsmhBQ0GuVPwtQShajNqJTEVxjU
         RVQNgorwwFouB5jj7yhRmD6bKgRcYjuUvhiOQV1EYnNlen0PeBKNiN20yqqEQWHg3Rjv
         lpQ46qZpR/2K8X24Wjs1ufMuk+kRUYDbWMW1QKRXnqiFBHbwmaVJZe1ygYXOS3h8PIbn
         bNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=976X42LxbSydfTIiyhHGLBB72C4ZGtfkTLUss341mbM=;
        b=7lSueOtN5S0Jk7eAnxA+AD73gv6IwoD4M7ihnsROxoIsmJ5hYkpt98mH/qY3q6KM33
         rz1oq8Nx5Plw3ng2My+6DXHXG5gNM7+5Q/+mDsDy8CztArudoKvUQCT1dJVBv5wbS1xW
         bVUxvd0WqT3UvCt3kiGB+koFsNxPWRm60aYWvulciETOJlDALVvXGnZxnBVGWaZfef3K
         pWERogucIdBICVqYVFz+D87TONmJ4oSHKS7nNbBTUzBW3mCNu7BG+piouEcyEQ7zlI9r
         xDfrHvAeI3C5modMA25+uRzoqRapB0q88y708SduAFgVHHFQEQQYOwYG8NQl83fKNiWO
         QCRw==
X-Gm-Message-State: AOAM533pNHh4WOYssD2yumX+tSYxQXlS/4RZsHlw41cUF//rC54Po4dJ
	etLIaB7WWCxi4d29fa8HiiPKu8w0VmgkIS78
X-Google-Smtp-Source: 
 ABdhPJybS5kJXlwSE9ly1KYscpX2tPgd1lcI+3EBcD2UScfqDsj2C3OzgwpLhnOvAd1Cf5Op5wLaxw==
X-Received: by 2002:a17:90a:448e:b0:1e0:901b:1b3f with SMTP id
 t14-20020a17090a448e00b001e0901b1b3fmr27245938pjg.95.1654526335568;
        Mon, 06 Jun 2022 07:38:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.38.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:38:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] systemd: Drop
 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
Date: Mon,  6 Jun 2022 04:38:21 -1000
Message-Id: 
 <afedd8aad2e4c6759bda6002f6af4c2378d15a03.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166636

From: Khem Raj <raj.khem@gmail.com>

This patch was effectively needed when usng gold linker but it has been
fixed in binutils [1], it was seen in systemd as well [2]

This however, should not happen with latest binutils and systemd has
already reverted the fix since it was a tool error

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=18548
[2] https://github.com/systemd/systemd/issues/234

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e57707e820f548b3ad940ee6de9e45b4de869565)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch | 33 -------------------
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch

diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
deleted file mode 100644
index f4066d7e4f..0000000000
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d8bf23d7a698bd3253b0cfba24bd8afd0886d82d Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Mon, 25 Feb 2019 15:18:00 +0800
-Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
-
-for currently unknown reasons they get exported to the shared libries
-even without being listed in the sym file
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Rebased for v241]
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- src/libsystemd/sd-bus/bus-error.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
-index 61928f4bf3..79b698b092 100644
---- a/src/libsystemd/sd-bus/bus-error.c
-+++ b/src/libsystemd/sd-bus/bus-error.c
-@@ -55,8 +55,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
- };
- 
- /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP section */
--extern const sd_bus_error_map __start_SYSTEMD_BUS_ERROR_MAP[];
--extern const sd_bus_error_map __stop_SYSTEMD_BUS_ERROR_MAP[];
-+extern const sd_bus_error_map __start_SYSTEMD_BUS_ERROR_MAP[] _hidden_;
-+extern const sd_bus_error_map __stop_SYSTEMD_BUS_ERROR_MAP[] _hidden_;
- 
- /* Additional maps registered with sd_bus_error_add_map() are in this
-  * NULL terminated array */
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 2f5b9d1367..c121fb763e 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -44,7 +44,6 @@ SRC_URI_MUSL = "\
                file://0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
                file://0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
                file://0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch \
-               file://0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                file://0018-avoid-redefinition-of-prctl_mm_map-structure.patch \
                file://0021-test-json.c-define-M_PIl.patch \
                file://0022-do-not-disable-buffer-in-writing-files.patch \
-- 
2.25.1


