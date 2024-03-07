Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C647C54E58
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:34:22 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.2721.1709840054821974274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nfz+LNkF;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-68f901192afso420496d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 11:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709840054; x=1710444854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwMPL87mrNAYWKfTX2d8nsR9UzUqPZm8MJhr/1/hKgs=;
        b=Nfz+LNkFFgXDBCdy/lajTRTHPWJkcrTbOM774wiJxtD8IvrkC8VhD2jo3NYCjQRU7z
         uOwEnKP0bgvVb0g4unQGf0FUMMsKImdNCJ/C41iCbFQMHiKB0bKTCcqAo0LJXzSPXCE7
         r/a+AMHOfh+KhsRmCw/GAc92oQL0FU+6gCDvmKSW0xNRIMe9S5uEqXSFw/xGGq064VoY
         B3hAGfXXKTG58HGMJiz4mpV2HWLjRwYAlyOhOOM0oM/QxFVxABfuneXFKvKopnXGyVdf
         /B/tS+ue8mWFHnSa0VDD/HNDsanE0wNdVU9CKX6lGeTHOaTqGOXIxT/x58zxNekPwq+i
         7v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709840054; x=1710444854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XwMPL87mrNAYWKfTX2d8nsR9UzUqPZm8MJhr/1/hKgs=;
        b=afeHAyZSZ5jXiPXiLGJ30b6tB/QYN7zqMf/cpuZIf83/YXqJGwaGFyoNpNpbwQx4yX
         lKkM4auONrZ3RDVF4VvXRZejoA6OLWM9fzouGwDbxOPrw5z9V0iPWDSXuLLvmg+7Awi8
         xHKH73QpwweKYAVFY3+b6bscfc2KyXcVGdLpFPS+htEwElZyFRXiwy8wM28KwfMST5tB
         v1OQDeSvkFNeTaBLAhlJLcoweYB/zDurdNAirA/+JSGD3+RRYa/uAKkkeUAjQekd+O3/
         PX6CH3J3yLusqjtMIprVG54pvopnCFhXom+eIg8O1LNBWd4aOPDHugs/u8O+OTxDJ0yV
         ysaQ==
X-Gm-Message-State: AOJu0YxXme6ltrySz5B6TKXBG8mqcN5LB/oiSTnm+rjPYIH7PT5x8afa
	usZehtbIN3mJ3ZV3xxSqX9dIWKNv3qj9Jojd2hM/umKfEYz4C5Ii2hBj/8nF
X-Google-Smtp-Source: AGHT+IHSpYFukB1dZkopInEfrc++EXPSFBDpmevx/wvMx/iwpAAXqznWKEV1UCy90THb2ZjkQCoWyw==
X-Received: by 2002:ad4:5495:0:b0:690:ae67:ce39 with SMTP id pv21-20020ad45495000000b00690ae67ce39mr1139824qvb.31.1709840053763;
        Thu, 07 Mar 2024 11:34:13 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id md18-20020a056214589200b0069054377816sm8055120qvb.124.2024.03.07.11.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:34:13 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/5.15: update CVE exclusions
Date: Thu,  7 Mar 2024 14:34:09 -0500
Message-Id: <20240307193409.987235-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307193409.987235-1-bruce.ashfield@gmail.com>
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 19:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196822

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 2e30efe6be..7cabb1e244 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-26 23:36:34.200936 for version 5.15.149
+# Generated at 2024-03-07 14:18:47.385549 for version 5.15.150
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.149"
+    this_version = "5.15.150"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


