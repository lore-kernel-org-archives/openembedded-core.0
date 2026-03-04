Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC747EF9010
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 16:48:46 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22980.1772642924620212367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 08:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O8FOu8E+;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-41576c5c01cso1432678fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 08:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642924; x=1773247724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=O8FOu8E+gJFK1+xjJc765DnvaMhumpjALSeI2/o2K2jQQ6JCthuihBbMgrnLcMlPti
         tFXLHNVHavcjWHW4nK12TjTkYgIHXbyWJdmK8l0u1D/kZmQwQ+DjHyoMJBqdF2+rbtHC
         TKn4Yj2596lPHWCVBRH+PBhCfmwH+Yri3fOLlelGRNj2NHUZBfOzbe4SwGBe1GGIfyEZ
         4DC1TeqCXM1+UWv6faHGA/WLr0wqdbNbVNfO68n11IqFWn4jiBNwjmBjjNrz4W8Iuj21
         2IqQywMef8rfY7r7wahgeOziddBchKNILmA8k3b/+1A7OQsukFv0YbrS9mzivsS3z4y+
         YCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642924; x=1773247724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=offgqDHBT6ovbK468VxNnjCn36OaWHvXvL8Wcy/q7k4zs6IbUif8QC+ZMSU/ddnaDh
         F70/aX4NRBsDKpWzqFzqxsAxdWQY23LcOBTxzg+NrFJ//b4yKxlrT/LFd/J321ypN8qO
         tdEkwW3BcbsDfh5mMWDN+D8vXFcu/7Y3XwLkaWap0jQmsMjhUz6zR2HKQpN9K0ngHxgH
         rWwjYqSI0TF3UV8ELjadU/ZEmJsx6RMpPYbUlhtyJXdnnZNFsbHScmKvMgy8ZEWJkPi5
         UR9/JfF3avCrKiNES8k0jDdb8fyA3Lo1p44ceiW8zZAvGXAuKUkGthq66JDQ4VkbqUjc
         jq2A==
X-Gm-Message-State: AOJu0YwzLNgQCV48LMIMMWn7Uzc9s/ZMPCcoBGlZDIeanOZpnGoqliiX
	J74xFJG8d8jdQddo9OT/WzWMZYrKKCcVUmgemZpGBTbjAFuU8fRNcoERoAfBGg==
X-Gm-Gg: ATEYQzywtEgorLI7fqf0r88p5VPCqhHp5Z6J2QUY5TiiYTtNGNBQ0kNXgzOb0F7/ipp
	stdoc1jcs6t0+g/4H1eaMozbMkjAKribqeZlat0Ug7/OISfG6lHOpBdrD9Mp0kfsjqnCsOCRBFG
	igQg+t3ADwr3sH5dg4Lq8jCGTcrRH6CNMmYvd6pgF1V9tTksE98ZiaYO4f+Tae8PVUaNXvEypro
	NiNwPDfIlZgOhs51YWWuorGAOPr2MdCaczq9D2kpmo9p/G7KXL4pdzjrsch+zSQTGPo4Dyb/9eI
	Q8bCXEImG25vutzxBWeT6gNUSLzm9I9RBup9tmVNdzeiqH0hKWE/hZi5D3Bwh4rlLs8vAvs5yEu
	sggkXi8lV8F+yu9qvCLUSZSAeyNXSuM4xE9z5GMmm6mEHpzzG1STu6F/pRRMvxLZ40vLGBYQFal
	MHZ/+QKLH3qevMoR7GkdsU
X-Received: by 2002:a05:6871:6882:b0:40e:edf1:4c8f with SMTP id 586e51a60fabf-416ab603714mr1387944fac.20.1772642923616;
        Wed, 04 Mar 2026 08:48:43 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::f681])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm18466442fac.18.2026.03.04.08.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:48:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 08/13] spdx_common: Check for dependent task in task flags
Date: Wed,  4 Mar 2026 09:44:19 -0700
Message-ID: <20260304164835.3072507-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304164835.3072507-1-JPEWhacker@gmail.com>
References: <20260303004550.650726-1-JPEWhacker@gmail.com>
 <20260304164835.3072507-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 16:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232397

Checks that the task being used to detect dependencies is present in at
least one dependency task flag of the current task. This helps prevent
errors where the wrong task is specified and never found.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx_common.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 72c24180d5..3aaf2a9c8b 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -96,6 +96,17 @@ def collect_direct_deps(d, dep_task):
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
 
+    # Check that the task is listed one of the task dependency flags of the
+    # current task
+    depflags = (
+        set((d.getVarFlag(current_task, "deptask") or "").split())
+        | set((d.getVarFlag(current_task, "rdeptask") or "").split())
+        | set((d.getVarFlag(current_task, "recrdeptask") or "").split())
+    )
+
+    if not dep_task in depflags:
+        bb.fatal(f"Task {dep_task} was not found in any dependency flag of {pn}:{current_task}")
+
     for this_dep in taskdepdata.values():
         if this_dep[0] == pn and this_dep[1] == current_task:
             break
-- 
2.53.0


