Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 180FCC43217
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.22423.1638602018839695380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jq27j7dh;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id d9so10560184wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o54LzGPMBs2KKTa564CgUE8bQlRo0vmNOFb44OyoQtI=;
        b=jq27j7dhPGin98D7+kRbyFvaLXE8nxczIvzxMLIQyppHI+Lqla8cElqV+1TINse3zo
         YZE5v6vZLy1sNL36k0oGPObrqCzerVbG+WfveMG6opRZxfTKUkE+IihNFawPRgHRSpWF
         qqHdvmRNy+Q9OSLTQXDZpc2YEVgmc1UD4tH8y8tpgkjnGCrL5EcTu3b4LrCvp38Y16U+
         avjuKsocP774JyeW7iIJSis3osISERgvRDaOANn6rn1LMAI513ojlEe/bsxTOC09P2J2
         9qlNgSogTG/Gt4sflBA6lEp6cpiizfGU5ZaRvZjqLoTQXuedw0LVLdlNquRL+sky2ZrP
         PVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o54LzGPMBs2KKTa564CgUE8bQlRo0vmNOFb44OyoQtI=;
        b=bFLmOKd1QMzdTkWptvC4YwkyiROwrB/9oYmdzMdLNwr/s2Dumy88Hg7Znrh6voHnhS
         kZuM3AxRG53XCwf2Fawtcj4JY/XsCFWP0vDBOj0Swq3wGuNZQvwnXezPzMDAaY3zgE2m
         XkFzqR6QGsWzpVEdjoB26PkAsGyK9HfmSaVZM5aGamraiuy415prlIths+C1YexT/KJA
         qycb0/8c+Bror/Mm52n/Cv+bqRsXAzLbvJd3ayKnr8Py3QiW1fPwglKJf7WMC1AeQtRv
         PvIzuJTFDbC1qrwy7qFAZ/Gtz71aYiC2FowuzC732beD5jYBb3iRxqUCTSDHqJVhxJ9R
         46XQ==
X-Gm-Message-State: AOAM530z0Qzd64zVMh4fcK38FZRFsmb7+Cd533TEWE46Ey/2ftpGtSyA
	mxSiwvA45RSuZ2Hnw9qYz+f682dH2ntD9A==
X-Google-Smtp-Source: 
 ABdhPJxjRsu9UcTVcep3lIeDv7BGlRO4PWTplBKpGu2S3EYnOzjTLCWWKwr/EQnr+0K8J7ZFG03W8g==
X-Received: by 2002:adf:f20f:: with SMTP id
 p15mr26948991wro.187.1638602017496;
        Fri, 03 Dec 2021 23:13:37 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/26] wayland: drop unnecessary patch
Date: Sat,  4 Dec 2021 08:13:12 +0100
Message-Id: <20211204071323.2480163-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159162

wayland now picks the correct setting from the native .pc file.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-the-native-wayland-scanner-directly.patch | 28 -------------------
 .../wayland/wayland_1.19.0.bb                 |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
deleted file mode 100644
index 11dc069147..0000000000
--- a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 98e7902a4ddcd80b61cce6f35f97907e841a5eda Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 16 Feb 2020 16:29:53 +0100
-Subject: [PATCH] meson.build: find the native wayland-scanner directly in PATH
-
-Otherwise, meson attempts to use the target pkg-config and fails.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- src/meson.build | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index d91c503..15730a3 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -59,8 +59,7 @@ if get_option('scanner')
- endif
- 
- if meson.is_cross_build() or not get_option('scanner')
--	scanner_dep = dependency('wayland-scanner', native: true, version: meson.project_version())
--	wayland_scanner_for_build = find_program(scanner_dep.get_pkgconfig_variable('wayland_scanner'))
-+	wayland_scanner_for_build = find_program('wayland-scanner')
- else
- 	wayland_scanner_for_build = wayland_scanner
- endif
diff --git a/meta/recipes-graphics/wayland/wayland_1.19.0.bb b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
index 5f8b972f76..4c9ae0f75c 100644
--- a/meta/recipes-graphics/wayland/wayland_1.19.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -14,7 +14,6 @@ DEPENDS = "expat libffi wayland-native"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://run-ptest \
-           file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-- 
2.20.1


