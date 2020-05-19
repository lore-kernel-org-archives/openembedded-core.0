Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.13127.1589899887975790784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 07:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZMXaWVLL;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id f6so6529648pgm.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=thxnS9Zeqa747Rl+ILaAzc+2QXun4oQODwkO3gWaHgY=;
        b=ZMXaWVLLGcBAvZrUYug+xi8Xihqf1ZOHwkdAoNYWlzjTTlGFj39EqWyMrfVLs8U8fn
         5MDBUxGe+qHCkNOjSQb5z8oBTXF34z9ky5buGCa2wb8C/HrysdbGyltnZPK28a4UWkTY
         M6IwrxhUBPRkMr8ChIjNXtrgCnPL9/ty0cZXQ5TWtKEQ6bEuQbP7YgbhykJyBPofI8lQ
         fOYiCEuUic58YUCjZb+FhZVAM/QAfaYIxBBBJ9MBmueWTzcQYlIqUhozR9v0/4j2YWe2
         PDAhfOn85v4MF8bVETUqI4pQuuNRluREni7sRLMyZSv0aPapS4KMF4WhTtQRuAI5RC8O
         MCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=thxnS9Zeqa747Rl+ILaAzc+2QXun4oQODwkO3gWaHgY=;
        b=S/KO120O9B4U59kqEhFGiLyDmVUDGRoHgSrVQVpi94d8yYSuIwU3j+TQV8rennGcSl
         TBb7nlSM23EVgYnJRYExvUY6UOqGbtc69/tW42SG+VMPfdHjHiLh45lUrSuun7o8kS4v
         uDpbVmzQhTNtboI2fcApvbw0XcrcIrowgsyYlPByeOX9kMyYAIYQ62zvaX/xE6GWt7f/
         4Yd4orX5Mb4VugJqwTh2+cD2/or9gc8Kt/8xVcOv8cCEk0tlwwXkl+5zZe6oZSpJeWeh
         rzk/b9dDbD3NpfDvrHLQh/R1tqCWJ1DBu7W9ux/9m5O4ZSdBf/vLAZYtOpNag4pSdz99
         vBtA==
X-Gm-Message-State: AOAM532ZydZkXzxsZtp5xH8aDY/xQSWGMZ7a03/6Nxun6olSqOd3lDkc
	NtvStQCoc1YwwOhFuc5Dut4rKbBU
X-Google-Smtp-Source: ABdhPJxkx1IefVc2MyGoNS9gJ/vs9sQTNKGNkHZULWzdFIIH/cOfKMqjaGH6kYlkZGxRCbFKkepKlw==
X-Received: by 2002:a62:1b53:: with SMTP id b80mr2947951pfb.145.1589899887308;
        Tue, 19 May 2020 07:51:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id b63sm4551196pfg.86.2020.05.19.07.51.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:51:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [warrior 6/8] openssl: update to 1.1.1f
Date: Tue, 19 May 2020 07:51:13 -0700
Message-Id: <c74958fe05db584289ee560584190b3a0b25155d.1589899663.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589899663.git.akuster808@gmail.com>
References: <cover.1589899663.git.akuster808@gmail.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This also un-breaks python3 ptest which got broken
with 1.1.1e update.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4ddf5b9d8cd769b7026663f93c8bc69b55d8cbf)
[AK: bugfix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1e.bb => openssl_1.1.1f.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
index d016bb67e7..204dc7c6fe 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1f.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "694f61ac11cb51c9bf73f54e771ff6022b0327a43bbdfa1b2f19de1662a6dcbe"
+SRC_URI[sha256sum] = "186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1

