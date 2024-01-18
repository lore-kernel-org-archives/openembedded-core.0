Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514CFC4725D
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 00:21:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.3888.1705537286907446974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 16:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Whyjv65t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e7065b692so43896885e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705537285; x=1706142085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/73q6+NXHTzvl62+U6aMn/p35uHcgnf9A2+PAmwFQvQ=;
        b=Whyjv65tZ0JKTZlUEhj187z4D51Mm5w0BFfRTZUIhOvIqzUqxAx0MQHDTGs9t5FpA4
         BtXSVE1xd2bTPx/4/AimhFBf1RgoY07ACELdsQYKQujLBrICc7Y6H4xIFolDwgT+a06K
         A6hZL6P7YuCqiRprtbo/DQc4yWX67wkibfyqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705537285; x=1706142085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/73q6+NXHTzvl62+U6aMn/p35uHcgnf9A2+PAmwFQvQ=;
        b=UiLwGKvPvEnC+Ec28Bi3QGNEtGmoS40UOvR3f7mUsQjA9AWOh11IJ94Iam2dSKVrzy
         OKNZSddZjIllNfukbZlPGLQE7lWtDt9ZLxzMElBiDGn08iEtVI3EA8UUKvMKLefRimGe
         b3gdBuqO+jAImasyywfhwMH9FnyG/0ATNA2nRBjJh7AJOLgHj3fV63jJc0nohr/+UZsg
         665ZfxvaMGD22tooV+JcGnZnbzd4YjiqMMtyTi5izSsSozN/j2TXNusL5gmMf+snuWIT
         wTcptqfXRGoZF+oH5U83fgkZ/hxA36vDi7UkyjweTdiARCu+qZgWAc2ENEamy2noCOBA
         CoNw==
X-Gm-Message-State: AOJu0Yx0gxYX+TMvL2Two11zZ1EqAxiVVSWLePjuCYvw01kZh98fRuMz
	eMC/nuybhecIatY95AYrJUA3I3nBRj1jNUiMHhagGV0WW9+5x6JWVyp8CRdi7xWFPHY5R64D7xO
	n
X-Google-Smtp-Source: AGHT+IG4alqHX0srb2W30VWaK42Yqq5bP67vdwof8V7XkVE+qOjCv73eIyXlje5UCV27wyy49OHIRw==
X-Received: by 2002:a05:600c:164a:b0:40d:3112:a2d7 with SMTP id o10-20020a05600c164a00b0040d3112a2d7mr6198wmn.187.1705537284889;
        Wed, 17 Jan 2024 16:21:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:318:fedd:930f:64d3])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040e7306f655sm13630352wmo.22.2024.01.17.16.21.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 16:21:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtool: Update further patch status to backport
Date: Thu, 18 Jan 2024 00:21:23 +0000
Message-Id: <20240118002123.3969136-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 00:21:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193950

Three further patches were merged to upstream libtool, update the patch
status to Backport.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtool/0001-ltmain.in-Parse-additional-clang-options.patch | 2 +-
 .../libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch      | 2 +-
 ...1-ltmain.in-Handle-prefix-map-compiler-options-correct.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
index 0dcf963dcca..c52083327c4 100644
--- a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
+++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
@@ -7,7 +7,7 @@ ldflags
 * build-aux/ltmain.in: Handle clang linker options
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00110.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=725646bf095bf5c07c49ae38dd060f95bd95ae3c]
 
 ---
  build-aux/ltmain.in | 4 +++-
diff --git a/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch b/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
index b6175903daf..6d922382ef1 100644
--- a/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
+++ b/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
@@ -13,7 +13,7 @@ and result in cleaner/consistent output.
 
 * m4/libtool.m4: Cleanup sysroot trailing '/' handling
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00111.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=365805327c7b9bbdb0e622b954b6b0d8eaeb3f99]
 Signed-off-by:  Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
diff --git a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
index c0627795b45..4c6b6f05b49 100644
--- a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
+++ b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
@@ -11,7 +11,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00019.html
 https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00066.html
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00109.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/libtool.git/commit/?id=cdf4bf702f11d17e06569936e8a433a77f791228]
 
 ---
  build-aux/ltmain.in | 3 ++-
-- 
2.39.2


