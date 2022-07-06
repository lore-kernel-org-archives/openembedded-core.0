Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F7BCCA480
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3655.1657094848544225873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDbki0l5;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x10so10872228edd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RmJXzdUCINSwmvcZRKc4tUuCp1dXTPO2hzBepm9hfp8=;
        b=DDbki0l5xu9Jgb8ISnpryhMHmBpgjfaWHSNyg04sfz7mJSZZYcamVYKElHeoUhu1qn
         0fWlAEpUjDSJdvNn7CmX3RmgmxpNX4QQR0F/HGelu+vy6zbHnG7ro1+XEHDFA8UTeWFW
         Zb6axAbkReAL2qjav/t7VVcR70c2DYFTK8A2DHW2SPSSq0qcQ8ZYjtfz5iw9ASBXqkHN
         0cJclf0kPdlzBob9s2SSAbQ4RAnTW1GluB95jfKAI1qBKAhvhdYDyDVRvZw+a9HdtocE
         rmLL4qgetl1VITbPpjYrs0XFQ7ZwgosRrSm3vzfRbvOQn+4byBRpEsjEEX3VDRZjIETa
         +alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RmJXzdUCINSwmvcZRKc4tUuCp1dXTPO2hzBepm9hfp8=;
        b=wh2iOHZnbUSl+rmpQWIMVFwvV17CdRs8n8MCPUQLQttFlLCwwwkbNdgz6pBG3fJpPO
         IHizdD5ZTkV2tAwqaEZ/puaz4FMelAUAp81Ub+YGJslr1Dw0eIakw9hcCT4RO+IQ68ME
         6mX3maaXP4FHOCNfswG6bI263SIm5ngZEWRYrHjipHrmqVbXI3JnXy3LlqswZW8RdnPP
         6/MJ2UTNyEVxSMr5ylRAUN5OIPyxRDOyjibNBRiMrwFiE6WacEgC5SbUC5EtTG/IYlgu
         iWR6xnfcCeL1GzpHzu3i5ZmQFunh01G5wrDrsYEgIlVsAk5TpBl++bOrssdXYs50Z8pn
         TSYg==
X-Gm-Message-State: AJIora/m5d1ZvxR8DOYd0VUEyc2kg/Qw+Az72bJUnbaAnvcoNSgqvlVn
	g14DG2SRZWc71K9oKNczlF3X51Fmz/XHoQ==
X-Google-Smtp-Source: 
 AGRyM1uxUEVZ1KnH2sMdpPwXsV5a26769q5LEVVJXjJO0fV9oXefj58RnIQteQOAMHtYNDXJV4aVkQ==
X-Received: by 2002:a05:6402:b3b:b0:439:b0cc:d409 with SMTP id
 bo27-20020a0564020b3b00b00439b0ccd409mr30156635edb.325.1657094868658;
        Wed, 06 Jul 2022 01:07:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/27] python3-setuptools: upgrade 62.5.0 -> 62.6.0
Date: Wed,  6 Jul 2022 10:07:17 +0200
Message-Id: <20220706080721.3072553-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167710

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_62.5.0.bb => python3-setuptools_62.6.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_62.5.0.bb => python3-setuptools_62.6.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 6d4a9ff0a2..b9574070ab 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 5dfa8a8e0b1ad4712a8b8309c8663b7b598ba2a8 Mon Sep 17 00:00:00 2001
+From b64f3066ead6b317fb62c031c173ec6eadd44db9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_62.5.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
index b3286d5dab..be6707ce88 100644
--- a/meta/recipes-devtools/python/python3-setuptools_62.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "a4c782ac58fcc9e3a86e5e1a4c74cf9d24bf21e4f1562043309022e1bb76951c"
+SRC_URI[sha256sum] = "990a4f7861b31532871ab72331e755b5f14efbe52d336ea7f6118144dd478741"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


