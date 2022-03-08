Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A63C4321E
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:35 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6399.1646731954485605177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f9MfH8yU;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id kt27so37936068ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4dDuqVE2HPofwkKp5iGtcC0Fw8GC05Ot7tBgXkDRn4k=;
        b=f9MfH8yU9ZS7bLY6BIzQ5LUXbray8rdgNXaomcp99tcQua1M3lBsjFYFRwvD11zy7v
         jxQvETp2TERB0EHVtRPgSFwiE485BodS8OUrKT7AzIBttoSI7e1Uzk3p5ghegoJjVrUt
         s6gGYjmKzpf3Pjv/Z0XMqadYlF7u1zKtuU3QeVBLkxvKJUDj4OWtc7w6dBXSsvGoXFBl
         z22xnKwDGR3UZ8PnlQqp4mzCwopG+gnUl77V8IPDRLUQIqCOlVQJxt70mNQ2P16cv2vS
         VeRfOBQV/joinW4TOTOhwBMHAaFPMjYu/bUoI4kLIUZaEmf6KfC0FfjWwaNFxCXnGC6D
         DpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4dDuqVE2HPofwkKp5iGtcC0Fw8GC05Ot7tBgXkDRn4k=;
        b=2ZVBROXN+Rta2Xbp8BckuDGFfOugmQNTzFNZ259dgqmB1cYK+612q3KDuJOc7+diBu
         hJTQubCMfc0QZZJQANfs4ynK9Wk68WbqZ86inRQ2CMEOnp0/ntMerpGrtV2PztOBoqmY
         +ZFb5+vzGFJSU0vo9lB+283dJNxOiVj9P6fG2Dg/fOqzUrrVGqN1Y8p79y60UVl8iZ8O
         3ym+Tu0ImyRRC4Rj6aaKea1EpNeZHR05E3rZdjI80t7mMy8dr7mTJ7cs7QfNKWoADcF7
         jzSK5Yj+4gRTckGsYZmzZ/kjjXGhW26Oq5Iv9LDjULjhcJsYkRi0GC8EQ65fs102P9u7
         OUgg==
X-Gm-Message-State: AOAM53106I4FEWGL/x7Q8lORlnD4lz7j3Jar+WH1np2aeRuvZsTpLcP6
	pZVVEETOMBSzwGqolQq6G8/nNGfPa/w=
X-Google-Smtp-Source: 
 ABdhPJx/nJQGWEKHA5HBRk0s8wfV940sYzzgiZe4s7i+HbIdh5QIY5jzKMiJt+vVDhZmTsO/RceT3g==
X-Received: by 2002:a17:907:9811:b0:6db:41de:ed89 with SMTP id
 ji17-20020a170907981100b006db41deed89mr4249080ejc.486.1646731953051;
        Tue, 08 Mar 2022 01:32:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/16] asciidoc: upgrade 10.1.3 -> 10.1.4
Date: Tue,  8 Mar 2022 10:32:15 +0100
Message-Id: <20220308093224.3436483-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162884

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb}    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.1.3.bb => asciidoc_10.1.4.bb} (84%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
similarity index 84%
rename from meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
index fc8cbc89c8..484250b33e 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.3.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
@@ -5,11 +5,12 @@ articles, books and UNIX man pages."
 HOMEPAGE = "http://asciidoc.org/"
 
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
-                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
+                    file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main"
-SRCREV = "342639edbbc0dcc64354a0291d2214d4d5e65cab"
+SRCREV = "c724bbf95b1840b04bb298a61a72b6a5ea94c2ef"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.30.2


