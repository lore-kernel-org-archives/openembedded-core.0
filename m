Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C72C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.51505.1658306711811506021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VlyRT54t;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id y8so22875897eda.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0uF1W2TqRqfAzQwFUq2/banlr/R54wkqXK3j8eGkr2k=;
        b=VlyRT54tOABQrIf4Xmo/0PX0fHjwjANG8gYW23hBUQNI4UmPhka24vgGy99M9eJejk
         w9P+T+EJ8NxIvN7t6bFhGY/ptlaJ99Htr9Q5GITcnM6zkunFj3kXgH+scxeWEWYOA9aN
         HtVVijKQiosiNTb+PnJLyCtirSUm8crmOZMobp0Pi9mQOloBuk6YETvwyBDYL3KbA9FR
         WpYaEoybcFBew4aSkWMXGYS1asEwP7GSJ5Fgjfzw1EtT8z5rPZoHgvv0t8vqx4XiI1O3
         9XhhmSNIqeDTvkAQoS/4OtenYXEqShgGrDkPXGJyd1oirFn7gKwvrI8ac1fxD8OQ2Pm4
         ZCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0uF1W2TqRqfAzQwFUq2/banlr/R54wkqXK3j8eGkr2k=;
        b=0cspQ3L9HH4Q+x7P6Mae371TZIsFs2G8Hp2iYVs6iyoZBzG+Y13g9Hk7KxOYcfW0vu
         mvnRdiaVYEzUI99Nc2DaInDw2Q4IHvxfBn13KGVjwnpkcy5Lm+6PLSelNDWN+nRSpGwX
         bsLym3DajinmGpITAnHLK/l8R1+vLRg69rmXS0UucazsZr1DXBqx8vD81w99CKNe4ncx
         ZZ7IK7fnTNGGxKgZFkZ2t4QEQssMp/WrDeCy/TFzZJlB9fJrd9bUMYHHjWPU8NLRu28z
         HxxKCWnbTxkIhi2GqDj2E4W0AA8DVBJVlONk5XqjD6ED/mZkDN5HQaXfjrcZJvAxP++M
         GYOg==
X-Gm-Message-State: AJIora+AixWOkZRi5MEA/8Be0OMiH5Di7reQ3AAlbQXTZlwcxx5VP6sS
	9Jvogue9PWzCCLQB/ubBovmKrUuIdY0=
X-Google-Smtp-Source: 
 AGRyM1vmHZuRmlRGMY5oaOWPjg0Q+NHYJUJ8pPKZBrHscuiYI3mniEbWwya43iYfRDJvGqYLg9YG+g==
X-Received: by 2002:a05:6402:2741:b0:434:fe8a:1f96 with SMTP id
 z1-20020a056402274100b00434fe8a1f96mr49948917edd.331.1658306710378;
        Wed, 20 Jul 2022 01:45:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/51] vulkan-samples: update to latest revision
Date: Wed, 20 Jul 2022 10:44:12 +0200
Message-Id: <20220720084442.2940187-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168315

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pp_vulkan_resource.h-add-header-incl.patch | 27 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch
new file mode 100644
index 0000000000..c2bb43fe76
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch
@@ -0,0 +1,27 @@
+From 8c069a1c4452f626e5bafc547463507d86111319 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 19 Jul 2022 16:55:40 +0200
+Subject: [PATCH] framework/core/hpp_vulkan_resource.h: add header include that
+ defines std::exchange
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/501]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ framework/core/hpp_vulkan_resource.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/framework/core/hpp_vulkan_resource.h b/framework/core/hpp_vulkan_resource.h
+index 0e30f5a..8d83019 100644
+--- a/framework/core/hpp_vulkan_resource.h
++++ b/framework/core/hpp_vulkan_resource.h
+@@ -18,6 +18,7 @@
+ #pragma once
+ 
+ #include <vulkan/vulkan.hpp>
++#include <utility>
+ 
+ namespace vkb
+ {
+-- 
+2.30.2
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 57d3bd8fe5..41cb4a437d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
+           file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "0cc04a63583769bd13bcc51229a5a263d59343df"
+SRCREV = "ee6c1522af8ba9b56f8416c2eedafb440f681085"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.30.2


