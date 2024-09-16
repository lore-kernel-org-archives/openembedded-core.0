Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A95C3ABC9
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.128381.1726453189345357643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IAFKKsgR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2054feabfc3so32136085ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453189; x=1727057989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDfb1OYuRGjFkeFFAPQJ7Io1SLfs4FOmFS1Do9llQxU=;
        b=IAFKKsgRYKooEL10TntvxMvHbqe9GUudd26cMUvEyiBTiFNwMyTWd85CNvZP8KaMjG
         4+X6N2BEPf3czUAC/A5O6+Oi5THoECj4bp30L4PsqEOMxU04EA6ktHhc2axmGfURte1i
         PUeFLlR0CNTX5Hp2K2h3TrXb9727QZIk8ZHfvbPK1QMjudk4DCIDm/d6KNYe3+TS1gHV
         KYTQUygDn2AZQywSrSMcjjLJYGo0XSTGVBE4OXif1dezFvnqSEJxIVHQeu+KXb5ovEmQ
         pD+v44UEvOpIekhbr1utZ3JFS/OaychoPkFrDFQ16wj9QPcNS1JzWfLZpe1zg3QZ5Giu
         SxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453189; x=1727057989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDfb1OYuRGjFkeFFAPQJ7Io1SLfs4FOmFS1Do9llQxU=;
        b=LE2aW6np6zlBSJYUuOOTVF8VuEbSyieo3dM8U8Pd3o8b+xaM9vSCoPVOtgWMHfYIL1
         KsOMmDxNvclG6JG5WWP7/pzIxx4YikBTlJbVLyXfvh1YIpeTwAcOug6h9Dzm3LWIVgjY
         3cntksMGW3IewBEu3trTT+9BDj/0v3YwDI9BkLVQ3V2zPHU6+A/2hdeYCB/lBimqRH/U
         YJTS9YilHUQXJmXMx/pen3QgUhBlppWN0+O6ijEnMRNMUOGQcYtZqsV8RMBha7Vn81SK
         b3whPYsCYkLJJkMWqClwLiXDC4NOzPwBPZasTiNK0ZlEMKPI8A2tWMd+t2j2s0sQ/t9v
         l0eQ==
X-Gm-Message-State: AOJu0Yxsvt0MNi8S1e6tFQPINR6Zqkp3aYFdij/tRGmYDXV1vkq8Rl67
	TXXV6MZ9Mb3oLDkfi8myYKqfBDObJJE3BRkYeA3wi9/QRRZ6oSDDejjXhbIp0nGJXLXvZ/0egpz
	CREs=
X-Google-Smtp-Source: AGHT+IFvw1KP1R4PphUnhH4FNPeAUPKZJqc9VChF+850j7pQkkhxk4g8km993IAZ8iZzsDsyHCecfw==
X-Received: by 2002:a17:902:fc4e:b0:206:c675:66cc with SMTP id d9443c01a7336-2076e35e004mr181297025ad.17.1726453188591;
        Sun, 15 Sep 2024 19:19:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] expat: 2.6.2 -> 2.6.3
Date: Sun, 15 Sep 2024 19:19:28 -0700
Message-Id: <5cf92f8164d6d03756997e6b9cfb6d37ef5a273a.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204592

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for CVE-2024-45490, CVE-2024-45491 and CVE-2024-45492.

https://blog.hartwork.org/posts/expat-2-6-3-released/

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc96903d915db0dfde382a26bb7ec57d0d37e62e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/{expat_2.6.2.bb => expat_2.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.2.bb => expat_2.6.3.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.2.bb b/meta/recipes-core/expat/expat_2.6.3.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.2.bb
rename to meta/recipes-core/expat/expat_2.6.3.bb
index 6c9db91bef..5ae694a004 100644
--- a/meta/recipes-core/expat/expat_2.6.2.bb
+++ b/meta/recipes-core/expat/expat_2.6.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "9c7c1b5dcbc3c237c500a8fb1493e14d9582146dd9b42aa8d3ffb856a3b927e0"
+SRC_URI[sha256sum] = "b8baef92f328eebcf731f4d18103951c61fa8c8ec21d5ff4202fb6f2198aeb2d"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.34.1


