Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 59E5F916B6
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:14 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id r11so3927047pgf.1
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DM5eGyK10TnW9oNBIAiCxHRmNBQ/zrqKDb9/rs7m7fs=;
	b=Px37Knjbxr6SarPNQQjqck0MgB9dWYgdMl3R2sH8WRnIgPL333ct7zwCKdpn16NV2N
	q7sN9BDIy7Ml8bNNNwC6vCNTrFVewHhqlF6VG1kCPQCx/D4doaf2uRXPnNpbPDkVALnZ
	p+hqN/XHhxUxIYg2G9nK/0Hi6h5KjT+C3OKxtNIvwC72+T91KcfhCBZSIb/LH97bD66P
	dRrwQfwWQBuRuiEs4a7kiZjYZJ7JXGCFo9FzmafYgbcy1i0cURJMNZeB+or4HFL6m33T
	Ps3AQRLHypD5C93J6a3mpQR9fP7SXsP6VxK313NZRVFyJ1iHhJIJOeSnZ86VneDHZIXV
	7cUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DM5eGyK10TnW9oNBIAiCxHRmNBQ/zrqKDb9/rs7m7fs=;
	b=N9tkkExTlBpCkL+0t59JT/hBIDcF8I9gvljtAyy+eHeZzj1FrQOchSlp2B8Usq4/1X
	3HtBy5Ico3uTO/jPd88gVPDNAMiByv2RomLfD0GGqksWvTzQKVYnYyI3x+8rpJWOO0Of
	KrmrCf4ANHPUa23LQhOWfYDc/GIBOsV7Zn7ItnrTX4NsutW6PGAvR2Gt3ELC6J5oP/Jy
	71S+hTTTJdCTldah3HGADe98tN4pZivuMuwWByF3TlRHTKlM3uNT+wTNO83PtwRctnpL
	pw6MInSMMEiL4iKUTcop8vgRXeVwfKM+84DvC+zZ8oldUqnZDVsdbnmcoJlW1NOmSKa0
	wmyA==
X-Gm-Message-State: APjAAAV/9r66XwhtqGdMtYuCgPXmShmgwzggm2XUtC7yjjvc6ryIM+zb
	vy8e6uoPcPGg6Iz5/Is7G2j6mbk/
X-Google-Smtp-Source: APXvYqzMsNjDp+L89RXkfzW1Sv46MKIk+GlKVk2nZA6r+uIBZ7fp81eq9iccv6dHBuSS3009vZbKVQ==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr15174672pgc.450.1580055915238;
	Sun, 26 Jan 2020 08:25:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.14
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:48 -0800
Message-Id: <3402c001bc585bacb6e00495a7c3c66c75d16e7c.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 23/29] openssl: Upgrade 1.1.1b -> 1.1.1c
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:14 -0000

From: Adrian Bunk <bunk@stusta.de>

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/openssl/CVE-2019-1543.patch       | 69 -------------------
 .../openssl/openssl/afalg.patch               |  6 +-
 .../{openssl_1.1.1b.bb => openssl_1.1.1c.bb}  |  5 +-
 3 files changed, 5 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1b.bb => openssl_1.1.1c.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
deleted file mode 100644
index 900ef97fce..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/f426625b6ae9a7831010750490a5f0ad689c5ba3]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From f426625b6ae9a7831010750490a5f0ad689c5ba3 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Tue, 5 Mar 2019 14:39:15 +0000
-Subject: [PATCH] Prevent over long nonces in ChaCha20-Poly1305
-
-ChaCha20-Poly1305 is an AEAD cipher, and requires a unique nonce input for
-every encryption operation. RFC 7539 specifies that the nonce value (IV)
-should be 96 bits (12 bytes). OpenSSL allows a variable nonce length and
-front pads the nonce with 0 bytes if it is less than 12 bytes. However it
-also incorrectly allows a nonce to be set of up to 16 bytes. In this case
-only the last 12 bytes are significant and any additional leading bytes are
-ignored.
-
-It is a requirement of using this cipher that nonce values are unique.
-Messages encrypted using a reused nonce value are susceptible to serious
-confidentiality and integrity attacks. If an application changes the
-default nonce length to be longer than 12 bytes and then makes a change to
-the leading bytes of the nonce expecting the new value to be a new unique
-nonce then such an application could inadvertently encrypt messages with a
-reused nonce.
-
-Additionally the ignored bytes in a long nonce are not covered by the
-integrity guarantee of this cipher. Any application that relies on the
-integrity of these ignored leading bytes of a long nonce may be further
-affected.
-
-Any OpenSSL internal use of this cipher, including in SSL/TLS, is safe
-because no such use sets such a long nonce value. However user
-applications that use this cipher directly and set a non-default nonce
-length to be longer than 12 bytes may be vulnerable.
-
-CVE: CVE-2019-1543
-
-Fixes #8345
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/8406)
-
-(cherry picked from commit 2a3d0ee9d59156c48973592331404471aca886d6)
----
- crypto/evp/e_chacha20_poly1305.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/crypto/evp/e_chacha20_poly1305.c b/crypto/evp/e_chacha20_poly1305.c
-index c1917bb86a6..d3e2c622a1b 100644
---- a/crypto/evp/e_chacha20_poly1305.c
-+++ b/crypto/evp/e_chacha20_poly1305.c
-@@ -30,6 +30,8 @@ typedef struct {
- 
- #define data(ctx)   ((EVP_CHACHA_KEY *)(ctx)->cipher_data)
- 
-+#define CHACHA20_POLY1305_MAX_IVLEN     12
-+
- static int chacha_init_key(EVP_CIPHER_CTX *ctx,
-                            const unsigned char user_key[CHACHA_KEY_SIZE],
-                            const unsigned char iv[CHACHA_CTR_SIZE], int enc)
-@@ -533,7 +535,7 @@ static int chacha20_poly1305_ctrl(EVP_CIPHER_CTX *ctx, int type, int arg,
-         return 1;
- 
-     case EVP_CTRL_AEAD_SET_IVLEN:
--        if (arg <= 0 || arg > CHACHA_CTR_SIZE)
-+        if (arg <= 0 || arg > CHACHA20_POLY1305_MAX_IVLEN)
-             return 0;
-         actx->nonce_len = arg;
-         return 1;
diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
index 7c4b084f3d..b7c0e9697f 100644
--- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
+++ b/meta/recipes-connectivity/openssl/openssl/afalg.patch
@@ -18,14 +18,14 @@ index 3baa8ce..9ef52ed 100755
 -            ($mi2) = $mi2 =~ /(\d+)/;
 -            my $ver = $ma*10000 + $mi1*100 + $mi2;
 -            if ($ver < $minver) {
--                $disabled{afalgeng} = "too-old-kernel";
+-                disable('too-old-kernel', 'afalgeng');
 -            } else {
 -                push @{$config{engdirs}}, "afalg";
 -            }
 -        } else {
--            $disabled{afalgeng} = "cross-compiling";
+-            disable('cross-compiling', 'afalgeng');
 -        }
 +        push @{$config{engdirs}}, "afalg";
      } else {
-         $disabled{afalgeng}  = "not-linux";
+         disable('not-linux', 'afalgeng');
      }
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
index 13e6ad4db7..94f4d49724 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
@@ -16,15 +16,14 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
-           file://CVE-2019-1543.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "4532712e7bcc9414f5bce995e4e13930"
-SRC_URI[sha256sum] = "5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b"
+SRC_URI[md5sum] = "15e21da6efe8aa0e0768ffd8cd37a5f6"
+SRC_URI[sha256sum] = "f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1


