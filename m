Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.80320.1629437258207324143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZZRX9LYJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso8608526pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GWQpqSDlPiy2SAabJ/xpxY5qHPPeyau5H4cjhYZgMNY=;
        b=ZZRX9LYJTACcvOZ8MH8hEPJtz/RCKSa6drUwNPCiuoLnyXpXmNQr1YGJcaMGICP11o
         Ck/lxTsXi3N6GUvKaT5SOehi4UXR3WdfX3UlKjrUs1swKx9fFaiRQUnmstPQWti0t6Rb
         j61n2CnP6ghNSWLCDGOBMFmIKHTopWQS+Vci+t7axQzsYJk6PCmJtJEX7c35H3kb+ILB
         fGmBXJHHDsn//2HurPSI4EhsA3acMUFFzVNrhlPN9BOb5O06sQjNfE972KtSyBr54FrY
         7FXCG0UGgv5ebQouL8BxZ7bL3CTDWKdN30pJrgwl8srqYx2WC2XAqi/MynBqQjdtsu5F
         zRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GWQpqSDlPiy2SAabJ/xpxY5qHPPeyau5H4cjhYZgMNY=;
        b=fHEHV1FZrUR06VPXhtzw/bndLc0YaiqID+lJDzsBlYakhDFG15qQwhbQgwaf+Xmbx9
         Z0DaKEId2ltZcPysQXg9faxZprgXmicmu2fzOHPLj6BlBUK6YeW94yEwN7XVUWlSh2w/
         nlgNScnmGfaRdURquRLxv/FdEPp2YPz/6EMB1xL+9GN13ArdiWIo3kmm5bhWc2zLJNEP
         H4XZMMP8uhkx0+qcqLBMUZfVN0j3CmPc10CPyadW3LMSKE9UwBYjsVn3EEl7E8dI4yr+
         j6TFKLa+pPN/iHJNdLTWZI8dWUbuRo4YARQJ8gWMwunv0QZxaZXCpLBENx80k1Opu5lo
         t4Dw==
X-Gm-Message-State: AOAM530rO00IcExCUWevrlwBIuhMQaQajdbao4bJnsflWuzSXofD4PtM
	0QRcnT8sOYmWbogDUx5bGDGK4Uy6t1U6Cg==
X-Google-Smtp-Source: ABdhPJwvXmGgtOwoND2oZ5Ff8mSx0Wf1uxj7jJvL5gBbcgjktg0rD4Rt31YTMTnnx9QHYIJpbuiB/A==
X-Received: by 2002:a17:902:e995:b029:12d:5f22:ce3f with SMTP id f21-20020a170902e995b029012d5f22ce3fmr14902825plb.66.1629437257632;
        Thu, 19 Aug 2021 22:27:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id c7sm3642131pjc.31.2021.08.19.22.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:37 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 6/7] gnupg: update 2.2.23 -> 2.2.26
Date: Thu, 19 Aug 2021 22:27:31 -0700
Message-Id: <20210820052732.2606-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820052732.2606-1-akuster808@gmail.com>
References: <20210820052732.2606-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

(From OE-Core rev: eb7ad793d8c2e924adccc62e7680bb1cac640e89)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df0bb1cb96389d534b53faf677a0f6ee30dd672d)
Signed-off-by: Armin Kuster <akuster@mvista.com>
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

