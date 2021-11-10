Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EA7C433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:40:03 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.379.1636573201681808307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BYBkJCvl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id r8so5868114wra.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vNe9P9rEdWLSKmeGkucEMk+Z+KDla89FUujLfPtl79E=;
        b=BYBkJCvld8aSUw8LC4fN1aTGYzGoe6OkWfYwldIcIGhnjEPTNms1b3HD2bBUPunj5i
         XLj9Lrf1nE+mYERzBuwiM1M2hs1RhryFwfWaLFCEgLN325PeqEC1vCraqw0pGMSFypfH
         7DN0pCY9VWTaZu0VesWr9IaPDeNjTiCvPcJA0XEgncENuHYW9Q0nrJPxuJJ7ax85AxVR
         sqsELiglssbXcLTyNX7m9GmV8VVxtv25QZ6Dk687UO1Aykwau+76g7H+T90H2vlafuvS
         lkzll0YCnI9qQVs+FnEb2DwHlvgEQltbxRnG5tbAZERcoJoEdp4RhsHnO5L9OKQX3wnD
         NfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vNe9P9rEdWLSKmeGkucEMk+Z+KDla89FUujLfPtl79E=;
        b=F5/FOBSkvy9TaTs1EXhsZEeUmhAFsFB0r/g6OYsLfNMVfhbtPeWKF86Mg88ciqNXxn
         pFW7SyZ8lm9y5ckZXsvmkubz3X4YaWjcdYpP2OWuYCTxvREv6aAIvDo5i/bo3jmuhO3u
         WMxHsRqJQ+qfjxH3tx5994AD9SEbJUZui1iS4DBv+JeT8pAhqwyWAZgkb3x7EjyQ8X8/
         HS8MjSTG9C2LBsg28rMzLD9p6eE3dLjeOUtmmYsM/gwvFTWuA0TO4xNr3Oo5UXRL/7qM
         /qDBmaO0/3UJgQHorIEMumQX7j8qTUTFFmLIFp/d2wMSdibS4eVOLdg3l5+hSOq5fOhT
         IjkA==
X-Gm-Message-State: AOAM531NCZr5U4IcfdyhT5Xto9rr3Gbjyg0qaRz3GxSoXlTSZt2zuwYJ
	ECg5bnv4pnPJUW2SjnQyZxR1d1sYvs8=
X-Google-Smtp-Source: 
 ABdhPJxdojwb5ayp1RWXUaw6S/3P/dffM+btC6johe8SGNY3AnI2Zu0DLaTYNfWUvQaG0nCxvQk2TA==
X-Received: by 2002:a5d:6d0b:: with SMTP id e11mr1971680wrq.16.1636573200262;
        Wed, 10 Nov 2021 11:40:00 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 24/24] webkitgtk: remove unneeded patch
Date: Wed, 10 Nov 2021 20:39:37 +0100
Message-Id: <20211110193937.2606747-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:40:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158108

The file is already included just three lines below.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webkit/webkitgtk/include_xutil.patch      | 34 -------------------
 meta/recipes-sato/webkit/webkitgtk_2.34.1.bb  |  1 -
 2 files changed, 35 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/include_xutil.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch b/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
deleted file mode 100644
index e7a4cc25ad..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2cc9d445b4c8eb70c2ab6c1723dfd208218f103e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 6 Nov 2020 04:38:13 +0100
-Subject: [PATCH] webkitgtk: fix build with x11 enabled
-
-Since
-https://github.com/WebKit/webkit/commit/acd3f32cd43c363be032f93ede3aa10c4ee97fa4
-it uses XVisualInfo which is defined in Xutil.h
-
-Without this the build fails with:
-webkitgtk-2.30.2/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp:132:5: error: 'XVisualInfo' was not declared in this scope; did you mean 'VisualID'?
-  132 |     XVisualInfo visualTemplate;
-      |     ^~~~~~~~~~~
-      |     VisualID
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp b/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
-index bad56eba..fc141f98 100644
---- a/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
-+++ b/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
-@@ -31,6 +31,7 @@
- #if PLATFORM(X11)
- #include <X11/Xatom.h>
- #include <X11/Xlib.h>
-+#include <X11/Xutil.h>
- #include <X11/extensions/Xcomposite.h>
- #if PLATFORM(GTK)
- #include <X11/Xutil.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
index 4e2562df14..7a942e9cb5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
@@ -15,7 +15,6 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
-           file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-Fix-build-without-opengl-or-es.patch \
-- 
2.20.1


