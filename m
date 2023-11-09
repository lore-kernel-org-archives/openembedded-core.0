Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0918C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 17:14:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.1019.1699550037319007101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 09:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C+xQSygM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.170, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso14684701fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 09:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699550035; x=1700154835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FkFQKJdui8NjUyOiHGshbXNVzWUKjTfkgVSebSfIxyg=;
        b=C+xQSygMQLF72y4sScL8U0Fj6DuVJk6VjnVzylCwQvf4bwK4+lMKgy9hLhmDYQFm6A
         iufPsQsebBR8WuPRv02WJGV9tqf0AXUKHTSLyx5lwStcH+TDYVWEf9oufcivuLDAaSvy
         G5ay85vPbrX51RJ7ylT4bEeoPeRG09fh5CXeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699550035; x=1700154835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FkFQKJdui8NjUyOiHGshbXNVzWUKjTfkgVSebSfIxyg=;
        b=OIX3cJYrWsrz+qoK34RmqFJiC5s7CyMppm92NAcKQaOW1u94iRBl+38F4AKmiPmvEH
         cktzg0gMaqGkjbN67m7UFC4tUGlzVRzZub0fC5i8LHfWOFqIBbhSr/QpjnP9CHiRlrF2
         JToJUTSVmmAsh/d0UPT3ZEeSp80zHpjEBTplFBbtQ6Xt2Yff5O1hnLS7qi0MO1x6G9m0
         RZ2Gqmx6wvBfcXdhbdFdWNx+HQpyiAlvyVrccI0iGFwkNpVXpqcP11LOu0r1eNbev/lz
         nPeT/PP4n6FGFHi6X39H6mpzr+XZx7qzvKPfD+2n/2cnsKhyRPvjb/oLbUv81HuEUz28
         Tp3Q==
X-Gm-Message-State: AOJu0YzEpEhfgu0qTvpnhJ55lJ+2XNLMNXf2HHqf03oYQoFUHd65XNdH
	p+byGq285PPXCDK/WYo/xWi2LhfCdFNSDAHvhVU=
X-Google-Smtp-Source: AGHT+IHX+sOqFqfeOsqPttSNtHr/6yVj8QfjKgWNoeyQKbd5izC7ZDDLiqqsn2HBEhsRFajMwSi9nA==
X-Received: by 2002:a05:651c:1697:b0:2c5:3261:615e with SMTP id bd23-20020a05651c169700b002c53261615emr4178473ljb.35.1699550034755;
        Thu, 09 Nov 2023 09:13:54 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d6a:4777:87ed:703e])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d6705000000b0032f7fab0712sm109456wru.52.2023.11.09.09.13.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 09:13:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux/cve-exclusion6.1/6.5: Update to latest kernel point releases
Date: Thu,  9 Nov 2023 17:13:53 +0000
Message-Id: <20231109171353.1715618-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 17:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190394

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../linux/cve-exclusion_6.1.inc               | 30 ++++++---
 .../linux/cve-exclusion_6.5.inc               | 62 ++++++++++++-------
 2 files changed, 60 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 3f708b0cc51..1216e0c2ddd 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-23 14:03:17.479563+00:00 for version 6.1.57
+# Generated at 2023-11-09 17:12:27.365962+00:00 for version 6.1.61
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.57"
+    this_version = "6.1.61"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4644,7 +4644,7 @@ CVE_STATUS[CVE-2023-1118] = "cpe-stable-backport: Backported in 6.1.16"
 
 CVE_STATUS[CVE-2023-1192] = "cpe-stable-backport: Backported in 6.1.33"
 
-# CVE-2023-1193 has no known resolution
+# CVE-2023-1193 needs backporting (fixed from 6.3rc6)
 
 CVE_STATUS[CVE-2023-1194] = "cpe-stable-backport: Backported in 6.1.34"
 
@@ -4954,7 +4954,7 @@ CVE_STATUS[CVE-2023-35824] = "cpe-stable-backport: Backported in 6.1.28"
 
 CVE_STATUS[CVE-2023-35826] = "cpe-stable-backport: Backported in 6.1.28"
 
-# CVE-2023-35827 has no known resolution
+CVE_STATUS[CVE-2023-35827] = "cpe-stable-backport: Backported in 6.1.59"
 
 CVE_STATUS[CVE-2023-35828] = "cpe-stable-backport: Backported in 6.1.28"
 
@@ -5024,7 +5024,7 @@ CVE_STATUS[CVE-2023-4015] = "cpe-stable-backport: Backported in 6.1.43"
 
 CVE_STATUS[CVE-2023-40283] = "cpe-stable-backport: Backported in 6.1.45"
 
-# CVE-2023-40791 needs backporting (fixed from 6.5rc6)
+CVE_STATUS[CVE-2023-40791] = "fixed-version: only affects 6.3rc1 onwards"
 
 CVE_STATUS[CVE-2023-4128] = "cpe-stable-backport: Backported in 6.1.45"
 
