Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B08C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:25 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.32828.1654526361992553412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5rg2yV2l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id b135so12840151pfb.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8gEhcDKBi36NT0fBZdHq0n7gDX670fTT/RA3lPrUw10=;
        b=5rg2yV2lEK9YLhr+T3qXV7SXlZ6SaOL+Vvfndxt/FR2iK0lvZ/qVaRNyeiefmHRgoa
         LWm0/CBbvAxwai7EabiJ072GIV8N9tKSyX275GnK7/+5yfeB8mG/2pM7UY5ohLdtlWIP
         XEotfQEuCSHQGt5WTul+6gbdwnEKySNTLZJdOfvLizV/i2o4M8wiNdWKnmv/2SJgRj2M
         nevLSPXORoxKbw6cQTFPLfEIFIm761H7y4FN9I8v7yIRbKE9bq27ZzeTUMpfZIjgol06
         4Y9+6vNHzJsFfK4T61FMM4Ne+aZidny2Ag/llxVkGVuPc5kTRQYWXrn7w56n5alY8b/5
         NxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8gEhcDKBi36NT0fBZdHq0n7gDX670fTT/RA3lPrUw10=;
        b=XZakqnxo+c9lQ3MZSipGgu5bS+jGub6x0TW9SzKVyljUtr9P0yUqQ3Qy/TzXvZHOkU
         DqrkN95f36xzioChtHkOmhMpH2eUD4mv6Krm6Kf7riURLEozyU5mBBO1HmbD9swjFobS
         EcfqTaHyzxYSy0AfKrzmP7L6poD4Fj2R+gAugiDtIh/sdyXQXHewF4oLPANe54h03NOA
         XChrZLB1aJyScmZ24AHCUJ8l9rh16nppBLAWOkl2IZeB38XNKOWvzQDKPd3eypSZDmKu
         CdMqjpuUpSU2bmm3cpgVx4SFE10EBJPNIo2cQqj0nl8YWKSdaIXb/w6J01ScQLvXBQDx
         UbEg==
X-Gm-Message-State: AOAM533fzuCzDGWHj5z6Ujlwitn+fb2lCrZuFZz9QJByUj9E5Mv675aT
	dNLLPfuRgqa4v3vrYjRJZrqIA4WvoGeBnR73
X-Google-Smtp-Source: 
 ABdhPJxYOTJj1np6hSJbFHYya7Tgrv9byJ1xQHm6nftrKyej35kuaucqIf7ZJgdTQdcA+nrfoPCIxg==
X-Received: by 2002:a63:1a1d:0:b0:3f5:eb02:b6b4 with SMTP id
 a29-20020a631a1d000000b003f5eb02b6b4mr21384099pga.343.1654526360805;
        Mon, 06 Jun 2022 07:39:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.39.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/13] zip/unzip: mark all submittable patches as
 Inactive-Upstream
Date: Mon,  6 Jun 2022 04:38:30 -1000
Message-Id: 
 <0c63c7aaab9b74e9e069c2bc2395414c4a69a0f5.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166645

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df78f7bb461c7d3eccac469fd01a77a3d0b800df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


