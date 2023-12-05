Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07583C07E97
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 04:27:17 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.93046.1701750432478967434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 20:27:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCF2ruW5;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4254853d4d6so17732141cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 20:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701750431; x=1702355231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/hfcbW48ipcTyTOqqF00Q2NciPFAlQFTKrvmT9STnQ=;
        b=BCF2ruW5Uk5xZoJj1oZlrI3oJhIgZHhFUfL6OwxdEOhr9fjzS3FHI/05x/TD6e34Lu
         269/4AG0d6nhiQl6eOJYC1HbfD3yYrUWgeWoQMmZRzoMJJnvC73E+c/UQigvtZbIokxB
         sGVs98iKnCvcCyYvUIxfQ+YDviCb41lzYQH1/3w8r8vb/aS0cAxKI1EH8AUZF1+AFfKI
         N3p6e3gNhbe5E/ELmuHPskZE6oyIaOterdlmf19jpq8fLTW/yCmKSnx9wZrnk90IbLsl
         n8/E9gWKETMEjS0GmF62Urvoo+ApAkuqhK7BtwzsEFFGCFNtQdlxodofeAf0yK7MvTve
         jhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701750431; x=1702355231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/hfcbW48ipcTyTOqqF00Q2NciPFAlQFTKrvmT9STnQ=;
        b=fpathBkRbSpdbPPZyjxv7eSMBl2fuRtxQTbvrYQZQpPDr5wVZWWWU9r0v1EpcbFdpQ
         6z6aWR3aSh9gZjXLnzQocQu6ASfoWxY+AhDgX8t9zYTxISBYV5Q4GsMgfBvvlgWKUVeT
         sxBFgKcpOFICTDttQkTGmQQ1QZ7UWNQlEaRAcgZjFlJzq4S1GMNlH/2Jhz0w9e2nwF6n
         kgC+a+tU3Jl2Oeu9J6F/bDjd0e1I0sbv3eAj8c1Zi9RZ0vLM1evtwAa4JZW9JUqrDvTv
         mSuzilXCj2EIrTslI5wY8VxqRIHAYe2EUTjYUk75WKX8dJKofTTeiVjIR4gkVnb+7U1L
         tZpA==
X-Gm-Message-State: AOJu0YwiVeL1KTb/rucyggo17l9TOhcMZ7cmXLfhFTdAe+NmUqFoUo43
	kb1V9Vm8EHu8gz7KyWidIdc=
X-Google-Smtp-Source: AGHT+IHtEbtH6jHl6MM/0Tbi74ON0JRY3hkWcWQ7563egid9msSKw4WcAV3DtFhyZHvZvixlvkkmKg==
X-Received: by 2002:a05:622a:15c9:b0:423:a4f6:9aac with SMTP id d9-20020a05622a15c900b00423a4f69aacmr918436qty.14.1701750431538;
        Mon, 04 Dec 2023 20:27:11 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id bz17-20020a05622a1e9100b0042542160fd0sm2963298qtb.20.2023.12.04.20.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 20:27:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto-dev: bump to v6.7
Date: Mon,  4 Dec 2023 23:26:59 -0500
Message-Id: <2d8cdbde742e435ce147a27a96944d5b2ecc1003.1701750230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1701750230.git.bruce.ashfield@gmail.com>
References: <cover.1701750230.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 04:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191781

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index b59442781c..a85f85e4c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -14,7 +14,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.6/standard/base"
+KBRANCH = "v6.7/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.6"
+LINUX_VERSION ?= "6.7"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


