Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6048BC4332F
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.34456.1638006853178199410
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U/6PtvzM;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so8354744wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MGkxDOT5ZR45gfvPLr1spWpIfc9wU9uktLkbaUTRTgw=;
        b=U/6PtvzMmmcLTPIVbEEptygAVvgIqZCO1ZsJKmdm0gAEQVxmhAsAP4Eqg9uywcZyK1
         j+4Dhaot7V88nFaqiLkXFKNHkY5TttJjX921gTxZ6Q+yl1+/uCaLB8Wupq5A5RCPNLb6
         CAPCyrdT4GZTH15CEiFLwfQB9mKIWfZzX9BxKF8A6sBSOtaRp9NNekQYu04XlWh4SWo2
         U45xF76jY+e5QNRJa3mWMELYHLrNb1vJVZo0i7C6U6dHLbzv9At+CnVeF4wOWRKLcA6y
         rk+gpbWit1fLYydV7+m9iGmN/TFYiixf0aA9ZM9tqC86NNmBSxPKf+ege+b1f/JslUbG
         Dqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MGkxDOT5ZR45gfvPLr1spWpIfc9wU9uktLkbaUTRTgw=;
        b=E5TVscqOdTt31rq+VOHCeZcKroqpZk69Fjo5afXGY0Y/T07eMn9QMn0LnQk6sGyNya
         PFVGcsfm+UdLxB9rt9hpqay9WFawfes3uoiLqOyjCCoxJELW2dk7vq9pwsxd+7aiJiDS
         udFmDOfV1QSLybqoVIQ0AdYWOse4S1CPFVeO6VP6YqtCipvj7rM5ghELuXhuJ4vN/iq/
         He05JpkWPkTJowfE2LJwtOiR0KtK1UplAQn8QaCOqvcMC4qDII2MkdRvhxzj1az3vz6y
         8qJCFaln4ZnG2eaJ1oYZOfsWUR5gFID81sbkpOOx1dhCfiVAXAhtkxtYhVnKm/TMM/lZ
         fu2A==
X-Gm-Message-State: AOAM532BrYxeZD2ImEFW2BFstTPnFrJbq6USsPdhGnNpQXLluQxIW9EF
	piXJ7RcwWmxIwsd3BonOYTz9AqUzTTRlwg==
X-Google-Smtp-Source: 
 ABdhPJx4pAzKPAydRW98tFM+jX8dUG6pfQGl/5dw8V9ttAwb/SD4N2xRNnz2Jjk6A0jZS7GvWluOYw==
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr21578879wmj.14.1638006851751;
        Sat, 27 Nov 2021 01:54:11 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/13] meson: submit patch upstream
Date: Sat, 27 Nov 2021 10:53:50 +0100
Message-Id: <20211127095357.1748429-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158855

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...oc-fix-issues-that-arise-when-cross-compiling.patch | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
index ce90e515da..ab4d5969d9 100644
--- a/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
+++ b/meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
@@ -3,16 +3,10 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 4 Aug 2017 16:16:41 +0300
 Subject: [PATCH] gtkdoc: fix issues that arise when cross-compiling
 
-Specifically:
-1) Make it possible to specify a wrapper for executing binaries
+Make it possible to specify a wrapper for executing binaries
 (usually, some kind of target hardware emulator, such as qemu)
-2) Explicitly provide CC and LD via command line, as otherwise gtk-doc will
-try to guess them, incorrectly.
-3) If things break down, print the full command with arguments,
-not just the binary name.
-4) Correctly determine the compiler/linker executables and cross-options when cross-compiling
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/9627]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.20.1


