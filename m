Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60786C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 20:56:18 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.6292.1748897775069433441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 13:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTwzDtlR;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: hiagofranco@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87be9d1fe01so1304606241.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748897774; x=1749502574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ+ZBr7D69J0A177ThezsMRVesLaFsqxqUFdcfiJN5o=;
        b=OTwzDtlROb9hTekWdh3RJ4bEBJxyuEjkk3uqWfGIYRF6FHrxjR7ThmbEiR5pqF0/Nw
         nrZJaYIaERDnS0wdnAWKxXWFlW4bRYVqeqOwCA8GX3HSluBuaDtxp3YKiIEO0kBUkPuf
         e4RzFa5i8pGACZ4HRePAhQwY8q+XN5OzYBWYgqgA8Q8NgHmLPOYqzHT+NB+WnpKswiqn
         xnfloHo3FqebZLIsRzWlOErZBxGS/jnPtUKYse/HNRieo7nOllo0lhFu9VPaOE+8fStx
         iBg5QBE1DN0uBqRIuV8teDkRw/tGX4uarHoUuXf/Jwl/BDPibxSUeXsfWJG7v9zU5y2j
         dDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748897774; x=1749502574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJ+ZBr7D69J0A177ThezsMRVesLaFsqxqUFdcfiJN5o=;
        b=XEorqsVFUUHxsPCI2I6kr2WhtaQ8Yc0b8zfTd8D5Wee4KpxeP1pavJdcostA844Q5i
         wKjsfZRfkGidgAk3kD23rGy6SOxuQDE72rB6GF1MDFeoP40O2HCMYz2ZVmHVb642b2zi
         QeSvKayc5/84NU1TLI3/8bz8SHns9ont6ylZzxtV8LbDE/XFO4X2E/3ACpjKpW1eX9gS
         MRX+rP10TUVYKNZDH1aqgsFpFZPh4ROc6Qa0GGcQB929m2wQvIC9LaWHtmQfJLVnXFca
         dZUqLesYEnuqG+m3oalyuApdIjlCF46rnpO7VUuRbP47xB5dXItcyokeS2ntTVwVMty8
         Fo7g==
X-Gm-Message-State: AOJu0YzeKHT5zhSUp5170MdQkZt4FZoT+G608iLXBJ1PzekW/+uYa8Bi
	CmCGYAHiAGT4f50vHAMBNzDCJhl+PyDFbWk+JYC7HCQOgtwDRt/iB1LA+26HRFxw
X-Gm-Gg: ASbGncv4GGfViaDScEG5eeLVL/hli2NAu7BogSS92n6JhoU/69fafwAUFIcXKaVXTW+
	68eqcby9YMxk4txfDSr65nLOrrHrLgqYr3IlbZQ0z0vfb51cn7mWTkH4A9nLJ5bXnPHrSjljglW
	Wjv+uKSFakP5El/zEbu8dG/1GudhMHvHKnRJi4VCJ9/2BrJCqr+uVPSTUambHPLRTkW047arFyE
	DB9m+v3ZwtnyOukDHHNWNsUKC1cbQ+kZqXSWPa4u+KuelfwrGySWHSnTNHVIcDFWiif1OssFXvj
	G1l6QAYPT0mvpW7XdXNuJBwu7sjqP+3/UODsP3wcbn3pFJiYbd1V365PkpSkmXpvvX3eo7Mr6A=
	=
X-Google-Smtp-Source: AGHT+IEFYa9n690KuRJtYy2kDnPN+e6jZjb/airg8dZYZsuxsMkJIvSXeD5e3Gnou2grNBkuMDApGQ==
X-Received: by 2002:a05:6102:3e17:b0:4e5:9cf0:4eb6 with SMTP id ada2fe7eead31-4e6ecd2e68fmr11349897137.5.1748897773608;
        Mon, 02 Jun 2025 13:56:13 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e64449ad1asm7627706137.17.2025.06.02.13.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 13:56:13 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] libgcrypt: fix compile error for t-thread-local
Date: Mon,  2 Jun 2025 17:55:46 -0300
Message-Id: <20250602205546.426714-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 20:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217731

From: Hiago De Franco <hiago.franco@toradex.com>

Currently the libgcrypt-native build is failing with the following
error:

| ld: t_thread_local-t-thread-local.o: in function `main':
| t-thread-local.c:(.text.startup+0x187): undefined reference to `pthread_create'
| ld: t-thread-local.c:(.text.startup+0x1d0): undefined reference to `pthread_join'

Backport the fix from upstream and add "-lpthread" to
"t_thread_local_CFLAGS" to make the compilation successfull, similar to
what 0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
does.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 ...s-Fix-link-errors-for-t-thread-local.patch | 34 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.11.1.bb             |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
new file mode 100644
index 000000000000..5ebc3831d4ac
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -0,0 +1,34 @@
+From 746dc1c3837546c1085102e546a83da8d1c773e1 Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Thu, 1 May 2025 22:20:58 -0700
+Subject: [PATCH] tests: Fix link errors for t-thread-local.
+
+On platforms where pthread_create is not in libc t-thread-local fails to
+link.  Issue found on NetBSD 10.0.
+* tests/Makefile.am (t_thread_local_LDADD): Add $(standard_ldadd),
+$(GPG_ERROR_MT_LIBS), and @LDADD_FOR_TESTS_KLUDGE@.
+(t_thread_local_CFLAGS): Add $(GPG_ERROR_MT_CFLAGS).
+
+--
+
+Upstream-Status: Backport [793eda7b258a562757b51c96044b103b638f1a63]
+GnuPG-bug-id: 7634
+Signed-off-by: Collin Funk <collin.funk1@gmail.com>
+Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
+---
+ tests/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 9a9e1c2c264a..b80f266f97c2 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -94,6 +94,8 @@ t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+ t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
+ t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
++t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
++t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
+ testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
+ 
+ # Build a version of the test driver for the build platform.
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
index e51a20e5bfb1..5574e8c821ef 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
@@ -21,6 +21,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
+           file://0001-tests-Fix-link-errors-for-t-thread-local.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-- 
2.39.5


