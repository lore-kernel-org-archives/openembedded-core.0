Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF048C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 03:10:58 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.11034.1706929858183181230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 19:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KiTAgCLz;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5cdbc42f5efso814793a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 19:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706929857; x=1707534657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8/j5+qx5R16xLL2vaRRGbp/2Ki2o9sSVUleLGhUpAU=;
        b=KiTAgCLzQjmgRhvcOhu8uDqoPn3bTZbI1q2B5fLAru3/IE4NFcy5V6HM6Iu2r7g9Bx
         FSmNeojnAOcgwRxPjHrH6Wk7vq52mNKvQOsL7n1V+o3eY1TIn89WZJYaCmhs3a5kdvrU
         u9ZdTiXalTaHgoqUIHDoIGWEAXlNDjEHFQd2AaQrgXLu/nYugCrKi4TUGnR3dg6e89SS
         p2MR4nWdoufYzfbvlnQQXmz3UbTgAK11TYf9zAiuLxuiMhSECqb/uM0XwJ4m9xJ7ukQN
         Gt/1yeBiMOiCJzS2VSea1c6pTzEgeKgrnrSE3m+LaAfOOwEXtf+/6wZh5YtfX8sApyzu
         63Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706929857; x=1707534657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8/j5+qx5R16xLL2vaRRGbp/2Ki2o9sSVUleLGhUpAU=;
        b=jbNFRcuK3s2rSUtHD0979966NOYSj3ipoYW4bCB+5Qr8U/Q7J06x2lsQKITwnCW5BE
         ssfi9U6iuGp8ppeTdqpYOfYDpHzYvGDniBXmyIIIxFUtnLPZLtjIaicaRjxZByYonTeJ
         tPopwIL2XMlJhiEPLbURoBWNxoBQJZ7xDt9FiwQPZo3KRGCRsl7yigcCblxJr+3Mo6jx
         FNE5c5B05fNqo3bSEz8Feink0UVAJmiecXG6bxKITGNuqe9UsUgmX3mRzfBfi14UnK28
         HtmhJVsz/z6vy2rX7NwPvq6hFxFh2H9XLnDjuRTrtBbWGXgikb8H6vzeAZXqr583uyD3
         8xJw==
X-Gm-Message-State: AOJu0YxlcT6+iF/V6Gp16MHT6eBuJlAam9sgtWpeQipYJh0KvezdU/kE
	UwTsXV11ggitvqiohjcRyTLeiyNqlTz6d3eFvDiZAvYHdHfyIE5KivAS68F8
X-Google-Smtp-Source: AGHT+IGvmngR2GewGb72eKcu1/jMAwZM0fZoxEBXhma8x/bICBdu6nPjAGNa+gVBTWu6Sb6LTR2nIw==
X-Received: by 2002:a05:6a21:33aa:b0:19e:35a3:af6b with SMTP id yy42-20020a056a2133aa00b0019e35a3af6bmr10558739pzb.2.1706929857076;
        Fri, 02 Feb 2024 19:10:57 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9183:5d04:c73f:7ab2])
        by smtp.gmail.com with ESMTPSA id fa18-20020a056a002d1200b006dd83a2fc1csm2364742pfb.164.2024.02.02.19.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 19:10:56 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] mesa: Upgrade 23.3.4 -> 23.3.5
Date: Sat,  3 Feb 2024 00:10:52 -0300
Message-Id: <20240203031052.30705-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 03:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194827

From: Fabio Estevam <festevam@denx.de>

Mesa 23.3.5 release notes:

https://lists.freedesktop.org/archives/mesa-announce/2024-February/000748.html

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../mesa/{mesa-gl_23.3.4.bb => mesa-gl_23.3.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.3.4.bb => mesa_23.3.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.3.4.bb => mesa-gl_23.3.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.3.4.bb => mesa_23.3.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_23.3.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.3.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 16843b6036..3a7b91f637 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
 "
 
-SRC_URI[sha256sum] = "df12d765be4650fe532860b18aa18e6da1d0b07d1a21dfdfe04660e6b7bac39a"
+SRC_URI[sha256sum] = "69ccb1278641ff5bad71ca0f866188aeb1a92aadc4dbb9d35f50aebec5b8b50f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.3.4.bb b/meta/recipes-graphics/mesa/mesa_23.3.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_23.3.5.bb
-- 
2.37.3


