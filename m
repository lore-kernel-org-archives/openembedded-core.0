Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A004EC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 20:05:31 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.8032.1708113921585486521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 12:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DduC266c;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78722245ebbso97914385a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 12:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708113920; x=1708718720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0t8mUDlzjiuspBJ2K43MoZa/5O9zccSnZ4Zd1tcn4U=;
        b=DduC266crndKqIipG6gYGSIo4IEFHJ1ZJOosUW1onMdH46fqQ7fXp4npnsdlu67l9g
         GDdWYOZ116iW1/JxvPzpyUqvC1vCkSQfmh1Q3g5uCY32mnLMFLLxvuUYNY46XfLPfSoy
         nuOmb51cwSefQ6kdOqggGTBq8ORKZNPijNJvfwMkrENnhOVukyK91mvHgWEmtyVhonVP
         JuwYMhCQAifxQSGNh0fK9Rcrg/IiL7KSjl9gXZl9eWuGNZPOKEUgNgvFVRoLn7fMqOMq
         6r0REgy+nI7RIfWTEli+8fZolVr5VK8F48Plbp99zRN2XIswwVSD03FPf+K7uz2N2r4F
         DMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708113920; x=1708718720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0t8mUDlzjiuspBJ2K43MoZa/5O9zccSnZ4Zd1tcn4U=;
        b=KdaWe4TbaIHmIreNP/RjpsdQ1ef2yTblMhDmzHHTRnyihPIG6FftQ79CHPW8rfuQoS
         zycWDMrVr3Fgx837SQIxFURz/fHqPrFP7omBcSl4ka/dURUQ52Pi7NQBjRcAIKm3F/gI
         WjKZuVsRo4CF07aHONqB4bHEaj+pQL1Dl2rTmImF9i/ogqc/sYzgR9XVgin1pnY2zaw4
         smIMz2KTZLh6Tl8LHtlQu6VkGg8TcPty8iddR1hcz8b1+BnpSZkO84ogby2zT+eoMCaJ
         rPJxuBbUJ2pScGDfZSfRAqua2YgRz2NRhPKYn+7rRXBpZ+pg3dQO1YVgKj+n/eQt10F2
         Nyig==
X-Gm-Message-State: AOJu0YxGqRZQapyyrOrCfKTstKMt/frXdkIo1w8h1BjyrIyxsXGWnzMn
	GJWNn8CchJ1Nur05XUqrxTxvgXClh3Yp+qOQgX8lgVPb+hTQuecn
X-Google-Smtp-Source: AGHT+IFNP4NTe42rIEvXiwmNrpTyp+BRhoS2jTGkV808qmo0MelTjsAZ7LbJEx+SuW4XY+VXYYpPrA==
X-Received: by 2002:a05:620a:1463:b0:787:3820:905 with SMTP id j3-20020a05620a146300b0078738200905mr4978012qkl.8.1708113920435;
        Fri, 16 Feb 2024 12:05:20 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id vu21-20020a05620a561500b007872e92ff64sm246046qkn.63.2024.02.16.12.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 12:05:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/6.6: update CVE exclusions
Date: Fri, 16 Feb 2024 15:05:15 -0500
Message-Id: <ee5018a567623eadccf200d22f9dd510ea30261d.1708113821.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708113821.git.bruce.ashfield@gmail.com>
References: <cover.1708113821.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195804

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 9Feb24
        Date: Fri, 9 Feb 2024 18:02:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.6.inc               | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index f3b3f32736..501e9541d4 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-04 13:08:50.287438+00:00 for version 6.6.15
+# Generated at 2024-02-14 17:05:05.638255+00:00 for version 6.6.16
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.15"
+    this_version = "6.6.16"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5166,6 +5166,8 @@ CVE_STATUS[CVE-2023-6200] = "cpe-stable-backport: Backported in 6.6.9"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6240 has no known resolution
+
 # CVE-2023-6270 has no known resolution
 
 # CVE-2023-6356 has no known resolution
@@ -5232,19 +5234,39 @@ CVE_STATUS[CVE-2024-1085] = "cpe-stable-backport: Backported in 6.6.14"
 
 CVE_STATUS[CVE-2024-1086] = "cpe-stable-backport: Backported in 6.6.15"
 
+CVE_STATUS[CVE-2024-1312] = "fixed-version: Fixed from version 6.5rc4"
+
 # CVE-2024-21803 has no known resolution
 
 # CVE-2024-22099 has no known resolution
 
+# CVE-2024-22386 has no known resolution
+
 CVE_STATUS[CVE-2024-22705] = "cpe-stable-backport: Backported in 6.6.10"
 
+# CVE-2024-23196 has no known resolution
+
 # CVE-2024-23307 has no known resolution
 
 # CVE-2024-23848 has no known resolution
 
-# CVE-2024-23849 has no known resolution
+CVE_STATUS[CVE-2024-23849] = "cpe-stable-backport: Backported in 6.6.15"
 
 # CVE-2024-23850 has no known resolution
 
 # CVE-2024-23851 has no known resolution
 
+# CVE-2024-24855 has no known resolution
+
+# CVE-2024-24857 has no known resolution
+
+# CVE-2024-24858 has no known resolution
+
+# CVE-2024-24859 has no known resolution
+
+# CVE-2024-24860 has no known resolution
+
+# CVE-2024-24861 has no known resolution
+
+# CVE-2024-24864 has no known resolution
+
-- 
2.39.2


