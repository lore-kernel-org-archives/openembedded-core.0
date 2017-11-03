Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0B478367
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:55:05 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n14so2928032pfh.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=X0ZQ/hb9Isi4NJoCtfVIVvfUwqviXiLaqFcba02wQb8=;
	b=VJ2NCiFvzieCdUXApibp7H044N1bXMVb99SKlNjraVYDihDnZAjLkxBkp5WuTP5P6+
	USRavUvAXIYKbzwhEnSqXXFTnkR4z5jCs3bnIsPzA3B6crvlPXtqoYKIHt2T6Y5+J9y+
	HfRvs6eEUmRn7CrJezwR0fKP5dPwdBmdI3hIBUrybYAyPNAw5zhgq6ricpw+2px4ab6D
	drcy461YpsqiiUWdOqpFjHNQWRV6GiLngHCpeUSq7ctAOqfYTH9dRb6d6u3pZY8w7k0A
	t25KSuqvl/Y056thr/DO1Woa3ubhA+25Q/R99F4Emy75y3OyJEkdnspJM6pI/3srNcD+
	EMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X0ZQ/hb9Isi4NJoCtfVIVvfUwqviXiLaqFcba02wQb8=;
	b=Nv0lycVKjP3R5FZSvYYaSnBiQTeykFzhnXBvOns0f0T8sRdWFwIhFdvjcn/sIkDPgu
	vgNn6RaqVB3pOciY3RaKVXGVmzLRUg3o8jRRQ8ugZaswQ45HjYq13SBHACTBeKgLpw3P
	KgC0mYKJlHqKjT73wBYBDH/VO7+JDNGkE5yKHNr+tqjl8KxvVBP8qe67BQ1J/e84hUcQ
	kgzmLvoXNsTUsOhGsFxfMbMGxXa09eSrBc+wuj2MgB7yHivlRkKv/cvdzfvrdu6KFXDU
	a+zfW3IXO1M3ezjNgjNVrzGsorhcdRuXrS2aKXppt9tos3c2mmUxPUyE1/MappoVB4xg
	O1Jg==
X-Gm-Message-State: AMCzsaWlNrCfWIYWlkJ6QbL3NyOoY4D8Kf5VnHoyYyiFW9/X+DrHfljT
	WV1iiJLovuK4xQPXNiDSC+F+wg==
X-Google-Smtp-Source: ABhQp+RGyGK4oKqFQ7/2H+UNQF7pclW+vrSIKJ6wZ6qPuKyRYbFjOerlcfjw0yNN/fpDA5tg4mJ9dQ==
X-Received: by 10.101.93.140 with SMTP id f12mr8186147pgt.60.1509738906653;
	Fri, 03 Nov 2017 12:55:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.55.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:49 -0700
Message-Id: <05c76e834944c8f71510b21ff301546596147b9e.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 15/15] openssh: update to 7.6
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
X-List-Received-Date: Fri, 03 Nov 2017 19:55:05 -0000

LICENSE changed do to name being added

removed patches included in some form

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openssh/add-test-support-for-busybox.patch     |  64 ++++-------
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 119 ---------------------
 ...h-7.1p1-conditional-compile-des-in-pkcs11.patch |  70 ------------
 .../openssh/{openssh_7.5p1.bb => openssh_7.6p1.bb} |  11 +-
 4 files changed, 25 insertions(+), 239 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.5p1.bb => openssh_7.6p1.bb} (94%)

diff --git a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
index adc25c6..b8402a4 100644
--- a/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
+++ b/meta/recipes-connectivity/openssh/openssh/add-test-support-for-busybox.patch
@@ -6,64 +6,42 @@ Adjust test cases to work with busybox.
 Signed-off-by: Maxin B. John <maxin.john@enea.com>
 Upstream-Status: Pending
 
-Index: openssh-6.8p1/regress/cipher-speed.sh
+Index: openssh-7.6p1/regress/cipher-speed.sh
 ===================================================================
