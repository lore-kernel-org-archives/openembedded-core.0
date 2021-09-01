Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.8133.1630503940157730624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J4GJbB2O;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id x10-20020a056830408a00b004f26cead745so3473745ott.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+FwnbsCWH/Tf5AiQ0apo8thBeSaxkKFBBVhn0ybJaEY=;
        b=J4GJbB2OmSlXprHoCa6Bl7fWtHS2KaxMTT2EdtWgqlfe5VVctGnKqHIorgkNvYgGEZ
         pbp/feuncvFOrR32Ryws+725a+Mz5WntJHGatDnVFNrILxSvEhubHvXfUjYRkUT5JTum
         U2VfMzSfjmgmOY1FXsfAQM0miSkTpE+sRb3V+2TYNHD8/2tHiP8UktjHOJnRLP3KaMAB
         1Tw8d1klx0O0yhmTlpO2DFcDIBC2H9rcoG+0nHw/T84bCTKLQq6ScpUWX5j9RdikpItI
         /i0GFaOkI9EF8x4xE4cCqEyFL5WnIPgxej21AKwSq7AdXLOEbHdcl3WdtKSQR29r+btw
         nF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+FwnbsCWH/Tf5AiQ0apo8thBeSaxkKFBBVhn0ybJaEY=;
        b=FK8kiJvFI06TJ3sGkGowV6zgmcOTR+bdizE4N7cP91CXRymyOfC2jEtrdrZlQGHt/5
         LHZzaL+0yt0VL/JcWQNRaP29ishlHhxOp6t4cvhffWmDYLdYW/sSi/217jeWrVwMIZ/l
         78HEicK1jeyhsF8tvTR6vTTyTlxU369xIYFBLgeSnQYKhwHtm+CFfqkp1VkT9fNhMOxI
         ZZrE0v/vyT2jiCC3At0pE/PT0zVzGtQHS5NctKr6lCst24GXMuvKSr25CxoZqO5KJjgJ
         q/Rols7l4TcRrzebGyVvV3V4Kqrub/ryBJVTRncMqO8+SGME/j5A51rzQNGa43epMx1B
         +H7w==
X-Gm-Message-State: AOAM5327MeEv5AZTFovsPnskfidPOz5yVDvbxP0uyrwkVIeQW0dpBp1M
	us/xZ1c02nL1uYN3OE7qqo8dod5Xr0E=
X-Google-Smtp-Source: ABdhPJyQlgPpdd4LBpyvcj6Tc6VSQlmL7XvDCnyDFmxcydyH5TxJ3Nqhi9yQabEvc09a22NtQHK4CQ==
X-Received: by 2002:a9d:ecc:: with SMTP id 70mr29305523otj.96.1630503939277;
        Wed, 01 Sep 2021 06:45:39 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:38 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 21/31] e2fsprogs: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:00 -0500
Message-Id: <20210901134510.29561-22-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index c80b93c802..bcffa77db9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The Ext2 Filesystem Utilities (e2fsprogs) contain all of the stan
 fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
-LICENSE = "GPLv2 & LGPLv2 & BSD & MIT"
+LICENSE = "GPLv2 & LGPLv2 & BSD-3-Clause & MIT"
 LICENSE:e2fsprogs-dumpe2fs = "GPLv2"
 LICENSE:e2fsprogs-e2fsck = "GPLv2"
 LICENSE:e2fsprogs-mke2fs = "GPLv2"
-- 
2.32.0

