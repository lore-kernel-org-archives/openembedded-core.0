Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144DFC5478C
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:45:14 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.4628.1708483511172386606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ggjMK1tp;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7877dd9cb40so72613585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483510; x=1709088310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7jMElEWjsS8g/MlW1Tdd1zPkpsJfA1agQt6dK0Dx20=;
        b=ggjMK1tpj7hQk8VXqpIiF2bU49ADPQCFah4WNGL/LTpnTpp0BL+PX07ghwciEb3uMq
         V2Xs+xBDSv+c7ZsXz4APFaksKvmCv5xz5pnNwfdeeX+VbmEqC/+w03dyFoGZl639d2ze
         vaEz352XpfxwOu+nFRRkjHbY43Dsd3inhbKr7vbDAXEAeLcYv1O7a+EwfYSohvFGq8nW
         Dg8ojtMUFdMPUsnXrpB/dswt2sUWq3p1A8PuL88BdAKZBvF5vQnvR/0rbGeGVYWhJSKZ
         YPhtzTZT2+Wlkiy95oWjOFmQeD9MVtxa5xazZpoXdIA3Yf6RbATTQMB8bj7EhsqRCUi/
         iokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483510; x=1709088310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7jMElEWjsS8g/MlW1Tdd1zPkpsJfA1agQt6dK0Dx20=;
        b=pPwIWuTCnu0+/PQamwv2wEJgeVVMRZ45w+DuL7ooVTKN9s6QLUVOJmurxyLuRNlp6T
         t1h43uU2n0X6/9gywY0UycRJI19XzfCX7QEBFOUVocTzQhSQPZJ4Qi36MwxZPg41MuZw
         C/ErSYOzvIY/1fTw1xVPoId94wy/hrkN0DNICdByS0hUMFbHdj8gv9jqCivXfi58wLbg
         6KrieBm9P7exfgDD8kTgnFG6mLk5cnM5XdYk5UzIvAlAb0ZKgPnvxQfuqN84kSq7FgIc
         8RmNI8UDTg7EwIkQwLsqHBvQ2V5+9GSalj4afD8iDkRES+eN42q1cr4oXsd8J3mmTxpB
         5SZw==
X-Gm-Message-State: AOJu0Yw6C4rQSKZTEej04wdjUjxCAjJuAguXJImsxrBiCuatn8JaIx7D
	P4AHMjqXp2KqUyf5HLqek0xjVAktClHuF6ZqsPVA/Hn+n2lUfnn3vumdHuqB
X-Google-Smtp-Source: AGHT+IHZeXN7Pz1M40qz7qVARxhCQIoYUE/1BTiTuTpX8709Thay8ISKtrDgzuOjB/3rU2pp/g1PFg==
X-Received: by 2002:a05:620a:2451:b0:787:1cfc:7379 with SMTP id h17-20020a05620a245100b007871cfc7379mr23533088qkn.32.1708483510090;
        Tue, 20 Feb 2024 18:45:10 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id wa23-20020a05620a4d1700b0078742e741cfsm3945398qkn.61.2024.02.20.18.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:45:09 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] linux-yocto/5.15: update CVE exclusions
Date: Tue, 20 Feb 2024 21:44:54 -0500
Message-Id: <20240221024500.3239062-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
References: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195944

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 27Dec23
        Date: Wed, 27 Dec 2023 19:47:13 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_5.15.inc              | 259 +++++++++++++++---
 1 file changed, 223 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 7822040782..84d0becb8d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-23 10:40:51.641475 for version 5.15.124
+# Generated at 2024-01-11 21:16:55.956074 for version 5.15.146
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.124"
+    this_version = "5.15.146"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4839,7 +4839,8 @@ CVE_CHECK_IGNORE += "CVE-2020-27194"
 # fixed-version: Fixed after version 5.6rc4
 CVE_CHECK_IGNORE += "CVE-2020-2732"
 
-# CVE-2020-27418 has no known resolution
+# fixed-version: Fixed after version 5.6rc5
+CVE_CHECK_IGNORE += "CVE-2020-27418"
 
 # fixed-version: Fixed after version 5.10rc1
 CVE_CHECK_IGNORE += "CVE-2020-27673"
@@ -4981,6 +4982,9 @@ CVE_CHECK_IGNORE += "CVE-2020-36691"
 # fixed-version: Fixed after version 5.10
 CVE_CHECK_IGNORE += "CVE-2020-36694"
 
+# fixed-version: Fixed after version 5.9rc1
+CVE_CHECK_IGNORE += "CVE-2020-36766"
+
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE += "CVE-2020-3702"
 
@@ -6450,7 +6454,8 @@ CVE_CHECK_IGNORE += "CVE-2022-40768"
 # cpe-stable-backport: Backported in 5.15.66
 CVE_CHECK_IGNORE += "CVE-2022-4095"
 
-# CVE-2022-40982 needs backporting (fixed from 5.15.125)
+# cpe-stable-backport: Backported in 5.15.125
+CVE_CHECK_IGNORE += "CVE-2022-40982"
 
 # cpe-stable-backport: Backported in 5.15.87
 CVE_CHECK_IGNORE += "CVE-2022-41218"
