Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93808C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.7200.1667530887613624371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZkCKKfhx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id k22so3377427pfd.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvwONl0CV6IjYQ1glesFcwjPAehE1C1MeBFcojwAFiU=;
        b=ZkCKKfhx+bHqFOeRfg+8sx+xp/zhLM0nLNbZeH40TfRu0vPnUkoKGgtdp7pNV7NIus
         ZTLJF43SD+ZkkhNeCzfHKIEWAlAT/FD5jm3jmkyRhrFe+AmNlJFtTn2X/j5dfK5hPd7r
         fEGCaDH5GoT8uYvFxe+AQQiKXH92HqIGMgfutmW4dUHSQdxzd94FDU9q+ruoveUQtEuP
         yav0cY3LbbYv4aZbryrGJ5mXQu5vN9sO/E/r8gi7f1Lgxia18OTCbeIb8LAFRcq6wsp4
         8qiGEEadhgGWEKFP19vzLbAaqcPvohBn6kXvAQLOrEjg0f4lS10D0BGA+ty5VLaobakX
         CtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvwONl0CV6IjYQ1glesFcwjPAehE1C1MeBFcojwAFiU=;
        b=2vLuVJzyp3dnJye946RKKTptV4kC9qk3LD1f7qJszNGxgcLzrcz3kbOo4OucklFPlI
         id1RiGx+HTevRhIhpZP688X44YXsKjVfd+GrPCG5nwQb7JjEO+jVKlOnKO0oUkCmhweV
         0Za4RjYT5YcwoKmxl62gy/T5eaznI4bKvEFmv5yHf2MEKawn1MRxSMQ9JqZ31ZHCEjDW
         8uM3IpxJ++SregLnN5xbucSU1x9nNdY9YLXaZeXDIs0neicM4BbQE/KkpGHFJkdBOn9q
         zlJ/d1zeZ/Dq/aAN7S9FIxN6S+MXgEobvvEsHwlRV9B82OrZMv1nCG51pQFRldnOgiCb
         64bQ==
X-Gm-Message-State: ACrzQf0Rhyn6JG4WOUrGLHNIAeZabJqLrVF34AGxwYg21gLD7vQVShdC
	QYnSs9Cv2OQ0uTdzodsI2FgdR4ApSaL18EqK
X-Google-Smtp-Source: AMsMyM5XUKVBOg+Bv1eXKArcVmF9EuRx+7WWgFuXk4bUAbF9Q1iNQEmvbAmPcWdDLkOwVfhMzrMxTQ==
X-Received: by 2002:a62:174a:0:b0:56b:a319:76d5 with SMTP id 71-20020a62174a000000b0056ba31976d5mr33018361pfx.23.1667530886627;
        Thu, 03 Nov 2022 20:01:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/31] openssl: Upgrade 3.0.5 -> 3.0.7
Date: Thu,  3 Nov 2022 17:00:39 -1000
Message-Id: <4d18efb1dc0b0c959383028827a1cb14c6355ed1.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172665

From: Ed Tanous <edtanous@google.com>

OpenSSL 3.0.5 includes a HIGH level security vulnerability [1].

Upgrade the recipe to point to 3.0.7.

CVE-2022-3358 is reported fixed in 3.0.6, so drop the patch for that as
well.

[1] https://www.openssl.org/news/vulnerabilities.html

Fixes CVE-2022-3786 and CVE-2022-3602: X.509 Email Address Buffer Overflows
https://www.openssl.org/blog/blog/2022/11/01/email-address-overflows/

Signed-off-by: Ed Tanous <edtanous@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a69ea1f7db96ec8b853573bd581438edd42ad6e0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2022-3358.patch       | 55 -------------------
 .../{openssl_3.0.5.bb => openssl_3.0.7.bb}    |  3 +-
 2 files changed, 1 insertion(+), 57 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.5.bb => openssl_3.0.7.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
deleted file mode 100644
index 18b2a5a6b2..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2022-3358.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 56e1d693f0ec5550a8e3dd52d30e57a02f0287af Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Wed, 19 Oct 2022 11:08:23 +0530
-Subject: [PATCH] CVE-2022-3358
-
-Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
-CVE : CVE-2022-3358
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- crypto/evp/digest.c  | 4 +++-
- crypto/evp/evp_enc.c | 6 ++++--
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/crypto/evp/digest.c b/crypto/evp/digest.c
-index de9a1dc..e6e03ea 100644
---- a/crypto/evp/digest.c
-+++ b/crypto/evp/digest.c
-@@ -225,7 +225,9 @@ static int evp_md_init_internal(EVP_MD_CTX *ctx, const EVP_MD *type,
-             || tmpimpl != NULL
- #endif
-             || (ctx->flags & EVP_MD_CTX_FLAG_NO_INIT) != 0
--            || type->origin == EVP_ORIG_METH) {
-+            || (type != NULL && type->origin == EVP_ORIG_METH)
-+            || (type == NULL && ctx->digest != NULL
-+                             && ctx->digest->origin == EVP_ORIG_METH)) {
-         if (ctx->digest == ctx->fetched_digest)
-             ctx->digest = NULL;
-         EVP_MD_free(ctx->fetched_digest);
-diff --git a/crypto/evp/evp_enc.c b/crypto/evp/evp_enc.c
-index 19a07de..5df08bd 100644
---- a/crypto/evp/evp_enc.c
-+++ b/crypto/evp/evp_enc.c
-@@ -131,7 +131,10 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *ctx,
- #if !defined(OPENSSL_NO_ENGINE) && !defined(FIPS_MODULE)
-             || tmpimpl != NULL
- #endif
--            || impl != NULL) {
-+            || impl != NULL
-+            || (cipher != NULL && cipher->origin == EVP_ORIG_METH)
-+            || (cipher == NULL && ctx->cipher != NULL
-+                               && ctx->cipher->origin == EVP_ORIG_METH)) {
-         if (ctx->cipher == ctx->fetched_cipher)
-             ctx->cipher = NULL;
-         EVP_CIPHER_free(ctx->fetched_cipher);
-@@ -147,7 +150,6 @@ static int evp_cipher_init_internal(EVP_CIPHER_CTX *ctx,
-         ctx->cipher_data = NULL;
-     }
- 
--
-     /* Start of non-legacy code below */
- 
-     /* Ensure a context left lying around from last time is cleared */
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.7.bb
index ee051ee7d4..9ed5f11df0 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.7.bb
@@ -12,14 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://CVE-2022-3358.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "aa7d8d9bef71ad6525c55ba11e5f4397889ce49c2c9349dcea6d3e4f0b024a7a"
+SRC_URI[sha256sum] = "83049d042a260e696f62406ac5c08bf706fd84383f945cf21bd61e9ed95c396e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


