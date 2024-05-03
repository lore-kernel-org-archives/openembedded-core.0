Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1038AC04FFE
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:52:55 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.4020.1714704773096512080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCYszGMV;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78edc49861aso639039385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704772; x=1715309572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKnYrydbGpJYd30zKMVNzeuCpAqFgaozO8bhftT0CIs=;
        b=hCYszGMVVkmncq+DXYkWz45Tf6tIE/Kn2q4xXKklF+Wo2weg3VLK2b5NXQe3uC8A/x
         UBk9fr/SQW1LdCyd/9uRxDetUoefVK2zfWgqm6cCUUjjDgFcDRb7cUNAUjF0HqG0EkFf
         g303HIW+4AbRK9jofBS6eGot6/Ek0c24KphZ/YCrLzafn5r+XypPNnMcMi4j/9VkWg1D
         XYYu9/WcS6mBmtqbY0pv71Hy/2y0vnv8BLyu9Pihyjsra5JWRileYr5pjzFY1t8LuXc2
         +H+Z/RiE0DtHgl4e4lLpNQR7Ct247yWhjH1aTEsiomeFnp7dZlfeHDiOd1lYLMEb5ym/
         LjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704772; x=1715309572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKnYrydbGpJYd30zKMVNzeuCpAqFgaozO8bhftT0CIs=;
        b=Fj91dLB+be8QKB3R6OeZKzV5Li5MNuRC31ON1+AgflFfXQsG2W1jUAgBLcU/Ws8gII
         5Ai8k8Ny3Tm0rPMkxjyLY4tMxmlByXewZ5k1tIFD9jIiiwSohO+VBQOBJWS4h+z0FYnc
         58+1JtcLmQfD6SY76PD2dbftKkhMKgyqduE1sI45birYHE9ABlm/8maWXXnThUqSxaqv
         SOnrSQK4jFlGwwNr/jvNoXXS8ibnWrQsnr35sNg3/GJ7PpIQ0XfjqAqBTBK2KK+z2u5G
         OtmCYuRPPwFo9/u9pNMKsB2CMuL3cPfYvEy5fAYOcD7hpcY9TVXVMKQOvM/ZvOCsI8KH
         VlsQ==
X-Gm-Message-State: AOJu0Yx4BOl+l3mAg1TWZlMCUVv1K8TLRvaQdqYMfbsYaLu7tl1JUAK7
	Hfq0VRyR+Ijz4nhfeILLstgpzXqC0Enkx2KSlS11Fv3g2CO8rJ7NCWOyfQ==
X-Google-Smtp-Source: AGHT+IFWFBqjUsxWqqt+EgdQxRugVQfQc3ojda6l3cSd67rL41IuzlZ9CmTpG4XjXSGFC5lNpCkVkA==
X-Received: by 2002:a05:6214:19c5:b0:69b:8053:2c88 with SMTP id j5-20020a05621419c500b0069b80532c88mr1724894qvc.49.1714704770817;
        Thu, 02 May 2024 19:52:50 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/12] linux-yocto/5.15: update CVE exclusions (5.15.155)
Date: Thu,  2 May 2024 22:52:36 -0400
Message-Id: <20240503025240.373184-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503025240.373184-1-bruce.ashfield@gmail.com>
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198952

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 8Apr24
        Date: Tue, 9 Apr 2024 18:19:11 -0400

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_5.15.inc              | 4508 ++++++++++++-----
 1 file changed, 3178 insertions(+), 1330 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index c163fe4938..3cbbce59ac 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-28 13:46:59.505239 for version 5.15.153
+# Generated at 2024-04-15 16:35:38.699381 for version 5.15.155
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.153"
+    this_version = "5.15.155"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4298,6 +4298,12 @@ CVE_CHECK_IGNORE += "CVE-2019-25044"
 # fixed-version: Fixed after version 5.1
 CVE_CHECK_IGNORE += "CVE-2019-25045"
 
+# fixed-version: Fixed after version 5.0
+CVE_CHECK_IGNORE += "CVE-2019-25160"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2019-25162"
+
 # fixed-version: Fixed after version 5.6rc1
 CVE_CHECK_IGNORE += "CVE-2019-3016"
 
@@ -4985,6 +4991,45 @@ CVE_CHECK_IGNORE += "CVE-2020-36694"
 # fixed-version: Fixed after version 5.9rc1
 CVE_CHECK_IGNORE += "CVE-2020-36766"
 
+# fixed-version: Fixed after version 5.7rc1
+CVE_CHECK_IGNORE += "CVE-2020-36775"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36776"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36777"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36778"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36779"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36780"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36781"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36782"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36783"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36784"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36785"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36786"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2020-36787"
+
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE += "CVE-2020-3702"
 
@@ -5696,2058 +5741,3861 @@ CVE_CHECK_IGNORE += "CVE-2021-45868"
 # fixed-version: Fixed after version 5.13rc7
 CVE_CHECK_IGNORE += "CVE-2021-46283"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-0001"
+# fixed-version: Fixed after version 5.12rc7
+CVE_CHECK_IGNORE += "CVE-2021-46904"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-0002"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46905"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-0168"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-46906"
 
-# cpe-stable-backport: Backported in 5.15.70
-CVE_CHECK_IGNORE += "CVE-2022-0171"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46908"
 
-# cpe-stable-backport: Backported in 5.15.16
-CVE_CHECK_IGNORE += "CVE-2022-0185"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46909"
 
-# cpe-stable-backport: Backported in 5.15.11
-CVE_CHECK_IGNORE += "CVE-2022-0264"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46910"
 
-# fixed-version: Fixed after version 5.14rc2
-CVE_CHECK_IGNORE += "CVE-2022-0286"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46911"
 
-# fixed-version: Fixed after version 5.15rc6
-CVE_CHECK_IGNORE += "CVE-2022-0322"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46912"
 
-# cpe-stable-backport: Backported in 5.15.18
-CVE_CHECK_IGNORE += "CVE-2022-0330"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46913"
 
-# cpe-stable-backport: Backported in 5.15.14
-CVE_CHECK_IGNORE += "CVE-2022-0382"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46914"
 
-# CVE-2022-0400 has no known resolution
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46915"
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-0433"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46916"
 
-# cpe-stable-backport: Backported in 5.15.23
-CVE_CHECK_IGNORE += "CVE-2022-0435"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46917"
 
-# fixed-version: Fixed after version 5.15rc1
-CVE_CHECK_IGNORE += "CVE-2022-0480"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46918"
 
-# cpe-stable-backport: Backported in 5.15.23
-CVE_CHECK_IGNORE += "CVE-2022-0487"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46919"
 
-# cpe-stable-backport: Backported in 5.15.20
-CVE_CHECK_IGNORE += "CVE-2022-0492"
+# fixed-version: Fixed after version 5.12rc8
+CVE_CHECK_IGNORE += "CVE-2021-46920"
 
-# cpe-stable-backport: Backported in 5.15.27
-CVE_CHECK_IGNORE += "CVE-2022-0494"
+# fixed-version: Fixed after version 5.12
+CVE_CHECK_IGNORE += "CVE-2021-46921"
 
-# cpe-stable-backport: Backported in 5.15.37
-CVE_CHECK_IGNORE += "CVE-2022-0500"
+# fixed-version: Fixed after version 5.12
+CVE_CHECK_IGNORE += "CVE-2021-46922"
 
-# cpe-stable-backport: Backported in 5.15.23
-CVE_CHECK_IGNORE += "CVE-2022-0516"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46923"
 
-# cpe-stable-backport: Backported in 5.15.19
-CVE_CHECK_IGNORE += "CVE-2022-0617"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46924"
 
-# fixed-version: Fixed after version 5.15rc7
-CVE_CHECK_IGNORE += "CVE-2022-0644"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46925"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-0646"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46926"
 
-# cpe-stable-backport: Backported in 5.15.27
-CVE_CHECK_IGNORE += "CVE-2022-0742"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46927"
 
-# fixed-version: Fixed after version 5.8rc6
-CVE_CHECK_IGNORE += "CVE-2022-0812"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46928"
 
-# cpe-stable-backport: Backported in 5.15.25
-CVE_CHECK_IGNORE += "CVE-2022-0847"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46929"
 
-# fixed-version: Fixed after version 5.14rc1
-CVE_CHECK_IGNORE += "CVE-2022-0850"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46930"
 
-# fixed-version: only affects 5.17rc6 onwards
-CVE_CHECK_IGNORE += "CVE-2022-0854"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46931"
 
-# cpe-stable-backport: Backported in 5.15.29
-CVE_CHECK_IGNORE += "CVE-2022-0995"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46932"
 
-# CVE-2022-0998 needs backporting (fixed from 5.17rc1)
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46933"
 
-# cpe-stable-backport: Backported in 5.15.29
-CVE_CHECK_IGNORE += "CVE-2022-1011"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46934"
 
-# cpe-stable-backport: Backported in 5.15.41
-CVE_CHECK_IGNORE += "CVE-2022-1012"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46935"
 
-# cpe-stable-backport: Backported in 5.15.32
-CVE_CHECK_IGNORE += "CVE-2022-1015"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46936"
 
-# cpe-stable-backport: Backported in 5.15.32
-CVE_CHECK_IGNORE += "CVE-2022-1016"
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2021-46937"
 
-# fixed-version: Fixed after version 5.14rc7
-CVE_CHECK_IGNORE += "CVE-2022-1043"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46938"
 
-# cpe-stable-backport: Backported in 5.15.32
-CVE_CHECK_IGNORE += "CVE-2022-1048"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46939"
 
-# cpe-stable-backport: Backported in 5.15.20
-CVE_CHECK_IGNORE += "CVE-2022-1055"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46940"
 
-# CVE-2022-1116 has no known resolution
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46941"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-1158"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46942"
 
-# cpe-stable-backport: Backported in 5.15.46
-CVE_CHECK_IGNORE += "CVE-2022-1184"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46943"
 
-# cpe-stable-backport: Backported in 5.15.12
-CVE_CHECK_IGNORE += "CVE-2022-1195"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46944"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-1198"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46945"
 
-# cpe-stable-backport: Backported in 5.15.29
-CVE_CHECK_IGNORE += "CVE-2022-1199"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46947"
 
-# cpe-stable-backport: Backported in 5.15.35
-CVE_CHECK_IGNORE += "CVE-2022-1204"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46948"
 
-# fixed-version: only affects 5.17rc4 onwards
-CVE_CHECK_IGNORE += "CVE-2022-1205"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46949"
 
-# CVE-2022-1247 has no known resolution
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46950"
 
-# cpe-stable-backport: Backported in 5.15.34
-CVE_CHECK_IGNORE += "CVE-2022-1263"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46951"
 
-# fixed-version: Fixed after version 5.15rc1
-CVE_CHECK_IGNORE += "CVE-2022-1280"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46952"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-1353"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46953"
 
-# fixed-version: Fixed after version 5.6rc2
-CVE_CHECK_IGNORE += "CVE-2022-1419"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46954"
 
-# cpe-stable-backport: Backported in 5.15.58
-CVE_CHECK_IGNORE += "CVE-2022-1462"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46955"
 
-# fixed-version: Fixed after version 5.15rc1
-CVE_CHECK_IGNORE += "CVE-2022-1508"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46956"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-1516"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46957"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-1651"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46958"
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2022-1652"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46959"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-1671"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46960"
 
-# fixed-version: Fixed after version 4.20rc1
-CVE_CHECK_IGNORE += "CVE-2022-1678"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46961"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-1679"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46962"
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2022-1729"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46963"
 
-# cpe-stable-backport: Backported in 5.15.39
-CVE_CHECK_IGNORE += "CVE-2022-1734"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46964"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2022-1786"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46965"
 
-# cpe-stable-backport: Backported in 5.15.44
-CVE_CHECK_IGNORE += "CVE-2022-1789"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46966"
 
-# cpe-stable-backport: Backported in 5.15.37
-CVE_CHECK_IGNORE += "CVE-2022-1836"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46967"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-1852"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46968"
 
-# fixed-version: only affects 5.17rc8 onwards
-CVE_CHECK_IGNORE += "CVE-2022-1882"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46969"
 
-# cpe-stable-backport: Backported in 5.15.40
-CVE_CHECK_IGNORE += "CVE-2022-1943"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46970"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-1966"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46971"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-1972"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46972"
 
-# cpe-stable-backport: Backported in 5.15.46
-CVE_CHECK_IGNORE += "CVE-2022-1973"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46973"
 
-# cpe-stable-backport: Backported in 5.15.39
-CVE_CHECK_IGNORE += "CVE-2022-1974"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46974"
 
-# cpe-stable-backport: Backported in 5.15.39
-CVE_CHECK_IGNORE += "CVE-2022-1975"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46976"
 
-# fixed-version: only affects 5.18rc2 onwards
-CVE_CHECK_IGNORE += "CVE-2022-1976"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46977"
 
-# cpe-stable-backport: Backported in 5.15.20
-CVE_CHECK_IGNORE += "CVE-2022-1998"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46978"
 
-# cpe-stable-backport: Backported in 5.15.25
-CVE_CHECK_IGNORE += "CVE-2022-20008"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46979"
 
-# cpe-stable-backport: Backported in 5.15.8
-CVE_CHECK_IGNORE += "CVE-2022-20132"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46980"
 
-# fixed-version: Fixed after version 5.15rc1
-CVE_CHECK_IGNORE += "CVE-2022-20141"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46981"
 
-# cpe-stable-backport: Backported in 5.15.3
-CVE_CHECK_IGNORE += "CVE-2022-20148"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46982"
 
-# fixed-version: Fixed after version 5.13rc1
-CVE_CHECK_IGNORE += "CVE-2022-20153"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46983"
 
-# cpe-stable-backport: Backported in 5.15.13
-CVE_CHECK_IGNORE += "CVE-2022-20154"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46984"
 
-# cpe-stable-backport: Backported in 5.15.31
-CVE_CHECK_IGNORE += "CVE-2022-20158"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46985"
 
-# fixed-version: Fixed after version 5.10rc1
-CVE_CHECK_IGNORE += "CVE-2022-20166"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46986"
 
-# cpe-stable-backport: Backported in 5.15.31
-CVE_CHECK_IGNORE += "CVE-2022-20368"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46987"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-20369"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46988"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2022-20409"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46989"
 
-# cpe-stable-backport: Backported in 5.15.66
-CVE_CHECK_IGNORE += "CVE-2022-20421"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-46990"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-20422"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46991"
 
-# fixed-version: only affects 5.17rc4 onwards
-CVE_CHECK_IGNORE += "CVE-2022-20423"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46992"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2022-20424"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46993"
 
-# fixed-version: Fixed after version 5.9rc4
-CVE_CHECK_IGNORE += "CVE-2022-20565"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46994"
 
-# cpe-stable-backport: Backported in 5.15.59
-CVE_CHECK_IGNORE += "CVE-2022-20566"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46995"
 
-# fixed-version: Fixed after version 4.16rc5
-CVE_CHECK_IGNORE += "CVE-2022-20567"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46996"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2022-20568"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46997"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-20572"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46998"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-2078"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-46999"
 
-# cpe-stable-backport: Backported in 5.15.48
-CVE_CHECK_IGNORE += "CVE-2022-21123"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47000"
 
