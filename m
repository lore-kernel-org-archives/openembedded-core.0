Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCB7C54788
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:45:24 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.4728.1708483516580824249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fU3+uukr;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78772fc9ceaso114740585a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483515; x=1709088315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64PFUKcNHOj5pQB3dtSDGMUtN6viP1qdSy0Xd98gM3c=;
        b=fU3+uukr8sfxQ06z2rGkM2VwbALwkwBJ5Chex7yPLoYbagxMAYY58ZVpRjvtMu1zXL
         yDnznH144Sy0OlRsz6o4c3O4m/W3cO+F3z5s7VxcJZwOKXQlaa+M+L+/gGxUWZayxwtB
         Lh2ooALD++2VeB55q0JJFVz/sBbrys0yCMMWxXbyvGvoixfr/VApoSbr1Ua+vCX3/R+N
         tXsBqGHLrbeOYb+QgrHle/Rq6hY28YBrMotwQXjG8+hGR8uRTN0caa1XEdRpU+HCRLJY
         S7tD9ac533GnUAyV3f0mXo7ZOsskX9N6bwEMnnpMWYVXfQvRLcAmtRCKe8h7u1/BptGY
         QtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483515; x=1709088315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64PFUKcNHOj5pQB3dtSDGMUtN6viP1qdSy0Xd98gM3c=;
        b=kYZ0fk53WH6l4zCBKaoEhWWyCIfznQXMNYH4j3lwHh7yQffGJFP2RsA5Lvxfy5AijH
         WsGACo8j2e8drqZcReGM32Z1sacp9cmydkEILRucN0YQUUyoyzJUedNcnBk+St1UTtmg
         I4fkVocsnsFYmF1FJwcwuiGWVqqhyQgPxdqiGlXMGY4E1AsNqKH4NPPbzHnViLen7rPp
         7M9cw7FDjTXFnI0EneUJVQEdnBT+QPaiHizHvKIvFhRtT76yR40GtD62rqlwub+4XuJE
         y4GUfduABWMsILne8XCnXBH3SUQup1GUnJDcUoqj+THKYFx+XfoF/RArBBYZlBn39mmv
         cRGg==
X-Gm-Message-State: AOJu0YxZSRSex3+1znwcXNGEGv7LoPzAExVpOf2l5+W2cwtpXeu1EFXr
	8u5ZR15S289mPd/+Z4IT/Rqf65RjpCy8u60jxrviShKF76nWTSxC
X-Google-Smtp-Source: AGHT+IHoGARyKzewFuF8wlFzuJbI9e4MNUF9lryA8KelcAmPqO7Q5ftspXq25nVQe/Eihk8ObL2WVA==
X-Received: by 2002:a05:620a:44c5:b0:787:263f:9a0 with SMTP id y5-20020a05620a44c500b00787263f09a0mr21520301qkp.57.1708483515490;
        Tue, 20 Feb 2024 18:45:15 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id wa23-20020a05620a4d1700b0078742e741cfsm3945398qkn.61.2024.02.20.18.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:45:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] linux-yocto/5.15: update CVE exclusions
Date: Tue, 20 Feb 2024 21:44:59 -0500
Message-Id: <20240221024500.3239062-12-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
References: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195949

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
 .../linux/cve-exclusion_5.15.inc              | 91 +++++++++++++++++--
 1 file changed, 85 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 0d54b414d9..d33f2b3c7f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-18 18:47:24.084935 for version 5.15.147
+# Generated at 2024-02-06 21:02:11.546853 for version 5.15.148
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.147"
+    this_version = "5.15.148"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5299,6 +5299,12 @@ CVE_CHECK_IGNORE += "CVE-2021-3348"
 # fixed-version: Fixed after version 5.13rc7
 CVE_CHECK_IGNORE += "CVE-2021-33624"
 
