Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F550C25B74
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:52:55 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.4014.1714704768911258043
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aGYaRMMB;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43a8246b51dso45749301cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704768; x=1715309568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T185VuSluXoHUy8YxQe0n9Qmh0omgQDo9br7K6hGlFI=;
        b=aGYaRMMBZaMly7mEujxunakDFeYTmlXWrTaw7hzLvZETs3T0TgI//tvNA0fkXafE4z
         IFEsURnfHRxN2S1nHNXfjbF2fZL/Bi2HsDNQ1ZsL4UUxTktOP4tnvqtUApx6MHm3QQU7
         u1dAXK7VcRHTd4wEoLweFAhcYTRqI5z5FwInA9NtyV3AUQ3zyUazQd7gC1aeHmWLl1RC
         mf2NwmVKXWa+hMFL81QiqJ5iAuYCs4m5Tl9+Dzby/QUVIxvfcXUGTUss1UePlyo+bAE1
         uTrHsAh9UItLUbGOCRPXY5wNBe1FVFGpBIojw3L126ZMkhvmbHvVKUONQV9o551KR1oJ
         eImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704768; x=1715309568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T185VuSluXoHUy8YxQe0n9Qmh0omgQDo9br7K6hGlFI=;
        b=MIPbrQ5lwGRpOvhIcNlYp0egHS2MvEeCvFRPgzbIHerF3oz7X4AeHd1bDmCSok56PD
         hmC+ztK7hUFexS7CoeAZ02f8Hludb/uP4dhJBIrI92BKw2PG3+d+UWacGipvI+w8Df7V
         +4dPesHeMVrD+XO2S0P6K20g8BvRBjzV2CpxTTShtTc3NngYDbaG/of1H9mFub4Utc4g
         6vJ1YwdmTWp8N4cpxyLCNV/C+g3Y/74Ahjr50E9IZOc2xTXV2DEYsl1sJW2orHdlDmTe
         4KmSI7N3yYwusznOEkIHpCiCiak2XIk0uVp66g3sxczFzSHnZq2/N8B2wK+r0FJoTpWR
         aKXQ==
X-Gm-Message-State: AOJu0YxPtXHGq6ijqQoYjK8nBsv25V+EJKXaTvbswPG5BIyu80X/VRwL
	T1HeWWISYINcXInkQT2gzv5CkQxjbhEpest0OCb3Guctpy2relzT
X-Google-Smtp-Source: AGHT+IFYzeXLaH2icRVQuIGhgjLUaZHYBNmWaQHRDwTd5YnLCizjXcfiTnjUtY/NUdDdJBK1wjFlQQ==
X-Received: by 2002:ad4:5ceb:0:b0:6a0:584d:3e55 with SMTP id iv11-20020ad45ceb000000b006a0584d3e55mr1829836qvb.7.1714704767540;
        Thu, 02 May 2024 19:52:47 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/12] linux-yocto/5.15: update CVE exclusions (5.15.153)
Date: Thu,  2 May 2024 22:52:34 -0400
Message-Id: <20240503025240.373184-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503025240.373184-1-bruce.ashfield@gmail.com>
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198949

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index f60ba5177a..c163fe4938 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-19 17:41:49.053760 for version 5.15.152
+# Generated at 2024-03-28 13:46:59.505239 for version 5.15.153
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.152"
+    this_version = "5.15.153"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


