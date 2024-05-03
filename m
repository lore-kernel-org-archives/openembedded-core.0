Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6B7C25B10
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:52:55 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.4195.1714704773526429623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Agd9xHCB;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7f16ff3aa61so1196896241.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704772; x=1715309572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODGnEjrlWTN67DGqe7d84IxmRpZDN9vuAtXeMpmHVhM=;
        b=Agd9xHCB/J/9ylrCMeJasVHyTXdQLXdlfXcfuosxKGYDuXIqB/nftz/cE7Ql5+0fvx
         SvJoZElYlW0vt6Gr6ZWCUvosVN6IKPjfxN9lb8lw4RtjxPtM/S471gCHgpaLBh1vqI1u
         0Ox+sMh615WHRTlAmVfv4prbKDsL89hA5tBDY+fsah1w6y6zkwUI074Sk4f7L+LEIbQE
         8iowY8+p0OiOw2ZWT4bRZTznKnIrzZhKp3eRSqVq3SCZBYHOobmItmPOU+KEepP9vcSG
         NL6b8KP60zfiAgOzihrkmZPgBq2WxkWROI926tHgjRNNWsh5fM13VHhBtES1b0DSqg4S
         r96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704772; x=1715309572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODGnEjrlWTN67DGqe7d84IxmRpZDN9vuAtXeMpmHVhM=;
        b=um5T7w6ouqs+HVC1SlxFAoTVkCqcfEzeSm+WEDElxiycd/xMaohtQad/GQNTbpI1ap
         6V9qj0fg0NOzd5micEKjrm0EgJRURQ/rQuPB9P/ugqW+dtDcc6hKiALuvlnd8viTvxtq
         2HblBCjEVDpVf21QenCTlT01GNLREvP2fvP5ZZyMijUDwyQoZ3ZiIKNIpBAEZ8U+G84e
         q5TdVVrgamj/C83+/umZuWfszkrS/h5jI5D7QWcQqVaWDBDW/JwQoLCByBarAV8klyYj
         hWPR6qrKFMFb/0bHzTYDoq2Y1pFvhMZO4j/Fm8olPzKEydVla7OuS2slM0A7OPxhARXN
         c88w==
X-Gm-Message-State: AOJu0Yx8ntounPRq0vWHQys2pcc13GBZOiGq8C097Ktabp6sKz8c0FpB
	5lNKYKnCIK/vHIzuAnujSvqoSWNWulLkyslfv9hGLjvKZb258fdWdMQj5w==
X-Google-Smtp-Source: AGHT+IF7L58kxU0fqiu6N/sjP2edh36xk0aegZ8IatqK33g95+WeVJY4Obn26fMKUgL741Ad2BqUYA==
X-Received: by 2002:a67:f591:0:b0:47c:24fa:b627 with SMTP id i17-20020a67f591000000b0047c24fab627mr1423160vso.13.1714704772559;
        Thu, 02 May 2024 19:52:52 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/12] linux-yocto/5.15: update CVE exclusions (5.15.156)
Date: Thu,  2 May 2024 22:52:38 -0400
Message-Id: <20240503025240.373184-10-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503025240.373184-1-bruce.ashfield@gmail.com>
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198953

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
index 3cbbce59ac..78ff1365db 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-15 16:35:38.699381 for version 5.15.155
+# Generated at 2024-04-25 15:13:47.533247 for version 5.15.156
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.155"
+    this_version = "5.15.156"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


