Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0604C41513
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:29 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.11719.1690052244495776132
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=epk3Po18;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-668730696a4so1737876b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052243; x=1690657043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfZvbTN2GEkAPZmswqhMqXRInWgAGIds9257sx+T6xw=;
        b=epk3Po181cAc20nZx2PP4cWeoQYAvCt0+auOJmWVP4gB65leyBukblsy3gSS+r+Dig
         aZvZAuzJcUGX22b5oSvv1GH3+0dJbrb4wpqE4MvcMDKnrcECoDsspMCVnLOKaEftl95F
         GxESD1JnoAgFCVO86T8YDKQkj1qK7GfuZQmcxbWpEb6Ey1hv7htXEUrBlfsAlREbAcf2
         OSH8k8uN7Mhet1Iz1q7RjH6Zpdx36bjxud7qCisnTeCvV4/PxBD4NMVJkOkv2C/hHb8z
         gQTAf7HVqPzFpzzFLdTWazgfmTORU9/e4YvLYQXcM8hEb1Wbi7BFFwIDuiK3fJ8VSGnw
         IQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052243; x=1690657043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfZvbTN2GEkAPZmswqhMqXRInWgAGIds9257sx+T6xw=;
        b=Cddh1i1gBbM48QM9eTXX5D6/TpJRB1rfN9Vgj8kupoH2vYhe9gBYQNyXgzwmKytxbG
         NpBDx+iccjR5oKs+riroi54nBJkHt84nQja4k9I4Nt5fQPtUk+xmqWUkDFk11Uj+DBSU
         N95E5SGl7pRjXL5stSHus1CmuiALm8jlroGgB7cwHSVbPDIhRykBHY8SnH1ls4eKeza6
         3WMbChQvKzzwwkRRbvaTb81e2bgJU4w/ApuJJz6dPIGipx6fMJr+Ekt1wAwZuf18KG4O
         q5X9T1cbZbXpj/xuEIINRb9ecXBuj0+3RkQNHP1qczZlzzZBMfsHnjC3WEnX37kw04Ft
         VrCw==
X-Gm-Message-State: ABy/qLb4sWxWtQ4B2Ih+cmd7eQa4OsGyiUrJU7WqUgujyOQVsDyCMA+I
	TEKghyTcthuYx6bY1agDUr9SFR4+77Sy60UlFZs=
X-Google-Smtp-Source: APBJJlH3shv7JuoOPJuWbe6hdbt6XiSsedLY48daFjduxNkCBYAB7GTnlwf8hfnhjXqjoKlzFARuOw==
X-Received: by 2002:a05:6a00:2347:b0:668:7e84:32e6 with SMTP id j7-20020a056a00234700b006687e8432e6mr2863231pfj.29.1690052243637;
        Sat, 22 Jul 2023 11:57:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/11] acpica: Update SRC_URI
Date: Sat, 22 Jul 2023 08:56:55 -1000
Message-Id: <4724b382d183a2b3b8426c77c23b368f509411e7.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184734

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI to fix the do_fetch warning.
 $ wget https://acpica.org/sites/acpica/files/acpica-unix-20220331.tar.gz
--2023-07-19 02:45:33--  https://acpica.org/sites/acpica/files/acpica-unix-20220331.tar.gz
Resolving acpica.org... 20.29.206.128
Connecting to acpica.org|20.29.206.128|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html [following]
--2023-07-19 02:45:33--  https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html
Resolving www.intel.com... 23.72.14.54
Connecting to www.intel.com|23.72.14.54|:443... connected.
HTTP request sent, awaiting response... 403 Forbidden
2023-07-19 02:45:34 ERROR 403: Forbidden.

 $ wget https://downloadmirror.intel.com/774879/acpica-unix-20220331.tar.gz
--2023-07-19 02:46:04--  https://downloadmirror.intel.com/774879/acpica-unix-20220331.tar.gz
Resolving downloadmirror.intel.com... 18.164.154.85, 18.164.154.5, 18.164.154.74, ...
Connecting to downloadmirror.intel.com|18.164.154.85|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1911044 (1.8M) [application/gzip]
Saving to: ‘acpica-unix-20220331.tar.gz’

acpica-unix-20220331.tar.gz           100%[=========================================================================>]   1.82M  1.61MB/s    in 1.1s

2023-07-19 02:46:06 (1.61 MB/s) - ‘acpica-unix-20220331.tar.gz’ saved [1911044/1911044]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/acpica/acpica_20220331.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20220331.bb b/meta/recipes-extended/acpica/acpica_20220331.bb
index 2c554f863a..73b9154ee7 100644
--- a/meta/recipes-extended/acpica/acpica_20220331.bb
+++ b/meta/recipes-extended/acpica/acpica_20220331.bb
@@ -16,7 +16,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+SRC_URI = "https://downloadmirror.intel.com/774879/acpica-unix-${PV}.tar.gz"
 SRC_URI[sha256sum] = "acaff68b14f1e0804ebbfc4b97268a4ccbefcfa053b02ed9924f2b14d8a98e21"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
-- 
2.34.1


