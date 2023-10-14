Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47A1CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 12:26:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.61888.1697286386893480841
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 05:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ive5LenJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40776b200e5so9134085e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697286385; x=1697891185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SN7H983LnkwXFywiM79RdLHsalrLo6oqycFDYt+RU/Y=;
        b=Ive5LenJjS/oIinUXL6s2+vN6Xw1UgRUEq6FFUNIFdjJw48UDASWAdK6Or4bkT5zug
         s3TSMRAb+XB8/WZD6rcMlQNk1pQTPzXfZgBJ2NQ75vl6LA7EiR7QKyRFmPuTvLvgQ/n2
         qd2CMVhodjqpEL/iC04ShbPf4SiS+g/g8mKe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697286385; x=1697891185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SN7H983LnkwXFywiM79RdLHsalrLo6oqycFDYt+RU/Y=;
        b=KwIXfumrPO/T+B58ch/ovyLD6zYpZkP2lKvtRZDYoMqbIekSBJH2d3JmPIftxQwd5v
         k92mbPxwUFLCRnLXcX8bpwZoSIF97VbeAowKEchSc2VB1krs0r6aaqTEZl7QawTzP03e
         B63n5IMPst503e69yE1tKItcFWCE8kSwxV0kEUkIPn2iShpG7BqTE5f8eoaJoBMyQGPn
         zYBj1CVRCDDsLWWfJaqwdcfhByxshi8NYWU213p292d+sH44kkWl7vMLGvOHaV1BLudu
         X+1K3MtEjOBEpx0i0hWwQfC8J7lF/zlKktBhXszlbOMBLgZFe9zk57d/YUJF1Gi3XdgI
         0frw==
X-Gm-Message-State: AOJu0Yy4NudM9Xky5Jc0yfq1Prs2PUaoHZYBAP6rDxmLr6Zz/WCY2Jp3
	oFAr9Bu8n6UouhxCBzW3HX2hlJQoTllB2H71Txs=
X-Google-Smtp-Source: AGHT+IEFHRaoY5uQNrwUNQKKDKzm77SVg9s+Qa1QCoA5NCpocQtQe88p4budZCQBkd8xAzdKFI4Yyw==
X-Received: by 2002:a05:600c:1caa:b0:407:5b54:bb15 with SMTP id k42-20020a05600c1caa00b004075b54bb15mr9880997wms.36.1697286384651;
        Sat, 14 Oct 2023 05:26:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:66ae:9f57:4dbd:827d])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c4f8d00b00407752bd834sm1893279wmq.1.2023.10.14.05.26.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 05:26:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux/cve-exclusion6.1/6.5: Update to latest kernel point releases
Date: Sat, 14 Oct 2023 13:26:23 +0100
Message-Id: <20231014122623.322098-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 12:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189114

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 4 ++--
 meta/recipes-kernel/linux/cve-exclusion_6.5.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 88c7e4589a8..6af53b0d750 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-30 07:26:16.988526+00:00 for version 6.1.55
+# Generated at 2023-10-14 12:24:32.747058+00:00 for version 6.1.57
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.55"
+    this_version = "6.1.57"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
index c88b6f7c593..dbcfdcd31c7 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-29 00:20:42.494116+00:00 for version 6.5.5
+# Generated at 2023-10-14 12:24:32.683888+00:00 for version 6.5.7
 
 python check_kernel_cve_status_version() {
-    this_version = "6.5.5"
+    this_version = "6.5.7"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


