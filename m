Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B27C433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 17:18:18 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.12134.1653412693982996969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gBOaFeFN;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id f9so36783834ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 10:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mfc7aeq/Cv9AeG6dOioAutMA/XVksFrQBv28PNDCdqg=;
        b=gBOaFeFN5+AMRl98QPDT4LBINkeAVU85wxzcvoT6xlQNh+hAz25jAI7J6EvNkbJjrh
         L9kojaBArVx3uOBMnJ+TmziPrp8lIgHpbYt0e7pmWlgfxUgfVN0XAtKCM4w5LYcTFlnC
         Dzpnn6uiQjJPo2DYQZvsUoTB0cKQFhhYXFMBn4NJ/5nlu1vIkmjyYqu69rEKJz0/mJ2I
         XKrwIZ2N9BDcrPMDHe0yLoNkyCxseH74e7+jedg/Lwzg5pIKg+FteMzmDBLGOPbOFcNB
         kDmY2j6FUvTY0Yxqiz4uFM+NksLQmIn49mDaaSyfKGP2pfLu0x2HH1gOpwNKxFnbrar/
         RUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mfc7aeq/Cv9AeG6dOioAutMA/XVksFrQBv28PNDCdqg=;
        b=HaTeDIWFQpKnnSWlRpUacdGo0u9xsm4ivdBZmsQBRNqEA2RlWogE9P/NXqPSNs0ToD
         WmqqYtkNiyuvOlwOM0UDnv5z/+ZAjM3m6+x4MUou77wXs7H9LXEhblifvZ6RhYDe2/P6
         yH+LPabWBrc4h+4esR3d9J9qCsPSXRdTSwEManUr3HdUPuOJ+8SOy9XRLLVI0YWBLn/e
         KrGxmrCu6htpkNE82gTAiqWMvIDMlN5ZvPJ0xmOOby8ArfAYWzY9a+WV2B9HAYsGibN7
         pz7CvAj7Y4wWXcE5UpwK08ts34Y+nNZH3SDame8LAWZkPbkFkFBMHZTp0fLGqjJxOoao
         9AlA==
X-Gm-Message-State: AOAM5329ZjoEsxlfykQJugaF4+olTokWZ6KrZQdUj8gGFLIX6YprwGu1
	y/epTzy2ievpem60R0F0hdUxv5PXv4Y=
X-Google-Smtp-Source: 
 ABdhPJwdStYgam9eJXj4/tf0WV1IvOi9VwKpVsLhIFS2RlEAM0cZHcCBA0zHdfIfRqNVq5+O0o4eag==
X-Received: by 2002:a17:906:6bd3:b0:6fe:8c20:f218 with SMTP id
 t19-20020a1709066bd300b006fe8c20f218mr25360916ejs.32.1653412692363;
        Tue, 24 May 2022 10:18:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a056402164700b0042617ba63b3sm9775578edx.61.2022.05.24.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 10:18:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] zip/unzip: mark all submittable patches as
 Inactive-Upstream
Date: Tue, 24 May 2022 19:18:05 +0200
Message-Id: <20220524171807.4029924-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 17:18:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166082

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch  | 2 +-
 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch           | 2 +-
 meta/recipes-extended/unzip/unzip/avoid-strip.patch             | 2 +-
 meta/recipes-extended/unzip/unzip/define-ldflags.patch          | 2 +-
 meta/recipes-extended/unzip/unzip/fix-security-format.patch     | 2 +-
 meta/recipes-extended/unzip/unzip/symlink.patch                 | 2 +-
 ...1-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch | 2 +-
 meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch    | 2 +-
 meta/recipes-extended/zip/zip-3.0/fix-security-format.patch     | 2 +-
 .../zip/zip-3.0/zipnote-crashes-with-segfault.patch             | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch b/meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch
index 716766de29..5a6d1946f6 100644
--- a/meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch
+++ b/meta/recipes-extended/unzip/unzip/0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] configure: Pass LDFLAGS to tests doing link step
 Ensures that right flags from recipes are honored, otherwise tests fail
 which otherwise should not.
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  unix/configure | 28 ++++++++++++++--------------
diff --git a/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
index 6ba2b879a3..c0103444fc 100644
--- a/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
+++ b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
@@ -20,7 +20,7 @@ Regenerated to apply without offsets.
 
 CVE: CVE-2021-4217
 
