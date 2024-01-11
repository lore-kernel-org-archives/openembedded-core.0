Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9990AC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 19:27:16 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.1601.1705001231733001140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 11:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/Jjtgtl;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: festevam@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36095e0601bso1270385ab.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 11:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705001230; x=1705606030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kPjxyiIZDF5tPtDUcgXpqhh7PQSP/2Crg6Rqa2ik3k=;
        b=Q/Jjtgtl+JrQlx/R+rm4dfL+TMWiDALOu6D2B4pZZFM404kaA7Sk/tqaOgxOiJWHP/
         +YIzlsjPyOriRD0mL6YKy2FiH2ZnXUf+7w82IxSKO85V3dvxw9UZXZ8XUJzGR3WUCXJl
         7gu1Js7KdzRfc46SCdRJF8zRqMZ7Btwglpqr2aqG0Muc5ZbXe7qVxHfaPul9Yf3sV/x1
         NUK7XNDWYUoc35rLd7qxWG+1bnAxxD2tVPoI5u4neDcuYS1RIk7XCXem1glQWyjHkvkr
         38cA5UdhhLUGPv5nhqw8K2x4b4gKg0ROCqNwAXdzlTxiWDRb2/4TdTh0EKUR8i1QGqtY
         5Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705001230; x=1705606030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kPjxyiIZDF5tPtDUcgXpqhh7PQSP/2Crg6Rqa2ik3k=;
        b=l8KEb9E9/2dQ4x4gyZ4tvw2eaqdBzkOpFgA2NFS0dWRXtHT4SUhc2r78wAytNWcmJL
         J2UaSexTI3loXbQbWWJJJ+kqbSNDwyjfJcO3UHJgWcRlB6nxMo0teOqwjN9OiULVLMoE
         fgD2tmjOpRB+vUPydcfsNDBzAP+n8H6Br5sHD8+slIQF9785va+urMD5QPPV9mRrx4WG
         xa92mMxxMC9KWXKpZfVGAWSLKIxg1UswF2TsvBHZ0xAayvow2ZARu83nzLgIi0k28mUO
         hHZHdohAqOzk1Y+AT76xKz9whOiUVOB2m+qvwXz+zdYpZj5EVhGP5sVaW1Q8Dwt/Pmyw
         5sLw==
X-Gm-Message-State: AOJu0YyG7O6O4QsXhnJ9GJ6SgqYEa1WxdJyaLmQJZtwZgNN/oJace8iD
	mDbqzphayavp0VPUexrv0Vkc6rUV3h8=
X-Google-Smtp-Source: AGHT+IEDiLlb0VBJFyRqJTLx7mMxhsnGpGbj9yBbWG9K+Ng/dXu1KbsFrvGlrzb8Oj1lnJZAmnX8ug==
X-Received: by 2002:a05:6e02:1b87:b0:360:702a:3f89 with SMTP id h7-20020a056e021b8700b00360702a3f89mr433121ili.0.1705001230485;
        Thu, 11 Jan 2024 11:27:10 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8777:88e4:f2ed:1408])
        by smtp.gmail.com with ESMTPSA id b29-20020a63715d000000b005bd2b3a03eesm1576816pgn.6.2024.01.11.11.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 11:27:09 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] mesa: Upgrade 23.3.2 -> 23.3.3
Date: Thu, 11 Jan 2024 16:27:04 -0300
Message-Id: <20240111192704.182107-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 19:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193562

From: Fabio Estevam <festevam@denx.de>

Mesa 23.3.3 release notes:

https://lists.freedesktop.org/archives/mesa-announce/2024-January/000742.html

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../mesa/{mesa-gl_23.3.2.bb => mesa-gl_23.3.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.3.2.bb => mesa_23.3.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.3.2.bb => mesa-gl_23.3.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.3.2.bb => mesa_23.3.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.3.2.bb b/meta/recipes-graphics/mesa/mesa-gl_23.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.3.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.3.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ddbebccd9b..e063eb3507 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
 "
 
-SRC_URI[sha256sum] = "3cfcb81fa16f89c56abe3855d2637d396ee4e03849b659000a6b8e5f57e69adc"
+SRC_URI[sha256sum] = "518307c0057fa3cee8b58df78be431d4df5aafa7edc60d09278b2d7a0a80f3b4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.3.2.bb b/meta/recipes-graphics/mesa/mesa_23.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.3.2.bb
rename to meta/recipes-graphics/mesa/mesa_23.3.3.bb
-- 
2.37.3


