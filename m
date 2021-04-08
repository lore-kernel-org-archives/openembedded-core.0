Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.4308.1617863315079877398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 23:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rxbkHk37;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id r8so2017842lfp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Apr 2021 23:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpxMTw1dQv2cAktbXZS+1w3/tzlCV1QnKYhcOttTEFE=;
        b=rxbkHk37kxN4e7Pu6qhTqYiGu05L6wd8lxOcVMG/1gvs5JHY5FfqKYFeoXUPCJ/rCF
         7vf3VcyF6jEKU7Z1t02NpJoRoUZTVpL1zr6qQMhyvYE8gewX9sQq6zQEmfazghpzWCBU
         8I3M4B0PAqQJpBCzogPG74U5tpN40Akwy8H17+akU1AmUKwmeffGzw0bmTHrrGPXLg03
         GSwkmk9UM2re29PTI/fUxDKm9Xr0FIptEfJzJVvx9/sa3iBBaAMdy2WbcqXfP+dpYp/m
         m9tagtu/EkYRKSw6NHqSzbcaJfJlgQTg9fc/WFW6z+c8twoQMUto7+b0ZVfHh+YiZP+O
         qsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpxMTw1dQv2cAktbXZS+1w3/tzlCV1QnKYhcOttTEFE=;
        b=FrtfDGk5t9R5n/KlZb944HRVlh1s8BGCqhreky/s33Lu38DTvyeEfFQsqakZS5nStC
         GLRoX/YTJJ1UxJfS9YrQ3rYh85k3h5hK47a7UPElSMTrrAo6O8J96NGS+u//ZQDz4vVX
         F500LHxtCFwsIcWcIagy8yBYJ8MD70xRpM5OOAR4GPWl40syRSjMgru5DGpWOl6hYqCa
         0WlaxakdlXkfnDI4deQmHrSymEMzqE5CBkILcAKBbSc1Geg7JheEOX6EO9VhzqFPCN2c
         l81MVjLQHJi8AaNwYv99Qx+RBD1aC243z6IEC3rG/b+ZJ/fScUzPlybW0pdTTMVMCu67
         IpXA==
X-Gm-Message-State: AOAM532y3hXhtqAkv/q6VFqFaMmf1v8unXwpPfuELnQojwms38/Ukf3k
	+IsMcuML6oKmCkogDQNu/JuctXSxzrDV3Q==
X-Google-Smtp-Source: ABdhPJyI2I8+OpQveRV23suLveJU7Pf+K8JrlF7PKh8PL/3BkEeG6/DF+TNqwz+9rtyBEwazbcJ4+g==
X-Received: by 2002:a19:6557:: with SMTP id c23mr5223758lfj.422.1617863312943;
        Wed, 07 Apr 2021 23:28:32 -0700 (PDT)
Return-Path: <samuli.piippo@gmail.com>
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi. [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id k9sm2749587ljg.57.2021.04.07.23.28.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 23:28:32 -0700 (PDT)
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] assimp: BBCLASSEXTEND to native and nativesdk
Date: Thu,  8 Apr 2021 09:28:26 +0300
Message-Id: <20210408062826.1715930-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At least some Qt tooling depends on assimp.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index 5a8c62e64d..4eb0cefffc 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -21,3 +21,5 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 EXTRA_OECMAKE = "-DASSIMP_BUILD_ASSIMP_TOOLS=OFF -DASSIMP_BUILD_TESTS=OFF -DASSIMP_LIB_INSTALL_DIR=${baselib}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

