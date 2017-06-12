Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 073BE7825B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 11:11:06 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v14so14035706pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CrnZO9v1as9hwtba9YiEIWhAJz6gQ9rWSo9eH4Bffjs=;
	b=gSJUXN3LdRjJnYSx8CiYziLnyJCmlAKnnGa37iov5wMQ2VBGqknBuLwFd0SJowXJns
	d1UGRao2ADFdDkWS4c3hP9zNHVx1U4Lr70wexyTQ1P2aGamHodn6JGT5vZYiCz09u4dZ
	a/38wsujhgNIbxu95G/B48xIgCyV7FExnDclABXPHwGGussYe5I8QXtV3Rbfzh2QWYt2
	XlGgtVWTw/OTuSLYlnVohio8sG55QEFjtdvgFA+WZVZ9R8DVGQq1cGXFSC/qsbPGJhPE
	bNEm6CaDYAjIgt7lX3xmH4fSymLwUwKN2sh97HiVPIC4h3YwyCTmUbAkfdJcFeZ0rBsy
	O14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CrnZO9v1as9hwtba9YiEIWhAJz6gQ9rWSo9eH4Bffjs=;
	b=JDyBRytYyvZSG/GmAmghZU5TqXvcFNUgTuCxXQF6+3qHyqpwUesO2lN3Jnp7ai/3Ap
	9qMnG5jvmO6GBRhsSesK+4mo8IedbeR0lUsIgbXFxTbgmMH9W+3qrGXDAp4h0/5BleVg
	3m2ddlssD0cC/tMxKfA5P2yPY+etlIDieH8DpZQqhXecRDtj8NYq4DTvCZau8oOhLHdZ
	eWDvLM1zJTVHydabWBt/fp5Fm9BhEkOw/5rSa240YFaGFMdiJhJisjJqxbjIPsEtDy39
	w8YbDXsGXgPAXjkGwmYtFT9PXGt3Xb4T9M3uOUQnZM9gRAwu1az+0117PpvPlQU71IZQ
	7Ueg==
X-Gm-Message-State: AODbwcB52jRup9jmeF9PrJdroVKSrMBxVN/4KH63gK/lY1pDun7lZU6t
	n3qS0a5f3KZGbjCX
X-Received: by 10.98.88.196 with SMTP id m187mr39740477pfb.87.1497265867837;
	Mon, 12 Jun 2017 04:11:07 -0700 (PDT)
Received: from ip-172-31-15-204.ap-northeast-2.compute.internal
	(ec2-13-124-88-129.ap-northeast-2.compute.amazonaws.com.
	[13.124.88.129])
	by smtp.gmail.com with ESMTPSA id n4sm18573730pgt.3.2017.06.12.04.11.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jun 2017 04:11:07 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 11:11:01 +0000
Message-Id: <1497265861-2562-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v4] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Mon, 12 Jun 2017 11:11:07 -0000

1. Dropped obsolete patches, because the new version contains them:
  - fix-cipher-des-ede3-cfb1.patch
  - openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
2. LICENSE checksum change due to copyright years and wording tweak.
3. Test binaries (x86-64) are included in source code. So remove those
only for ptest.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 21 --------------------
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 23 ----------------------
 .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}       | 15 +++++++++-----
 3 files changed, 10 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl_1.0.2l.bb} (85%)

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
similarity index 85%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
index 83d1a50..3638414 100644
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
@@ -60,3 +58,10 @@ do_configure_prepend() {
 		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
 	fi
 }
+
+do_install_ptest() {
+    # exclude binary files or the package won't install
+    for d in ssltest_old v3ext x509aux; do
+        rm -rf ${D}${libdir}/${PN}/ptest/test/$d
+    done
+}
-- 
2.7.4


