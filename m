Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38979C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.51642.1658306701623392478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SDhBkI3W;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id j22so31837435ejs.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s//1mgwe04GDX705uYflIiMySZFNKHSC1qOkZdDuw58=;
        b=SDhBkI3WbK4AVtnGAYTZW4WibXztruruc01dJOLWOQ7YHoYNxSz6shFp2WsaGcoU07
         QcnggvHuAn3AT2MgudYLHtbhWw0zD1H7wU2kx6xzcQgZA5S4m63I+kWBTCk8YIkt6ClG
         jof9Zo40zpza9Kev/QU6KD96iSZVjUQOF3fla+hzj9WFQDTokPBjhKjLS86DsDeijBMM
         I47GdJvk8Z+h5Z0ojl/q6XLFnKpjN5SjNimQlfR3A18jUlpyYMdCxD6bo4Jed/iYdGPh
         eXLVxtv0RmoV0DnPWmLHCZBf6TcTJkihHeED9x50OH5s58w6PW8ahJv1GW8rhyPFjAQh
         OViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s//1mgwe04GDX705uYflIiMySZFNKHSC1qOkZdDuw58=;
        b=Pl78jKuHckXFfIUgDDX+mmtlR+dlQpt0asi1rhc6Lkx/Stp0wpcoGLpMTGxe1ENtks
         P63y9130gweMYc7oeVCrOOJ1NjiIfCyfQ2a55vucmmmBMcgph82ReafcI0z2AUCj+oV5
         5pKpP/7cLN7BngW1S9z38HatE9U6TVIvE32mLycay0Qc3xEvui9SKvAyN5x0MXcE3ONU
         7fJc0zltPXCMpe2We8577MwN3Edqc04urA4crs7FxVtdBwHNK3ZmjXQDbibOhuE02sbU
         S/Httxy2UA281oaiV8Pm1maFeRuCNxNm0sYdWc940VMxoBTxt7GC1KBQ6jFh203Phamh
         fs4A==
X-Gm-Message-State: AJIora+PArIweT9Og/oAFFsMi5uyxQfTEd+O5ZpR7yopFwtS68ZfLMHX
	H70HTiq6NRx5Q0cn8dzO0G/egFy35UU=
X-Google-Smtp-Source: 
 AGRyM1sh2wAQnaIqXF31BvpWnkFfIyc/Jk8F9CttB9+YpZSogWS1zbTvUU3H6dKLr3KdWzzolDtp7Q==
X-Received: by 2002:a17:907:628c:b0:6ee:70cf:d59 with SMTP id
 nd12-20020a170907628c00b006ee70cf0d59mr33724307ejc.402.1658306733215;
        Wed, 20 Jul 2022 01:45:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 44/51] python3-setuptools: upgrade 62.6.0 -> 63.2.0
Date: Wed, 20 Jul 2022 10:44:35 +0200
Message-Id: <20220720084442.2940187-44-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168338

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_62.6.0.bb => python3-setuptools_63.2.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_62.6.0.bb => python3-setuptools_63.2.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index b9574070ab..9c5ff6ad9f 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From b64f3066ead6b317fb62c031c173ec6eadd44db9 Mon Sep 17 00:00:00 2001
+From 3a5ae454c0738510daf5df68b7968cab66cceb7f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb b/meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
index be6707ce88..15c171b846 100644
--- a/meta/recipes-devtools/python/python3-setuptools_62.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_63.2.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "990a4f7861b31532871ab72331e755b5f14efbe52d336ea7f6118144dd478741"
+SRC_URI[sha256sum] = "c04b44a57a6265fe34a4a444e965884716d34bae963119a76353434d6f18e450"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