@@ -5082,9 +5082,9 @@ CVE_STATUS[CVE-2023-45863] = "cpe-stable-backport: Backported in 6.1.16"
 
 CVE_STATUS[CVE-2023-45871] = "cpe-stable-backport: Backported in 6.1.53"
 
-# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-45898] = "fixed-version: only affects 6.5rc1 onwards"
 
-# CVE-2023-4610 has no known resolution
+# CVE-2023-4610 needs backporting (fixed from 6.4)
 
 CVE_STATUS[CVE-2023-4611] = "fixed-version: only affects 6.4rc1 onwards"
 
@@ -5092,15 +5092,29 @@ CVE_STATUS[CVE-2023-4611] = "fixed-version: only affects 6.4rc1 onwards"
 
 CVE_STATUS[CVE-2023-4623] = "cpe-stable-backport: Backported in 6.1.53"
 
+CVE_STATUS[CVE-2023-46813] = "cpe-stable-backport: Backported in 6.1.60"
+
+CVE_STATUS[CVE-2023-46862] = "cpe-stable-backport: Backported in 6.1.61"
+
+# CVE-2023-47233 has no known resolution
+
 CVE_STATUS[CVE-2023-4732] = "fixed-version: Fixed from version 5.14rc1"
 
 CVE_STATUS[CVE-2023-4881] = "cpe-stable-backport: Backported in 6.1.54"
 
 CVE_STATUS[CVE-2023-4921] = "cpe-stable-backport: Backported in 6.1.54"
 
-# CVE-2023-5158 has no known resolution
+# CVE-2023-5090 needs backporting (fixed from 6.6rc7)
+
+CVE_STATUS[CVE-2023-5158] = "cpe-stable-backport: Backported in 6.1.57"
+
+CVE_STATUS[CVE-2023-5178] = "cpe-stable-backport: Backported in 6.1.60"
 
 CVE_STATUS[CVE-2023-5197] = "cpe-stable-backport: Backported in 6.1.56"
 
 CVE_STATUS[CVE-2023-5345] = "cpe-stable-backport: Backported in 6.1.56"
 
+# CVE-2023-5633 needs backporting (fixed from 6.6rc6)
+
+CVE_STATUS[CVE-2023-5717] = "cpe-stable-backport: Backported in 6.1.60"
+
diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
index 69cf7908441..b4086d436c4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.5.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-23 14:03:24.529766+00:00 for version 6.5.7
+# Generated at 2023-11-09 17:13:01.267965+00:00 for version 6.5.10
 
 python check_kernel_cve_status_version() {
-    this_version = "6.5.7"
+    this_version = "6.5.10"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4644,7 +4644,7 @@ CVE_STATUS[CVE-2023-1118] = "fixed-version: Fixed from version 6.3rc1"
 
 CVE_STATUS[CVE-2023-1192] = "fixed-version: Fixed from version 6.4rc1"
 
-# CVE-2023-1193 has no known resolution
+CVE_STATUS[CVE-2023-1193] = "fixed-version: Fixed from version 6.3rc6"
 
 CVE_STATUS[CVE-2023-1194] = "fixed-version: Fixed from version 6.4rc6"
 
@@ -4796,7 +4796,7 @@ CVE_STATUS[CVE-2023-25012] = "fixed-version: Fixed from version 6.3rc1"
 
 CVE_STATUS[CVE-2023-2513] = "fixed-version: Fixed from version 6.0rc1"
 
-# CVE-2023-25775 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-25775] = "cpe-stable-backport: Backported in 6.5.3"
 
 CVE_STATUS[CVE-2023-2598] = "fixed-version: Fixed from version 6.4rc1"
 
@@ -4856,7 +4856,7 @@ CVE_STATUS[CVE-2023-3106] = "fixed-version: Fixed from version 4.8rc7"
 
 CVE_STATUS[CVE-2023-31084] = "fixed-version: Fixed from version 6.4rc3"
 
-# CVE-2023-31085 needs backporting (fixed from 6.6rc5)
+CVE_STATUS[CVE-2023-31085] = "cpe-stable-backport: Backported in 6.5.7"
 
 CVE_STATUS[CVE-2023-3111] = "fixed-version: Fixed from version 6.0rc2"
 
@@ -4936,7 +4936,7 @@ CVE_STATUS[CVE-2023-34256] = "fixed-version: Fixed from version 6.4rc2"
 
 CVE_STATUS[CVE-2023-34319] = "fixed-version: Fixed from version 6.5rc6"
 
-# CVE-2023-34324 needs backporting (fixed from 6.6rc6)
+CVE_STATUS[CVE-2023-34324] = "cpe-stable-backport: Backported in 6.5.7"
 
 CVE_STATUS[CVE-2023-3439] = "fixed-version: Fixed from version 5.18rc5"
 
@@ -4954,7 +4954,7 @@ CVE_STATUS[CVE-2023-35824] = "fixed-version: Fixed from version 6.4rc1"
 
 CVE_STATUS[CVE-2023-35826] = "fixed-version: Fixed from version 6.4rc1"
 
-# CVE-2023-35827 has no known resolution
+CVE_STATUS[CVE-2023-35827] = "cpe-stable-backport: Backported in 6.5.8"
 
 CVE_STATUS[CVE-2023-35828] = "fixed-version: Fixed from version 6.4rc1"
 
@@ -4968,7 +4968,7 @@ CVE_STATUS[CVE-2023-3611] = "fixed-version: Fixed from version 6.5rc2"
 
 # CVE-2023-3640 has no known resolution
 
-# CVE-2023-37453 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-37453] = "cpe-stable-backport: Backported in 6.5.3"
 
 # CVE-2023-37454 has no known resolution
 
@@ -5006,13 +5006,13 @@ CVE_STATUS[CVE-2023-3866] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-3867] = "fixed-version: Fixed from version 6.5rc1"
 
