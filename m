Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0960BC10F1D
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.70643.1670929898030460670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MZRLTFAN;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id h16so6260265wrz.12
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGTsG0msjiTyMFnibQQeZHQLaaKwiXJpn2MS09dOOMI=;
        b=MZRLTFANafKfCJjW51ZYfF2dhpwd+2hnQ5sF6GMNG4GpNDrgbkmTAK/Qo4UERHAJBs
         r3yNmgNmMaT2dOI7skFcwlKe/npB0BpWfV6/EMSgAHz8NsnOXsoAs/37U2KEwT6U9Yjp
         ItZKy/ZKmkUENwyO9UxS7Wko8YioVhSeGYItbjar5LPBt1wW6heS+9Y2rPce4XuO19z+
         cz0Dy5dwiSYQN1zfQL/OvEvjmwL2v6tVAw6n9p/ULaE0clPSgIUQVQ0x0qvimSIBYErO
         /2lDDoqjFnskbpCxwQKzLctWKCYXRwmhnD7U3JHSKLG9riibU4fbKh1mt9tmHWTTqFPC
         t8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGTsG0msjiTyMFnibQQeZHQLaaKwiXJpn2MS09dOOMI=;
        b=79zlPdKpUqx0NMXNvEf067/NNWW4xxC/h3FuEXAJi+8n/tRHg3FLbbuW2f+F2nYyjC
         sH8UYjESPAILuQfnZ+1dD0CCWT+FO7N4mc1NkGn1R7HaMXe8kEZaZgHHFuLau20Z8+VY
         Gm9mBscnubPgrahAy635Pk6lQN2Tsvhr/JIGBlneAROEqZftQahV41ygNh/9I5MirCqF
         QHy5IjvzXFwf6VPA91hXEGzIXnqr68ynw1Xg60S7zl7m/R9of4CPYKJ3kmjt98xZpeVY
         h/5s12S43l0dTL1dB8PDLPBVJBvd8/aWJbw+OXmskvZD41Unc0A5q+1x/gMZICCKno+5
         qJgQ==
X-Gm-Message-State: ANoB5pmRkAI5Okii2M9efewi/RWo2gU73zkxy00JVSO2X6O9UNIfpEBD
	DhQAkE+qtRZ7xBSnhhzQYfllPiBOmlE=
X-Google-Smtp-Source: AA0mqf4AEIadAwj0ew7wYbrbQ8pO561YxvuH669S30jt4QBzdtTGqcZjZlX4naqL7Lb8b0a//oE3AA==
X-Received: by 2002:a5d:690c:0:b0:242:3fa4:8217 with SMTP id t12-20020a5d690c000000b002423fa48217mr11979312wru.50.1670929896477;
        Tue, 13 Dec 2022 03:11:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/24] python3-dbusmock: update 0.28.4 -> 0.28.6
Date: Tue, 13 Dec 2022 12:11:12 +0100
Message-Id: <20221213111118.149697-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174528

Convert to python_setuptools_build_meta.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...python3-dbusmock_0.28.4.bb => python3-dbusmock_0.28.6.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.28.4.bb => python3-dbusmock_0.28.6.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.28.4.bb b/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-dbusmock_0.28.4.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
index e895d87b7b..dd28f115d1 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.28.4.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "52ad024a44d46602084fd91c0c467ab95b7ecf27c4e2168e0d2160623f18c0a2"
+SRC_URI[sha256sum] = "3b496fab84aff3936054f747e9a22bb07ac5783b1d967c6cc39536c7ba315fce"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+DEPENDS += "python3-setuptools-scm-native"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-dbus \
-- 
2.30.2