-# cpe-stable-backport: Backported in 5.15.48
-CVE_CHECK_IGNORE += "CVE-2022-21125"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47001"
 
-# cpe-stable-backport: Backported in 5.15.48
-CVE_CHECK_IGNORE += "CVE-2022-21166"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47002"
 
-# fixed-version: Fixed after version 4.20
-CVE_CHECK_IGNORE += "CVE-2022-21385"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47003"
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2022-21499"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47004"
 
-# cpe-stable-backport: Backported in 5.15.58
-CVE_CHECK_IGNORE += "CVE-2022-21505"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47005"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-2153"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47006"
 
-# cpe-stable-backport: Backported in 5.15.96
-CVE_CHECK_IGNORE += "CVE-2022-2196"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47007"
 
-# CVE-2022-2209 has no known resolution
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47008"
 
-# cpe-stable-backport: Backported in 5.15.18
-CVE_CHECK_IGNORE += "CVE-2022-22942"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-47009"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23036"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47010"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23037"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47011"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23038"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47012"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23039"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47013"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23040"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47014"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23041"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47015"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23042"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47016"
 
-# cpe-stable-backport: Backported in 5.15.72
-CVE_CHECK_IGNORE += "CVE-2022-2308"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47017"
 
-# cpe-stable-backport: Backported in 5.15.53
-CVE_CHECK_IGNORE += "CVE-2022-2318"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47018"
 
-# cpe-stable-backport: Backported in 5.15.37
-CVE_CHECK_IGNORE += "CVE-2022-23222"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47019"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2022-2327"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47020"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-2380"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47021"
 
-# cpe-stable-backport: Backported in 5.15.57
-CVE_CHECK_IGNORE += "CVE-2022-23816"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47022"
 
-# CVE-2022-23825 has no known resolution
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47023"
 
-# cpe-stable-backport: Backported in 5.15.28
-CVE_CHECK_IGNORE += "CVE-2022-23960"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47024"
 
-# cpe-stable-backport: Backported in 5.15.19
-CVE_CHECK_IGNORE += "CVE-2022-24122"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47025"
 
-# cpe-stable-backport: Backported in 5.15.19
-CVE_CHECK_IGNORE += "CVE-2022-24448"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47026"
 
-# cpe-stable-backport: Backported in 5.15.27
-CVE_CHECK_IGNORE += "CVE-2022-24958"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47027"
 
-# cpe-stable-backport: Backported in 5.15.19
-CVE_CHECK_IGNORE += "CVE-2022-24959"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47028"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-2503"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47029"
 
-# cpe-stable-backport: Backported in 5.15.24
-CVE_CHECK_IGNORE += "CVE-2022-25258"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47030"
 
-# CVE-2022-25265 has no known resolution
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47031"
 
-# cpe-stable-backport: Backported in 5.15.24
-CVE_CHECK_IGNORE += "CVE-2022-25375"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47032"
 
-# cpe-stable-backport: Backported in 5.15.26
-CVE_CHECK_IGNORE += "CVE-2022-25636"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47033"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-2585"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47034"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-2586"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47035"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-2588"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47036"
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-2590"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47037"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-2602"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47038"
 
-# cpe-stable-backport: Backported in 5.15.53
-CVE_CHECK_IGNORE += "CVE-2022-26365"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47039"
 
-# cpe-stable-backport: Backported in 5.15.60
-CVE_CHECK_IGNORE += "CVE-2022-26373"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47040"
 
-# cpe-stable-backport: Backported in 5.15.36
-CVE_CHECK_IGNORE += "CVE-2022-2639"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47041"
 
-# cpe-stable-backport: Backported in 5.15.32
-CVE_CHECK_IGNORE += "CVE-2022-26490"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47042"
 
-# cpe-stable-backport: Backported in 5.15.68
-CVE_CHECK_IGNORE += "CVE-2022-2663"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47043"
 
-# CVE-2022-26878 has no known resolution
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47044"
 
-# cpe-stable-backport: Backported in 5.15.26
-CVE_CHECK_IGNORE += "CVE-2022-26966"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47045"
 
-# cpe-stable-backport: Backported in 5.15.26
-CVE_CHECK_IGNORE += "CVE-2022-27223"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47046"
 
-# cpe-stable-backport: Backported in 5.15.29
-CVE_CHECK_IGNORE += "CVE-2022-27666"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47047"
 
-# cpe-stable-backport: Backported in 5.15.94
-CVE_CHECK_IGNORE += "CVE-2022-27672"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47048"
 
-# fixed-version: only affects 5.18rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-2785"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47049"
 
-# cpe-stable-backport: Backported in 5.15.25
-CVE_CHECK_IGNORE += "CVE-2022-27950"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47050"
 
-# cpe-stable-backport: Backported in 5.15.32
-CVE_CHECK_IGNORE += "CVE-2022-28356"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47051"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-28388"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47052"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-28389"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47053"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-28390"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47054"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-2873"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47055"
 
-# fixed-version: only affects 5.17rc3 onwards
-CVE_CHECK_IGNORE += "CVE-2022-28796"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47056"
 
-# cpe-stable-backport: Backported in 5.15.41
-CVE_CHECK_IGNORE += "CVE-2022-28893"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47057"
 
-# cpe-stable-backport: Backported in 5.15.64
-CVE_CHECK_IGNORE += "CVE-2022-2905"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47058"
 
-# cpe-stable-backport: Backported in 5.15.26
-CVE_CHECK_IGNORE += "CVE-2022-29156"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47059"
 
-# cpe-stable-backport: Backported in 5.15.19
-CVE_CHECK_IGNORE += "CVE-2022-2938"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47060"
 
-# cpe-stable-backport: Backported in 5.15.36
-CVE_CHECK_IGNORE += "CVE-2022-29581"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47061"
 
-# cpe-stable-backport: Backported in 5.15.34
-CVE_CHECK_IGNORE += "CVE-2022-29582"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47062"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-2959"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47063"
 
-# CVE-2022-2961 has no known resolution
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47064"
 
-# cpe-stable-backport: Backported in 5.15.24
-CVE_CHECK_IGNORE += "CVE-2022-2964"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47065"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-2977"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47066"
 
-# cpe-stable-backport: Backported in 5.15.73
-CVE_CHECK_IGNORE += "CVE-2022-2978"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47067"
 
-# cpe-stable-backport: Backported in 5.15.57
-CVE_CHECK_IGNORE += "CVE-2022-29900"
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2021-47068"
 
-# cpe-stable-backport: Backported in 5.15.57
-CVE_CHECK_IGNORE += "CVE-2022-29901"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47069"
 
-# fixed-version: Fixed after version 5.15rc1
-CVE_CHECK_IGNORE += "CVE-2022-2991"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47070"
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-29968"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47071"
 
-# cpe-stable-backport: Backported in 5.15.64
-CVE_CHECK_IGNORE += "CVE-2022-3028"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47072"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-30594"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47073"
 
-# cpe-stable-backport: Backported in 5.15.70
-CVE_CHECK_IGNORE += "CVE-2022-3061"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47074"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-3077"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47075"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-3078"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47076"
 
-# fixed-version: only affects 6.0rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3103"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47077"
 
-# cpe-stable-backport: Backported in 5.15.47
-CVE_CHECK_IGNORE += "CVE-2022-3104"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47078"
 
-# cpe-stable-backport: Backported in 5.15.14
-CVE_CHECK_IGNORE += "CVE-2022-3105"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47079"
 
-# cpe-stable-backport: Backported in 5.15.11
-CVE_CHECK_IGNORE += "CVE-2022-3106"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47080"
 
-# cpe-stable-backport: Backported in 5.15.31
-CVE_CHECK_IGNORE += "CVE-2022-3107"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47081"
 
-# cpe-stable-backport: Backported in 5.15.27
-CVE_CHECK_IGNORE += "CVE-2022-3108"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47082"
 
-# cpe-stable-backport: Backported in 5.15.47
-CVE_CHECK_IGNORE += "CVE-2022-3110"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47083"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-3111"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47086"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-3112"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47087"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-3113"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47088"
 
-# CVE-2022-3114 needs backporting (fixed from 5.19rc1)
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47089"
 
-# cpe-stable-backport: Backported in 5.15.46
-CVE_CHECK_IGNORE += "CVE-2022-3115"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47090"
 
-# cpe-stable-backport: Backported in 5.15.80
-CVE_CHECK_IGNORE += "CVE-2022-3169"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47091"
 
-# fixed-version: only affects 6.0rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3170"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47092"
 
-# cpe-stable-backport: Backported in 5.15.65
-CVE_CHECK_IGNORE += "CVE-2022-3176"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47093"
 
-# cpe-stable-backport: Backported in 5.15.34
-CVE_CHECK_IGNORE += "CVE-2022-3202"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47094"
 
-# cpe-stable-backport: Backported in 5.15.45
-CVE_CHECK_IGNORE += "CVE-2022-32250"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47095"
 
-# cpe-stable-backport: Backported in 5.15.41
-CVE_CHECK_IGNORE += "CVE-2022-32296"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47096"
 
-# CVE-2022-3238 has no known resolution
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47097"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2022-3239"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47098"
 
-# cpe-stable-backport: Backported in 5.15.47
-CVE_CHECK_IGNORE += "CVE-2022-32981"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47099"
 
-# cpe-stable-backport: Backported in 5.15.68
-CVE_CHECK_IGNORE += "CVE-2022-3303"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47100"
 
-# cpe-stable-backport: Backported in 5.15.81
-CVE_CHECK_IGNORE += "CVE-2022-3344"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47101"
 
-# cpe-stable-backport: Backported in 5.15.53
-CVE_CHECK_IGNORE += "CVE-2022-33740"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47102"
 
-# cpe-stable-backport: Backported in 5.15.53
-CVE_CHECK_IGNORE += "CVE-2022-33741"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47103"
 
-# cpe-stable-backport: Backported in 5.15.53
-CVE_CHECK_IGNORE += "CVE-2022-33742"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47104"
 
-# cpe-stable-backport: Backported in 5.15.53
-CVE_CHECK_IGNORE += "CVE-2022-33743"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47105"
 
-# cpe-stable-backport: Backported in 5.15.53
-CVE_CHECK_IGNORE += "CVE-2022-33744"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47106"
 
-# cpe-stable-backport: Backported in 5.15.37
-CVE_CHECK_IGNORE += "CVE-2022-33981"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47107"
 
-# cpe-stable-backport: Backported in 5.15.86
-CVE_CHECK_IGNORE += "CVE-2022-3424"
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2021-47108"
 
-# fixed-version: only affects 5.18rc2 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3435"
+# fixed-version: Fixed after version 5.13rc7
+CVE_CHECK_IGNORE += "CVE-2021-47109"
 
-# cpe-stable-backport: Backported in 5.15.47
-CVE_CHECK_IGNORE += "CVE-2022-34494"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-47110"
 
-# cpe-stable-backport: Backported in 5.15.47
-CVE_CHECK_IGNORE += "CVE-2022-34495"
+# fixed-version: Fixed after version 5.13rc6
+CVE_CHECK_IGNORE += "CVE-2021-47111"
 
-# cpe-stable-backport: Backported in 5.15.54
-CVE_CHECK_IGNORE += "CVE-2022-34918"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-47112"
 
-# cpe-stable-backport: Backported in 5.15.80
-CVE_CHECK_IGNORE += "CVE-2022-3521"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47113"
 
-# CVE-2022-3522 needs backporting (fixed from 6.1rc1)
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47114"
 
-# CVE-2022-3523 needs backporting (fixed from 6.1rc1)
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47116"
 
-# cpe-stable-backport: Backported in 5.15.77
-CVE_CHECK_IGNORE += "CVE-2022-3524"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47117"
 
-# cpe-stable-backport: Backported in 5.15.35
-CVE_CHECK_IGNORE += "CVE-2022-3526"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47118"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3531"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47119"
 
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3532"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47120"
 
-# CVE-2022-3533 has no known resolution
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47121"
 
-# cpe-stable-backport: Backported in 5.15.86
-CVE_CHECK_IGNORE += "CVE-2022-3534"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47122"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-3535"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-47123"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3541"
+# fixed-version: Fixed after version 5.13rc2
+CVE_CHECK_IGNORE += "CVE-2021-47124"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-3542"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47125"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2022-3543"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47126"
 
-# CVE-2022-3544 has no known resolution
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47127"
 
-# cpe-stable-backport: Backported in 5.15.84
-CVE_CHECK_IGNORE += "CVE-2022-3545"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47128"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2022-3564"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47129"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-3565"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47130"
 
-# CVE-2022-3566 needs backporting (fixed from 6.1rc1)
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47131"
 
-# CVE-2022-3567 needs backporting (fixed from 6.1rc1)
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47132"
 
-# cpe-stable-backport: Backported in 5.15.46
-CVE_CHECK_IGNORE += "CVE-2022-3577"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47133"
 
-# cpe-stable-backport: Backported in 5.15.68
-CVE_CHECK_IGNORE += "CVE-2022-3586"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47134"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-3594"
+# fixed-version: Fixed after version 5.13rc5
+CVE_CHECK_IGNORE += "CVE-2021-47135"
 
-# CVE-2022-3595 needs backporting (fixed from 6.1rc1)
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47136"
 
-# CVE-2022-3606 has no known resolution
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47137"
 
-# cpe-stable-backport: Backported in 5.15.56
-CVE_CHECK_IGNORE += "CVE-2022-36123"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47138"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2022-3619"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47139"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-3621"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47140"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2022-3623"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47141"
 
-# CVE-2022-3624 needs backporting (fixed from 6.0rc1)
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47142"
 
-# cpe-stable-backport: Backported in 5.15.63
-CVE_CHECK_IGNORE += "CVE-2022-3625"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47143"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2022-3628"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47144"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2022-36280"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47145"
 
-# cpe-stable-backport: Backported in 5.15.63
-CVE_CHECK_IGNORE += "CVE-2022-3629"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47146"
 
-# fixed-version: only affects 5.19rc6 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3630"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47147"
 
-# cpe-stable-backport: Backported in 5.15.63
-CVE_CHECK_IGNORE += "CVE-2022-3633"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47148"
 
-# cpe-stable-backport: Backported in 5.15.63
-CVE_CHECK_IGNORE += "CVE-2022-3635"
+# fixed-version: Fixed after version 5.13rc3
+CVE_CHECK_IGNORE += "CVE-2021-47149"
 
-# CVE-2022-3636 needs backporting (fixed from 5.19rc1)
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47150"
 
-# fixed-version: only affects 5.19 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3640"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47151"
 
-# cpe-stable-backport: Backported in 5.15.129
-CVE_CHECK_IGNORE += "CVE-2022-36402"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47152"
 
-# CVE-2022-3642 has no known resolution
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47153"
 
-# cpe-stable-backport: Backported in 5.15.83
-CVE_CHECK_IGNORE += "CVE-2022-3643"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47158"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-3646"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47159"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-3649"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47160"
 
-# cpe-stable-backport: Backported in 5.15.58
-CVE_CHECK_IGNORE += "CVE-2022-36879"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47161"
 
-# cpe-stable-backport: Backported in 5.15.59
-CVE_CHECK_IGNORE += "CVE-2022-36946"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47162"
 
