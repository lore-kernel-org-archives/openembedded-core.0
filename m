Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.17521.1590940448984919346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M4yvKEsP;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id e2so6838613eje.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xzQ1KmCnNh8756ho05hi5kg/QIfaH/hFGXEnQ3kcCe8=;
        b=M4yvKEsPP3y44LF1cZtxggauaefF2hL3GtYlklzTLUJ5/TbHSFeaz5W98YfPYMC9t8
         7Iv3h4ANQnViWEosHo2Joh9rJaVciudh4R9E1eqIHLT0z1qES7hW52xGFUSSTUBOlGOo
         qEY8gRwT9hBM+SsAHSR/FXROR5/0Hv24yoEp5biAKb0mdql09mJooKte2oUqP2II+sWC
         x8oPIPlpQQHXWX6vLPV7+pcGlZDk0e4ng75ABbX/tIXRmSIr8qc9YWnCZyhfpVuaMMPL
         JJojDqNN8wXUIb5P1YXY1KjqSQZ86CceIIkHvMidME/naOYFofR4d5DQvHRhW7fsOok/
         MQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xzQ1KmCnNh8756ho05hi5kg/QIfaH/hFGXEnQ3kcCe8=;
        b=DtLJriNPMJmSdFyuA3cFfVrGTepD7YvPoGbq3W6jm32dHyes+Zi4ZZMZlz/uL4G5yV
         BSlRi9CHZG4GiCTLLpdIJK+hdHq25cKYlwxT34emlBh7I0bfBGX9qD/Ht7mDDMF+kQBU
         J+06q02LKagdlYUtanGhnMSyM2gCFsSTveEz/eigm4EKDqHs4OiPiMRmOYB2SW1JHIre
         qTatjsaQKgfE+ygJdnhHLjRafQvJKx6ppGPdEK5ZDogTun0wN5YUKjjoEKQIkbTStcpu
         AiRE7vuMzRbHNZ8kdIWzGATkEb9LXpYAJ8ttKFhN7ERevlJqaCUcPf30UE/qvAEbj6sI
         xPwQ==
X-Gm-Message-State: AOAM532DptYcGryGgB25o1+WOG5LC6/p7HYpfss52qbb/51mY2ZbFX5i
	J/lTjoxogZuwcKER/FQ3f4pAY68n
X-Google-Smtp-Source: ABdhPJzijCCFUxrLA7n3+DgKBECX5ipsX8KRDUXHlp+56Aec5E+9hSp8Dxn4l+hmEYoTZXG0tMCKSA==
X-Received: by 2002:a17:906:7c58:: with SMTP id g24mr4968017ejp.205.1590940447190;
        Sun, 31 May 2020 08:54:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 46/70] rng-tools: upgrade 6.9 -> 6.10
Date: Sun, 31 May 2020 17:52:30 +0200
Message-Id: <20200531155254.10283-46-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d9ce64f132e463b9091d0536913ddaf11516.patch | 42 +++++++++++++++
 ...6a5fd4efde8ef569b358e19b1fcbc7d0d938.patch | 51 +++++++++++++++++++
 .../{rng-tools_6.9.bb => rng-tools_6.10.bb}   | 11 ++--
 3 files changed, 100 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/a4b6d9ce64f132e463b9091d0536913ddaf11516.patch
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch
 rename meta/recipes-support/rng-tools/{rng-tools_6.9.bb => rng-tools_6.10.bb} (87%)

