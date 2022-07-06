Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED273CCA485
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3655.1657094848544225873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LsUdVPc1;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x10so10871844edd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=INb5NNj/TYr1vczs/6uKnc1lWmwAfQw8bo2JexX0otc=;
        b=LsUdVPc1lQDtubaRFogjdWV4l9Yo2G9lASo+u7PJlV8y66aGSUPEQ/siAU8q0CS4Mg
         kNgHD9d40Oqzy7Zrwj6R6ELyVeLC5Fy5TyEu2YC9NEG+cuGqPeZHZqbddqkVVQCL970a
         lnHlCmlK71cHRTLOY7GKx2SQ5UVGUNYqR2x/PUIZKUZ7leKCbk12HXAXKO20C3OD7WV1
         2MlRIsbFqhVvmAODOniAR1ZUnJHiTaG3XPCl57ADG2yCLrmq2imTg5vJ2525H/Tx0v4O
         SPIWAwbtTTPlLsg+oI/br/kCq630OhbDSbLtF7Li/FGNp2JVBrKdxjS+WYM6Rf0u4Qmm
         FDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=INb5NNj/TYr1vczs/6uKnc1lWmwAfQw8bo2JexX0otc=;
        b=bW/p5jMlftPhk8b71WdEDCDWxPPckCbJsz0P+4wdQPZ09w70dlrTjfjQk1T4llC/Yz
         vm9XZ0nsJiSV9QWtfDG+e8hBb6b0k/hiSI9amzmgIJ+nZ6DST9OaDMZVwPB5Ue6dvsze
         7tyAhfKDWIT9rgzq4hA8zsYX22MRkiNIKkdh84+qb+qwm7JsW8+FcobzkKLW6pdEeXo1
         g59rRLRJl7xK2xENDAsGWGGNaMyBSg6yZScCl9uy1kMIMcUlkrbbmndDqV6USgscVLsQ
         Vsr2yim+boszWByc723rCOGvj4mCAe6Nq2mu3YRzp2YyZdQY77aGDp3NWFGqAmNlA7KR
         jnGw==
X-Gm-Message-State: AJIora8wPoeXevmAQMW6rYY8wm9v9W6633FgOpqbJemcYFPVrGA2ak+3
	HXRnFWxILZXEeATxYypzQB5EsxzjA2oZwQ==
X-Google-Smtp-Source: 
 AGRyM1v1mVb1sX/3Ljgbok7aAXznK1Cvn2bgquYbzXiy004/grrsiQJZfRoDAmH40cm+Mh3K+CI8Lw==
X-Received: by 2002:a05:6402:538d:b0:435:7ca6:a136 with SMTP id
 ew13-20020a056402538d00b004357ca6a136mr53807045edb.268.1657094859769;
        Wed, 06 Jul 2022 01:07:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/27] python3-cryptography: upgrade 37.0.2 -> 37.0.3
Date: Wed,  6 Jul 2022 10:07:09 +0200
Message-Id: <20220706080721.3072553-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167702

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n3-cryptography_37.0.2.bb => python3-cryptography_37.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography_37.0.2.bb => python3-cryptography_37.0.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
index 9ef3a61e9f..53c8ea7477 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "f224ad253cc9cea7568f49077007d2263efa57396a2f2f78114066fd54b5c68e"
+SRC_URI[sha256sum] = "ae430d51c67ac638dfbb42edf56c669ca9c74744f4d225ad11c6f3d355858187"
 
 SRC_URI += "file://run-ptest \
            file://check-memfree.py \
-- 
2.30.2


