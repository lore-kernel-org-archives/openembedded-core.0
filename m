Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.35603.1607956630728530671
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GE9SuxuO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id q4so3002033plr.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0MZ3Tr5WgoFNH6/koQBSKfXfBWaYa6B7JQDRU4kvBcE=;
        b=GE9SuxuOG6WryjEhssBppoyF/0cMMgcmo0dy8zMOe09MBVIU0+li93q+InjHFJeag3
         LDN0fKH8EaVlo3Fr5FZ9X68JWB0Cq4lQxIPqxiKgTy0mcifNaF0d3R5/uSsTt1UHbfeS
         SVcrDdg+rPItoL8wVWI4lnt/HW2NpHmlqjF+Q9AezPQf3oTeNSfgucHJC9GHfQ8Ub3V1
         2VjD5GLjaquDjDl/Rm2rFBn9zGie5mFiZkU56nesaq7/VsqryYcL8iP0sO8bFyyGxCEA
         jgFkvLID7QZMzn07GHIy525s3ddpw0UK+EhxsMfODhLpNArXosHCxgVdVZCKx4HZSlPq
         6bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0MZ3Tr5WgoFNH6/koQBSKfXfBWaYa6B7JQDRU4kvBcE=;
        b=Z+SPqxw9kxop+u+Bao8Vz9MKeE5wzJe9G/lYSKbVmZBOH4nqN9WeeLKlySfNGrJ0RR
         dj/wUoThH62SjZBlT3hOBRdeIUyjB6So57tKhqXBF8EklTs7eMxwqbm8BhceMgrnwSoF
         2IxyPmAhkd6Bns/Ntc/X3+oogZS+qaz3hWlgWqXnJhx3CGde7e95P8f5Z6jZGyI0paOr
         eIgRPouMg2Kn9eGXkXobia30yV3ifYiYdqqpZII3aE/pm6JsZ4zOQkv+nUdUlzDcR3Jm
         NtF++1yP8UjXpHdMdVG6tYm9K6bx0sIZ/QhXxpanaTgYakuA+Yv9R4kPKz63vX6yzmS6
         ccqg==
X-Gm-Message-State: AOAM530vUKeplpymI9AEbDGSkxue9dwh3JDEe1ch6sl6ZFHKIFWLN7YX
	w7vO8fCdqhDtiIwIUr1V3dXg84KhyQjd2VBN
X-Google-Smtp-Source: ABdhPJxTGl7B2d8y/zmk0TFLDX3ETfQ3enyy7LiSkyQWREbRuILmeEBi2Th8qr6t9VN5YkO16LHvqQ==
X-Received: by 2002:a17:90a:ad7:: with SMTP id r23mr7351613pje.149.1607956629648;
        Mon, 14 Dec 2020 06:37:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/25] libsdl2: Add directfb to PACKAGECONFIG rdepends
Date: Mon, 14 Dec 2020 04:36:30 -1000
Message-Id: <5738bec0e5f06037015fa431f74ff66da66b70b1.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Mark Jonas <toertel@gmail.com>

PACKAGECONFIG[directfb] already adds directfb to the build
dependencies. But the automatically generated runtime
dependencies do not add the directfb package to the runtime
dependencies. Most likely this happens because libsdl2 does not link
against directfb but uses dlopen() or similar. Thus, the runtime
dependency to directfb needs to be declared explicitly.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62d3cbe7c8261c1c875ff6da11572409262aaf02)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 1049aa548a..fa7acc4c50 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG ??= " \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
-PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
+PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
 PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
-- 
2.17.1

