Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D925C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:18 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.4237.1719778090556008095
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZDSHlvXh;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3762c172d9aso10312485ab.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778090; x=1720382890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VjAz81Vxg6+IeVVFvY2whyC0J0Va95ag8XAh60DzHM=;
        b=ZDSHlvXhgY1Zx8g+ihdmX6dKcL2/FsklSP9NjZ4BTt26/KQZ1Zehk/kammHrvs+B98
         bNLd+o1stlHo1cFDUslTacaXxniwBLnnCsCjcry9bKmoKK0srmx4a+Ny2kCrASRGtkQS
         8cBBApz9rjKP7URiAya4WvLPh0sJ65sjGKxeoJgIMxxO7D3Byf4v+Eb9C+/ddDiSYOTM
         qYSXCWAgunEVcOsOC+/GbG1N2LxJcCVqSFvQO0xTh3TelxXUTo91+yIbIoQXLAFTDS8t
         8bXxmMqY7sxusr8a8brrBVrQq+zWUh9Jh05di9NjVGMyw0g/e49QqhqBb97HS3hK/aC0
         VHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778090; x=1720382890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VjAz81Vxg6+IeVVFvY2whyC0J0Va95ag8XAh60DzHM=;
        b=D2cVwyrD5Kv1uGqO9gjWOKL57SiAhB3V7F3ymfgC+4RchOVCMNlbGLqTSMUkcorSy+
         +9MnsxoIGJwOdjoWHoFJXq+aTXKzcA4IY7gpRDc3FAw92El8w/SolDO2MCnUGVTjmkao
         y6n/mvx2igd9fyG4yY2hjetypQPZO8wofWYyuDNg0kmkywF1ToDF+721soJeQZEYZmOA
         DENe3QmWu6h/+bJKreGlIOKEOWKba1gi9CRsd+UYBswpOGTc75iPX4weYJkKzMqIcdCP
         sQcQrjkBM0ZLXyMwKlLMth1P85zPkebFOjltESoWBDWR5na9n+54n0N6BpdLY39kci4k
         EsTw==
X-Gm-Message-State: AOJu0YwgAPL7MbiKuP0tsdZ959tGH86PVJi/Y+W77PT5ngf6WHf21/ca
	65AdrG7jM5+Bh2+OlT5yKdQh2jGsJ6Z9vxCZ4UBfCqLaajVwMNrGQ8CgkbFy56rtoHAy4wKv0tf
	pJ08=
X-Google-Smtp-Source: AGHT+IGmzE+/f2gf5aSXb+stkNeyIYprCoaQaxy2b5l0tWW0hP4SgJjZfW7nM3w2bACk6YhGL0rshw==
X-Received: by 2002:a05:6e02:12ed:b0:377:14a7:fc7a with SMTP id e9e14a558f8ab-37cd0edf9d7mr53959495ab.12.1719778089686;
        Sun, 30 Jun 2024 13:08:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/35] linux-yocto/6.6: update CVE exclusions (6.6.24)
Date: Sun, 30 Jun 2024 13:07:22 -0700
Message-Id: <265c96e36ee4c49c970bee315bf9614dc958a8ae.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201247

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d941200509cd215e1c8cde5be9875b5e61ec76ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index bb9ba49c48..133cab88a3 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-28 16:40:04.102652+00:00 for version 6.6.23
+# Generated at 2024-04-04 03:23:25.421265+00:00 for version 6.6.24
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.23"
+    this_version = "6.6.24"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


