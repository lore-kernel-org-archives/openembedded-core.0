Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6852CC47DDF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:36 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.5987.1705698872347170246
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZhGyD35;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5e89ba9810aso10680377b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698871; x=1706303671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLxN/xbvEYt6tw0W4xvhwKYUh4nAbcq3EL2DuhrUCzU=;
        b=WZhGyD35hx7VmBKHJKxgrzhvGHsywdWhfCdi+RAZJdC55XB+AvUm2YDs/1np1eD6zS
         PTAy4onjgBYaVzL6NBBYRHkpTDQDSD9xtKO2ynWP8k9A966HMKVs46cK9p/5RsWYkrxz
         erBbZ8wpq3DNcjuemlUNi3LH4ujr6OpciflEMMBLlmX5Vrkg1IO6j1IKEvTZ+Ax8GnyF
         fpcLenGoKyDs+jN7Zjl5BleuntOgCO2JzRg572e7bOEGnZH5vcR1wxMgkE9DWWmbMtlh
         hxXzY+jf9pMFDdhclQybA8JQ9XtpiCNz1Wv7xkSijiHo6h5bPyplRwc/duV9P+z2QknT
         VVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698871; x=1706303671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLxN/xbvEYt6tw0W4xvhwKYUh4nAbcq3EL2DuhrUCzU=;
        b=a5hEynpsavgsvhKxTXUl1YPZvkdQewsQk9KXzd8B/k1dI8HLOK3EDjpqWt2DVqT7A8
         Zoz2GIzyHD+Dg9MlhUmpJUL0l09kuf0CIiA55eeg01D2PCsuwsYI4Xx3K9hkVNNftSq9
         5SdcnDOsGnAewVr9ULppGAmpB1Y5qteoagd5d67DAqNIWlWs3yBGs1U6uQdZr2yQ4KLK
         sdxOHbjz8Z+B+ccgI1W7id+YppV75aekhqr0767iHISkvFu+X6JBpGm3SxgMgVo4mRZS
         5vdVOus2f9xKwGQYKtV10v0qtmeBIYeLu9LiOqul+mzRFA9nNhPNGUfGYdP5qPBglwHN
         yVaA==
X-Gm-Message-State: AOJu0Yxmfq9q0F8+4tvw5umniNy/COBxj58YIx6josDkiUM2botA6Zrd
	FFuEIOGL4XKRU6m2GbJT6yS0WiPfyZ2cUEaxhlCHfnqOGSJcJzlM7nETYQeWi0Q=
X-Google-Smtp-Source: AGHT+IGS7syvAPmULHxe901NjTzmjz8dYh/LP6HUQc7EYE6mbNcYGy9RCPfYskejzQ+6MtorKyIFrQ==
X-Received: by 2002:a25:8e12:0:b0:dc2:2816:a693 with SMTP id p18-20020a258e12000000b00dc22816a693mr503927ybl.110.1705698871411;
        Fri, 19 Jan 2024 13:14:31 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:30 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] linux-yocto/6.6: update CVE exclusions
Date: Fri, 19 Jan 2024 16:14:17 -0500
Message-Id: <15028acbd9c71b6a5146f4041194a144a52a0328.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194075

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
 .../linux/cve-exclusion_6.6.inc               | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 2b74d3585d..3a4451b6f8 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-11 15:23:15.711210+00:00 for version 6.6.11
+# Generated at 2024-01-18 21:07:26.764606+00:00 for version 6.6.12
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.11"
+    this_version = "6.6.12"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4584,6 +4584,8 @@ CVE_STATUS[CVE-2022-48425] = "fixed-version: Fixed from version 6.4rc1"
 
 CVE_STATUS[CVE-2022-48502] = "fixed-version: Fixed from version 6.2rc1"
 
+CVE_STATUS[CVE-2022-48619] = "fixed-version: Fixed from version 5.18rc1"
+
 CVE_STATUS[CVE-2023-0030] = "fixed-version: Fixed from version 5.0rc1"
 
 CVE_STATUS[CVE-2023-0045] = "fixed-version: Fixed from version 6.2rc3"
@@ -4666,6 +4668,8 @@ CVE_STATUS[CVE-2023-1382] = "fixed-version: Fixed from version 6.1rc7"
 
 CVE_STATUS[CVE-2023-1390] = "fixed-version: Fixed from version 5.11rc4"
 
+# CVE-2023-1476 has no known resolution
+
 CVE_STATUS[CVE-2023-1513] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-1582] = "fixed-version: Fixed from version 5.17rc4"
@@ -5114,7 +5118,7 @@ CVE_STATUS[CVE-2023-5090] = "fixed-version: Fixed from version 6.6rc7"
 
 CVE_STATUS[CVE-2023-5158] = "fixed-version: Fixed from version 6.6rc5"
 
-# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-51779] = "cpe-stable-backport: Backported in 6.6.9"
 
 CVE_STATUS[CVE-2023-5178] = "fixed-version: Fixed from version 6.6rc7"
 
@@ -5136,6 +5140,8 @@ CVE_STATUS[CVE-2023-5972] = "fixed-version: Fixed from version 6.6rc7"
 
 CVE_STATUS[CVE-2023-6039] = "fixed-version: Fixed from version 6.5rc5"
 
+CVE_STATUS[CVE-2023-6040] = "fixed-version: Fixed from version 5.18rc1"
+
 CVE_STATUS[CVE-2023-6111] = "cpe-stable-backport: Backported in 6.6.3"
 
 CVE_STATUS[CVE-2023-6121] = "cpe-stable-backport: Backported in 6.6.4"
@@ -5144,8 +5150,12 @@ CVE_STATUS[CVE-2023-6176] = "fixed-version: Fixed from version 6.6rc2"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6270 has no known resolution
+
 # CVE-2023-6356 has no known resolution
 
+CVE_STATUS[CVE-2023-6531] = "cpe-stable-backport: Backported in 6.6.7"
+
 # CVE-2023-6535 has no known resolution
 
 # CVE-2023-6536 has no known resolution
@@ -5154,13 +5164,13 @@ CVE_STATUS[CVE-2023-6546] = "fixed-version: Fixed from version 6.5rc7"
 
 CVE_STATUS[CVE-2023-6560] = "cpe-stable-backport: Backported in 6.6.5"
 
-# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
+CVE_STATUS[CVE-2023-6606] = "cpe-stable-backport: Backported in 6.6.9"
 
 # CVE-2023-6610 needs backporting (fixed from 6.7rc7)
 
 CVE_STATUS[CVE-2023-6622] = "cpe-stable-backport: Backported in 6.6.7"
 
-# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
+CVE_STATUS[CVE-2023-6679] = "fixed-version: only affects 6.7rc1 onwards"
 
 CVE_STATUS[CVE-2023-6817] = "cpe-stable-backport: Backported in 6.6.7"
 
@@ -5170,3 +5180,13 @@ CVE_STATUS[CVE-2023-6932] = "cpe-stable-backport: Backported in 6.6.5"
 
 # CVE-2023-7042 has no known resolution
 
+CVE_STATUS[CVE-2023-7192] = "fixed-version: Fixed from version 6.3rc1"
+
+CVE_STATUS[CVE-2024-0193] = "cpe-stable-backport: Backported in 6.6.10"
+
+CVE_STATUS[CVE-2024-0340] = "fixed-version: Fixed from version 6.4rc6"
+
+CVE_STATUS[CVE-2024-0443] = "fixed-version: Fixed from version 6.4rc7"
+
+# Skipping dd=CVE-2023-1476, no affected_versions
+
-- 
2.39.2