-# cpe-stable-backport: Backported in 5.15.96
-CVE_CHECK_IGNORE += "CVE-2022-3707"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47163"
 
-# CVE-2022-38096 has no known resolution
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47164"
 
-# CVE-2022-38457 needs backporting (fixed from 6.2rc4)
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47165"
 
-# CVE-2022-3903 needs backporting (fixed from 6.1rc2)
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47166"
 
-# fixed-version: only affects 5.18 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3910"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47167"
 
-# CVE-2022-39188 needs backporting (fixed from 5.19rc8)
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47168"
 
-# cpe-stable-backport: Backported in 5.15.60
-CVE_CHECK_IGNORE += "CVE-2022-39189"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47169"
 
-# cpe-stable-backport: Backported in 5.15.64
-CVE_CHECK_IGNORE += "CVE-2022-39190"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47170"
 
-# fixed-version: only affects 5.18rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-3977"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47171"
 
-# cpe-stable-backport: Backported in 5.15.70
-CVE_CHECK_IGNORE += "CVE-2022-39842"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47172"
 
-# CVE-2022-40133 needs backporting (fixed from 6.2rc4)
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47173"
 
-# cpe-stable-backport: Backported in 5.15.68
-CVE_CHECK_IGNORE += "CVE-2022-40307"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47174"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-40476"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47175"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-40768"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47176"
 
-# cpe-stable-backport: Backported in 5.15.66
-CVE_CHECK_IGNORE += "CVE-2022-4095"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47177"
 
-# cpe-stable-backport: Backported in 5.15.125
-CVE_CHECK_IGNORE += "CVE-2022-40982"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47178"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2022-41218"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47179"
 
-# fixed-version: Fixed after version 5.14rc1
-CVE_CHECK_IGNORE += "CVE-2022-41222"
+# fixed-version: Fixed after version 5.13rc4
+CVE_CHECK_IGNORE += "CVE-2021-47180"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-4127"
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-0001"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2022-4128"
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-0002"
 
-# cpe-stable-backport: Backported in 5.15.91
-CVE_CHECK_IGNORE += "CVE-2022-4129"
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-0168"
 
-# fixed-version: only affects 5.17rc2 onwards
-CVE_CHECK_IGNORE += "CVE-2022-4139"
+# cpe-stable-backport: Backported in 5.15.70
+CVE_CHECK_IGNORE += "CVE-2022-0171"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-41674"
+# cpe-stable-backport: Backported in 5.15.16
+CVE_CHECK_IGNORE += "CVE-2022-0185"
 
-# CVE-2022-41848 has no known resolution
+# cpe-stable-backport: Backported in 5.15.11
+CVE_CHECK_IGNORE += "CVE-2022-0264"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-41849"
+# fixed-version: Fixed after version 5.14rc2
+CVE_CHECK_IGNORE += "CVE-2022-0286"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-41850"
+# fixed-version: Fixed after version 5.15rc6
+CVE_CHECK_IGNORE += "CVE-2022-0322"
 
-# cpe-stable-backport: Backported in 5.15.35
-CVE_CHECK_IGNORE += "CVE-2022-41858"
+# cpe-stable-backport: Backported in 5.15.18
+CVE_CHECK_IGNORE += "CVE-2022-0330"
 
-# fixed-version: only affects 5.16rc7 onwards
-CVE_CHECK_IGNORE += "CVE-2022-42328"
+# cpe-stable-backport: Backported in 5.15.14
+CVE_CHECK_IGNORE += "CVE-2022-0382"
 
-# fixed-version: only affects 5.16rc7 onwards
-CVE_CHECK_IGNORE += "CVE-2022-42329"
+# CVE-2022-0400 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.71
-CVE_CHECK_IGNORE += "CVE-2022-42432"
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-0433"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2022-4269"
+# cpe-stable-backport: Backported in 5.15.23
+CVE_CHECK_IGNORE += "CVE-2022-0435"
 
-# cpe-stable-backport: Backported in 5.15.65
-CVE_CHECK_IGNORE += "CVE-2022-42703"
+# fixed-version: Fixed after version 5.15rc1
+CVE_CHECK_IGNORE += "CVE-2022-0480"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-42719"
+# cpe-stable-backport: Backported in 5.15.23
+CVE_CHECK_IGNORE += "CVE-2022-0487"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-42720"
+# cpe-stable-backport: Backported in 5.15.20
+CVE_CHECK_IGNORE += "CVE-2022-0492"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-42721"
+# cpe-stable-backport: Backported in 5.15.27
+CVE_CHECK_IGNORE += "CVE-2022-0494"
 
-# cpe-stable-backport: Backported in 5.15.74
-CVE_CHECK_IGNORE += "CVE-2022-42722"
+# cpe-stable-backport: Backported in 5.15.37
+CVE_CHECK_IGNORE += "CVE-2022-0500"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2022-42895"
+# cpe-stable-backport: Backported in 5.15.23
+CVE_CHECK_IGNORE += "CVE-2022-0516"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2022-42896"
+# cpe-stable-backport: Backported in 5.15.19
+CVE_CHECK_IGNORE += "CVE-2022-0617"
 
-# cpe-stable-backport: Backported in 5.15.73
-CVE_CHECK_IGNORE += "CVE-2022-43750"
+# fixed-version: Fixed after version 5.15rc7
+CVE_CHECK_IGNORE += "CVE-2022-0644"
 
-# cpe-stable-backport: Backported in 5.15.82
-CVE_CHECK_IGNORE += "CVE-2022-4378"
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-0646"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2022-4379"
+# cpe-stable-backport: Backported in 5.15.27
+CVE_CHECK_IGNORE += "CVE-2022-0742"
 
-# cpe-stable-backport: Backported in 5.15.90
-CVE_CHECK_IGNORE += "CVE-2022-4382"
+# fixed-version: Fixed after version 5.8rc6
+CVE_CHECK_IGNORE += "CVE-2022-0812"
 
-# cpe-stable-backport: Backported in 5.15.75
-CVE_CHECK_IGNORE += "CVE-2022-43945"
+# cpe-stable-backport: Backported in 5.15.25
+CVE_CHECK_IGNORE += "CVE-2022-0847"
 
-# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
+# fixed-version: Fixed after version 5.14rc1
+CVE_CHECK_IGNORE += "CVE-2022-0850"
 
-# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
+# fixed-version: only affects 5.17rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2022-0854"
 
-# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
+# cpe-stable-backport: Backported in 5.15.29
+CVE_CHECK_IGNORE += "CVE-2022-0995"
 
-# CVE-2022-4543 has no known resolution
+# CVE-2022-0998 needs backporting (fixed from 5.17rc1)
 
-# cpe-stable-backport: Backported in 5.15.82
-CVE_CHECK_IGNORE += "CVE-2022-45869"
+# cpe-stable-backport: Backported in 5.15.29
+CVE_CHECK_IGNORE += "CVE-2022-1011"
 
-# CVE-2022-45884 has no known resolution
+# cpe-stable-backport: Backported in 5.15.41
+CVE_CHECK_IGNORE += "CVE-2022-1012"
 
-# CVE-2022-45885 has no known resolution
+# cpe-stable-backport: Backported in 5.15.32
+CVE_CHECK_IGNORE += "CVE-2022-1015"
 
-# cpe-stable-backport: Backported in 5.15.116
-CVE_CHECK_IGNORE += "CVE-2022-45886"
+# cpe-stable-backport: Backported in 5.15.32
+CVE_CHECK_IGNORE += "CVE-2022-1016"
 
-# cpe-stable-backport: Backported in 5.15.116
-CVE_CHECK_IGNORE += "CVE-2022-45887"
+# fixed-version: Fixed after version 5.14rc7
+CVE_CHECK_IGNORE += "CVE-2022-1043"
 
-# CVE-2022-45888 needs backporting (fixed from 6.2rc1)
+# cpe-stable-backport: Backported in 5.15.32
+CVE_CHECK_IGNORE += "CVE-2022-1048"
 
-# cpe-stable-backport: Backported in 5.15.116
-CVE_CHECK_IGNORE += "CVE-2022-45919"
+# cpe-stable-backport: Backported in 5.15.20
+CVE_CHECK_IGNORE += "CVE-2022-1055"
 
-# cpe-stable-backport: Backported in 5.15.85
-CVE_CHECK_IGNORE += "CVE-2022-45934"
+# CVE-2022-1116 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.66
-CVE_CHECK_IGNORE += "CVE-2022-4662"
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-1158"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2022-4696"
+# cpe-stable-backport: Backported in 5.15.46
+CVE_CHECK_IGNORE += "CVE-2022-1184"
 
 # cpe-stable-backport: Backported in 5.15.12
-CVE_CHECK_IGNORE += "CVE-2022-4744"
+CVE_CHECK_IGNORE += "CVE-2022-1195"
 
-# cpe-stable-backport: Backported in 5.15.81
-CVE_CHECK_IGNORE += "CVE-2022-47518"
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-1198"
 
-# cpe-stable-backport: Backported in 5.15.81
-CVE_CHECK_IGNORE += "CVE-2022-47519"
+# cpe-stable-backport: Backported in 5.15.29
+CVE_CHECK_IGNORE += "CVE-2022-1199"
 
-# cpe-stable-backport: Backported in 5.15.81
-CVE_CHECK_IGNORE += "CVE-2022-47520"
+# cpe-stable-backport: Backported in 5.15.35
+CVE_CHECK_IGNORE += "CVE-2022-1204"
 
-# cpe-stable-backport: Backported in 5.15.81
-CVE_CHECK_IGNORE += "CVE-2022-47521"
+# fixed-version: only affects 5.17rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2022-1205"
 
-# cpe-stable-backport: Backported in 5.15.88
-CVE_CHECK_IGNORE += "CVE-2022-47929"
+# CVE-2022-1247 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-47938"
+# cpe-stable-backport: Backported in 5.15.34
+CVE_CHECK_IGNORE += "CVE-2022-1263"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-47939"
+# fixed-version: Fixed after version 5.15rc1
+CVE_CHECK_IGNORE += "CVE-2022-1280"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2022-47940"
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-1353"
+
+# fixed-version: Fixed after version 5.6rc2
+CVE_CHECK_IGNORE += "CVE-2022-1419"
+
+# cpe-stable-backport: Backported in 5.15.58
+CVE_CHECK_IGNORE += "CVE-2022-1462"
+
+# fixed-version: Fixed after version 5.15rc1
+CVE_CHECK_IGNORE += "CVE-2022-1508"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-1516"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-1651"
+
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2022-1652"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-1671"
+
+# fixed-version: Fixed after version 4.20rc1
+CVE_CHECK_IGNORE += "CVE-2022-1678"
 
 # cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2022-47941"
