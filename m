Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D2AFD4F1E
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:12 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2600.1773168071284282971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PksrJPvq;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-464bba3a9easo8798331b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168070; x=1773772870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=PksrJPvq7Kw4ntdPWSal9fE+quReE5rKMHkKSotylTQG/6Xl+c/JI1NUlu2F4ljZ4O
         zi4xhNvmi/5M9qsHpcTnDhsyxdZqqh0y5SjGz/hR/xW3puLgBmiC0ioMQmUd9hYN+RR2
         JeUJ4L/jRS1DZY1tRZEodlxw8cDA1pjwT/+OVLE2ckiNiwreHnOdFjt9y0ODuHY2ygzI
         L3sUoK+OCEk4dQndsDYJAYlpQPCQbK6GYFP66dK3EeHBwqzJC+b8C6cjFcB9vKvKQmYq
         DYRpeGj5zqCI1uEgrc24E8B0j2J/C+S7bFS4Jw3f7TV+izsop8tOYrYqkIYAW+2kvxfH
         9Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168070; x=1773772870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Tj4cGGvEEbE1QT7Q+4TdJLcoNUT6Vuz9fhKtg+CMko=;
        b=LzgbBj2dpVF57EhSNv4XahH/pSNctkL4QdrN1Z60SzuVWKDwhrJpk9nWgzgGSbgpHm
         ApWnVnmSUmlyLuLAhduqheuoWYxVmekfDZkdRG3hZcZhHyVwYAhSExOKgh80jmE7b1/L
         n2ICdQvvWRiiaMubCqsfYozbv46sOO4nHDLXFtd3Ow7SqO/yl+wwy8oMtGd/Mj5VCFfl
         pbhSKpBnH1xhrTIWl8WSFO3FtTB1fAkUr5M2wPZDsTYB1d2bMjcVoYbLYdEtCqOi6yd9
         TvsKD8aYu53HEUrO97xOH2ct3CPwEYba7vh/ilswWCb9ljpDywR3Csoaj43UUkYoTJ9K
         70LA==
X-Gm-Message-State: AOJu0YwOK70clTjzeced+7/V0mrkKxAA4y6McLBuE8Aa49WLfH6niLKy
	3vnvOGcnYeU14wZiLpoYsHC0giU0fX9lFhvZD09weKO5g7KJHXo2hnoKLyGYww==
X-Gm-Gg: ATEYQzznalpWqqppTUsRGxLseNDmC/ftyUHHHsvtHTMh5413ID1COZ7zlgKM9lHR0z8
	t/Z7NsyE83oZku4HPVWq14MniQPWqrWNJUxpJ90+755fVVCZFgpRSPakNUfJqBaj8BH5RV8tY4v
	cfKVCRtlwNacKyMMXYqb4Kwu5s/7EDhAdKcFpnBfrk6ME565GPrA3vp8GOot3WsYIVDinvRmGDt
	usqEsHaqTu1li1xw7ukLxgrhAPh0GL5ScUVlQHbfy7d1w5MVA370X7BMD1AXsG3n0EiIWaUA/6s
	EWdkpFBTrlrxN9G+dbb06YBZVmaYthS+AK4vsGH7bC4aEeXgNJ8YVMg6rHHr/TxA3k3WtP+b4HO
	Q66DmZMc430csB+JI2YDgq9wBRlP589UcWqBUHRbVh4Cj/loqc4x8NJljaom9g80ZbA9Tt42ESX
	ryBLj3tNAy1dkSqZpG9yeMQQfILk4JIUU=
X-Received: by 2002:a05:6808:e88:b0:45e:e088:5f3e with SMTP id 5614622812f47-466dcb7230bmr8985372b6e.49.1773168070428;
        Tue, 10 Mar 2026 11:41:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:09 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 08/15] spdx_common: Check for dependent task in task flags
Date: Tue, 10 Mar 2026 12:38:28 -0600
Message-ID: <20260310184058.533343-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232819

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