+# fixed-version: Fixed after version 5.4rc1
+CVE_CHECK_IGNORE += "CVE-2021-33630"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2021-33631"
+
 # cpe-stable-backport: Backported in 5.15.54
 CVE_CHECK_IGNORE += "CVE-2021-33655"
 
@@ -6395,7 +6401,8 @@ CVE_CHECK_IGNORE += "CVE-2022-3635"
 # fixed-version: only affects 5.19 onwards
 CVE_CHECK_IGNORE += "CVE-2022-3640"
 
-# CVE-2022-36402 has no known resolution
+# cpe-stable-backport: Backported in 5.15.129
+CVE_CHECK_IGNORE += "CVE-2022-36402"
 
 # CVE-2022-3642 has no known resolution
 
@@ -7368,9 +7375,15 @@ CVE_CHECK_IGNORE += "CVE-2023-4611"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-4623"
 
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-46343"
+
 # cpe-stable-backport: Backported in 5.15.137
 CVE_CHECK_IGNORE += "CVE-2023-46813"
 
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-46838"
+
 # cpe-stable-backport: Backported in 5.15.140
 CVE_CHECK_IGNORE += "CVE-2023-46862"
 
@@ -7385,11 +7398,17 @@ CVE_CHECK_IGNORE += "CVE-2023-4881"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-4921"
 
-# CVE-2023-50431 has no known resolution
+# CVE-2023-50431 needs backporting (fixed from 6.8rc1)
 
 # fixed-version: only affects 6.0rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5090"
 
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-51042"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-51043"
+
 # cpe-stable-backport: Backported in 5.15.135
 CVE_CHECK_IGNORE += "CVE-2023-5158"
 
@@ -7411,6 +7430,9 @@ CVE_CHECK_IGNORE += "CVE-2023-51782"
 # cpe-stable-backport: Backported in 5.15.134
 CVE_CHECK_IGNORE += "CVE-2023-5197"
 
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2023-52340"
+
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-5345"
 
@@ -7425,7 +7447,8 @@ CVE_CHECK_IGNORE += "CVE-2023-5972"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
-# CVE-2023-6040 needs backporting (fixed from 5.18rc1)
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2023-6040"
 
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_IGNORE += "CVE-2023-6111"
@@ -7436,6 +7459,9 @@ CVE_CHECK_IGNORE += "CVE-2023-6121"
 # cpe-stable-backport: Backported in 5.15.132
 CVE_CHECK_IGNORE += "CVE-2023-6176"
 
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6200"
+
 # CVE-2023-6238 has no known resolution
 
 # CVE-2023-6270 has no known resolution
@@ -7468,6 +7494,9 @@ CVE_CHECK_IGNORE += "CVE-2023-6679"
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6817"
 
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-6915"
+
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6931"
 
@@ -7487,5 +7516,55 @@ CVE_CHECK_IGNORE += "CVE-2024-0193"
 # fixed-version: only affects 6.2rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2024-0443"
 
-# Skipping dd=CVE-2023-1476, no affected_versions
+# cpe-stable-backport: Backported in 5.15.64
+CVE_CHECK_IGNORE += "CVE-2024-0562"
+
+# CVE-2024-0564 has no known resolution
+
+# CVE-2024-0565 needs backporting (fixed from 6.7rc6)
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0582"
+
+# cpe-stable-backport: Backported in 5.15.142
+CVE_CHECK_IGNORE += "CVE-2024-0584"
+
+# cpe-stable-backport: Backported in 5.15.140
+CVE_CHECK_IGNORE += "CVE-2024-0607"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2024-0639"
+
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2024-0641"
+
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2024-0646"
+
+# cpe-stable-backport: Backported in 5.15.112
+CVE_CHECK_IGNORE += "CVE-2024-0775"
+
+# CVE-2024-0841 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-1085"
+
+# CVE-2024-1086 needs backporting (fixed from 6.8rc2)
+
+# CVE-2024-21803 has no known resolution
+
+# CVE-2024-22099 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2024-22705"
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