+CVE_CHECK_IGNORE += "CVE-2022-1679"
+
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2022-1729"
+
+# cpe-stable-backport: Backported in 5.15.39
+CVE_CHECK_IGNORE += "CVE-2022-1734"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2022-1786"
+
+# cpe-stable-backport: Backported in 5.15.44
+CVE_CHECK_IGNORE += "CVE-2022-1789"
+
+# cpe-stable-backport: Backported in 5.15.37
+CVE_CHECK_IGNORE += "CVE-2022-1836"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-1852"
+
+# fixed-version: only affects 5.17rc8 onwards
+CVE_CHECK_IGNORE += "CVE-2022-1882"
+
+# cpe-stable-backport: Backported in 5.15.40
+CVE_CHECK_IGNORE += "CVE-2022-1943"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-1966"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-1972"
+
+# cpe-stable-backport: Backported in 5.15.46
+CVE_CHECK_IGNORE += "CVE-2022-1973"
+
+# cpe-stable-backport: Backported in 5.15.39
+CVE_CHECK_IGNORE += "CVE-2022-1974"
+
+# cpe-stable-backport: Backported in 5.15.39
+CVE_CHECK_IGNORE += "CVE-2022-1975"
+
+# fixed-version: only affects 5.18rc2 onwards
+CVE_CHECK_IGNORE += "CVE-2022-1976"
+
+# cpe-stable-backport: Backported in 5.15.20
+CVE_CHECK_IGNORE += "CVE-2022-1998"
+
+# cpe-stable-backport: Backported in 5.15.25
+CVE_CHECK_IGNORE += "CVE-2022-20008"
+
+# cpe-stable-backport: Backported in 5.15.8
+CVE_CHECK_IGNORE += "CVE-2022-20132"
+
+# fixed-version: Fixed after version 5.15rc1
+CVE_CHECK_IGNORE += "CVE-2022-20141"
+
+# cpe-stable-backport: Backported in 5.15.3
+CVE_CHECK_IGNORE += "CVE-2022-20148"
+
+# fixed-version: Fixed after version 5.13rc1
+CVE_CHECK_IGNORE += "CVE-2022-20153"
+
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2022-20154"
+
+# cpe-stable-backport: Backported in 5.15.31
+CVE_CHECK_IGNORE += "CVE-2022-20158"
+
+# fixed-version: Fixed after version 5.10rc1
+CVE_CHECK_IGNORE += "CVE-2022-20166"
+
+# cpe-stable-backport: Backported in 5.15.31
+CVE_CHECK_IGNORE += "CVE-2022-20368"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-20369"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2022-20409"
+
+# cpe-stable-backport: Backported in 5.15.66
+CVE_CHECK_IGNORE += "CVE-2022-20421"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2022-20422"
+
+# fixed-version: only affects 5.17rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2022-20423"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2022-20424"
+
+# fixed-version: Fixed after version 5.9rc4
+CVE_CHECK_IGNORE += "CVE-2022-20565"
+
+# cpe-stable-backport: Backported in 5.15.59
+CVE_CHECK_IGNORE += "CVE-2022-20566"
+
+# fixed-version: Fixed after version 4.16rc5
+CVE_CHECK_IGNORE += "CVE-2022-20567"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2022-20568"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-20572"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-2078"
+
+# cpe-stable-backport: Backported in 5.15.48
+CVE_CHECK_IGNORE += "CVE-2022-21123"
+
+# cpe-stable-backport: Backported in 5.15.48
+CVE_CHECK_IGNORE += "CVE-2022-21125"
+
+# cpe-stable-backport: Backported in 5.15.48
+CVE_CHECK_IGNORE += "CVE-2022-21166"
+
+# fixed-version: Fixed after version 4.20
+CVE_CHECK_IGNORE += "CVE-2022-21385"
+
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2022-21499"
+
+# cpe-stable-backport: Backported in 5.15.58
+CVE_CHECK_IGNORE += "CVE-2022-21505"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-2153"
+
+# cpe-stable-backport: Backported in 5.15.96
+CVE_CHECK_IGNORE += "CVE-2022-2196"
+
+# CVE-2022-2209 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.18
+CVE_CHECK_IGNORE += "CVE-2022-22942"
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23036"
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23037"
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23038"
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23039"
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23040"
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23041"
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23042"
+
+# cpe-stable-backport: Backported in 5.15.72
+CVE_CHECK_IGNORE += "CVE-2022-2308"
+
+# cpe-stable-backport: Backported in 5.15.53
+CVE_CHECK_IGNORE += "CVE-2022-2318"
+
+# cpe-stable-backport: Backported in 5.15.37
+CVE_CHECK_IGNORE += "CVE-2022-23222"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2022-2327"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-2380"
+
+# cpe-stable-backport: Backported in 5.15.57
+CVE_CHECK_IGNORE += "CVE-2022-23816"
+
+# CVE-2022-23825 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.28
+CVE_CHECK_IGNORE += "CVE-2022-23960"
+
+# cpe-stable-backport: Backported in 5.15.19
+CVE_CHECK_IGNORE += "CVE-2022-24122"
+
+# cpe-stable-backport: Backported in 5.15.19
+CVE_CHECK_IGNORE += "CVE-2022-24448"
+
+# cpe-stable-backport: Backported in 5.15.27
+CVE_CHECK_IGNORE += "CVE-2022-24958"
+
+# cpe-stable-backport: Backported in 5.15.19
+CVE_CHECK_IGNORE += "CVE-2022-24959"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-2503"
+
+# cpe-stable-backport: Backported in 5.15.24
+CVE_CHECK_IGNORE += "CVE-2022-25258"
+
+# CVE-2022-25265 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.24
+CVE_CHECK_IGNORE += "CVE-2022-25375"
+
+# cpe-stable-backport: Backported in 5.15.26
+CVE_CHECK_IGNORE += "CVE-2022-25636"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2022-2585"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2022-2586"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2022-2588"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-2590"
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-2602"
+
+# cpe-stable-backport: Backported in 5.15.53
+CVE_CHECK_IGNORE += "CVE-2022-26365"
+
+# cpe-stable-backport: Backported in 5.15.60
+CVE_CHECK_IGNORE += "CVE-2022-26373"
+
+# cpe-stable-backport: Backported in 5.15.36
+CVE_CHECK_IGNORE += "CVE-2022-2639"
+
+# cpe-stable-backport: Backported in 5.15.32
+CVE_CHECK_IGNORE += "CVE-2022-26490"
+
+# cpe-stable-backport: Backported in 5.15.68
+CVE_CHECK_IGNORE += "CVE-2022-2663"
+
+# CVE-2022-26878 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.26
+CVE_CHECK_IGNORE += "CVE-2022-26966"
+
+# cpe-stable-backport: Backported in 5.15.26
+CVE_CHECK_IGNORE += "CVE-2022-27223"
+
+# cpe-stable-backport: Backported in 5.15.29
+CVE_CHECK_IGNORE += "CVE-2022-27666"
+
+# cpe-stable-backport: Backported in 5.15.94
+CVE_CHECK_IGNORE += "CVE-2022-27672"
+
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-2785"
+
+# cpe-stable-backport: Backported in 5.15.25
+CVE_CHECK_IGNORE += "CVE-2022-27950"
+
+# cpe-stable-backport: Backported in 5.15.32
+CVE_CHECK_IGNORE += "CVE-2022-28356"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-28388"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-28389"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-28390"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-2873"
+
+# fixed-version: only affects 5.17rc3 onwards
+CVE_CHECK_IGNORE += "CVE-2022-28796"
+
+# cpe-stable-backport: Backported in 5.15.41
+CVE_CHECK_IGNORE += "CVE-2022-28893"
+
+# cpe-stable-backport: Backported in 5.15.64
+CVE_CHECK_IGNORE += "CVE-2022-2905"
+
+# cpe-stable-backport: Backported in 5.15.26
+CVE_CHECK_IGNORE += "CVE-2022-29156"
+
+# cpe-stable-backport: Backported in 5.15.19
+CVE_CHECK_IGNORE += "CVE-2022-2938"
+
+# cpe-stable-backport: Backported in 5.15.36
+CVE_CHECK_IGNORE += "CVE-2022-29581"
+
+# cpe-stable-backport: Backported in 5.15.34
+CVE_CHECK_IGNORE += "CVE-2022-29582"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-2959"
+
+# CVE-2022-2961 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.24
+CVE_CHECK_IGNORE += "CVE-2022-2964"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-2977"
+
+# cpe-stable-backport: Backported in 5.15.73
+CVE_CHECK_IGNORE += "CVE-2022-2978"
+
+# cpe-stable-backport: Backported in 5.15.57
+CVE_CHECK_IGNORE += "CVE-2022-29900"
+
+# cpe-stable-backport: Backported in 5.15.57
+CVE_CHECK_IGNORE += "CVE-2022-29901"
+
+# fixed-version: Fixed after version 5.15rc1
+CVE_CHECK_IGNORE += "CVE-2022-2991"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-29968"
+
+# cpe-stable-backport: Backported in 5.15.64
+CVE_CHECK_IGNORE += "CVE-2022-3028"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-30594"
+
+# cpe-stable-backport: Backported in 5.15.70
+CVE_CHECK_IGNORE += "CVE-2022-3061"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-3077"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-3078"
+
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3103"
+
+# cpe-stable-backport: Backported in 5.15.47
+CVE_CHECK_IGNORE += "CVE-2022-3104"
+
+# cpe-stable-backport: Backported in 5.15.14
+CVE_CHECK_IGNORE += "CVE-2022-3105"
+
+# cpe-stable-backport: Backported in 5.15.11
+CVE_CHECK_IGNORE += "CVE-2022-3106"
+
+# cpe-stable-backport: Backported in 5.15.31
+CVE_CHECK_IGNORE += "CVE-2022-3107"
+
+# cpe-stable-backport: Backported in 5.15.27
+CVE_CHECK_IGNORE += "CVE-2022-3108"
+
+# cpe-stable-backport: Backported in 5.15.47
+CVE_CHECK_IGNORE += "CVE-2022-3110"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-3111"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-3112"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-3113"
+
+# CVE-2022-3114 needs backporting (fixed from 5.19rc1)
+
+# cpe-stable-backport: Backported in 5.15.46
+CVE_CHECK_IGNORE += "CVE-2022-3115"
+
+# cpe-stable-backport: Backported in 5.15.80
+CVE_CHECK_IGNORE += "CVE-2022-3169"
+
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3170"
+
+# cpe-stable-backport: Backported in 5.15.65
+CVE_CHECK_IGNORE += "CVE-2022-3176"
+
+# cpe-stable-backport: Backported in 5.15.34
+CVE_CHECK_IGNORE += "CVE-2022-3202"
+
+# cpe-stable-backport: Backported in 5.15.45
+CVE_CHECK_IGNORE += "CVE-2022-32250"
+
+# cpe-stable-backport: Backported in 5.15.41
+CVE_CHECK_IGNORE += "CVE-2022-32296"
+
+# CVE-2022-3238 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2022-3239"
+
+# cpe-stable-backport: Backported in 5.15.47
+CVE_CHECK_IGNORE += "CVE-2022-32981"
+
+# cpe-stable-backport: Backported in 5.15.68
+CVE_CHECK_IGNORE += "CVE-2022-3303"
+
+# cpe-stable-backport: Backported in 5.15.81
+CVE_CHECK_IGNORE += "CVE-2022-3344"
+
+# cpe-stable-backport: Backported in 5.15.53
+CVE_CHECK_IGNORE += "CVE-2022-33740"
+
+# cpe-stable-backport: Backported in 5.15.53
+CVE_CHECK_IGNORE += "CVE-2022-33741"
+
+# cpe-stable-backport: Backported in 5.15.53
+CVE_CHECK_IGNORE += "CVE-2022-33742"
+
+# cpe-stable-backport: Backported in 5.15.53
+CVE_CHECK_IGNORE += "CVE-2022-33743"
+
+# cpe-stable-backport: Backported in 5.15.53
+CVE_CHECK_IGNORE += "CVE-2022-33744"
+
+# cpe-stable-backport: Backported in 5.15.37
+CVE_CHECK_IGNORE += "CVE-2022-33981"
+
+# cpe-stable-backport: Backported in 5.15.86
+CVE_CHECK_IGNORE += "CVE-2022-3424"
+
+# fixed-version: only affects 5.18rc2 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3435"
+
+# cpe-stable-backport: Backported in 5.15.47
+CVE_CHECK_IGNORE += "CVE-2022-34494"
+
+# cpe-stable-backport: Backported in 5.15.47
+CVE_CHECK_IGNORE += "CVE-2022-34495"
+
+# cpe-stable-backport: Backported in 5.15.54
+CVE_CHECK_IGNORE += "CVE-2022-34918"
+
+# cpe-stable-backport: Backported in 5.15.80
+CVE_CHECK_IGNORE += "CVE-2022-3521"
+
+# CVE-2022-3522 needs backporting (fixed from 6.1rc1)
+
+# CVE-2022-3523 needs backporting (fixed from 6.1rc1)
+
+# cpe-stable-backport: Backported in 5.15.77
+CVE_CHECK_IGNORE += "CVE-2022-3524"
+
+# cpe-stable-backport: Backported in 5.15.35
+CVE_CHECK_IGNORE += "CVE-2022-3526"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3531"
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3532"
+
+# CVE-2022-3533 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.86
+CVE_CHECK_IGNORE += "CVE-2022-3534"
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-3535"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3541"
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-3542"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2022-3543"
+
+# CVE-2022-3544 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.84
+CVE_CHECK_IGNORE += "CVE-2022-3545"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2022-3564"
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-3565"
+
+# CVE-2022-3566 needs backporting (fixed from 6.1rc1)
+
+# CVE-2022-3567 needs backporting (fixed from 6.1rc1)
+
+# cpe-stable-backport: Backported in 5.15.46
+CVE_CHECK_IGNORE += "CVE-2022-3577"
+
+# cpe-stable-backport: Backported in 5.15.68
+CVE_CHECK_IGNORE += "CVE-2022-3586"
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-3594"
+
+# CVE-2022-3595 needs backporting (fixed from 6.1rc1)
+
+# CVE-2022-3606 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.56
+CVE_CHECK_IGNORE += "CVE-2022-36123"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2022-3619"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-3621"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2022-3623"
+
+# CVE-2022-3624 needs backporting (fixed from 6.0rc1)
+
+# cpe-stable-backport: Backported in 5.15.63
+CVE_CHECK_IGNORE += "CVE-2022-3625"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2022-3628"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2022-36280"
+
+# cpe-stable-backport: Backported in 5.15.63
+CVE_CHECK_IGNORE += "CVE-2022-3629"
+
+# fixed-version: only affects 5.19rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3630"
+
+# cpe-stable-backport: Backported in 5.15.63
+CVE_CHECK_IGNORE += "CVE-2022-3633"
+
+# cpe-stable-backport: Backported in 5.15.63
+CVE_CHECK_IGNORE += "CVE-2022-3635"
+
+# CVE-2022-3636 needs backporting (fixed from 5.19rc1)
+
+# fixed-version: only affects 5.19 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3640"
+
+# cpe-stable-backport: Backported in 5.15.129
+CVE_CHECK_IGNORE += "CVE-2022-36402"
+
+# CVE-2022-3642 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.83
+CVE_CHECK_IGNORE += "CVE-2022-3643"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-3646"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-3649"
+
+# cpe-stable-backport: Backported in 5.15.58
+CVE_CHECK_IGNORE += "CVE-2022-36879"
+
+# cpe-stable-backport: Backported in 5.15.59
+CVE_CHECK_IGNORE += "CVE-2022-36946"
+
+# cpe-stable-backport: Backported in 5.15.96
+CVE_CHECK_IGNORE += "CVE-2022-3707"
+
+# CVE-2022-38096 has no known resolution
+
+# CVE-2022-38457 needs backporting (fixed from 6.2rc4)
+
+# CVE-2022-3903 needs backporting (fixed from 6.1rc2)
+
+# fixed-version: only affects 5.18 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3910"
+
+# CVE-2022-39188 needs backporting (fixed from 5.19rc8)
+
+# cpe-stable-backport: Backported in 5.15.60
+CVE_CHECK_IGNORE += "CVE-2022-39189"
+
+# cpe-stable-backport: Backported in 5.15.64
+CVE_CHECK_IGNORE += "CVE-2022-39190"
+
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-3977"
+
+# cpe-stable-backport: Backported in 5.15.70
+CVE_CHECK_IGNORE += "CVE-2022-39842"
+
+# CVE-2022-40133 needs backporting (fixed from 6.2rc4)
+
+# cpe-stable-backport: Backported in 5.15.68
+CVE_CHECK_IGNORE += "CVE-2022-40307"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-40476"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-40768"
+
+# cpe-stable-backport: Backported in 5.15.66
+CVE_CHECK_IGNORE += "CVE-2022-4095"
+
+# cpe-stable-backport: Backported in 5.15.125
+CVE_CHECK_IGNORE += "CVE-2022-40982"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2022-41218"
+
+# fixed-version: Fixed after version 5.14rc1
+CVE_CHECK_IGNORE += "CVE-2022-41222"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-4127"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2022-4128"
+
+# cpe-stable-backport: Backported in 5.15.91
+CVE_CHECK_IGNORE += "CVE-2022-4129"
+
+# fixed-version: only affects 5.17rc2 onwards
+CVE_CHECK_IGNORE += "CVE-2022-4139"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-41674"
+
+# CVE-2022-41848 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-41849"
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-41850"
+
+# cpe-stable-backport: Backported in 5.15.35
+CVE_CHECK_IGNORE += "CVE-2022-41858"
+
+# fixed-version: only affects 5.16rc7 onwards
+CVE_CHECK_IGNORE += "CVE-2022-42328"
+
+# fixed-version: only affects 5.16rc7 onwards
+CVE_CHECK_IGNORE += "CVE-2022-42329"
+
+# cpe-stable-backport: Backported in 5.15.71
+CVE_CHECK_IGNORE += "CVE-2022-42432"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2022-4269"
+
+# cpe-stable-backport: Backported in 5.15.65
+CVE_CHECK_IGNORE += "CVE-2022-42703"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-42719"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-42720"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-42721"
+
+# cpe-stable-backport: Backported in 5.15.74
+CVE_CHECK_IGNORE += "CVE-2022-42722"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2022-42895"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2022-42896"
+
+# cpe-stable-backport: Backported in 5.15.73
+CVE_CHECK_IGNORE += "CVE-2022-43750"
+
+# cpe-stable-backport: Backported in 5.15.82
+CVE_CHECK_IGNORE += "CVE-2022-4378"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2022-4379"
+
+# cpe-stable-backport: Backported in 5.15.90
+CVE_CHECK_IGNORE += "CVE-2022-4382"
+
+# cpe-stable-backport: Backported in 5.15.75
+CVE_CHECK_IGNORE += "CVE-2022-43945"
+
+# CVE-2022-44032 needs backporting (fixed from 6.4rc1)
+
+# CVE-2022-44033 needs backporting (fixed from 6.4rc1)
+
+# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
+
+# CVE-2022-4543 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.82
+CVE_CHECK_IGNORE += "CVE-2022-45869"
+
+# CVE-2022-45884 has no known resolution
+
+# CVE-2022-45885 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.116
+CVE_CHECK_IGNORE += "CVE-2022-45886"
+
+# cpe-stable-backport: Backported in 5.15.116
+CVE_CHECK_IGNORE += "CVE-2022-45887"
+
+# CVE-2022-45888 needs backporting (fixed from 6.2rc1)
+
+# cpe-stable-backport: Backported in 5.15.116
+CVE_CHECK_IGNORE += "CVE-2022-45919"
+
+# cpe-stable-backport: Backported in 5.15.85
+CVE_CHECK_IGNORE += "CVE-2022-45934"
+
+# cpe-stable-backport: Backported in 5.15.66
+CVE_CHECK_IGNORE += "CVE-2022-4662"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2022-4696"
+
+# cpe-stable-backport: Backported in 5.15.12
+CVE_CHECK_IGNORE += "CVE-2022-4744"
+
+# cpe-stable-backport: Backported in 5.15.81
+CVE_CHECK_IGNORE += "CVE-2022-47518"
+
+# cpe-stable-backport: Backported in 5.15.81
+CVE_CHECK_IGNORE += "CVE-2022-47519"
+
+# cpe-stable-backport: Backported in 5.15.81
+CVE_CHECK_IGNORE += "CVE-2022-47520"
+
+# cpe-stable-backport: Backported in 5.15.81
+CVE_CHECK_IGNORE += "CVE-2022-47521"
+
+# cpe-stable-backport: Backported in 5.15.88
+CVE_CHECK_IGNORE += "CVE-2022-47929"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2022-47938"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2022-47939"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2022-47940"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2022-47941"
+
+# cpe-stable-backport: Backported in 5.15.62
+CVE_CHECK_IGNORE += "CVE-2022-47942"
+
+# cpe-stable-backport: Backported in 5.15.62
+CVE_CHECK_IGNORE += "CVE-2022-47943"
+
+# fixed-version: Fixed after version 5.12rc2
+CVE_CHECK_IGNORE += "CVE-2022-47946"
+
+# cpe-stable-backport: Backported in 5.15.90
+CVE_CHECK_IGNORE += "CVE-2022-4842"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2022-48423"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2022-48424"
+
+# cpe-stable-backport: Backported in 5.15.113
+CVE_CHECK_IGNORE += "CVE-2022-48425"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2022-48502"
+
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2022-48619"
+
+# cpe-stable-backport: Backported in 5.15.23
+CVE_CHECK_IGNORE += "CVE-2022-48626"
+
+# cpe-stable-backport: Backported in 5.15.56
+CVE_CHECK_IGNORE += "CVE-2022-48627"
+
+# CVE-2022-48628 needs backporting (fixed from 6.6rc1)
+
+# cpe-stable-backport: Backported in 5.15.31
+CVE_CHECK_IGNORE += "CVE-2022-48629"
+
+# fixed-version: only affects 5.17 onwards
+CVE_CHECK_IGNORE += "CVE-2022-48630"
+
+# fixed-version: Fixed after version 5.0rc1
+CVE_CHECK_IGNORE += "CVE-2023-0030"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2023-0045"
+
+# cpe-stable-backport: Backported in 5.15.3
+CVE_CHECK_IGNORE += "CVE-2023-0047"
+
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-0122"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-0160"
+
+# cpe-stable-backport: Backported in 5.15.89
+CVE_CHECK_IGNORE += "CVE-2023-0179"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2023-0210"
+
+# fixed-version: Fixed after version 5.10rc1
+CVE_CHECK_IGNORE += "CVE-2023-0240"
+
+# cpe-stable-backport: Backported in 5.15.88
+CVE_CHECK_IGNORE += "CVE-2023-0266"
+
+# cpe-stable-backport: Backported in 5.15.91
+CVE_CHECK_IGNORE += "CVE-2023-0386"
+
+# cpe-stable-backport: Backported in 5.15.89
+CVE_CHECK_IGNORE += "CVE-2023-0394"
+
+# cpe-stable-backport: Backported in 5.15.90
+CVE_CHECK_IGNORE += "CVE-2023-0458"
+
+# cpe-stable-backport: Backported in 5.15.96
+CVE_CHECK_IGNORE += "CVE-2023-0459"
+
+# cpe-stable-backport: Backported in 5.15.88
+CVE_CHECK_IGNORE += "CVE-2023-0461"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-0468"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-0469"
+
+# cpe-stable-backport: Backported in 5.15.76
+CVE_CHECK_IGNORE += "CVE-2023-0590"
+
+# CVE-2023-0597 needs backporting (fixed from 6.2rc1)
+
+# cpe-stable-backport: Backported in 5.15.77
+CVE_CHECK_IGNORE += "CVE-2023-0615"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-1032"
+
+# cpe-stable-backport: Backported in 5.15.91
+CVE_CHECK_IGNORE += "CVE-2023-1073"
+
+# cpe-stable-backport: Backported in 5.15.91
+CVE_CHECK_IGNORE += "CVE-2023-1074"
+
+# CVE-2023-1075 needs backporting (fixed from 6.2rc7)
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-1076"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-1077"
+
+# cpe-stable-backport: Backported in 5.15.94
+CVE_CHECK_IGNORE += "CVE-2023-1078"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-1079"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2023-1095"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-1118"
+
+# cpe-stable-backport: Backported in 5.15.113
+CVE_CHECK_IGNORE += "CVE-2023-1192"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-1193"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-1194"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-1195"
+
+# cpe-stable-backport: Backported in 5.15.124
+CVE_CHECK_IGNORE += "CVE-2023-1206"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2023-1249"
+
+# cpe-stable-backport: Backported in 5.15.3
+CVE_CHECK_IGNORE += "CVE-2023-1252"
+
+# cpe-stable-backport: Backported in 5.15.95
+CVE_CHECK_IGNORE += "CVE-2023-1281"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2023-1295"
+
+# cpe-stable-backport: Backported in 5.15.110
+CVE_CHECK_IGNORE += "CVE-2023-1380"
+
+# cpe-stable-backport: Backported in 5.15.81
+CVE_CHECK_IGNORE += "CVE-2023-1382"
+
+# fixed-version: Fixed after version 5.11rc4
+CVE_CHECK_IGNORE += "CVE-2023-1390"
+
+# CVE-2023-1476 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.95
+CVE_CHECK_IGNORE += "CVE-2023-1513"
+
+# cpe-stable-backport: Backported in 5.15.25
+CVE_CHECK_IGNORE += "CVE-2023-1582"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-1583"
+
+# cpe-stable-backport: Backported in 5.15.106
+CVE_CHECK_IGNORE += "CVE-2023-1611"
+
+# cpe-stable-backport: Backported in 5.15.34
+CVE_CHECK_IGNORE += "CVE-2023-1637"
+
+# cpe-stable-backport: Backported in 5.15.91
+CVE_CHECK_IGNORE += "CVE-2023-1652"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-1670"
+
+# cpe-stable-backport: Backported in 5.15.100
+CVE_CHECK_IGNORE += "CVE-2023-1829"
+
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2023-1838"
+
+# cpe-stable-backport: Backported in 5.15.104
+CVE_CHECK_IGNORE += "CVE-2023-1855"
+
+# cpe-stable-backport: Backported in 5.15.108
+CVE_CHECK_IGNORE += "CVE-2023-1859"
+
+# CVE-2023-1872 needs backporting (fixed from 5.18rc2)
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-1989"
+
+# cpe-stable-backport: Backported in 5.15.104
+CVE_CHECK_IGNORE += "CVE-2023-1990"
+
+# fixed-version: only affects 5.19rc7 onwards
+CVE_CHECK_IGNORE += "CVE-2023-1998"
+
+# cpe-stable-backport: Backported in 5.15.110
+CVE_CHECK_IGNORE += "CVE-2023-2002"
+
+# cpe-stable-backport: Backported in 5.15.81
+CVE_CHECK_IGNORE += "CVE-2023-2006"
+
+# CVE-2023-2007 needs backporting (fixed from 6.0rc1)
+
+# cpe-stable-backport: Backported in 5.15.51
+CVE_CHECK_IGNORE += "CVE-2023-2008"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2023-2019"
+
+# cpe-stable-backport: Backported in 5.15.125
+CVE_CHECK_IGNORE += "CVE-2023-20569"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-20588"
+
+# cpe-stable-backport: Backported in 5.15.122
+CVE_CHECK_IGNORE += "CVE-2023-20593"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2023-20928"
+
+# CVE-2023-20937 has no known resolution
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-20938"
+
+# CVE-2023-20941 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.90
+CVE_CHECK_IGNORE += "CVE-2023-21102"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-21106"
+
+# cpe-stable-backport: Backported in 5.15.117
+CVE_CHECK_IGNORE += "CVE-2023-2124"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-21255"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-21264"
+
+# CVE-2023-21400 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.109
+CVE_CHECK_IGNORE += "CVE-2023-2156"
+
+# cpe-stable-backport: Backported in 5.15.93
+CVE_CHECK_IGNORE += "CVE-2023-2162"
+
+# cpe-stable-backport: Backported in 5.15.109
+CVE_CHECK_IGNORE += "CVE-2023-2163"
+
+# cpe-stable-backport: Backported in 5.15.83
+CVE_CHECK_IGNORE += "CVE-2023-2166"
+
+# CVE-2023-2176 needs backporting (fixed from 6.3rc1)
+
+# cpe-stable-backport: Backported in 5.15.59
+CVE_CHECK_IGNORE += "CVE-2023-2177"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-2194"
+
+# cpe-stable-backport: Backported in 5.15.104
+CVE_CHECK_IGNORE += "CVE-2023-2235"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-2236"
+
+# cpe-stable-backport: Backported in 5.15.109
+CVE_CHECK_IGNORE += "CVE-2023-2248"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-2269"
+
+# CVE-2023-22995 needs backporting (fixed from 5.17rc1)
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-22996"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-22997"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2023-22998"
+
+# cpe-stable-backport: Backported in 5.15.17
+CVE_CHECK_IGNORE += "CVE-2023-22999"
+
+# CVE-2023-23000 needs backporting (fixed from 5.17rc1)
+
+# cpe-stable-backport: Backported in 5.15.17
+CVE_CHECK_IGNORE += "CVE-2023-23001"
+
+# cpe-stable-backport: Backported in 5.15.17
+CVE_CHECK_IGNORE += "CVE-2023-23002"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-23003"
+
+# cpe-stable-backport: Backported in 5.15.100
+CVE_CHECK_IGNORE += "CVE-2023-23004"
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-23005"
+
+# cpe-stable-backport: Backported in 5.15.13
+CVE_CHECK_IGNORE += "CVE-2023-23006"
+
+# CVE-2023-23039 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2023-23454"
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2023-23455"
+
+# cpe-stable-backport: Backported in 5.15.91
+CVE_CHECK_IGNORE += "CVE-2023-23559"
+
+# fixed-version: Fixed after version 5.12rc1
+CVE_CHECK_IGNORE += "CVE-2023-23586"
+
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-2430"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-2483"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-25012"
+
+# cpe-stable-backport: Backported in 5.15.61
+CVE_CHECK_IGNORE += "CVE-2023-2513"
+
+# cpe-stable-backport: Backported in 5.15.144
+CVE_CHECK_IGNORE += "CVE-2023-25775"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-2598"
+
+# CVE-2023-26242 has no known resolution
+
+# CVE-2023-2640 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.87
+CVE_CHECK_IGNORE += "CVE-2023-26544"
+
+# cpe-stable-backport: Backported in 5.15.95
+CVE_CHECK_IGNORE += "CVE-2023-26545"
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-26605"
+
+# cpe-stable-backport: Backported in 5.15.86
+CVE_CHECK_IGNORE += "CVE-2023-26606"
+
+# cpe-stable-backport: Backported in 5.15.80
+CVE_CHECK_IGNORE += "CVE-2023-26607"
+
+# cpe-stable-backport: Backported in 5.15.83
+CVE_CHECK_IGNORE += "CVE-2023-28327"
+
+# cpe-stable-backport: Backported in 5.15.86
+CVE_CHECK_IGNORE += "CVE-2023-28328"
+
+# cpe-stable-backport: Backported in 5.15.33
+CVE_CHECK_IGNORE += "CVE-2023-28410"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-28464"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-28466"
+
+# cpe-stable-backport: Backported in 5.15.68
+CVE_CHECK_IGNORE += "CVE-2023-2860"
+
+# CVE-2023-28746 needs backporting (fixed from 6.9rc1)
+
+# fixed-version: Fixed after version 5.14rc1
+CVE_CHECK_IGNORE += "CVE-2023-28772"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-28866"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-2898"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-2985"
+
+# cpe-stable-backport: Backported in 5.15.77
+CVE_CHECK_IGNORE += "CVE-2023-3006"
+
+# Skipping CVE-2023-3022, no affected_versions
+
+# cpe-stable-backport: Backported in 5.15.104
+CVE_CHECK_IGNORE += "CVE-2023-30456"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-30772"
+
+# cpe-stable-backport: Backported in 5.15.113
+CVE_CHECK_IGNORE += "CVE-2023-3090"
+
+# fixed-version: Fixed after version 4.8rc7
+CVE_CHECK_IGNORE += "CVE-2023-3106"
+
+# Skipping CVE-2023-3108, no affected_versions
+
+# CVE-2023-31081 has no known resolution
+
+# CVE-2023-31082 has no known resolution
+
+# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-31084 needs backporting (fixed from 6.4rc3)
+
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-31085"
+
+# cpe-stable-backport: Backported in 5.15.63
+CVE_CHECK_IGNORE += "CVE-2023-3111"
+
+# cpe-stable-backport: Backported in 5.15.118
+CVE_CHECK_IGNORE += "CVE-2023-3117"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-31248"
+
+# cpe-stable-backport: Backported in 5.15.113
+CVE_CHECK_IGNORE += "CVE-2023-3141"
+
+# cpe-stable-backport: Backported in 5.15.109
+CVE_CHECK_IGNORE += "CVE-2023-31436"
+
+# cpe-stable-backport: Backported in 5.15.39
+CVE_CHECK_IGNORE += "CVE-2023-3159"
+
+# cpe-stable-backport: Backported in 5.15.93
+CVE_CHECK_IGNORE += "CVE-2023-3161"
+
+# cpe-stable-backport: Backported in 5.15.116
+CVE_CHECK_IGNORE += "CVE-2023-3212"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-3220"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-32233"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32247"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-32248"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32250"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32252"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32254"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32257"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32258"
+
+# cpe-stable-backport: Backported in 5.15.93
+CVE_CHECK_IGNORE += "CVE-2023-32269"
+
+# CVE-2023-32629 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-3268"
+
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-3269"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-3312"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-3317"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-33203"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-33250"
+
+# cpe-stable-backport: Backported in 5.15.105
+CVE_CHECK_IGNORE += "CVE-2023-33288"
+
+# cpe-stable-backport: Backported in 5.15.118
+CVE_CHECK_IGNORE += "CVE-2023-3338"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-3355"
+
+# cpe-stable-backport: Backported in 5.15.86
+CVE_CHECK_IGNORE += "CVE-2023-3357"
+
+# cpe-stable-backport: Backported in 5.15.91
+CVE_CHECK_IGNORE += "CVE-2023-3358"
+
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-3359"
+
+# CVE-2023-3389 needs backporting (fixed from 6.0rc1)
+
+# cpe-stable-backport: Backported in 5.15.118
+CVE_CHECK_IGNORE += "CVE-2023-3390"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-33951"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-33952"
+
+# CVE-2023-3397 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.117
+CVE_CHECK_IGNORE += "CVE-2023-34255"
+
+# cpe-stable-backport: Backported in 5.15.112
+CVE_CHECK_IGNORE += "CVE-2023-34256"
+
+# fixed-version: only affects 6.1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-34319"
+
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-34324"
+
+# CVE-2023-3439 needs backporting (fixed from 5.18rc5)
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-35001"
+
+# cpe-stable-backport: Backported in 5.15.93
+CVE_CHECK_IGNORE += "CVE-2023-3567"
+
+# CVE-2023-35693 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.116
+CVE_CHECK_IGNORE += "CVE-2023-35788"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-35823"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-35824"
+
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-35826"
+
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-35827"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-35828"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-35829"
+
+# cpe-stable-backport: Backported in 5.15.118
+CVE_CHECK_IGNORE += "CVE-2023-3609"
+
+# cpe-stable-backport: Backported in 5.15.119
+CVE_CHECK_IGNORE += "CVE-2023-3610"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-3611"
+
+# CVE-2023-3640 has no known resolution
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-37453"
+
+# CVE-2023-37454 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-3772"
+
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-3773"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-3776"
+
+# cpe-stable-backport: Backported in 5.15.123
+CVE_CHECK_IGNORE += "CVE-2023-3777"
+
+# cpe-stable-backport: Backported in 5.15.78
+CVE_CHECK_IGNORE += "CVE-2023-3812"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-38409"
+
+# cpe-stable-backport: Backported in 5.15.113
+CVE_CHECK_IGNORE += "CVE-2023-38426"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-38427"
+
+# cpe-stable-backport: Backported in 5.15.113
+CVE_CHECK_IGNORE += "CVE-2023-38428"
+
+# cpe-stable-backport: Backported in 5.15.113
+CVE_CHECK_IGNORE += "CVE-2023-38429"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-38430"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-38431"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-38432"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-3863"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-3865"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-3866"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-3867"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-39189"
+
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-39191"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-39192"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-39193"
+
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-39194"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-39197"
+
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-39198"
+
+# cpe-stable-backport: Backported in 5.15.123
+CVE_CHECK_IGNORE += "CVE-2023-4004"
+
+# CVE-2023-4010 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.124
+CVE_CHECK_IGNORE += "CVE-2023-4015"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-40283"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-40791"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4128"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-4132"
+
+# CVE-2023-4133 needs backporting (fixed from 6.3)
+
+# CVE-2023-4134 needs backporting (fixed from 6.5rc1)
+
+# cpe-stable-backport: Backported in 5.15.124
+CVE_CHECK_IGNORE += "CVE-2023-4147"
+
+# CVE-2023-4155 needs backporting (fixed from 6.5rc6)
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4194"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4206"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4207"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4208"
+
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-4244"
+
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-4273"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-42752"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-42753"
+
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-42754"
+
+# cpe-stable-backport: Backported in 5.15.133
+CVE_CHECK_IGNORE += "CVE-2023-42755"
+
+# fixed-version: only affects 6.4rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-42756"
+
+# cpe-stable-backport: Backported in 5.15.46
+CVE_CHECK_IGNORE += "CVE-2023-4385"
+
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2023-4387"
+
+# cpe-stable-backport: Backported in 5.15.35
+CVE_CHECK_IGNORE += "CVE-2023-4389"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4394"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-44466"
+
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2023-4459"
+
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-4563"
+
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-4569"
+
+# cpe-stable-backport: Backported in 5.15.100
+CVE_CHECK_IGNORE += "CVE-2023-45862"
+
+# cpe-stable-backport: Backported in 5.15.99
+CVE_CHECK_IGNORE += "CVE-2023-45863"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-45871"
+
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-45898"
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4610"
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4611"
+
+# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-4623"
+
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-46343"
+
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-46813"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-46838"
+
+# cpe-stable-backport: Backported in 5.15.140
+CVE_CHECK_IGNORE += "CVE-2023-46862"
+
+# CVE-2023-47233 needs backporting (fixed from 6.9rc1)
+
+# fixed-version: Fixed after version 5.14rc1
+CVE_CHECK_IGNORE += "CVE-2023-4732"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-4881"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-4921"
+
+# CVE-2023-50431 needs backporting (fixed from 6.8rc1)
+
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5090"
+
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-51042"
+
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-51043"
+
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-5158"
+
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2023-51779"
+
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-5178"
+
+# cpe-stable-backport: Backported in 5.15.144
+CVE_CHECK_IGNORE += "CVE-2023-51780"
+
+# cpe-stable-backport: Backported in 5.15.144
+CVE_CHECK_IGNORE += "CVE-2023-51781"
+
+# cpe-stable-backport: Backported in 5.15.144
+CVE_CHECK_IGNORE += "CVE-2023-51782"
+
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-5197"
+
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2023-52340"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52429"
+
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52433"
+
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2023-52434"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52435"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52436"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52438"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52439"
+
+# fixed-version: only affects 5.17rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52440"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-52441"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-52442"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52443"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52444"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52445"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52446"
+
+# cpe-stable-backport: Backported in 5.15.153
+CVE_CHECK_IGNORE += "CVE-2023-52447"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52448"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52449"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52450"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52451"
+
+# CVE-2023-52452 needs backporting (fixed from 6.8rc1)
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52453"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52454"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52455"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52456"
+
+# fixed-version: only affects 6.1rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52457"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52458"
+
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52459"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52460"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52461"
+
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52462"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52463"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52464"
+
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52465"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52467"
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52468"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52469"
+
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52470"
+
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52471"
+
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52472"
+
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52473"
+
+# cpe-stable-backport: Backported in 5.15.111
+CVE_CHECK_IGNORE += "CVE-2023-52474"
+
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52475"
+
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-52476"
+
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52477"
+
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52478"
+
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52479"
+
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-52480"
+
+# CVE-2023-52481 needs backporting (fixed from 6.6rc5)
+
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52482"
+
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-52483"
+
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52484"
+
+# CVE-2023-52485 needs backporting (fixed from 6.8rc1)
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52486"
+
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52487"
+
+# CVE-2023-52488 needs backporting (fixed from 6.8rc1)
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52489"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52490"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52491"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52492"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52493"
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52494"
+
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52495"
 
