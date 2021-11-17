Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7164DC433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.8734.1637163330621796493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N+ffKXTL;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id t30so5458728wra.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=icVjwOa4OxSYNwLJt1pLDzaGd9UHMoJDlEw7wqpUvqE=;
        b=N+ffKXTLp9doShtNpT90Ei8DCbhxFWOjF13DoB709VR4JhW2zJxsJbk8hzj4TGN+C0
         mgHAQeVFN7k4d2mxLJF5U4FcrrCoyAj0N+u26sEcMlUohwGeHqQid+L2iVeuGFL4LMOe
         WdErdOktE71Zz89cidQNTHGly7R9PTeH3Z4+YviIq1ma1cmcq9GSm0WNYsMN2x/uwJy5
         qSUsNBjVUk1t301pf/goJVs/HqcJsav5W0ACS4n9s2301S2s3nZF3t1IN94/7aSt55it
         LJZepohXwZ3FhVbYFXVnONvdWAwTeZsPRGy2jhNeVkntnqpwd9ITaGC7B/eHIr+xY7jg
         d31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=icVjwOa4OxSYNwLJt1pLDzaGd9UHMoJDlEw7wqpUvqE=;
        b=IhQQrhVrs4F2NMzyfhNbkiLHiJWphxe0rV6Ouc7T9FQYBjmjZxULnUC0Dj0cDEFMLd
         2PpZjPXclNR+UjZg2KmmoWq2vPJGuWCSJ1Rh8Xelsga2ZpwueRFVYhmbKvDgZwDgblek
         Og/LkWc7BrDxyYuPb9HHbH8CKJQ/ABhdJYjBeDHhGQTgxszDwZGJq/A2U+1X8J3AFx+m
         TXgyyTX2K6wpolxU/dVSgLjCgX67Eqn2m71m+FBlS0OCdmw9PEjV956lA52c7dfZP116
         elExGlO9pjXQrxCL2mbPpJzbJlYYPLXqSSfjPsgngh9nmdYC3o3H78M0s2pvOAwZMO4z
         2Ojg==
X-Gm-Message-State: AOAM533JrfUifKnoq5Cxt73M8lL6fWVOhKN046X4FpY47iJnppzIfKXw
	Lh77LrEaVCNBbhdz3hWLOqgO5HI3aLw=
X-Google-Smtp-Source: 
 ABdhPJzQF2K5PCCoA6IzqxulfUtDNm3JEenFd1EvDhR2jCODVEbHEe/Z6mTEYNfLxUOwsSj86+Ff2A==
X-Received: by 2002:adf:fa0b:: with SMTP id
 m11mr21083157wrr.152.1637163329099;
        Wed, 17 Nov 2021 07:35:29 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/36] weston: submit patch upstream
Date: Wed, 17 Nov 2021 16:34:53 +0100
Message-Id: <20211117153525.257146-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158399

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-weston-launch-Provide-a-default-version-that-doesn-t.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
index 3279a728cc..548611d933 100644
--- a/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
@@ -11,7 +11,7 @@ Since starting weston as root is a valid use case by itself, if
 PAM is not available, provide a default version of weston-launch
 without non-root-user support.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/725]
 
 Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-- 
2.20.1


