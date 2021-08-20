Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.80818.1629437256562298361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vm5vCI+o;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id fa24-20020a17090af0d8b0290178bfa69d97so6554367pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2yp5wvbiEiCOwe2yQB7E6YKnf7uppps+nzfIqWh/iko=;
        b=Vm5vCI+o8zfJCfmEiIZNQTzp4yTLdKn1rpOtMBu8bDe90OPfm3V9BKQK/TmKZ9lZBa
         YGUhs61PUKl0RfClr8TZUU+RQorCrr2VHHF184CNW4OSGY2bYIbtvLRW7dD6Th31xUot
         puFXZmU0rQFSAXjIR1NMsKcl+qmq/f3hkcuifCyN3+PREby6WUNvjRN2dv0JVSa7f0VU
         D12vf5VqT3xgPL6PgzNz14VLhJbkg4b5qzzzJBEVCGu6XCRyUZUikTLxNZF8ysJx0k7j
         ewwqUBpalSd9gT8Fhy+TL3QGOM5vKk+qyWO0kbHihu5oYCXV2SNI/ljtdJfIeponkiqQ
         aDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2yp5wvbiEiCOwe2yQB7E6YKnf7uppps+nzfIqWh/iko=;
        b=mC4r6eKXroXgIPtvg170bEA+/Q4L+IxwUe9fPv2HyiT1/1UOq7h2iuQetZnBA6I2wt
         7GuGRC+xXHxKYRXbswUu0gSPF0UzgzmI+fC5TsZWxz+uwgURFYO/XY4ngzd+Fj4DlXLQ
         7ldMTKXcCe9WUR9ebD1pS8pancXUt1TeH6AEnLVmYJEZSGq4B4wYnrKhTx5CZzEmLT/5
         f5rVjcy0ZoRXd3YedQnpdKZJlDM3O7TW4Lm2//9qoEXQdY5xZt0WCKitOKs3NsFDsCmH
         qFxE4zOm8z6KdLFk5Lsu/bQlZgXCSdMufXfIwNTOmp4/nCmnv6eKqOVitPUT420P12QR
         heUg==
X-Gm-Message-State: AOAM533CEg2Qy80FiUndZZIoCWvYCYi/roVkw/Q/UUVgvQysnR4JWixz
	CQ5b3g1d5F4hzMHrRQUR2iBCT1uhkttG2g==
X-Google-Smtp-Source: ABdhPJyG7nnGnYJ0BGzSCDI3JgNTQXrD94E2rcVGphEvbMfBd1QWLgkNoISQdtsPUnmg+LD+hrSEeA==
X-Received: by 2002:a17:903:230d:b029:12d:79a4:58ee with SMTP id d13-20020a170903230db029012d79a458eemr15101249plh.23.1629437255933;
        Thu, 19 Aug 2021 22:27:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id c7sm3642131pjc.31.2021.08.19.22.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:35 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 4/7] gnupg: update 2.2.21 -> 2.2.22
Date: Thu, 19 Aug 2021 22:27:29 -0700
Message-Id: <20210820052732.2606-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820052732.2606-1-akuster808@gmail.com>
References: <20210820052732.2606-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: ad9f9fd5609c2014454c73045bc603c9883977e3)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33eade06ebb327be80eef278835053759ffe23fa)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...use-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/0003-dirmngr-uses-libgpg-error.patch   | 16 +++++++---------
 meta/recipes-support/gnupg/gnupg/relocate.patch  |  2 +-
 .../gnupg/{gnupg_2.2.21.bb => gnupg_2.2.22.bb}   |  2 +-
 4 files changed, 12 insertions(+), 14 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.21.bb => gnupg_2.2.22.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 0e78f5679e..c641a19616 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 0e51c62706a8c54e90a2d98c5250ecc894c65182 Mon Sep 17 00:00:00 2001
+From 56343af532389c31eab32c096c9a989c53c78ce0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f3c9863..a57f559 100644
+index 1d05d39..eaaf33c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1856,7 +1856,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1858,7 +1858,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
index 3e798efd06..607a09f188 100644
--- a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
+++ b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
@@ -1,7 +1,7 @@
-From 9c3858ffda6246bf9e1e6aeeb920532a56b19408 Mon Sep 17 00:00:00 2001
+From 9a901dbb1c48685f2db6d7b55916c9484e871f16 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:18:01 +0800
-Subject: [PATCH 3/4] dirmngr uses libgpg error
+Subject: [PATCH] dirmngr uses libgpg error
 
 Upstream-Status: Pending
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
@@ -9,24 +9,22 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Rebase to 2.1.23
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  dirmngr/Makefile.am | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/dirmngr/Makefile.am b/dirmngr/Makefile.am
-index b404165..d3f916e 100644
+index 208a813..292c036 100644
 --- a/dirmngr/Makefile.am
 +++ b/dirmngr/Makefile.am
-@@ -82,7 +82,8 @@ endif
+@@ -90,7 +90,8 @@ endif
  dirmngr_LDADD = $(libcommonpth) \
          $(DNSLIBS) $(LIBASSUAN_LIBS) \
  	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
--	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV)
-+	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) \
+-	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS)
++	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS) \
 +	$(GPG_ERROR_LIBS)
  if USE_LDAP
  dirmngr_LDADD += $(ldaplibs)
  endif
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 25732a8277..aa8d1e3cc2 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 6e3b1d89758c3ee7072aeefa305ce5fe76f2e439 Mon Sep 17 00:00:00 2001
+From 4005b3342db06749453835720b5a5c2392a90810 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.21.bb b/meta/recipes-support/gnupg/gnupg_2.2.22.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.2.21.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.22.bb
index f0aca9ef3e..887ab0e1f2 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.21.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.22.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "61e83278fb5fa7336658a8b73ab26f379d41275bb1c7c6e694dd9f9a6e8e76ec"
+SRC_URI[sha256sum] = "7c1370565e1910b9d8c4e0fb57b9de34aa062ec7bb91abad5803d791f38d855b"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

