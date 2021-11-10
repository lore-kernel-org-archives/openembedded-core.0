Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C12C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.370.1636573189932728684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K9FsY12F;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2780892wme.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hb/oX+Pc2upkG+Ym68xZmxN/YOdTVTFLrhPEPgabgcI=;
        b=K9FsY12F25sRsAGVoHpcldn+msL2Sm1/FfJ4avQev+ab8cDSQZweqgYmWguJZOy+cJ
         RtporGY6rYVflkpU2062JE6y+lKY1j3OK0OeD7p+n0B0Qx5rDUccJy6KKpa87vr2EN0V
         jueki4xKZKIvyW2e/PTje6mNQ5wYN6mxN7LgWQheoC+WsDB5tAOXSSEcQNS4QqU/vTJS
         wzd0hVvkH8rk6a00ieo8jmjlNJbp+ODd5AY8t6/DW5pFUqD6Gg6WD0GphlP6JvWfxo/l
         jisSzmfOtPX35Yfr5aFBSZRnv2YshF0XpAU6elL6lCVokzvT8LCWSN8wNhF4li9lw2O4
         Q09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hb/oX+Pc2upkG+Ym68xZmxN/YOdTVTFLrhPEPgabgcI=;
        b=b5/hm1v7eeCqXBgAASiPXxQ88fIdM3k7DoDxVEJdXyKJ3wrs53aAnZWcfc8KkrUTst
         LVhG40iRjtWEWZK80dwCBKnjZpGcjbzQAd8D4oTWJ6zIVlNKkwzwQY9P3hNE6BcgX0LR
         mvGiLyMj/f5hm4UypZMFUl6XK8s8J2z0t8CsT2qou1s6zLM352eWLjfvNrWa/PVlzSWx
         2nvBXyeWUdY78/oNI/s9bClC1Av4anJn/pAzBp84mOXsEMzQlEBF5HEZmpUA463+oD9t
         6erG0GmSN0YV3htoYKAvw4dkhMt0/qD2oUM3CWb9HCs1P/uXX/TVrCSHdn5ubCsEqcvp
         rPag==
X-Gm-Message-State: AOAM530zw/OH2Z3MNG/5vL+ymzKnN8G78IgIPCz6pvQXrou4i435pAPz
	HHOwOrSKauNWK3Hk9+66NbPit1Jhs4I=
X-Google-Smtp-Source: 
 ABdhPJzv0vQKnOvWRcHZSYhjQh6tTbBA7QIbbg4IlNfL1a6wUp3cQs0U36Ajv9TIRrV1KUtBB96ThQ==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr1941187wmh.86.1636573188505;
        Wed, 10 Nov 2021 11:39:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/24] python3-hypothesis: upgrade 6.24.0 -> 6.24.2
Date: Wed, 10 Nov 2021 20:39:23 +0100
Message-Id: <20211110193937.2606747-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158094

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ython3-hypothesis_6.24.0.bb => python3-hypothesis_6.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.24.0.bb => python3-hypothesis_6.24.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.24.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.24.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.24.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.24.2.bb
index 50f7e01061..ef45ddb6c6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.24.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.24.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "ef53bd1c4756436be2e8d4a2e16f6f5ffbca7acbe8041e6872aea16176ff3806"
+SRC_URI[sha256sum] = "4030f88ae0a8d3339a41dd7589c78d3ba0a3a270f729c12aceddaea7c60b224b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.20.1


