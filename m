Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780A7C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:06:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.8638.1715256350584649868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uHLeE6tg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso735178b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256350; x=1715861150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HTjxoJI/XVr4E8+ymVDngpJDfbDIFET+M+8rpxPHxw=;
        b=uHLeE6tgGrIG8smd4GKePQEpATjt3KdVWA+nIEB4jtZuZO7C3eScadi6l/tHttiqio
         6N0cQIiBlebMOggLLUfj1gDEXNWTigSs8+GjE5BN7WBW36EgIu8pwcysD9yInMBBYzj0
         p27RA1oGD7n8FvFAm9SWEP7jg6MomBp7+bovFH7Akhgdk2fSs56DLFuyHqgIxYa7qhSE
         dgaQzpmecR5W0fufojPuB5YqI/+gfwLPawZwrsbEx0JOh8dqvEfJ9RXcBMMxhMSc25wH
         lQYRfJCMjtrtvlpDIB4l3Ei13MDXW3J3OzOsyns9zb57w7z09/bAbs6i04Dg+8h8dfx5
         aGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256350; x=1715861150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HTjxoJI/XVr4E8+ymVDngpJDfbDIFET+M+8rpxPHxw=;
        b=gWyQCtwhbf5CLGoX5GHP+Z0IwLYcFKuJ1TQiV2IXzadaB096FZOkcN0SMy+ai4j+5U
         ItmZ3ChQtZosZmclDxJ44ctI5xTBKhGkTr1UZtX9zvecZo7DxHTlxySvadzuv4/ZR/oy
         HQeznFXRsEvN2Jtra1Oggy6vz6gDAe7oyVaGV4muNhlrZzWaB2URorQsC08Nh15spPDY
         nVAiUD9F3HorP1LJPw+K4ys8Nes1y4kKizmb7L0hVRJbzN5M+ZvOz+cmCtrqk2AC3Msf
         +j2dQcvzmQGsTLyRgPma6iKEgUWIekOFifu10RvDHQZINjfmqp3M18nu0R9bUqEmPT0V
         C7ig==
X-Gm-Message-State: AOJu0YzP9dEfpgeTEhMCKznMZtmxPesvFdJqsrRVTbZS54fL0rgSzNJk
	flFZB306q1WVJvc/z+ioZyzbUgEhhA0RahCHlGBwYzYNSxTJzQuU2kbr5FdmvngFOxz7AL/y6P3
	P
X-Google-Smtp-Source: AGHT+IEJFjEhiC2TWwjkGA2/cJOqCtwpeAJEubwQe867nYsVtcvHyNSTQLTrz1b0JFyJMHYOFuF0ag==
X-Received: by 2002:a62:ea14:0:b0:6ea:bdbc:6a4 with SMTP id d2e1a72fcca58-6f49c211f87mr5218890b3a.13.1715256349765;
        Thu, 09 May 2024 05:05:49 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/23] linux-yocto/5.15: update CVE exclusions (5.15.157)
Date: Thu,  9 May 2024 05:04:57 -0700
Message-Id: <22c349296ebfa66b5ce2b189d4b72741c193d914.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199166

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 8Apr24
        Date: Tue, 9 Apr 2024 18:19:11 -0400

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 78ff1365db..f5ccf2bc22 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-25 15:13:47.533247 for version 5.15.156
+# Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.156"
+    this_version = "5.15.157"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


