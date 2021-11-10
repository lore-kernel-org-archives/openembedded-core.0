Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E6EC4332F
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:40:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.346.1636573200781627691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ImkWBN2t;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id d5so5939611wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V27SkYvkA4AQYIsof5eTy8E5Kx0mmaVwPTnJroHccxU=;
        b=ImkWBN2ta8bezCddzT45tljs9h6toLSLSWlnpGhrMc6K8A0+WFe6ZnXnbc5wB+1eiB
         QaSwqKDTYl+00D8NTvmE4vMeb4ESNyDNHou2IowahTmursmf88JGcDesi+W4clMIH8uW
         dvzsHfFlCKGgTW0x82d/Gy7G/Xdmm8vWozUEqCMLIyqyj5wX9nZH30r2VKjcR9jB+khD
         AEq+UvZs0EMbvGzb0/bt7rRmQC4M3E2AV+TWMPb/Vlsw6i8FNwq7HSWMDiheuU04Frf+
         vL9K6K1vtGAK78TIsFAous0Z3GC67w2PicFxulKJNq9yuYzxsIJMAF9R+5agAfxkZskw
         MnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V27SkYvkA4AQYIsof5eTy8E5Kx0mmaVwPTnJroHccxU=;
        b=Rz93JjNR/EWfKnd1c9kRlPZZ5Ixwmr+U455QjtuwKMZTHmLw2Ch8Sa4HpVIDijMkCj
         13O/KfpBeoeginbKkqenrxl9Gj67ZZQH5eaK+2WcNSnZ1OF5RT6TqsO6Wwh8O91Z7rPr
         cubfUzgn1/upZnrXN1OSfyThCICqF0R1twScf/VTdK2dHnIvD3LAwv+I7Zm+O1+TJEsQ
         wLY1gf3sCI4W/gQWlc+QBIT/IFYEu3XywrK3H0FF+jC8HH1K4WA9w0H2P9H1YgQg/EwG
         tv4c519qGZFIWQBJnGgNsFfw9mGR7BldPJY7vtxvxDdIQ+Nmte+vdwfmbL+qjU3qnMk+
         d8jQ==
X-Gm-Message-State: AOAM530LExBqt5n5R9UYzJkXI8eq1CuYnQg0VFoWfjtixznyiRQ7Ni42
	5/b9iDznmXSA1yFgUwgs4OzPFScAEI4=
X-Google-Smtp-Source: 
 ABdhPJzxe6991ahSHpgqk8tx+OV5hTEUzCHXYVXu07MGlCfWXKLuCPKkW/Gmevf7JSct4vBKkZQozw==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr1799727wrn.318.1636573199414;
        Wed, 10 Nov 2021 11:39:59 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/24] webkitgtk: submit patches upstream
Date: Wed, 10 Nov 2021 20:39:36 +0100
Message-Id: <20211110193937.2606747-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158107

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-FindGObjectIntrospection.cmake-prefix-variables-obta.patch | 2 +-
 .../webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch  | 2 +-
 .../0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch       | 2 +-
 ...1-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch | 2 +-
 .../recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index fae3b0b2e5..54d34b1c69 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -4,7 +4,7 @@ Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
  from pkg-config with PKG_CONFIG_SYSROOT_DIR
 
-Upstream-Status: Pending [review on oe-core list]
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232933]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  Source/cmake/FindGObjectIntrospection.cmake | 1 +
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
index e4c7d77ccd..09256951f4 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-without-opengl-or-es.patch
@@ -16,7 +16,7 @@ Subject: [PATCH] Fix build without opengl-or-es
   but in Source/cmake/OptionsGTK.cmake USE_COORDINATED_GRAPHICS was enabled only inside
   if (USE_OPENGL_OR_ES)
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232934]
 ---
  .../DrawingAreaProxyCoordinatedGraphics.cpp                 | 2 +-
  .../DrawingAreaProxyCoordinatedGraphics.h                   | 2 +-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
index 0c31c5fa21..e06607ba2b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 29 Aug 2016 16:38:11 +0300
 Subject: [PATCH] Fix racy parallel build of WebKit2-4.0.gir
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232935]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
index 3e03aa968c..9e2bf09dd7 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
 g-ir-compiler is using a C compiler internally, so it needs to set
 the proper flags for it.
 
-Upstream-Status: Pending [review on oe-core list]
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232936]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
index aa11c131d2..907d36c4cd 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
@@ -3,7 +3,7 @@ From: Alberto Garcia <berto@igalia.com>
 Date: Sun, 25 Apr 2021 18:45:13 +0000
 Subject: [PATCH] Reduce memory usage when not using the Gold linker
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232938]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
-- 
2.20.1


