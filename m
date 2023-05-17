Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE08C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 20:43:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.62474.1684356211848279242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 13:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Zd0HOG6m;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f427118644so12492665e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684356210; x=1686948210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vB5OHyfR8AE7As73shoHIKK5a0QdWTNWr7x8qhC0tug=;
        b=Zd0HOG6moKiKEUs5+DKhg1UMYKKorVD3OWRlrO/cJ2BDuw5pOZasyyWIjyTQpVE/fi
         Up+0g3xJjkMAhNMP+LrvRqADoipT+9a4DubuAKfmUBD8pjEczX4o3k70aWvTPyg3pNGO
         R+SogSi3xwVFdbKH5hPOxTPG9s1FQ0z7/yFOW35pfwuQWQkOLLS/kxMsXSfACX08Bqex
         WWwEF41QLTNF16DQ6mNqIF/PxM+8IrZZsB+po9oEvQ2paVu/UL3trX1C/j3Ixfr3hY73
         w72CyCM4XWh7raPMohcEEw5c8hg+eAh2MjW6/IL6zYENHUQ59TkigUY1ll8u0eCFv73n
         hnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684356210; x=1686948210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vB5OHyfR8AE7As73shoHIKK5a0QdWTNWr7x8qhC0tug=;
        b=czCrX8NQIEhZEhWYPxhlspZiKHZXaHu1InKADfD3zWg/93phuLZc3HCH9EhHMgcxpI
         CZRwVf2FQ1DIuSWtV08IPssNeWKGfKzcJ9s8g6qQrqdDV9LCEaJUm9ILCJNrpphlM9be
         SqC5hTN5dC9OOE85b/WilC/5SiFxVduI4rRT7LVvhxuwufAPZlS6w1QzQ0KEbqcdPi4x
         ljbme/9r3/jveABnuKeI31hjluSiNnKVowBimsqsesmxcK5Rko9XQM6jO00hggC6j5VW
         VksCDUaccVx7LbDbn4xapqOV0FBvHewi3MvzXV1e13GYAmT1ENBCakVLN3roK7LgiJmt
         PmFQ==
X-Gm-Message-State: AC+VfDypfCjPOgbtyfAucMryONBm3ncOyuxkNygVaQ4KmiMZq74SDq1n
	tQnkE6vELC+99ENqHQJugZ4xi6E8H1U=
X-Google-Smtp-Source: ACHHUZ66RnRp4UcESIuH5blIvt1/liDySkLFHaxghTduK66Ubn5V9U1qDLiPqg+Pgk6v2e1kVyJ52Q==
X-Received: by 2002:a05:600c:3797:b0:3f4:20ec:7601 with SMTP id o23-20020a05600c379700b003f420ec7601mr32010498wmr.34.1684356209793;
        Wed, 17 May 2023 13:43:29 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id q20-20020a1cf314000000b003f508777e33sm3241579wmq.3.2023.05.17.13.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 13:43:29 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libxi: upgrade to v1.8.1
Date: Wed, 17 May 2023 21:43:25 +0100
Message-Id: <20230517204325.13276-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 20:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181502

Changes:
Use xz: upstream has not released bz2.
Update sha256sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../xorg-lib/{libxi_1.8.bb => libxi_1.8.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.bb => libxi_1.8.1.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb b/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxi_1.8.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
index a6cf9b3002..00bd46ef13 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb
@@ -16,8 +16,8 @@ DEPENDS += "libxext xorgproto libxfixes"
 PE = "1"
 
 XORG_PN = "libXi"
-XORG_EXT = "tar.bz2"
+XORG_EXT = "tar.xz"
 
-SRC_URI[sha256sum] = "2ed181446a61c7337576467870bc5336fc9e222a281122d96c4d39a3298bba00"
+SRC_URI[sha256sum] = "89bfc0e814f288f784202e6e5f9b362b788ccecdeb078670145eacd8749656a7"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


