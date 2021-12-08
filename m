Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5590C433FE
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:02 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.3074.1639000801746433221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UwPtdr8s;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id t18so6449954wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WbjhWuwhjKnFvToUQcvdA2MJjZIzAA0MWvV9oDbrsKc=;
        b=UwPtdr8sN1xKU5bHAXcD+3F7hk5IGJn4VACsBcQCWeycp8JBataYF+8b4KXFX0qVQk
         a4BVDAdWQ6B94IjNILy0IllcdVSxJvyN6KRF+PzCyNuQis/Su8gMDnA6bwF7YJM+VinV
         TaC9bXkvbO7N+LYHKOYTLqR6n9akeS28FS3IUkD/+ieDtGy2TrxuHqRZ6jAvrnSMDkp5
         UrEaQmUSc60w1OShXitUDUnzLaKMgiSfGwHfG6N9tW587++SrdKa8HR0rJPcumgDddUH
         a2X7PaAJKD4wcT5T73gGBUYV/uFTCuZG8pgGCjmyqloQUq3wpHFgV9Inqo8UBgIErdyL
         PJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WbjhWuwhjKnFvToUQcvdA2MJjZIzAA0MWvV9oDbrsKc=;
        b=TQ7C9xNEOYGXvYzIbzu1bFNC1Hl2fewAQ9g44Xq1S8IFqIhekVGTbDOozP86F3xRTz
         EpCyMcACcML0LvBWB1/eRVzxX/IHw8UaPzvmC/ysFQu6cRBj/xgTgQj9AakIefoFaCzh
         RWRWdsrxK1nBmjtUBK/CWLI8WJ2VSrGVQWs3ik1g6SUzH+7pJA1tDNcoYBhoSPX2XhhB
         9OFaH9RzVixwqq0brRbJjfKleCmBKdJUbOqDPtnPk6hDMD8dfTp7gOIGd5CQ2NQV5bqb
         YdXGwq9t87BCWYsyKHkhK5Zi0WmB5ZKlepj+Y7SX7BsLH0xQR+gem3cljeUOYnbhINTr
         F5Yw==
X-Gm-Message-State: AOAM532VAuL9Qy5tSa/h3pfG73ZDI70l7+K+DFj4GRVE+vYY6v4bVQHs
	Uoshn88PWps1DvyRGut39WNcpCnST76iSg==
X-Google-Smtp-Source: 
 ABdhPJwnF0GzbCihi+nw+aA927VyCaPZi7t8xXE+eOFWSnbI16rxTsVw8PTY2cfATQUZ0FcJXpysig==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr1554056wrd.373.1639000800062;
        Wed, 08 Dec 2021 14:00:00 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.13.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 13:59:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/29] serf: mark patches as inappropriate for upstream
 submission
Date: Wed,  8 Dec 2021 22:59:23 +0100
Message-Id: <20211208215947.1979470-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159371

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch   | 3 ++-
 ...p.creating.directories.without.sandbox-install.prefix.patch | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
index e6172ef5aa..5b8fb70639 100644
--- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
+++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
@@ -6,7 +6,8 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
 Upstream removed it in
 https://github.com/openssl/openssl/pull/16004
 
-Upstream-Status: Pending
+Upstream is defunct: last release in 2015, last commit in 2019.
+Upstream-Status: Inappropriate [no upstream]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  buckets/ssl_buckets.c | 3 +--
diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
index 91640d6044..cf00dbf5ac 100644
--- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -31,7 +31,8 @@ ERROR: scons install execution failed.
   and the installed paths (including the paths inside libserf*.pc)
   look correct
 
-Upstream-Status: Pending
+Upstream is defunct: last release in 2015, last commit in 2019
+Upstream-Status: Inappropriate [no upstream]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-- 
2.20.1


