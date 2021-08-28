Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.167.1630174340852924981
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hveXaiYw;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.50, mailfrom: steve@sakoman.com)
Received: by mail-io1-f50.google.com with SMTP id n24so13509603ion.10
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i4BmL9HPwpfCLuOEC/g/IJPpmEqVWbHk767++AYHeQU=;
        b=hveXaiYwOQ2DoCn4fRc9z2hbCGelM5lZzq1AXHTf1HqrJ+uRBKOsqwgOTNnSb1pP5I
         bF0OomdEihgz7m8O4y0y6pQ3VuTbN5s7eVZeMQQoDEn0aB1SGSnlBniV61sUY0SMZQt/
         LY7YDCBdVmpveetVtuqInx2ck5pqAHX7oqJuTL1jwFXw5xlDiEJzd1ZD6cW0/6DV4q8A
         3Ly/1pl7h6AXyWnPEpf/iljD6FbRmsJPdCd8EMh6zc1QTaZ+JP7tZ5K79C/wDCGnY/5V
         ImKGrvBDHjsbKrzw9xSp3EFPUm//JCPS7Z4Pz5TH4QZ5eAhQpk6RBaR98EHwhT/dWZM7
         ifxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i4BmL9HPwpfCLuOEC/g/IJPpmEqVWbHk767++AYHeQU=;
        b=qpFtGnj26RsbWtOUuZwKnZdWUko1gQ78edCtvYYIUSz2HajTNkUAfqLljyZtub9wJ+
         DnZoFDY7CfpZrb1GGEEc/Q1d1F9XpLF1vs5vwxJPgT7IQJ9UvGH2tht7FMW8Tu4yKv6U
         DUqJ/9XiFAoIku5yR0DPdyI5gYCGoynZ594zUBWjCt8/m7SJyGVTrnfwdDzJU5Ue0h6M
         gjNBpNws3cuK8tiTQjYvBAIMjOeFShwgUczn4yLrKDc7OnNcmYu/Q3oOSULOHTnaKVWO
         snxbYDEYRurSVeFhHwzAOWZpOnTDOu6Gvfj2hrsi6rrdxGnLAHMBfgG1WLjsu9zssBf6
         uPHw==
X-Gm-Message-State: AOAM533pWYSfS7Y6AbZr55ZFVyg50IsC6ayczgJTlcF0AqojWZALNpc2
	wdMbG/HHdlMcznxH9bhwc9TTpVfqeipfvOLQ
X-Google-Smtp-Source: ABdhPJwA3fmqvEb1D6OiCJxZSAYrqwUE1WLuEtyMUuLIzBqcDG1AORY52K+uAz9OIY4/jNq9Y1YvMA==
X-Received: by 2002:a5e:c903:: with SMTP id z3mr12241465iol.61.1630174339764;
        Sat, 28 Aug 2021 11:12:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/36] gnupg: update 2.2.23 -> 2.2.26
Date: Sat, 28 Aug 2021 08:10:54 -1000
Message-Id: <09b4ccb6c2b2048f92eea82a2291e92c7d9ec5ff.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: eb7ad793d8c2e924adccc62e7680bb1cac640e89)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df0bb1cb96389d534b53faf677a0f6ee30dd672d)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...e-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/0003-dirmngr-uses-libgpg-error.patch | 18 ++++++++----------
 .../recipes-support/gnupg/gnupg/relocate.patch |  2 +-
 .../gnupg/{gnupg_2.2.23.bb => gnupg_2.2.26.bb} |  2 +-
 4 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.23.bb => gnupg_2.2.26.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index c641a19616..a0af2d48dc 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 56343af532389c31eab32c096c9a989c53c78ce0 Mon Sep 17 00:00:00 2001
+From abc5c396aaddaef2e6811362e3e0cc0da28c2b34 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1d05d39..eaaf33c 100644
+index 64cb8c6..3fe9027 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1858,7 +1858,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1824,7 +1824,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
index 607a09f188..a13b4d5fb5 100644
--- a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
+++ b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
@@ -1,4 +1,4 @@
-From 9a901dbb1c48685f2db6d7b55916c9484e871f16 Mon Sep 17 00:00:00 2001
+From 6c75656b68cb6e38b039ae532bd39437cd6daec5 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:18:01 +0800
 Subject: [PATCH] dirmngr uses libgpg error
@@ -11,20 +11,18 @@ Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 ---
- dirmngr/Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ dirmngr/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/dirmngr/Makefile.am b/dirmngr/Makefile.am
-index 208a813..292c036 100644
+index 00d3c42..450d873 100644
 --- a/dirmngr/Makefile.am
 +++ b/dirmngr/Makefile.am
-@@ -90,7 +90,8 @@ endif
- dirmngr_LDADD = $(libcommonpth) \
+@@ -101,6 +101,7 @@ dirmngr_LDADD = $(libcommonpth) \
          $(DNSLIBS) $(LIBASSUAN_LIBS) \
  	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
--	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS)
-+	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS) \
-+	$(GPG_ERROR_LIBS)
+ 	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS) \
++	$(GPG_ERROR_LIBS) \
+         $(dirmngr_robj)
  if USE_LDAP
  dirmngr_LDADD += $(ldaplibs)
- endif
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index aa8d1e3cc2..7f7812cd46 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 4005b3342db06749453835720b5a5c2392a90810 Mon Sep 17 00:00:00 2001
+From bd66af2ac7bb6d9294ac8055a55462ba7c4f9c9b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.23.bb b/meta/recipes-support/gnupg/gnupg_2.2.26.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.2.23.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.26.bb
index fc157c7906..e2b03a520f 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.23.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.26.bb
@@ -25,7 +25,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c"
+SRC_URI[sha256sum] = "517569e6c9fad22175df16be5900f94c991c41e53612db63c14493e814cfff6d"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

