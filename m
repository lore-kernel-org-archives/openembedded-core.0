Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EB5CCA483
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:52 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.3659.1657094865831250598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kd/TAxNr;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id m16so2733450edb.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACWawij8WkMYkiitDqq8griZKDxmn1D+cezmAVIbvE8=;
        b=kd/TAxNr9VL1kG+s2BTxZ7aLACXF7QCcNC+Q/F0MZrfJGV74hfAAbZBEnACZLxeD03
         vuG4TouK8QXAWTJR+7QV9ozCbmACE2gCaQN3mCkuJNMqvvhHvenAad8s6dbuXkhBZmZ2
         BFF143iW7gMC8aSHKo4Ks4P6p1P0e4i9NPu9eVztct/j/FQygNVU+lD1auwDDDQiR5O1
         mZMKWewDIBqPl8uMB/m+hBZUH+rk3i/oUrdvr7gFBr54jXVD8KAdLSj/HxctLcUFXWAq
         F7Zak1N40kKFLxpJ1NTTO9WMBU/N2snQkg9tO1UIN7jkYBPZ6SIG4CjZlIQdLoOY/uYP
         xgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACWawij8WkMYkiitDqq8griZKDxmn1D+cezmAVIbvE8=;
        b=Fp+T4riNStBmbUAUI4EEnjSr6Pf1dFEnPuH5bN9wCpWqL9TFb8ZTHYS6FuHGDAdpha
         JPOY7Hbdbb1dWm/ah0/qkeJNRSFo0bLNzawvKRn4/3W6t+VeMaEhtm/MAAQfDGw/1+/C
         pB92Q5KYaurW3Wr4+qJXAA6YboTc2Sj1FL2PgeMvi3IKs5A/CQIYmnzDc2d44f4gSIRV
         unb+foxGUy6K9BMnRebSsiRTMAqwZh5Sqd8o7M0RPxWgApykquNj1liaA7rSF/yIWuUS
         GmvDqyokJ+X2lkQvrEyF/+Yi203P8tB9UDXHoX3tVAGfmMvpMe0q4E3fkfCoBhj4y1rq
         ddgg==
X-Gm-Message-State: AJIora9shmw5mBQpAxpzumHb5YAjYiTWXznpJSgWDS+rWvbySILSITpO
	doXI1oQ2E/m+58PRZlDYpRZcV5Ov68LoUA==
X-Google-Smtp-Source: 
 AGRyM1vCKYHkuvi0476yZ94Hj7e/DLFibW2XuVA8WyHMJzgHPyEo9KQ9TXKguasiHCAx/H7BmRMtwg==
X-Received: by 2002:a05:6402:42d5:b0:433:1727:b31c with SMTP id
 i21-20020a05640242d500b004331727b31cmr43905314edc.9.1657094867822;
        Wed, 06 Jul 2022 01:07:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/27] python3-requests: upgrade 2.28.0 -> 2.28.1
Date: Wed,  6 Jul 2022 10:07:16 +0200
Message-Id: <20220706080721.3072553-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167709

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-requests_2.28.0.bb => python3-requests_2.28.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.28.0.bb => python3-requests_2.28.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.28.0.bb b/meta/recipes-devtools/python/python3-requests_2.28.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-requests_2.28.0.bb
rename to meta/recipes-devtools/python/python3-requests_2.28.1.bb
index f71763565d..ac8a570160 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "d568723a7ebd25875d8d1eaf5dfa068cd2fc8194b2e483d7b1f7c81918dbec6b"
+SRC_URI[sha256sum] = "7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983"
 
 inherit pypi setuptools3
 
-- 
2.30.2


