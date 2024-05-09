Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CBDC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:30 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.8394.1715256326411983076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UPHD0Zyd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f447976de7so744814b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256325; x=1715861125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP9oOT4z5TLqC4g/aH4/kOL7QFCLzdTkG8OfS07VEpE=;
        b=UPHD0Zydifeq0Xlb48V0tR3J7PL9+DloA3ru59V7a494FH0fla0pLitRbCgEqF0EYh
         g9k7k3JV4zpZLf8BXkHZ9RW4uyQ1npigtbI44GaprgQ0D4nwe8uWvkSZJ0jRs9/eUpvD
         JhhUkJm812wis8UHH0aRMpt66AGgFoQy3egD+70ao9Ro7fYdhczlaTNoTj0v11Y0gh35
         PDhSonfwF0clLTqlscg5CPNbl5Wn0AaLNMxfFYevwzjYHjyYdQablzRnIokTK8/1eQw1
         I2qf/RAhaCZtxIzjCYiLg5coAW2T0PCK+fvC6vhRBGaqR3HGGECAHpEXpd59ECNZk4/6
         epLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256325; x=1715861125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pP9oOT4z5TLqC4g/aH4/kOL7QFCLzdTkG8OfS07VEpE=;
        b=nGbcyMJ3H3etf+exQLC1rcdl8SbGYug0oISFb4MGdF760abspwzMFqvovnx5/p3aq6
         kkoesdwcj4Mppxf6IOjShc4VwcTFaJGn1mgcmetZjQRiGV62WteK8ja3sxi+jZbXT+hP
         lOvXtAZ094UCgyc4pNqEDT/WjFulp7MGzBUnKiU5xAvhInozgTRnXSrfARNiQRQS22d0
         V21CwzwXRp1kX19w4Qdso8+Ord1DFALEu0MSeIR8pJWR/FDwHuw8Hz6LHpzD/kHjkJMI
         T2zDPSeul+4QZVf6n/WVcVb84DBhMJA0mgwGSWUqNZoncZkycX2oIMVUR7+9VkDZCdM4
         e7lg==
X-Gm-Message-State: AOJu0Ywz59v0yECkYqs/j1uuqbaIxr/mtKKkrDKDIoJ1d/kfLWtX+Nt6
	NX1ETV7sLfg1v9Sf7LZZHt5EAQlTOrw1FqqlE3HufoodIQqYr/UlGSAmr/YLAPtIgXZ6/BGSm4F
	T
X-Google-Smtp-Source: AGHT+IFFb6caD2FQiwmeNjBQMPZ2WGkzN1zaxUdyq3D8fr3g2/PtbJ/cZf976VNQEFHwqVLoWRPuGw==
X-Received: by 2002:a05:6a20:96c1:b0:1a8:4254:5cdf with SMTP id adf61e73a8af0-1afc8d78a89mr5494463637.22.1715256325530;
        Thu, 09 May 2024 05:05:25 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/23] linux-yocto/5.15: update CVE exclusions (5.15.152)
Date: Thu,  9 May 2024 05:04:49 -0700
Message-Id: <a3a17801a9d185f0c181b93e399092032d6ffa4a.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199158

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 32e066bda4..f60ba5177a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-12 23:12:55.402667 for version 5.15.151
+# Generated at 2024-03-19 17:41:49.053760 for version 5.15.152
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.151"
+    this_version = "5.15.152"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


