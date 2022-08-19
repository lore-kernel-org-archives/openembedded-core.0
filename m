Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA32C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.480.1660894105596609675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mMkA8qb/;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id n7so4181882wrv.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qZxOp3h64IJM0X7Wd46N1pXme8PpWhSYcSoFAirQFIs=;
        b=mMkA8qb/XSIVgr5SZs6ZvZZ7Xt5WGrgczkcdNV0B768decYMKCf8RWrHRDVggZkZlI
         GbF/uzIakpRJchZIQpwiZQl8Z9T3e6JlBc/XGSkE+aZIX/nUgoT7XA3J45w5S0J7MZpK
         EnsBjF3+xfF8Nhmz5PH+UDsY7ANp6K2lfbXvlkPD1+vBYSDz9dBgotdDv6OSToYzFc4v
         7F35QG1oWw7qEa+MLshXvjy1ZcGGp6ZFRIaT0aZNKwjcw72zDMcVvGt5ENpWs01HquYv
         SOLYgznvfKJgvQvIJskXkE7blVt2D++lboA6+5KFEUTl1T7VFgtv0NVYd00C1z8eKtsn
         XOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qZxOp3h64IJM0X7Wd46N1pXme8PpWhSYcSoFAirQFIs=;
        b=TKLo/N6cDuQsluZ1OTuGAsFiLfCZeHQvOYj+iCgANMB7AS417AYoZ+LHfqX5tUXnx8
         K3G49N0iDqysQkn5gCAShQ6jYij6qNyZnprUuH4tpw8+UVrN2PJBOdDZidlgRLIZH6TP
         J0/3mdurkhdzj8JQotjrvR8gHDqH2HsXmfQnE2G6wULM+Bw4Pu2vRh2cQh/Ig1ZP7MhS
         7HTLvlBMZzhWtVPZUXxFF8J7z6N5mbjlm7NEl1soMMU5D7+6Y+SInPc3mXCm47HqaEs1
         O9Y1IN2z/ytonzsrpBp4c5Mx+15ZHlumbxyLwWAuayYOiUVWeAnb7dimMCoxRe05orfE
         yP4A==
X-Gm-Message-State: ACgBeo2jurE5g+YoyjdCRlPIgTbsFKQpksFMEHsx2MNuSunI8pjuas8D
	c4qG3NwZ4s+HNIJeAjVNRc0XQEvaJWg=
X-Google-Smtp-Source: 
 AA6agR48ebQeplYwOmZpzXg7AHrVfutN0Tz9s/4qybahGq8uXZvZvpLumTQLBWYPFkQhIiyBhlolyQ==
X-Received: by 2002:a05:6000:1149:b0:225:29d4:67eb with SMTP id
 d9-20020a056000114900b0022529d467ebmr3396007wrx.254.1660894104064;
        Fri, 19 Aug 2022 00:28:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/42] python3-setuptools: update 63.4.1 -> 65.0.2
Date: Fri, 19 Aug 2022 09:27:26 +0200
Message-Id: <20220819072727.2236928-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169612

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_63.4.1.bb => python3-setuptools_65.0.2.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_63.4.1.bb => python3-setuptools_65.0.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 2888e3d62c..c8c713c842 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From a020fd90a7060f7783ef286bcdf9dbf307184978 Mon Sep 17 00:00:00 2001
+From 42d349031cd952c12620fcf02cbab70a371f4b19 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_63.4.1.bb b/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_63.4.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
index e31665f3be..1a639ea333 100644
--- a/meta/recipes-devtools/python/python3-setuptools_63.4.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "7c7854ee1429a240090297628dc9f75b35318d193537968e2dc14010ee2f5bca"
+SRC_URI[sha256sum] = "101bf15ca723beef42c8db91a761f3748d4d697e17fae904db60c0b619d8d094"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


