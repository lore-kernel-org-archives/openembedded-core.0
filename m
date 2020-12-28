Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.2398.1609185889054917102
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=raRqR1kI;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id jx16so15541098ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OF7KwtXMz/j0i9SM4ZByh+tnHSSsT4pR+Gva0hGc3Ak=;
        b=raRqR1kICByOW5h2rstR6vNCYFTOXUCTdcwnkObvhsXmnJ/5UCHHnCjr69TXcWyaOF
         WR0HH6Kv4ewvgDhhOp1N3RRDiRTzTaS4l6AZdPLe4oXZARgej0AsA1uyq+B3eg0RzVy2
         E/VPgFnTwCaGddD/t5Dk4WVP26jRBLKQyqvRTVigWI1QFgvMvC6EulMQrG7ns8xn8gnB
         QrXEC0QvYGWh3TEbt1qhcfizTOb5IlVjMXlKWBqDemIjhrdIRmg/ZfmDN2qdK0gmAS3j
         UwMFtUAqFTNm+Ocr3lW3/d7ve60khUP+cFnDIGYrtm1j/2KUXUpbsqmlX1qZ4Q4TWRtg
         9Udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OF7KwtXMz/j0i9SM4ZByh+tnHSSsT4pR+Gva0hGc3Ak=;
        b=r04yfF8vwopTSZ4GlniCraiKMET6NXY0QhfE33y3ZoRGch7GT9azdv+U+BUTC5vxla
         jzMr6Kxr3QcTWVafLggdOCC6sc583U1P2l2fpxSugZ/wrqQactB0Zhgd0gjPchQmnS7o
         sKTuPWp67yK/k8vXmQ7Kwtzt7EOSaxx5sU3b7VFHknonoBgqP5Ia/xd+52yvEwURLOtZ
         9t8xEttySiht0kxqm0Yd+RFL3LfvqqaYJGP0+3IgKCLoxlX4i4fTFP+Rz3I75KGQnx/0
         Z7AB0zjP9fgRkq4Ns4okOd1LUlun4zjbReavuaPBfQNSL2YkLwez06dJQ11Kyrhqsa83
         Ghtw==
X-Gm-Message-State: AOAM5331SFMP6Q1G5dwitZfqOSlQWKkH+3IuT6RHtAhQIx4yPSokpPjr
	cbDs4ikVfKrOfihnbmpIEDuwOqaeG9Q=
X-Google-Smtp-Source: ABdhPJxUJrNfpDX8dQq7iplbw3Q+klIpt9HQ0s2uNu9Pg1+hcMmfSlDu73b7knfdBFGdpvxYFmSwbw==
X-Received: by 2002:a17:906:7a46:: with SMTP id i6mr41585827ejo.257.1609185887656;
        Mon, 28 Dec 2020 12:04:47 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:47 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/22] gnupg: update 2.2.23 -> 2.2.26
Date: Mon, 28 Dec 2020 21:04:21 +0100
Message-Id: <20201228200436.78130-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/0003-dirmngr-uses-libgpg-error.patch | 18 ++++++++----------
 .../recipes-support/gnupg/gnupg/relocate.patch |  2 +-
 .../gnupg/{gnupg_2.2.23.bb => gnupg_2.2.26.bb} |  2 +-
 4 files changed, 13 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.23.bb => gnupg_2.2.26.bb} (96%)

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
similarity index 96%
rename from meta/recipes-support/gnupg/gnupg_2.2.23.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.26.bb
index c624b67a0b..1c6e68b4b1 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.23.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.26.bb
@@ -20,7 +20,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c"
+SRC_URI[sha256sum] = "517569e6c9fad22175df16be5900f94c991c41e53612db63c14493e814cfff6d"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.29.2

