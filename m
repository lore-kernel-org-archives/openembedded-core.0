Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623CCC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 08:38:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.69299.1674722278811904656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 00:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pm8H/YHO;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so631994wmq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 00:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQmNvGuVDjcMtoO4IGeDDX24u+bqTh5Xxh3k7fQtm8A=;
        b=Pm8H/YHO2YdHg6+n3cPvPHHkIBydQ3kSQYhOSSfaTseBUVtB8fPsw5dkwDFDa15cJT
         5ZPrRwhrzOvQGUz3x8CpH6w9nL3O59DKCcjY5nBReC/+FT8Q1SPDfyWtvklS0Y4eS17g
         GaKKq/X7sIH9E/Vc+PDplHjIwT2nv7bkM5shITyTwGipukuP2kQPebqFDqU1eOkLuxI3
         sTRuDNj+WSbj7UdnrwfBH4gwNWIBaCK/oK0nBI4GHtEstfl+Sa7bNg8rkVk6yFSi/1Qw
         OKNEEkZTv34qFwHdNTRtzTmUnNBSaitJzFUsJYY8WE2ykwR6FDcL9q37NLHbur1HX9gr
         NhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQmNvGuVDjcMtoO4IGeDDX24u+bqTh5Xxh3k7fQtm8A=;
        b=bZDMQBih9LjHVWQP1DoyZEEscWuuArz4gMYW1zlsjpuZyDzNc/98Bl/PzbukHTmTiP
         YcR2Cb28BvMLk0MlOM8PmYQiCmznpNsPa2jaMvVR5/f9Qlezq+V4Nr0tJOEV2brepVwg
         vvpAkN5pgE9wAkymnhoeIp6dwu291eJE8Sy8Eo5KlOeNk+xB0LjkDUFYM7o5Kr5Svy0Y
         vaL5cUqvKiNwRwQPKdXLz5SV5NoKD2gKL0D0J6R3snZ7TfRoYE2j0MHS72xBbN1ISa8K
         2FMX1RREh+VUJXLsxzZ0qhkPs8yFUcnOtvh+qrW43Lsmi+SiP39SaW9ecLpDb9lXLJtN
         t8ag==
X-Gm-Message-State: AFqh2kqIA8nmgcinRErixP1wJ84TtnHrgCyfUVrRhBtfQFJtQD5Dv+j6
	s8sfpP53SAIfvHpbUJ16/akcYNLfgZI=
X-Google-Smtp-Source: AMrXdXstSYoHSQdisuSqsKRclyScHAePoyZPn8igNkwhvKzgBipt5bZcVOLb+TK3J7epQygr5P32sg==
X-Received: by 2002:a05:600c:16d3:b0:3d3:513c:240b with SMTP id l19-20020a05600c16d300b003d3513c240bmr33541347wmn.7.1674722277216;
        Thu, 26 Jan 2023 00:37:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u32-20020a05600c4d2000b003db0659c454sm957721wmp.32.2023.01.26.00.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 00:37:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] vulkan-samples: branch rename master -> main
Date: Thu, 26 Jan 2023 09:37:52 +0100
Message-Id: <20230126083752.151940-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230126083752.151940-1-alex@linutronix.de>
References: <20230126083752.151940-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176387

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index c0ce393201..0a936a78e2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
-SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https;lfs=0 \
+SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://debugfix.patch \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
-- 
2.30.2


