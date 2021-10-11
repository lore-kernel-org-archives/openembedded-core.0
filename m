Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5896CC433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.9553.1633945273872609238
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Az1FKcXS;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id t2so54132289wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yf4WYpQawBRwuqlmo09Gq4yVfk5DBj8PiquEzKQW4xQ=;
        b=Az1FKcXS4fmPhWudpktlpZ2HaQw3cJYAS8Ba/17TasoZpm2JhwKvKcP0j2ZgQDC54J
         dD968wscu7oVA87WxhVYvwxaHR/+2qzzDWxkugWJfhrAXX6OAR4V1drclsdCd9QKnzf8
         LJ6fCvkgjEQ4EqChZCOWRcuI4OgZUcTabFM5bG4KFtCZ/ILjXErAMqYOA6fp1su4z0Fc
         3LXS3HjAOnKOPzGnY3GhKR8Gb127tkh9H44ImSBSJB48HcrmO4fPQGGHBwo3VJ5qxa4y
         2TKSKTr+QXVV4QT4iZPrGyv2l4uZMQIrx551k5+zGaKHZqaIatSuerWwTD9KXyAiRF0m
         z/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yf4WYpQawBRwuqlmo09Gq4yVfk5DBj8PiquEzKQW4xQ=;
        b=iHVCs8TvbF23kZT7X3KJzi4h1pRGv1fEZ6X8qlOPn96eboXK3QsSgEzZmNOxqBWsCw
         AZ7fkNSG+R99EtHuaM1IxKsy6qgsOI8oBcFkfFASnoe/RrKX4gHCUF44se/Z+Nko2R0w
         7eVpVbMcbawlCdvCi3XRzrXnizkqzTeudEt2oMzBUhGJIStRtw8rNTs0EtpbsUSo0i4V
         BlDTXGQ6JUxCijFia7FjBpUgIxcPQXfniHFRCZJ6Wv0xq56i+lcM84ixzO0TpPcPed4k
         uhzxmuDZT5i6ckCxk72/uPvxj6GlGYg6tC5pcVMxxYvgmEgHw/N6ajg32AIQAE4zc7BV
         9w6g==
X-Gm-Message-State: AOAM533ranEoVi9gb6K0NeOOZtWiubF/lxxH8IsO+YtPJ3JPGFCN2ybS
	5UoqBq/v+NoyFsNpxLAb8jdlhtF8jOc=
X-Google-Smtp-Source: 
 ABdhPJx5sCg87deZrHY2954E/Sh7hz22VjHb+2MRbfl6X8OQ92HR55N9m2N01uzm4EnaTWjSfcLa9Q==
X-Received: by 2002:a05:600c:2159:: with SMTP id
 v25mr19219228wml.175.1633945272307;
        Mon, 11 Oct 2021 02:41:12 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/25] libdnf: update 0.63.1 -> 0.64.0
Date: Mon, 11 Oct 2021 11:40:48 +0200
Message-Id: <20211011094059.4184654-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156826

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...avoid-the-use-of-non-portable-__WORD.patch | 34 -------------------
 .../{libdnf_0.63.1.bb => libdnf_0.64.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.63.1.bb => libdnf_0.64.0.bb} (93%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch b/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
deleted file mode 100644
index b740521fdaa..00000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From fc0b81bb717db3f41513f09f6661676a7aea6dd4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 9 Mar 2021 19:30:42 +0000
-Subject: [PATCH] libdnf/config.h: avoid the use of non-portable __WORDSIZE
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1159]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- libdnf/config.h | 9 +++------
- 1 file changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/libdnf/config.h b/libdnf/config.h
-index 01b330b4..dbd53f5e 100644
---- a/libdnf/config.h
-+++ b/libdnf/config.h
-@@ -20,14 +20,11 @@
- 
- #ifdef __APPLE__
- #include <stdint.h>
--#else
--#include <bits/wordsize.h>
- #endif
-+#include <limits.h>
- 
--#if __WORDSIZE == 32
--#include "config-32.h"
--#elif __WORDSIZE == 64
-+#if (ULONG_MAX == 0xffffffffffffffff)
- #include "config-64.h"
- #else
--#error "Unknown word size"
-+#include "config-32.h"
- #endif
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.64.0.bb
similarity index 93%
rename from meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.64.0.bb
index a9f393e7225..38d3307b118 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.64.0.bb
@@ -11,12 +11,11 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
            file://enable_test_data_dir_set.patch \
-           file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
            "
 
-SRCREV = "8e451380bf84bd76e3925cbae2a06bb0e56f5cd9"
+SRCREV = "e5ecbc1e5062631f44cb94a3b73d9310db0ff386"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


