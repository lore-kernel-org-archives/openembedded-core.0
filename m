Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3D3C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:20:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8209.1662560440200858360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dmUjlRyL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id x1so10356466plv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=9RV1otr5sAmHuqhdJk7DSik1VqqlWDWd6Vyut8qkvVM=;
        b=dmUjlRyLVvQHdF9bck3uhIj4H5rwPMooWvqam7adArEfwIgCEAlVtjmD1rJeX65BYh
         e+dufNc9klbzBPhJrk2C8ioapxK+vA41WWXeKnx4lLysxGZ8JpUN4MOe7cy1LjLM+h/2
         9dq2riBDvGDsRQWcwzT7RoDLCyEz05MTBFa7szfskmgTUmUsdRlypeIjohaUrrFJmQQh
         Cl1uPelZjD/PewHzUhta+VT8pZ/6gk5REJIeRT9kGk3LqslvPmAwxYnCaLoTxQaY1W8M
         rXp6gbrekPJ1v9Mout6dicA0U/Pr8p6o7RdDfSEFj9vVB76bvvbMhL76g9Rs57UdBl97
         AQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9RV1otr5sAmHuqhdJk7DSik1VqqlWDWd6Vyut8qkvVM=;
        b=HZthn+dYionSzj/I3zRaJs5q9Bdmwq5MzgdNTF2i4KsnSztIiBAv+zzJAkMbO+XBuE
         wy+ZGegavVNKjit6a9j098hjBr7l/2veG45qgf9xo310NwwTTxLrScyEhMIkF4mmwJiz
         Xt210sZ3H1l0lnEVL0DERziL5uY8gDg8LyKs3FFESEp9eR0jEb9kMeq6SABX2y4FzGvl
         Z8x9TZfR6uwAFscnFlcco2GXVyIjm6A6twArnK4bF8SQNb4i6zyHs2o+ZAGkp9utDHPK
         mgD79Pujm9dtpLBjYbeCgmeoT5T8pBbUZk8ZnAIKP/+5k0W5CfNVG52PZn8zVRyP0r8P
         vO1w==
X-Gm-Message-State: ACgBeo0l4xibfhUuMw1nQe+/5AlwmhzquthNQLTmwI3U2F/jmFkwlJvI
	FiqAN4xmxyUdu0dEUfAoAbFMC7U8zvvD/wb4
X-Google-Smtp-Source: 
 AA6agR7Tr2VbmU7Q1h1ddrOAx+4DBROq1ekgQRvlUgxzomiildvLYjxxAqGA8TiywsaKJ412X76iow==
X-Received: by 2002:a17:90a:39ca:b0:202:54df:b1a4 with SMTP id
 k10-20020a17090a39ca00b0020254dfb1a4mr1510495pjf.210.1662560452636;
        Wed, 07 Sep 2022 07:20:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/24] libtasn1: upgrade 4.18.0 -> 4.19.0
Date: Wed,  7 Sep 2022 04:20:08 -1000
Message-Id: 
 <005bfa0639724248f2a257cae0108ecd16e7314b.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170402

From: wangmy <wangmy@fujitsu.com>

Changelog:
===========
- Clarify libtasn1.map license.  Closes: #38.
- Fix ETYPE_OK out of bounds read.  Closes: #32.
- Update gnulib files and various maintenance fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b8f2c6ec61ffcc607a35bd5c11f5020c9b676226)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb} (90%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
similarity index 90%
rename from meta/recipes-support/gnutls/libtasn1_4.18.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.19.0.bb
index db49adc1c2..5fb8b54c06 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[sha256sum] = "4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898"
+SRC_URI[sha256sum] = "1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.25.1