-# cpe-stable-backport: Backported in 5.15.62
-CVE_CHECK_IGNORE += "CVE-2022-47942"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2023-52497"
 
-# cpe-stable-backport: Backported in 5.15.62
-CVE_CHECK_IGNORE += "CVE-2022-47943"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52498"
 
-# fixed-version: Fixed after version 5.12rc2
-CVE_CHECK_IGNORE += "CVE-2022-47946"
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-52499"
 
-# cpe-stable-backport: Backported in 5.15.90
-CVE_CHECK_IGNORE += "CVE-2022-4842"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52500"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2022-48423"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52501"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2022-48424"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52502"
 
-# cpe-stable-backport: Backported in 5.15.113
-CVE_CHECK_IGNORE += "CVE-2022-48425"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52503"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2022-48502"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52504"
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2022-48619"
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52505"
 
-# fixed-version: Fixed after version 5.0rc1
-CVE_CHECK_IGNORE += "CVE-2023-0030"
+# CVE-2023-52506 needs backporting (fixed from 6.6rc3)
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2023-0045"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52507"
 
-# cpe-stable-backport: Backported in 5.15.3
-CVE_CHECK_IGNORE += "CVE-2023-0047"
+# CVE-2023-52508 needs backporting (fixed from 6.6rc2)
 
