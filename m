Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CEEC433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:43 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.7357.1651727160845892830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iyR93JnU;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id j6so6517393ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sNu38hYCdhcGTOwOqs41F4XLI/pVjA6m9UqfqlfoB/o=;
        b=iyR93JnUa7kQTviT/T+p9M2TEx/0eZuzLA5p88FJ3y49Kb5fFmmBxaXqdcLNjBo1sA
         rfhrOkXHsQxLnqM+UrixmPKPxNXbbfJ7/2gNudS+x4Y0/HFlJjPh/gMLQ10lB+mGU4Xs
         37BtXeyxRCFwGmhCCcn+QZDzt2n/RWmZDbHZI+eYWlSfQVDKAg8qvHKQzcBIMJ0v+V1l
         b+Oir8kiY49k3o701ZvyM90HEp7sUks+VoOfRCg7aWYEivZVBIG9yrSDSObvVAcCBcqI
         WswB8VQuKy1ZkyiLe1NVKrtVjbpZcuwCEWS8XOVgbUUbhc2uLnlUZkW9ufuctFIhujxi
         +31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sNu38hYCdhcGTOwOqs41F4XLI/pVjA6m9UqfqlfoB/o=;
        b=6MieJ06DacQg3GooPtSSltj9HUSbV26LMjx8jV9gXpaPVlnCWahBQFrwTFc7v03q4y
         YVMngwtAKrfr1PgkDK53rEDvP82aVbFDE4+JGdlDPT2v1m6j6wav/aqQ8paZyQzZwpgf
         vffLhmxA5qXIPiRkR/blXwihpbyTFwFjoGf1tF1+oj/cYaCfpxSpHhBa6jdrcOM//az5
         92iT2LKXfenbNIAbgWvbL3+Db/ZObc8IQWm/SRcApPuY8fbg7gxeN98lfRsfxIoZW7e7
         6KF4BH9qNFaWHAbliWqSVQRaAmTsPxEQUZmS5Oba6itPjdL8MIXtwDOLfRJY0A4CoYp1
         t58Q==
X-Gm-Message-State: AOAM532MwdRBGuH42nSWq+/SL6ocUvRV9VzHej28p65acrjoqm1y9fdX
	scqWYJ4XUmpeUJ/59Ig6C08HuD+q+zc=
X-Google-Smtp-Source: 
 ABdhPJzk0aimKqQ4WWK62Gh0CsrvANX/8vmJnnKtRNpOOjj6cnmLu9MyT98YOeb/csmdryJzkaA9BQ==
X-Received: by 2002:a17:906:4fc3:b0:6e0:66a5:d59c with SMTP id
 i3-20020a1709064fc300b006e066a5d59cmr23763183ejw.131.1651727195552;
        Wed, 04 May 2022 22:06:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 60/61] gnupg: update 2.3.4 -> 2.3.6
Date: Thu,  5 May 2022 07:05:43 +0200
Message-Id: <20220505050544.651895-60-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165289

Remove 0003-dirmngr-uses-libgpg-error.patch
(upstream addressed the issue).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 ++--
 .../0003-dirmngr-uses-libgpg-error.patch      | 29 -------------------
 .../gnupg/gnupg/relocate.patch                | 18 ++++++------
 .../gnupg/{gnupg_2.3.4.bb => gnupg_2.3.6.bb}  |  3 +-
 4 files changed, 13 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
 rename meta/recipes-support/gnupg/{gnupg_2.3.4.bb => gnupg_2.3.6.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index b58fbfe6f5..c4ede9ea5e 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From bdde1faa774753e29d582d79186e08a38597de9e Mon Sep 17 00:00:00 2001
+From 89b98553084fbefe1ef2c7cbff9e72cf43144c49 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5cdd316..e5f2d6a 100644
+index d86c60e..65c22b2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1962,7 +1962,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1955,7 +1955,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
deleted file mode 100644
index b4106d3620..0000000000
--- a/meta/recipes-support/gnupg/gnupg/0003-dirmngr-uses-libgpg-error.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9ace8f1b68ab708c44dce4c0152b975fbceb0398 Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Wed, 16 Aug 2017 11:18:01 +0800
-Subject: [PATCH] dirmngr uses libgpg error
-
-Upstream-Status: Pending
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Rebase to 2.1.23
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- dirmngr/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dirmngr/Makefile.am b/dirmngr/Makefile.am
-index 77ca3f5..1446775 100644
---- a/dirmngr/Makefile.am
-+++ b/dirmngr/Makefile.am
-@@ -86,7 +86,7 @@ endif
- dirmngr_LDADD = $(libcommonpth) \
-         $(DNSLIBS) $(LIBASSUAN_LIBS) \
- 	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
--	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS)
-+	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) $(NETLIBS) $(GPG_ERROR_LIBS)
- if USE_LDAP
- dirmngr_LDADD += $(ldaplibs)
- endif
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 74f48e9582..43999b8a6d 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 1e34e1d477f843c0ee2f1a3fddc20201f0233e81 Mon Sep 17 00:00:00 2001
+From 89ae4f03307104689e1857d9857d452af6b35ac4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 174d961..f4c25fb 100644
+index 260aeb2..1aeb08d 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1161,7 +1161,7 @@ gnupg_socketdir (void)
+@@ -1143,7 +1143,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +26,7 @@ index 174d961..f4c25fb 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1193,7 +1193,7 @@ gnupg_sysconfdir (void)
+@@ -1175,7 +1175,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +35,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1229,7 +1229,7 @@ gnupg_bindir (void)
+@@ -1211,7 +1211,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +44,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1256,7 +1256,7 @@ gnupg_libexecdir (void)
+@@ -1238,7 +1238,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +53,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1286,7 +1286,7 @@ gnupg_libdir (void)
+@@ -1268,7 +1268,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +62,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1317,7 +1317,7 @@ gnupg_datadir (void)
+@@ -1299,7 +1299,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +71,7 @@ index 174d961..f4c25fb 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1349,7 +1349,7 @@ gnupg_localedir (void)
+@@ -1331,7 +1331,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.4.bb b/meta/recipes-support/gnupg/gnupg_2.3.6.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.3.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.6.bb
index d27bddb8bd..f35eb8c75a 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.6.bb
@@ -16,7 +16,6 @@ inherit autotools gettext texinfo pkgconfig
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
-           file://0003-dirmngr-uses-libgpg-error.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
            "
@@ -24,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "f3468ecafb1d7f9ad7b51fd1db7aebf17ceb89d2efa8a05cf2f39b4d405402ae"
+SRC_URI[sha256sum] = "21f7fe2fc5c2f214184ab050977ec7a8e304e58bfae2ab098fec69f8fabda9c1"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.30.2


