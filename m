Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B318477E81
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jun 2017 15:23:40 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j186so12623501pge.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jun 2017 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=T5S2+yZOd/qnnipmN1K9s+7+c7jZy2xwYSobujaVW7E=;
	b=SyH4zE98pBLjP+IXn+pswEEhiIwmUCLOanpkLR2aV4NnmkymW2raQwaneeLIFghTPD
	FSpzggd3CtYDKQTSliERSKCCtLkhXIL2BrnwwmWDBKhKTY6giUiJLV0Eio26hj5g0Pau
	jadzRA8wYtA8fWJf1nt+NmVWLtXPitMde0XbB7lYi06kwkCDdys8OG0YKe92nJEYxcNa
	HINggbFtpBDYQLtHZF6sqT6cy9klE4zDW+XX92ypf10uci2CNDyJsOQU/sVDtxiznxmL
	Hpmgs3iwOMyztW/5Z7uMekNAnvr60kY97B4HSeRYFaY7pInqnXJmKXqVb6uRPXFF6J90
	fzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T5S2+yZOd/qnnipmN1K9s+7+c7jZy2xwYSobujaVW7E=;
	b=jsdPoP5KGKzRH4CnYJRHIIIMHR0KcDIOVF6R27FZnno2a+/T7/hpocF6rPLpTqbMAJ
	4Yv3xPtqWNuabSRUZuQM+u9IUcbwRvD0B7OaFW5hqSgFr37zfVsuWezPikt+IlJPSbaD
	lcQ529Xy+gHF694IXlWYHeTmkmRQdGyv2Fhw1Kp9Q9Zocy/OalEG3kYx5PL5MVPhZGrd
	9ZnBCZ/YRjQLKO9geKNVhv1CWOOchmO+fjMwKq0CSOCI8pxlVbMN8chsWjIeyzyTpoPq
	oyP49LMydXhiqBFHexihrf8yWlYuHbB0977Jbd+fEpB/wU3E7ECl6a9X5keeW50Lthcz
	ArVw==
X-Gm-Message-State: AKS2vOyrZmTnE4sAXAojyde5WT31rRMrXH3VIpw2qtqCE+p98/v5m8Z4
	03kEsHYdONDdZa9c
X-Received: by 10.84.232.70 with SMTP id f6mr11830818pln.169.1497799422126;
	Sun, 18 Jun 2017 08:23:42 -0700 (PDT)
Received: from ip-172-31-15-204.ap-northeast-2.compute.internal
	(ec2-13-124-88-129.ap-northeast-2.compute.amazonaws.com.
	[13.124.88.129]) by smtp.gmail.com with ESMTPSA id
	p90sm10468476pfj.8.2017.06.18.08.23.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Jun 2017 08:23:41 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Jun 2017 15:23:34 +0000
Message-Id: <1497799414-14316-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v6] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Sun, 18 Jun 2017 15:23:41 -0000

1. Dropped obsolete patches, because the new version contains them:
  - fix-cipher-des-ede3-cfb1.patch
  - openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
2. LICENSE checksum change due to copyright years and wording tweak.
3. Test binaries (x86-64) are included in source code. So remove those
only for ptest.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |  5 +++++
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 21 --------------------
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 23 ----------------------
 .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}       |  8 +++-----
 4 files changed, 8 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl_1.0.2l.bb} (86%)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 8f2a797..e39cd6c 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -239,6 +239,11 @@ do_install_ptest () {
 	# modified again later when stripping them, but that's okay.
 	touch ${D}${PTEST_PATH}
 	find ${D}${PTEST_PATH} -type f -print0 | xargs --verbose -0 touch -r ${D}${PTEST_PATH}
+
+	# exclude binary files or the package won't install
+	for d in ssltest_old v3ext x509aux; do
+		rm -rf ${D}${libdir}/${BPN}/ptest/test/$d
+	done
 }
 
 do_install_append_class-native() {
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


