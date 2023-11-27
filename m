Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6809C07D5B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 10:18:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.91955.1701080290773491984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 02:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LvKozGBb;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a049d19b63bso551044966b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 02:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080289; x=1701685089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/jaHwXAkT9261tMGlpvO4uBG0O6r/FhCog8Iyf0hyc=;
        b=LvKozGBb4T2qG7WG51wAzhFipj7qnLUVljp+4pXNQIEWq3wy7mPi71F94NQl51KoWN
         QlvSWi9tAT4Mi8X3Sf4fzRi952WqKeCZqkuV8rBFHQ3tmdxQE5UPbAS5O+J49pWYYIfC
         nqXzEB9G2YlsTSW0/RSyMDQevQIMBiJdi49ooH4FvAX3LwuX3goKFns5WH8GMAZU4WoY
         dC1sAAz7Vl9chRXWJAmIMRBU6BKFpB/Zb17T8q2usLTn09tO8v1anV6QwAGxTpvnj+CO
         tjpw98ULj8F6t9jpJ/0J1yjhDEiRz18VS4t/QjuQWYnTyCa546mXtTBQnGbWSqNshE76
         7tFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080289; x=1701685089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/jaHwXAkT9261tMGlpvO4uBG0O6r/FhCog8Iyf0hyc=;
        b=FBRy5w0OY/ldi7n0YZwhLTrja4utRQ3DOrYXXJfl4Z/Yj6UvHm38ge8h8iAt7d/yP3
         q8KXArckQEcMsFUJDMuPqkCJJdmvzb+sA/K1t0fAZ6a84ApA83XR+qIfflnsH1/L/nuX
         isT3xVuhShjZBC+gKrFv+8tg6Bww7WeLo60sQa2ArXJvpdSO6aeXpo0ZaVF2nrqMujCJ
         l93TR0G1rTWFTk3tLuQUTC5c7ZYddRZwKa1xWhKKLygJTenkMw6X4TLOeSpG3Rk0NosQ
         DZpPd8ynoURutTLmNGLGLfjFq2ibhZJDHmuhg6eUpuFcHXDO4HS3iSWK8bg/TcPzjfs2
         Yg/A==
X-Gm-Message-State: AOJu0YxfXlcM9t8CmKE6xO0Ot55IhYZZFHq1rmFeHRFr5t7uqBamCZnS
	Lo6wG6oAZX7ySFyNK8vRxeBQdnrq0uA=
X-Google-Smtp-Source: AGHT+IGhaua8s4zCsdEMtJSZLQ2030ZiAwqrwfbKBzHUfgv7uS3oYw07U2+usPLqQ7MShoa9kSUAfA==
X-Received: by 2002:a17:906:41b:b0:9b2:982e:339a with SMTP id d27-20020a170906041b00b009b2982e339amr8288904eja.22.1701080289268;
        Mon, 27 Nov 2023 02:18:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906585a00b00a0bf09c9483sm2757203ejs.35.2023.11.27.02.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 02:18:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/19] repo: update 2.37 -> 2.39
Date: Mon, 27 Nov 2023 11:17:50 +0100
Message-Id: <20231127101751.3187950-18-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127101751.3187950-1-alex@linutronix.de>
References: <20231127101751.3187950-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 10:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191285

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/repo/repo/0001-python3-shebang.patch | 2 +-
 meta/recipes-devtools/repo/{repo_2.37.bb => repo_2.39.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/repo/{repo_2.37.bb => repo_2.39.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch b/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
index d3888c8bb2a..fba89a32d82 100644
--- a/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
+++ b/meta/recipes-devtools/repo/repo/0001-python3-shebang.patch
@@ -19,8 +19,8 @@ index b13e34c..205e0e5 100755
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding:utf-8 -*-
  #
  # Copyright (C) 2008 The Android Open Source Project
+ #
 --
 2.33.0
diff --git a/meta/recipes-devtools/repo/repo_2.37.bb b/meta/recipes-devtools/repo/repo_2.39.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.37.bb
rename to meta/recipes-devtools/repo/repo_2.39.bb
index d6d3d03a623..a0633a5cbbc 100644
--- a/meta/recipes-devtools/repo/repo_2.37.bb
+++ b/meta/recipes-devtools/repo/repo_2.39.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "83c66ec661e39e47795086a5d26d0f3782ac1d49"
+SRCREV = "b99272c601bc5f466c3cfc782bb852c2c967ad27"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.39.2


