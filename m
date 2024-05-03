Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923CEC25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.3820.1714704046227221796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaI9lmks;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-790605809cbso740849585a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704045; x=1715308845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saUGhuJMwASM9zdUn7b4AcN1Ku1AhDsHplTyAwjqzY0=;
        b=ZaI9lmksf/4SlWTGeOICHvm4BJQNiMi9bY+y6x53ugCO9GxPCPnG/ncDU/lb6LDXFK
         yDe0K2ojCnWq7WH7mVvy9OMC6lMNh89MgQejsQJ0g9cKjMrV6bgkLh56WOo+l+jvIFKz
         ydYI9bA+ZGdjRP9zN8PmEK0St5ZdT1wEW5K271dNn9ErJkDwI8ChQfUVLdfaRsMTtpjG
         XEYtKhjVgDZ14C4iWdO3xy2h6Dl8qMY3r7MRXlFD99sxfZOS/PD3tnxJMdaPJrH4HX5z
         Nm2zN5irfNfIJDNWviJN+6QDjI/bRczWhJKDmWwbqbXDBrvxcqPP9Zsr1OTN5Gk0Fm2X
         rQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704045; x=1715308845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saUGhuJMwASM9zdUn7b4AcN1Ku1AhDsHplTyAwjqzY0=;
        b=H4lzcDNNus5wTtN8g5zhw1ReFXpjQR2JvHNm9CDrM7XgMsLohO6KgkMd16upJaw/Dy
         gUaKJu/p36bFW8KisxhqmIpN/4Cxz4SBhiSsTlnMZlKu1yEqqliRBNMy04HIs2VFDev9
         cb1rlop6RG0F/+Hv1mYzt7Ani51TSDCChvH1DQ/iqylS4v02KHRzJcGfUrrCOW9NJ4qH
         2N+nqPJmsDwW+fjVP2bN7Cz4YgNJD+qFN6ntLB87seX1mllghcx85Py3rke3Hb27cXsm
         NuEC7mfqIPmsxRdbPwwl7QeAehaIVWrvlzzgBCxVDkCgaLoeYMJ2CqGkuccnK9m/BNIE
         8YXA==
X-Gm-Message-State: AOJu0YyMnyqpcm7fNlDnYG4UqXNFWwltZcY9r4LlMj8vLFGc0IFv9vuT
	ZqFdD38ioKtuqgF9KmCrSCe9BSCcf/EkQcI0nHGNvDmzzgVUEBPKYOYjOA==
X-Google-Smtp-Source: AGHT+IFWuglI0HoisEkTHD5wY0I54KQ68fzhhXsQgEBpTq4LZN5FH2ZhS8gPRz+gZgQgM3nDjAF0hQ==
X-Received: by 2002:a05:620a:6228:b0:790:b426:7812 with SMTP id ou40-20020a05620a622800b00790b4267812mr1497363qkn.11.1714704045068;
        Thu, 02 May 2024 19:40:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] linux-yocto/6.6: update CVE exclusions (6.6.24)
Date: Thu,  2 May 2024 22:40:30 -0400
Message-Id: <fd6e4f80902a641f397ac02aa3de486aa2dcd137.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198933

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
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index bb9ba49c48..133cab88a3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-28 16:40:04.102652+00:00 for version 6.6.23
+# Generated at 2024-04-04 03:23:25.421265+00:00 for version 6.6.24
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.23"
+    this_version = "6.6.24"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


