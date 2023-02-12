Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D02CC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.20819.1676236259860303775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tuEiVK3a;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id mg23so3587873pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhKzQrFS5rBfhZl9uoOgWnO++9JD66YqLBWDH5xhS7g=;
        b=tuEiVK3auyOOqMmiei+Y8mkirJtOF3H334RSkStQ6mK2YCoq347lPmbOyn9vebV72O
         zbPK2mFHwV/MxVUH+sgqU2KfAyqZz4PLVVC9xiyDby69CZ3S3v1mKGpc6fPDZ1Pie43j
         NPj62kHH5qx1JiSkY3MCCOkRePFOJyCL0+1O64JT8D0FR+J07gwgQrG6TkwziT23U1/g
         Ezl+DyBDgB3Q8ySwKGCSk3iZPCtdS0o8dh/e+0egCHUa0eNqoktgJyscHIa4kKXLblUW
         kILLvELFi8EY7tUtIJ6SWqz+Vep510zyWllbpfDbq2wRUCbyAgxZ8ocmQpKBXwQpQHAV
         xFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhKzQrFS5rBfhZl9uoOgWnO++9JD66YqLBWDH5xhS7g=;
        b=sMUx8XmcFo0nLXv0GJq80YdXW43AJMfIYj7OLS9sANb733Tf3fMOpVGm323I2kLSo3
         SH8jEIqI30JXsI8+F5eoyf7NSk1eLKuzVjZHY+4Hy0WdyPrrpndD9CFIGiYZjDswYTqt
         s5UXkw6MGI2ru/Iu40XMzHru5zmb6lo9OtksEHz3MDHipDXqzNDR6GNYzt5j2Cx4Gmdj
         u++C6Vw5HTDAwrPABKX1KpcGA3jipJncKTJG1CvAggUctlF7v5E55LDW8Mys5x3BSUDm
         dab4HT3f0jboJXZx0At1+Wohk3JKiLt2zyayyoTQd/xYT/1qm4vInTNd8RC5Xd4VS6NA
         Azqw==
X-Gm-Message-State: AO0yUKXAyVysTYhTnD+lZkppNKTd/XqwWwnWaJkUOc1pAyq26S5wzsFD
	IioXMUIi0gOgcvazOCXREb9c9sjKuHI2iPwiH8Y=
X-Google-Smtp-Source: AK7set9r/RiqYlgqvXZqCJEBJhv2OwzqeTU5g7N8O7yfFxY7syrfDSn0wEIM0R/Qtqw01LfTC8Y9jg==
X-Received: by 2002:a17:902:da84:b0:196:8c85:8aaa with SMTP id j4-20020a170902da8400b001968c858aaamr25378403plx.6.1676236264627;
        Sun, 12 Feb 2023 13:11:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/27] vulkan-samples: branch rename master -> main
Date: Sun, 12 Feb 2023 11:10:23 -1000
Message-Id: <986af8c9ae9d2cab0bc0376757f40b096448ae2a.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177051

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74bf535ca5cbcfb38c18775ece863d53dd216008)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 3ad16490ce..ffb8d88ee6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https;lfs=0 \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            "
-- 
2.34.1


