Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5EBC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 00:26:17 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.2153.1641428761985921374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 16:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id c36so1409910uae.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 16:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5BFtJK87H3CSWIYq1M1MecHHUGRvhUyQ6QrGKEuJT4=;
        b=PiqmIiZnmYqg0dmGb+B+RYPdvNC6BEBlLxaMyjRjaZtk0rwk7IhXsKNDJGZsV2NSaa
         cr5vsPqezjOSjpmfanWZDQhS7fHINwSFPcvS6zPQA4xknW7c7qWLZT0JTzHfinRyo3Re
         at/o/PhThKO1PXiyGniTZ3jGoeOmG4mZPyzBdtQPfNk62i1A9QI14W7hPz+18ElPQset
         FRxR2XMTEJHC90KweX8xSsaN0FmrohSZ31FjB4OHPxDq1WiIobNamzG0nDEFF5mi0Zok
         a5EiI4NpiyvTFv1APFp3lol/qaZ3Plw5inZa/521ji40ua1yeRyDDescA8NnvW/F2Iib
         WstA==
X-Gm-Message-State: AOAM531koTvYwsYMdAgd75MUJA/eYYlVdY8MIHAZDypedCyiJOPxzUFZ
	VhNfrHoMMNA+ISlw95CzCISatE89cgs+NSoq
X-Google-Smtp-Source: 
 ABdhPJwAWCOJYsqt3m5MURk51klp0JWw6e3O3krMUDkYk2ooCtEozTZOp8aJoz7X0AKpY+edYkzQGg==
X-Received: by 2002:a05:6102:3009:: with SMTP id
 s9mr17824772vsa.23.1641428760760;
        Wed, 05 Jan 2022 16:26:00 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id g4sm258323vkd.46.2022.01.05.16.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 16:26:00 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] libxcrypt, libxcrypt-compat: upgrade 4.4.26 -> 4.4.27
Date: Wed,  5 Jan 2022 21:25:33 -0300
Message-Id: <20220106002535.658797-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 00:26:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160219

License-Update: build-aux files updated.
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- fix license checksum error
- update libxcrypt too

 .../libxcrypt/files/fix_cflags_handling.patch          | 10 +++++-----
 ...ypt-compat_4.4.26.bb => libxcrypt-compat_4.4.27.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc              |  4 ++--
 .../{libxcrypt_4.4.26.bb => libxcrypt_4.4.27.bb}       |  0
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.26.bb => libxcrypt-compat_4.4.27.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.26.bb => libxcrypt_4.4.27.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 0772998c72..94aa3fed49 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From fd9a46695594c3cd836ecb7d959f03f605e69a2f Mon Sep 17 00:00:00 2001
+From 7b2a0cdc281d94a5782c37ef87040c341447b4b4 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 30 Apr 2021 10:35:02 +0100
 Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
@@ -15,13 +15,13 @@ Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 ---
- build-aux/compute-symver-floor | 2 ++
+ build-aux/scripts/compute-symver-floor | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/build-aux/compute-symver-floor b/build-aux/compute-symver-floor
+diff --git a/build-aux/scripts/compute-symver-floor b/build-aux/scripts/compute-symver-floor
 index 4ec82e1..8117342 100644
---- a/build-aux/compute-symver-floor
-+++ b/build-aux/compute-symver-floor
+--- a/build-aux/scripts/compute-symver-floor
++++ b/build-aux/scripts/compute-symver-floor
 @@ -36,6 +36,8 @@ sub preprocessor_check {
          die "C compiler not available\n" unless @CC;
  
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.26.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.27.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9186c45e18..725965e535 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,14 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=29c5f9af198623cdce52a77f85695164 \
+LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "8ff7a8c5019cbd50419f7d0a8cd691eb99d6b086"
+SRCREV = "814e715dd8580ff00344112d7d8383a6a5a5b83d"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.26.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.27.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.26.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.27.bb
-- 
2.34.0


