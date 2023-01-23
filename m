Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B857C25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:22:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.34074.1674440502628422957
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0k8ubKO5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id g205so7758156pfb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4RqeAsD3J4Ir7ufBMWfgjwoZFSnQeVEQ6Axm3+IeYs=;
        b=0k8ubKO5ZcTZLJPG0YYbJhYkcUpMzjQb2ddl/kRVvyjqbzhbyTWDhWq0P9XFXvKBe1
         WvP5REzOaTNn01clhsjpvKm0Uc5eYbwipq6MZCoeJetZjeaOKQlUHkKmPtyFAnOekkVQ
         nakiFhHaZjVkY/WECGkeM7HKZUFGO9HEf+2fGI7RjGTKGkANTdELf1pBQlajTyv0nTu2
         11DqnX46w7gCfCyxnKxOSvC0/qmhSih+zf3/Oys46jtG1z4nEUqrDiAmxPUqbAozbwSS
         XLnCjqGcBo3atFtW/ZajmxpPuBkCjbVvJeykBWCmFn0hdGCWe7zCA90i/VYKi+DqqSVk
         Pm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4RqeAsD3J4Ir7ufBMWfgjwoZFSnQeVEQ6Axm3+IeYs=;
        b=41XIv00x3SIrlulGcl+yX8fMr2eNchrjc4UMoMt0LXkjXgHuowOT9bEJYDNSnuKsFP
         eSpgs8liYSk59IcvkdHkURlEf5tMh3et1orzAl99ELwF9PX4p3n32jloFhm1zL72VVWN
         XxxB38R5zBXa7TljoGo+TZxXT3yJJBVm8zuPcv0zzrjo5/WAYdzuJH5DPX3SdJVS9NtI
         PzhkzyCvwmkdeu1v68r/UYh3MnIvO+MarJHjDbPCgUyyDBovzKH0gqAXVE1TeXAmAxhN
         hBlM6UvWE90Fu+x8mWDhjbQ4vZGdU3sKwgUV1hYIMMTFzOojOFD6NhC6GDL49zKvdokp
         SgtA==
X-Gm-Message-State: AFqh2krlc6L38YhoRWVM3Qb9EIW1idNGi538NyBWGzr2YlTOxvqbUIEg
	lPvG4eAiFif+rSM1Eo03mPXX9FPLcREtBZNxC9A=
X-Google-Smtp-Source: AMrXdXu3YGltMj+6HyStBnmzhM+J9aG59BvzMV/QzdLkm+jnupAuvOiz8Hq2UgOFP0NfppopMPAIGA==
X-Received: by 2002:aa7:9805:0:b0:58d:f609:76a7 with SMTP id e5-20020aa79805000000b0058df60976a7mr18708530pfl.32.1674440515637;
        Sun, 22 Jan 2023 18:21:55 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/32] lttng-modules: update 2.13.7 -> 2.13.8
Date: Sun, 22 Jan 2023 16:21:01 -1000
Message-Id: <39ef525391d2d39a3431d319a20a5b5fc9a916a3.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176271

From: He Zhe <zhe.he@windriver.com>

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
index 49c584dff4..542f42ae19 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
+SRC_URI[sha256sum] = "f525d3d48ea3a475cb535339c201666d0e4c75ec8c46d29837bcf381ea02cb19"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


