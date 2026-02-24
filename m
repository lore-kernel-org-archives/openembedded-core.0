Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27EE1F5542B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:57 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33719.1771974171192882713
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xv+3IsLV;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45f09874c4cso3667410b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974170; x=1772578970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=Xv+3IsLVJlaXaDTPAfMpPoy9a4nm4SHaSvRq3L17KBXZX8YsecXKGbo3oHfeA2VtSr
         AEUbIP52X753JhT5oSJAkkO8xIxO5fCVlp68txmJZCmxZlt89fwz/1vaXgiIWHfqhK98
         T19R5vlqexbsxfZrIzstAb+wH4oyctV1kPxJqe+gCZ54g6Hdk6d9o/P59hdVngRJ4vtr
         0EcB0/Ha/ccEzouRs67WIfCIPb6AAVe4LlUqal2o8aHcuBUtNXcktKpHpROF2dWtL2lU
         Qz14+h3+dRxez5aK2VRwYXkaTyzF4ejKTbCHfqZ5sDbOY1EtQcovngy4X90yTdL8MsG7
         L23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974170; x=1772578970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=LZ1XVCrBNCj3X7GQOE1P6h6RBtGAbehct4qMTx9XvGgy7sGa3YOmSp77Bnaam+H1kJ
         IOBS5d7aBVvkXkxouLZvOzQhgBRaH55P/cgU59EXEDTrVPrjVW3BB3RTL4Cl7nVXLj4+
         9Sck55sMB8Kc48G77VtQ7tryU/oYFX0n4/k2S83YvR+2tLolIqkKhbcmhSwuXCL0YWYL
         /NlF8ogN77rI8IA9Kjd71TtEeAD6HKdIDTlTAg+mkvaK4JHE2E5zs/p3pEyyn81UA9zz
         PsHmoce9tqVvNFaUxhiZGwXPm6xhyen0iVquu11EDkFNLtoGpzddi2mXtUISl6E7MNuC
         Xt7A==
X-Gm-Message-State: AOJu0YwZTUxmvJB0ps4eT0H2azRK6whPxkhgKhbAaOpswzkpRYJf2TGh
	ftJ2x6iZgyBmDc/Rv5r4rznWMfobKv2SoY48EWbAmUx8WDkchxuCpsH8sPLMyw==
X-Gm-Gg: AZuq6aLcNqhRbM9tuy5WlFlvpc1gLp1MB8Ad+tPRAdESjPSM3N15dNxHwStzFzf1yDF
	GVEkS+mEOzd++Y/a33cmvOqdJPAwbwpoo6m541thKc3NxhaU49//PqydcjY2ZCBroYZSDAoRPO1
	IkJ7NqFZFn6JI+aB9geB1sezo6NOUUqbb+GbpUcqT3k2bieIOs6abXgI8qDO1CdQpcw6JAbqGw3
	mLGqEddMLCjKmzuJXJRN1G5U6ogK+AYhUmLAzJrYr8A241hd4ujs2S4eP34XoxKqAW3xC456qIF
	ps0pebdKJjRmZzBK3GXGWh5PtHW0STH9L4A4y0fxTZCR5fifrXZxmTXr9xytwoC1XeC5oMLsu1N
	WLcXTzhl+OrvZgVuJL/dxJW5j9DYq4XxTb3fGlxRdeAml1JF2T/cro5YeXBh0xLhYJkFb6hdbls
	mq4afv08qMNaxoAvtEzRNJ
X-Received: by 2002:a05:6808:1598:b0:44f:8f27:e39a with SMTP id 5614622812f47-4644612dcf9mr8083038b6e.8.1771974170370;
        Tue, 24 Feb 2026 15:02:50 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1efc76sm7912024b6e.18.2026.02.24.15.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:02:49 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 8/8] spdx_common: Check for dependent task in task flags
Date: Tue, 24 Feb 2026 16:00:21 -0700
Message-ID: <20260224230234.679049-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224230234.679049-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
 <20260224230234.679049-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231917

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


