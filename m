Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC30C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.3453.1637741327249711013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D/6S3ZhF;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1311826wme.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zoUDSRojHUXiPeXcGocN9opYyA/W7AXNAqwZAEYIO3s=;
        b=D/6S3ZhFqSi5tk+OkfQixi9lXynq52eL7cge9lfGFAEx36F8CHvyoMZLgxEH4or2Ou
         OP+DsGDSx0Uu7YH22YtNKl/UUg7KQ3V6IS86FfHvivUQy//YzUlKFqYrbZ2GzaukCgS5
         VO8o57ftjymIHaUnTMURbmoBAfq8sIfM7eyOHU1SCoGOJ+G8TnyBpDJfrM+klsdrZw0/
         qLs0Cx6XQbRZZFrXoeHoH7WrcJXRI9BDDarhZn/shLkiUeyXrHkg7uxPRl1+4TUYqp0j
         kJ6ysjs+VTpDhNbMjLbV1iRcBp6+Y8wP2jkezRUX3+Fj0z6EhuFxrOdPRvnidPnJzquy
         VoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zoUDSRojHUXiPeXcGocN9opYyA/W7AXNAqwZAEYIO3s=;
        b=QYOKL0Opwdi3asf/97g19ItPcnk5lHYBadgiYx4dqwc+F/O2hUagCiaOrya58Pwuof
         R7Up1+flSe8KDPgKDpERMCBHa7g87xVXmV5L5c22yYVcel/7dWzVh027MoB2C3KAMumR
         pHXAsncaKW+lEI7moSUIr/LjRYGd5gE/Zw9svY2Xifjew6ZrXVc/x9LisSaF2TieKntw
         u716X/LV2fzuOp0iEOB6yrgSQuaSudpVx2LUQkSlZn8BOgGjjOEAscVBkEPzfDGKA/I9
         8dEL8mUZmHFd/VfXZvyr3PKL3SgWph6Sz5ZtH9VGQWj4znKFSBIAVxDQ1siKm+NYaDML
         E0kw==
X-Gm-Message-State: AOAM532DFtnj52bBBhDD2wjQYGjSsc5hqetvPzf5YzSjKBz2HdJojPoK
	ZBKqrU/SZQv+PQ6bJqAMyomvVUHSINF+ng==
X-Google-Smtp-Source: 
 ABdhPJyEf0giC1HemKIC3pwemsl+EQlLqFru4UR8vK8GmABPoSFGIBrD7C3vtQKtibmlW1srBO5MnQ==
X-Received: by 2002:a05:600c:4e4a:: with SMTP id
 e10mr12675853wmq.155.1637741325848;
        Wed, 24 Nov 2021 00:08:45 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/21] vulkan: update 1.2.191.0 -> 1.2.198.0
Date: Wed, 24 Nov 2021 09:08:25 +0100
Message-Id: <20211124080828.530981-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158674

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...lkan-headers_1.2.191.0.bb => vulkan-headers_1.2.198.0.bb} | 2 +-
 ...vulkan-loader_1.2.191.0.bb => vulkan-loader_1.2.198.0.bb} | 5 ++---
 .../{vulkan-tools_1.2.191.0.bb => vulkan-tools_1.2.198.0.bb} | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.191.0.bb => vulkan-headers_1.2.198.0.bb} (93%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.191.0.bb => vulkan-loader_1.2.198.0.bb} (94%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.191.0.bb => vulkan-tools_1.2.198.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.198.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.198.0.bb
index 897064d51e..43c0cdb53d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.198.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "4fee3efc189c83ccd26a9cd8265185c98458c94d"
+SRCREV = "8c1c27d5a9b9de8a17f500053bd08c7ca6bba19c"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.0.bb
index c5e77b3a90..a538f6b270 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.198.0.bb
@@ -9,9 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=master;protocol=https \
-           "
-SRCREV = "7d7cdaa17bc8c349102cfee1d5062d6b7185c172"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.198;protocol=https"
+SRCREV = "fe8479aa022a011d74fd862749825e07891e854e"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.198.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.198.0.bb
index 85dd99888d..09f75383c2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.191.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.198.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
-SRCREV = "f4974ccd170cf2338c0582f607af5d8dfc3dac51"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.198;protocol=https"
+SRCREV = "8040a7af8919a47346cfeaf1fbc2ebfe09cfea09"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