diff --git a/meta/recipes-support/rng-tools/rng-tools/a4b6d9ce64f132e463b9091d0536913ddaf11516.patch b/meta/recipes-support/rng-tools/rng-tools/a4b6d9ce64f132e463b9091d0536913ddaf11516.patch
new file mode 100644
index 0000000000..96301617b2
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/a4b6d9ce64f132e463b9091d0536913ddaf11516.patch
@@ -0,0 +1,42 @@
+From a4b6d9ce64f132e463b9091d0536913ddaf11516 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Thu, 30 Apr 2020 16:57:35 -0400
+Subject: [PATCH] Remove name conflict with libc encrypt
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Forgot to fixup the funciton name conflict with libcs encrypt() function
+on power systems
+
+Upstream-Status: Backport [https://github.com/nhorman/rng-tools/commit/a4b6d9ce64f132e463b9091d0536913ddaf11516]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Reported-by: Natanael Copa <ncopa@alpinelinux.org>
+Reported-by: "Milan P. Stanić" <mps@arvanta.net>
+---
+ rngd_darn.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/rngd_darn.c b/rngd_darn.c
+index 35df7a1..9345895 100644
+--- a/rngd_darn.c
++++ b/rngd_darn.c
+@@ -109,7 +109,7 @@ static int init_openssl(struct rng *ent_src)
+ 	return 0;
+ }
+ 
+-int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
++static int osslencrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
+             unsigned char *iv, unsigned char *ciphertext)
+ {
+         int len;
+@@ -150,7 +150,7 @@ static inline int openssl_mangle(unsigned char *tmp, struct rng *ent_src)
+         unsigned char ciphertext[CHUNK_SIZE * RDRAND_ROUNDS];
+ 
+         /* Encrypt the plaintext */
+-        ciphertext_len = encrypt (tmp, strlen(tmp), key, iv_buf,
++        ciphertext_len = osslencrypt (tmp, strlen(tmp), key, iv_buf,
+                               ciphertext);
+         printf("Calling mangle with len %d\n", ciphertext_len);
+         if (!ciphertext_len)
diff --git a/meta/recipes-support/rng-tools/rng-tools/dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch b/meta/recipes-support/rng-tools/rng-tools/dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch
new file mode 100644
index 0000000000..93103ef79f
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch
@@ -0,0 +1,51 @@
+From dab16a5fd4efde8ef569b358e19b1fcbc7d0d938 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 30 Mar 2020 00:10:46 +0200
+Subject: [PATCH] rngd_jitter: disambiguate call to encrypt
+
+Commit 0f184ea7e792427fb20afe81d471b565aee96f0b disambiguate the call to
+encrypt in rngd_rdrand.c but did not update rngd_jitter.c.
+
+This raise the following build failure:
+
+rngd_jitter.c:75:12: error: conflicting types for 'encrypt'
+ static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
+            ^~~~~~~
+In file included from rngd_jitter.c:27:
+/home/dawncrow/buildroot-test/scripts/instance-0/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/unistd.h:1132:13: note: previous declaration of 'encrypt' was here
+ extern void encrypt (char *__block, int __edflag) __THROW __nonnull ((1));
+             ^~~~~~~
+Makefile:770: recipe for target 'rngd-rngd_jitter.o' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0ca6bf16e3acbc94065b88c4442d6595424b77cb
+
+Upstream-Status: Backport [https://github.com/nhorman/rng-tools/commit/dab16a5fd4efde8ef569b358e19b1fcbc7d0d938]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ rngd_jitter.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/rngd_jitter.c b/rngd_jitter.c
+index c1b1aca..49a3825 100644
+--- a/rngd_jitter.c
++++ b/rngd_jitter.c
+@@ -72,7 +72,7 @@ unsigned char *aes_buf;
+ char key[AES_BLOCK];
+ static unsigned char iv_buf[CHUNK_SIZE] __attribute__((aligned(128)));
+ 
+-static int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
++static int osslencrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
+             unsigned char *iv, unsigned char *ciphertext)
+ {
+         EVP_CIPHER_CTX *ctx;
+@@ -122,7 +122,7 @@ static inline int openssl_mangle(unsigned char *tmp, struct rng *ent_src)
+         unsigned char ciphertext[CHUNK_SIZE * RDRAND_ROUNDS];
+ 
+         /* Encrypt the plaintext */
+-        ciphertext_len = encrypt (tmp, strlen(tmp), key, iv_buf,
++        ciphertext_len = osslencrypt (tmp, strlen(tmp), key, iv_buf,
+                               ciphertext);
+         if (!ciphertext_len)
+                 return -1;
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.9.bb b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
similarity index 87%
rename from meta/recipes-support/rng-tools/rng-tools_6.9.bb
rename to meta/recipes-support/rng-tools/rng-tools_6.10.bb
index 8c98a9aa3a..3f9720e406 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.9.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.10.bb
@@ -6,25 +6,28 @@ HOMEPAGE = "https://github.com/nhorman/rng-tools"
 BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "sysfsutils"
+DEPENDS = "sysfsutils openssl"
 
 SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
+    file://a4b6d9ce64f132e463b9091d0536913ddaf11516.patch \
+    file://dab16a5fd4efde8ef569b358e19b1fcbc7d0d938.patch \
     file://init \
     file://default \
     file://rngd.service \
 "
-SRCREV = "4a865797a69dd38c64a86aa32884ecc9ba7b4d08"
+SRCREV = "0be82200a66d9321451e0a0785bfae350b9cffdc"
 
 S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-PACKAGECONFIG ??= "libgcrypt libjitterentropy"
+EXTRA_OECONF = "--without-rtlsdr"
+
+PACKAGECONFIG ??= "libjitterentropy"
 PACKAGECONFIG_libc-musl = "libargp libjitterentropy"
 
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
-PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
 PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
 PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
 PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2 openssl"
-- 
2.26.2

