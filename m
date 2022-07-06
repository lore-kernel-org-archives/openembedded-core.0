Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F5BCCA47C
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:52 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.3746.1657094868202826245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j7P8jFnr;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id r18so18202369edb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BaPg0TbLG5cHe01rhX6SSer+UcXpMQGFaKKaaqWNafM=;
        b=j7P8jFnrEEvMY4wAFFpmuBjEoofIrvh0vZMSSXCJkGJHA0Bkpyusff3On4j6gIQVwE
         U/NAVZzsav2RRZxGXe4XdQWtBFwMcW1eU9s9NnskZCRDAyGkh1k31SmxHbzqXWBDM+8/
         wvjQ621erVhaewDyY5J5iCGsu0RtMphPZkHCMBMT/2c/BapQtr70JQ+olJRetg+UDDAi
         pFuaIH/8+9KdV8beKqn+kDnmsCaRayHAgKBnLWPz/m82X04CtWMTMSpf+qW16QDgX9Cn
         opoeNrbKs44IxMG6frgnZ/3YkIocgTa+FQxDKWIXdYpTOqjOgTCnk/l5fYFxDiz0HkdG
         v3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BaPg0TbLG5cHe01rhX6SSer+UcXpMQGFaKKaaqWNafM=;
        b=HN7i20Aku1lsjSI4fk2aiunbvuAOqZT2Md4yJZq3flc65tkwTtDJR20QJp/3quZY35
         gpoLbU4gev/zpP5efQadUZeEZK6pJMuQ2kYlL5PJI1lwC1i3OzKnyNIaH6zh7QjQJhH6
         HliVayYYih2JKnJ5xOAjN8xJP3hUmr3kOgm+Wh+k5W/LNVR/2EsMlURdeehsiO+jcojk
         tZlnXLru5xhyOq1Rl2j4Nd7GBapgOGl3vAqCK15Q04NQOu6RzpgHorjfm5vbYyh0iypQ
         GxyXDUiclMJ+m+TTzR0f8/JReaE8hALKNsd7itINtUKqlJJy9LqvP4CppAr+BHGtuAG7
         oUyg==
X-Gm-Message-State: AJIora80J3GMxpzpJpIqbEcXedL+SP7qcO0zm7UPvLmnx+g58nnHM/Zf
	4l5kKbJqkcspoJm2EQRviWmabXCZd3PXPw==
X-Google-Smtp-Source: 
 AGRyM1v1uMKFYR30OmgnCApYtQxQhsonB8+ptaG35VU7bFWLryyESAZefIBqrQDcEeWqwfJwG0MNnw==
X-Received: by 2002:a05:6402:2753:b0:431:9c8b:5635 with SMTP id
 z19-20020a056402275300b004319c8b5635mr51043209edd.152.1657094866814;
        Wed, 06 Jul 2022 01:07:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/27] python3-pycryptodomex: upgrade 3.14.1 -> 3.15.0
Date: Wed,  6 Jul 2022 10:07:15 +0200
Message-Id: <20220706080721.3072553-21-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/167708

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-pycryptodomex_3.14.1.bb => python3-pycryptodomex_3.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.14.1.bb => python3-pycryptodomex_3.15.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
index 79a3fee19c..e22ce30833 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.14.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.15.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "2ce76ed0081fd6ac8c74edc75b9d14eca2064173af79843c24fa62573263c1f2"
+SRC_URI[sha256sum] = "7341f1bb2dadb0d1a0047f34c3a58208a92423cdbd3244d998e4b28df5eac0ed"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.30.2


