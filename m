Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E51C433F5
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.34225.1638006854515054413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxpMwe/9;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p18so10035188wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wXb+yJpVa/DF+BFi1zIEo1mQc/iwE4jM9EK51DJ4uU=;
        b=XxpMwe/9zZx1CfsfUPjG3t4DLYMBAIFaalbIOW3fX5rM+Xg+njUcyoJfU8cQFwrHai
         l5R2se03qF+Koq04nOnvF2fevXs7SZaMCaj/MErUDAjPSRVn5Ka7J2w4XhtEBdJkfrul
         09na/dJKWwUcnZPPMbb47+Vp5wHLypxu2s8lndGAzUNVbEj1UEqL110AOoxaGDyaiIor
         J33O7bTdY9c4i13Wm0O//Uyh3X+tQjpibMi6WoW9a++CFOvOzP4XTtpTQ7lB/DhBkJez
         vICzm67vDnAE+dI9O+eMvEC5pz/U65QwRFxDYdGCem51H9+k5ARQM50+dDielgB+Myll
         +GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wXb+yJpVa/DF+BFi1zIEo1mQc/iwE4jM9EK51DJ4uU=;
        b=a1SrHKL2XFvmPFCLMgrXit9Lex0Hakz49sKRv5Yj6+yCVEO3me55kvVJxwxbC7nWua
         B+f0NtiRhLeWAOVwN146tLMVRQr1L/gWpxAZwcCCbJU5MP8TEupa9fwOSaxEMS0oGSex
         mAqsUkK53d3Njbxv8VrUzLuznxSlmzl6GIkEjaUw0h4Vo1KWTl4qkSPzHAii0QUaaBHW
         DhHJIe4K/cg+Zkj18QgWYPSCWNi6b9J8sQ5ENWkBeHH5qEQTjbKItFSr109564NPWrez
         tMBJ92VR6EMEAFpRJj9rzX9amEZKogqZE90sX6qKy3rsAZYT81uU7idXuHWZR9aNuo6z
         9D4g==
X-Gm-Message-State: AOAM530HVIDnCpnOnmS/eMN7jSkc9tbhH2OzggSS/tN6EjZEwQ0TzOmL
	EE9ugKnRljFy96Sl/5m2XM0UbvQ7VKAIgA==
X-Google-Smtp-Source: 
 ABdhPJxo0wB+arumajSvk7F4SqMYlpnsgvBQNShCNyVKpuDL0RzlDA23N5sRiQCE72CMFHZ6z/Wgdg==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr21368997wmq.109.1638006853137;
        Sat, 27 Nov 2021 01:54:13 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/13] perl: submitted patch upstream
Date: Sat, 27 Nov 2021 10:53:52 +0100
Message-Id: <20211127095357.1748429-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158857

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch b/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
index 7d5c079b2d..1acf3ddfaa 100644
--- a/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
+++ b/meta/recipes-devtools/perl/files/0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch
@@ -4,7 +4,7 @@ Date: Mon, 4 Jun 2018 18:33:50 +0300
 Subject: [PATCH] ExtUtils-MakeMaker: add $(LDFLAGS) when linking binary
  modules
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/pull/405]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.20.1