@@ -6536,7 +6541,7 @@ CVE_CHECK_IGNORE += "CVE-2022-43945"
 
 # CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44034 has no known resolution
+# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
 
 # CVE-2022-4543 has no known resolution
 
@@ -6591,7 +6596,8 @@ CVE_CHECK_IGNORE += "CVE-2022-47938"
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2022-47939"
 
-# CVE-2022-47940 needs backporting (fixed from 5.19rc1)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2022-47940"
 
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2022-47941"
@@ -6708,9 +6714,11 @@ CVE_CHECK_IGNORE += "CVE-2023-1118"
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-1192"
 
-# CVE-2023-1193 has no known resolution
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-1193"
 
-# CVE-2023-1194 has no known resolution
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-1194"
 
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-1195"
@@ -6797,9 +6805,11 @@ CVE_CHECK_IGNORE += "CVE-2023-2008"
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2023-2019"
 
-# CVE-2023-20569 needs backporting (fixed from 5.15.125)
+# cpe-stable-backport: Backported in 5.15.125
+CVE_CHECK_IGNORE += "CVE-2023-20569"
 
-# CVE-2023-20588 needs backporting (fixed from 5.15.126)
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-20588"
 
 # cpe-stable-backport: Backported in 5.15.122
 CVE_CHECK_IGNORE += "CVE-2023-20593"
@@ -6922,7 +6932,8 @@ CVE_CHECK_IGNORE += "CVE-2023-25012"
 # cpe-stable-backport: Backported in 5.15.61
 CVE_CHECK_IGNORE += "CVE-2023-2513"
 
-# CVE-2023-25775 needs backporting (fixed from 6.6rc1)
+# cpe-stable-backport: Backported in 5.15.144
+CVE_CHECK_IGNORE += "CVE-2023-25775"
 
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-2598"
@@ -7003,7 +7014,8 @@ CVE_CHECK_IGNORE += "CVE-2023-3106"
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
-# CVE-2023-31085 has no known resolution
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-31085"
 
 # cpe-stable-backport: Backported in 5.15.63
 CVE_CHECK_IGNORE += "CVE-2023-3111"
@@ -7035,20 +7047,26 @@ CVE_CHECK_IGNORE += "CVE-2023-3220"
 # cpe-stable-backport: Backported in 5.15.111
 CVE_CHECK_IGNORE += "CVE-2023-32233"
 
-# CVE-2023-32247 needs backporting (fixed from 6.4rc1)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32247"
 
 # cpe-stable-backport: Backported in 5.15.111
 CVE_CHECK_IGNORE += "CVE-2023-32248"
 
-# CVE-2023-32250 needs backporting (fixed from 6.4rc1)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32250"
 
-# CVE-2023-32252 needs backporting (fixed from 6.4rc1)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32252"
 
-# CVE-2023-32254 needs backporting (fixed from 6.4rc1)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32254"
 
-# CVE-2023-32257 needs backporting (fixed from 6.4rc1)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32257"
 
-# CVE-2023-32258 needs backporting (fixed from 6.4rc1)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-32258"
 
 # cpe-stable-backport: Backported in 5.15.93
 CVE_CHECK_IGNORE += "CVE-2023-32269"
@@ -7113,6 +7131,9 @@ CVE_CHECK_IGNORE += "CVE-2023-34256"
 # fixed-version: only affects 6.1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-34319"
 
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-34324"
+
 # CVE-2023-3439 needs backporting (fixed from 5.18rc5)
 
 # cpe-stable-backport: Backported in 5.15.121
@@ -7135,7 +7156,8 @@ CVE_CHECK_IGNORE += "CVE-2023-35824"
 # fixed-version: only affects 5.18rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-35826"
 
-# CVE-2023-35827 has no known resolution
+# cpe-stable-backport: Backported in 5.15.136
+CVE_CHECK_IGNORE += "CVE-2023-35827"
 
 # cpe-stable-backport: Backported in 5.15.111
 CVE_CHECK_IGNORE += "CVE-2023-35828"
@@ -7159,7 +7181,8 @@ CVE_CHECK_IGNORE += "CVE-2023-37453"
 
 # CVE-2023-37454 has no known resolution
 
-# CVE-2023-3772 needs backporting (fixed from 5.15.128)
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-3772"
 
 # fixed-version: only affects 5.17rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-3773"
@@ -7179,7 +7202,8 @@ CVE_CHECK_IGNORE += "CVE-2023-38409"
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-38426"
 
-# CVE-2023-38427 needs backporting (fixed from 6.4rc6)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-38427"
 
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-38428"
@@ -7187,9 +7211,11 @@ CVE_CHECK_IGNORE += "CVE-2023-38428"
 # cpe-stable-backport: Backported in 5.15.113
 CVE_CHECK_IGNORE += "CVE-2023-38429"
 
-# CVE-2023-38430 needs backporting (fixed from 6.4rc6)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-38430"
 
