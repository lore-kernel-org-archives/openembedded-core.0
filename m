Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.166.1630174330686843981
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TVQXjWAN;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id j15so10917925ila.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qSraCcV6hqm83S42CaeIr/FdZmbu4/pu25aPvDPqbm4=;
        b=TVQXjWANkznf001Mch6O5pbOLf4PGpl00Br5s6zCbkgmIQ0gZLvgIE+YIpLhGpYrDG
         qDUHK4fu0ve4yszc6+ZqLGgCtT+rSLB/wu6D2mewkphSEcHyreina39G33katdLHmLZs
         8fO4w9CCVzpSnMGRSkRdvCu9cYNDn6jwZJvJdGQGMsQZoSM0INGuSqNtq5B5Pi0y0YSZ
         L1yqGBOgc1wfb6lXVD2LHrS2s5K3P10RDnxNntwzX/5Jz2p0baxeVAucXZQGHE+6dq7B
         1/960pTss1RXTRM6ld22/JrwySCW2iUYpwVcEhVx7AqsKJpDltQhXmZw+7XqI9XsB2OT
         h84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSraCcV6hqm83S42CaeIr/FdZmbu4/pu25aPvDPqbm4=;
        b=QKgbG89NfmI+LLNzKClcC3WPC156po4Mjwpv3mmq08oajhA28prY7ZkEQuAytIDFkY
         g3T1uARlQcX2YgCzfr9SEp+npVlzjCs9MNAnrg69eA2xwe82cGU3v0B+4uEbGLCSxilV
         kKKmLMf/tdnjBoxeSs8VSkjF22MCIapciS9rKcH87Ml1iSc0tr7k6uKOXo1WSOOi1i0r
         BMUdWrJGliMsyQ8QxffgqKgGT9j+9ALu5Fjg7X4HlRFVpFtnbelYNPv5HgHvCBF8Aka4
         l5ZZa5qMAk+KncaOuqOs/bMT1QIaxRsMwSG+jjSegfxWOTP///7BjCV0VUj6s1dcKdDU
         NfsQ==
X-Gm-Message-State: AOAM531xJiw73urLX1/bbEZShaFXWgZadGzva81rUxM0oGMMI37hfzJk
	4HZ6wu1wsxrxLIrqptIUVV5G8murrUC4TqG8
X-Google-Smtp-Source: ABdhPJzd/5XQURn2wszmKFTxQ3J7U2nml4ltjc566Tx8OrtTUqZoFG253yVa3EIgITHTWDaFfsQccA==
X-Received: by 2002:a05:6e02:17cb:: with SMTP id z11mr10845747ilu.68.1630174329618;
        Sat, 28 Aug 2021 11:12:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/36] gnupg: update 2.2.21 -> 2.2.22
Date: Sat, 28 Aug 2021 08:10:52 -1000
Message-Id: <5c02b4bcf3243aac017ca2edbc0af5ac0f6e06b7.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: ad9f9fd5609c2014454c73045bc603c9883977e3)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33eade06ebb327be80eef278835053759ffe23fa)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

