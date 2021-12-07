Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F67DC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.66434.1638882432385122922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bNhyX6iZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id i12so10662966wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WbjhWuwhjKnFvToUQcvdA2MJjZIzAA0MWvV9oDbrsKc=;
        b=bNhyX6iZNMjHXfBUP70IhVNPgIk4+9NbqdaA1KlFPF71/TDLpQ381VcxoM7/6H79t0
         12VIiQT5/1IfgsGdsbdUPpYx2H/mQ6Bm/I9TXjmmm2szMAqm74jyalZCNnbd6Sp/dDrc
         fJUGb9VvckVHnozN0sMwmITQ+f0dxaa64P1UTwB+P5H/K5FA7ugTe3TJTmLKnLFvWMsJ
         x3uXy2fH657gLdxiKsi+gju9CecD7Ndh1VJ9V3R86FM/YI0gHZxNUwkehe2pMLj9EwdX
         XULv0tHhCjOVc0C5W3Hnar1xYnZbh2AIQJogfO2g9qaXROkrGBFCf11zc4mLD+JJKNpq
         ASjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WbjhWuwhjKnFvToUQcvdA2MJjZIzAA0MWvV9oDbrsKc=;
        b=dK1LkeKSbaJ/D1m4yQZFlJqICNU+NeI3qHO4hBOXzDHdNQH0RpLB7aGmSoN/NxjgNj
         3z8f8moWUeBkehh+p+FlApw0CyCNSNZO+djUih2xtkR6onaSEgEGOiHFCYDVHEIGYOVF
         YoQ3UbLgdWk/b47ZK2hK/u9GQoJvlIRQzdEIWOXSPC6eZ8TVceLNEY74i5mQDsK4zT/c
         pvYQFPoKt+dsZD2aRaKFsLNbDHL2Fm+2K9PERQ+mUjhcEL7LUBauF/SvnBvVqYrTGoGN
         uQMRrpUdKT3FQJGY8EFKsRGqzsncoVmfvICQVYrA0VFKa89w+wOLMzXROvoCGTDMmPWl
         j+AQ==
X-Gm-Message-State: AOAM530MtARqwEDGOU9OwCmpA69bmdhhkqo2Id0ZlYqUONriBFKvFRMT
	MQssKcdnr4C+I70Dk8VZcPQaaCu0Vgdktw==
X-Google-Smtp-Source: 
 ABdhPJypUWyDbGnKl9IU/DnYyhidO/CfMwzNbMnTGfa6z1jpzqi3MMGI27yuORv5Tl9tpsQxvOJ/Ag==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr6905888wmb.82.1638882431034;
        Tue, 07 Dec 2021 05:07:11 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/16] serf: mark patches as inappropriate for upstream
 submission
Date: Tue,  7 Dec 2021 14:06:51 +0100
Message-Id: <20211207130703.3196805-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159290

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