-# fixed-version: only affects 6.0rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-0122"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52509"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-0160"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52510"
 
-# cpe-stable-backport: Backported in 5.15.89
-CVE_CHECK_IGNORE += "CVE-2023-0179"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52511"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2023-0210"
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52512"
 
-# fixed-version: Fixed after version 5.10rc1
-CVE_CHECK_IGNORE += "CVE-2023-0240"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52513"
 
-# cpe-stable-backport: Backported in 5.15.88
-CVE_CHECK_IGNORE += "CVE-2023-0266"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52515"
 
-# cpe-stable-backport: Backported in 5.15.91
-CVE_CHECK_IGNORE += "CVE-2023-0386"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52516"
 
-# cpe-stable-backport: Backported in 5.15.89
-CVE_CHECK_IGNORE += "CVE-2023-0394"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52517"
 
-# cpe-stable-backport: Backported in 5.15.90
-CVE_CHECK_IGNORE += "CVE-2023-0458"
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52518"
 
-# cpe-stable-backport: Backported in 5.15.96
-CVE_CHECK_IGNORE += "CVE-2023-0459"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52519"
 
-# cpe-stable-backport: Backported in 5.15.88
-CVE_CHECK_IGNORE += "CVE-2023-0461"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52520"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-0468"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52522"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-0469"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52523"
 
-# cpe-stable-backport: Backported in 5.15.76
-CVE_CHECK_IGNORE += "CVE-2023-0590"
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52524"
 
-# CVE-2023-0597 needs backporting (fixed from 6.2rc1)
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52525"
 
-# cpe-stable-backport: Backported in 5.15.77
-CVE_CHECK_IGNORE += "CVE-2023-0615"
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52526"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-1032"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52527"
 
-# cpe-stable-backport: Backported in 5.15.91
-CVE_CHECK_IGNORE += "CVE-2023-1073"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52528"
 
-# cpe-stable-backport: Backported in 5.15.91
-CVE_CHECK_IGNORE += "CVE-2023-1074"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52529"
 
-# CVE-2023-1075 needs backporting (fixed from 6.2rc7)
+# CVE-2023-52530 needs backporting (fixed from 6.6rc5)
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-1076"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-52531"
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-1077"
+# CVE-2023-52532 needs backporting (fixed from 6.6rc5)
 
-# cpe-stable-backport: Backported in 5.15.94
-CVE_CHECK_IGNORE += "CVE-2023-1078"
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-52559"
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-1079"
+# fixed-version: only affects 5.16rc5 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52560"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2023-1095"
+# CVE-2023-52561 needs backporting (fixed from 6.6rc1)
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-1118"
+# fixed-version: only affects 6.0rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52562"
 
-# cpe-stable-backport: Backported in 5.15.113
-CVE_CHECK_IGNORE += "CVE-2023-1192"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52563"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-1193"
+# fixed-version: only affects 6.5rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52564"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-1194"
+# CVE-2023-52565 needs backporting (fixed from 6.6rc3)
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-1195"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52566"
 
-# cpe-stable-backport: Backported in 5.15.124
-CVE_CHECK_IGNORE += "CVE-2023-1206"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52567"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2023-1249"
+# CVE-2023-52568 needs backporting (fixed from 6.6rc4)
 
-# cpe-stable-backport: Backported in 5.15.3
-CVE_CHECK_IGNORE += "CVE-2023-1252"
+# CVE-2023-52569 needs backporting (fixed from 6.6rc2)
 
-# cpe-stable-backport: Backported in 5.15.95
-CVE_CHECK_IGNORE += "CVE-2023-1281"
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52570"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2023-1295"
+# CVE-2023-52571 needs backporting (fixed from 6.6rc4)
 
-# cpe-stable-backport: Backported in 5.15.110
-CVE_CHECK_IGNORE += "CVE-2023-1380"
+# CVE-2023-52572 needs backporting (fixed from 6.6rc3)
 
-# cpe-stable-backport: Backported in 5.15.81
-CVE_CHECK_IGNORE += "CVE-2023-1382"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52573"
 
-# fixed-version: Fixed after version 5.11rc4
-CVE_CHECK_IGNORE += "CVE-2023-1390"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52574"
 
-# CVE-2023-1476 has no known resolution
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52575"
 
-# cpe-stable-backport: Backported in 5.15.95
-CVE_CHECK_IGNORE += "CVE-2023-1513"
+# CVE-2023-52576 needs backporting (fixed from 6.6rc3)
 
-# cpe-stable-backport: Backported in 5.15.25
-CVE_CHECK_IGNORE += "CVE-2023-1582"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52577"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-1583"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52578"
 
-# cpe-stable-backport: Backported in 5.15.106
-CVE_CHECK_IGNORE += "CVE-2023-1611"
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-52580"
 
-# cpe-stable-backport: Backported in 5.15.34
-CVE_CHECK_IGNORE += "CVE-2023-1637"
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52581"
 
-# cpe-stable-backport: Backported in 5.15.91
-CVE_CHECK_IGNORE += "CVE-2023-1652"
+# CVE-2023-52582 needs backporting (fixed from 6.6rc3)
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-1670"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52583"
 
-# cpe-stable-backport: Backported in 5.15.100
-CVE_CHECK_IGNORE += "CVE-2023-1829"
+# CVE-2023-52584 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2023-1838"
+# CVE-2023-52585 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.104
-CVE_CHECK_IGNORE += "CVE-2023-1855"
+# CVE-2023-52586 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.108
-CVE_CHECK_IGNORE += "CVE-2023-1859"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52587"
 
-# CVE-2023-1872 needs backporting (fixed from 5.18rc2)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52588"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-1989"
+# CVE-2023-52589 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.104
-CVE_CHECK_IGNORE += "CVE-2023-1990"
+# CVE-2023-52590 needs backporting (fixed from 6.8rc1)
 
-# fixed-version: only affects 5.19rc7 onwards
-CVE_CHECK_IGNORE += "CVE-2023-1998"
+# CVE-2023-52591 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.110
-CVE_CHECK_IGNORE += "CVE-2023-2002"
+# CVE-2023-52593 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.81
-CVE_CHECK_IGNORE += "CVE-2023-2006"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52594"
 
-# CVE-2023-2007 needs backporting (fixed from 6.0rc1)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52595"
 
-# cpe-stable-backport: Backported in 5.15.51
-CVE_CHECK_IGNORE += "CVE-2023-2008"
+# CVE-2023-52596 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2023-2019"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52597"
 
-# cpe-stable-backport: Backported in 5.15.125
-CVE_CHECK_IGNORE += "CVE-2023-20569"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52598"
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-20588"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52599"
 
-# cpe-stable-backport: Backported in 5.15.122
-CVE_CHECK_IGNORE += "CVE-2023-20593"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52600"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2023-20928"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52601"
 
-# CVE-2023-20937 has no known resolution
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52602"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-20938"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52603"
 
-# CVE-2023-20941 has no known resolution
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52604"
 
-# cpe-stable-backport: Backported in 5.15.90
-CVE_CHECK_IGNORE += "CVE-2023-21102"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52606"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-21106"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52607"
 
-# cpe-stable-backport: Backported in 5.15.117
-CVE_CHECK_IGNORE += "CVE-2023-2124"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52608"
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-21255"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52609"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-21264"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52610"
 
-# CVE-2023-21400 has no known resolution
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52611"
 
-# cpe-stable-backport: Backported in 5.15.109
-CVE_CHECK_IGNORE += "CVE-2023-2156"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-52612"
 
-# cpe-stable-backport: Backported in 5.15.93
-CVE_CHECK_IGNORE += "CVE-2023-2162"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52613"
 
-# cpe-stable-backport: Backported in 5.15.109
-CVE_CHECK_IGNORE += "CVE-2023-2163"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52614"
 
-# cpe-stable-backport: Backported in 5.15.83
-CVE_CHECK_IGNORE += "CVE-2023-2166"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52615"
 
-# CVE-2023-2176 needs backporting (fixed from 6.3rc1)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52616"
 
