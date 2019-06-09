Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 45C7E7E573
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:26 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k187so3165757pga.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=emMzcGmrJU/OToQOXhRsqW9APYWgiTSRBZEOjMB16CM=;
	b=a6macOM6g4qo9lMtYyUiLqnYnJU6tzI0Aek0ZqK11/D+eO9vA/go+Yh1Grsi+7iN4b
	6TUJ7hIAgD/XfxKjxhrVzGNjYswtvb4q3nHU9EsROI4o1ezP4qdjGbC3lm2/6MjX0WN/
	C8vX1zrGZwCICO1EC3tWW1hdSX9n8wQ88zana1SecDoAO8YfKGNiONZiD3hpsGC8z86/
	c4nTynH/V8taGJcuAJo6A/Sueu6q3qlZga5R6NIVfgLqflbQs/HtZP2YSqa3phzBAK54
	wzpR73WCjvmpH090c/pkUDBWJ5rzA/YIg0dG0sv3BExdqNojh8aBRGaYIa8sIp1rzujg
	LIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=emMzcGmrJU/OToQOXhRsqW9APYWgiTSRBZEOjMB16CM=;
	b=kW6L77MtXeenluDaCqUsSmOVWI/+rzId9ayujghrZTE16f/iss1UizZ6g3YIkTpyH2
	y2TDWMEhr8gRUBv9UNEQ/RDEDgNPUF7WSsVyXseAh/Z+uorNJLJqQsab7WVORZpuX7uj
	vaEKijeQrAZjbBsv/1YqxkaXiO1uGtXGT8ngqBGOwj279dy+fxfqVe8yrgVn0N+/bH1A
	vPS0bzUMRkHYFV+VatXA/mSMAEIfGux3q61trrFuxoBvKE7eNdZTz0k2Z30CSccoPbX9
	EeIdPSZa+o/ZLqEQpPRd+jiWet2qqInKMMciV15lRPMZTotapGV6aIvfQq5EK8lbF86x
	frzw==
X-Gm-Message-State: APjAAAU2KoGgediMBISkpCZgr+lfxUfKFSv8bXX7WbJoxu9f8FJVS0ep
	jHyjOFDPZ2xwuwJai5m+Atz36aXJ
X-Google-Smtp-Source: APXvYqw+ec5/fxgxIW8RR5qaqA2lKzojpQUuO9rxNDKvcN+qsC0AOeRXYk2gKMPaiULKjgxBP9q9Ug==
X-Received: by 2002:a63:da49:: with SMTP id l9mr11836247pgj.320.1560092067198; 
	Sun, 09 Jun 2019 07:54:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:59 -0700
Message-Id: <682c4119e95056d68513772261425bdc66e1fd2e.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 24/27] openssl: Upgrade 1.1.1b -> 1.1.1c
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:26 -0000

From: Adrian Bunk <bunk@stusta.de>

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssl/openssl/CVE-2019-1543.patch            | 69 ----------------------
 .../openssl/openssl/afalg.patch                    |  6 +-
 .../{openssl_1.1.1b.bb => openssl_1.1.1c.bb}       |  5 +-
 3 files changed, 5 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1b.bb => openssl_1.1.1c.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
deleted file mode 100644
index 900ef97..0000000
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
index 7c4b084..b7c0e96 100644
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
index d3404d2..1445838 100644
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
2.7.4


