Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747AAC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.8804.1637163348410638240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TZ7qUR5i;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id w29so5442298wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CpavOp9AW6P4enkg8AQ+2CsdjhVtAY2Ub8Sdm7TEjBI=;
        b=TZ7qUR5i6kO6oBjfmNCMbZgbSHiVS0pn63mTT2TuGF3XviV2sjGu/CEbpfYB14XgQ9
         AGNdivz1LktfxicuWvJK4fr6XJ83aF13IePYgc9ldsa1JzHXwGBRBflhQrlQ9Y9CpcjW
         rzWMKWM8Io63Q+69FGFxr9a2h/U2rSaSu0P+cLunrqHvo666ApQTCWmbrN16S44wyYKP
         bBJotAXrwKzkaadw3lDoWSCtn9wa4fonFjr6PU3yepGZ8godhySyhURIKeO390nUKZZ0
         GpJeabFpdQ0eOBS4KPL/Q37uEpB96bl74umw1TyAZSQVDEXk+/jrmydP/DUkVMn04QYT
         cpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CpavOp9AW6P4enkg8AQ+2CsdjhVtAY2Ub8Sdm7TEjBI=;
        b=VGl0CNe1WnFvVQ4VB96QHTSskGWmbge+9ar4hV6dpsB96LEHZklzaOist3nqdpOWk4
         HN/0sk4l3+Z9tK2qG5yolieddwtDA3fJMV9aQwip4eQEiQEdcdWkyKV1vhV/93yArXY8
         bEItnJ5LBGgtQmc2PoAJTb+pT/TItI/MbuIv1nU21cb8xXFcbHyy4nR/RsSqhELuNbcP
         /dT9ZTuG+TPdRgDh6Tsfxdmfsne6xHEnwxeD/ckenpnKC8CjJEQ4sPiq42eeSLRTxKzV
         eXZYzY8OPmv1xwJZeaPj3pF3TPs6ZGkyipBnYoyoUqszoIW/kUgucxeP16za6S0y68SB
         Q1lQ==
X-Gm-Message-State: AOAM530IXjY0WWgDlucj8U2Y5gdPh6/rC39W1jBoKIwJhkScQkZiXOy7
	KZdbtLNdHVCE2oOCNEQS1OaORUP5q3k=
X-Google-Smtp-Source: 
 ABdhPJxtAaJ2MP7sJbSML/ppMmiallDeoZgWEJ4DiD9YeAj/nmLaB63AUCMWBZMUee/X9OyRmnLUMA==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr20839123wry.347.1637163347055;
        Wed, 17 Nov 2021 07:35:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/36] kea: add missing Upstream-Status to a patch
Date: Wed, 17 Nov 2021 16:35:18 +0100
Message-Id: <20211117153525.257146-29-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158424

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 8de9fce4b4..78f475a495 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -12,6 +12,7 @@ Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
 Because they are all commented out, replace the expanded libdir path with
 '$libdir' in the config files to avoid conflict.
 
+Upstream-Status: Pending
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 ---
-- 
2.20.1


