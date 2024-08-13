Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639DBC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 04:50:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.65262.1723524610843817132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 21:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QRBvoy1D;
 spf=pass (domain: konsulko.com, ip: 209.85.214.174, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fec34f94abso42748425ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 21:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723524609; x=1724129409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xWh74RwhVikSzq24wgAq8hmasHTDrhlDEz336ketq4M=;
        b=QRBvoy1D+xhgqNNhuTW9l8KWTW8Af/jEfIJTy+eB0cR7GnQPZLZCpeZXbI/nsyDYTP
         S9K+J28boGMTG4HWvDhWJdJPNwBcRvJXGlk+DFiN9rQ+PeP/4Avk0tmYvRctZQkbD6hg
         ydjEutaYyEBpDwK6FNQ4NeUa9Yr51h4ykLwGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723524609; x=1724129409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWh74RwhVikSzq24wgAq8hmasHTDrhlDEz336ketq4M=;
        b=ZY+a8Xk4nuGERTBBrz8BxLVaFyaB7P03HC4DuZndBs7D67Ry9At0EQlUqrrdAlkzAT
         eXANBv4GtPbnIYYFZ1RtarhUKyZ6FZbkS71DGUNyydNlpImgpnZQf+Bj/qjCHRa6uEQT
         VyIu7lngwyGUiZR7iYw8USs8o+1pKEFyU6qVSqEEGhprnMfDDdMou41jGR+virKwGYjK
         ZcGGUKX14xuastg7eVQzBZYTEI4QG1GykmnuKWSLsgeVzxoGvE0lt93PNk0sNmr0L/kA
         VxEFCi5DEEXgLzbbzbSGhdTNqVprevu1MsyebDZHy7sSFb8QHJGF5dWiF6jaQS5zBEi8
         lSKg==
X-Gm-Message-State: AOJu0Yx3Ztp0NRUuaNfgDrEUFhboWyGW4/3ILm9PCGwzoqxB+ANUIQ39
	BZU2tR3NV0od5YR/k7E1vRpDmZOnc0lKTwyp7lo+5koWEzqHvUt4z0RXbjNH6URTLocd6UChJKK
	C3KM=
X-Google-Smtp-Source: AGHT+IE2K+a1xQy5R8+pMhrR3u/F2wd8LZJk60Cl94TMxePUN7nfwY0FbS9t6qUv/2nWNvRk9vGypA==
X-Received: by 2002:a17:90a:1189:b0:2c4:b0f0:8013 with SMTP id 98e67ed59e1d1-2d3925112b2mr2425466a91.11.1723524609577;
        Mon, 12 Aug 2024 21:50:09 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fd021b91sm6104283a91.56.2024.08.12.21.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 21:50:09 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-wheel: upgrade 0.43.0 -> 0.44.0
Date: Mon, 12 Aug 2024 21:50:06 -0700
Message-ID: <20240813045006.1177438-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 04:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203246

From: Tim Orling <tim.orling@konsulko.com>

https://wheel.readthedocs.io/en/stable/news.html

0.44.0 (2024-08-04)
* Canonicalized requirements in METADATA file (PR by Wim Jeantine-Glenn)
* Deprecated the bdist_wheel module, as the code was migrated to setuptools
  itself

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-wheel_0.43.0.bb => python3-wheel_0.44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.43.0.bb => python3-wheel_0.44.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.43.0.bb b/meta/recipes-devtools/python/python3-wheel_0.44.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.43.0.bb
rename to meta/recipes-devtools/python/python3-wheel_0.44.0.bb
index ba309ae5fca..1e7e0f27c6d 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.43.0.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.44.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "465ef92c69fa5c5da2d1cf8ac40559a8c940886afcef87dcf14b9470862f1d85"
+SRC_URI[sha256sum] = "a29c3f2817e95ab89aa4660681ad547c0e9547f20e75b0562fe7723c9a2a9d49"
 
 inherit python_flit_core pypi
 
-- 
2.46.0


