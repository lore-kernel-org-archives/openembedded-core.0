Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15258CCA485
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:52 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.3745.1657094864933943894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lDZefx3x;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id u15so1221934ejx.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQ3HhmLdKbzih2B3BTidLWCJcOIZGmUHIDElk2EkOS8=;
        b=lDZefx3xAieHILXgqeg9t2bdl4H6+C4qXN3pl7ZY3fzUV2A0/YpudcOKrCjl1ghSSP
         CO4vufNbng+3bsC0BAH4hIE2RNcllbn0BzDfkqI/yyPW7uDJc+9OeHUP99xxcZoxKSWT
         kcB83j7SFCy79xtp6zqZN4/rfhuExy+VeUcMPk1HgtZ3EGP7QbTgbBWqDcBrK9rmkwTe
         tHVLGZkb3qQYLDQEcOxns/XnmW3tvx8Z9/xNOgfPi9wdIOWUy7Q2naPGaNgE/ymxEJcm
         thARZgKk/Z/CKJEQLcR2xo/IOCm46Fx3oHal8PvGMCOR/OlLDJ0Rv43b+YE5KSWaOGN1
         Vsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQ3HhmLdKbzih2B3BTidLWCJcOIZGmUHIDElk2EkOS8=;
        b=aY0+KkY1bL8WNAmsVGG0DYZLrKgthsmZ82FdL5gBMZ22Ce/ScFtk0plyfLRE5K0AFF
         D1ADSbrw0tGULXw8MpPrcrVeTauxcYdwIYxCdApLFkSsuMmGb8i+cXqf1zCoCZvD5Aok
         H06CvDBDhqNlS4ocyj56hM/+NNTf3fbVCundoNE38pQp/C3swg0TRF7Pm8bT6eBePPm/
         nKdaDt76P752JaXkcRM6OZN7QEmrCnWWivUEE/b8u5bDDppc01vS1MF1oBS9FxKmfuFd
         tH1KwybgGNwX+v3CnHKmsxCOD5ct4ey0kj7eIPHlfLh/sfM0QZt3TK87e9hl5lGGiAjo
         Kwtw==
X-Gm-Message-State: AJIora+hq/+guoqTv9aU3Ok0hJ1r5o7yxVcfHvl6Z1Bsde1qkQ5texMa
	IRFAwBUdjCSXToiPOXO/AUQR0HkClXALhg==
X-Google-Smtp-Source: 
 AGRyM1t+/2u+rpfBrAzs2/u+k73pbLvfDJnsw0uB3ms1JvKHWdZ+lJwTZrLSR/vR69JIMk4usXvLjA==
X-Received: by 2002:a17:906:9451:b0:726:93a8:bcc with SMTP id
 z17-20020a170906945100b0072693a80bccmr36800353ejx.361.1657094863166;
        Wed, 06 Jul 2022 01:07:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/27] python3-hypothesis: upgrade 6.46.11 -> 6.48.2
Date: Wed,  6 Jul 2022 10:07:12 +0200
Message-Id: <20220706080721.3072553-18-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/167705

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...thon3-hypothesis_6.46.11.bb => python3-hypothesis_6.48.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.11.bb => python3-hypothesis_6.48.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb b/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
index 1d9772d4ff..9e74e2c1cd 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.48.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
+SRC_URI[sha256sum] = "ef548f10438095678af7fcfa369b882390355a6329db73174a65749b677677ec"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


