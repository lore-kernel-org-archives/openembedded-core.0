Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78ABCC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.8735.1637163345361426490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MGaKMC3h;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2423818wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sIHWb5Y5uGpYcEFYkkPq73xqUchkttPEOhhwQw94mvw=;
        b=MGaKMC3hjK3Y2VtAMu0RWJ454W74Zehpr/UPx66LFDAbgWFHfTPSgT5j67zcVU8VXR
         Mi1BPPE8ie9efk4g/eWOJk7qe5dkyQWozGL1DWJDyJvO2+fRAUtBCvLIRbccYfh+YGI2
         FUKNZbaXxoB96GN9hHm+e7KIX99kT7yzgLPdhNf4DpiZwvD8K4KiNAqeNc4TS2DtA/50
         ePxyaLRoO+5F1Jg7D7pkqisI4nKRCp94btGubu33EKykdc9z5FHfHIqteuIFeDf/vhDS
         h+pD8IgvTahosgUsNPRJeECB7/b2rt5U78wY70gsZC9KUdkc3Bjz7Ijx6ky/62JR/KXC
         6meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIHWb5Y5uGpYcEFYkkPq73xqUchkttPEOhhwQw94mvw=;
        b=PeZ9Jykx70NaLLu8dVvIgHo1u3BSPxC87ezZpbDhYa24CEqg4W7Ws5ruqxbzrwe9eK
         tMPh6QTSqpzinnQE66YVWExPoNaVfREFTUnBDssF5gnZGD6/UcN8lnUuWXFmISPjQfYR
         CXT+chHKJVk7M90N4ABe569vCrD5xec/lYbrd4iK6r3RJiSFUFg+5tGeGD0d/M0b9Iv9
         b0yYEQxXR78/i/LbN+HJ/fNWSjSprnnCYsZCwEfnqdLt92BSBClktQhA0O0EbZ/xR6FH
         zS2oPire1/KXvRpfGNIci0NCvz8sCxBlB1bWiydnuiM2UD1YQwl12aUCV0DAF4XLIQL7
         yLTA==
X-Gm-Message-State: AOAM5309JK5soiulklRNlydcjULDzGp7rCjLspJRuDnfuLXbAEo1C0+2
	vyYnU6rND6m0iRbDJ+hVz6lgvaoyQrg=
X-Google-Smtp-Source: 
 ABdhPJxAYeinrcmE/vTViH95ajE2UBo98aMyYKhW/4z1zIXun6eu2MVRw7gRHITpObAYQThkvhwtYg==
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr616236wmq.7.1637163343943;
        Wed, 17 Nov 2021 07:35:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 25/36] autoconf: add missing Upstream-Status to patches
Date: Wed, 17 Nov 2021 16:35:14 +0100
Message-Id: <20211117153525.257146-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158420

All of them seem like very old, very oe specific tweaks; please adjust otherwise.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch | 1 +
 .../autoconf/autoconf/autotest-automake-result-format.patch     | 1 +
 meta/recipes-devtools/autoconf/autoconf/preferbash.patch        | 2 ++
 meta/recipes-devtools/autoconf/autoconf/program_prefix.patch    | 1 +
 .../autoconf/autoconf/remove-usr-local-lib-from-m4.patch        | 1 +
 5 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
index 374b939404..c73aca41ee 100644
--- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/autoreconf-exclude.patch
@@ -3,6 +3,7 @@ From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:25:23 +0000
 Subject: [PATCH 4/7] autoreconf-exclude.patch
 
+Upstream-Status: Inappropriate [oe specific]
 ---
  bin/autoreconf.in | 26 ++++++++++++++++++++++++++
  1 file changed, 26 insertions(+)
diff --git a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
index de048d23d7..23329f7927 100644
--- a/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/autotest-automake-result-format.patch
@@ -3,6 +3,7 @@ From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:25:45 +0000
 Subject: [PATCH 6/7] autotest-automake-result-format.patch
 
+Upstream-Status: Inappropriate [oe specific]
 ---
  lib/autotest/general.m4 | 39 +++++++++++++++++++++++++++++----------
  1 file changed, 29 insertions(+), 10 deletions(-)
diff --git a/meta/recipes-devtools/autoconf/autoconf/preferbash.patch b/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
index 3979e83f70..cfb145a279 100644
--- a/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/preferbash.patch
@@ -14,6 +14,8 @@ known for their conciseness).
 
 Change the search order to bash then sh, so that a known-good shell (bash)
 is used if available over something which is merely POSIX compliant.
+
+Upstream-Status: Inappropriate [oe specific]
 ---
  lib/m4sugar/m4sh.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch b/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
index 4ff535fc15..657cbb351b 100644
--- a/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/program_prefix.patch
@@ -3,6 +3,7 @@ From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:28:38 +0000
 Subject: [PATCH 3/7] program_prefix.patch
 
+Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
  lib/autoconf/general.m4 | 2 +-
diff --git a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
index b842f14f4f..f38780130a 100644
--- a/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-devtools/autoconf/autoconf/remove-usr-local-lib-from-m4.patch
@@ -3,6 +3,7 @@ From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 12 Mar 2020 17:25:37 +0000
 Subject: [PATCH 1/7] remove-usr-local-lib-from-m4.patch
 
+Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
  lib/autoconf/functions.m4 | 9 ---------
-- 
2.20.1


