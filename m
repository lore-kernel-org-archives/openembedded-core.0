Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16D3C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 13:52:23 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.73717.1674741135104219734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 05:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CrIxaxcW;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: festevam@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id f88-20020a9d03e1000000b00684c4041ff1so811464otf.8
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 05:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BGyope5InIrM51ExaVBh58UHssmgA4qqeS9Wu5P0Ow=;
        b=CrIxaxcWOYjfpwqIJjU6pNBQ25appg+wc0jPtDs+Po90Qz7vSJMZMBlzANuWKi0SM2
         iYQqD+/CBk5iRNlmeoy+eTvcbU4IfBwocMoecVVjz/Z0Y4/BJVrkbz6eUSdMBGT2su6Z
         BoeGSFIgrQoApxnDfhL57sIXpB5Mi3pg7QZZ5mo5JIMEEzrK6vv0/tpH42eaACJLJi4V
         LZh/3oTn8UZcre1ZaQLmDn+4xn3IGLQXu3NSfyVInp8tfaFJt9DQimoPQtJUMbCqE9fd
         TSidC3aly71AJEbUA4D7l88Kj+xleBEX6233FQSo3utAxwLfKyjbCmBp1QMDaKWUBmzC
         85Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BGyope5InIrM51ExaVBh58UHssmgA4qqeS9Wu5P0Ow=;
        b=KxwGMoV61qjlbXpcxFFXrRYB/UVnPgS2XCfoEF2lk3yE80xMaNfljUYsyzXHNP7SqT
         lr2ucH4Ao9GKW83c5l3ck7Cz4SzulJebGK3TsOqeA9VTBvrre9pE3AiUoWDoQw7199eJ
         QB21JkqoqkGlb7AR5nnAbp8FZyOj3oDOnWfuJy6QXGcfjHTveHq2J0X+mZbXMF8JmlpO
         a+SpGK9KpNSKwz22eLRXU52fo25stqEMWlpOl1RMeTTuXL3AE8JQM8mJDjzIN41of4B9
         d/5ldI17L7x/ndVQ+IycnJqroha6nUkh8EIXEtd+J8eHO616qQXckeiJwPA3admaoi92
         8lAg==
X-Gm-Message-State: AO0yUKVPoi4Dlc7R2nVJyqzyDkRVYCWcOEfJHVabPMEWngwrg1Mn6R/t
	R+0gId7FtcSNNQxm86zjjvbVjomB+Pc=
X-Google-Smtp-Source: AK7set/pYARw6x0TbFzqNq05FWuMVqGTO4WHNRwBMFF19mhVF5LllsBzuePN/MLnMPg7KYpxqHUwEQ==
X-Received: by 2002:a05:6830:43a8:b0:688:4c3d:95fb with SMTP id s40-20020a05683043a800b006884c3d95fbmr3418198otv.38.1674741133970;
        Thu, 26 Jan 2023 05:52:13 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:f81b:ba47:fe62:5d29])
        by smtp.gmail.com with ESMTPSA id a186-20020acab1c3000000b00363760f96dcsm408429oif.42.2023.01.26.05.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:52:13 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Update Upstream-Status
Date: Thu, 26 Jan 2023 10:52:07 -0300
Message-Id: <20230126135207.3015180-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 13:52:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176398

From: Fabio Estevam <festevam@denx.de>

The patch to fix the tools-only_defconfig error has landed in
U-Boot upstream.

Update the Upstream-Status accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 ...1-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch b/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
index 1339092358..ab05761146 100644
--- a/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
+++ b/meta/recipes-bsp/u-boot/files/0001-Revert-config-tools-only-add-VIDEO-to-build-bmp_logo.patch
@@ -16,7 +16,7 @@ Revert it for now.
 
 [1] https://lists.denx.de/pipermail/u-boot/2023-January/504758.html
 
-Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20230119012321.1103067-1-festevam@denx.de/]
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/6333acb961b6fcaa60c6e5b623d676b332481cfa]
 Signed-off-by: Fabio Estevam <festevam@denx.de>
 ---
  configs/tools-only_defconfig | 1 -
-- 
2.25.1


