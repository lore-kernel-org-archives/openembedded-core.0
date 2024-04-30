Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846CEC19F4F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:18 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.253.1714512254215357081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=11MWOAzD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ec4b2400b6so10251435ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512253; x=1715117053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19ZNPvpsQqLJ3W6yWREYz1tkjNeHmkk3lRCSIMIKVZw=;
        b=11MWOAzDmF70KlqZkquVG7ma/bcwB2/F3yBfbTXNl0mbT6kwLugRXsSMxO1XGEFD8C
         l2Pk7uUHTcY+zyVH1rV7K7LQ5btjMAdZUN9Wq+hKZAGkD2RItzRjeOeCmHR/ztfvQBiJ
         i8CZXkHwqDC1Ig7rhzvotEqqKRWLMvjO2krKlBJRABTvldN8nZyt+Fzqfvdxs1AtcQL4
         LMHJj1C1rRNBUct+xexeh+LxlApRAhgfGf3topzvCZH11r6Rpt/WmKq+7+dK64ZW6U+Q
         scAE0vtSa5gBeC9r5lBlGGttJ7oMtAqZrAmk4hymi+IgpuWBhAnJXLan7jspynFANLCL
         pctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512253; x=1715117053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19ZNPvpsQqLJ3W6yWREYz1tkjNeHmkk3lRCSIMIKVZw=;
        b=dPlskT9qpLz/giE0MmQHVDd/kI8Nf/rmwD3DTpq1vbZtD/Bu3ntVm9ccNxY93FOGZI
         nFrIm2MenWObWh4AtpEBmMWLasI97eyrKGq3avs5KindXH1yINDYrhtPdylpOCH4xsIm
         Abr8a6HW56ulzWt2mm2MRmnZw3tcfxAGMjE3wUhN31xo1aFoOAD8O1YN6AzWzRk3FK+I
         bnkhKnz35K04sG3rHhrTioZKeLSXmJIEAqMgaeEBX9jC3CmDf1RYr07GWmMyi81nasRR
         Y1jhETyTXb0hE/ddJLg9oKxB3mWSqgLdptVOPSpGoWXBAoVKsR/2ykGsk6qyEWchRBg8
         7ceA==
X-Gm-Message-State: AOJu0Yx2mqG53UeGOqoRfyOlwZFz6cPlgSy6O8GVKr6tUfEQLAJbsCH9
	L8fgL/fzjjJ7ma6eq9TAF+pY24VYYs9Qh8nwrVXhf/Rfqz+mWSbElb3IWmN4+G8IHtG06WgISc4
	sOxI=
X-Google-Smtp-Source: AGHT+IH5/DpfpU/abxT+B0BSbWHHurcjA9VAOdJZoBeiJYiadOF03FAtniDaFgHrODoL1RgGNOABSQ==
X-Received: by 2002:a17:902:db11:b0:1ea:b3ba:79f5 with SMTP id m17-20020a170902db1100b001eab3ba79f5mr773699plx.60.1714512253495;
        Tue, 30 Apr 2024 14:24:13 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/17] icu: update 74-1 -> 74-2
Date: Tue, 30 Apr 2024 14:23:46 -0700
Message-Id: <a6a5fa0af5e0bfe230681eee3f2e3b45a694ac9b.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198765

From: Alexander Kanavin <alex.kanavin@gmail.com>

ICU 74.2 updates to CLDR 44.1 locale data. These are maintenance releases for ICU 74
and CLDR 44, with limited sets of bug fixes and no API or structural changes.

The CLDR bug fix relevant for ICU is for some formatting patterns that erroneously
had two adjacent space characters. These are coalesced into one. (CLDR-17233)
Important: DateFormat.getInstanceForSkeleton() and the DateTimePatternGenerator
sometimes used the wrong patterns because they failed to use/inherit certain data
(ICU-22575 — CLDR 44 had removed some redundant data that ICU relied on)
For details, please see https://icu.unicode.org/download/74.

