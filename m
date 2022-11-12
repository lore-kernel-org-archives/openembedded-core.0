Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A825DC4321E
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.2834.1668262221307806564
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=T/zzrYNm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id m6so7240384pfb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U04nW+ReiZv/SIq8qNjiR3NvNyoqNBfrb9SOpXkOlxs=;
        b=T/zzrYNmEnT+uMlKC0S944wKHsCgBlWkDlqLCGb3UX9qH+zvNqneKfnykLp7FrSJmb
         W9MfxDPZUjTYznhE4yBniFR22M5fvMuT1sUN4TAzeHJQEZ/b1TGIZTU3/NvnxJDOOQen
         BXSdFv4gga9+hIa6AN+Fn7XN3Pi78O7FqrdR9yohiHHWP6UWjHSzlpjaZAo2bQ+FgnTf
         hNk3SdPk06IpsZzGcspM70LsCs9Nt+48vAfYz3FgOljsVn7Wz/XPcShiEQX8pg0xg/Js
         5+psqxjF5ntfBzQKFgfY2/0mZsjbAmwQg6LUhiyfuKYU9oLD9ir4qjVN93oIOWCX9n74
         vVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U04nW+ReiZv/SIq8qNjiR3NvNyoqNBfrb9SOpXkOlxs=;
        b=O3MCfi4ikjHWkUDbb+98nZB+ypKgxYrzrnMP8glLouSgDlIIbHhzSPVRESOF7c7B+c
         KAHvybvdkuKNOyf48zoCj+9fRzg0O8I+sM6+EoaHy22FyCa8pg9buJL0lln9bHR7pNPj
         X1TRwFEW5kYnEEEC0qp7mzODx/dQs1QGKkTjweqe0+KTYE50DCPdh8Q1QF5JKTEfd71N
         38CQyvmtB4O0jDy2pFWBpMrdXkB53hwYOq0XyizF8TOMPxVpsyAHNe2qtInaBZkLl9OM
         sijo/jkRduX78npoDpo4PIXsg3jStEgxOWGswo7oHoaQTviEloVrRnwfOdqh4w9BLfFD
         rEsw==
X-Gm-Message-State: ANoB5plQ73wRyDrmU4RwjaYEqcjjHbKvCw3+3vuIcaCDLyCM4pG+0FkM
	gog+og/EgIPuUD6isHCy4HZ4RrOnXG+AyWK8
X-Google-Smtp-Source: AA0mqf7euD2khpkyeDLdWrC2pAD5b/JplWs9tfaAv0b1n5Ba0zmPivj+wmTV77v6QpKIV5H2crA1Dg==
X-Received: by 2002:a63:5554:0:b0:46f:7e1c:77be with SMTP id f20-20020a635554000000b0046f7e1c77bemr5641564pgm.32.1668262220273;
        Sat, 12 Nov 2022 06:10:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] openssl: upgrade 1.1.1q to 1.1.1s
Date: Sat, 12 Nov 2022 04:09:55 -1000
Message-Id: <a39a32efd41c92a3ada49d667979c79101a4a2da.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173156

From: Alex Kiernan <alex.kiernan@gmail.com>

Major changes between OpenSSL 1.1.1r and OpenSSL 1.1.1s [1 Nov 2022]
* Fixed a regression introduced in OpenSSL 1.1.1r not refreshing the
  certificate data to be signed before signing the certificate.

Major changes between OpenSSL 1.1.1q and OpenSSL 1.1.1r [11 Oct 2022]
* Added a missing header for memcmp that caused compilation failure on
  some platforms

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
index 139b7fe935..6c8f285996 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "d7939ce614029cdff0b6c20f0e2e5703158a489a72b2507b8bd51bf8c8fd10ca"
+SRC_URI[sha256sum] = "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


