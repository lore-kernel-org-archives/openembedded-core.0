Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38759ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 17:38:25 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.265.1667151502803737693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 10:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CqHQgkhL;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id t25so24388381ejb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPTSoeq3LOoBVqWg0VDf/ibHkOnxzhT2l4I/hLMotCU=;
        b=CqHQgkhLvXmV2iHJcFA3zte944FCEWu8HXNJSYTK7VbK7w1sj1yBVmM7J+z4KD/9oz
         w1kHlhV194dzG5RLvW4PkrTFgxfygo+OaFytwo7UEmbj/JhLLifysOiuFdnLxJc5jhui
         Hj7POUOrWM25byINDX4V3KQQvVYeoGaNadJo37e+c2hg07qwUDyN9MIQ21F8FTWHhuUD
         6TjWs+O8j7E0VAbZdOptbQu5Zw2cIsaqB+UaaCOmunq5lVKRYe2xrrcoUfq2jYnIBJBX
         mx2XE4wpMqIctEEKZj6BdPkSEIoIhOfTK6ovlkyW5yhKUdxhfsH5R4RUx7SE2n4OBRfg
         9Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPTSoeq3LOoBVqWg0VDf/ibHkOnxzhT2l4I/hLMotCU=;
        b=nV5CsuRUDDu+aL7W+N3KlEFvkLp3suL6siT9KFTKg0R0CI3HXMpjhevXUcpBMc2gBM
         XG+7HcSaZXSG/f+1hY5eHwrlSsP/y0Q4kVU88ZYJGHqlBIvlR3d6mLwOZy71FDtv+Z8g
         bdwazZBQv3pfRPI82ja03FS5ozC+gdJPKWG/Zv/hcpww4Qrn3uH1pU6jld6naAMcPOm2
         QcP2lwZZaGZNgAtZrL8bjGlQ1NCs+bDWk700JZvnWHJh4vEyQplTtQS/LmzJUGLUFIj3
         81PtfbxpfPxaFw2kuNMUeKt2tKhnkPRILbWYVzZc2plpiTjWigSE13tzUO0GZD6OP02X
         gANg==
X-Gm-Message-State: ACrzQf2kV2G2f/QYuJYvAuaBHj1N6mZE17NKDUbaAHd0SGm7MlyCvV0e
	owPJpJVsy4hivMsgOdgPJMbXhWStuvY=
X-Google-Smtp-Source: AMsMyM6GpBI6BuecdTEefztoNpmqhuqfqeWAnN7ci3wgCJDGBjHYrGpyFUlX2VJmy8zjXbfcoGA2Ew==
X-Received: by 2002:a17:907:7f8e:b0:7aa:7598:126d with SMTP id qk14-20020a1709077f8e00b007aa7598126dmr9310240ejc.289.1667151500856;
        Sun, 30 Oct 2022 10:38:20 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m24-20020aa7c2d8000000b0044dbecdcd29sm2258549edp.12.2022.10.30.10.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 10:38:20 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/2] cargo_common.bbclass: Fix typos
Date: Sun, 30 Oct 2022 17:38:14 +0000
Message-Id: <20221030173815.10212-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 17:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172283

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index dea0fbe2f653..f503a001dd8e 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -56,7 +56,7 @@ cargo_common_do_configure () {
 
 		[source.crates-io]
 		replace-with = "bitbake"
-		local-registry = "/nonexistant"
+		local-registry = "/nonexistent"
 		EOF
 	fi
 
@@ -103,7 +103,7 @@ cargo_common_do_configure () {
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		[build]
-		# Use out of tree build destination to avoid poluting the source tree
+		# Use out of tree build destination to avoid polluting the source tree
 		target-dir = "${B}/target"
 		EOF
 	fi
-- 
2.35.1


