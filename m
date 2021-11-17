Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7337CC4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.8736.1637163346094353621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f9oSIDF2;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d27so5491701wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1jgFiKXUwwBhKnopD42YGCxhgNADQFKv9PzWYV6JsvU=;
        b=f9oSIDF2PqVoHZGI5SM6I08584nDSZUwRmCj/ytA9c7LDkcpPzm58jLq2XwaWYhHc2
         XHwbDL1Yob5pbUEiJ8IrMv03kIriB65vyYCkNK6AlpOZkRjo2GvSL6fzyaBi1i4FFW62
         8uIBe8Z77i02Nx1jJMuf8OTYT97p42p7ix2x5tetsm7uN99ksHeDjv/2ojCsU4RH53jr
         GzyKCVrkIxLKcXtuMMkjAeczJYyb1qgLqEtWVsZMLd09k2Jz1KpLhJkbe8gsfa82G6ax
         zSpIUykY2JT9jq/NN7tVWuGF33cg8xWH8meRQU82Su8UWis7xySbwOqu8WpPO6dxBKVH
         PPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jgFiKXUwwBhKnopD42YGCxhgNADQFKv9PzWYV6JsvU=;
        b=AJGHySIWj9Rl+X98QSGLZ0+jLg4Fz94vTUF495kR3E9/JvrXxF5VENc8+op+Ts58+F
         LSB6TpcCpDNMexyex9Z8YUbgpZ9IdN0AEV7FKkDYvEwog4sBhsPheE3iQCRSR4RGMQBT
         9BVF5deyoT+1+Z2vWzq291FKiBuTq4bQbjxbdMpIQqPUJGmpb/oFxuRo49k+rHRBZ/EY
         LWu5W1OA1BLbd5813DYXzJYg1aDnGN0ybUXAt3uVrZq/3vdFvgfRMgNR9fpdIqrjmK+r
         JWqBe+WXCYBpdVgdwmJJdK8A5czzBhTjf4yHhm6fBRS78zSo7AbXE0Bs1rJ2aQ8KV7WR
         gqjA==
X-Gm-Message-State: AOAM530n16WnaxGkY+KFAG5s36p7ASHNk0Z1/JFd4HshjEB39Lc4oCbu
	g/gwAMTRjwlcobv5zlpiDruMGJhjN3A=
X-Google-Smtp-Source: 
 ABdhPJwSqslN+VdoJ0eYnixxHnq3pwItm9ZdJQsHJ2SakhFsn9/3DmCQcMX7AnSmapB2O6sH6ckx6A==
X-Received: by 2002:adf:f6cf:: with SMTP id y15mr22281354wrp.56.1637163344737;
        Wed, 17 Nov 2021 07:35:44 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/36] libxml2: add missing Upstream-Status tag
Date: Wed, 17 Nov 2021 16:35:15 +0100
Message-Id: <20211117153525.257146-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158421

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch b/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
index e80c46054e..66694af388 100644
--- a/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
+++ b/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
@@ -9,6 +9,7 @@ folder fuzz. These tests are not required for ptests of this package.
 This patch removes the fuzz testing targets from the Makefile.
 Otherwise, running the ptests will fail due to the invalid directory.
 
+Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
 ---
  Makefile.am | 5 ++---
-- 
2.20.1


