Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D1CC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 04:03:04 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.75260.1717387379355144834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 21:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RhSsOqEL;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-794ab28c3d4so308670885a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717387378; x=1717992178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TsCW1Cb8HAFn1nJf9uUuWQdPYYvrwARYNiLCvwk6P0Q=;
        b=RhSsOqELbAfOgfiae8d+Yb922OMtGbjM2nCPYiDneIf7yLRPlSanBzXwdFWat5Vyg0
         nS6efD9gpPAXsa+QB514eQ/Uve262PP5QV595TFxa1jCIXjDUhRyDAi+pwvwZ+jT6887
         6JBuA7GK6eOUqmVruXJj5+am/lV6lobIQsdcB52t/15UGWSogipgh8KwS8nsjYl/WeW9
         q5uOQe+Qdi76DgtTjvY6Oyll4o0bNEfrC2/q8XXMYI+vufpNRhBZJ58wCVa//QPFWBV8
         5qLiHf6RsteBVSvWQh/vtPXuJ2B/8ko5JyWQ10uPomxq0Th4o2QTna2j/ALzS3sS50bw
         SqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717387378; x=1717992178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsCW1Cb8HAFn1nJf9uUuWQdPYYvrwARYNiLCvwk6P0Q=;
        b=KIEH4IrRLpqJOVYmx5R3+dgr/e32kaPYKES8alLp458VtCFOFLjmwJxH/UvPhj95KR
         DG2VOfNgHxC0n194gPiYKi+WePme692gCZCJU8kQ0fTZfzvd7TklHUiGBQv1YAMgVWKq
         tAosOnX13diLWEdZh0GVuVLmPVlSz0q5TS5erifBVGliuxsT7hbaEg6SbRl5/PsopKz+
         TOpzZD6Z0poRl0WdJHY2HFoNfVr6faeVhLjEKe5e6ktgIZQoTHmhCwjJGv99i6FtWXig
         wXUfg40/7lolNZwiMj9LQkTOPMk4WvDt5JHVMeXTXFDdKL/cfNWTAnCnxzsxuC6i7908
         3iIQ==
X-Gm-Message-State: AOJu0Yz6udz8kIMd/tYxbCMj27dPvu/WlGr0PG9qF8EgJZUo3o0E6rzF
	mrMB8rI58EXiWs1zLQ84vR3kIgV8BvUUIWgA/qjeBKhevfzZinKxjQLJSw==
X-Google-Smtp-Source: AGHT+IHgoQsmUETpO16gNEw2+SUigCYfE23pzSxaGm4+8DP9mcAAAZKaKt7vS/TSEbywuyFzyEKiPQ==
X-Received: by 2002:a05:620a:1648:b0:793:d25:7b1 with SMTP id af79cd13be357-794f5c79148mr848893985a.23.1717387378270;
        Sun, 02 Jun 2024 21:02:58 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f3017d2asm245528685a.55.2024.06.02.21.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:02:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto-dev: bump to v6.10
Date: Mon,  3 Jun 2024 00:02:54 -0400
Message-Id: <20240603040255.1520919-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 04:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200229

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index d5cba42a5c..0097fec7b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.9/standard/base"
+KBRANCH = "v6.10/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.9"
+LINUX_VERSION ?= "6.10"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


