Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72BDC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:13 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.29864.1641226752673520272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id 8so30881746qtx.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=iOhKJNWp0mjokhleeCUo5ovvH9Tz+hkvHX1EXrInyJw=;
        b=m+axyc6G7svN7uIoQwEcUFNsQ3+LKUOchMuKmmNPsMe1kPfbIx6ilo574XDywWPZm4
         lbQ3x0wQqSMgMUWW775DqfVdcdYQjL+5ABk2N4Fq6xAcO7L0zmVOH7TKsF3QhHMXsmqY
         zvWBDyu4Ok9EyYHU6Hp0hrmjDSnBbu7f6GJmb46mcZFkvb/jmzfs5V0ABFPGf6N01b37
         gruvbReGB1k93bm++skxyKK+PPZxjz+rKsMTQCx7s31oqmKUaQPym46RUuBq4ZVt1r/K
         MX5GQEifWMKqCll5WUoL4wtEqts2C2nkRk4lb8BVVBal1Ci8vLDBJb2c7Dht9ZvfUB+F
         Oy+g==
X-Gm-Message-State: AOAM5317Be3Sj6bghDkrkMPqF7lCUujmbwGVcOnkCU5mgsE3/G2z+sWv
	lLlBF3HKFp6iphndTB6HTQZ7rOsvXTyu7WCI
X-Google-Smtp-Source: 
 ABdhPJwFKpcOcpt50vQqiRsqGorebVpoirCAPC5I+HOCuZADKZvx9gPU5+nnn0G5tgSz+r7cemjAJg==
X-Received: by 2002:ac8:7caf:: with SMTP id z15mr41432931qtv.20.1641226751641;
        Mon, 03 Jan 2022 08:19:11 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 x16sm28135189qko.15.2022.01.03.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:11 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 02/24] alsa-ucm-conf: upgrade 1.2.6.2 -> 1.2.6.3
Date: Mon,  3 Jan 2022 13:18:32 -0300
Message-Id: <20220103161854.301148-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160119

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../alsa/{alsa-ucm-conf_1.2.6.2.bb => alsa-ucm-conf_1.2.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.6.2.bb => alsa-ucm-conf_1.2.6.3.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.2.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb
index 10860e61a0..a493269063 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.6.3.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "8be24fb9fe789ee2778ae6f32e18e8043fe7f8bc735871e9d17c68a04566a822"
+SRC_URI[sha256sum] = "b8a03aa387a624a2f65edc201bf777421190b60529a92087646823afbd96c5cd"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.34.0


