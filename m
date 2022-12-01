Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03CBC4708D
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:52 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.46615.1669908345045663368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TSLtyNc1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id b11so2181904pjp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPOnO1FfISBXbUDAJ+IoLb1CN10Psf2/InEhTnxQDq4=;
        b=TSLtyNc1w7W71B0CKm1AbIMm7uSgSIBgJQkKvXuTrbiYtZ0mmtTl5jgQn1HEBMGH42
         LCN23dvrkoVVRKI7qoOcAcMUu+0bAJNLHIXOz2f6cXaV6TTga0lNYoCLuNrqeC8bKtRT
         2Kqc5fDKp3K44GBTJo/upqfC5U4sahDn/uBsf1Xu1MLbuuD5Ceouv8wfp/EIAWvSyguN
         dG/5NsuLl90D6hg4aUqwgAkw7P6adSSe62s31mu/yT4e6DTqXxLwrB/YVIaEcWNTX9/1
         wuqtMoSDwxR/660U8EtmRr79lEfUH15Fl7b74A3VcUQlZ2NXAY2cXaHjzhfK/VzZbyQu
         vNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPOnO1FfISBXbUDAJ+IoLb1CN10Psf2/InEhTnxQDq4=;
        b=aBuIoeH5IM1eKU4662aSLkITsp4zWJv7PJaXvW5Tl7Vh4ZwSGY9wzgGjaZSo124Eig
         WINB5BfS79TvOPu0kkICDKxaFWx6VevFU7zroQdrePyfJd5eCEUMV8AK3PnxEc65NHMZ
         6fUlsrqswieCkrzXgiCP2UVnfmk93S8x7X18sRFkxMI04DbS2cA+6U2zy2DlOOatWu6l
         X66+GIzvCM8oMMx3MnuIaiDYuhwygo2QtbSSTt+WQodLHjGy/oQIhy3EwXyWR4j24jzQ
         7OF8RJ51t7r+qH2YcO2T5oEYOGKJytuJW0cPUJqwOtgxgLdbMzCnpbs1n8Si7Vr+lMjI
         m+MA==
X-Gm-Message-State: ANoB5pn+RVcRZw1pMpgyzhNe7oGLV/vIKAFIvbIa/VSSJh+LGWXaglXm
	ievHgKVHUb2zXnbD2P1iAqY2/lkZ2WVoEDshR8Q=
X-Google-Smtp-Source: AA0mqf6hc/CnxQa2mEg6Z04U9w8W96fDjJKk4aMDZcLfLtzjO10lQ+cBUiPTDzhcRWQ5IyKbJMGgUQ==
X-Received: by 2002:a17:903:2112:b0:183:9254:cc70 with SMTP id o18-20020a170903211200b001839254cc70mr49052157ple.18.1669908344053;
        Thu, 01 Dec 2022 07:25:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] mobile-broadband-provider-info: upgrade 20220725 -> 20221107
Date: Thu,  1 Dec 2022 05:25:19 -1000
Message-Id: <13b1c5ed032951f9ad11f226850320ed0ae623f8.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669908167.git.steve@sakoman.com>
References: <cover.1669908167.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174118

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7e12fa1e6250fc358ba159a6b626458d871f7ccf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 2cc92b7b47..e802bcee18 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "fe19892a8168bf19d81e3bc4ee319bf7f9f058f5"
-PV = "20220725"
+SRCREV = "22a5de3ef637990ce03141f786fbdb327e9c5a3f"
+PV = "20221107"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.25.1