Note that upstream has re-spun the release tarball (the initial tarball had a broken symlink
for LICENSE file), so there can be yocto premirror checksum mismatches:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6671/steps/13/logs/stdio

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 344f7500e6df31d7c06331aedbac0df4983da958)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch | 11 ++++-------
 .../icu/icu/0001-icu-Added-armeb-support.patch        |  9 ++++-----
 meta/recipes-support/icu/icu/fix-install-manx.patch   |  7 +++----
 meta/recipes-support/icu/{icu_74-1.bb => icu_74-2.bb} |  4 ++--
 4 files changed, 13 insertions(+), 18 deletions(-)
 rename meta/recipes-support/icu/{icu_74-1.bb => icu_74-2.bb} (96%)

diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
index 2968d571bb..c0e9e2806b 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -1,4 +1,4 @@
-From 0c82d6aa02c08e41b13c83b14782bd7024e25d59 Mon Sep 17 00:00:00 2001
+From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Feb 2014 21:06:42 +0000
 Subject: [PATCH] Disable LDFLAGSICUDT for Linux
@@ -7,14 +7,14 @@ Upstream-Status: Inappropriate [ OE Configuration ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- source/config/mh-linux |    2 +-
+ config/mh-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/config/mh-linux b/config/mh-linux
-index 366f0cc..2689aab 100644
+index 53d6780..b622513 100644
 --- a/config/mh-linux
 +++ b/config/mh-linux
-@@ -21,7 +21,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
+@@ -23,7 +23,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
  LD_RPATH_PRE = -Wl,-rpath,
  
  ## These are the library specific LDFLAGS
@@ -23,6 +23,3 @@ index 366f0cc..2689aab 100644
  
  ## Compiler switch to embed a library name
  # The initial tab in the next line is to prevent icu-config from reading it.
--- 
-1.7.10.4
-
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index 578517b57f..a25285fb54 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From e3c25af4b40d64f098e7b8ae5a91fdc3c90163c4 Mon Sep 17 00:00:00 2001
+From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
@@ -8,16 +8,15 @@ Make icu support arm32 BE.
 Upstream-Status: Pending
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
-
 ---
  i18n/double-conversion-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
-index 7f23e0a..7f89094 100644
+diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+index 303668f..7d859dc 100644
 --- a/i18n/double-conversion-utils.h
 +++ b/i18n/double-conversion-utils.h
-@@ -115,7 +115,7 @@ int main(int argc, char** argv) {
+@@ -146,7 +146,7 @@ int main(int argc, char** argv) {
  //
  // If it prints "correct" then the architecture should be here, in the "correct" section.
  #if defined(_M_X64) || defined(__x86_64__) || \
diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index 925b064ebd..7526bde370 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -1,4 +1,4 @@
-From a6ddabc8cadb76bfe2d2e374a6702442cfe51cce Mon Sep 17 00:00:00 2001
+From 2d544cac238eccbfc32cafc9502ddf6e00994211 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 9 Oct 2015 17:50:41 +0100
 Subject: [PATCH] icu: fix install race
@@ -13,13 +13,12 @@ in the install command.
 
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
- source/Makefile.in | 8 ++++----
+ Makefile.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index be9435b..ada20d7 100644
+index 8366f01..79b91c9 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -77,7 +77,7 @@ EXTRA_DATA =
diff --git a/meta/recipes-support/icu/icu_74-1.bb b/meta/recipes-support/icu/icu_74-2.bb
similarity index 96%
rename from meta/recipes-support/icu/icu_74-1.bb
rename to meta/recipes-support/icu/icu_74-2.bb
index 88ded166b5..8352bf2a5b 100644
--- a/meta/recipes-support/icu/icu_74-1.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -111,8 +111,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "86ce8e60681972e60e4dcb2490c697463fcec60dd400a5f9bffba26d0b52b8d0"
-SRC_URI[data.sha256sum] = "67d5ab39c5187e1dd0fed60a3fe52794dce9784b4c045cb85e19f5d317fd783f"
+SRC_URI[code.sha256sum] = "68db082212a96d6f53e35d60f47d38b962e9f9d207a74cfac78029ae8ff5e08c"
+SRC_URI[data.sha256sum] = "c28c3ca5f4ba3384781797138a294ca360988d4322674ad4d51e52f5d9b0a2b6"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.34.1


