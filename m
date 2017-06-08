Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8DFEB78170
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:51:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f27so5034962pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bfnb6bzLe02wG+5hW+CtrLXh/fkcuBY5k0vnoCZ3Os4=;
	b=KuGWbyDrjPslcPzgyVmG8lJ8ZvZ4J80YYgA+rORKpO0S3RGKMxdmH0SewYqCKVcy9z
	UJh2CTaY0w6SLHTq/IhbbXbachnz4MN6Yd9ld85f/ya1sTfAsvbp4XOKuSCblWP1Md2i
	zWz5cGp242iqLGu53wwvFv/bdlzfqORl9HP2PNPIhh1c9dt+TMLGWUq8B3gny+AXm/Nt
	LKGvqC66OC95klIyjtMwyWnDlIJrtOUIwRg7Kl2MJtEXtU5xuNxGopvCl5ivTcgbsiPP
	81TRpBryspkUZWxpUWUHYX+DtEzzIbR16aE/BscVSQ2YSo1egPAFE6eKjmPgR36D00Tm
	MTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bfnb6bzLe02wG+5hW+CtrLXh/fkcuBY5k0vnoCZ3Os4=;
	b=n2EpFHM+Y+vqsl9AwqmRPsmwzT1D3biTmusS7bnQSwR90xXG/gt9Rs0sKbpQrfP/He
	BvMqQ387170QI5Qdn8LbAVrhm6/znK5n6KAhBe4d8vizGgjVvNhZVkyyFAHdLSAjFot5
	TgM8Ieh+z7hHgVFBeuoz1zqiUlNRf/jeyIziofhwK/UN7wovOsqkANihnUSOpNGDJl//
	6j0kuUjRWO3idOTwt5B9mdlrxyCYuaYNpGqS5NVAx4oitz6zi6UlTnoDyHw8z4UzhOtu
	QdRnC0Ux2kvVTVrtOrx+IhLtXdDnM2ZZQEPT5fTqVjXo41X6bmxzmpAjhuSCl5mhdpAc
	FLHg==
X-Gm-Message-State: AODbwcCK2V2DHI0ezwRKuwrX8HiF/JiIocND/JRPRjGnz7iuELKMSqsI
	e0clbO0NF2GYkIKbaig=
X-Received: by 10.98.147.67 with SMTP id b64mr36722636pfe.145.1496926317588;
	Thu, 08 Jun 2017 05:51:57 -0700 (PDT)
Received: from ip-172-31-15-204.ap-northeast-2.compute.internal
	(ec2-13-124-88-129.ap-northeast-2.compute.amazonaws.com.
	[13.124.88.129]) by smtp.gmail.com with ESMTPSA id
	d185sm9046538pgc.39.2017.06.08.05.51.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 05:51:57 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 12:51:51 +0000
Message-Id: <1496926311-12090-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Thu, 08 Jun 2017 12:51:56 -0000

Dropped obsolete patches, because the new version contains them:
  - fix-cipher-des-ede3-cfb1.patch
  - openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 21 --------------------
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 23 ----------------------
 .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}       |  8 +++-----
 3 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl_1.0.2l.bb} (86%)

diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
deleted file mode 100644
index 2a318a4..0000000
--- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Submitted
-
-This patch adds the fix for one of the ciphers used in openssl, namely
-the cipher des-ede3-cfb1. Complete bug log and patch is present here:
-http://rt.openssl.org/Ticket/Display.html?id=2867
-
-Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
-
-Index: openssl-1.0.2/crypto/evp/e_des3.c
-===================================================================
---- openssl-1.0.2.orig/crypto/evp/e_des3.c
-+++ openssl-1.0.2/crypto/evp/e_des3.c
-@@ -211,7 +211,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPH
-     size_t n;
-     unsigned char c[1], d[1];
- 
--    for (n = 0; n < inl; ++n) {
-+    for (n = 0; n * 8 < inl; ++n) {
-         c[0] = (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
-         DES_ede3_cfb_encrypt(c, d, 1, 1,
-                              &data(ctx)->ks1, &data(ctx)->ks2,
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
deleted file mode 100644
index f736e5c..0000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()
-
-We should avoid accessing the type pointer if it's NULL,
-this could happen if ctx->digest is not NULL.
-
-Upstream-Status: Submitted
-http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
----
-Index: openssl-1.0.2h/crypto/evp/digest.c
-===================================================================
---- openssl-1.0.2h.orig/crypto/evp/digest.c
-+++ openssl-1.0.2h/crypto/evp/digest.c
-@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
-         type = ctx->digest;
-     }
- #endif
--    if (ctx->digest != type) {
-+    if (type && (ctx->digest != type)) {
-         if (ctx->digest && ctx->digest->ctx_size) {
-             OPENSSL_free(ctx->md_data);
-             ctx->md_data = NULL;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
similarity index 86%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
index 83d1a50..a2ef2ac 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
@@ -7,7 +7,7 @@ DEPENDS += "cryptodev-linux"
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
 
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
@@ -32,8 +32,6 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://debian1.0.2/version-script.patch \
             file://debian1.0.2/soname.patch \
             file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
-            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
             file://ptest-deps.patch \
@@ -45,8 +43,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://Use-SHA256-not-MD5-as-default-digest.patch \
             file://0001-Fix-build-with-clang-using-external-assembler.patch \
             "
-SRC_URI[md5sum] = "f965fc0bf01bf882b31314b61391ae65"
-SRC_URI[sha256sum] = "6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0"
+SRC_URI[md5sum] = "f85123cd390e864dfbe517e7616e6566"
+SRC_URI[sha256sum] = "ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c"
 
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
-- 
2.7.4


