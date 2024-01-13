Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A74C4706C
	for <webhook@archiver.kernel.org>; Sat, 13 Jan 2024 17:28:52 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.23257.1705166924243954233
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jan 2024 09:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHG+XUq2;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28bae84fc2eso1448299a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 09:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705166923; x=1705771723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6nUNxaLqL32vbthQ4k2peGqO4DEEt+Cf8zxTQHSQDXU=;
        b=HHG+XUq22FYIVxtqueoPjVvmBan0ErK5fJ/+15TUZAR2RLdQUs7TdeAEUBK3ec4sBA
         pPa9KyypCFkLkYRDgbVDcO1YpaEcUBpQsjbWgmVaw3U2Y2iY6QXvY3DQkRmIAER9YkSx
         GsSTAXS8CvzqK0SeqqeIEA5TaVHFKp4kVMfDLKTK+HtuBQ2LySzQvkYIJJgLFEE06eKc
         gH3P47LdqT9bcvPo4b9ym2CMY64OeYsAsZsgFg9CqCyHZBWidkrD110KRZQ+vj52iDsG
         XwF6pxl0SnGKyye0DzC1lD9buQqJ0wzw2b1TLgB0z7ItnE7EdU2txEECjwVe2TgPAUUM
         rb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705166923; x=1705771723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nUNxaLqL32vbthQ4k2peGqO4DEEt+Cf8zxTQHSQDXU=;
        b=C5xwMebLcuv2pw4zKNZwzMzwb00jJp8RvdXPtTVG/Yqe0C9TCxgUcG4AleSBXyWU2L
         nzkkxbP47AQDbXeO+P4Qmz8H7c97jdjGQ6AepvrSvUSrp3VVewfRgpMuacnYS/14PMXk
         mbuMhLWy8dt1x6kNCNwbbKtQNgIOgAoR+xttXkWaIuZO42/zV7QscK/jB8XYITQYzx9P
         aCXcSYeFE6EvEqSE8xo8cjoYMg+UgRetIQ5wgkSTzyjk6VvVXNlZImJ3TWUClG60D4+T
         7fSHrTy3/jAqiLALXMOd4WEfzioOczAw6LqRVF2MgM85XhABAIyAcvMXUTIx5dVbd4nE
         gjBA==
X-Gm-Message-State: AOJu0YzxmY9KVAKY8m17073mVLsuIQ/BCJyq0kR3AQexp+78vjJgLtso
	rtJZVvQmYYp7ch+73kNzjIFZUcJFeHo=
X-Google-Smtp-Source: AGHT+IGFp57EiA6+9SEC1LtrvUL6j3avZmmQl78AAF9lIjAqWfClePmHdHwAEYibKmNyWs0Z7yEShg==
X-Received: by 2002:a17:902:a50b:b0:1d5:bcc2:2bac with SMTP id s11-20020a170902a50b00b001d5bcc22bacmr1538182plq.1.1705166923199;
        Sat, 13 Jan 2024 09:28:43 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8d8c:72a0:d6ed:5942])
        by smtp.gmail.com with ESMTPSA id ix15-20020a170902f80f00b001d5947f5163sm4745586plb.59.2024.01.13.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 09:28:42 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] libdrm: Upgrade to 2.4.120
Date: Sat, 13 Jan 2024 14:28:38 -0300
Message-Id: <20240113172838.2396059-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jan 2024 17:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193602

From: Fabio Estevam <festevam@denx.de>

Upgrade to 2.4.120 which has the following changes:

Eric Engestrom (1):
      radeon: fix missing stencil_tile_mode initialisation in the linear/fallback case

Pierre-Eric Pelloux-Prayer (1):
      amdgpu: fix use-after-free

Simon Ser (2):
      Sync headers with drm-next
      build: bump version to 2.4.120

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../drm/{libdrm_2.4.119.bb => libdrm_2.4.120.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.119.bb => libdrm_2.4.120.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.119.bb b/meta/recipes-graphics/drm/libdrm_2.4.120.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.119.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.120.bb
index e89ba68164..18b3256843 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.119.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.120.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291"
+SRC_URI[sha256sum] = "3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a"
 
 inherit meson pkgconfig manpages
 
-- 
2.37.3


