Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDBDC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.3034.1639000809437561718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FQ34u1M6;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id a9so6484699wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OxVnbTZXyC5fqOUF4CvMQD7CTy0I2VrMntW24XgiAmI=;
        b=FQ34u1M6oTjp25wInc4iSnoXEoE4NQ1GOBytouhbzfOo4S7lhKnxzKXl7Jpl6FUFW9
         Ym5+wdL0l3AcO4vqr3qAaLP3gsya09D0X/MmbQlwgWj6l9wDCrH/i2qCIN9L19fgCFIg
         WdbGbCJHvBCXoLF7DW2NofcZWqvaqvFr023HYNBqVdWOW5Y53ZeD/I+OVbOsvxdzqujt
         cGuyFP+Tj2Pb9Zbv4x9F6vpVInl2jC2+825S8S5zfrpPdfibSwPq7Q8vOA8LoNf+XARB
         4BTIZIz4KmcswignJ8bg6cOxOm0Otj4XUDbZxMYaI0oMw7Ty5/LqC3cNq1zvc77fb835
         dDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OxVnbTZXyC5fqOUF4CvMQD7CTy0I2VrMntW24XgiAmI=;
        b=XrjGBYm+xON5l9t7weCvO4KPop13ZPA+FyW3SxybLDROuimGpXCZEgOydiHlWX2JHR
         Z+ZdvAHM3EgaW/FjCIwdeJWEX0gjPuZ4VRn4+BoIH2enw5S5JHzR4hsqdfi8ne33Cu0j
         Dw4nTvlAfak8FP3F82aHcTxNtwzLSfRuVFu0+rOm/MHmywmspYPnN6JCHbs7EsIGOW+h
         0Q6l5KgDFrJvyCB05mU3XboMQz/02+eNwp+RqOcT2LQB86ArsULpCmtiGLkMYO6JWMHh
         rVEaRoE0mZzUDdywY95uspA5/3qZioiU/tcYMkNBdYmcVDA9XHoAKqEmoxiCai7cB3SR
         4b1g==
X-Gm-Message-State: AOAM5320KQq8Ibr0tITDLquTpFlJWMv7w1LEFdsrhsGOwuxEL+ICl4AY
	uPLwv2Hdmdy53+P7uCgjKRXo6RKLQCyePg==
X-Google-Smtp-Source: 
 ABdhPJx52PwyGwM0bi1tgbF06Yd+xY8R37fGPWxhkXlXSlgLj7Zs6LR/P71yQs1XnLg3UFiIOSdogQ==
X-Received: by 2002:adf:b34f:: with SMTP id k15mr1616430wrd.125.1639000808000;
        Wed, 08 Dec 2021 14:00:08 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/29] python3-ruamel-yaml: upgrade 0.17.16 -> 0.17.17
Date: Wed,  8 Dec 2021 22:59:34 +0100
Message-Id: <20211208215947.1979470-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159382

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...n3-ruamel-yaml_0.17.16.bb => python3-ruamel-yaml_0.17.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.16.bb => python3-ruamel-yaml_0.17.17.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.17.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.17.bb
index 35c79c4005..4eb0274166 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.17.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1a771fc92d3823682b7f0893ad56cb5a5c87c48e62b5399d6f42c8759a583b33"
+SRC_URI[sha256sum] = "9751de4cbb57d4bfbf8fc394e125ed4a2f170fbff3dc3d78abf50be85924f8be"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.20.1


