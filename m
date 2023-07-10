Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3B3C0015E
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 17:18:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.46024.1689009527306684926
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 10:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VY2cA9q7;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-668711086f4so3027523b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689009526; x=1691601526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqiwvjLECjGjVMV4SYLQXsZb1WUmf7km06Pclq0b9/A=;
        b=VY2cA9q7oG/utArJG7BUtcvB4N8YyXQk2WWGM1S0OPwmD6LKTqDoq7A0YUHP8KbR3K
         QtFFk9jtYWPYH9i2xjmWHwKi30ESGWtzQSrX0j4a5TijbWgMiH6mJbZln2/WGziFahpW
         K5r0xjY7fvLLK/wy6V5CWVVzh8oe3rFNDNHjm2Rqgau987ZVQwaDrgj/3wp7uVamAMQb
         BlhtuEGvv/PkWVC2jh6Z2+XgvS6E0iTyZ+o50g+S61A27b+yDq/F1ZK4hiJJ7Fg/XXdl
         1mLyIpbZ1INZpugV68uzolyLllgUQS9PGgD6AfeCRDs5Xfhn1yas/wYdHGHvmljDRTMm
         33QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689009526; x=1691601526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqiwvjLECjGjVMV4SYLQXsZb1WUmf7km06Pclq0b9/A=;
        b=gPvga601Nee1p/kCEMgTzm4LdWjKZIvU9rx61lNRwyvQEnxEXkzuwNeMPlY8YE3BCI
         6PUZcMxqmQaFbXsXlIft7A0HpW5f2pAkjPU0w6YvjpURtOgnImbnPU7ReKYpxGH1gr4g
         sxCNnsLUjI3DJTs14VEfAhwtWtduCdX7L+em3ayfSjCPHexoZDw9HlMuyyE6z1Jz7TN3
         PFRqrsMEr2vSXbe7qUssH2FipxtFRDBoXXUPl5ukBg1miHQRM4iaa4dqtE/rQ43Bn3z1
         ViKHIIpnHxKpshIXjSFpbkIskoN2QTzF9JKDUTnxd1NZ1XiQ2P/14SLSmmZBY+/ziG1Z
         pbyw==
X-Gm-Message-State: ABy/qLYfLdNT4PMd80bzBzQFuXLO5f5MUeY295U8k5mtvGkZll1twiic
	gzgZxcsT9dFzH0eGfaqUp8IZgOEizxY=
X-Google-Smtp-Source: APBJJlG2Sd6qdhTOb97LIMuHcRdWc3uegOOCRAUZdrrRQRqE9zDw0cVEyqRmQ2ZVbMwFXQ+xSH6ukw==
X-Received: by 2002:a05:6a20:8402:b0:12b:40d3:aeb1 with SMTP id c2-20020a056a20840200b0012b40d3aeb1mr20069347pzd.25.1689009526280;
        Mon, 10 Jul 2023 10:18:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::8b4a])
        by smtp.gmail.com with ESMTPSA id g7-20020aa78187000000b00659b8313d08sm54291pfi.78.2023.07.10.10.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 10:18:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Add missing SoB in patch
Date: Mon, 10 Jul 2023 10:18:43 -0700
Message-ID: <20230710171843.4073981-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 17:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184091

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch b/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
index 245fccdefec..ae99810cedb 100644
--- a/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
@@ -18,6 +18,7 @@ this patch wont be needed when upgrading to 2.42+
 [1] https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf
 
 Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-02-20 01:22:18.917743700 -0800
 +++ b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-07-08 08:45:09.739177065 -0700
-- 
2.41.0


