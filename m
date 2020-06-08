Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.25162.1591602509909921267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H3sLD9au;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id d15so83902edm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4eceeEDxnp3yV4FbBp663/MuT179LDgg1WEmMaVh/V8=;
        b=H3sLD9auR+fMS48VdFlxYFWSymD8gRxvfYFRbTNimbJVDNV0J/rpFIORxKYkN3RAvG
         jW4/K67FpdqJvJ4Xb+0ucv7ks2ceVaOEh2uccHowqSgfsiT7IoaoXScJg2kbG+DMwLMS
         NgJZ3fayjPmefhdB7QcMmuD/z+m/5y1wwx4sP2AsPV3XKnGdNlbXNYfTBY30oPX03c5A
         bN2XxxE9xlJJqtiFG9zVo7WyUS97qQ9O9KbC5I6HSU55O9KEta+N4nxMjTPdvMH6SjnC
         uDTYYXH8PcVc9O9Nukwaq5d2M+mFGuekmvbh9uxMEEjRkktxL2Ya+MPsmbWquGE+wmYB
         mDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4eceeEDxnp3yV4FbBp663/MuT179LDgg1WEmMaVh/V8=;
        b=j5hdekt1Fc0ayG7Jhd31i/HMsI+kLF5rAi8GQRsbsh2vzeLAl9FsL+tPMwmg0YNz/G
         StqiBkxrUGt0ONSz4NMunDHUq/SKnhKYlp4MgHkla5PxFKjgMsuusIQtyCPm3Xm+172Q
         OOv0dOXnX/K1UmdVub0QKrgmRKFO51TmWA3FFroZdrcFUOT3QNMLegIeYiM0qL9R7sSd
         s06NpG71U4hhrsd6wQjgR2PPmNZdDlaDZqSOVPxL3jy6tH40RKkMpuGQwJOQfATA3A74
         ZRIIzoFAoftX0wfaxdsN3HiB44qT/KevivsoGPe2tIuRb4+9BLj2aWu09KtRz1jADzoF
         ZUVw==
X-Gm-Message-State: AOAM530OOLK96pug6dke1CTeVnm1eWxU+ZEVyWRoyn2W6XEggc2M+AyA
	N+RGPyoMpPAQNHLwzntoKK/8AD8vSCU=
X-Google-Smtp-Source: ABdhPJxWF61PipOJ63Cjw5D3mrGGwE9tcrt8ZiVwlOt+UgOQckwllXhS1quUb3f+Xozz6pKJKZ7PXQ==
X-Received: by 2002:a50:d55c:: with SMTP id f28mr20261686edj.87.1591602508255;
        Mon, 08 Jun 2020 00:48:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/42] vulkan-demos: upgrade to latest revision
Date: Mon,  8 Jun 2020 09:46:34 +0200
Message-Id: <20200608074659.7051-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-demos_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
index 9d7cb2b1e8..9484f010c0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-demos_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/SaschaWillems/Vulkan.git \
            file://0001-Don-t-build-demos-with-questionably-licensed-data.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "10a1ecaf7bbcbc316c83f7c52742baaba0ae2f45"
+SRCREV = "4818f85916bf88c1ca8c2ed1a46e0e758651489e"
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
 
-- 
2.26.2

