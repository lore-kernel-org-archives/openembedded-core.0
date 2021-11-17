Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79383C4167B
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.8737.1637163347259734651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EmtIgUD1;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso5149825wml.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CGBhAibuGXVKK3WRck2ilR+2HUVv0q7fw/7ABT/PjgQ=;
        b=EmtIgUD1OQDsAs5TghDBxjEC1Exr8IaG/7DuDr98wvIPHbMvE+6b9n6jqCCbaTfUkL
         EmnQxm2Sg9fdVixf+oNGVqr3SwplDeak/CoBNarp7+fOfAvpLV8k4tMH59M/OoQyCMWL
         Zae+OCk3sM3i8t4XBN6CeQZ8uEXEOzTpVZyTGam8WSPCYO6VGSPOBNkRFewTe9Q4Xftf
         n3OMxqcliRSY6DNFN0NbPV+dsuUyBNBSusAUHXKYLpeXAEE7AsBC7b1pv7SsqvWqw5ot
         AN1s7WCpxZnPutLUX+t2fWQ3OUq1RgEmOzJ/sMpIasUJ5pYSyfqUASz/bLXeowjeKzZm
         Na7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CGBhAibuGXVKK3WRck2ilR+2HUVv0q7fw/7ABT/PjgQ=;
        b=pMCJor8dsNRvv5RYI8EmIn71lnw6HWIQ5MgCWMBmzWJbQFFZ/RG4xdrxpdaPlyBCnU
         LELfdP48BaSsHyhkqOKqrvPOJvR6HeCXmUaqKX2/HYFXUGTg6yvdB5aKi00IHLBCFfag
         Bt9GJgM5L0a6kyliUB/qX+iBUbGPc+OAS8xmk7zhvgcvWKOj0P+yQgI598kKGr9Vmlxa
         w9/nB8oPAGZMAw+t94iYeglNoaYSmn3tIdkHdwcVb699hNDQjjin2SOpknY15dhSnhe8
         U6M5Uh4+29JWoL1Wn7E3xAI4JbKUoK8CXoLc3D+61D5n1QgJ+LkFJiHV8BOHHRFxUn4f
         fo+w==
X-Gm-Message-State: AOAM530GT7S9YHcA14Y7w0VyvUzNDsZ6E8k5DYwoZp++XjdL7ku8Ws16
	UyTG5j5FMHiUInOU9QBBhiIy9x3ynnI=
X-Google-Smtp-Source: 
 ABdhPJzRbBN6uipAN6bvvnaGi3wBPqB89kbVf8Vnot5gWrm7WdlvOqNJ2F0mB6ZQDcBu/nGOZkp+fA==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr613340wma.85.1637163345342;
        Wed, 17 Nov 2021 07:35:45 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/36] unfs3: add missing Upstream-Status tag
Date: Wed, 17 Nov 2021 16:35:16 +0100
Message-Id: <20211117153525.257146-27-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158422

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch b/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
index e0746ad518..e3496814d8 100644
--- a/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
+++ b/meta/recipes-devtools/unfs3/unfs3/no-yywrap.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Backport [https://github.com/unfs3/unfs3/commit/3fa0568e6ef96e045286afe18444bc28fe93962b]
+
 diff --git a/Config/exports.l b/Config/exports.l
 index 662603c..7e7c4fc 100644
 --- a/Config/exports.l
-- 
2.20.1


