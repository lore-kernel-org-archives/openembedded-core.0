Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.2373.1609185891648360334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KEjtfsoU;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id d17so15552149ejy.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/IEVFyjXMZB8rPOnMxFk/gs9R68iOOEiMWlzvTicjfc=;
        b=KEjtfsoUmHpsyJaCjkGhRaeqgqnZlWMsynKnOslSdsIfLqU3BDYuuu2kbPDopbhHmF
         Uf/pA+al2qSMrBymWwqIn1/7bqbtJ5kPkf+YZdoK7K+2+JcGZb12UKLXooKdB2c5HZjN
         0lnv9AymzACekGPoOceDtzY5V55Z+gnWapcTScigRIYMNI91fAmqxB0PaC/SVE486i/W
         5LPxN1OYiHtE9tx+4m2DV7aZ/dXEs8+k0AG8zA4grll+Ni5lQSpxI4BrQMV/426BioDa
         eEXHVhAiZ0XVIYqTDIIGH7pG5NI2PZMMGQbTgU+OZL557LRWHZYPEbPrDjZdLMjJZbeq
         n89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/IEVFyjXMZB8rPOnMxFk/gs9R68iOOEiMWlzvTicjfc=;
        b=X1uJY6YpVKEQIuiaiTBZDqFKO7N5huolowKmY5N2GW4PhKzrv50TiEBkk+iccNvMCm
         IiWMU58L1DmmBkE3ir6Of0X581i9H1rC0vdiQWfslf7z6gHjDR2RlgWHtuTX/lDLfcDc
         R0m40YOOnhPER4G3MbQttJLsts9GPrryKy4XME1EAmzbkJpSeuktQYrmLpEaLlzmJdPI
         WsFJwKibk4zzSDrE0mqfoYC8o4+ythCdl77Z1ENTdxXLnvhzGcdVV+Eh83sGpIW/VxpM
         5g9sHT94s/YOXSez1WvbwyD9UXUrClcZd8DWwmgZagEi/uwMFEmwGiDyJnv3T0GHA+Jp
         WXJw==
X-Gm-Message-State: AOAM532K1yEys5/FZQGx3kc3nqcYwzkNrUGcw2zxSu8DG+BXZujY5Tfj
	SD1IkSrBYwiDJKj8dB/BRhF8Zkdu4/w=
X-Google-Smtp-Source: ABdhPJyLHAf8kfzng8/V03O6S0LlwsPhBGHxxUXk4iU3PS5V7mifOzZpoM6I2rp46YBpAXjL1x1bNg==
X-Received: by 2002:a17:906:edc2:: with SMTP id sb2mr31850661ejb.159.1609185890314;
        Mon, 28 Dec 2020 12:04:50 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/22] vulkan-samples: update to latest revision
Date: Mon, 28 Dec 2020 21:04:24 +0100
Message-Id: <20201228200436.78130-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 3785723232..896b248327 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "b4fe3addff337f3c264a6f7dd62be60c726fcc03"
+SRCREV = "fdc8fab1a520df5566de3eda7b526b24f04e6379"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.29.2

