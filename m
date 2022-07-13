Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82787C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 20:38:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.2218.1657744689760150011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y9cAns2e;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so5740662pjn.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QUJI4BT1pZAwG9CFhfOzbU5O4Lam4IfUnhDold5p28g=;
        b=Y9cAns2e73WUWpg+th5r1+sfifFscdU9b31G1IvR3HR1YMj0v0ewJEujkVLecXzBbw
         ggTZJn2ZJ2WjfzrIQ48kDIvma0NwJt/zGIWdX6MPMxHakAb/FfIDXJ5ZECV2v7K2VlUO
         iFyEzofDe1bldKXM74GjI5aP5v8/fZ3osnZKEY0bfYlnK6IcNvd3wHluANxV/5BBdcB8
         X5W+nW1imNbC2w+DySNazgoUrwS9mOpIyWHASeSprbT5vOmr2yyyadL2KYLYPLdFj09D
         nfxUgGa+rXXei06a4kA8KVbgLoRVYWRSrru65hhbx+xwMII2Sb5eisMZ6LutpyTqajD3
         kCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QUJI4BT1pZAwG9CFhfOzbU5O4Lam4IfUnhDold5p28g=;
        b=QqYRGuKoHo0CPm5+nB0JS9r+VlV3CQK6m5yKMamuZjlQS1u6gZMB4KPYWR5d83gDAC
         swFndGx0O6zqp2llzp5d+v3EHZLmxFJKL63yoPMk+5JCD+py6cKrGFV7IdOScQ3joaIe
         n6ajrkM2KdO6EcjfsRve2Iu96XDckIAVX8E+PD+87si0hQKvE5JHDYOmfYoklOE935nt
         yd8fyVUMeZgbLBC9AxiVoi4T3UxIqsjhQDzYvdmku19lVSNQZVBsjUsaGgvfnTcyRp2d
         rE00IlYh4NouaI8+4HBHQQetHLNWKDg9oyeyKxQrOkRDkKLjEq83fWGu02dk/AjV3HPI
         ezBw==
X-Gm-Message-State: AJIora8WJj3fuXcvidT3LKhq3VF16sof40wQAQ2CVuSbzVrG/Oj5uiox
	wPOL5H9PuyXK/TYAt5ppyBHiCmT+NO6k/FjF
X-Google-Smtp-Source: 
 AGRyM1tT6wKYLAka8wl/qtCcbCToDfJfHMlU6VZR1RqEK8M1m2kD3F8clZhrkAnc98TG7AZn+EqMew==
X-Received: by 2002:a17:90b:2bd3:b0:1ef:9ac7:d90c with SMTP id
 ru19-20020a17090b2bd300b001ef9ac7d90cmr5672963pjb.53.1657744688761;
        Wed, 13 Jul 2022 13:38:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a13-20020a170902eccd00b001664d88aab3sm9231892plh.240.2022.07.13.13.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:38:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] openssl: security upgrade 1.1.1p to 1.1.1q
Date: Wed, 13 Jul 2022 10:37:51 -1000
Message-Id: 
 <6031eecee8ac8bed1c43a04ecf06ed08014346f2.1657739246.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657739246.git.steve@sakoman.com>
References: <cover.1657739246.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 20:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167986

Fixed AES OCB failure to encrypt some bytes on 32-bit x86 platforms (CVE-2022-2097)

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1p.bb => openssl_1.1.1q.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1p.bb => openssl_1.1.1q.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1p.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1p.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
index 8916218c33..139b7fe935 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1p.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "bf61b62aaa66c7c7639942a94de4c9ae8280c08f17d4eac2e44644d9fc8ace6f"
+SRC_URI[sha256sum] = "d7939ce614029cdff0b6c20f0e2e5703158a489a72b2507b8bd51bf8c8fd10ca"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


