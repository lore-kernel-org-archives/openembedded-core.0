Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAE2C25B7D
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.61055.1716212031236791556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OdFLnML0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f44dc475f4so1097009b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212030; x=1716816830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5r7Nad3ZnIXs71coEBUFWWLznKfHZbwo5VBL0pwj70=;
        b=OdFLnML0+mNJiahW7p3VySocJDBy+rU7wDC9G7os5W7G67R34k8mW9nB0YyLDfIkdC
         qHCYcNjEkXWJ+Cr9EBHPkH2eBkL5Rmz/JhTuSvwhE0apRppvPkFAleCep3S7t/ULOmXF
         uIyNb4k9u1QifzH3JojMNi0l0e/p8uOUHPly+0BjjzmKqHfh5zdIYsnLqzAN0OOLLqhm
         E4PSg8r14GXe/RwOd+ouM/BNRVETHKNQir/Jf4Iuua5DssSKtTUabHeiyGhRXFwQkbiw
         U/UDvy8rgiW8cz9uFnFqFP1Ro0JF3w5/m/Eb0zKZoNN3Cbh70u9dXXTML6NuJmWbQLjC
         bYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212030; x=1716816830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5r7Nad3ZnIXs71coEBUFWWLznKfHZbwo5VBL0pwj70=;
        b=uQf1ZsZkkcxBPgjdEXldglf6QjpFWm/ixBGJWIvCCzt09tkBJnRE9y5EAEeuKCRzXx
         ABtjJZWtc4FZxh15Zqll3UBwva7XA1cOWxt8n8EItBw+QxPtmDVk59O6CrdM7Li92cbd
         tYBfa4ITOu6Akez2RskAEAO7DQtZ59EiIdP2z5Tf5dYGLoPiSqhVWzvgc5b13gabqun3
         wk8aRugVYHS9nlQzDw4yh8mrH6VV1xEs82reeAQvUVe5+te21QS83iM1uEL03yn1sWHc
         1nkWGeEJoB3IT8c1RdwjH3K6/NOHvA7mRzFfWCxnLk7uXfdzFdzrEi+iU7UhZB5yDBMU
         IV8A==
X-Gm-Message-State: AOJu0Yy246vaXDtfSSGE1mVmH32w05CrCQCJvQmx/BAEGN51cpDjqVRV
	ejziw6yYD/4Xu5a7YAbG6KPjE0DctAWM9RdEKmA8WrLgmjQrtup5+WtgKkSNXYceme5/k2+ZINH
	X
X-Google-Smtp-Source: AGHT+IFGdS2U/FtwoBB/w0FZkaBmbo9lMrSbGl3uhrqznq/AJF+Z/MyoRRvZgtQFksv5M3wJJlq1Hw==
X-Received: by 2002:a05:6a00:98b:b0:6f3:8990:665c with SMTP id d2e1a72fcca58-6f4e02d3210mr33621963b3a.18.1716212030471;
        Mon, 20 May 2024 06:33:50 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/21] webkitgtk: 2.44.0 -> 2.44.1
Date: Mon, 20 May 2024 06:33:20 -0700
Message-Id: <f891b66b981b0e023ffcf7e5cb2cd3fe99008f16.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199580

From: Kai Kang <kai.kang@windriver.com>

Update webkitgtk from 2.44.0 to the first bug fix release in the stable
2.44 series 2.44.1.

* remove backported patch

What's new in the WebKitGTK 2.44.1 release?
===========================================

  - Fix handling of lifetime of web view child dialogs in GTK4.
  - Do not schedule layer flushes when drawing area size is empty.
  - Fix videos with alpha when using the DMA-BUF sink.
  - Fix the build with USE_GBM=OFF.
  - Fix the build in 32bit platforms
  - Fix several crashes and rendering issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c129c47cf9fa119005ea6e3946ebdee0da1db7e0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...af379dc70b4b1a63b01d67179eb431f03ac4.patch | 38 -------------------
 ...ebkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch b/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
deleted file mode 100644
index 3067500447..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2922af379dc70b4b1a63b01d67179eb431f03ac4 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 18 Mar 2024 11:14:54 -0700
-Subject: [PATCH] REGRESSION(274077@main): failure to build on i586 (and likely
- other 32bit arches): static assertion failed: Timer should stay small
- https://bugs.webkit.org/show_bug.cgi?id=271108
-
-Unreviewed build fix. This changes SameSizeOfTimer to ensure it matches
-the size of Timer on 32-bit platforms.
-
-* Source/WebCore/platform/Timer.cpp:
-
-Canonical link: https://commits.webkit.org/276282@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2922af379dc70b4b1a63b01d67179eb431f03ac4]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- Source/WebCore/platform/Timer.cpp | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/Timer.cpp b/Source/WebCore/platform/Timer.cpp
-index 4f7c0f5c39ca9..0f3734cca2474 100644
---- a/Source/WebCore/platform/Timer.cpp
-+++ b/Source/WebCore/platform/Timer.cpp
-@@ -263,7 +263,11 @@ struct SameSizeAsTimer {
- 
-     WeakPtr<TimerAlignment> timerAlignment;
-     double times[2];
--    void* pointers[3];
-+    void* pointers[2];
-+#if CPU(ADDRESS32)
-+    uint8_t bitfields;
-+#endif
-+    void* pointer;
- };
- 
- static_assert(sizeof(Timer) == sizeof(SameSizeAsTimer), "Timer should stay small");
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 0819f6de0d..29e12bb8c5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -16,9 +16,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://2922af379dc70b4b1a63b01d67179eb431f03ac4.patch \
            "
-SRC_URI[sha256sum] = "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87"
+SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.34.1


