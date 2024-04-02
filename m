Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C184CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 12:02:40 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10318.1712059355473439389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 05:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nfGVtrwj;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ea729f2e38so970010b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712059354; x=1712664154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=13j6baqcxgrhPvaFdWSwSQUQMiHD/DaavxJPRIosncQ=;
        b=nfGVtrwjiduvpU77pRbjdBF5xgyb1XSkrMp85o7x0t7Jw75K+J+UmIKoYCr/9QeeZC
         Icv28uwrjEa6BUp1doFAEZIXy6Lb8tnJkJ9ZKiT8KiBa1O5guTB046gH5C5Z+oWEwCnP
         4xkwfHWnLK9UVSjmriBM1r/+BqdwF2lUbuVhhv/vAQylIB27huW5k92duiUKm3wjdGSo
         nf7aIMhAb2rIqWe+VKQCQG7nMG9B5HgV+qHvvvsRJMQLR7Bf1F5Q72fAOoxH4DGPH4Gi
         29b+6coXSqnj6yfYmT8+Shmz0dvLRq2TVk/aGUcOd25GtBz+z3CcOplAlFoNmJERWC32
         t+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059354; x=1712664154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13j6baqcxgrhPvaFdWSwSQUQMiHD/DaavxJPRIosncQ=;
        b=dYciTg3oFjweZRMgBDtA6V+vi0/WaviibfnjyV814Ooq5K2G80FCE7krFdyq2Q4Fgo
         KCV/V2eVr0kvgk6itClPw+Y2ARVv6r6X+9PoEDCjCeigSjDm19EXoFfUXH90eF0cJs2w
         aZ5sHgDMSsxOs97KAmsx0Lor1pokD8G/YqREkcfxl3i5ENKtU5PmtRVIHDA6ksaPeME8
         uCM6XyQ8X2PWTwVMGHNDPmdC+vWadAXY3xZtpF4qfC1hyOhkFSvJOg89+SRBcSBvaB+a
         MIm+S4eDcYzZv2stCz9M/WBLeMvBdjvLyHzhnCbkWCVfcMjeGmS/QSqnngBPH5Ok5IcC
         9MYA==
X-Gm-Message-State: AOJu0Ywv7nA8wCIFLhGTi0oWOTdHSfk7ILB7aws8E8y6udh/Tore8sol
	QnVCqCvLkhy1wqcvqnehdvTPYHXuXBC1CrLmUTRR0rFvXodEI/6fLu8OtJ/x
X-Google-Smtp-Source: AGHT+IFmCtJVgJP45QRAQdMjNKOaLAADrkBgQf9ZOhrGuYYhqORvw93CtOr1A994OXVHQkTEof4ZFg==
X-Received: by 2002:a05:6a20:841c:b0:1a3:a76b:335e with SMTP id c28-20020a056a20841c00b001a3a76b335emr15684452pzd.5.1712059354383;
        Tue, 02 Apr 2024 05:02:34 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:7fdc:71fa:30d0:4855])
        by smtp.gmail.com with ESMTPSA id r28-20020a63515c000000b005b458aa0541sm9281813pgl.15.2024.04.02.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:02:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Upgrade to 2024.04
Date: Tue,  2 Apr 2024 09:02:23 -0300
Message-Id: <20240402120223.152044-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 12:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197870

From: Fabio Estevam <festevam@denx.de>

Upgrade to U-Boot 2024.04.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2024.01.bb => u-boot-tools_2024.04.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2024.01.bb => u-boot_2024.04.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0af2..f88ee44c1ad4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
+SRCREV = "25049ad560826f7dc1c4740883b0016014a59789"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2024.04.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.04.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2024.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2024.04.bb
-- 
2.34.1


