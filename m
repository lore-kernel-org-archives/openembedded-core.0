Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4CEC48285
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 00:48:16 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.29168.1706402895959988222
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jan 2024 16:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bK6p2FCP;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-58962bf3f89so615649a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706402895; x=1707007695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a57fS3jF+fvw1bXlJXSX+bRzR44MQghgrcvN7fkLE1g=;
        b=bK6p2FCPJ4be9p59V3U7bXQpuUbXm4tFFpUqfHvxzQZL5D79MLMyF9ic0OZxyJXuD8
         5uiUYEwU21tHAMY4j0uTBL35WN6NkUJMSVkFLBPwboZLgIgiJ2k7XqRWYjscYpNbpszZ
         FhBF1lqK/XUpPkqJ8Dv7WELTRq0QBB7vQg4/ne6YUCNewYcJb68wrlg9NaoZyPH4YL6f
         3dP/0iNMXhreAwqOtqJXYMP0UDFlvTCyPlRDAhcV8fn6RBPk2v8OOCOdLqrZLRwHg5Pi
         mZGW62lAyMabvV4R+Rcqf7XrNONBtg6CHHkyFtwDUEPnNVot/9EsBU9hqt+/94zqOFph
         ogMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706402895; x=1707007695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a57fS3jF+fvw1bXlJXSX+bRzR44MQghgrcvN7fkLE1g=;
        b=SAW+FprnEVN/BEF3AEdEQ1uXKH5I+U+lNAJMd4bL4WOe/Svcb0+HsootzwT4tOXBPz
         IoCkllRpV4S+x7TyUaVu0PTs98q/8uPkWucPow+tUg/7ccyE+kDuSkvUReFaTpF4TD4q
         oI9j6I21gKmJjHN9/xjVRW7eQ5hNFjIt1uyDkm4gPB3+6Ck9jDJ87ahNriuvJlyqV3TM
         4hzZKT0AC0jB6sGv5UMsyxV00DFaXFfdJIsI4qFCTHSEbVjvNNfJ/0mfhTqlsAkR21ya
         x+BGXqZ0GwAGLN7v31foc/hPFVSoqnCrKUBZ24Ov2PbVyYzWHbB+Uaaw3bSC/6/gKahS
         MQQw==
X-Gm-Message-State: AOJu0YwT50YO+6f+U0vQ76O27sMvf57Wb2jwHFaMumLClahp0To3Lg+M
	idps1Z5fG3cSCny3hTmEpZeAZXoAIiWp5g41oKRXODiQ5043X19uUoH3BNaQ
X-Google-Smtp-Source: AGHT+IGB5LthXH9bVCDbj3n73U+BnTtJ0UF7FKtMCJIowOWgfcu/p2XtU4dXMsLSamX7h5vDl0ZzOg==
X-Received: by 2002:a17:902:db04:b0:1d3:cf95:fd4b with SMTP id m4-20020a170902db0400b001d3cf95fd4bmr4319916plx.6.1706402894777;
        Sat, 27 Jan 2024 16:48:14 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b59a:933f:99b2:3352])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902d88e00b001d7057c2fbasm2977111plz.100.2024.01.27.16.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 16:48:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] mesa: Upgrade 23.3.3 -> 23.3.4
Date: Sat, 27 Jan 2024 21:48:11 -0300
Message-Id: <20240128004811.2209791-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 00:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194437

From: Fabio Estevam <festevam@denx.de>

Mesa 23.3.4 release notes:

https://lists.freedesktop.org/archives/mesa-announce/2024-January/000745.html

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../mesa/{mesa-gl_23.3.3.bb => mesa-gl_23.3.4.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_23.3.3.bb => mesa_23.3.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_23.3.3.bb => mesa-gl_23.3.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.3.3.bb => mesa_23.3.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.3.3.bb b/meta/recipes-graphics/mesa/mesa-gl_23.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.3.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.3.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e063eb3507..16843b6036 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
 "
 
-SRC_URI[sha256sum] = "518307c0057fa3cee8b58df78be431d4df5aafa7edc60d09278b2d7a0a80f3b4"
+SRC_URI[sha256sum] = "df12d765be4650fe532860b18aa18e6da1d0b07d1a21dfdfe04660e6b7bac39a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_23.3.3.bb b/meta/recipes-graphics/mesa/mesa_23.3.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.3.3.bb
rename to meta/recipes-graphics/mesa/mesa_23.3.4.bb
-- 
2.37.3


