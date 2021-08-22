Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.9598.1629636705910687891
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Saldwp+/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id g138so8777094wmg.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0RXaofAFkAKSe0IusufNqBNh3a3nnf/tu0fWOloZb8g=;
        b=Saldwp+/NMlcfFufnJmg4/QpMjbxNCnJbXHWisA7ZgJdYNuAQ33ac0gVnTs5KgimMP
         wX3+J6joGCb+q/oovxM/i0tIP/DUwlzHIbl0UZA8hYZoS5iJfW5bD49kSqnvoAfhRXBw
         kua738eNQr0HswtRH5p6lEbfpRh6V8pCevGzYlBN1YFAaZgO+wDPGsaVxuPJGi5JS11U
         Ph20y9adynlCG/IEElFDNSEmT1UsVH+LXbwG8YHZFgbhJjhsl7IRnizESUM7RC9FGWsX
         O6nSjRBzebWJKblt8fs/srkUSvtQBjCYVbR7QXDWC3ruUAmX6Mp4xxTHR9OQKzLtonG6
         eyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0RXaofAFkAKSe0IusufNqBNh3a3nnf/tu0fWOloZb8g=;
        b=HV8lS9RuPikxr4nQbfrdS9fFVJ0GaB5mGsFnH/e5cyG2qzdFHEHmiKDtbYq7nqYU+e
         4WtEHQ7KbTeh29LgK2OudziAhriOzD3NJ87MO7Xn7+Qnsfkw8Iz24CATdmLAi5phxt2K
         irWQ6gSC1rXKU6sS9sUGWVCMwTaiJ1zBi2h3UogvL/Yc50lFFj3bg+IHR9XdvhhEZb+T
         hWr5KmXQnTPJ/MbfpMbrjAMdkbIhyEtDkyembkFWSDp0Ima1PS/yE7ZQMu8yTIod9ZYb
         72V/8OqYSxwwY7NyT4pIIvUG1pVSjqlU7dxwcOqVFZR3i7hPC7hWefQrMy1q3RpBKbb+
         ixVw==
X-Gm-Message-State: AOAM530xmwccOq1pVguqTxOMfS/V0Cd8M40jI4cCD98jMkKGpeBv4XOP
	LHSckOMeotfBgxzGCWJO36A6L+NDePAKxw==
X-Google-Smtp-Source: ABdhPJziYFDcx7lbuTocRjjp1KcfoVIbT9dKznXFAyCiQ7FSXHOdq4VlKVNfAkDlF0qjqnxXqgJK5A==
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr1864073wmm.16.1629636704566;
        Sun, 22 Aug 2021 05:51:44 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:44 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 49/55] webkitgtk: upgrade 2.32.2 -> 2.32.3
Date: Sun, 22 Aug 2021 14:50:57 +0200
Message-Id: <20210822125103.310416-49-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch |  8 ++--
 ...pletionHandler-when-USE_OPENGL_OR_ES.patch | 37 -------------------
 ...ebkitgtk_2.32.2.bb => webkitgtk_2.32.3.bb} |  3 +-
 3 files changed, 5 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.32.2.bb => webkitgtk_2.32.3.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
index 21828a7ecf..6d7d7067e4 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -1,4 +1,4 @@
-From 1a7becde0e508d7fac488bae6c08c1a4a0ac6b73 Mon Sep 17 00:00:00 2001
+From acf26a385d17a59ccd4b767d6303ec3dbf78e788 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Feb 2020 17:06:27 -0800
 Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
@@ -20,11 +20,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index 1f500299..0771af9c 100644
+index f316f49..de81ce0 100644
 --- a/Source/cmake/OptionsGTK.cmake
 +++ b/Source/cmake/OptionsGTK.cmake
 @@ -6,6 +6,7 @@ WEBKIT_OPTION_BEGIN()
- SET_PROJECT_VERSION(2 32 2)
+ SET_PROJECT_VERSION(2 32 3)
  
  set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
 +set(THREADS_PREFER_PTHREAD_FLAG ON)
@@ -32,7 +32,7 @@ index 1f500299..0771af9c 100644
  find_package(Cairo 1.14.0 REQUIRED)
  find_package(Fontconfig 2.8.0 REQUIRED)
 diff --git a/Source/cmake/OptionsJSCOnly.cmake b/Source/cmake/OptionsJSCOnly.cmake
-index 10664400..d9aca95a 100644
+index 1066440..d9aca95 100644
 --- a/Source/cmake/OptionsJSCOnly.cmake
 +++ b/Source/cmake/OptionsJSCOnly.cmake
 @@ -1,3 +1,4 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch
deleted file mode 100644
index b5367022d8..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 834f335bb3e63e0bf78eed0520df33d5c55e5e8a Mon Sep 17 00:00:00 2001
-From: "commit-queue@webkit.org"
- <commit-queue@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Sat, 10 Apr 2021 22:02:50 +0000
-Subject: [PATCH] Properly use CompletionHandler when USE_OPENGL_OR_ES is set
- to OFF https://bugs.webkit.org/show_bug.cgi?id=224149
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Patch by Charlène Wendling <julianaito@posteo.jp> on 2021-04-10
-Reviewed by Fujii Hironori.
-
-* WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h:
-(WebKit::LayerTreeHost::forceRepaintAsync):
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk@275802 268f45cc-cd09-0410-ab3c-d52691b4dbfc
-
-Upstream-Status: Backport
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- .../WebPage/CoordinatedGraphics/LayerTreeHost.h        |  2 +-
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
-index 6727d16c8c0b..db65f813267d 100644
---- a/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
-+++ b/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics/LayerTreeHost.h
-@@ -213,7 +213,7 @@ inline void LayerTreeHost::setRootCompositingLayer(WebCore::GraphicsLayer*) { }
- inline void LayerTreeHost::setViewOverlayRootLayer(WebCore::GraphicsLayer*) { }
- inline void LayerTreeHost::scrollNonCompositedContents(const WebCore::IntRect&) { }
- inline void LayerTreeHost::forceRepaint() { }
--inline bool LayerTreeHost::forceRepaintAsync(CompletionHandler<void()>&) { return false; }
-+inline void LayerTreeHost::forceRepaintAsync(CompletionHandler<void()>&&) { }
- inline void LayerTreeHost::sizeDidChange(const WebCore::IntSize&) { }
- inline void LayerTreeHost::pauseRendering() { }
- inline void LayerTreeHost::resumeRendering() { }
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
index 89b13314e5..c30bdf3428 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.3.bb
@@ -19,10 +19,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reduce-memory-overheads.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-MiniBrowser-Fix-reproduciblity.patch \
-           file://0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch \
            "
 
-SRC_URI[sha256sum] = "1790f86975bdef957ba9a12fc09202de8f55c885ee38467afc50d2bdb7a6c5cd"
+SRC_URI[sha256sum] = "c1f496f5ac654efe4cef62fbd4f2fbeeef265a07c5e7419e5d2900bfeea52cbc"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.31.1

