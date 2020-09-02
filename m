Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.909.1599081255947646987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QESGMDKD;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id c10so449987edk.6
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q31aOFsMqg15mdU/jtAuTVIRbXbUzSexctXagxhcbo4=;
        b=QESGMDKDTMil/G31lvxN+CroDkB+x42u9Y2diQdl5q6SXEB8e+j7wihqJfuFJX0Cre
         Nq/MZg0rjiHat9+uyTCpJNkNtEPdnMseFt6XzAm2n9Z8mkJ7CA/lGL6rBaMWTOz+Tv/B
         iMln2OxwegKFNR93oNJvzsA4BeksVcrZtfJ2yfqz7ag3zzu4gU0nuyUEA/LekG3tS2WY
         uwdcDTjYqbRqhMZVyQ2s4E7MU/eFwkim80dyLUrr8+vUHcml8TYc7ZnLUdtc/kdZ22Zx
         /BnNJqhvGv4oUgUUVlfbbCffjn6XCBr/R4pv5GzpQVMXeODrQe8j64vfjkSoyW/SaLmm
         5c+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q31aOFsMqg15mdU/jtAuTVIRbXbUzSexctXagxhcbo4=;
        b=CxeCPaC6eCC8emhI0f7Hx9ObvhNp5DJXjkAKxlfcLgf4pbALeMV6a8ivGt1U+zhcoj
         RN1935CuNvTqAX22xIagrS17ltvkWHmreG9/MGHCAh8OL9hOwA/dwBGYjW74ObItfv1X
         lmhN1QXubhRwsdtkuoA8n7lXWU3k1ytqtE2Aom1JPnXrtDk5C2W6Q8twurZHRI3ZLa9j
         L6UAokQFQnwgNMmhoF+PpHJ/Dx/C/q/c0uQcZSEpr+y7XYKqmLrcBSD2KNtbYeSZ0QWl
         jCETxVHS0kwZkmNE90i6THVGZdsBvXXdrLW3C4FKkycT0PhuhjjDzrXKFdPQpWo9SCZ1
         oa2A==
X-Gm-Message-State: AOAM533uxqbwzOhNP4DbexIBd2lYNBeZD3hOiSGRXkRl1sf6m8qqZIQo
	gQvC6o38c1VNLzGT/FR/MRESn0v7VQw=
X-Google-Smtp-Source: ABdhPJwPCnvekgwcgJSOSNx5raVDsD3TY3x29PgRGP2brp6pX13mw2DcArI3FXCARHGPx1a06EtBMw==
X-Received: by 2002:a50:84a2:: with SMTP id 31mr2129961edq.138.1599081254136;
        Wed, 02 Sep 2020 14:14:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/23] gnupg: update 2.2.21 -> 2.2.22
Date: Wed,  2 Sep 2020 23:13:27 +0200
Message-Id: <20200902211330.4853-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...use-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/0003-dirmngr-uses-libgpg-error.patch   | 16 +++++++---------
 meta/recipes-support/gnupg/gnupg/relocate.patch  |  2 +-
 .../gnupg/{gnupg_2.2.21.bb => gnupg_2.2.22.bb}   |  2 +-
 4 files changed, 12 insertions(+), 14 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.21.bb => gnupg_2.2.22.bb} (96%)

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
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.2.21.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.22.bb
index 701d769e64..161add79f4 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.21.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.22.bb
@@ -20,7 +20,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "61e83278fb5fa7336658a8b73ab26f379d41275bb1c7c6e694dd9f9a6e8e76ec"
+SRC_URI[sha256sum] = "7c1370565e1910b9d8c4e0fb57b9de34aa062ec7bb91abad5803d791f38d855b"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.28.0

