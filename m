Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AFFC54722
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:52 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.9397.1724319342933273548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AanxCSZG;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bf068aebe5so943051a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319341; x=1724924141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnDq8RR4rCgHr+FlJTDLXhs+NzEA2UPnoSTd2A8Wr0U=;
        b=AanxCSZGYFYRYL8bMiXQO3KT4sKyh904eLUs4FcHpxwTXpPf/z226lZeI9VXsWfzgC
         V20sOifT3ByqXIzNDGB+LpEF+YM9YqQSjo8gPq6S4uEc/2JYsEQOt70UPyMUpolcTMY9
         Oi6pHTwInlfMLyL0D5coejaZ0sOLpoxgoOevt0GzLFygd1CPzl0x9Pccuqfb3peakiiJ
         9+joo9M2CTHm5phSaDT4YfJkksCOVmO1uzRTUiETLBzSFOCsm+0eQiLMnv9xfyuQzNdh
         sZP2LCMzk1j02zmUgoEBxIaiTc05nsJ3Y39lOnLQDn/pXZ0MyeOeJfjp0i/BlHPsFz6d
         5hGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319341; x=1724924141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnDq8RR4rCgHr+FlJTDLXhs+NzEA2UPnoSTd2A8Wr0U=;
        b=RzysEQG/8+h/PSwZ9YDwWAlwHX8j4d571MObEX2+xROwpPgwvD0hQMr0ESw/6q2nxf
         gplHwv+QRug7a24LzzAjQaX6vrkPIDA7ImP5XEYgXtRG7jPefHH0n5G0ujU4MniUXD34
         4Hk+d+E+MjlXXTN/P4wJG68Sj4wJvgzdDrEPuYDRl1zXUmd2XnZloxlaOrZQ2aAaGj8i
         koDBZYvGH7tnqei9C2vtCVqJ9GB4p7TJNocdRugT4037TtafXbMvivS/rDgmG5IwCf0t
         COgTX+RxXZV9sVG1Y4RrpzNcnbvb6ALhHs41HiSCu4Bz9DItNMt9XtGtCOOcgv7Mf58Q
         Z7XQ==
X-Gm-Message-State: AOJu0Yw7c0fG7tYmLIZQ72j6H5VcFUQ4BSMQ3YsLtXVSQ38xd5Ml/zhn
	HihALN4zsiHKP5XPp8XoSV+zHSKzBKwZE7QyOlChsH884X7J9Ipjyq4lmQ==
X-Google-Smtp-Source: AGHT+IFKk/8uq8IGe/odNFii/n6pP0pizhivZ9wCq/hOP2hEyMjDAQV3RvqQvDvn23jwZeRPqOQl0g==
X-Received: by 2002:a05:6402:42c8:b0:5af:3af2:e2df with SMTP id 4fb4d7f45d1cf-5bf1f23a876mr2810106a12.30.1724319340900;
        Thu, 22 Aug 2024 02:35:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/32] python3-uritools: upgrade 4.0.2 -> 4.0.3
Date: Thu, 22 Aug 2024 11:35:14 +0200
Message-Id: <20240822093521.36790-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203640

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-uritools_4.0.2.bb => python3-uritools_4.0.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-uritools_4.0.2.bb => python3-uritools_4.0.3.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb b/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-uritools_4.0.2.bb
rename to meta/recipes-devtools/python/python3-uritools_4.0.3.bb
index 693d1974be2..640c3f3ab67 100644
--- a/meta/recipes-devtools/python/python3-uritools_4.0.2.bb
+++ b/meta/recipes-devtools/python/python3-uritools_4.0.3.bb
@@ -2,9 +2,9 @@ SUMMARY = "URI parsing, classification and composition"
 HOMEPAGE = "https://github.com/tkem/uritools/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1ec55353c80c662e4255f8889a0ca558"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
 
-SRC_URI[sha256sum] = "04df2b787d0eb76200e8319382a03562fbfe4741fd66c15506b08d3b8211d573"
+SRC_URI[sha256sum] = "ee06a182a9c849464ce9d5fa917539aacc8edd2a4924d1b7aabeeecabcae3bc2"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.39.2


