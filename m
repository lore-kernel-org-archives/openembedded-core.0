Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E815BCCA482
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.3743.1657094855969774372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cUAu+TbF;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id sb34so25608526ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l/WZUH/Okoj/jQZ9wcmdAoAKFC/GYHHeeXNH0krn58g=;
        b=cUAu+TbFzs52NCQI18Wxelx+2sWcXepZ3Njg1AROoOVO1ymbntT3wF62UK+t9Pas9y
         nFOWAu3mGa1Qrbuzi4pSQead5XcVlROmPzBfpm6Ip/593LunrNV6CfmTya2NfP7In4TP
         a9w7QXL0s5EIK3eudDwJJEQDxIpOmIGaCGIXKl6q/b9NHdt1HtOb0tOXFhe1cQM4XXsU
         h2cLz8egc03NedCfvlRq7y/dgCM9c32j88cIUgelQrPiIaWdxn4VAfuioEpMuQkvSGzU
         ZrRZO8PTiQvhUtS7EV87STRxM/1yHJaFsXgbsLgrUJ/8LcxMSFST+3eF0cw021xwAnk3
         x0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l/WZUH/Okoj/jQZ9wcmdAoAKFC/GYHHeeXNH0krn58g=;
        b=3n3Q4844wcme6Siz5EyFto856qeOapRZnBFAqcjpQ7pAMEYIa42vv2HdJowZwZLPVW
         jcVQvuf2uFtEwYUQNxXNoYMI6TLpNX3OtHf3T+RsCxkUNzQn92W/Ls+hywtCkiDK4CVw
         3/DRUJSODnLFE21magmXbyetCk7FIXuIcP6yrxZrxJIIuKZsu024lJzf2MzDRywAyuPd
         ePY/13S/kaujuwhd9PfVz9SV0bboiWIvC7/9K+2hRAN7N5m+hD2CBDY8sNm2ZNZDNEsX
         sLpSk5UMNk98/8w+VGqt7tlxK9AsqACpsR2SVs6k2P9JjubJlEF6APKBCu61c6o+g2Z4
         EjwQ==
X-Gm-Message-State: AJIora8JzdAv7j5TxeMDHJmNKc+cnwe6tZnTzpi8Vx9gDghdqWlLKZdm
	6fUSiI9UaId+RIXfP82CU6y66OcZK1cViA==
X-Google-Smtp-Source: 
 AGRyM1saTZ1z3pJbl+y6/5h3eHqxUbrubC+9ralxTasTjdkVz9zg9lnHkAN4TDggqoNHix8lwsN9SQ==
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr38656154ejh.720.1657094854516;
        Wed, 06 Jul 2022 01:07:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/27] mpg123: upgrade 1.29.3 -> 1.30.0
Date: Wed,  6 Jul 2022 10:07:04 +0200
Message-Id: <20220706080721.3072553-10-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/167697

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mpg123/{mpg123_1.29.3.bb => mpg123_1.30.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.29.3.bb => mpg123_1.30.0.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb
index 0baa7aa4a1..f80bfa6550 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.30.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "963885d8cc77262f28b77187c7d189e32195e64244de2530b798ddf32183e847"
+SRC_URI[sha256sum] = "397ead52f0299475f2cefd38c3835977193fd9b1db6593680346c4e9109ed61c"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


