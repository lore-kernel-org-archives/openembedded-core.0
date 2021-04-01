Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web08.1149.1617290902976707626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XUR8zBcJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso2427553oti.11
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1LWwYANQNE1fgTItwwK04HtVfhXSKAESqHedBdLJiJ0=;
        b=XUR8zBcJ9lQdG/vTISgvshEd6Vi6iajnFaVgyrwIIW1ODIswbpMXT94/fHwg7gevNO
         6l1IVFNbYUA6REmYycWI6RSJHuX2uSUjewsXKn6jFU1eatKu7UsRpF7D5KX6H0n4CiiH
         lyebA5XhlENh7m6HekHro+yKaCFGUwC+QvcNlcLfj4blTcyvM4zXMPaiOgkap31P6tMZ
         k+eUrOPDSn7lwoZu2V0u9s7qQdWvNbVq4v0Ju+nWomK4PucD2RSQoR2tHx8KjFHWvU37
         L4UEI9oV4RTLSki9ahqWLsJbIG0VE+6tYzS4UMjl6PsIkY5Ii/7MypAUpXtjwYlYb/f2
         Oibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1LWwYANQNE1fgTItwwK04HtVfhXSKAESqHedBdLJiJ0=;
        b=FabBjqZh+MuUlOgWVA3n+LYGmd2iZFxSx91O1FwGLJizFPHdgYuHiyMTar/XN7dVZA
         GS2ndMxfOFP5mMN/LV2LTsDc5v+WlGfOqjm31KulZujTFF1JhnXi6yjQp83YK76OLS/w
         WFH/Kk7ykirNvXd/zDJgreJrRlZV6FfWUxrr0da/NYKjbJwo0n1MqHL9Z71fsABVqrrE
         4rcmKiMA7dbCjItablYZTFegfrSpOsDylboA0TC+SRByIh7ts3ltdMGusQlbudgYQW4K
         8BFB9vnNuiM+ihyvYIuhwSPEKe7Gx0DVD9LgXwHvexg8m2KfqJ/xsxXsO59Qr4TTSbmF
         PPzg==
X-Gm-Message-State: AOAM533iUQALK9nzl0ql2Abjp8WXnY2xmogDHX8Y0yuAQLgQplqa70ZG
	XOoEweftRyhNbT2plhcrhtmBlDBj1ZthwwXc6oI=
X-Google-Smtp-Source: ABdhPJytqmmHZYxpwF5996htJQy04pSsyhPTHoplZX6CWINOXHFYai7IRjKnHezm/4JnHTFpPziCCg==
X-Received: by 2002:a9d:5a97:: with SMTP id w23mr7319517oth.314.1617290901870;
        Thu, 01 Apr 2021 08:28:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.28.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:28:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/15] openssl: update to 1.1.1k to fix CVE-2021-3450 and CVE-2021-3449
Date: Thu,  1 Apr 2021 05:27:32 -1000
Message-Id: <0826a41940da14631043e2a496854dbb5da9a15f.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Only security issues fixed in this release according to
https://www.openssl.org/news/cl111.txt

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1j.bb => openssl_1.1.1k.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
index f054d2fdba..5f281197c9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
+SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1