-# CVE-2023-39189 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-39189] = "cpe-stable-backport: Backported in 6.5.4"
 
 CVE_STATUS[CVE-2023-39191] = "fixed-version: Fixed from version 6.3rc1"
 
-# CVE-2023-39192 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-39192] = "cpe-stable-backport: Backported in 6.5.3"
 
-# CVE-2023-39193 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-39193] = "cpe-stable-backport: Backported in 6.5.3"
 
 CVE_STATUS[CVE-2023-39194] = "fixed-version: Fixed from version 6.5rc7"
 
@@ -5050,15 +5050,15 @@ CVE_STATUS[CVE-2023-4244] = "fixed-version: Fixed from version 6.5rc7"
 
 CVE_STATUS[CVE-2023-4273] = "fixed-version: Fixed from version 6.5rc5"
 
-# CVE-2023-42752 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-42752] = "cpe-stable-backport: Backported in 6.5.3"
 
-# CVE-2023-42753 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-42753] = "cpe-stable-backport: Backported in 6.5.3"
 
-# CVE-2023-42754 needs backporting (fixed from 6.6rc3)
+CVE_STATUS[CVE-2023-42754] = "cpe-stable-backport: Backported in 6.5.6"
 
 CVE_STATUS[CVE-2023-42755] = "fixed-version: Fixed from version 6.3rc1"
 
-# CVE-2023-42756 needs backporting (fixed from 6.6rc3)
+CVE_STATUS[CVE-2023-42756] = "cpe-stable-backport: Backported in 6.5.6"
 
 CVE_STATUS[CVE-2023-4385] = "fixed-version: Fixed from version 5.19rc1"
 
@@ -5080,27 +5080,41 @@ CVE_STATUS[CVE-2023-45862] = "fixed-version: Fixed from version 6.3rc1"
 
 CVE_STATUS[CVE-2023-45863] = "fixed-version: Fixed from version 6.3rc1"
 
-# CVE-2023-45871 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-45871] = "cpe-stable-backport: Backported in 6.5.3"
 
-# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-45898] = "cpe-stable-backport: Backported in 6.5.4"
 
-# CVE-2023-4610 has no known resolution
+CVE_STATUS[CVE-2023-4610] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-4611] = "fixed-version: Fixed from version 6.5rc4"
 
 CVE_STATUS[CVE-2023-4622] = "fixed-version: Fixed from version 6.5rc1"
 
-# CVE-2023-4623 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-4623] = "cpe-stable-backport: Backported in 6.5.3"
+
+CVE_STATUS[CVE-2023-46813] = "cpe-stable-backport: Backported in 6.5.9"
+
+CVE_STATUS[CVE-2023-46862] = "cpe-stable-backport: Backported in 6.5.10"
+
+# CVE-2023-47233 has no known resolution
 
 CVE_STATUS[CVE-2023-4732] = "fixed-version: Fixed from version 5.14rc1"
 
-# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-4881] = "cpe-stable-backport: Backported in 6.5.4"
+
+CVE_STATUS[CVE-2023-4921] = "cpe-stable-backport: Backported in 6.5.4"
+
+CVE_STATUS[CVE-2023-5090] = "cpe-stable-backport: Backported in 6.5.9"
+
+CVE_STATUS[CVE-2023-5158] = "cpe-stable-backport: Backported in 6.5.7"
+
+CVE_STATUS[CVE-2023-5178] = "cpe-stable-backport: Backported in 6.5.9"
 
-# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
+CVE_STATUS[CVE-2023-5197] = "cpe-stable-backport: Backported in 6.5.6"
 
-# CVE-2023-5158 has no known resolution
+CVE_STATUS[CVE-2023-5345] = "cpe-stable-backport: Backported in 6.5.6"
 
-# CVE-2023-5197 needs backporting (fixed from 6.6rc3)
+CVE_STATUS[CVE-2023-5633] = "cpe-stable-backport: Backported in 6.5.8"
 
-# CVE-2023-5345 needs backporting (fixed from 6.6rc4)
+CVE_STATUS[CVE-2023-5717] = "cpe-stable-backport: Backported in 6.5.9"
 
-- 
2.39.2


