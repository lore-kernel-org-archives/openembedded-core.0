Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AF6C4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.8704.1637163335866428077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ojZPRwqF;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id r8so5480226wra.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OhsgbigaBV+1K/AdjYpnAJnW7P11msBC5+teIBT8Rhk=;
        b=ojZPRwqFCGT12b1g84oN0NXTOwo7RfUgtOpdU3MsoLw5Zt2eU7KO2GWIwzhjpEwDqg
         IWKoo5IBnnxhC8j23ZATaZsKG7fY/TTPVA+QC6GhERKguL1yeM3raKQomLo31v8Kf0Gu
         eBevfQPtquoSbneF9i9WDEh+T9BynFhDiF61gbQtfoLPy2nxs0OPIdc2OKqgN9/n6/7n
         YbHFvY3GwRJLu7cPVkQ9KU7pWuNXBG4FGHo9RyVSjp5Q34X596MAZWaOCV6mo990H+lX
         YZJqAt1WcAnlRLP++nA52Q+6FJZScrFYtcCIeKx3AMZmwPp2WggTdkYjooh4sf1EkhR1
         NHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhsgbigaBV+1K/AdjYpnAJnW7P11msBC5+teIBT8Rhk=;
        b=7d4xjU6viP8rPRoYvawJf/godIDJfuJWogSZ28SbjPUgvUH2Br+WKOr3ogo8cNaweZ
         psZhhyp1Nrwvz8YZPN1odij5eKir+gQ28LtBNhLFV2QuxLClrbWKMYi8jXCAe/Nnxmjw
         JwjXMEIUyMBCN95k0HdgFMNb36IuF6iY5qGg5b1F5CWy2hJVK9lVPx45kGcADqZuT9Tk
         I40XvLHngW9IhmD7gI4RAnOCfFsYs2wli1UrhfvoDLiYSLMRBFX5fXmtrqa8QzafEa7m
         QJPQUUIehUxMSmr9J1dHpbnhIknvEBwgqfxzb4SH7W4Xn6l11HPg5yQNm5H9xHVVYUtC
         PHnQ==
X-Gm-Message-State: AOAM533PVOaGAr+5awoJSkCF93l+QT70ZKwf2J294H1mOIVq8Fe9WjH5
	CzU/Tfut4kuFT0D3XjXFU2t96c+fNdQ=
X-Google-Smtp-Source: 
 ABdhPJxCK+fch7x8xyTi5nQzYxlgDjQKHtSWNrWpvlKXZh3nk0rdhPCKAtYWyCBECro6BFqbtkc/Qw==
X-Received: by 2002:adf:e0d0:: with SMTP id m16mr21112157wri.74.1637163334346;
        Wed, 17 Nov 2021 07:35:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/36] python3-pyparsing: upgrade 3.0.5 -> 3.0.6
Date: Wed, 17 Nov 2021 16:35:01 +0100
Message-Id: <20211117153525.257146-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158407

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-pyparsing_3.0.5.bb => python3-pyparsing_3.0.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.5.bb => python3-pyparsing_3.0.6.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.5.bb b/meta/recipes-devtools/python/python3-pyparsing_3.0.6.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.5.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.0.6.bb
index 6f2c7f6cd9..d15ff33e9b 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.5.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "9329d1c1b51f0f76371c4ded42c5ec4cc0be18456b22193e0570c2da98ed288b"
+SRC_URI[sha256sum] = "d9bdec0013ef1eb5a84ab39a3b3868911598afa494f5faa038647101504e2b81"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.20.1


