Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197C3C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.22426.1638602025755902530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Irhte6ie;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id u1so10465740wru.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dtsCI+MvSszhd/kvRO/kKjTU2mXKIHuCjxFhDlD2FyY=;
        b=Irhte6ieW4QLfsx/8slF4SpJ1EJtvnKc1K8WP+qIGN0U0Uc+FvguO/saz9fRX7vBrc
         lxxf/zrsKcI4RPcn0yYqnA5ltPDnHnbVoMxd+rX++3PdxTKALUGS136W4BMAh2cCEUHK
         h4mvsEj3HI6tdLthUKlRxPqqgY4T4UusCA3bh3bvTOSDY7NBmQmfPiYSKf50sfJS8Db0
         Qpu1PmCQIPg9Bh1xUwage7JS+IvXSRLiZ+9d8SlK2g0E/K/bs8iQ2NR9kyUYYBh2Br4i
         4zq/s2DT9xW9TbzSQZRPPEreNinXuwQIrJWamr/EYTY44QdpWkHPZ8Wez8s29BzNxHmQ
         x/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dtsCI+MvSszhd/kvRO/kKjTU2mXKIHuCjxFhDlD2FyY=;
        b=VXnL1QRSH9bfdgdP4yaDNzeYrVAVP5Wj17UTHmlSiTNuJHugtey3XK+BT6DSve/6vs
         UhLfsoAg4wXuY30p5tXaN12WI4jVGdM2wqOQ/C5MBj7YN/t9NM2lakwo2ARpLGt/MjQH
         eaqup5B+FcsmEeUbtEpIhMTV+oYYoX7o/dj5SZ1fSERqD142oSpzflztm4+XIvsgQrNz
         pg//dLF36gnJCCzQqBrYYHOBxn3C3I4XRdO7f59DHIiv3oIGNeCUY+gvaMbH/tNDrDCU
         UnRVhsRd/RiafnL1e9M2+0z8Wn8S93sQHYZ00jQ2xxbEMT97pTrAnmVPNeP5KJnlx0aQ
         gYMw==
X-Gm-Message-State: AOAM531kzCei2GMqVkAWkE3IrGCvJdJBbTD3RpN7Zlk6HYVbBP5s/5ew
	bOcP87kgOBHkbDTKtfCB7QVLkDKO2eU0zw==
X-Google-Smtp-Source: 
 ABdhPJz2zGe7fWckMeuDBBzGvIC579Hp3BPb2bgIfXE8r5wXLQWrV9F2RbTfEfFz//CMW5gQHQN0LA==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr26680650wri.6.1638602024358;
        Fri, 03 Dec 2021 23:13:44 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/26] serf: mark patches as inappropriate for upstream
 submission
Date: Sat,  4 Dec 2021 08:13:23 +0100
Message-Id: <20211204071323.2480163-26-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159173

With this commit I am entering the patch nirvana (and I intend to stay there):

~/development/poky$ grep -ilr "upstream-status: pending" `grep -ilr kanavin meta*`|wc -l
0

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch    | 2 +-
 ...op.creating.directories.without.sandbox-install.prefix.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
index e6172ef5aa..73e8a8386b 100644
--- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
+++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
 Upstream removed it in
 https://github.com/openssl/openssl/pull/16004
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [last release in 2015, last commit in 2019]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  buckets/ssl_buckets.c | 3 +--
diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
index 91640d6044..ba1b01c740 100644
--- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -31,7 +31,7 @@ ERROR: scons install execution failed.
   and the installed paths (including the paths inside libserf*.pc)
   look correct
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [last release in 2015, last commit in 2019]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-- 
2.20.1


