Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6086C6FA95
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3144.1675840916568044735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QtMmWANV;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so1946382wmp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWf/WMSfdOXEtMKJmH7K9XUaPUZwUg2+CnOm8vrxnfo=;
        b=QtMmWANV/K3u0Ho/CnLEGAocAiM99/y9bRVCTdvRrDiV7ExrlMOtfspiBYxQ4TtBHg
         SSl3yr667i42BIXlPcezhU9heENgpXkB6y+mEM6FkV+qEQb1d6NBA+qdr6Ps4bnAvYBz
         er9a6aiJSIXqSoZIKuS0i/VXlARC/CoMsxfnGZAO2sy1/i+KxYNJ1lDNae+dZn/U28eR
         kkIjvramI0gmbBsgggoLcmDUycTYjP0E1v95S+6i5tUDnqWAOESJ5rKog1Aj4h5gG/a0
         yll8DMEh8ZwdDkABiilgDFDBXHV3Iac3IG0yN0PikbjcD2dq9XzSuO4kxtN5zL5lFCQ4
         GBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWf/WMSfdOXEtMKJmH7K9XUaPUZwUg2+CnOm8vrxnfo=;
        b=FcTcTbrZvtGjwVQOuPY0d2FwmL7h48xozUBpQ0IMEMj8pIQ+7seA3SIxqKJH6Xm9OC
         nDDKAbwptCu0J6KX1QAloY2UPoabUbqN4SqDchrOIxtjRLCoP49LHHUNJdAMG8eyW+tA
         eCFiuWN0ruBC1HENb1aIj97/v+GveuZS/5LH7HPBqA3NxqfpmfK8V0NIkY3PGSRXIlE3
         J3idLUcTb0o/KUfUBR3SDEtSbYuafJSMSzgWwufXgho+ryZQDXuH2K2X6+r78OoEPSZS
         0NCCiNuHKHZsTRo9mwGWnNCJl9YvST4TtS4XGOf+07n8mkjoknwG6qRi4o6B8faJwFUi
         OP9A==
X-Gm-Message-State: AO0yUKWk/D33wr/q2bO7DJaEpC1yWn0jDWECLP9Ijet9zDnjh83FACC+
	eD3IiOv6ZbPH2a+V6VxTB3v+yLMmTlo=
X-Google-Smtp-Source: AK7set8hru0/nObcxYRPahl4iihg0JqZo9QSTLZcZv0UPPQ3SjMgi8vynm8+TNeS/TEqlcHqnsJvHw==
X-Received: by 2002:a05:600c:1716:b0:3df:f7cc:4da2 with SMTP id c22-20020a05600c171600b003dff7cc4da2mr5465703wmn.16.1675840915052;
        Tue, 07 Feb 2023 23:21:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/52] python3-setuptools: update 65.7.0 -> 67.2.0
Date: Wed,  8 Feb 2023 08:21:04 +0100
Message-Id: <20230208072143.2930292-13-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176854

Remove patch as file deleted upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-change-shebang-to-python3.patch      | 25 -------------------
 ...ly-do-not-fetch-code-by-easy_install.patch |  2 +-
 ...65.7.0.bb => python3-setuptools_67.2.0.bb} |  4 +--
 3 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
 rename meta/recipes-devtools/python/{python3-setuptools_65.7.0.bb => python3-setuptools_67.2.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch b/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
deleted file mode 100644
index 6dcf52771b..0000000000
--- a/meta/recipes-devtools/python/python3-setuptools/0001-change-shebang-to-python3.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c39d0896930e25c224cc897660fc8511ccae30c8 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 23 Apr 2020 10:01:12 +0000
-Subject: [PATCH] change shebang to python3
-
-Upstream-Status: Pending
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- pkg_resources/_vendor/appdirs.py   | 2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/pkg_resources/_vendor/appdirs.py b/pkg_resources/_vendor/appdirs.py
-index ae67001..933e398 100644
---- a/pkg_resources/_vendor/appdirs.py
-+++ b/pkg_resources/_vendor/appdirs.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- # Copyright (c) 2005-2010 ActiveState Software Inc.
- # Copyright (c) 2013 Eddy Petrișor
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 2110c4a877..e22e757fcd 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 2e57369593ede5336f947e7b9903ebc673f98fef Mon Sep 17 00:00:00 2001
+From 1a7fbd6b7ccf9d3f69bd591fa35fa48c0b8916ba Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_65.7.0.bb b/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-setuptools_65.7.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.2.0.bb
index 789d212281..a412043a8b 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.7.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb
@@ -8,10 +8,10 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch \
+SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "4d3c92fac8f1118bb77a22181355e29c239cabfe2b9effdaa665c66b711136d7"
+SRC_URI[sha256sum] = "b440ee5f7e607bb8c9de15259dba2583dd41a38879a7abc1d43a71c59524da48"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


