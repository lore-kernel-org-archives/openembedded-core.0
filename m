Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B8BC25B06
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.22274.1659940971827696107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=heFQSRnt;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id k26so14821114ejx.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8J9JuPQh5IwfG9DiHcwS+wCbOPvo9cx7R0kd2cGWIw=;
        b=heFQSRntIvDLQ+UY5R2DxppXEi1EqkxoGXA39YgsJE8AbyIKUcrHbpy8UHUPgaVQaH
         zlJCyCLnSP3vbtNZ2MRmxKdxOaHhyTv4dgdWawt7aFTSTeH7fBG3HJBf7NyU7A001bZX
         EISNr1hQpoPNwegD27Jm3AaWoKLMF5RoG+r4Sx1mvoENe+teZUL9Imh6Bmfj0+nH+6ML
         PPMJPRd4amMcwvuju0g2idANjXzCP+SyA/MsK106lzNf3nG9FKuT9MG/0SxXqz0q4g22
         GDRcz2BExu+nsGFp0yDW1vVDmDnLQ++CNh1Fk+zuLN0Cb2eRQvfpQNIoVSIYzsv5dB1S
         bvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8J9JuPQh5IwfG9DiHcwS+wCbOPvo9cx7R0kd2cGWIw=;
        b=Q1rUADKGkTrnxXE7AsAxS+0bEF7O5MPMmOzd/4QwOUAqPwfpEYrt00FjY14RfAvPQ4
         YRFdo5ubiIwTj7xJz+brsJi8VVlfuM5yvahFhh7xPx4UP6kEkiomMq+avBwUuBowQR/D
         tG7NoekeE0TPfEKR+b0zY6D0ooxoi5IQxmbxA/xun+FQXNdCkv9hmHBj0DxYmezjN/O5
         BESK0Hh3gErB9/GF0iTcqKYxLTeRYZ2Fd34Gx4N7aKJ5ZzyvRrp3lL50dHJLVR0CBU7H
         6u74ModuHchpYjIi9Me80Fzx2wP4xNlL/RAeWMylAVFqVk5nmDbul1VYlsuUBvQfh3TF
         7O6Q==
X-Gm-Message-State: ACgBeo35cSC0eTBQsZTtkQXmSGr64qz/8JqTsc/VEP/CLS4EDnk244LS
	UwEx58pR6Zn4guMOV8r8O2qhJe48Ybg=
X-Google-Smtp-Source: 
 AA6agR5uWQ2/sdX4SuTX/CdfhO6IMEuMIcA2VYBPwtwaiiGqU7Kp/ofyx0Ow+OJvB5//rMryhpNofw==
X-Received: by 2002:a17:906:a402:b0:72b:8e6e:64ea with SMTP id
 l2-20020a170906a40200b0072b8e6e64eamr13152613ejz.469.1659940993494;
        Sun, 07 Aug 2022 23:43:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 37/44] python3-setuptools: upgrade 63.3.0 -> 63.4.1
Date: Mon,  8 Aug 2022 08:42:30 +0200
Message-Id: <20220808064237.3975347-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169061

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_63.3.0.bb => python3-setuptools_63.4.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_63.3.0.bb => python3-setuptools_63.4.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 9c5ff6ad9f..2888e3d62c 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 3a5ae454c0738510daf5df68b7968cab66cceb7f Mon Sep 17 00:00:00 2001
+From a020fd90a7060f7783ef286bcdf9dbf307184978 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_63.3.0.bb b/meta/recipes-devtools/python/python3-setuptools_63.4.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_63.3.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_63.4.1.bb
index da7e7892fd..e31665f3be 100644
--- a/meta/recipes-devtools/python/python3-setuptools_63.3.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_63.4.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "273b6847ae61f7829c1affcdd9a32f67aa65233be508f4fbaab866c5faa4e408"
+SRC_URI[sha256sum] = "7c7854ee1429a240090297628dc9f75b35318d193537968e2dc14010ee2f5bca"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


