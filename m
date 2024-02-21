Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B61DC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:45:24 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.4632.1708483514180954883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3QEom9p;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78772fc9ceaso114738385a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708483513; x=1709088313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKgHOt2OBpk7oiIbsNlPWlvrEFylUZYqeuleHsd64oY=;
        b=e3QEom9p6x47ELfPtZU/l42XzpYVmRF7uqDJTzaxyuTw6Uvy54VObO8WAMU4EXkJep
         Cua+5H2fDMAAg3UtPiq8sqC5YycrXaRIdovNjuYX3dE+UVwYwgQQfhShkhZtBGowEvwL
         wackoJN/WLNcrqkx4folrUKkUnD1zn/Ur+llB8G7qnaI+ITutLkLd83r08ynZW46mYpO
         lsFxmB4VSOrSqDcp3/bCaF2SD1Ey/PyLH/dkKYoMq09SCszIbPgvRSFW5kfJOyjhBnKx
         8U2v6j67gUZkvpHVaT2XHZGDIwzAFn/nY8Vqnc35HdfnEJ1NFuxKsgicV0Ak1foMhbOi
         xxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708483513; x=1709088313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKgHOt2OBpk7oiIbsNlPWlvrEFylUZYqeuleHsd64oY=;
        b=NUB2DqYUpSe7oQetFzfeZQ0u7kS0Rez7f8bEdxODOoVEpKoQtke+IyjP+qcLcBzbAM
         IzijnRtPVRYB17KEPsUTBjOtjsPlljh1i2vxjCzsoxNIa5dcxIazYb/4zKYSQXau3pxF
         DcNapFDYiFnbY0+hsE0o9pmDMeGJ6D5KNNHEaugaDsNTE16bg0tRKfAXbVYuQjO3p+Fq
         92ztOBUi6MwZr97mA2sMBV+gTFqdG3eCzEaZ3fV4fF4eDZqMH/oT6DX9JuR6jMuqosC6
         tl3h0e8OQ2UgnmEfIReaoHNwi2XW5s/UsDy4BWESbjLN/ZZuh+ghuZrTHbSQGbaHOdSJ
         mTbQ==
X-Gm-Message-State: AOJu0Yz5Fxv51PRKIL9rLhsNJSFGSpFeTXGS/7xYAsTdsidfcWKniaPG
	pqoEdi9ZlQ+wqUoxUe1csvttbUybR6vArtgdzb1z7jpWdqyC9wv8
X-Google-Smtp-Source: AGHT+IHeokXijsOJVX+z59JHcl4Gma5/HPQSSfs2niYzUP0wdkekad9mVbegCmRKI6AhHx0ltqoScQ==
X-Received: by 2002:a05:620a:2804:b0:787:8545:80c2 with SMTP id f4-20020a05620a280400b00787854580c2mr612822qkp.69.1708483513080;
        Tue, 20 Feb 2024 18:45:13 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id wa23-20020a05620a4d1700b0078742e741cfsm3945398qkn.61.2024.02.20.18.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:45:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] linux-yocto/5.15: update CVE exclusions
Date: Tue, 20 Feb 2024 21:44:57 -0500
Message-Id: <20240221024500.3239062-10-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
References: <20240221024500.3239062-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195947

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 15Jan24
        Date: Mon, 15 Jan 2024 12:48:45 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_5.15.inc              | 44 ++++++++++++++++---
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index 84d0becb8d..0d54b414d9 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-11 21:16:55.956074 for version 5.15.146
+# Generated at 2024-01-18 18:47:24.084935 for version 5.15.147
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.146"
+    this_version = "5.15.147"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -6626,6 +6626,9 @@ CVE_CHECK_IGNORE += "CVE-2022-48425"
 # cpe-stable-backport: Backported in 5.15.121
 CVE_CHECK_IGNORE += "CVE-2022-48502"
 
+# cpe-stable-backport: Backported in 5.15.42
+CVE_CHECK_IGNORE += "CVE-2022-48619"
+
 # fixed-version: Fixed after version 5.0rc1
 CVE_CHECK_IGNORE += "CVE-2023-0030"
 
