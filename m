Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC0ECCA489
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.51614.1658306698678729601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mBaouoE4;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ss3so31737885ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JeyxirkoTDKFZUGvy+u4/m/CaznbgJW+FOoi1vTZGR4=;
        b=mBaouoE4CkD2SHF6uCuAkHiOPnHsHjE6WFG62SvepJJYhVuJ/jsc/Z+utmxw2wm7y+
         IfTDEHMWSGcCrGP7A8Sj5iBr9rC8M1cvFOAW7XopShC+SN1S/BlURerAzuruiy9aWFya
         DLHZPYmF4dPdR24Fa8jYCIt+zbGP/GiIIqUHnKGDr7+Wfh4MywyPlnyWWuhhIislHf2y
         Pxg46jN4+pQE/mlS1o+HoTTEeReBMM7OCr8CrTODXGeHIdi9Uj9I8pH54H7I3xFZr5cQ
         DXqsEOU/qtwH4fW8Srl8LSVVayL9JXNanOq2TlrG7gbsTgjwYbaZ6BOv2gnkJytMJ1nZ
         qEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JeyxirkoTDKFZUGvy+u4/m/CaznbgJW+FOoi1vTZGR4=;
        b=i7iiUVGGO3VeFtU9NfG2iB2CcILniXYN9weU3VOJPX8ihqzlzGI/JAoSgVFQWJtoUs
         E63bdFr/Sib68sI8tQmGSR+QtETWgU1TvS89Aubt4xDdmTCeagvxBZVXbF8FFa0jhlA8
         itCteCqDV/+qdjv4Etk8TTsjTMfZYSDTg21iIAZuvvtlv30eP3Dv5vqmzxh2zTio3mwd
         iQpMdEEvb2OWRdaMWRD4d/3zCu4RIS2dFVcWGh0nd23Ax03orIoz2cOUJ6xjI9F8tCow
         86MVIIXTyEerW3QJLm4RiPGAjc/Ox1aiGVBcyQCxA7wJvywUH2+SD34m3TohMsAlJqVO
         o0bw==
X-Gm-Message-State: AJIora9FCs1FOurPmIIe615FfGHj2v2Uw5+9IzMPbL3YuYbBWZL2fxrc
	eNg1xPZfFYoSrkqNaGkh4aBPYIutV+s=
X-Google-Smtp-Source: 
 AGRyM1vVPsieTJGKn42ucekXcyqhlCAfg5FerSMA96BN123+RpgzztqFX6xwIwsyUALANXoDNj86nw==
X-Received: by 2002:a17:907:3d90:b0:72f:2994:74a1 with SMTP id
 he16-20020a1709073d9000b0072f299474a1mr14686006ejc.261.1658306726302;
        Wed, 20 Jul 2022 01:45:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/51] mpg123: upgrade 1.30.0 -> 1.30.1
Date: Wed, 20 Jul 2022 10:44:28 +0200
Message-Id: <20220720084442.2940187-37-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/168330

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mpg123/{mpg123_1.30.0.bb => mpg123_1.30.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.30.0.bb => mpg123_1.30.1.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
index f80bfa6550..502d9d114c 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.30.1.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "397ead52f0299475f2cefd38c3835977193fd9b1db6593680346c4e9109ed61c"
+SRC_URI[sha256sum] = "1b20c9c751bea9be556749bd7f97cf580f52ed11f2540756e9af26ae036e4c59"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