-# CVE-2023-38431 needs backporting (fixed from 6.4rc6)
+# cpe-stable-backport: Backported in 5.15.145
+CVE_CHECK_IGNORE += "CVE-2023-38431"
 
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2023-38432"
@@ -7203,7 +7229,29 @@ CVE_CHECK_IGNORE += "CVE-2023-3865"
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2023-3866"
 
-# CVE-2023-3867 needs backporting (fixed from 6.5rc1)
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
 
 # cpe-stable-backport: Backported in 5.15.123
 CVE_CHECK_IGNORE += "CVE-2023-4004"
@@ -7213,9 +7261,14 @@ CVE_CHECK_IGNORE += "CVE-2023-4004"
 # cpe-stable-backport: Backported in 5.15.124
 CVE_CHECK_IGNORE += "CVE-2023-4015"
 
-# CVE-2023-40283 needs backporting (fixed from 5.15.126)
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-40283"
 
-# CVE-2023-4128 needs backporting (fixed from 5.15.126)
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-40791"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4128"
 
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2023-4132"
@@ -7232,15 +7285,35 @@ CVE_CHECK_IGNORE += "CVE-2023-4147"
 # fixed-version: only affects 6.3rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4194"
 
-# CVE-2023-4206 needs backporting (fixed from 5.15.126)
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4206"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4207"
+
+# cpe-stable-backport: Backported in 5.15.126
+CVE_CHECK_IGNORE += "CVE-2023-4208"
 
-# CVE-2023-4207 needs backporting (fixed from 5.15.126)
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-4244"
 
-# CVE-2023-4208 needs backporting (fixed from 5.15.126)
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-4273"
 
-# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-42752"
 
-# CVE-2023-4273 needs backporting (fixed from 5.15.128)
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
 
 # cpe-stable-backport: Backported in 5.15.46
 CVE_CHECK_IGNORE += "CVE-2023-4385"
@@ -7254,21 +7327,135 @@ CVE_CHECK_IGNORE += "CVE-2023-4389"
 # fixed-version: only affects 5.16rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4394"
 
+# cpe-stable-backport: Backported in 5.15.121
+CVE_CHECK_IGNORE += "CVE-2023-44466"
+
 # cpe-stable-backport: Backported in 5.15.42
 CVE_CHECK_IGNORE += "CVE-2023-4459"
 
-# CVE-2023-4563 needs backporting (fixed from 6.5rc6)
+# cpe-stable-backport: Backported in 5.15.134
+CVE_CHECK_IGNORE += "CVE-2023-4563"
 
-# CVE-2023-4569 needs backporting (fixed from 5.15.128)
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
+# CVE-2023-4610 needs backporting (fixed from 6.4)
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
 
 # CVE-2023-4622 needs backporting (fixed from 6.5rc1)
 
-# CVE-2023-4623 needs backporting (fixed from 6.6rc1)
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-4623"
+
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-46813"
+
+# cpe-stable-backport: Backported in 5.15.140
+CVE_CHECK_IGNORE += "CVE-2023-46862"
+
+# CVE-2023-47233 has no known resolution
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
+# CVE-2023-50431 has no known resolution
+
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5090"
+
+# cpe-stable-backport: Backported in 5.15.135
+CVE_CHECK_IGNORE += "CVE-2023-5158"
+
+# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
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
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5345"
+
+# fixed-version: only affects 6.2 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5633"
+
+# cpe-stable-backport: Backported in 5.15.137
+CVE_CHECK_IGNORE += "CVE-2023-5717"
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-5972"
+
+# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+
+# fixed-version: only affects 6.6rc3 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6111"
+
+# cpe-stable-backport: Backported in 5.15.141
+CVE_CHECK_IGNORE += "CVE-2023-6121"
+
+# cpe-stable-backport: Backported in 5.15.132
+CVE_CHECK_IGNORE += "CVE-2023-6176"
+
+# CVE-2023-6238 has no known resolution
+
+# CVE-2023-6356 has no known resolution
+
+# CVE-2023-6535 has no known resolution
+
+# CVE-2023-6536 has no known resolution
+
+# cpe-stable-backport: Backported in 5.15.128
+CVE_CHECK_IGNORE += "CVE-2023-6546"
+
+# CVE-2023-6560 needs backporting (fixed from 6.7rc4)
+
+# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
+
+# CVE-2023-6610 needs backporting (fixed from 6.7rc7)
+
+# cpe-stable-backport: Backported in 5.15.143
+CVE_CHECK_IGNORE += "CVE-2023-6622"
+
+# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
+
+# cpe-stable-backport: Backported in 5.15.143
+CVE_CHECK_IGNORE += "CVE-2023-6817"
+
+# cpe-stable-backport: Backported in 5.15.143
+CVE_CHECK_IGNORE += "CVE-2023-6931"
 
-# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
+# cpe-stable-backport: Backported in 5.15.142
+CVE_CHECK_IGNORE += "CVE-2023-6932"
 
-# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
+# CVE-2023-7042 has no known resolution
 
-- 
2.39.2


