Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37017CCA483
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:04:00 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.86907.1657040633983985295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dTRhZnmb;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id ay16so22743292ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HokKUdKwpAeBj8u1v5emTJeq8IE62XY4OTPc+fWh41Y=;
        b=dTRhZnmbljsfEzSdvMwlh/nepxVqAEHdlRKSSIQvSDiJCxn/2df8A2YNjKzgwOf3e6
         zd1ZIxjpkfaX98aL9cY3Rb8El+jQKiuo7eck0/rnpPs1+V2MQDIUWdBmRbDZpFNR5xCx
         Uh7Q8d75OLYxdzlZUeAHd69Na8O9zNtH8u37almsdR7eExGWIg3Em/FjSCHRgs3FBIF9
         w84mZmgxTSyq0MEoUzitOhrVhgbVqTnEXbNqWlrgrhj1WLKm3UQAhn7Y85a8+uA5FaSm
         lGNzyPlBIVOi/sYIu96cerDtNhM5WoFCDi024upfxHkFL/5B+g4GA8AsyIMSKMJbocHY
         dxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HokKUdKwpAeBj8u1v5emTJeq8IE62XY4OTPc+fWh41Y=;
        b=z7RTSxdU1AUoehnslrtReQ0xkP/5EYTKuXS+MQ2u4flqvcHlNry+cZz0Ww3l9ei0H7
         vryWaLMBD+CI9YWlt0bepxUKs3nNy1PhP1Z2giuhzIE2bvLUMlZeX0ksTPP29BqPKZAx
         +xNGYZpyp9a2r9NyU9gJ2ZOXyvUlv1hq9edGfzyciOhBrgRaxxSD6Bw9Ar4hNqknA4HU
         RPaBX1wb6LNtC4KFc0crqFYyyJ655aUXQ59vs2MwFnvs6CldilF8Ih8jRvuP241+fgS3
         GmMaQlDYr1BD/lhMk4ZcG0B6vCjdarback47FsjBXDco1+p25sn3hdZuBxhiFsOZfKQP
         Yt/A==
X-Gm-Message-State: AJIora9Lwy5fRmuZNv2+9QR+r/XznMyp2aKZHxMkmW5nX1EXta65gzsz
	MkzOjbBFprE8KgnI4xF9GydpUQmUm2H3PQ==
X-Google-Smtp-Source: 
 AGRyM1sb9giTFZx2yeJCunfc/vZ2MyugfPsK6GvkBMQqFdvuJV5cVUjFgwU2w6QxB9ZRwX0VxFQxhw==
X-Received: by 2002:a17:906:9c84:b0:6e0:7c75:6f01 with SMTP id
 fj4-20020a1709069c8400b006e07c756f01mr35019439ejc.103.1657040632584;
        Tue, 05 Jul 2022 10:03:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm23999886edb.56.2022.07.05.10.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:03:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] python3-setuptools-scm: upgrade 6.4.2 -> 7.0.3
Date: Tue,  5 Jul 2022 19:03:38 +0200
Message-Id: <20220705170339.771017-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705170339.771017-1-alex@linutronix.de>
References: <20220705170339.771017-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167675

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...uptools-scm_6.4.2.bb => python3-setuptools-scm_7.0.3.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_6.4.2.bb => python3-setuptools-scm_7.0.3.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
index 9aaae071d3..114e6820a9 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
@@ -4,20 +4,22 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30"
+SRC_URI[sha256sum] = "cf8ab8e235bed840cd4559b658af0d8e8a70896a191bbc510ee914ec5325332d"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi python_setuptools_build_meta
 
 UPSTREAM_CHECK_REGEX = "setuptools_scm-(?P<pver>.*)\.tar"
 
-DEPENDS += "python3-tomli-native"
+DEPENDS += "python3-tomli-native python3-packaging-native"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-packaging \
+    ${PYTHON_PN}-pip \
     ${PYTHON_PN}-pyparsing \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-tomli \
+    ${PYTHON_PN}-typing-extensions \
 "
 
 RDEPENDS:${PN}:append:class-target = " \
-- 
2.30.2


