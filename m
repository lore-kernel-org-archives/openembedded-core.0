Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE67C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 20:53:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.4295.1707252827502218571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 12:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTMzMFeZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-68c37bf73aaso28510946d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 12:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707252826; x=1707857626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnaUwQt8ZhdabiyqVHuxN8r7lqbNKbrXujih4hIp0fw=;
        b=YTMzMFeZbdxIO9/XSE5Fj/rZJVFM+W7YoD+6WiVVDe2Q5ZTGSuxv7jvV1YdytmYReh
         QDrVMk1k8b5xqyRMOKJrU9U6sS4bh1rIGqGYmM58wcrX0ZXjl1awwsEiKdIuw0TdaYqo
         YaQXFQu1Tyc50SJ6GLlBBiGvCnjH8Myynkq8QVYI6/17MluhMtValItU/VdwA5vw70+m
         G9O/v+nHR8SkCaxWMQdx358V8PPohaLIjNamrfdfoJhDWcLr3So5Qvb+/493kzQQv9it
         ybMAzYqvR304+owWZufwhxx3KPt7/qoh3tjAlg4zPjZ6oFYBn3vWIN16KyuUjeG5vRYj
         xdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707252826; x=1707857626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnaUwQt8ZhdabiyqVHuxN8r7lqbNKbrXujih4hIp0fw=;
        b=I+QDuaANU1AZu5NrrAC0GaxSOx2GeQgD3lgpH3H7ixCVzi0q8fUI7GoF55P75dV5Q+
         +4Z5j19pRfRgtW2OZ++zxdRkMkpusFO24eze2KdZMUjBTExRF2l1HlvbbUpIl4y28hre
         N+7yfiLZ5VLbrj9RPLYDAdPFTCXUrCr+qWTQw3G8Q7Qd1JQw52kV+AzEw0qEiVTeVtQq
         ZM0rsOu82VL+BXNtIHKoQkBJycgjtKjtrxkr9s/WieDZVs7I7wtdUeotIru5VySzz5hb
         UB7JWT2X31u95SIoPYpehuBI7YIcLF5H59wOMQ6z1L/OVB5uf1r+V6h2Y30f2gH5IcWt
         WafA==
X-Gm-Message-State: AOJu0Yxnm19Kk00rvpTNE2f+m5FJPqHldE+/0UVkgX/4dJ9nfohbPCBp
	fwxnSGEhANpzcoY1pgfUeQuq6RRG5AAvVumtogKJGdefwGcBM6ET
X-Google-Smtp-Source: AGHT+IHlVJsQ6xUlhRlfpn9js/p3/jfZj++81o/M47nIUSX6MylukbRfiwCDBC283GYVmzbzjS6ueQ==
X-Received: by 2002:a05:6214:5096:b0:68c:ab0e:718f with SMTP id kk22-20020a056214509600b0068cab0e718fmr4295989qvb.48.1707252826489;
        Tue, 06 Feb 2024 12:53:46 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a0e0d00b00783de6b5ccfsm1253506qkm.88.2024.02.06.12.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 12:53:45 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/6.6: update CVE exclusions
Date: Tue,  6 Feb 2024 15:53:34 -0500
Message-Id: <9db4c02a9d59d428f7864902746e9e3195d4c16c.1707252636.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1707252636.git.bruce.ashfield@gmail.com>
References: <cover.1707252636.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 20:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195033

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 3Feb24
        Date: Sat, 3 Feb 2024 00:42:14 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.6.inc               | 70 +++++++++++++++++--
 1 file changed, 64 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 9398434082..f3b3f32736 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-25 01:32:27.591716+00:00 for version 6.6.13
+# Generated at 2024-02-04 13:08:50.287438+00:00 for version 6.6.15
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.13"
+    this_version = "6.6.15"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -3668,6 +3668,10 @@ CVE_STATUS[CVE-2021-3348] = "fixed-version: Fixed from version 5.11rc6"
 
 CVE_STATUS[CVE-2021-33624] = "fixed-version: Fixed from version 5.13rc7"
 
+CVE_STATUS[CVE-2021-33630] = "fixed-version: Fixed from version 5.4rc1"
+
+CVE_STATUS[CVE-2021-33631] = "fixed-version: Fixed from version 6.2rc1"
+
 CVE_STATUS[CVE-2021-33655] = "fixed-version: Fixed from version 5.19rc6"
 
 CVE_STATUS[CVE-2021-33656] = "fixed-version: Fixed from version 5.12rc1"
@@ -4420,7 +4424,7 @@ CVE_STATUS[CVE-2022-3636] = "fixed-version: Fixed from version 5.19rc1"
 
 CVE_STATUS[CVE-2022-3640] = "fixed-version: Fixed from version 6.1rc4"
 
-# CVE-2022-36402 has no known resolution
+CVE_STATUS[CVE-2022-36402] = "fixed-version: Fixed from version 6.5"
 
 # CVE-2022-3642 has no known resolution
 
@@ -5100,8 +5104,12 @@ CVE_STATUS[CVE-2023-4622] = "fixed-version: Fixed from version 6.5rc1"
 
 CVE_STATUS[CVE-2023-4623] = "fixed-version: Fixed from version 6.6rc1"
 
