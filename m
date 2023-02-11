Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F13C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:17 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.19562.1676150646351225590
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VMqT+Bov;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id ct17so123821pfb.12
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYfV9bFOXvQ7eP12LRUAzWAe96WmBBnqCl0OrAWEeGw=;
        b=VMqT+BovcxZ8BjC6NrCilhUaayLRrk6rL9AqZL8a8Z3qFFFubprHH+3RMOmW+i8bIy
         UGM+Zb9S/igYdq/6A56MHKQj9L8rTLKHQCEbalDgSCwFp/hbMcEnACj1jt/MUEy2ituK
         YB1XAgTviF3FPBV6pkxI9bc/iPASiZLlXIRXYaTUNlzqDDauPrwTk48UDdI0a1ZzAitg
         GNelYPI1iUu2hUUgOnI3HzVOEkWWnNi9cTXfh6YqbTlK5PE4Xr88dIi8FyKFIDV28SBN
         akKn8WCKHsphxo88BcPuOQRy0mxXcySm2Gl7pop+Y7+UBTuaod0vAd6kIenklesrYY1H
         b7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYfV9bFOXvQ7eP12LRUAzWAe96WmBBnqCl0OrAWEeGw=;
        b=eliZCxbEANPV6Mf1jt1OnVJi54nnwhaTN7d9PeyuXxWDxTkLb0J0MseIKIW/ciYDQj
         099VyHStno+nlx0VLgBdgGSAxTkucSNRaN85mzSCjlG3MN0XWa3kXfe5Qs3Kg9azsnbh
         +xg0TuoflHXbZPHmHZ25hbg1SMK/PN7IsuWQg/AREwYajoUazIHlS4r/LIyvedGbX+Xn
         OAYs1mMaj0TviITSLUViWn630em8+9qLCv3/iK+zB4YsUJQ6Q+PDS7HjpGfRA6d3PYjm
         yK2637M9KDk93ahSjqsVhvPoO6XoWC7PCrJHo+MvUNcw18gh5ZS7DrBp1Q4cehLsk/L0
         RjXA==
X-Gm-Message-State: AO0yUKVufAEVTBGVZ53nkEP683KL5inhlKpP8RZlzt/plWpjkxNs/uWu
	8FRqWUr3m5OykPJkmph2d5EdjE0n9ppb6+9/kSo=
X-Google-Smtp-Source: AK7set9UkTDUBtBRejifrzy8UEdraRuWTnX9A7F4NH8HEtcTg8XiH8WGxaHq9J+Iq+xWJkuJIQYHNQ==
X-Received: by 2002:a62:642:0:b0:5a8:515a:eb9f with SMTP id 63-20020a620642000000b005a8515aeb9fmr8884674pfg.2.1676150650074;
        Sat, 11 Feb 2023 13:24:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/28] vulkan-samples: branch rename master -> main
Date: Sat, 11 Feb 2023 11:23:30 -1000
Message-Id: <4037cb9cad74394eddf7a676060a9311282d2a89.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177017

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74bf535ca5cbcfb38c18775ece863d53dd216008)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index d0b3458e1b..d5d285cd83 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https;lfs=0 \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
            file://0001-Qualify-move-as-std-move.patch;patchdir=third_party/spirv-cross \
-- 
2.34.1


