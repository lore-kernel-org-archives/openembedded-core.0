Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E79C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.8699.1637163329190312107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M4yiBA2f;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2423269wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IndEacGOAj6imIuNxvipUZS79utYWj8ZKBPHHszUveg=;
        b=M4yiBA2fGPSfJ1Dt9xbB07b86bVRwFzfa/3qBrSd0/SSz13N/LG5HaorC8elKWQ6By
         10xjWsbaYacrBQHJbeiUm2TY4bj9FykQOxBxPPn3UpncD+2nCLPF7GJQ022rPXmTzbJ+
         zbYAZAnLVgIh5MPrs2Wf5HcVc4oMyExogTMtxZwgJTiHF/9TBk8A/yxH33ACCQS6yPmZ
         OTv/kp3S58k+TCBoCNrzmWhdXKkonT6PA1EUDBcdDFPUOGa9uGsrkoSFcKFv1YaYeleT
         rjyjmAFCEPAd0gSk94sVc/+i+DQ3W5lVvDQhRcYDYkpSHXX81i3kA2Pj5GUGip3HriJm
         tymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IndEacGOAj6imIuNxvipUZS79utYWj8ZKBPHHszUveg=;
        b=CX8/1d/0g59DNjIn30e6S1ALIh7aDO0VT/YG4t9FI30E6XYmV24sxsVZ9owaeGtLss
         KDnWeVvep8uq8N0S/maC2tpfQJWcyAZffYW505zR8tpBHYc3jYWLG+gZ0dUSLJyJtRvi
         WdMti3LlTDiR6t8iWEppqMk/LOcNYTG24ERDrB+RoLkMJuA+CQkjOWXZpl37w5g0dA9o
         wQaNif3UxoRrLLXoleij+rgueC4ChEnaYImcCBGI5lKIfVSMmsIdWfyugrWOLC0b96Sc
         N8tgG5KBKGQDxjzabyGchrlZzdTrtS0/NwE598z+uBh+A5U0QyxkENm7brNEDZhuXM3F
         CRNw==
X-Gm-Message-State: AOAM531PXHF+sGrflzjJ4Ze1ImHdMNktawrA4uTrjgaWJuyEQZHRqwaE
	L9ryeRgZwm7aJ76VNrltoB/pae+nNOM=
X-Google-Smtp-Source: 
 ABdhPJzRDqm3Hnz7ufZksvOkb+YMjxaDH4lwlIwFNsEyqX9HIO3swuGd6QQ3UKCaB+MbqZsIIqrFgA==
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr621421wmk.91.1637163327802;
        Wed, 17 Nov 2021 07:35:27 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/36] groff: mark patch as non-upstreamable
Date: Wed, 17 Nov 2021 16:34:51 +0100
Message-Id: <20211117153525.257146-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158397

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/groff/files/0001-Include-config.h.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/groff/files/0001-Include-config.h.patch b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
index 46065bc513..34fca1eb2f 100644
--- a/meta/recipes-extended/groff/files/0001-Include-config.h.patch
+++ b/meta/recipes-extended/groff/files/0001-Include-config.h.patch
@@ -20,7 +20,7 @@ In file included from TOPDIR/build/tmp/work/aarch64-yoe-linux-musl/groff/1.22.4-
 We delete eqn.cpp and qen.hpp in do_configure
 to ensure they're regenerated and deterministic.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [issue fixed upstream with a similar patch]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/libs/libgroff/assert.cpp  |   4 +
-- 
2.20.1