-# cpe-stable-backport: Backported in 5.15.59
-CVE_CHECK_IGNORE += "CVE-2023-2177"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52617"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-2194"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52618"
 
-# cpe-stable-backport: Backported in 5.15.104
-CVE_CHECK_IGNORE += "CVE-2023-2235"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52619"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-2236"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2023-52620"
 
-# cpe-stable-backport: Backported in 5.15.109
-CVE_CHECK_IGNORE += "CVE-2023-2248"
+# CVE-2023-52621 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-2269"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52622"
 
-# CVE-2023-22995 needs backporting (fixed from 5.17rc1)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52623"
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-22996"
+# CVE-2023-52624 needs backporting (fixed from 6.8rc1)
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-22997"
+# CVE-2023-52625 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2023-22998"
+# fixed-version: only affects 6.7rc2 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52626"
 
-# cpe-stable-backport: Backported in 5.15.17
-CVE_CHECK_IGNORE += "CVE-2023-22999"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52627"
 
-# CVE-2023-23000 needs backporting (fixed from 5.17rc1)
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-52628"
 
-# cpe-stable-backport: Backported in 5.15.17
-CVE_CHECK_IGNORE += "CVE-2023-23001"
+# CVE-2023-52629 needs backporting (fixed from 6.6rc1)
 
-# cpe-stable-backport: Backported in 5.15.17
-CVE_CHECK_IGNORE += "CVE-2023-23002"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52630"
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-23003"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52631"
 
-# cpe-stable-backport: Backported in 5.15.100
-CVE_CHECK_IGNORE += "CVE-2023-23004"
+# CVE-2023-52632 needs backporting (fixed from 6.8rc1)
 
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-23005"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52633"
 
-# cpe-stable-backport: Backported in 5.15.13
-CVE_CHECK_IGNORE += "CVE-2023-23006"
+# CVE-2023-52634 needs backporting (fixed from 6.8rc1)
 
-# CVE-2023-23039 has no known resolution
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52635"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2023-23454"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-52636"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2023-23455"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52637"
 
-# cpe-stable-backport: Backported in 5.15.91
-CVE_CHECK_IGNORE += "CVE-2023-23559"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2023-52638"
 
-# fixed-version: Fixed after version 5.12rc1
-CVE_CHECK_IGNORE += "CVE-2023-23586"
+# CVE-2023-52639 needs backporting (fixed from 6.8rc4)
 
-# fixed-version: only affects 5.18rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-2430"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2023-52640"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-2483"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2023-52641"
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-25012"
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5345"
 
-# cpe-stable-backport: Backported in 5.15.61
-CVE_CHECK_IGNORE += "CVE-2023-2513"
+# fixed-version: only affects 6.2 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5633"
 
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-25775"
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-5717"
 
-# fixed-version: only affects 6.3rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-2598"
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5972"
 
-# CVE-2023-26242 has no known resolution
+# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
-# CVE-2023-2640 has no known resolution
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2023-6040"
 
-# cpe-stable-backport: Backported in 5.15.87
-CVE_CHECK_IGNORE += "CVE-2023-26544"
+# fixed-version: only affects 6.6rc3 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6111"
 
-# cpe-stable-backport: Backported in 5.15.95
-CVE_CHECK_IGNORE += "CVE-2023-26545"
+# cpe-stable-backport: Backported in 5.15.141
+CVE_CHECK_IGNORE += "CVE-2023-6121"
 
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-26605"
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-6176"
 
-# cpe-stable-backport: Backported in 5.15.86
-CVE_CHECK_IGNORE += "CVE-2023-26606"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6200"
 
-# cpe-stable-backport: Backported in 5.15.80
-CVE_CHECK_IGNORE += "CVE-2023-26607"
+# CVE-2023-6238 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.83
-CVE_CHECK_IGNORE += "CVE-2023-28327"
+# CVE-2023-6240 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.86
-CVE_CHECK_IGNORE += "CVE-2023-28328"
+# cpe-stable-backport: Backported in 5.15.153
+CVE_CHECK_IGNORE += "CVE-2023-6270"
 
-# cpe-stable-backport: Backported in 5.15.33
-CVE_CHECK_IGNORE += "CVE-2023-28410"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-6356"
 
-# fixed-version: only affects 6.3rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-28464"
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6531"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-28466"
+# CVE-2023-6535 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.68
-CVE_CHECK_IGNORE += "CVE-2023-2860"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-6536"
 
-# fixed-version: Fixed after version 5.14rc1
-CVE_CHECK_IGNORE += "CVE-2023-28772"
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-6546"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-28866"
+# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-2898"
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2023-6606"
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-2985"
+# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
 
-# cpe-stable-backport: Backported in 5.15.77
-CVE_CHECK_IGNORE += "CVE-2023-3006"
+# cpe-stable-backport: Backported in 5.15.143
+CVE_CHECK_IGNORE += "CVE-2023-6622"
 
-# Skipping CVE-2023-3022, no affected_versions
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6679"
 
-# cpe-stable-backport: Backported in 5.15.104
-CVE_CHECK_IGNORE += "CVE-2023-30456"
+# cpe-stable-backport: Backported in 5.15.143
+CVE_CHECK_IGNORE += "CVE-2023-6817"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-30772"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2023-6915"
 
-# cpe-stable-backport: Backported in 5.15.113
-CVE_CHECK_IGNORE += "CVE-2023-3090"
+# cpe-stable-backport: Backported in 5.15.143
+CVE_CHECK_IGNORE += "CVE-2023-6931"
 
-# fixed-version: Fixed after version 4.8rc7
-CVE_CHECK_IGNORE += "CVE-2023-3106"
+# cpe-stable-backport: Backported in 5.15.142
+CVE_CHECK_IGNORE += "CVE-2023-6932"
 
-# Skipping CVE-2023-3108, no affected_versions
+# cpe-stable-backport: Backported in 5.15.153
+CVE_CHECK_IGNORE += "CVE-2023-7042"
 
-# CVE-2023-31081 has no known resolution
+# cpe-stable-backport: Backported in 5.15.100
+CVE_CHECK_IGNORE += "CVE-2023-7192"
 
-# CVE-2023-31082 has no known resolution
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0193"
 
-# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-0340"
 
-# CVE-2023-31084 needs backporting (fixed from 6.4rc3)
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0443"
 
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2023-31085"
+# cpe-stable-backport: Backported in 5.15.64
+CVE_CHECK_IGNORE += "CVE-2024-0562"
 
-# cpe-stable-backport: Backported in 5.15.63
-CVE_CHECK_IGNORE += "CVE-2023-3111"
+# CVE-2024-0564 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.118
-CVE_CHECK_IGNORE += "CVE-2023-3117"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-0565"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-31248"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0582"
 
-# cpe-stable-backport: Backported in 5.15.113
-CVE_CHECK_IGNORE += "CVE-2023-3141"
+# cpe-stable-backport: Backported in 5.15.142
+CVE_CHECK_IGNORE += "CVE-2024-0584"
 
-# cpe-stable-backport: Backported in 5.15.109
-CVE_CHECK_IGNORE += "CVE-2023-31436"
+# cpe-stable-backport: Backported in 5.15.140
+CVE_CHECK_IGNORE += "CVE-2024-0607"
 
-# cpe-stable-backport: Backported in 5.15.39
-CVE_CHECK_IGNORE += "CVE-2023-3159"
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2024-0639"
 
-# cpe-stable-backport: Backported in 5.15.93
-CVE_CHECK_IGNORE += "CVE-2023-3161"
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2024-0641"
 
-# cpe-stable-backport: Backported in 5.15.116
-CVE_CHECK_IGNORE += "CVE-2023-3212"
+# cpe-stable-backport: Backported in 5.15.147
+CVE_CHECK_IGNORE += "CVE-2024-0646"
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-3220"
+# cpe-stable-backport: Backported in 5.15.112
+CVE_CHECK_IGNORE += "CVE-2024-0775"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-32233"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-0841"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32247"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-1085"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-32248"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-1086"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32250"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-1151"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32252"
+# CVE-2024-1312 needs backporting (fixed from 6.5rc4)
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32254"
+# CVE-2024-21803 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32257"
+# CVE-2024-2193 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-32258"
+# cpe-stable-backport: Backported in 5.15.153
+CVE_CHECK_IGNORE += "CVE-2024-22099"
 
-# cpe-stable-backport: Backported in 5.15.93
-CVE_CHECK_IGNORE += "CVE-2023-32269"
+# CVE-2024-22386 has no known resolution
 
-# CVE-2023-32629 has no known resolution
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2024-22705"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-3268"
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2024-23196"
 
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-3269"
+# CVE-2024-23307 needs backporting (fixed from 6.9rc1)
 
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-3312"
+# CVE-2024-23848 has no known resolution
 
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-3317"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23849"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-33203"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23850"
 
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-33250"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-23851"
 
-# cpe-stable-backport: Backported in 5.15.105
-CVE_CHECK_IGNORE += "CVE-2023-33288"
+# CVE-2024-24855 needs backporting (fixed from 6.5rc2)
 
-# cpe-stable-backport: Backported in 5.15.118
-CVE_CHECK_IGNORE += "CVE-2023-3338"
+# CVE-2024-24857 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-3355"
+# CVE-2024-24858 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.86
-CVE_CHECK_IGNORE += "CVE-2023-3357"
+# CVE-2024-24859 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.91
-CVE_CHECK_IGNORE += "CVE-2023-3358"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-24860"
 
-# fixed-version: only affects 5.18rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-3359"
+# CVE-2024-24861 needs backporting (fixed from 6.9rc1)
 
-# CVE-2023-3389 needs backporting (fixed from 6.0rc1)
+# CVE-2024-24864 has no known resolution
 
-# cpe-stable-backport: Backported in 5.15.118
-CVE_CHECK_IGNORE += "CVE-2023-3390"
+# CVE-2024-25739 has no known resolution
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-33951"
+# CVE-2024-25740 has no known resolution
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-33952"
+# CVE-2024-25741 has no known resolution
 
-# CVE-2023-3397 has no known resolution
+# CVE-2024-25744 needs backporting (fixed from 6.7rc5)
 
-# cpe-stable-backport: Backported in 5.15.117
-CVE_CHECK_IGNORE += "CVE-2023-34255"
+# fixed-version: only affects 6.5rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26581"
 
-# cpe-stable-backport: Backported in 5.15.112
-CVE_CHECK_IGNORE += "CVE-2023-34256"
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26582"
 
-# fixed-version: only affects 6.1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-34319"
+# CVE-2024-26583 needs backporting (fixed from 6.8rc5)
 
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2023-34324"
+# CVE-2024-26584 needs backporting (fixed from 6.8rc5)
 
-# CVE-2023-3439 needs backporting (fixed from 5.18rc5)
+# CVE-2024-26585 needs backporting (fixed from 6.8rc5)
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-35001"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26586"
 
-# cpe-stable-backport: Backported in 5.15.93
-CVE_CHECK_IGNORE += "CVE-2023-3567"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26587"
 
-# CVE-2023-35693 has no known resolution
+# fixed-version: only affects 6.1rc3 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26588"
 
-# cpe-stable-backport: Backported in 5.15.116
-CVE_CHECK_IGNORE += "CVE-2023-35788"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26589"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-35823"
+# fixed-version: only affects 5.16rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26590"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-35824"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26591"
 
-# fixed-version: only affects 5.18rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-35826"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26592"
 
-# cpe-stable-backport: Backported in 5.15.136
-CVE_CHECK_IGNORE += "CVE-2023-35827"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26593"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-35828"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26594"
 
-# cpe-stable-backport: Backported in 5.15.111
-CVE_CHECK_IGNORE += "CVE-2023-35829"
+# CVE-2024-26595 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.118
-CVE_CHECK_IGNORE += "CVE-2023-3609"
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26596"
 
-# cpe-stable-backport: Backported in 5.15.119
-CVE_CHECK_IGNORE += "CVE-2023-3610"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26597"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-3611"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26598"
 
-# CVE-2023-3640 has no known resolution
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26599"
 
-# fixed-version: only affects 6.3rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-37453"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26600"
 
-# CVE-2023-37454 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26601"
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-3772"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26602"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-3773"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26603"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-3776"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26604"
 
-# cpe-stable-backport: Backported in 5.15.123
-CVE_CHECK_IGNORE += "CVE-2023-3777"
+# fixed-version: only affects 6.7 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26605"
 
-# cpe-stable-backport: Backported in 5.15.78
-CVE_CHECK_IGNORE += "CVE-2023-3812"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26606"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-38409"
+# CVE-2024-26607 needs backporting (fixed from 6.8rc2)
 
-# cpe-stable-backport: Backported in 5.15.113
-CVE_CHECK_IGNORE += "CVE-2023-38426"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26608"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-38427"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26610"
 
-# cpe-stable-backport: Backported in 5.15.113
-CVE_CHECK_IGNORE += "CVE-2023-38428"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26611"
 
-# cpe-stable-backport: Backported in 5.15.113
-CVE_CHECK_IGNORE += "CVE-2023-38429"
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26612"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-38430"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26614"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-38431"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26615"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-38432"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26616"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-3863"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26617"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-3865"
+# fixed-version: only affects 6.5rc7 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26618"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-3866"
+# fixed-version: only affects 6.7rc5 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26619"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-3867"
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26620"
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-39189"
+# fixed-version: only affects 6.7 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26621"
 
-# fixed-version: only affects 5.19rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-39191"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26622"
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-39192"
+# CVE-2024-26623 needs backporting (fixed from 6.8rc3)
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-39193"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26625"
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-39194"
+# fixed-version: only affects 6.8rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26626"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-39197"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26627"
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-39198"
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26629"
 
-# cpe-stable-backport: Backported in 5.15.123
-CVE_CHECK_IGNORE += "CVE-2023-4004"
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26630"
 
-# CVE-2023-4010 has no known resolution
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26631"
 
-# cpe-stable-backport: Backported in 5.15.124
-CVE_CHECK_IGNORE += "CVE-2023-4015"
+# fixed-version: only affects 5.17rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26632"
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-40283"
+# cpe-stable-backport: Backported in 5.15.148
+CVE_CHECK_IGNORE += "CVE-2024-26633"
 
-# fixed-version: only affects 6.3rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-40791"
+# fixed-version: only affects 6.6rc7 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26634"
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4128"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26635"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-4132"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26636"
 
-# CVE-2023-4133 needs backporting (fixed from 6.3)
+# fixed-version: only affects 6.7 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26637"
 
-# CVE-2023-4134 needs backporting (fixed from 6.5rc1)
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26638"
 
-# cpe-stable-backport: Backported in 5.15.124
-CVE_CHECK_IGNORE += "CVE-2023-4147"
+# fixed-version: only affects 6.8rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26639"
 
-# CVE-2023-4155 needs backporting (fixed from 6.5rc6)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26640"
 
-# fixed-version: only affects 6.3rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-4194"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26641"
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4206"
+# CVE-2024-26642 needs backporting (fixed from 6.8)
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4207"
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26643"
 
-# cpe-stable-backport: Backported in 5.15.126
-CVE_CHECK_IGNORE += "CVE-2023-4208"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26644"
 
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-4244"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26645"
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-4273"
+# CVE-2024-26646 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-42752"
+# CVE-2024-26647 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-42753"
+# CVE-2024-26648 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-42754"
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26649"
 
