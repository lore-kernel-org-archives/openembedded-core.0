Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30620C5DF66
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:31 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15792.1786907910087193092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 12:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g3/wiO42;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3632057a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786907909; x=1787512709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tdd1ysq987Zu/LGsgaMyKmYDTdsACG7r1we3zQm2ps=;
        b=g3/wiO422lj8M9O7NYD+s5klnY53ZaIOYqefXuX6FOf8Jp8KOUnAT8wqVuprYBcVrz
         YnM50OTBjoa5Q3b6mBijjOpPM6NnebHhr7JCekABHmdVrRMagP6Fn6e/KP+RgjUmoiG9
         G1VuLTYzAWC22OHluoPL/O7lB0+LPKOzx7t83roExWcxWPRgemGjq/baIh0aXBZaCv3n
         xYMNo507H8C8MfKRAtcOAGkMFMcTIfSm1/oDcKKDHIp7OA/5CThpxZ+PztzNAPrUiWfH
         BpvnnRhI31yyEI+7PSQkWqYLld+9U+VtOKxtkLxGsgvH70Yo5eRewdGUbsfoBScqo2iO
         z5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786907909; x=1787512709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tdd1ysq987Zu/LGsgaMyKmYDTdsACG7r1we3zQm2ps=;
        b=pV252qiqWUbfWe0fHHx60Bxmj/+BNbjTiXtHpVwxd7DGMXcTsTAtK0usKNVi2tWzW+
         clOdOLNL6+npNdrL3hO5EkFUykCgE4lI9zeCinRibdcQ70Ea4m4sOmpNmc12VXE0ymuA
         6RFj2G+ypyDe/+A2HWwiqhrsV87ekrtjc9NUFjH9CfExfPDEkaQKD2uXEcwnPR6okjfI
         LQgWgsbCADsR/PA35xRWLezGDBlwUgCfrUOY965BWyoyAPwO4jr9XSFWG+jdUUcinj85
         TXxN2RMBqQHXLQNpa1imaHQ0dB9uvSZZ8kq9bqIM4rQq16VCVFNyv6MXl+mH9vmSnOj3
         1C8g==
X-Gm-Message-State: AOJu0Yw2a22cUxysNdUK1db5F0lesXnIMVlFo9CyQwMqoSm7wtWdQUrp
	xAwIl2YgC42PQvnWghQGBqFGg8N862zBGrhxaJxEk4oqtUcoqzwZG0u2zGJuYA==
X-Gm-Gg: AR+sD125H+gVqMtED41os5iG5N2Pdny5reJ6AfJNO7l+7XGmhA83ncVSRKo+xtoQ9BS
	8fPh+b+ZxuamIMizkkXEyPJoNiETW2QJ1VLDtxShjmih/jP78BrVHGmPz8SjSlOyRwUnQFSwrwJ
	+A0waa44tSnukL61NyBDX2S4loD0a7AkQNNrwFJRzDFucNk+QGlZE5CpGS+2mPGnZP8SyE/uUFW
	URvmlW2Wy9RN5lwarrqL8OptQNVKyeuO0hYmjEURIX/SlFe8nFbeXFQ23LBg7eG+qWGoQQsFYdl
	fIlRO2c0or3TFM3Q/fSQEPMPgdbTGFDJqveyGOPp2IDjNGxOS43dNrgLCvpVf3pPOxD7JwJRhBn
	NNlo9TOEq18kDJ/Ozry2b9bIrh6n7YxUEEr+0WDmLH+khJzH4zpJcRl6T0wG4aWLk6h/ZYNJSTg
	TCFn2quOo86NX/uitjF+qkFzywRxha+qHeMkGxsjlkje2ppccWglCqJruHDu+Rw9drrQ7TfcZLK
	r1//A==
X-Received: by 2002:a17:90b:4405:b0:381:792d:f993 with SMTP id 98e67ed59e1d1-3933b8c4cf1mr18385067a91.17.1786907909406;
        Sun, 16 Aug 2026 12:18:29 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:b6f8:986:840e:67a4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm36947839c88.2.2026.08.16.12.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:18:29 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [PATCH] mesa: align x86 mesa config with LLVM graphics
Date: Mon, 17 Aug 2026 00:47:43 +0530
Message-ID: <20260816191743.2021262-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 19:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243546

This change makes the x86 and native mesa PACKAGECONFIG appends conditional
on the same DISTRO_FEATURES check used by LLVM.

As a result, graphics-related Mesa and LLVM options are only added when the
distro explicitly enables a graphics stack, while leaving non-graphics
minimal images unchanged.

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 66c8f9c372..a646c16af7 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -13,10 +13,10 @@ PACKAGECONFIG = " \
 	zlib \
 "
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
+PACKAGECONFIG:append:x86 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:x86-64 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:i686 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:class-native = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm amd nouveau svga', '', d)}"
 
 GLPROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
-- 
2.43.0


