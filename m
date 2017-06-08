Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3214E719A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 08:18:41 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so4301053pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 01:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YxHdCKHUOds/S3D7ztuIDaYTXJeN8/6/w3Y2619IPbQ=;
	b=CZHX06FK0f2hv4oP99ZAY/hQWnaKlHDh9w4GapoiDpHkBeQ8PZokc/7xIb1HhLuS3X
	EFwwBB3RLqwGGFUy4lu91+TjtUZpUq/PCU4PiK8TB9l44P4RqC6qqTLaQxwFhQd4+exf
	bWCkaVeeBe/kv/FwJijT+CWZncjh8m5CNroS9zDBKUyRbCwNJhucypNyGqtjDo/F4X6C
	XdWRhS95ONTPRG2o+MsumvO2YtYnc+D2TAj7KKQ8w07TDgfi5OMnOXofyc0HSlh6PguO
	vVGTPRyHGG5HLdXH1TIja1VHV4tx0qTeDl5yn2NblpUntryJ0huAIE1Nbyl73QyLVRNM
	vjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YxHdCKHUOds/S3D7ztuIDaYTXJeN8/6/w3Y2619IPbQ=;
	b=jTpDDinWYLlhScVdCRNxlRpLCIaGam7q5PoiyWZrLuM4Xu/r0epCYyFSXOOp7+JKxe
	8WuKmnj/blrX6hdAQnYMSF1wPi09QgTHDLbYSM/t7fSgGWnEC+ejWNEeLKySgWYInT3O
	lXw0zRsigPkyIVMkhDD3k0OQS5JxvT48B2VCO4+1bgb/U6lcZX8sgUXxZE3XAQaNjO7D
	O/Z7rZSAURTd3D5u6MihiTxP2X2vR/lxA3EAszhrF6yQVsxKFIvv9XvFVginE0gA0pvf
	x61uUeUMnaax6VnqfvH7AcvEl+HYVP2Odxr8G0Cl1VcVrlL21tSuwcm71KHL3O8T1dOf
	2Hkg==
X-Gm-Message-State: AODbwcCV2blHNuf9v7wjWAFYXJzmOYMMDASuwy+XX6j5sqNZhLZZ1KRK
	0n63WBcDzY0l1tD0uv0=
X-Received: by 10.84.218.133 with SMTP id r5mr33904746pli.190.1496909923134;
	Thu, 08 Jun 2017 01:18:43 -0700 (PDT)
Received: from ip-172-31-15-204.ap-northeast-2.compute.internal
	(ec2-13-124-88-129.ap-northeast-2.compute.amazonaws.com.
	[13.124.88.129]) by smtp.gmail.com with ESMTPSA id
	188sm7654017pgc.49.2017.06.08.01.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jun 2017 01:18:42 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 08:18:36 +0000
Message-Id: <1496909916-10483-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] openssl: Upgrade 1.0.2k -> 1.0.2l
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
X-List-Received-Date: Thu, 08 Jun 2017 08:18:43 -0000

Patch fix-cipher-des-ede3-cfb1.patch was removed as it is included
in this release.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch  | 21 ---------------------
 .../{openssl_1.0.2k.bb => openssl_1.0.2l.bb}        |  7 +++----
 2 files changed, 3 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb1.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2k.bb => openssl_1.0.2l.bb} (90%)

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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
similarity index 90%
rename from meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
index 83d1a50..6390746 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
@@ -7,7 +7,7 @@ DEPENDS += "cryptodev-linux"
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 CFLAG_append_class-native = " -fPIC"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=057d9218c6180e1d9ee407572b2dd225"
 
 export DIRS = "crypto ssl apps engines"
 export OE_LDFLAGS="${LDFLAGS}"
@@ -32,7 +32,6 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://debian1.0.2/version-script.patch \
             file://debian1.0.2/soname.patch \
             file://openssl_fix_for_x32.patch \
-            file://fix-cipher-des-ede3-cfb1.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
@@ -45,8 +44,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
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


