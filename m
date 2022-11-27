Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FDDC352A1
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:55:53 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.91877.1669557334757723293
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DbxSGHMy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id g10so7850596plo.11
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vymwYc8JXxdu0NI0VXDLJCcvh76cSOMljRPnA8LNIQk=;
        b=DbxSGHMyOTcgFdq9P+2A0dS0YP3KADkhwdNYta8Y7i30vgJwislviZASSTm1wzDYQm
         eD4eGmWHwdNaACAw0QWGO0g4ouXUf21I18YiQ+q6Q2dvj1kYfFz/y4y4Gsy35HRy0WUi
         22Y+5lzhPvEGbdRfzFDvdIkCVL+8KySrmF8nz1vetapyxuILPzBZ15+kyFkfpMjnDK4X
         cQzu0XwcD+VQS9Ijw38s1AH/FAHlLTWCfMTsfp4kIedaeoY68ln4SmnGia7L0KiPMegp
         2xuhQurk2aVcRr1yR53tpLbRvh8pGT4ujh5tAJSahXcouuyWw7gjiGlXBzvFVTqYYuN1
         dITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vymwYc8JXxdu0NI0VXDLJCcvh76cSOMljRPnA8LNIQk=;
        b=JEjV3PJirg51L9UZM47M/983vIaKccT6e5Bd57lHXM1SiG7fIic13jjVW6+qesBGat
         WiV/AAZ9qFycClO3CzIS0f/s7eMYdlscmAxm4BKso/XvRTqT0VjyRVUo4NvPpIfbJs0Y
         UgmpbTHkEAP1lVVvWGOv4nhkoMUrSfuqCBQakbPibemE2+YoZ7sgaivibvVbhUapWXqT
         xkYGCMtcJ0wcSiPfhGz8oNdLVzukMvaliWaC8+kcsHKesDYJ8x+Ol+35Zk9SwGS4bzRZ
         7x+XtMya+d7XYC1SqTbGv7pQfH2qxMSJUa+dr6gwBF/i3jdzEQcEfAXIRsmah1hPM69d
         mzFA==
X-Gm-Message-State: ANoB5pla2NS8njPq8ZgkYfB8I1T+B6q735HLTd6Brmqh+vvvOZcWT7k9
	BVFGgTafdMq/2LgFBeaKenWstDLw3d62D4atnk0=
X-Google-Smtp-Source: AA0mqf7SqPyS1UyhtwmVUGLJR36U/b+iaNRZrs6zAYMF1R5RJs+Me06p2mi/lrwIiargnedHYWNYSg==
X-Received: by 2002:a17:902:e8d5:b0:186:a636:b135 with SMTP id v21-20020a170902e8d500b00186a636b135mr39828879plg.93.1669557349364;
        Sun, 27 Nov 2022 05:55:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902d48f00b001868bf6a7b8sm6910544plg.146.2022.11.27.05.55.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:55:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/31] libffi: upgrade 3.4.2 -> 3.4.4
Date: Sun, 27 Nov 2022 03:54:56 -1000
Message-Id: <6ad074b1caff63e90805aac25cca8a831b57273d.1669557026.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669557026.git.steve@sakoman.com>
References: <cover.1669557026.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173855

From: Alexander Kanavin <alex.kanavin@gmail.com>

3.4.4 Oct-23-2022
    Important aarch64 fixes, including support for linux builds
      with Link Time Optimization (-flto).
    Fix x86 stdcall stack alignment.
    Fix x86 Windows msvc assembler compatibility.
    Fix moxie and or1k small structure args.

3.4.3 Sep-19-22
    All struct args are passed by value, regardless of size, as per ABIs.
    Enable static trampolines for Cygwin.
    Add support for Loongson's LoongArch64 architecture.
    Fix x32 static trampolines.
    Fix 32-bit x86 stdcall stack corruption.
    Fix ILP32 aarch64 support.

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5b42ba98ef26a52bad8de1790b402938fec4a160)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-arm-sysv-reverted-clang-VFP-mitigation.patch     | 6 ++----
 meta/recipes-support/libffi/libffi/not-win32.patch        | 8 ++++----
 .../libffi/{libffi_3.4.2.bb => libffi_3.4.4.bb}           | 4 ++--
 3 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.4.2.bb => libffi_3.4.4.bb} (90%)

diff --git a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
index 4233799501..3ffcb3e128 100644
--- a/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
+++ b/meta/recipes-support/libffi/libffi/0001-arm-sysv-reverted-clang-VFP-mitigation.patch
@@ -1,4 +1,4 @@
-From 501a6b55853af549fae72723e74271f2a4ec7cf6 Mon Sep 17 00:00:00 2001
+From 000f1500b693a84880d2da49b77b1113f98dde35 Mon Sep 17 00:00:00 2001
 From: Brett Warren <brett.warren@arm.com>
 Date: Fri, 27 Nov 2020 15:28:42 +0000
 Subject: [PATCH] arm/sysv: reverted clang VFP mitigation
@@ -13,6 +13,7 @@ has been reverted.
 
 Upstream-Status: Submitted [https://github.com/libffi/libffi/pull/747]
 Signed-off-by: Brett Warren <brett.warren@arm.com>
+
 ---
  src/arm/sysv.S | 33 ---------------------------------
  1 file changed, 33 deletions(-)
@@ -99,6 +100,3 @@ index fb36213..e4272a1 100644
  	b	call_epilogue
  E(ARM_TYPE_INT64)
  	ldr	r1, [r2, #4]
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index 62daaf4b38..38f9b0025c 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 306719369a0d3608b4ff2737de74ae284788a14b Mon Sep 17 00:00:00 2001
+From 20bc4e03442e15965ae3907013e9a177878f0323 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -21,11 +21,11 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b764368..d51ce91 100644
+index 7e8cd98..cf37e88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -354,7 +354,7 @@ AC_ARG_ENABLE(multi-os-directory,
-                           
+@@ -405,7 +405,7 @@ AC_ARG_ENABLE(multi-os-directory,
+ 
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
 -if test "x$GCC" = "xyes"; then
diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.4.bb
similarity index 90%
rename from meta/recipes-support/libffi/libffi_3.4.2.bb
rename to meta/recipes-support/libffi/libffi_3.4.4.bb
index 71d9518baf..4ceee6f3cc 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.4.bb
@@ -8,13 +8,13 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=679b5c9bdc79a2b93ee574e193e7a7bc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32c0d09a0641daf4903e5d61cc8f23a8"
 
 SRC_URI = "https://github.com/libffi/libffi/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            file://0001-arm-sysv-reverted-clang-VFP-mitigation.patch \
            "
-SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620"
+SRC_URI[sha256sum] = "d66c56ad259a82cf2a9dfc408b32bf5da52371500b84745f7fb8b645712df676"
 UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
 UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


