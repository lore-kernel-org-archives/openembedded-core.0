Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18150C43219
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.22666.1638602013009896230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=duNy+xwu;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id l16so10495547wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sXpJmGYdmxegvdi6hqkHLBgfvtpl0ivS/ISwxHazDxM=;
        b=duNy+xwu3ek/us3BcUTCY17FnkEf6yewtGFQUr6XtfGi4Ten+ei2ECF2sz5x+L6w2O
         HHbfLt7Q67ZB8llKS8vb+DIUpnPPV8hIedQWhrFnwKSm2wv5zQEkplQwgpXxgpPbor67
         7zBTHKdGxIrTTn717CNt2UnEemCVfb7v/pMbCatdxYXZGotMjjCNIhDbU2G0hyghanpB
         alo01aAaK+448eDch5/MG62ZlSMarPMjb8JKygjnux2ZYDQSKLvB3qWaq3UqKzAg02Ef
         AxxbG6iJCCtaR/pFivoeU+/XRFPW+5vCA8h0Ywacr5XlaAH8a7gB6zda4KSEWPjikd3i
         FVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sXpJmGYdmxegvdi6hqkHLBgfvtpl0ivS/ISwxHazDxM=;
        b=dzV7jnbfbVOOa6z36u9FAsl/jDCzidcOhcGFubw8vqhyShV7boY/0M3s8Eg54px6ue
         ljH7qR50WyH7z1X6W6QZy/nlvPa4febusHLyZl12ciN5+oYAGTINL23pjVOk0sFrVpK/
         USltzUHJfeSWzeg4A7iRx34U5S3m6uhlBt5yGIrnVLCSMAGqo0EUlX/D0hNVskqwzRck
         c3Nh/nA1ARwS8L8hvl97Q4Zno7Jlp3N3ELkxrV78H2ibJ55qkS7wPtyL1U2qbIwAsqu2
         NMeeyNjuOs5eaDwBf1s3NRQM4U68kaxhQNQqkKqMXnMipihl+vQLpjg4Swr1gouSLDov
         AD5A==
X-Gm-Message-State: AOAM531mQumPsmMSYzUTa7z9LyVh4IKBz5DG2nmG0At9y8B3lIHtg+Cz
	rmF6Uu4om9WJQDXpNEsfjEkvsY+jRLOnMA==
X-Google-Smtp-Source: 
 ABdhPJxKPi9q0fFi1ARH4lFg+Y3rVm4nydSA0X877NZc7ZAinUgjQYp8wYXdZe8YoWIFcUKaKLQslA==
X-Received: by 2002:a5d:4f02:: with SMTP id c2mr27607059wru.496.1638602011667;
        Fri, 03 Dec 2021 23:13:31 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/26] python3: mark patch as inappropriate,
 with better explanation
Date: Sat,  4 Dec 2021 08:13:03 +0100
Message-Id: <20211204071323.2480163-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159153

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Makefile-do-not-compile-.pyc-in-parallel.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
index b1bceac512..ea1efa9cac 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
@@ -3,13 +3,19 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 16 Jan 2020 12:34:20 +0100
 Subject: [PATCH] Makefile: do not compile .pyc in parallel
 
-This was found to break reproducibility, and produce strange file ownership
+This was found to lock up builds, break reproducibility, and produce strange file ownership
 races.
 
 The upstream commit introducing the change was:
 https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a41504
 
-Upstream-Status: Pending
+The build lock up issue is reported here:
+https://bugs.python.org/issue45945
+
+The repro failures are documented here:
+https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211130-yr_o1a8d/packages/diff-html/
+
+Upstream-Status: Inappropriate [see issues above]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  Makefile.pre.in | 12 ++++++------
-- 
2.20.1


