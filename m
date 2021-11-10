Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135F8C43219
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.334.1636573193850841763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gHlOznJ8;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id b12so5925043wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vQOV0XEIraeqEqeZt1Sy1dLVVcJAcbT8yOpTr8kWIcQ=;
        b=gHlOznJ8Ux2O+5VCOBP1aRo8egEyT6NTXPXFyeGVnca1zrzxomkhEbf2k4jnc4Mx2j
         XyQTO8TzTmAZt+Ap0V/lKiFU9nWNQZd/Jh6NnTEA+2rNLfCsFrN/oCqpjz6W2As+hMAK
         qi1vWiSA8Q4W/nvxOcnxKSsX+DyecZXlX6iU25tQErF8Ip5zCV2NQ2/RNPth+IAxvjrl
         Q7gAY1Li15WqjNTKG8IkIv5M1Fu94aJRI0y43zehyHG1cd7yisGVUy1AB1+2LL4QwqRN
         0YzC1iK4dVhXxLgWse7azB9mDLwaWndAJ7YwCWQ4/SOFpaJl7SiWzZtARXMGf4NKd5AX
         YEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vQOV0XEIraeqEqeZt1Sy1dLVVcJAcbT8yOpTr8kWIcQ=;
        b=lve/xbhGhD006a5Ol5pe1926EaWG3VSbTKW9kEK7B4B3bqGzQYputrUvw4Pf7qwZrH
         QQTloqvdV+YwOLV0IIDBB8Zn1tqCx6uZsEXi0d/xKoCQJUJbebwW3kCSnXtXbhFJzeKw
         /JtzsYdu7LKYBFz1tXDWh82xEu7rY+peP3mejnafMg58LLVlw1Fa0uAAl+1Q2o2IP2tu
         1g9mWgckUcd28x8Vw7WyYweXkRQPQhhjxy86iHLgmz7cSDYp/cUhqOOuZp41z8EV22pb
         ocWOBSWQUAmHmqo7/dbITKgyeAfppmAI2WFdM0pKgKYqFvUMSKwfVXRiDfsQPh/DuzWa
         2aIw==
X-Gm-Message-State: AOAM531XjECgBcNzegUKId4cjDeEHWJWMXyhgHm5U+CFYhCFgd+CYPTP
	U0VnP+nDk9hLbTooL+4tLRSnE6H5+hA=
X-Google-Smtp-Source: 
 ABdhPJxFMUbIZt0t+V+i5ImdNBQodGRzgtnvz91ZHuJPHnql39P7DujG/cQOcD+L2Z1+9pAgzW+kLA==
X-Received: by 2002:adf:a28f:: with SMTP id s15mr1801900wra.138.1636573192494;
        Wed, 10 Nov 2021 11:39:52 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/24] python3-setuptools: upgrade 58.3.0 -> 58.5.3
Date: Wed, 10 Nov 2021 20:39:28 +0100
Message-Id: <20211110193937.2606747-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158099

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_58.3.0.bb => python3-setuptools_58.5.3.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_58.3.0.bb => python3-setuptools_58.5.3.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 46546ebba6..c5d6c64eda 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 58b614411867a31cf5f9684a45fe519b8e4f3e7b Mon Sep 17 00:00:00 2001
+From dd77d2f4486079380235ed0466d2eab110f7bdc5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_58.3.0.bb b/meta/recipes-devtools/python/python3-setuptools_58.5.3.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_58.3.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_58.5.3.bb
index 47107ba61d..ddc3fca354 100644
--- a/meta/recipes-devtools/python/python3-setuptools_58.3.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_58.5.3.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "b0c2461641b58fe30e11d4c3dfba316c513bdf9ec85f9fed0c871c678447205e"
+SRC_URI[sha256sum] = "dae6b934a965c8a59d6d230d3867ec408bb95e73bd538ff77e71fedf1eaca729"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.20.1


