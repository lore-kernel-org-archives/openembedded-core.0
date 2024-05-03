Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC166C41513
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:41:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.4006.1714704060828975644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gzOVNKvA;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78edc3e7cd9so622117585a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704060; x=1715308860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyQpyHBnJeBQPvtq0kbuH2KUjZ3JqT+XrJuj8RXAE7A=;
        b=gzOVNKvA6KTddYHUTa1CgWDolbdRyow1jZ4XszihCrgIzA4/mBZsP/bR+soVRiWwej
         z1s58EBXkKTLyxRBXJqX4So64qADytu+u6ClyRdCeZ1kUjCLMfhFwkWSJuZinoyDPVBJ
         HWEP0PqqYm1C3LFYxc8TIMk8fAseboboqquOVrqFNNIZXlHdI9ecKLh+9jhAbkk/o6i7
         H0Hfnc9s1SETKiIULSEurgDrxwoT7b+9EotlOGscts83nDo8gxyvQCMruIGZrb2Qng1M
         xE4ISjL3c2KuCbYrnyCZftmIQkEnWbWH2zSQJX5WxjgUVSYkB3mIH86sSFB+RDxJrl+l
         QPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704060; x=1715308860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyQpyHBnJeBQPvtq0kbuH2KUjZ3JqT+XrJuj8RXAE7A=;
        b=DtTnOh+ZSMgNTIuMnFPcCM+MHeB1CqGTMs82ex+YMWX218JCWBI6DXyYuX7isVbX6r
         05EREX7Xwkggzio7Kn65oRfkRywOdQcPLskKyphxlsiDzfpg8+OyJbnyTDoNvnmmNrpi
         2Tz1gNQM4SQrkWYm+9rK/quOr41KitX80+1LA6vtEV2fNvpjsPSvR1K1EM6402gXg93y
         +vNUbO791IxnGvy6lXZ0q7TPAYmqzvfc+AaT6A/SCH/qYUCXkebxSFzu35/Mqh0fN3cX
         Fem3+5LU5SF/8QO6uc8T3i3tO1fhH2nf2lRtTSq1JjiRh3PnFaKZkW6+eutOyDaGMDmM
         QUjA==
X-Gm-Message-State: AOJu0Yw7dbnGCSYttEOdzuM0ZSSmb7oZcjAUCbzkGvKD+u0jVG68fOa1
	gPUwfer+JxzyDciG6yjD6jlC8NXdrr9Kgjjx7VDKyxn2lOxnNNnw
X-Google-Smtp-Source: AGHT+IFIyjVlv+j+xh1d4SR1Hr7EgC2mKOU7M9CARhW4DYRcJpbGSW9DOEffXn7yOPmibQp5RtFdww==
X-Received: by 2002:a05:620a:84d:b0:790:9edf:5f10 with SMTP id u13-20020a05620a084d00b007909edf5f10mr1441451qku.27.1714704059749;
        Thu, 02 May 2024 19:40:59 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/12] linux-yocto/6.6: update CVE exclusions (6.6.29)
Date: Thu,  2 May 2024 22:40:40 -0400
Message-Id: <0af5f4f2f3c50c916050b41185c556d7eb2c4317.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198943

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
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index df09c1fd1d..9f1f03ac53 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-25 18:59:44.140399+00:00 for version 6.6.28
+# Generated at 2024-05-02 12:41:43.351358+00:00 for version 6.6.29
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.28"
+    this_version = "6.6.29"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


