Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D9CC27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:38 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.4255.1719778112963038591
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tsK7QCHx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70a078edb8aso956470b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778112; x=1720382912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Az4Wl6hyYkyt70dZ7E2E9xBIvfcSnysfJ7QtaurKfT0=;
        b=tsK7QCHxH2mrb+NlG+9mpl9lEH03FfGspwNZnMHaSBaWF9O5HUWggp8V/ciJItOT4Z
         U8zuvk1kzfItTmebFk6ANBxdO0ZX3LeSORhMXdQeC38qpRovDFlnlQRSCM5CrF1rHO4S
         HX36bwmdNKY3vRBX0CYV2uY8iJ4ksTnBfnahG6I4kSIzxlaKNRrkly7u5PPt5mOnttYd
         wvI9/BscZe+LNsreBhMsnjqWVT/+edoBt08i7Kg8tUAwrnlVVKyTY6SP25LQKHS2QMHg
         ZKIpL842UniBfkSQWR5tAAm8OgF0AxanN12QLw2GY9T9cQHOmS18QUwRn0/XmdrCcb2y
         mHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778112; x=1720382912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az4Wl6hyYkyt70dZ7E2E9xBIvfcSnysfJ7QtaurKfT0=;
        b=a+BLEZ7qffQcsYnpRubnA+pt4t6KFplfZ+wbG89uxoRAHr/LkPkgds27g2hVZ0c6hI
         YggyTv3N1GZGfG6O+7j2YCEcxBY63XBm2ni+0dbZ0Ju2/ajJXBX2EQ07B//dSKKxfyvV
         39HKfewrM08O70/YrUFoPn0F1gbthgieXGRLKHog1Adk/BPmPx8vkf6oHcbLEVgjCbKQ
         Zg1jE/1U8FSq9GnRnxaUYWB0+jAcLohDE97oUP6tDgOQFpW/UPb2MaI50Nt3XWIQMJnu
         zt0qK3CB12AeRMfVdKmUHZkIq5YrJX9YuM9jIouZZEDwo9wypAlLw4dZP25DiApoUB1H
         KWcw==
X-Gm-Message-State: AOJu0YzLdUmBDAdlCIHtDKPJzLmhFC1Ly1ezZjQTIYIbZyHLlYOalrwa
	rCPeUrZjFracQtb7X+xLARV4MFgVl3VHqUPtsf/PS+1m6CgFCMXmCqxiB07gcUxQjFz3hfg5UIu
	AOSc=
X-Google-Smtp-Source: AGHT+IE+JzvwaPrQygzC5I+6SpbSC2yC3b2XQ38h8r90SUKkyeawPcA+O5H5SM4hbAvplLzlBW0nAQ==
X-Received: by 2002:a05:6a00:2342:b0:706:6867:7a63 with SMTP id d2e1a72fcca58-70aaab1797emr6797930b3a.6.1719778111717;
        Sun, 30 Jun 2024 13:08:31 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/35] linux-yocto/6.6: update CVE exclusions (6.6.29)
Date: Sun, 30 Jun 2024 13:07:32 -0700
Message-Id: <fa67b0075d17b1bae7400e9c9bbe5855bf11ae60.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201257

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 8Apr24
        Date: Tue, 9 Apr 2024 18:19:11 -0400

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6660bc4980ad8161522075e3964fa400817f27f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index df09c1fd1d..9f1f03ac53 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-04-25 18:59:44.140399+00:00 for version 6.6.28
+# Generated at 2024-05-02 12:41:43.351358+00:00 for version 6.6.29
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.28"
+    this_version = "6.6.29"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