@@ -6747,6 +6750,8 @@ CVE_CHECK_IGNORE += "CVE-2023-1382"
 # fixed-version: Fixed after version 5.11rc4
 CVE_CHECK_IGNORE += "CVE-2023-1390"
 
+# CVE-2023-1476 has no known resolution
+
 # cpe-stable-backport: Backported in 5.15.95
 CVE_CHECK_IGNORE += "CVE-2023-1513"
 
@@ -6921,7 +6926,8 @@ CVE_CHECK_IGNORE += "CVE-2023-23559"
 # fixed-version: Fixed after version 5.12rc1
 CVE_CHECK_IGNORE += "CVE-2023-23586"
 
-# CVE-2023-2430 needs backporting (fixed from 6.2rc5)
+# fixed-version: only affects 5.18rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-2430"
 
 # cpe-stable-backport: Backported in 5.15.105
 CVE_CHECK_IGNORE += "CVE-2023-2483"
@@ -7351,7 +7357,8 @@ CVE_CHECK_IGNORE += "CVE-2023-45871"
 # fixed-version: only affects 6.5rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-45898"
 
-# CVE-2023-4610 needs backporting (fixed from 6.4)
+# fixed-version: only affects 6.4rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-4610"
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_IGNORE += "CVE-2023-4611"
@@ -7386,7 +7393,8 @@ CVE_CHECK_IGNORE += "CVE-2023-5090"
 # cpe-stable-backport: Backported in 5.15.135
 CVE_CHECK_IGNORE += "CVE-2023-5158"
 
-# CVE-2023-51779 needs backporting (fixed from 6.7rc7)
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2023-51779"
 
 # cpe-stable-backport: Backported in 5.15.137
 CVE_CHECK_IGNORE += "CVE-2023-5178"
@@ -7417,6 +7425,8 @@ CVE_CHECK_IGNORE += "CVE-2023-5972"
 
 # CVE-2023-6039 needs backporting (fixed from 6.5rc5)
 
+# CVE-2023-6040 needs backporting (fixed from 5.18rc1)
+
 # fixed-version: only affects 6.6rc3 onwards
 CVE_CHECK_IGNORE += "CVE-2023-6111"
 
@@ -7428,8 +7438,13 @@ CVE_CHECK_IGNORE += "CVE-2023-6176"
 
 # CVE-2023-6238 has no known resolution
 
+# CVE-2023-6270 has no known resolution
+
 # CVE-2023-6356 has no known resolution
 
+# fixed-version: only affects 6.1rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6531"
+
 # CVE-2023-6535 has no known resolution
 
 # CVE-2023-6536 has no known resolution
@@ -7439,14 +7454,16 @@ CVE_CHECK_IGNORE += "CVE-2023-6546"
 
 # CVE-2023-6560 needs backporting (fixed from 6.7rc4)
 
-# CVE-2023-6606 needs backporting (fixed from 6.7rc7)
+# cpe-stable-backport: Backported in 5.15.146
+CVE_CHECK_IGNORE += "CVE-2023-6606"
 
 # CVE-2023-6610 needs backporting (fixed from 6.7rc7)
 
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6622"
 
-# CVE-2023-6679 needs backporting (fixed from 6.7rc6)
+# fixed-version: only affects 6.7rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2023-6679"
 
 # cpe-stable-backport: Backported in 5.15.143
 CVE_CHECK_IGNORE += "CVE-2023-6817"
@@ -7459,3 +7476,16 @@ CVE_CHECK_IGNORE += "CVE-2023-6932"
 
 # CVE-2023-7042 has no known resolution
 
+# cpe-stable-backport: Backported in 5.15.100
+CVE_CHECK_IGNORE += "CVE-2023-7192"
+
+# fixed-version: only affects 6.5rc6 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0193"
+
+# CVE-2024-0340 needs backporting (fixed from 6.4rc6)
+
+# fixed-version: only affects 6.2rc1 onwards
+CVE_CHECK_IGNORE += "CVE-2024-0443"
+
+# Skipping dd=CVE-2023-1476, no affected_versions
+
-- 
2.39.2


