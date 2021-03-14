Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.5566.1615726435014602065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 05:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Az792/LS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so17852905wmj.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N9xKQjjbuiJtHlqJNLDWUpnUjilhd/N3gbqgcBk4BuE=;
        b=Az792/LSPIeN2Akx2yLqMBfdwJhWek9LyzXMppmD3uBaIYmQzwCuLi5ZIRq/sRTrf1
         PVQYrUuxfYQnb7OH0JzUd8J6Sy5nY42bICN4cdMVLD1D7XXSSe5Hr2sKnJ7rSQwj5/d1
         IHr+EwVNpmhMDWFuqJsythFjWXQb6JlxkMHNyxhR1Oavd5Ul6vOtApY/P536TFQd4HZa
         Qsupsva1wYvGqerSSvFQPJ2YB3OwViC1L94OD1yfR3+GM+TSXbSpNQqgxRb0Gg2YtH+A
         jcBEYvMXMPrl2vQjW+JKFUrd5nZPOrinfIF9GJIzTmcwZnczVYTXwTGFARteM0j0kGU6
         ij/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N9xKQjjbuiJtHlqJNLDWUpnUjilhd/N3gbqgcBk4BuE=;
        b=kUB5P55HXjfGwMS57SG/22Bof2kxyv7k57GaInesLsD4IOdKHBallL8EhEGIEpSit9
         H+j5YAgh1bpZ0ZkNsj0IBCsUS45p9mLWU116oJdMqWG16BnzisAlw23OJW6O7rLvHWhs
         5dmuIFvzRnKykN5p89wQm+6SEH5StJ6iSlD8Ilo2yxAfNqR2kIUQAIvjsvrUGoAnty61
         TvcfVh6x+Jekro78lLl19MTJRDDtn11v3RUFeDqjIYipUYXDlA6270GdQLl7eI0INVeq
         UfOr/Zmf3NENBp6YRKxW85RaG8sXKAWjWvmLC1J8pewz90Z6xOuEHCXL7bC80yInUSYs
         B2ag==
X-Gm-Message-State: AOAM533xf5t5/u4eNSIM0yVx17QwRJJXDqenJWVs97ykgFuZp5/QSmjY
	y5oT8KiCy1svQdlVH8iPQ7g4W77SV41mYw==
X-Google-Smtp-Source: ABdhPJxXX8u9hKc/k5YTsNe4hu0dzKIx00885zyCQgReje70rcM4WuSDfNDgQGOrI89LtL3S2Bntmw==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr21096208wmh.25.1615726432930;
        Sun, 14 Mar 2021 05:53:52 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id s3sm8831727wmd.21.2021.03.14.05.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 05:53:52 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/2] spirv-tools: python3 is need not only for the tests
Date: Sun, 14 Mar 2021 12:53:43 +0000
Message-Id: <20210314125344.30018-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

commit acf109c1a1a30907f7401f6225fcbfb5f2e39a58 remove the python3native
when disabling the tests but python is needed not only for the tests,
so re add it.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_2020.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
index ea89766e92..bfd5d7932b 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake python3native
 
 DEPENDS = "spirv-headers"
 
-- 
2.30.2

