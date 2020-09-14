Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.61428.1600092764970916185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Ml0/0CEr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.195, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f195.google.com with SMTP id b124so12705608pfg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MrfiQ4sVXr/hLTL1PE7a+Ea5BcP2okGX95Ugvah3+xE=;
        b=Ml0/0CErRIH8qsBx9WoVDBH4Iraffo7PYhaDOJObLqAJS+/d8yGW/tWKiwVcCgsCia
         qXIoA4HNQEUyHZvvgsYqf4OBVzAJzDQrfP5Fix48HqpwIccWgZ0R9FQVrca1f3IMs/mq
         FeJZSCpB+P66MKwHdiUFkm0TYuw82qhU+Fgq4jfNX4xckynlsx7TszkeSMCggrJ1OxO9
         yIdtjmmdd5VMTnjN1We1gRKbN9G1Qmb68pHGPTbO2NUiWr547mhGMa0+e6eSMTOhFNzC
         pcrqZXTv/jxGRtX7y4B3alJO9Olvm5HW56g3tl9DbHJ2QzgNMFgGjr5THVZ6jcdiVC8b
         6PRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MrfiQ4sVXr/hLTL1PE7a+Ea5BcP2okGX95Ugvah3+xE=;
        b=hIaS7swYC4c8b7MOU01PRn5hvo69KieAILst3QkImK9roAxmTzvt5NC519F3DeKWG7
         nYmqVzQDO9kj2vHRlxBj2ug/y68xdMhim1SKiyML1il2Iuqnk7mWH9XRBtZeb8MXbP7l
         E6zTOTeUHf5JU9kZHEnkFfNJtUq9v5i5gpCb8lAdxq9j91ygn+nG0LNADwXF/yiaVBU3
         6UpabkbhlbDElMxK45VayowWWbdy/QSGb7w8pPQlJWLTKlYwxSnhESbyziZyxZA9TPlq
         b/PB1g35KjcGivO3K0zo3Fsm0u7fAO6g6KFbayjJzSfelzqJVxQyaJqimqbdVynYDGM8
         MMpQ==
X-Gm-Message-State: AOAM532GIybeAYZwiFQcC/gByQw1Ox7s2UH3BN2ec+9XKqQRU+fgisTs
	xPRka6wcVtiuvPNelWw3M0QpsiF2naVdNC5eowc=
X-Google-Smtp-Source: ABdhPJyzQ5i4Oy3negGBznt4YI4ZVbckq/aBDemrXz0XcHYhusexBZ3o+aioZNHVoCytfsyIm2osTw==
X-Received: by 2002:a17:902:9698:b029:d1:9492:745b with SMTP id n24-20020a1709029698b02900d19492745bmr14817455plp.26.1600092764109;
        Mon, 14 Sep 2020 07:12:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/24] ell: update to 0.33
Date: Mon, 14 Sep 2020 04:11:34 -1000
Message-Id: <57e08c174e095228c8dbc99ad7debd27ffd10c51.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Changelog
- Fix issue with uintset and number of bytes copied.
- Fix issue with overflow in DHCP lease T2 computation.
- Fix issue with side channel leak in l_ecc_scalar_new.
- Fix issue with missing MSG_MORE in l_cipher_set_iv.
- Add support for DHCP v6 client implementation.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ad8ca257d40f5041b3ec167e4117c687da448a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.32.bb b/meta/recipes-core/ell/ell_0.33.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.32.bb
rename to meta/recipes-core/ell/ell_0.33.bb
index 07dc4d4cbb..2fa05104fb 100644
--- a/meta/recipes-core/ell/ell_0.32.bb
+++ b/meta/recipes-core/ell/ell_0.33.bb
@@ -14,7 +14,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "42fdb9e24ff561a101389d51445cab1ff7d55f5385dc22a05b0493088cf99e30"
+SRC_URI[sha256sum] = "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1

