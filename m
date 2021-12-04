Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14666C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:46 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.22338.1638602025103358074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J/dtnp49;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id u17so3212460wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6C6wj0D4ZYukNZBzMB1pNM3o5zRi4D/RorOztBKNMaE=;
        b=J/dtnp49VVGGfo0QZRMgNM6/UAmPNRzb20CPc1v6rmWy0GUOuQYiLp19P5OgqXT7P0
         nM7HofX9T+y4+ytyPNCkk5fpp3ZsXQHVEzGwRiGjYovFufSi8K4xU5C3SB2s0nSaM1MA
         7/IEvsFZa64YF8geYe6wAzq8mq+TqMYCvX3FXUXgBHaPSyL00GPcVZSKgZWaXDXMKkhU
         eg1733nnkwkOAwx1vvN0ywQa+bxka99kH8UKHrGabF4W/Il7HcdloLtyLMllMm1N/wzT
         13lbGlnY8d5XGdsiPq+GTyijzR8nVc/UYNBACwykFQCAuLo7vqweBeUZh0ITBsZ3sHEf
         1iZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6C6wj0D4ZYukNZBzMB1pNM3o5zRi4D/RorOztBKNMaE=;
        b=SbnjqZOTaITXgQy92biGPwXDzvcYGm4HCmHsWL3G828+HjGiCZ7QQw0t4LsmD0XjEz
         OctdIUu/0Ekqo+onLbPiIv0tXjuY/Av/nws47/Nva2YcJd7mM7jaEKiwuurD3OVdvc89
         8d7RqycVn35Y3lAkhlA8CfNPc0oKcKvuXpaoVikKeMu47/pD5PObDpnuBZgwg9ljg2z2
         K4SpHzyrOMsp9wT4mRw1sH2eHsNueWLgGCh/aqefsbJte0R5USYxozZJmANhnRf1OINx
         BCPIExl/li548cpPfyVnGnOKnRDXgOISbLOy1tgLG/q5nk5ijyoP1yN1IgfwQDQfb+By
         4/fg==
X-Gm-Message-State: AOAM531ppiTL1lDT9wybcVyt266t22BzBnphcagoi9sSEZdYFv/NQsLD
	iv5bUvOfjI26Cd2pYPXcS2k2jS0XSPxSeA==
X-Google-Smtp-Source: 
 ABdhPJw6b7HR+Rii9r015evVlol3dgN4hO5KhLPwR4sd+Ja735xgz/eJbhnqZpfIIR97os+TpQ2OJw==
X-Received: by 2002:a5d:61ca:: with SMTP id
 q10mr25814732wrv.102.1638602023774;
        Fri, 03 Dec 2021 23:13:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/26] libgpg-error: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:22 +0100
Message-Id: <20211204071323.2480163-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159172

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
index 0f6e309391..ef7a7df1b8 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-configure.ac-do-not-hardcode-gnu-libc-when-generatin.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] configure.ac: do not hardcode gnu libc when generating
 
 This erroneously excluded e.g. musl libc.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to gniibe@fsij.org,gnupg-devel@gnupg.org]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  configure.ac | 2 +-
-- 
2.20.1


