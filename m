Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.2370.1613620786466539151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WwCdHvil;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id t63so981311qkc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 19:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d+bZzFnfyehq232ITYkJq674PE8bvPpJWvKMKNj6Svk=;
        b=WwCdHvilK81GXX02LlmNWLBmz+56XSntufNPTQSnH89soC1XL6FNnRjKJ5Z6Ps+IS3
         VreW8Qcx/6Mq8eTBqYiHkMY1atHZ+UEAsAjS457LJuWTPJrbADp/BbyL5WjRhOjx80gI
         CTnIuOZRHS6LTwW7YQs27/PER/xgEGr0QfTXfVtUTRPLXxR1qMHVefZlGw3UJURD6NkQ
         nrQ2IQPKt+7cpRWFGjS2Bi7107hPoIXyP/QiEXkFRXX8oibDWhu3sh596B++ZNKnV2OE
         9bWsbJVNjpDNfsLOyLQgN2ZvPoHRCv/SAVWqf0xCecyG15EjpmUPtzMv+sriCtYRvYxH
         R6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d+bZzFnfyehq232ITYkJq674PE8bvPpJWvKMKNj6Svk=;
        b=IoT7/wpqRw6aKmH7EPpa+WqI2ZKxYLGr4+3PNuJCnVL8jgwCI3hkUKyrJz+nxXnz+R
         oKbCDWP8myGyG/I4SGJ+TCWIf7wooINRNN9owE/9g4ZacCR++JXhyMEfNV3UVoV0vaxv
         4URq1z69mZ4DxXrn0O7uqTJjvR+rS8Re/RJIPk4+R05fKkbC5uTctuKNBj9k37XLV1Wp
         tZl+6tXK6pQuXeCsZnhEsBHjuArQ8d8a/mwu9MyymRC5SuAZUH56Zt/DCFjuZoAUKS7R
         BIW7xx9M1XMnWFd1VNk08mOwfDwyrbNy4bKDTpCHrYDnNYtyhqHYTFN4YQJ9q9sbE6ah
         vTUw==
X-Gm-Message-State: AOAM533n3DkFCF5dYJRYp9DrQcM/IgOpFHbpJ6zQk18WTsAKjlXTu3dZ
	kTGb9ScIqRVk6gDayb6yp1jaz34eRSLdQ4Bg
X-Google-Smtp-Source: ABdhPJzvsYSebEMU4HHZXuDcUD4fL9UWgxkbOZTRFC+NLixyHGfPWWz3q1Zv2yhtFjF4Jm7NMFOd+Q==
X-Received: by 2002:a05:620a:1523:: with SMTP id n3mr2592678qkk.85.1613620785644;
        Wed, 17 Feb 2021 19:59:45 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id g9sm945184qth.53.2021.02.17.19.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:59:45 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto-dev: bump version to v5.11+
Date: Wed, 17 Feb 2021 22:59:38 -0500
Message-Id: <a00dbc96e283b55312d386549477031980f07524.1613620662.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1613620662.git.bruce.ashfield@gmail.com>
References: <cover.1613620662.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We'll have the full v5.11 upstream kernel in linux-yocto-dev at
the time of release, so lets drop the -rc from the PV.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 95ac6e0a4c..2ccc0ee875 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.11-rc+"
+LINUX_VERSION ?= "5.11+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

