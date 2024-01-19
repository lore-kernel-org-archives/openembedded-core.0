Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7D5C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.6085.1705698874852339689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NySWkjmF;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5988e55ede0so575006eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698874; x=1706303674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fssa4lRJslytQrgOecXVwjZKhrT10p7DLTgf/0QJ4I=;
        b=NySWkjmFNtXZNlvy8ViO1bIL6dOCKR0ecEEqi1lxncZPKf2fVHtKMMqgnEjIunNE5o
         2Y/de7zJisKlZeuT2pk6pTnoDfKtktBbyiraPBtHgxmp6AzveTVR6dhjR++6Te5KYxt9
         hbo5hG7AmZHwYQQ6bTstZRulHDPLeT5yzEz55jp22r+KB7xLyyeqEK/dDYyxCTrAxqOS
         V7psiSbGHQzGAa1AVtJ+McobmErdAN+tXWC/ogTQ57CXbmi8b+4b4XVw9ekUrhsaxMnI
         nrv3yNEYLXlBAH8bASpRK22DNOGiPJto6M18DXc59Xi6y3e70oWVgu3ZgQcOBPppq3Xc
         TUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698874; x=1706303674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fssa4lRJslytQrgOecXVwjZKhrT10p7DLTgf/0QJ4I=;
        b=bKAQ/nxOF2Tf5nPaXLoMA6wM4yBMqPuEOt9zaIKdQXWJgLKrdNvqUdDrYl7RviW28E
         UNpSLibr4F0Tw365yJJf30lB2v+cv96wjQYDHt0D8EUarGwj+QJOz3w7fWl1ljff9Pdg
         3VGnbMldb+0J/YAeM63GS7dKt152DBp5Ms3OM6l5SXO/hS7Kr7fTW7N8MWvSGZNp6nlZ
         PJrAZBacngFtbmrI5DJsflZQj3Lm1lXETSn/peIjyAwFJK17xQexYPHPxiCajebbEZB3
         rzvgh+Uvh3cV/ezkTCMc75iRfUI/INL+o68oB59RI4tXDYN69OuBlWoMY9+Rmq0EpVVK
         MzBA==
X-Gm-Message-State: AOJu0Yys5pVdMsFBwbF12zYNGVHKpuifc6PYXHREsloxSKb63x7SvNAF
	9La0GXw3iy791JxPdL/x78oWkumUxZbzRgDxgQy0C3PzxS2B2m1A
X-Google-Smtp-Source: AGHT+IGYt2Srn/IFbiMNLyCd5rHbZ7F9NS9V/B4eODcnKoCipTMraedm7H/Bin7ZGc6sUvOZ1VJbzg==
X-Received: by 2002:a05:6358:5e15:b0:176:1472:429a with SMTP id q21-20020a0563585e1500b001761472429amr375252rwn.64.1705698873912;
        Fri, 19 Jan 2024 13:14:33 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:33 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/11] linux-yocto/6.1: update CVE exclusions
Date: Fri, 19 Jan 2024 16:14:19 -0500
Message-Id: <3fb37bf22503d9fd70f5213a940e220dc873250a.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194077

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 15Jan24
        Date: Mon, 15 Jan 2024 12:48:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.1.inc               | 34 +++++++++++++++----
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 9e0c5bc49e..04fd2c021d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-11 18:31:26.124059+00:00 for version 6.1.72
+# Generated at 2024-01-18 21:10:06.148505+00:00 for version 6.1.73
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.72"
+    this_version = "6.1.73"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4584,6 +4584,8 @@ CVE_STATUS[CVE-2022-48425] = "cpe-stable-backport: Backported in 6.1.33"
 
 CVE_STATUS[CVE-2022-48502] = "cpe-stable-backport: Backported in 6.1.40"
 
+CVE_STATUS[CVE-2022-48619] = "fixed-version: Fixed from version 5.18rc1"
+
 CVE_STATUS[CVE-2023-0030] = "fixed-version: Fixed from version 5.0rc1"
 
 CVE_STATUS[CVE-2023-0045] = "cpe-stable-backport: Backported in 6.1.5"
