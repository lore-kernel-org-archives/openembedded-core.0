Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55357C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.11521.1634657688083022824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FqsCAbj2;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id o24so5061829wms.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2HDQDfO59RmSUZQZfp8EBM/oxPHThS+tvIQbomGqOMQ=;
        b=FqsCAbj2KKF0oJu3jGlJ5lXrpB/YPfxGVw/Kj5FHvuWlLBi+/GeGj8gkvlefdn2kRn
         bK3NHByEZy/R/aYEsImyxh3gCi2h1c54I0ETJ6ltNbvvHgufkqGt4SwoXL3AFZR1y/uf
         rEfCAL8rIZJ4zr+ZL34S9ZZiFf2bMsHUwpLAIe/KyZ+YjrUQsusR/gQ/Fh3f0eLz+oLk
         EkzBRFpe1tdHuBoXl4PYD2Jxew0pIQOyabO328Akz7BmYiV1Iku0PBWdEZvlRI6LD0d/
         VP82bQZfzXJhtZjfYB26JWImvTW7Cf7kUwrh/IAE+rNSeB6jPGMqw+bDWLIvNtEknyVB
         yuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2HDQDfO59RmSUZQZfp8EBM/oxPHThS+tvIQbomGqOMQ=;
        b=KaWmYB1twwsVJOc/1Ubxm6K1WNHqd67Y9Fc/WlTbjgUpm+nRezvvUF3Hb8FPO96GMc
         4ki5gsCoel+Wj0RwP2CzPzy1QJWT5futBgzeDxWGF17PwuTrz5GSTUUn1IBAj3evJgfi
         O3AAVgx8TIccBjn/mmbIYPsos2BIE2EocjhkJnt4Yq3PBxb0Guy+W+Z2x61qQJormmdP
         fntf3x005miasdPxon7A+0kR54wM1IOoqyoq+Kv9jWzBYbEePfrMzjTA15bMXP6APeh1
         yDGWIxZRIXnawEYKfm9gn9UCpBFMGhCDuDbPv+4zHpSQr84/zWOEi0z7nHe96LrhAc54
         Q6Cw==
X-Gm-Message-State: AOAM531SRIFueGDcHfl3q+S2gm1jSREKApLuV/DAv/qzBmSfE1lzj7jJ
	VQZWC78iMG8EqGB5IIQvZ5MWAfiXipA=
X-Google-Smtp-Source: 
 ABdhPJx3LcCMAUohbcxf6JjEWBH1IRAqaGkA2sD5Pa9f+qItwRiig2CtwKweiNGFzjF0Qc+EbpBD2Q==
X-Received: by 2002:a05:600c:3223:: with SMTP id
 r35mr6750266wmp.32.1634657686681;
        Tue, 19 Oct 2021 08:34:46 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/65] libedit: upgrade 20210714-3.1 -> 20210910-3.1
Date: Tue, 19 Oct 2021 17:33:46 +0200
Message-Id: <20211019153419.3319802-32-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157151

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libedit_20210714-3.1.bb => libedit_20210910-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20210714-3.1.bb => libedit_20210910-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
index 8d68d6874a..5aa83ef246 100644
--- a/meta/recipes-devtools/libedit/libedit_20210714-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "3023b498ad593fd7745ae3b20abad546de506b67b8fbb5579637ca69ab82dbc9"
+SRC_URI[sha256sum] = "6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1


