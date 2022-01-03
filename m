Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F49C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:52 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.30362.1641226792425960232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id r139so30829642qke.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=eub1oMoRCz1qMeRnecW4A2qmSZcynxIt50GRfR4/7ZI=;
        b=dHNPjctut8Kl6SklAF7SdRUqus2TSSbKVxYEchZEIgajCplOjmFjBBd0KLYqQE+KOk
         tjvdkXeq8jdnI8fsrLPH7p7WvXRRncAgxyspKP5xWT7JrZdAVvGDmj1DekEfHq9CEfh8
         +lUcMygqGqHzyi6KljEIjOCmL/fRIUwbFUHVgsh7JgoJ8byW4Vjin6x2ZZSwvXas8Nqi
         Vcsg0/EPyLpkpSjSi+GM2K2/nn4CAW2Q73efaAfJw7+q60losi4+zpc7lP08VV5IqWw8
         GmerHaVQl5TJVHbtxbB+Ghp7tYULR4L9UcVYKF8DZjX3RCSdPKpalBd9VBDE3GdOwxXF
         hCRA==
X-Gm-Message-State: AOAM532+U87jkgpjpADC4wT9BF7ralCAYeZd+qCZHSMEGiJAMXa0C2yO
	tWvGLyoiTwqXziQfN0HcfYMgc07lhiPnkwNK
X-Google-Smtp-Source: 
 ABdhPJy4/K22Z07PbicB95QKqu4n9VacYxc2rEOPR62T5CBlj8sYBpZdpBHjePeX7wW34v6D+CxB1g==
X-Received: by 2002:a05:620a:424c:: with SMTP id
 w12mr32899322qko.62.1641226791298;
        Mon, 03 Jan 2022 08:19:51 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 x14sm9483170qko.110.2022.01.03.08.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:50 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 15/24] python3-dtschema: upgrade 2021.10 -> 2021.12
Date: Mon,  3 Jan 2022 13:18:45 -0300
Message-Id: <20220103161854.301148-15-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160132

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...python3-dtschema_2021.10.bb => python3-dtschema_2021.12.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2021.10.bb => python3-dtschema_2021.12.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb b/meta/recipes-devtools/python/python3-dtschema_2021.12.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-dtschema_2021.10.bb
rename to meta/recipes-devtools/python/python3-dtschema_2021.12.bb
index 627aed496f..34d0bf61b3 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2021.10.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2021.12.bb
@@ -7,8 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[md5sum] = "d2f0d847ba2ad4d223317ef7304342b0"
-SRC_URI[sha256sum] = "d09c94d13f46e6674ba11ff31220651ad1b02dae860f5a87905dfac6b8d768d9"
+SRC_URI[sha256sum] = "f68af77fbce1ae00015c1fd2809fd20db8b72a27105c26a20e1ac0203aee1739"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.34.0