-# cpe-stable-backport: Backported in 5.15.133
-CVE_CHECK_IGNORE += "CVE-2023-42755"
+# CVE-2024-26650 needs backporting (fixed from 6.8rc2)
 
-# fixed-version: only affects 6.4rc6 onwards
-CVE_CHECK_IGNORE += "CVE-2023-42756"
+# cpe-stable-backport: Backported in 5.15.153
+CVE_CHECK_IGNORE += "CVE-2024-26651"
 
-# cpe-stable-backport: Backported in 5.15.46
-CVE_CHECK_IGNORE += "CVE-2023-4385"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26652"
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2023-4387"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26653"
 
-# cpe-stable-backport: Backported in 5.15.35
-CVE_CHECK_IGNORE += "CVE-2023-4389"
+# CVE-2024-26654 needs backporting (fixed from 6.9rc2)
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-4394"
+# CVE-2024-26655 needs backporting (fixed from 6.9rc2)
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-44466"
+# CVE-2024-26656 needs backporting (fixed from 6.9rc1)
 
-# cpe-stable-backport: Backported in 5.15.42
-CVE_CHECK_IGNORE += "CVE-2023-4459"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26657"
 
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-4563"
+# CVE-2024-26658 needs backporting (fixed from 6.8rc1)
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-4569"
+# cpe-stable-backport: Backported in 5.15.152
+CVE_CHECK_IGNORE += "CVE-2024-26659"
 
-# cpe-stable-backport: Backported in 5.15.100
-CVE_CHECK_IGNORE += "CVE-2023-45862"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26660"
 
-# cpe-stable-backport: Backported in 5.15.99
-CVE_CHECK_IGNORE += "CVE-2023-45863"
+# CVE-2024-26661 needs backporting (fixed from 6.8rc4)
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-45871"
+# CVE-2024-26662 needs backporting (fixed from 6.8rc4)
 
-# fixed-version: only affects 6.5rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-45898"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26663"
 
-# fixed-version: only affects 6.4rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-4610"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26664"
 
-# fixed-version: only affects 6.4rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-4611"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26665"
 
-# CVE-2023-4622 needs backporting (fixed from 6.5rc1)
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26666"
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-4623"
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26667"
 
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-46343"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26668"
 
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-46813"
+# CVE-2024-26669 needs backporting (fixed from 6.8rc2)
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-46838"
+# fixed-version: only affects 6.6rc5 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26670"
 
-# cpe-stable-backport: Backported in 5.15.140
-CVE_CHECK_IGNORE += "CVE-2023-46862"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26671"
 
-# CVE-2023-47233 has no known resolution
+# CVE-2024-26672 needs backporting (fixed from 6.8rc1)
 
-# fixed-version: Fixed after version 5.14rc1
-CVE_CHECK_IGNORE += "CVE-2023-4732"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26673"
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-4881"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26674"
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-4921"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26675"
 
-# CVE-2023-50431 needs backporting (fixed from 6.8rc1)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26676"
 
-# fixed-version: only affects 6.0rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5090"
+# CVE-2024-26677 needs backporting (fixed from 6.8rc4)
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-51042"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26678"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2023-51043"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26679"
 
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2023-5158"
+# CVE-2024-26680 needs backporting (fixed from 6.8rc4)
 
-# cpe-stable-backport: Backported in 5.15.146
-CVE_CHECK_IGNORE += "CVE-2023-51779"
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26681"
 
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-5178"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26682"
 
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-51780"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26683"
 
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-51781"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26684"
 
-# cpe-stable-backport: Backported in 5.15.144
-CVE_CHECK_IGNORE += "CVE-2023-51782"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26685"
 
-# cpe-stable-backport: Backported in 5.15.134
-CVE_CHECK_IGNORE += "CVE-2023-5197"
+# CVE-2024-26686 needs backporting (fixed from 6.8rc4)
 
-# cpe-stable-backport: Backported in 5.15.147
-CVE_CHECK_IGNORE += "CVE-2023-52340"
+# CVE-2024-26687 needs backporting (fixed from 6.8rc5)
+
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26688"
 
 # cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2023-52429"
+CVE_CHECK_IGNORE += "CVE-2024-26689"
 
-# fixed-version: only affects 6.5rc6 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52433"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26690"
 
-# CVE-2023-52434 needs backporting (fixed from 6.7rc6)
+# CVE-2024-26691 needs backporting (fixed from 6.8rc5)
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2023-52435"
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26692"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52436"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26693"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52438"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26694"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52439"
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26695"
 
-# fixed-version: only affects 5.17rc4 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52440"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26696"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-52441"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26697"
 
-# cpe-stable-backport: Backported in 5.15.145
-CVE_CHECK_IGNORE += "CVE-2023-52442"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26698"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52443"
+# CVE-2024-26699 needs backporting (fixed from 6.8rc5)
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52444"
+# CVE-2024-26700 needs backporting (fixed from 6.8rc4)
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52445"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26702"
 
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52446"
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26703"
 
-# CVE-2023-52447 needs backporting (fixed from 6.8rc1)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26704"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52448"
+# fixed-version: only affects 6.6rc2 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26705"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52449"
+# CVE-2024-26706 needs backporting (fixed from 6.8rc3)
+
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26707"
 
 # fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52450"
+CVE_CHECK_IGNORE += "CVE-2024-26708"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52451"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26709"
 
-# CVE-2023-52452 needs backporting (fixed from 6.8rc1)
+# fixed-version: only affects 6.8rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26710"
 
 # fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52453"
+CVE_CHECK_IGNORE += "CVE-2024-26711"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52454"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26712"
 
-# fixed-version: only affects 6.3rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52455"
+# CVE-2024-26713 needs backporting (fixed from 6.8rc5)
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52456"
+# CVE-2024-26714 needs backporting (fixed from 6.8rc5)
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52457"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26715"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52458"
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26716"
 
-# fixed-version: only affects 6.6rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52459"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26717"
 
-# fixed-version: only affects 6.7rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52460"
+# CVE-2024-26718 needs backporting (fixed from 6.8rc3)
 
-# fixed-version: only affects 6.7rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52461"
+# CVE-2024-26719 needs backporting (fixed from 6.8rc3)
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-52462"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26720"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52463"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26721"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-52464"
+# fixed-version: only affects 6.7rc5 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26722"
 
 # fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5345"
+CVE_CHECK_IGNORE += "CVE-2024-26723"
 
-# fixed-version: only affects 6.2 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5633"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26724"
 
-# cpe-stable-backport: Backported in 5.15.137
-CVE_CHECK_IGNORE += "CVE-2023-5717"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26725"
 
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-5972"
+# CVE-2024-26726 needs backporting (fixed from 6.8rc5)
 
-# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26727"
 
-# cpe-stable-backport: Backported in 5.15.147
-CVE_CHECK_IGNORE += "CVE-2023-6040"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26728"
 
-# fixed-version: only affects 6.6rc3 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6111"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26729"
 
-# cpe-stable-backport: Backported in 5.15.141
-CVE_CHECK_IGNORE += "CVE-2023-6121"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26730"
 
-# cpe-stable-backport: Backported in 5.15.132
-CVE_CHECK_IGNORE += "CVE-2023-6176"
+# fixed-version: only affects 6.4rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26731"
 
-# fixed-version: only affects 6.6rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6200"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26732"
 
-# CVE-2023-6238 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26733"
 
-# CVE-2023-6240 has no known resolution
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26734"
 
-# CVE-2023-6270 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26735"
 
-# CVE-2023-6356 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26736"
 
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6531"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26737"
 
-# CVE-2023-6535 has no known resolution
+# CVE-2024-26738 needs backporting (fixed from 6.8rc6)
 
-# CVE-2023-6536 has no known resolution
+# CVE-2024-26739 needs backporting (fixed from 6.8rc6)
 
-# cpe-stable-backport: Backported in 5.15.128
-CVE_CHECK_IGNORE += "CVE-2023-6546"
+# CVE-2024-26740 needs backporting (fixed from 6.8rc6)
 
-# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26741"
 
-# cpe-stable-backport: Backported in 5.15.146
-CVE_CHECK_IGNORE += "CVE-2023-6606"
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26742"
 
-# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26743"
 
-# cpe-stable-backport: Backported in 5.15.143
-CVE_CHECK_IGNORE += "CVE-2023-6622"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26744"
 
-# fixed-version: only affects 6.7rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2023-6679"
+# CVE-2024-26745 needs backporting (fixed from 6.8rc7)
 
-# cpe-stable-backport: Backported in 5.15.143
-CVE_CHECK_IGNORE += "CVE-2023-6817"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26746"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2023-6915"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26747"
 
-# cpe-stable-backport: Backported in 5.15.143
-CVE_CHECK_IGNORE += "CVE-2023-6931"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26748"
 
-# cpe-stable-backport: Backported in 5.15.142
-CVE_CHECK_IGNORE += "CVE-2023-6932"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26749"
 
-# CVE-2023-7042 has no known resolution
+# fixed-version: only affects 6.8rc5 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26750"
 
-# cpe-stable-backport: Backported in 5.15.100
-CVE_CHECK_IGNORE += "CVE-2023-7192"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26751"
 
-# fixed-version: only affects 6.5rc6 onwards
-CVE_CHECK_IGNORE += "CVE-2024-0193"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26752"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-0340"
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26753"
 
-# fixed-version: only affects 6.2rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-0443"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26754"
 
-# cpe-stable-backport: Backported in 5.15.64
-CVE_CHECK_IGNORE += "CVE-2024-0562"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26755"
 
-# CVE-2024-0564 has no known resolution
+# CVE-2024-26756 needs backporting (fixed from 6.8rc6)
 
-# CVE-2024-0565 needs backporting (fixed from 6.7rc6)
+# CVE-2024-26757 needs backporting (fixed from 6.8rc6)
 
-# fixed-version: only affects 6.4rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-0582"
+# CVE-2024-26758 needs backporting (fixed from 6.8rc6)
 
-# cpe-stable-backport: Backported in 5.15.142
-CVE_CHECK_IGNORE += "CVE-2024-0584"
+# CVE-2024-26759 needs backporting (fixed from 6.8rc6)
 
-# cpe-stable-backport: Backported in 5.15.140
-CVE_CHECK_IGNORE += "CVE-2024-0607"
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26760"
 
-# cpe-stable-backport: Backported in 5.15.121
-CVE_CHECK_IGNORE += "CVE-2024-0639"
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26761"
 
-# cpe-stable-backport: Backported in 5.15.135
-CVE_CHECK_IGNORE += "CVE-2024-0641"
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26762"
 
-# cpe-stable-backport: Backported in 5.15.147
-CVE_CHECK_IGNORE += "CVE-2024-0646"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26763"
 
-# cpe-stable-backport: Backported in 5.15.112
-CVE_CHECK_IGNORE += "CVE-2024-0775"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26764"
 
-# CVE-2024-0841 has no known resolution
+# CVE-2024-26765 needs backporting (fixed from 6.8rc6)
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-1085"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26766"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-1086"
+# CVE-2024-26767 needs backporting (fixed from 6.8rc5)
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-1151"
+# CVE-2024-26768 needs backporting (fixed from 6.8rc4)
 
-# CVE-2024-1312 needs backporting (fixed from 6.5rc4)
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26769"
 
-# CVE-2024-21803 has no known resolution
+# CVE-2024-26770 needs backporting (fixed from 6.8rc3)
 
-# CVE-2024-22099 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26771"
 
-# CVE-2024-22386 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26772"
 
-# cpe-stable-backport: Backported in 5.15.146
-CVE_CHECK_IGNORE += "CVE-2024-22705"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26773"
 
-# CVE-2024-23196 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26774"
 
-# CVE-2024-23307 has no known resolution
+# CVE-2024-26775 needs backporting (fixed from 6.8rc2)
 
-# CVE-2024-23848 has no known resolution
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26776"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-23849"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26777"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-23850"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26778"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-23851"
+# cpe-stable-backport: Backported in 5.15.150
+CVE_CHECK_IGNORE += "CVE-2024-26779"
 
-# CVE-2024-24855 needs backporting (fixed from 6.5rc2)
+# fixed-version: only affects 6.8rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26780"
 
-# CVE-2024-24857 has no known resolution
+# fixed-version: only affects 6.8rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26781"
 
-# CVE-2024-24858 has no known resolution
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26782"
 
-# CVE-2024-24859 has no known resolution
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26783"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-24860"
+# CVE-2024-26784 needs backporting (fixed from 6.8rc7)
 
-# CVE-2024-24861 has no known resolution
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26785"
 
-# CVE-2024-24864 has no known resolution
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26786"
 
-# CVE-2024-25739 has no known resolution
+# cpe-stable-backport: Backported in 5.15.152
+CVE_CHECK_IGNORE += "CVE-2024-26787"
 
-# CVE-2024-25740 has no known resolution
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26788"
 
-# CVE-2024-25741 has no known resolution
+# CVE-2024-26789 needs backporting (fixed from 6.8rc7)
 
-# CVE-2024-25744 needs backporting (fixed from 6.7rc5)
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26790"
 
-# fixed-version: only affects 6.5rc4 onwards
-CVE_CHECK_IGNORE += "CVE-2024-26581"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26791"
 
-# fixed-version: only affects 6.0rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-26582"
+# fixed-version: only affects 6.8rc4 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26792"
 
-# CVE-2024-26583 needs backporting (fixed from 6.8rc5)
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26793"
 
-# CVE-2024-26584 needs backporting (fixed from 6.8rc5)
+# fixed-version: only affects 6.8rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26794"
 
-# CVE-2024-26585 needs backporting (fixed from 6.8rc5)
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26795"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-26586"
+# fixed-version: only affects 6.6rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26796"
 
-# CVE-2024-26587 needs backporting (fixed from 6.8rc1)
+# CVE-2024-26797 needs backporting (fixed from 6.8rc7)
 
-# CVE-2024-26588 needs backporting (fixed from 6.8rc1)
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26798"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-26589"
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26799"
 
-# fixed-version: only affects 5.16rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-26590"
+# fixed-version: only affects 6.8rc5 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26800"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-26591"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26801"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-26592"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26802"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-26593"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26803"
 
-# cpe-stable-backport: Backported in 5.15.149
-CVE_CHECK_IGNORE += "CVE-2024-26594"
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26804"
 
-# CVE-2024-26595 needs backporting (fixed from 6.8rc1)
+# cpe-stable-backport: Backported in 5.15.151
+CVE_CHECK_IGNORE += "CVE-2024-26805"
 
-# fixed-version: only affects 6.1rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-26596"
+# CVE-2024-26806 needs backporting (fixed from 6.8rc7)
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-26597"
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-26807"
 
-# cpe-stable-backport: Backported in 5.15.148
-CVE_CHECK_IGNORE += "CVE-2024-26598"
+# cpe-stable-backport: Backported in 5.15.149
+CVE_CHECK_IGNORE += "CVE-2024-26808"
 
-# fixed-version: only affects 5.17rc1 onwards
-CVE_CHECK_IGNORE += "CVE-2024-26599"
+# cpe-stable-backport: Backported in 5.15.153
+CVE_CHECK_IGNORE += "CVE-2024-26809"
 
-- 
2.39.2


