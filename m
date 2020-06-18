Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.10564.1592494937099541658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f/wb0MYx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id u23so4864791otq.10
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0iVgXZ9ZCxKHsasFFworQb3497cg65LGSB25+KkwZCw=;
        b=f/wb0MYxqEKI9sRjqbTAEqeqb1JNudvXyDdNTGnxkXDdgnLi26ymzHf7EHQSH9gvbu
         BjcXbBPQyGepfuh5JtpRFRnDwUgZwQ28Xb9P34jY6bJPVhxjFBAZGj3wNTPj5PluQeIW
         cumeWCZkAsG9GbxBXeGX0buhBChc6HpV39WSWMR+oBMDjr9OyE5SxQP9wU/FZ97rE+XT
         DW6qg8qFt7K+c8PtgQwFtxNR5wuc8G3ml/rnUZ7BE/QELjnbEExenINRrITlAVYYJSub
         uBf0hmj/F+rh+J3h9G60SF9iypPxEE141v9krYImB29VCcEtz0Pz9gBeRFyJW2+W/VK5
         3Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0iVgXZ9ZCxKHsasFFworQb3497cg65LGSB25+KkwZCw=;
        b=g/DEphNZSV2MI1MDISY9tBv9+/9XIT1SOoTXUTxmdfLLtUV/94E1F7+J3tkk4IlhaY
         4kxiQNpoS9j5LJDos7KyWg1FfPJyX0TBNbCq4Ord5UbR0F9omMU3ikEHctHiMqVtRX90
         weuhZeTBOX3x3ydpCfbbGTuSkYD/Pk01nafJOidUZfZws0OPzWQReURjG/c7R482eNQR
         1VjWZ65OYOBl1VLbSL3sEHr5+smdT5/ljSSczzGUZr95LkRH0t17uh1GKK7bdwxB4ohE
         pV8wFTPQA7O/DC9dwT5cuTRmB2F6XjWf+rQqKSWti0Qos3BSAxFBZ+YfQtCVce/glS0F
         D5Xw==
X-Gm-Message-State: AOAM532ro+9yxYftXr9mPwCdxc9WYfDDBMkEIGngZoYGGc7K1WbltyUD
	HqCJ5jdbH5XMqQaBdXM0YSgBoARxTOJ4NA==
X-Google-Smtp-Source: ABdhPJwGJOfexfhBpxLZapV3gmXB1OD0oYw6hxLEp9ef0z1Qn55JwM6FcuSxAQVf8yI5IW7F9zn7XQ==
X-Received: by 2002:a05:6830:1e02:: with SMTP id s2mr3908568otr.263.1592494936011;
        Thu, 18 Jun 2020 08:42:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.42.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:42:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/21] libxcrypt2: Remove -fcommon
Date: Thu, 18 Jun 2020 05:40:39 -1000
Message-Id: <06a841e22853e571e07998079529839c96a23b21.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Adrian Bunk <bunk@stusta.de>

This was fixed in upstream version 4.4.12.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 281d53ebab4c4c1b6c880ab14761d715196fb8d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index bee1367c99..2d2a0b03e3 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -27,8 +27,6 @@ BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS_append_class-nativesdk = " -Wno-error"
 
-CFLAGS += "-fcommon"
-
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
-- 
2.17.1

