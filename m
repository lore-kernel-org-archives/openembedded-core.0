Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.18915.1603023041995740966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nJj3p4k8;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id i1so8350087wro.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GXrDN+ozoBJz1/lQLef2Smgxj2xD8+hNBp4Y+Z/nXAs=;
        b=nJj3p4k8lOlSRc5PpTevA9XBhf3Me/LHM0CdQalvSIj2BxqhLXFedZBaTPY7H0kPn6
         P4urM/fe6vVJlwWIzBi10DmgFByJYHOCPcaoqJvf+tAPjgNC/hm354VN2r0ZVRw096rv
         7bBCLPs75KjYXO/YioiS94sP3zPYVV90h+Sij1p8SeNMWMBYkUM0XLvD32k6olItD5k3
         sDkPThSLgaG6YC29oUyYc78TiW+XyJgvRdt0EqNPLbUC/2dZWe1Zk3LW007RkMlTBE0A
         4GR6Nj/yD1w8NmRI7Gpql3/UQOS5lSAa5pKqEGMWkHpDQ0h7y9WYS4lauzRxVqKKOkn7
         I++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GXrDN+ozoBJz1/lQLef2Smgxj2xD8+hNBp4Y+Z/nXAs=;
        b=YJkCNqsX1WSt4uE2xgamQTFGLXy/hLTVB9Ptks+Q4Ad88bmB0gGcGW1LnTgBs0rSlj
         DWoP+8sxZW5uBIIWrmIwiFsYE6JREACCABmdswmywl2YKt0zRomw4N8e7blOiJd9zlKL
         nHpa04lOhCMeIt9Fv9caTTsX0noyXjmWy1M/LWAYZHQ987Tx/78PAQgZ5qwH3qOIyuB5
         fCS1+AKnNkrN0gO2+PUfje0QU/t1nlx3ggsmrPn+gXs4gXFudLr2IZqj1yA/wuZt9ahI
         m4kHLih8iSKHw7+HFFO9N7FlgHhl5zIPRhbkeevUU/Eq1ANus4DOrDyhD1c8PVpIOG54
         TtaQ==
X-Gm-Message-State: AOAM530fS0GJGkHhqX/NoCE+y2+HsxYrB6oy58w9oxgFE2e5q75GRD6N
	6n0R0DIlIefHCfJTayDIdAsLHCbUphpa9w==
X-Google-Smtp-Source: ABdhPJy2brcAnQUgFijCmTAhh+Ym/8OVo6ZZc+yC9+6PAaPSGtqE84+BxhipRhkouM0bL3VJSNSgxA==
X-Received: by 2002:a5d:654d:: with SMTP id z13mr14676995wrv.6.1603023040357;
        Sun, 18 Oct 2020 05:10:40 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:39 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 20/20] orc: Upgrade 0.4.31 -> 0.4.32
Date: Sun, 18 Oct 2020 13:10:02 +0100
Message-Id: <20201018121002.1417335-21-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.31.bb => orc_0.4.32.bb} (86%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.31.bb b/meta/recipes-devtools/orc/orc_0.4.32.bb
similarity index 86%
rename from meta/recipes-devtools/orc/orc_0.4.31.bb
rename to meta/recipes-devtools/orc/orc_0.4.32.bb
index cd4dc31d70..a55b43b8ef 100644
--- a/meta/recipes-devtools/orc/orc_0.4.31.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.32.bb
@@ -4,8 +4,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[md5sum] = "b6b95a47eff713e91873e2c2b1a5b3ad"
-SRC_URI[sha256sum] = "a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075"
+SRC_URI[sha256sum] = "a66e3d8f2b7e65178d786a01ef61f2a0a0b4d0b8370de7ce134ba73da4af18f0"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.28.0

