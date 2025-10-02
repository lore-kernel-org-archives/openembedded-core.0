Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C24CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:12:38 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.11786.1759417955862462805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bN7yFdfJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781206cce18so1038359b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759417955; x=1760022755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXupBgtFj1VGB0dxyc10WZrvuUd920WAnORj7O8iWHE=;
        b=bN7yFdfJEMnGe4kXKl1HaJjAvyh6znzrIAs+iDKPzqgAmxFevMLRNfiHUvxprlyww1
         qu+H0UPrgKRiPr8RgtuiJ4ypnEFKdvYqWskJi8K/lHDvk01VKMUIYPUNeATLyuXqu/rl
         DNjQarBNUTIN1z/P9ThDOsZ/Feadg4rWJz/rmz0KEALq/aDNcpKI/BFXa/lYw7dYOlDm
         j6jKlxbmI4/kGgd8zro+xBcMvdNWwbi1B6D/U6UPA46sgU9+I2nELr8GmOl0S50yGHjV
         tD2TuEy1eAbe0LpRF07hSM52meXAfwK/YQmSNNWaQszOO0n9NkVWxOouaJWXLLqRxhBh
         OfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417955; x=1760022755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXupBgtFj1VGB0dxyc10WZrvuUd920WAnORj7O8iWHE=;
        b=Yojy6s2b1o7QrJ8PIeuD/U9fu4iEwaJQWLy/gucGX3NwKzfWTDgxa78XF3UGqXzteZ
         iQD9B7t0iKS3rPcwzMOrp6q2te68lh3pSHmU/fsXBHAjKpPiXRqgEu9tUnvp/DNrpWjX
         7AL0QvbiE6hc0nr3XH+o/xiXBO/G42SK0xUlNNgeJwfdn16hTjBTbC0DnH2hqH1HgnpP
         Dw2+qiqalcXH9WpeshD9mab3CjykH/IsxFeqpddbaAAns4wtSeKLZSR6vBK+7+bg1GjY
         RsMKZJ+/TK+8f4Batn8VVn8r56/yRcB1qiCzCljs/WhPIWyJbPLt8OTpx6HMErnj0KeG
         CBIw==
X-Gm-Message-State: AOJu0YzP+ekkJRjzszZDS6fQem0JKmiFz9H6WVu7qAFVLyWSW34NMxco
	Rb8tBFJdxvSewkh4iEIbZzWKvGgNS2NFVZEWHtldeVG9PdsGtgP3NdJcIXcXuv/T
X-Gm-Gg: ASbGncsSNZE/dkArPBYE2QfAhTxVj2ZwX4v+m7mdLak6wLkNxlxXCLwgP80EAWc0hIT
	tUvjhzDYPCzgeXp00z9EDpWkA7FtteRJNGK54GWDw3tVL4Mns2m5/+jHioDOqocdi3O6sAwUJMj
	hjJHgsYs/6xcfFDJipBP10CfmgGGjg7b4zNtRgxe1tQA7coJTY7DA+/xKz1txsEVW6qGiBW0L07
	mJyTcEWoDksTfxzftv1+cSbFPjGSFkR5mTZZZxjt+UDD/49EcsVhgJPuh6rTbd5ROX/WqZI6ORl
	0qmrBJgasIdtV9QGqVzxGkBAzkVgw7Xb0Bj4VW74gJtA6//M3Gh36WOOWpAepkZsCLzkOzUo7vc
	+M/c31hdxaLLNoSe4IlNxBNDps4eUnTLDworCscCyGD2boimxaBV6744D4vpkPA3cKhyn
X-Google-Smtp-Source: AGHT+IHWLrwlVLHPUHttcld8WiuTSQkZ1WNSUEbWSAmn9kyYf505ffJeegMeETboU8EGVKUqd301Ag==
X-Received: by 2002:a05:6a00:116:b0:77d:98ee:e1c5 with SMTP id d2e1a72fcca58-78b024eac5dmr3067558b3a.15.1759417954804;
        Thu, 02 Oct 2025 08:12:34 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053a3asm2438614b3a.48.2025.10.02.08.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 08:12:34 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: update 25.2.3 -> 25.2.4
Date: Thu,  2 Oct 2025 17:12:26 +0200
Message-ID: <20251002151226.1985845-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 15:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224365

Announcement:
https://lists.freedesktop.org/archives/mesa-dev/2025-October/226554.html

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c3751f3414..7046deeb2b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065eadb41e17f92b4f8"
-PV = "25.2.3"
+SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
+PV = "25.2.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.51.0