---- openssh-6.8p1.orig/regress/cipher-speed.sh
-+++ openssh-6.8p1/regress/cipher-speed.sh
+--- openssh-7.6p1.orig/regress/cipher-speed.sh
++++ openssh-7.6p1/regress/cipher-speed.sh
 @@ -17,7 +17,7 @@ for c in `${SSH} -Q cipher`; do n=0; for
  		printf "%-60s" "$c/$m:"
  		( ${SSH} -o 'compression no' \
- 			-F $OBJ/ssh_proxy -2 -m $m -c $c somehost \
+ 			-F $OBJ/ssh_proxy -m $m -c $c somehost \
 -			exec sh -c \'"dd of=/dev/null obs=32k"\' \
 +			exec sh -c \'"dd of=/dev/null bs=32k"\' \
  		< ${DATA} ) 2>&1 | getbytes
  
  		if [ $? -ne 0 ]; then
-@@ -42,7 +42,7 @@ for c in $ciphers; do
- 		printf "%-60s" "$c:"
- 		( ${SSH} -o 'compression no' \
- 			-F $OBJ/ssh_proxy -1 -c $c somehost \
--			exec sh -c \'"dd of=/dev/null obs=32k"\' \
-+			exec sh -c \'"dd of=/dev/null bs=32k"\' \
- 		< ${DATA} ) 2>&1 | getbytes
- 		if [ $? -ne 0 ]; then
- 			fail "ssh -1 failed with cipher $c"
-Index: openssh-6.8p1/regress/transfer.sh
-===================================================================
---- openssh-6.8p1.orig/regress/transfer.sh
-+++ openssh-6.8p1/regress/transfer.sh
-@@ -15,7 +15,7 @@ for p in ${SSH_PROTOCOLS}; do
- 	for s in 10 100 1k 32k 64k 128k 256k; do
- 		trace "proto $p dd-size ${s}"
- 		rm -f ${COPY}
--		dd if=$DATA obs=${s} 2> /dev/null | \
-+		dd if=$DATA bs=${s} 2> /dev/null | \
- 			${SSH} -q -$p -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
- 		if [ $? -ne 0 ]; then
- 			fail "ssh cat $DATA failed"
-Index: openssh-6.8p1/regress/yes-head.sh
+Index: openssh-7.6p1/regress/transfer.sh
 ===================================================================
---- openssh-6.8p1.orig/regress/yes-head.sh
-+++ openssh-6.8p1/regress/yes-head.sh
-@@ -4,7 +4,7 @@
- tid="yes pipe head"
- 
- for p in ${SSH_PROTOCOLS}; do
--	lines=`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do echo yes;done | _POSIX2_VERSION=199209 head -2000"' | (sleep 3 ; wc -l)`
-+	lines=`${SSH} -$p -F $OBJ/ssh_proxy thishost 'sh -c "while true;do echo yes;done | _POSIX2_VERSION=199209 head -n 2000"' | (sleep 3 ; wc -l)`
+--- openssh-7.6p1.orig/regress/transfer.sh
++++ openssh-7.6p1/regress/transfer.sh
+@@ -13,7 +13,7 @@ cmp ${DATA} ${COPY}		|| fail "corrupted
+ for s in 10 100 1k 32k 64k 128k 256k; do
+ 	trace "dd-size ${s}"
+ 	rm -f ${COPY}
+-	dd if=$DATA obs=${s} 2> /dev/null | \
++	dd if=$DATA bs=${s} 2> /dev/null | \
+ 		${SSH} -q -F $OBJ/ssh_proxy somehost "cat > ${COPY}"
  	if [ $? -ne 0 ]; then
- 		fail "yes|head test failed"
- 		lines = 0;
-Index: openssh-6.8p1/regress/key-options.sh
+ 		fail "ssh cat $DATA failed"
+Index: openssh-7.6p1/regress/key-options.sh
 ===================================================================
---- openssh-6.8p1.orig/regress/key-options.sh
-+++ openssh-6.8p1/regress/key-options.sh
-@@ -54,7 +54,7 @@ for p in ${SSH_PROTOCOLS}; do
+--- openssh-7.6p1.orig/regress/key-options.sh
++++ openssh-7.6p1/regress/key-options.sh
+@@ -47,7 +47,7 @@ for f in 127.0.0.1 '127.0.0.0\/8'; do
  	fi
  
  	sed 's/.*/from="'"$f"'" &/' $origkeys >$authkeys
 -	from=`head -1 $authkeys | cut -f1 -d ' '`
 +	from=`head -n 1 $authkeys | cut -f1 -d ' '`
- 	verbose "key option proto $p $from"
- 	r=`${SSH} -$p -q -F $OBJ/ssh_proxy somehost 'echo true'`
+ 	verbose "key option $from"
+ 	r=`${SSH} -q -F $OBJ/ssh_proxy somehost 'echo true'`
  	if [ "$r" = "true" ]; then
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
deleted file mode 100644
index 1098b97..0000000
--- a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 27740c918fe5d78441bcf69e7d2eefb23ddeca4c Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 19 Jan 2017 03:00:08 -0500
-Subject: [PATCH 1/3] Remove des in cipher.
-
-Upstream-Status: Pending
-
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- cipher.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/cipher.c b/cipher.c
-index 2def333..59f6792 100644
---- a/cipher.c
-+++ b/cipher.c
-@@ -53,8 +53,10 @@
- 
- #ifdef WITH_SSH1
- extern const EVP_CIPHER *evp_ssh1_bf(void);
-+#ifndef OPENSSL_NO_DES
- extern const EVP_CIPHER *evp_ssh1_3des(void);
- extern int ssh1_3des_iv(EVP_CIPHER_CTX *, int, u_char *, int);
-+#endif /* OPENSSL_NO_DES */
- #endif
- 
- struct sshcipher_ctx {
-@@ -88,15 +90,19 @@ struct sshcipher {
- 
- static const struct sshcipher ciphers[] = {
- #ifdef WITH_SSH1
-+#ifndef OPENSSL_NO_DES
- 	{ "des",	SSH_CIPHER_DES, 8, 8, 0, 0, 0, 1, EVP_des_cbc },
- 	{ "3des",	SSH_CIPHER_3DES, 8, 16, 0, 0, 0, 1, evp_ssh1_3des },
-+#endif /* OPENSSL_NO_DES */
- # ifndef OPENSSL_NO_BF
- 	{ "blowfish",	SSH_CIPHER_BLOWFISH, 8, 32, 0, 0, 0, 1, evp_ssh1_bf },
- # endif /* OPENSSL_NO_BF */
- #endif /* WITH_SSH1 */
- #ifdef WITH_OPENSSL
-+#ifndef OPENSSL_NO_DES
- 	{ "none",	SSH_CIPHER_NONE, 8, 0, 0, 0, 0, 0, EVP_enc_null },
- 	{ "3des-cbc",	SSH_CIPHER_SSH2, 8, 24, 0, 0, 0, 1, EVP_des_ede3_cbc },
-+#endif /* OPENSSL_NO_DES */
- # ifndef OPENSSL_NO_BF
- 	{ "blowfish-cbc",
- 			SSH_CIPHER_SSH2, 8, 16, 0, 0, 0, 1, EVP_bf_cbc },
-@@ -180,8 +186,10 @@ cipher_keylen(const struct sshcipher *c)
- u_int
- cipher_seclen(const struct sshcipher *c)
- {
-+#ifndef OPENSSL_NO_DES
- 	if (strcmp("3des-cbc", c->name) == 0)
- 		return 14;
-+#endif /* OPENSSL_NO_DES */
- 	return cipher_keylen(c);
- }
- 
-@@ -230,11 +238,13 @@ u_int
- cipher_mask_ssh1(int client)
- {
- 	u_int mask = 0;
-+#ifndef OPENSSL_NO_DES
- 	mask |= 1 << SSH_CIPHER_3DES;		/* Mandatory */
- 	mask |= 1 << SSH_CIPHER_BLOWFISH;
- 	if (client) {
- 		mask |= 1 << SSH_CIPHER_DES;
- 	}
-+#endif /*OPENSSL_NO_DES*/
- 	return mask;
- }
- 
-@@ -606,7 +616,9 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
- 	switch (c->number) {
- #ifdef WITH_OPENSSL
- 	case SSH_CIPHER_SSH2:
-+#ifndef OPENSSL_NO_DES
- 	case SSH_CIPHER_DES:
-+#endif /* OPENSSL_NO_DES */
- 	case SSH_CIPHER_BLOWFISH:
- 		evplen = EVP_CIPHER_CTX_iv_length(cc->evp);
- 		if (evplen == 0)
-@@ -629,8 +641,10 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
- 		break;
- #endif
- #ifdef WITH_SSH1
-+#ifndef OPENSSL_NO_DES
- 	case SSH_CIPHER_3DES:
- 		return ssh1_3des_iv(cc->evp, 0, iv, 24);
-+#endif /* OPENSSL_NO_DES */
- #endif
- 	default:
- 		return SSH_ERR_INVALID_ARGUMENT;
-@@ -654,7 +668,9 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
- 	switch (c->number) {
- #ifdef WITH_OPENSSL
- 	case SSH_CIPHER_SSH2:
-+#ifndef OPENSSL_NO_DES
- 	case SSH_CIPHER_DES:
-+#endif /* OPENSSL_NO_DES */
- 	case SSH_CIPHER_BLOWFISH:
- 		evplen = EVP_CIPHER_CTX_iv_length(cc->evp);
- 		if (evplen <= 0)
-@@ -675,8 +691,10 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
- 		break;
- #endif
- #ifdef WITH_SSH1
-+#ifndef OPENSSL_NO_DES
- 	case SSH_CIPHER_3DES:
- 		return ssh1_3des_iv(cc->evp, 1, (u_char *)iv, 24);
-+#endif /* OPENSSL_NO_DES */
- #endif
- 	default:
- 		return SSH_ERR_INVALID_ARGUMENT;
--- 
-2.8.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
deleted file mode 100644
index 47dc73b..0000000
--- a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From e816fc06e4f8070b09e677ead4d21768784e4c99 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 19 Jan 2017 03:21:40 -0500
-Subject: [PATCH 2/3] remove des in pkcs11.
-
-Upstream-Status: Pending
-
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- pkcs11.h | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/pkcs11.h b/pkcs11.h
-index b01d58f..98b36e6 100644
---- a/pkcs11.h
-+++ b/pkcs11.h
-@@ -342,9 +342,11 @@ typedef unsigned long ck_key_type_t;
- #define CKK_GENERIC_SECRET	(0x10)
- #define CKK_RC2			(0x11)
- #define CKK_RC4			(0x12)
-+#ifndef OPENSSL_NO_DES
- #define CKK_DES			(0x13)
- #define CKK_DES2		(0x14)
- #define CKK_DES3		(0x15)
-+#endif /* OPENSSL_NO_DES */
- #define CKK_CAST		(0x16)
- #define CKK_CAST3		(0x17)
- #define CKK_CAST128		(0x18)
-@@ -512,6 +514,7 @@ typedef unsigned long ck_mechanism_type_t;
- #define CKM_RC2_CBC_PAD			(0x105)
- #define CKM_RC4_KEY_GEN			(0x110)
- #define CKM_RC4				(0x111)
-+#ifndef OPENSSL_NO_DES
- #define CKM_DES_KEY_GEN			(0x120)
- #define CKM_DES_ECB			(0x121)
- #define CKM_DES_CBC			(0x122)
-@@ -525,6 +528,7 @@ typedef unsigned long ck_mechanism_type_t;
- #define CKM_DES3_MAC			(0x134)
- #define CKM_DES3_MAC_GENERAL		(0x135)
- #define CKM_DES3_CBC_PAD		(0x136)
-+#endif /* OPENSSL_NO_DES */
- #define CKM_CDMF_KEY_GEN		(0x140)
- #define CKM_CDMF_ECB			(0x141)
- #define CKM_CDMF_CBC			(0x142)
-@@ -610,8 +614,10 @@ typedef unsigned long ck_mechanism_type_t;
- #define CKM_MD5_KEY_DERIVATION		(0x390)
- #define CKM_MD2_KEY_DERIVATION		(0x391)
- #define CKM_SHA1_KEY_DERIVATION		(0x392)
-+#ifndef OPENSSL_NO_DES
- #define CKM_PBE_MD2_DES_CBC		(0x3a0)
- #define CKM_PBE_MD5_DES_CBC		(0x3a1)
-+#endif /* OPENSSL_NO_DES */
- #define CKM_PBE_MD5_CAST_CBC		(0x3a2)
- #define CKM_PBE_MD5_CAST3_CBC		(0x3a3)
- #define CKM_PBE_MD5_CAST5_CBC		(0x3a4)
-@@ -620,8 +626,10 @@ typedef unsigned long ck_mechanism_type_t;
- #define CKM_PBE_SHA1_CAST128_CBC	(0x3a5)
- #define CKM_PBE_SHA1_RC4_128		(0x3a6)
- #define CKM_PBE_SHA1_RC4_40		(0x3a7)
-+#ifndef OPENSSL_NO_DES
- #define CKM_PBE_SHA1_DES3_EDE_CBC	(0x3a8)
- #define CKM_PBE_SHA1_DES2_EDE_CBC	(0x3a9)
-+#endif /* OPENSSL_NO_DES */
- #define CKM_PBE_SHA1_RC2_128_CBC	(0x3aa)
- #define CKM_PBE_SHA1_RC2_40_CBC		(0x3ab)
- #define CKM_PKCS5_PBKD2			(0x3b0)
--- 
-2.8.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
similarity index 94%
rename from meta/recipes-connectivity/openssh/openssh_7.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.6p1.bb
index 86ca6ff..ebb9a57 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
@@ -6,7 +6,7 @@ and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
 # openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
 DEPENDS = "zlib openssl10"
@@ -21,19 +21,16 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd@.service \
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
-           file://add-test-support-for-busybox.patch \
            file://run-ptest \
-           file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
-           file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
-           file://0001-openssh-Fix-syntax-error-on-x32.patch \
            file://sshd_check_keys \
+           file://add-test-support-for-busybox.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "652fdc7d8392f112bef11cacf7e69e23"
-SRC_URI[sha256sum] = "9846e3c5fab9f0547400b4d2c017992f914222b3fd1f8eee6c7dc6bc5e59f9f0"
+SRC_URI[md5sum] = "06a88699018e5fef13d4655abfed1f63"
+SRC_URI[sha256sum] = "a323caeeddfe145baaa0db16e98d784b1fbc7dd436a6bf1f479dfd5cd1d21723"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.7.4


