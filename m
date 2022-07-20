Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B4EC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.51646.1658306714913229373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BcyI982z;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id m8so9418832edd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fFQxxUfjY6rQvi7e7vM3OnKJGpKeglql9OaMmoG9ULQ=;
        b=BcyI982zF1ZqI8L0PCeOYk4/XOz8b2673ChZqSLwMK2aw6iP7xCocI3cRq/b5Lx2z0
         RXULalwSURGfSBXpicXH53EswNhn8YWWU6BJTL9L+zn0bMBpbuMTQow0txrNe3shnEkT
         cFBkJtqOOZ0fwpZOlwJltCyZ/X5rLkbhTg+paTNQ2a/oZJtIN2BwyESmvXzuE9UxJqku
         8vmWa3CUDFK7K2Xdc1G7WUcH32d8Re8r5CbHEAbU5C+Bf1L1vlBk1vQ+jGmQvzgNpV4v
         izl6awcWfxqW/3E4LqIS5XmX+84LmgJ69c4wFRUklxcEfIUJKOR/09i2QPfo/OWQewWT
         FD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFQxxUfjY6rQvi7e7vM3OnKJGpKeglql9OaMmoG9ULQ=;
        b=S/wjyBxDBKpsJlBRffAeALgmWoScQGgeGOl+1I/bgi7q5NYo45J6roqwyC/3gEcOY6
         lLJk4gHHCYa40uXd1SB6LIJ5kIA+Bn8VfWKeSOakhx2vWhi/vUOSZWf8LucbxlozC6co
         aYLNOUMR9UUua4OqVQUht+C636eBSKnqTZiVFqbLiM+RkmI4kqrPAnDptOTCFw5Z1kdd
         DWBwe/ZFt+izHS5MdKdSAPtWxhsiVLjzei9oFzjI3/lkI0wiJWhuuJXz/9n1P7fMqWy2
         qHhpGzMqZPTwQ58mkmJnmCXVC2yrNpT1ptRK7/BuAZFu1rRCH6C092s2504SvkAzFcVC
         upfA==
X-Gm-Message-State: AJIora8daZ6oP7pFk2aGacY8vV16y25wl20+yMsvIKXF7IOcrRsPMIwm
	o++ExS7o3OeHUtzQ0npjCRO4zw39RJ8=
X-Google-Smtp-Source: 
 AGRyM1tEr1pFPyo2cxOJFuf75RWRQ8NXk0jcR4U3z+O49AB+R6R0hM1LyFW/j/V3lnKrEz19myD25A==
X-Received: by 2002:aa7:c250:0:b0:43b:25fb:4903 with SMTP id
 y16-20020aa7c250000000b0043b25fb4903mr40269991edo.253.1658306713418;
        Wed, 20 Jul 2022 01:45:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/51] alsa-ucm-conf: upgrade 1.2.7.1 -> 1.2.7.2
Date: Wed, 20 Jul 2022 10:44:15 +0200
Message-Id: <20220720084442.2940187-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168318

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-ucm-conf_1.2.7.1.bb => alsa-ucm-conf_1.2.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.7.1.bb => alsa-ucm-conf_1.2.7.2.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
index 79b8206592..51314f33aa 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.2.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "ac5b2a1275783eff07e1cb34c36c6c5987742679a340037507c04a9dc1d22cac"
+SRC_URI[sha256sum] = "53ef5639c4097b228e8f5cfaa2e7b829d04b5de2dc9a38d54efa8aa350d3f5fd"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.30.2


