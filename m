Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64892C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:39 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.4068.1657773390164391041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Ib2tFbWR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso1524461pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ef3TLvJVauhVVJxeVoOiz65dGzVztef5kk6TZ0X4C9g=;
        b=Ib2tFbWREPNAOBPhbqWSthZ9IH82KSzHQrOlue355VvG8udIv2IyD0uMLrIWTzeyRB
         M2XKhFdtrMPjs24fGU1UNCoqqcxb37Fznb0A038zh6Bfk34vfgGYNAsYPSKZJc+2txod
         rWwM9+zeOJh5GVfMuHjUEI/p1S0ejEsEpx4R8BlSEYjEFkZqtAggwp5SDCFeCRSp50jV
         XbGNVeQEdeG7bCzpIVIPecd8jIi+T2+5awjQz3nGV5mWALHZxpb2ymMnhevIoXNxnWao
         GoscsRlneP22D8BVoF50MSh6Ged05NwL/I5BvxIbYsyG/e6T6n284D1Jx1uzhXIEJUD5
         JPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ef3TLvJVauhVVJxeVoOiz65dGzVztef5kk6TZ0X4C9g=;
        b=G0GmLGKkuxqtR3SQzH+hCdhsQQn5cNxWOJJTGrVL/pzzraEALk5jQTd8eQJbyF0OeD
         ivRxNwfpEaLI+6XEmPP3jAGAaumb0lqc2jP1i7O79T4Yv0saZ0wBDlvgo6Z9FzwtnwOs
         VqvqP2EfTJAfCWTx9+A79yowT0AzXDNh/W0yMsExHJyXHvUFI/DAUg9TN4RdRYvfgsVQ
         uqBXmhKJ/b41PVxwBxauK5M1zhAPMOKd4a7BUfTqWBELu9Kq7Dwdrz6NdGopD6UnG3Oh
         psW54bvdVuIxU2N5mV+W9N9PHYyeAmIby/fOB1gDxB8wiSFVoaY1VXte7ZshmiRtMJby
         AFaQ==
X-Gm-Message-State: AJIora+rxqzovdcp4ymgKsmTke0FGyasnQjDvzGJO/PlFjXtboxTKWoL
	GR1Gpv6p6v6bYwR0BNE1tvyUmwuSw1l4dR7N
X-Google-Smtp-Source: 
 AGRyM1uySk53pnLXYh4Qg8Dvps7+ECa+Tj5FqIzgk5dX8YLql8ODqmR6c/BA44+EdtfKeIAQBfEvEQ==
X-Received: by 2002:a17:902:ebc1:b0:168:fd13:8adc with SMTP id
 p1-20020a170902ebc100b00168fd138adcmr6593694plg.161.1657773389061;
        Wed, 13 Jul 2022 21:36:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/27] openssl: update 3.0.4 -> 3.0.5
Date: Wed, 13 Jul 2022 18:35:29 -1000
Message-Id: 
 <76162757033437507fb7309ce9f41fcaaf996ca9.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168006

From: Alexander Kanavin <alex.kanavin@gmail.com>

CVEs fixed:
https://www.openssl.org/news/secadv/20220705.txt

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84204dea7dec05e053cce5be0071cd9c1fb4ff6f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.0.4.bb => openssl_3.0.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.4.bb => openssl_3.0.5.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.4.bb b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.4.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.5.bb
index d9d17378d4..e50ff7f8c5 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "2831843e9a668a0ab478e7020ad63d2d65e51f72977472dc73efcefbafc0c00f"
+SRC_URI[sha256sum] = "aa7d8d9bef71ad6525c55ba11e5f4397889ce49c2c9349dcea6d3e4f0b024a7a"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