-Upstream-Status: Pending [infozip upstream inactive]
+Upstream-Status: Inactive-Upstream [infozip upstream inactive]
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/avoid-strip.patch b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
index e0c89d81b7..70bedc8381 100644
--- a/meta/recipes-extended/unzip/unzip/avoid-strip.patch
+++ b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Inappropriate [need a new release]
+Upstream-Status: Inactive-Upstream [need a new release]
 
 unix/Makefile: remove hard coded strip commands
 
diff --git a/meta/recipes-extended/unzip/unzip/define-ldflags.patch b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
index dc554c32cb..dd01c01400 100644
--- a/meta/recipes-extended/unzip/unzip/define-ldflags.patch
+++ b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
@@ -1,6 +1,6 @@
 Pass LDFLAGS to the linker 
 
-Upstream-Status: Inappropriate [need a new release]
+Upstream-Status: Inactive-Upstream [need a new release]
 
 Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/fix-security-format.patch b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
index ba6ead3b5e..2889c652d4 100644
--- a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
+++ b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
@@ -5,7 +5,7 @@ Fix security formatting issues related to sprintf parameters expeted.
 [YOCTO #9551]
 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=9551]
 
-Upstream-Status: Inappropriate [need a new release]
+Upstream-Status: Inactive-Upstream [need a new release]
 
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 
diff --git a/meta/recipes-extended/unzip/unzip/symlink.patch b/meta/recipes-extended/unzip/unzip/symlink.patch
index c1d82ac187..26f1c8ba86 100644
--- a/meta/recipes-extended/unzip/unzip/symlink.patch
+++ b/meta/recipes-extended/unzip/unzip/symlink.patch
@@ -6,7 +6,7 @@ a symlink entry."
 
 This patch is taken from Fedora (https://bugzilla.redhat.com/show_bug.cgi?id=972427)
 
-Upstream-Status: Inappropriate [need a new release]
+Upstream-Status: Inactive-Upstream [need a new release]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 --- unzip60/process.c.sav	2013-06-09 12:08:57.070392264 +0200
diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch
index 475a653f28..92d0d5db58 100644
--- a/meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch
@@ -8,7 +8,7 @@ linking, link fails otherwise without them, which can result in
 configure detection go wrong, ensure these flags are used along with CC
 when tests involve linking
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  unix/configure | 16 ++++++++--------
diff --git a/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch b/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch
index 244ddea363..6fd04df1c6 100644
--- a/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch
+++ b/meta/recipes-extended/zip/zip-3.0/10-remove-build-date.patch
@@ -2,7 +2,7 @@ From: Santiago Vila <sanvila@debian.org>
 Subject: Remove (optional) build date to make the build reproducible
 Bug-Debian: http://bugs.debian.org/779042
 
-Upstream-Status: Inappropriate [no upstream]
+Upstream-Status: Inactive-Upstream [no upstream]
 
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 
diff --git a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
index 5cdbf22a54..f85fddbc60 100644
--- a/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
+++ b/meta/recipes-extended/zip/zip-3.0/fix-security-format.patch
@@ -14,7 +14,7 @@ zip.c:1228:5: error: format not a string literal and no format arguments [-Werro
 [YOCTO #9552]
 [https://bugzilla.yoctoproject.org/show_bug.cgi?id=9552]
 
-Upstream-Status: Inappropriate [need a new release]
+Upstream-Status: Inactive-Upstream [need a new release]
 
 Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 
diff --git a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
index ce6caff83e..77ade40a04 100644
--- a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
+++ b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
@@ -4,7 +4,7 @@ https://bugs.archlinux.org/task/47713
 
 Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
 
-Upstream-Status: Inappropriate [no upstream]
+Upstream-Status: Inactive-Upstream [no upstream]
 
 diff --git a/zipnote.c b/zipnote.c
 index 5e02cb6..996f012 100644
-- 
2.30.2


