Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAC4C433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.3547.1652871567270114968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mHWNdvCk;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id h11so1323829eda.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuqPP5ARS3xNwOBPpThjT1kgmpPWfbhnBR0HzOzQvD8=;
        b=mHWNdvCklB+IQPcA341YeWhdNKzuqBiS/UrKwBcrkXum4FbHZDPh/Z+Lxnh72mFMSs
         q1FMGDVMpP2QQhPsCEC3XTBBx9fXSd6PvCXJ9O4PQnu4emaDZ7j6meA4kcotOgYlh0F8
         HqDnz2BKUARh2SxMwjMo5yW8fMzvhQZ6+0Zb9AX0y6vqtmMxleCo3b3kVi9VS2EgMlRd
         OGDMXxShwEdcJxznFpB3wqLVDHGMuXU/23C8DwAsUVYyHmu+lE3ovuPuR/LcKJyEOSXn
         v119I2QMn/QhimqCntwKc97JEj/xakgX3cOiDZgC6Qw95+V7PPayNBKyRbrvtnZ+q1TN
         9mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuqPP5ARS3xNwOBPpThjT1kgmpPWfbhnBR0HzOzQvD8=;
        b=u5GD6W3uXvz1kYG/kq3p1Vfv7gfuwnzD47RciNUm1L//VM5mTSyZIRkxDJO2JWfLdB
         HEZ3fPvsWaSKBkyyEAn7h+Y1+w92ecicUxdwWZWkdL0Ud9A84eH+i9ffUeMukaqGaCB6
         rIac2F61Ay/GBJSk/nWXE7GY4cdQ70VNWaWUjY+Qxr0Ofbr973op/b1dTGEPWFQiFmdF
         vT368ahfXntQerffag4Xivh5vxhuupbU5Oj5Taq+vcXVA9wOYwS4lxo7Wpqxd0t/avGX
         SgmtNV4sdlvqmHb4PA8AE0cWiIx3COf9xUeIBPVNlyglBRZ/ahu2hYykovtFh0RAjITQ
         bX0g==
X-Gm-Message-State: AOAM533uo/m+VKcYxwxkVH6HjU7aJ182xuZleiVSlANOTDbCsAedL4jc
	OwP06FCRJDyh40VYzSpCpNLGLxvE7iI=
X-Google-Smtp-Source: 
 ABdhPJxxvDBVqakR8jLWp63yqY+DTU5oFo/L0kReIjVsNbpX4OdJojfJ1VqLIXAa3EOA5eitRNUpsg==
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id
 v8-20020a056402348800b00427b4ec991bmr23665865edc.319.1652871565890;
        Wed, 18 May 2022 03:59:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/49] python3-cryptography-vectors: upgrade 37.0.1 -> 37.0.2
Date: Wed, 18 May 2022 12:58:32 +0200
Message-Id: <20220518105843.3299331-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165835

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...vectors_37.0.1.bb => python3-cryptography-vectors_37.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_37.0.1.bb => python3-cryptography-vectors_37.0.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
index 98740ba95f..3dbdc8ce3e 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "66c9a714232be730fe822bd7e4e9da6231ff9e537ee4feb0f092c06b8ea4d94a"
+SRC_URI[sha256sum] = "7c65d3de51756f418142df605417ec2c6e961c364f70cc8a103030889d5a3219"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.30.2


