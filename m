Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 790F1C43217
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.8740.1637163349906034628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kuKTlI3Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso5140832wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RCOA34TGCU/1uRmxivSjl8qafbBC+UBW5+sdKSsgNgs=;
        b=kuKTlI3ZR5cIpTA2jGMFGPpKifID1xT/7Z8g+cC04F8Orr5lovT+wKeL2zkjxPtzP/
         AeXYNxRoS19Lyhfz+fn4kS+y+VTFK7aKRGyQ+71664YprLYD7NLNV+wpUI4VBa/f8A14
         xxmf6vEXG4DXNADzK7AFBZ/eyO6mHx3h6IjxQM53MP9GbyLcgzIqkH6usvoOlWmYLLF5
         sFKnaLaMrOXipimNJkNdCtq3EHtsn9TnhdVpgvALAaiZO8VVE2MeyOIWBzv2D6b2tGXH
         q/+D3z0TAIRvKeUc76hkRPc1QkCIkbk8YmtWeFiQZScYKDfVuF0IrIBwzO0uXslx58qo
         ZaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RCOA34TGCU/1uRmxivSjl8qafbBC+UBW5+sdKSsgNgs=;
        b=g+eBym8odGIOZb9zRhgXFfMWDRx0o61fC6twcPx5iaPuMi4rA8+qKNreztGdkQ2cqw
         fVhBZO3sIiBQ/gnRqu4m5ymrrCAIjzNUNXciUjeEtSwhyvlhyoGBYu4vZvIynyvStd8w
         4eY2xh4Xw8IN4X0ontTRwcFePLVWHyN5A2TrUlbxCwlctm8ezuV/kbC4t7fmOmSLqVbJ
         IrA0XBzMp7yyY32GPewA5cQKGo01LjG8RrwPqDl/AhbTEnFySogZLiwPg4CtUwFRKp7G
         sJDQ4oYif5UnLKHt1i0Fz435yFf6sdxU8rl2aFm2GccDkEI3f3+eIvMnTuw9k+hy1XEh
         0v2A==
X-Gm-Message-State: AOAM533V7HrE7buRjAEho8Jkre8nhqNCJMEaVyRnw71S6MAEbMYQruUO
	QsFEhdELnR4SBTA0eLZLKWI+Xz9rS0M=
X-Google-Smtp-Source: 
 ABdhPJyCEZaqx54Kp2J6ZY2PovvmitkJMl51JLeNBbU4sDQnZYUL8+F9HMf7KCdDy3ordE7M9+Xcxg==
X-Received: by 2002:a05:600c:2252:: with SMTP id
 a18mr611510wmm.133.1637163348516;
        Wed, 17 Nov 2021 07:35:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/36] numactl: add missing Upstream-Status to a patch
Date: Wed, 17 Nov 2021 16:35:20 +0100
Message-Id: <20211117153525.257146-31-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158426

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../numactl/numactl/0001-define-run-test-target.patch           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
index 78ffb22f89..9e65a45133 100644
--- a/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
+++ b/meta/recipes-support/numactl/numactl/0001-define-run-test-target.patch
@@ -1,6 +1,6 @@
 rename test target as run-test
 
-Upstream-Statue: Pending
+Upstream-Status: Pending
 
 test target not only compile the test files, but also run them, which is
 not suitable for cross-compile environment, so rename it as run-test.
-- 
2.20.1


