Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web12.2410.1613620782161710785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fxkHedsi;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id p6so344524qvm.12
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 19:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8Yx+XDNoVGrLOOAAdp6RekXnPvEPeyhgx7d4u853d0=;
        b=fxkHedsinM8P3ZaSBFc86DYr4nOUNaEKOxGWz77jk6KwV7W/B3UWEodxFLtarIkJgB
         lX3B56lFIc6gOVB1ALP26uFzjNGu5ZYYa78AKK3XQwojjqUiVptejD5zU+qHf/hGMg+6
         ThK32ijcxK/THmF2+jHcGywUbMZD7+nyPGhMKP5e9neiZBgmjCIvGSmb+PyNDBJi7Qn3
         3sTi+5PM6G1fgrs/ZacDJEmlDRRGyhk86QjqPe7YgvHGrRspvDQ4ld+ZAkpONV72qsp0
         Kdc3VMjMkinWawR32Xo4w5Q8TNBSk+v2nGcDBqWtSxgS8ceGvRBdbwpa+Olwg+U2SMRT
         TTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8Yx+XDNoVGrLOOAAdp6RekXnPvEPeyhgx7d4u853d0=;
        b=fUF2bBq6ooIT3SOfRvTAj2KxiGaaBle5PN/uBhxZcBjAnk+ge+7PWwHBhpmKKYqv3/
         rO7+kEHUXuW8sGXPuJzjbpfShLeotzgrVSNCc3dGGtZwl5I2LIa/XEwga9VhzBgmeRo4
         vosFD7uwhuhhN1qhU02Nas6a1DXItqGvzE4yhMRntuBa/A1XEcLsJwaQUmhxpxWrIZkx
         BVYLWKeW8xEzMzcqNhSlzPKo5p7n/t1FLYjtECYG3fRs+duAKsgfwrHbk0CfveqSURBR
         cT0SWoEgjqI7zytybbCqJ/HTJmtEwPghLkzUEMImeXVlyiCv4HJ2NuPI8b1DAK7DO4iH
         ZWFg==
X-Gm-Message-State: AOAM531WFJCkyOXUpE7EhhCBbvyZICWNc9cf7E+QLC5IUsAVhCLD456t
	bjR9TFkevakBbbonW0HB+9Q=
X-Google-Smtp-Source: ABdhPJwR1Cr3EfskIEFF2F6yVIvcLgts/iuuC2CrHdB0ZuO8dWftbY0+NwoS4j/7WXxi+S1nTAeKWw==
X-Received: by 2002:a0c:f589:: with SMTP id k9mr2474189qvm.0.1613620781384;
        Wed, 17 Feb 2021 19:59:41 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id g9sm945184qth.53.2021.02.17.19.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:59:41 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto-rt/5.10: update to -rt25
Date: Wed, 17 Feb 2021 22:59:33 -0500
Message-Id: <75ff93e9181be13f4ef40e2197d0e88f39eba4b9.1613620662.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1613620662.git.bruce.ashfield@gmail.com>
References: <cover.1613620662.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto-rt/5.10:

    631d91f7275e v5.10.12-rt25
    d810e40efb07 v5.10.8-rt24
    6cc43a603fc0 tracing: Update "Merge irqflags + preemt counter, add RT bits"
    832154acfabe v5.10.8-rt23
    bc910fd5c9b3 v5.10.4-rt22
    6f35bf425de2 tracing: Merge irqflags + preemt counter, add RT bits (update)
    bc15d321859f powerpc/pseries/iommu: Use the local lock properly.
    4a341a1cd188 powerpc: Avoid recursive header includes
    b0764f800b54 v5.10.4-rt21
    c0c5ed1cb29f v5.10.1-rt20
    f26ecd8047bf printk: Update John Ogness' printk series
    c4c153ce68dd tracing: Merge irqflags + preemt counter, add RT bits (update)
    7d90c658b18c z3fold: remove preempt disabled sections for RT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1f1745c636..3e469bb02a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1033d642fd93675a91beae3c594d1e1078191ece"
+SRCREV_machine ?= "631d91f7275e350638157d52232fb34bd212a8f4"
 SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1

