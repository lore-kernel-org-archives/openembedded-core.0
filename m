Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD93C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 20:22:22 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32887.1784665341120511234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 13:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MSJLzAkN;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb545db3afso5021636a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784665340; x=1785270140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfuW3F0M+/NQPDhEkr+yxrs4g5obHcnbYEiUszRpcrs=;
        b=MSJLzAkNGEjYOgaD/S30xBNhUdSSJHFwdblD1RaY7KSNu1F95vp5/E0S9tjyFe2SbS
         wPBseAOSrbdfkjmYaFKMFB41hQ3e6kAmGzZQOUyLdsVaXrlh2NM8v5alXQRvZibTKrkV
         SGxoR96nom0DYvaCo1AROToxOeiwM4S5eyVYksKHyqOi17uwMLbOjFR5TZs3Hem2K9uY
         n2NCfMAeAFP3cPMKDvLWPXqF6wX/fZLnbWRg4rrFI5fAxmXjgAJdWllGALSPkdoVRbbj
         Hhp0qVbxJr2iLGG/0HlY1JbVTADFto7LvVJyBZzMMgfJJ/YO4iyjBfaGLHR3xtF2sfju
         NSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784665340; x=1785270140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfuW3F0M+/NQPDhEkr+yxrs4g5obHcnbYEiUszRpcrs=;
        b=DWU+mthnDuV8sZb/w3+0j10tVltU6eIqQsTndMqfGn8k8tB9dks0LJfqVJC+OqfHf6
         MTqGhkUA3nDNnAzLVHFuBRaZiRWtkBAuUPgThKqUGpqFc4dpBaBw11T3nGHuOWd4cLCJ
         qMqm0hGc+QSvJI4v7RJyo68+TPJBn8X1OHZ9BexWUno13pzCksDQBJ8kBfTSdXVK/NnO
         ZyJj7cK3EiAO+ztqujo7wWjevJYUdNXnyhdNAx9+0NZj45ugQR8DtvevHRMWKbytdy9q
         /ML6Hz3M9uqYDtjE5AelC+Japj96dZR1nwVy3946G/Tzyg8afZEoQpF47jvCLhBcZWZB
         2iiA==
X-Gm-Message-State: AOJu0YzsQuJKJAo2JJsIlyxMT1r2+hY8a80t+3wGitEsRk6CjB9JTg5U
	IiVUh3beZj7aBItkNpLymrsu221GuvXEQE2n3f7gX5rbWPqXvFLo+ff4+51mCg==
X-Gm-Gg: AfdE7cmg+wYRG7SIaVlLtMNYiNvyYET/zG3JT7i6GiYCCSlaXqfl2emNFDEpI5sMRpY
	Ervyj/TqWwmbGZtHYwtp2aKaF25BrmVUS3x5Hq144igvUN7jC1mxcfsHDwm2Yubat2+yrS6o9mq
	ImAI+bA7NH65DSIlC8nZko/3ELAZTl+kBaxjEKZ4oQd8WCt7wODZaV4l2xwcvMLp+ATANbJ9PXb
	2+5Bd6s00L/DLGsipm3MWgMQc0mlM8jno+DLSGYvJRTWvM5W9pj7TcoJZAW32sIxTLT5Lpm8zO7
	Pot0bFW2kKF+RfRXBsCOQXvWW43kFxLYWMZ6hFdXPzhIa22B2Jka76c7kgbLFInzc2W/QYpJoD4
	Fwo/kFconrKWVlXm6vHNYBvnchRvoMyKm2hqYUlLX1yGCC0WXLMfILO3+DRQKuEr9V/z5UEDnYQ
	==
X-Received: by 2002:a05:6820:16aa:b0:6a3:7760:e42 with SMTP id 006d021491bc7-6a536896832mr10086981eaf.35.1784665340088;
        Tue, 21 Jul 2026 13:22:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::d8e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-457673d2a12sm383747fac.12.2026.07.21.13.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:22:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] libxpm: Fix license
Date: Tue, 21 Jul 2026 14:22:16 -0600
Message-ID: <20260721202216.1683092-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 20:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241575

The license for this software is X11 and MIT (verified using the SPDX
license matcher website), so fix it up to be the correct SPDX
expression.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
index 32e052fd42..fe465af4fe 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.19.bb
@@ -10,7 +10,7 @@ pixmap format, which is commonly used in legacy X applications.  XPM is \
 an extension of the monochrome XBM bitmap specificied in the X \
 protocol."
 
-LICENSE = "MIT"
+LICENSE = "MIT AND X11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=903942ebc9d807dfb68540f40bae5aff"
 DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
-- 
2.54.0


