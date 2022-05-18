Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6470AC433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:46 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.3493.1652871542424809652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PZEekvOO;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id f9so3130684ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xGbK6pqu7+Dlf1MT0JZEA7wBYzqoB0b42OVT9a6LS5E=;
        b=PZEekvOOC0tuR1Fju5zYiJBs8qdN+epSYVHMAWPWx29R2cLHbE8PI+POxrzsu3b0pF
         Fvn6fcGJeLd8xhORuPrsTTKrlHMZmAE72g5gZbvAUbUbYHwWgoT/FWSYZdPdmFTuBMJR
         e13TE0Uea1wSdVtiXAVtFmV6Mxo/EWZD+I3sapEiETKVkLTUTnEFM7l+pztdWP50UHZL
         iCJ0CM8zf+ZvKvUqEArgvtzPWcYepK7IlF8lYnLNJTmeCLa7d0YgHORYfAfhq5bMIEps
         4WReKljkflAyW+1Pw071pfEVaNwoyPDR7JMcimt2abxR5DGEZd07g81zZBho/qfYGBa7
         lZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xGbK6pqu7+Dlf1MT0JZEA7wBYzqoB0b42OVT9a6LS5E=;
        b=C/40pBmkHb70d6qtWuyctlseBEFa14NihDlsDMnO+SoEzdKwlkdaYRzrlkP1J0+sqz
         NNas5X/TfOlMdMbZaAuZFnSI5S4hC8U4JJAL+lDTJ9UqkFp5LTNTkOlFiR5Wvz+I5VX6
         K+hc4XEdf0eUv9r5VthemDjTBukeG02/Tm73l1KWLiCYfrFQuuqeY+egp4hbfE5nXW/N
         3Kmb9e3PIP49QzPuXPMzWQK4smy0Wj68GwuejBoNRHftm+A0qnoQVZGBS2F+st87uyeX
         ytP9Vh9sf5Yg7y6xK60CjHBYP1ehIR6wdBk08fRfcAmJ8u88aHypGp9onhbNnX03iGJh
         AoVQ==
X-Gm-Message-State: AOAM532gOfpOkSay/tFqIfzEkGTV8ug1EvFRARAZONJAE2QR1nzdzrSS
	yo/GPxaf5Eiq08nbx7z/kWHfan4HMR0=
X-Google-Smtp-Source: 
 ABdhPJzo6aZo8i7irLsTQTtE2Yoy8ya+I+GdhfsECewZXuuiQMtEjjKWR2xpZmjRgYZFnhPLnEmvmg==
X-Received: by 2002:a17:906:6a11:b0:6fa:5752:9b2d with SMTP id
 qw17-20020a1709066a1100b006fa57529b2dmr24283819ejc.703.1652871576140;
        Wed, 18 May 2022 03:59:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 48/49] python3-setuptools-rust: update 1.1.2 -> 1.3.0
Date: Wed, 18 May 2022 12:58:42 +0200
Message-Id: <20220518105843.3299331-48-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165845

Also, make it a proper target recipe with a -native variant.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc                    | 2 +-
 ...ust-native_1.1.2.bb => python3-setuptools-rust_1.3.0.bb} | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust-native_1.1.2.bb => python3-setuptools-rust_1.3.0.bb} (85%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index eaa8fed9b1..3990d1d507 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -664,7 +664,7 @@ RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER:pn-python3-setuptools-rust-native = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb
index 8ec9a86f00..51e27b843e 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.3.0.bb
@@ -10,9 +10,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
 SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1"
+SRC_URI[sha256sum] = "958c5bf4ab6483d59dab888538121871cc5006354a42fb0fbd50acf03caad1de"
 
-inherit cargo pypi python_setuptools_build_meta native
+inherit cargo pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
@@ -24,3 +24,5 @@ RDEPENDS:${PN}:class-native += " \
     python3-typing-extensions-native \
     python3-wheel-native \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.30.2


