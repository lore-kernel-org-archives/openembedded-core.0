Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4AFC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:53:05 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.4196.1714704777419466580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EJKbZZua;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78f049ddd7dso671347385a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704776; x=1715309576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo8zegybcZADbJ0dVZMJnmb6zFvpNBP2gwnygp7BFxc=;
        b=EJKbZZuabv3rxmQ/WwK0VIOZueek1zpqTzbCoZqOLx8LvTOsZ/MA372zxZbL0+rPE9
         +KpCAwaLzKksmtgt7jn8pJZ+vqAfKhKSE54hCdNyeEuyIxdnCQgjBDbZNcT84NYQfrYO
         fnwfSjaobKBU9ayOAiihWdOuRq8mldv1Ajgj/4b1zsVXAano8DzsiI8vX3itMCDx+snu
         acWFk+cdFDnkjzP7XTgJqcOFeK4WOqMBDQapw9HioLXDdUSYjm4jJV1kdH0rg7sBLpBg
         lQnpNHj4W9+IdvZ/LgaPd38pcUf+ITytREs3FqOgoH5OC+BfzOkO24bzEYmeyKnIaWV3
         HRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704776; x=1715309576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vo8zegybcZADbJ0dVZMJnmb6zFvpNBP2gwnygp7BFxc=;
        b=Wqi6e+Mw6taqkAVc6U629+tIUzSAdMC3xCaMcf1PDkGmla9Mxl6A3zlpAfE5ihfrVp
         t9O8WQ9HGiRAPmCfC7dWhJdl5cYhQJVOwUxmb/rijy5VeYoWuHbQmiSJq3P0sZjAkPUq
         NyhO0Vsge1USTHLVayaTWyhMqNklToU4svuqtxfwfvP/G6hZdkb5D7FSQJeRdmz33hHE
         /4+vCjxyTKnEdVuM5Ep3ZQHFLAntXeB5wBzxyYIcgk9b+21LymCELKHUcgY/Kpp9HUpn
         W+RBU9FDtq3Hu3phx9kZv4VGAdGSl2BGts350pHr3B0eS6zB44Wkn2RgNeoscE/NXinV
         3w+A==
X-Gm-Message-State: AOJu0YyWXZ/gxXnaaReS0mYPKQg/PIkUGL9y3nXL4twbjCRUdthO4vwO
	z1+mFi5G2XW9kpGQtMmdUcX6kg1eCGC5w4IycBHlA0ykPpl4CFE1
X-Google-Smtp-Source: AGHT+IEc30w79x8PKC8QHgdMfQVo5IKLZplV2iKP12VcvuZVK++l+XJvhZnR7gDkn1GYZA7PNva6Vw==
X-Received: by 2002:a05:6214:e86:b0:6a0:b2bc:bc86 with SMTP id hf6-20020a0562140e8600b006a0b2bcbc86mr1554742qvb.12.1714704776410;
        Thu, 02 May 2024 19:52:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/12] linux-yocto/5.15: update CVE exclusions (5.15.157)
Date: Thu,  2 May 2024 22:52:40 -0400
Message-Id: <20240503025240.373184-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503025240.373184-1-bruce.ashfield@gmail.com>
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198955

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 8Apr24
        Date: Tue, 9 Apr 2024 18:19:11 -0400

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 78ff1365db..f5ccf2bc22 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-25 15:13:47.533247 for version 5.15.156
+# Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.156"
+    this_version = "5.15.157"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


