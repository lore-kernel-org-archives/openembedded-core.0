Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55831C54E66
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:41:13 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.67783.1710175268678548287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 09:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aBky5+IV;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4725acb539cso793509137.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710175267; x=1710780067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qf3zj4ejI14+u56soWzvR4kfTLeUpSLfVAmD7miwH+g=;
        b=aBky5+IVYiaKDcSirqRDcUeA9DoTPB7PA3Kmjzkzg7/RGNVrNauaTThjJp0r/QFQv7
         0rbYgP+Lf0X8dc/p/9J5R0gsXBZXreMaF5yCXc+W/ueMTVgPYnqM8JKeLXKx1wRfNQl0
         Nrnwesn33HF0cjCklv/B8hJZOF8sH8j4F0kwFDkBZ3lpEYpCjMzykc4oBWJaJmAcGgI/
         rKFoq8Z4RrLpr2quOHjpyLjCRqjP6heAaqBOqpQXFaasfp370BE7MgKbDX7krxFttXt1
         lbtY0C2VL98wkFO+HD5LpkKFqs/mhGc6NfI0fSrCoMAFc/9WYzEqUi8Xsl1+XobiSvPD
         qXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710175267; x=1710780067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qf3zj4ejI14+u56soWzvR4kfTLeUpSLfVAmD7miwH+g=;
        b=nWSydGN0t2bmQQGU4VsCXNVi0UFiTkYoxjEEe9YxRCbP+UjyBZNPMJ8bGEG/QnFO09
         5a0wGbtdp+W8e3rlmFE6QZq8Apixg6T32DsRfi4qysTGiIPaypeW4aoSlQ2KLRk3xA0y
         iL23ODfK4WRRFYlHOaO7V3tK+7EuJMuyrc6Hdx2VqKwfCZdeGvf4vC00WruXW5g2yena
         JzqU1Dnyj5Ea32hd9/eDVN4Dhn2zSc6tPnQt30pPYJFh8DQknwA29/jL1rQ4AynxeWlF
         Wb0fyjJKiQIgLVVGCCAxft8fZc5ih5UaAtEKRotS8HGmcwlM9U0UsfNyjHtgeHWidlSZ
         Gzlg==
X-Gm-Message-State: AOJu0YwSX1rksq9NCEL0PfiZ7IcT/mogNdFX+hUpTS+sM8uq9dEKgcRf
	08EGPKRxGPSv03v0U7rl42qFX99vzZVPKFyi/7eAWmtv1bslROmagDdBqnJS4hg=
X-Google-Smtp-Source: AGHT+IHloJQSQ4fNGIxJo+kGd6e1VuHpA01c3ssZNwBDPW7Sihi7g3tRDHEYyZcNbQwOasO/SNfqwQ==
X-Received: by 2002:a67:fe92:0:b0:473:14ae:b411 with SMTP id b18-20020a67fe92000000b0047314aeb411mr4417199vsr.19.1710175267601;
        Mon, 11 Mar 2024 09:41:07 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id y2-20020ad45302000000b00690c99e7ad5sm1793928qvr.110.2024.03.11.09.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:41:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7][kirkstone] linux-yocto/5.15: update CVE exclusions (5.15.150)
Date: Mon, 11 Mar 2024 12:40:56 -0400
Message-Id: <979edb6eddcb1d92776f645023f440225c1269a8.1710175022.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710175022.git.bruce.ashfield@gmail.com>
References: <cover.1710175022.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 16:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196950

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
index 2e30efe6be..922d7f457f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-26 23:36:34.200936 for version 5.15.149
+# Generated at 2024-03-08 10:36:30.059302 for version 5.15.150
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.149"
+    this_version = "5.15.150"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