+CVE_STATUS[CVE-2023-46343] = "fixed-version: Fixed from version 6.6rc7"
+
 CVE_STATUS[CVE-2023-46813] = "fixed-version: Fixed from version 6.6rc7"
 
+CVE_STATUS[CVE-2023-46838] = "cpe-stable-backport: Backported in 6.6.14"
+
 CVE_STATUS[CVE-2023-46862] = "fixed-version: Fixed from version 6.6"
 
 # CVE-2023-47233 has no known resolution
@@ -5112,10 +5120,14 @@ CVE_STATUS[CVE-2023-4881] = "fixed-version: Fixed from version 6.6rc1"
 
 CVE_STATUS[CVE-2023-4921] = "fixed-version: Fixed from version 6.6rc1"
 
-# CVE-2023-50431 has no known resolution
+CVE_STATUS[CVE-2023-50431] = "cpe-stable-backport: Backported in 6.6.14"
 
 CVE_STATUS[CVE-2023-5090] = "fixed-version: Fixed from version 6.6rc7"
 
+CVE_STATUS[CVE-2023-51042] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2023-51043] = "fixed-version: Fixed from version 6.5rc3"
+
 CVE_STATUS[CVE-2023-5158] = "fixed-version: Fixed from version 6.6rc5"
 
 CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.6.9"
@@ -5130,6 +5142,8 @@ CVE_STATUS[CVE-2023-51782] = "cpe-stable-backport: Backported in 6.6.8"
 
 CVE_STATUS[CVE-2023-5197] = "fixed-version: Fixed from version 6.6rc3"
 
+CVE_STATUS[CVE-2023-52340] = "fixed-version: Fixed from version 6.3rc1"
+
 CVE_STATUS[CVE-2023-5345] = "fixed-version: Fixed from version 6.6rc4"
 
 CVE_STATUS[CVE-2023-5633] = "fixed-version: Fixed from version 6.6rc6"
@@ -5148,6 +5162,8 @@ CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.6.4"
 
 CVE_STATUS[CVE-2023-6176] = "fixed-version: Fixed from version 6.6rc2"
 
+CVE_STATUS[CVE-2023-6200] = "cpe-stable-backport: Backported in 6.6.9"
+
 # CVE-2023-6238 has no known resolution
 
 # CVE-2023-6270 has no known resolution
@@ -5166,7 +5182,7 @@ CVE_STATUS[CVE-2023-6560] = "cpe-stable-backport: Backported in 6.6.5"
 
 CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.6.9"
 
-# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-6610] = "cpe-stable-backport: Backported in 6.6.13"
 
 CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.6.7"
 
@@ -5174,6 +5190,8 @@ CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
 
 CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.6.7"
 
+CVE_STATUS[CVE-2023-6915] = "cpe-stable-backport: Backported in 6.6.13"
+
 CVE_STATUS[CVE-2023-6931] = "cpe-stable-backport: Backported in 6.6.7"
 
 CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.6.5"
@@ -5188,5 +5206,45 @@ CVE_STATUS[CVE-2024-0340] = "fixed-version: Fixed from version 6.4rc6"
 
 CVE_STATUS[CVE-2024-0443] = "fixed-version: Fixed from version 6.4rc7"
 
-# Skipping dd=CVE-2023-1476, no affected_versions
+CVE_STATUS[CVE-2024-0562] = "fixed-version: Fixed from version 6.0rc3"
+
+# CVE-2024-0564 has no known resolution
+
+CVE_STATUS[CVE-2024-0565] = "cpe-stable-backport: Backported in 6.6.8"
+
+CVE_STATUS[CVE-2024-0582] = "cpe-stable-backport: Backported in 6.6.5"
+
+CVE_STATUS[CVE-2024-0584] = "cpe-stable-backport: Backported in 6.6.5"
+
+CVE_STATUS[CVE-2024-0607] = "cpe-stable-backport: Backported in 6.6.3"
+
+CVE_STATUS[CVE-2024-0639] = "fixed-version: Fixed from version 6.5rc1"
+
+CVE_STATUS[CVE-2024-0641] = "fixed-version: Fixed from version 6.6rc5"
+
+CVE_STATUS[CVE-2024-0646] = "cpe-stable-backport: Backported in 6.6.7"
+
+CVE_STATUS[CVE-2024-0775] = "fixed-version: Fixed from version 6.4rc2"
+
+# CVE-2024-0841 has no known resolution
+
+CVE_STATUS[CVE-2024-1085] = "cpe-stable-backport: Backported in 6.6.14"
+
+CVE_STATUS[CVE-2024-1086] = "cpe-stable-backport: Backported in 6.6.15"
+
+# CVE-2024-21803 has no known resolution
+
+# CVE-2024-22099 has no known resolution
+
+CVE_STATUS[CVE-2024-22705] = "cpe-stable-backport: Backported in 6.6.10"
+
+# CVE-2024-23307 has no known resolution
+
+# CVE-2024-23848 has no known resolution
+
+# CVE-2024-23849 has no known resolution
+
+# CVE-2024-23850 has no known resolution
+
+# CVE-2024-23851 has no known resolution
 
-- 
2.39.2


