Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621FCC25B4F
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:50 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.8404.1715256347341834466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U3u+mvlL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f45020ac2cso679082b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256346; x=1715861146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xc+va1QzaC5t8vGGDAZjt6b0W95COJQwCNhNZ5O2odM=;
        b=U3u+mvlLLYKANj0IyAEjpnDw6AUlSyQmHG0UUK1P6cbBGjW+8b2rK3iIWlrP5bgCTp
         CnB9P9fqnIVnrkOVHPXbo7ahVFwDDb8ZPChSe8/Brdr6PdCyjNcEKSYg41MeTXngDDMl
         TClHYUz3PV/7sUW38tXxZjGIzM2Y5mZOXI3c41WseI/Df0hRcatYK5UdL0ZbSrV62Bj2
         4cza2Y/mYV6DbO5vDFyMepKskEPZJ9ZvJxJMyLKWKBirIEFO4oYakXEUsdFXa4UZoTNJ
         Fo7Dwk6T8fRTG9yKQ+E6GBIv/STDDlHrWliCS6AN+DMr39Cg81l8K/o7hHgDYLxGCCKq
         FBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256346; x=1715861146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc+va1QzaC5t8vGGDAZjt6b0W95COJQwCNhNZ5O2odM=;
        b=mB8RipdcQnJplyVa3kfmbABz+744IWAoM07fod4CJzNnGSHrrC8+IJiVpZvscqClf1
         ET+RBbokaefavLzXqJ0BbUiVyWZy1GiaYj21Wxw73lUbhm9/IlzSznRUO16Y0f/U3msa
         hlbkh3bmXgcz2KEMEt6GCgPs8hQax9+BFXN5ppUhq6BmEzY5CyVMNtU19i8FIbQwgz5m
         lM1HY03kwvU7Col6L8Bbox3gh4ljzefk2v6XhmobqFbEn66D1qI+jiaa2HMuW0GZrVfx
         Fui13SQuNAyB6AZ91lqWkXhjuuVgjajBl0Hi2rsGsn220gj3ubhY/hqPW0J3yYkTvO+S
         UE9g==
X-Gm-Message-State: AOJu0YyyrYjnRJjavkSh2NKt2c189vcHEuxeuem2EsbuZiweLM6NwxcP
	HZe4z+uBHgYeptWmfnrq8Esfio9YOPLGq1rREv1mjGsnZzFABiquwU+ydOH8i9Unsk5jQwa5NaN
	U
X-Google-Smtp-Source: AGHT+IGc36YPeaofGXGwcX70nnn4WV166h80ebsBpniSUzVjL1Y+uP0XsspSNQiaexKIx0O+I7Xu+A==
X-Received: by 2002:aa7:82d2:0:b0:6f4:74b5:f536 with SMTP id d2e1a72fcca58-6f49c2ae8b5mr5550045b3a.34.1715256346484;
        Thu, 09 May 2024 05:05:46 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/23] linux-yocto/5.15: update CVE exclusions (5.15.156)
Date: Thu,  9 May 2024 05:04:55 -0700
Message-Id: <239e0631d9d38a3a1e444f0691b1a4f6b5796140.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199164

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
2.34.1


