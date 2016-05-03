Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 97A556FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 23:46:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r187so3599088pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 16:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=iHCAy8CP5Pha1s471EpbSw5LcJ49eIeh5KRLOPO7pz4=;
	b=JQo19CV0TgdIWnb77WtT9fcBfI7mnTiV46AdwhTCT95PRbAkDkHxLnOgc/xw7LxHYa
	qxMuFbw2rUEHBS5o4/QX1NKHg79fxc5tZive7o5qMTV/2vFjme7l8cBdMtQ5mofgjwBQ
	expLbLc84e+h6Hx+7ifKqPcZQn3YPl4phr8/k5ZADvv7OvNK0TTujatB3OgnBA3AHEb1
	ycqVx53WbvWICHpesJxA1uJFint5g8tM4ue1/wn8uRauKuxhY4lyMb328QzykyEMke8o
	FlzH6YYkOB5nAV6u4mZsj1xPmmsTUvQ0B8Twc5QU6z9rgaRk/T9qCarSHw8+DBPsrI/e
	OrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iHCAy8CP5Pha1s471EpbSw5LcJ49eIeh5KRLOPO7pz4=;
	b=NXiILS7C3WC48yKpUjlJDYmhuzHyI5xRk58UyAxbXI+Zb2MJj6DobjnCtxh8Kgmq9p
	7zPip0U/CEYGELzDEAxmQKTuOiwmX07CT9ewiMbTHWPinGlzsWo1unrKof8h/IdZr9IE
	iRw0qiQKH2KFpheTLs3zAgewtfdeJPPxfnB25WokkIu1zmSKTB3guSPEacShNqTiYbDv
	pOBxwQoY9PZDsQw0BWFMz1EuZcxPgcvyRmQgQLKNxkgh08P1DJQZslmyxSqYWYXw8u5B
	k8LrKlm0fHz2iPk7vyoyshScaOMm3Dt7EClnvMI1z0k+8QV+J0aDuXBTNtkq71ZqYaTZ
	09+g==
X-Gm-Message-State: AOPr4FU9uMFrVfFo0SK46KnAJbsDx+QXthYSL1rVufWEXpKe3qPvCGBUUta2r/A6JEG8uw==
X-Received: by 10.98.90.130 with SMTP id o124mr7611739pfb.115.1462319168115;
	Tue, 03 May 2016 16:46:08 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id e7sm767005pfa.28.2016.05.03.16.46.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 May 2016 16:46:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 16:46:05 -0700
Message-Id: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [master][krogoth][PATCH] openssl: Security fix via update to 1.0.2h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 23:46:08 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-2105
CVE-2016-2106
CVE-2016-2109
CVE-2016-2176

https://www.openssl.org/news/secadv/20160503.txt

fixup openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch

drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in latest.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...oid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch | 14 +++++++-------
 .../openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb}       |  6 ++----
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb} (91%)

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
index cebc8cf..f736e5c 100644
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
@@ -8,16 +8,16 @@ http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
 
 Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
 ---
-Index: openssl-1.0.2/crypto/evp/digest.c
+Index: openssl-1.0.2h/crypto/evp/digest.c
 ===================================================================
---- openssl-1.0.2.orig/crypto/evp/digest.c
-+++ openssl-1.0.2/crypto/evp/digest.c
-@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
-         return 0;
+--- openssl-1.0.2h.orig/crypto/evp/digest.c
++++ openssl-1.0.2h/crypto/evp/digest.c
+@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
+         type = ctx->digest;
      }
  #endif
 -    if (ctx->digest != type) {
 +    if (type && (ctx->digest != type)) {
-         if (ctx->digest && ctx->digest->ctx_size)
+         if (ctx->digest && ctx->digest->ctx_size) {
              OPENSSL_free(ctx->md_data);
-         ctx->digest = type;
+             ctx->md_data = NULL;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index 290f129..ae65992 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -34,15 +34,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
-            file://crypto_use_bigint_in_x86-64_perl.patch \
             file://openssl-1.0.2a-x32-asm.patch \
             file://ptest_makefile_deps.patch  \
             file://configure-musl-target.patch \
             file://parallel.patch \
            "
-
-SRC_URI[md5sum] = "f3c710c045cdee5fd114feb69feba7aa"
-SRC_URI[sha256sum] = "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33"
+SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
+SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-- 
2.3.5