@@ -4644,7 +4646,7 @@ CVE_STATUS[CVE-2023-1118] = "cpe-stable-backport: Backported in 6.1.16"
 
 CVE_STATUS[CVE-2023-1192] = "cpe-stable-backport: Backported in 6.1.33"
 
-# CVE-2023-1193 needs backporting (fixed from 6.3rc6)
+CVE_STATUS[CVE-2023-1193] = "cpe-stable-backport: Backported in 6.1.71"
 
 CVE_STATUS[CVE-2023-1194] = "cpe-stable-backport: Backported in 6.1.34"
 
@@ -4666,6 +4668,8 @@ CVE_STATUS[CVE-2023-1382] = "fixed-version: Fixed from version 6.1rc7"
 
 CVE_STATUS[CVE-2023-1390] = "fixed-version: Fixed from version 5.11rc4"
 
+# CVE-2023-1476 has no known resolution
+
 CVE_STATUS[CVE-2023-1513] = "cpe-stable-backport: Backported in 6.1.13"
 
 CVE_STATUS[CVE-2023-1582] = "fixed-version: Fixed from version 5.17rc4"
@@ -5088,7 +5092,7 @@ CVE_STATUS[CVE-2023-45871] = "cpe-stable-backport: Backported in 6.1.53"
 
 CVE_STATUS[CVE-2023-45898] = "fixed-version: only affects 6.5rc1 onwards"
 
-# CVE-2023-4610 needs backporting (fixed from 6.4)
+CVE_STATUS[CVE-2023-4610] = "fixed-version: only affects 6.4rc1 onwards"
 
 CVE_STATUS[CVE-2023-4611] = "fixed-version: only affects 6.4rc1 onwards"
 
@@ -5114,7 +5118,7 @@ CVE_STATUS[CVE-2023-5090] = "cpe-stable-backport: Backported in 6.1.62"
 
 CVE_STATUS[CVE-2023-5158] = "cpe-stable-backport: Backported in 6.1.57"
 
-# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.1.70"
 
 CVE_STATUS[CVE-2023-5178] = "cpe-stable-backport: Backported in 6.1.60"
 
@@ -5136,6 +5140,8 @@ CVE_STATUS[CVE-2023-5972] = "fixed-version: only affects 6.2rc1 onwards"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
+CVE_STATUS[CVE-2023-6040] = "fixed-version: Fixed from version 5.18rc1"
+
 CVE_STATUS[CVE-2023-6111] = "fixed-version: only affects 6.6rc3 onwards"
 
 CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.1.65"
@@ -5144,8 +5150,12 @@ CVE_STATUS[CVE-2023-6176] = "cpe-stable-backport: Backported in 6.1.54"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6270 has no known resolution
+
 # CVE-2023-6356 has no known resolution
 
+CVE_STATUS[CVE-2023-6531] = "cpe-stable-backport: Backported in 6.1.68"
+
 # CVE-2023-6535 has no known resolution
 
 # CVE-2023-6536 has no known resolution
@@ -5154,13 +5164,13 @@ CVE_STATUS[CVE-2023-6546] = "cpe-stable-backport: Backported in 6.1.47"
 
 # CVE-2023-6560 needs backporting (fixed from 6.7rc4)
 
-# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.1.70"
 
 # CVE-2023-6610 needs backporting (fixed from 6.7rc7)
 
 CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.1.68"
 
-# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
+CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
 
 CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.1.68"
 
@@ -5170,3 +5180,13 @@ CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.1.66"
 
 # CVE-2023-7042 has no known resolution
 
+CVE_STATUS[CVE-2023-7192] = "cpe-stable-backport: Backported in 6.1.18"
+
+CVE_STATUS[CVE-2024-0193] = "fixed-version: only affects 6.5rc6 onwards"
+
+# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
+
+CVE_STATUS[CVE-2024-0443] = "fixed-version: only affects 6.2rc1 onwards"
+
+# Skipping dd=CVE-2023-1476, no affected_versions
+
-- 
2.39.2


