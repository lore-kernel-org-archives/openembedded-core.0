Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D499DC19F21
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.14473.1658882491916841790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=z1+NPrD6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id y1so6777186pja.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6DTb3FtitZxw1kV04XhAqTBCI5zzHc5oGmXvCUdJmKI=;
        b=z1+NPrD6PpUg/OHW0Lqxk0Vl2ul4imnvYdhafr3Ns/a0aHE7koXYF9aHf9hAHKftuv
         keXIdgUfptJuP6H1Y6m70xIgeEJcJCFU3Eo3HfpVtQIvO0NogwLjhSJiUdOyro+n68C4
         lwDAgUt4Pv4rzb4oDql67dZO5DlQO2SnqvKL6dypsY2jtjRVaDsqrO49izUbn5vrvbSS
         0QPfYJCxpgDItcRLLikNd0n+mgASBWdphA0k68Q0GASECHOMfalStImIahtPWueBkRyK
         r8S9f8nxl+QpydBn9gRfl+seQ4rHjVz2GD9N2MGuqKjP+T454VfRex0vdZzK97bz3JZt
         HQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6DTb3FtitZxw1kV04XhAqTBCI5zzHc5oGmXvCUdJmKI=;
        b=3nGmgk7pnQ5C6JU7fPtWLHHweDF8UV/H7TdQ2WxC0QOnzlIEKXjc+dNVoQeCBOPEku
         EVlKh7T5vaVARa6dWqJdwZ7qefUYpKbMPRrI4Kyh8kYiYSGdXTSM+8ORIBQavAePhPWg
         QyUli4zCFN27Aaxlozs4/1/a7LMv9cG7zU7d6dtbBItbkzDhG4mv4MKg1vVg7Nc6lOaQ
         ohpTH9fHVTt0Gqmla28yggSa/10ZeGbbCtGAXiJ4bUA2qbSMoc1LCMN2jP8j5VJ/XnYD
         LUp7mBEtr1H02RmMvFFVlbxidGekmu4xqmrpM5uKsSGi6Ss3Bjv8YY21N9V6hpmMumlB
         QQyQ==
X-Gm-Message-State: AJIora/LpYWwjV7+W00PZx9M7vIQKcZo6n8SOKAMnqYUu0QRVS9ze8hw
	2G7iHq6XfZUqUGUnKpuJBn4rXRhaSOaSUtNn
X-Google-Smtp-Source: 
 AGRyM1tiyhOdBoX2m3C+j/DMKkmU/g805T5Z8bY1qjlMis6Qrkc6Xaj5XTfkDRTes49Pfbul3MkdfQ==
X-Received: by 2002:a17:90b:4f47:b0:1f2:ab5b:f1b4 with SMTP id
 pj7-20020a17090b4f4700b001f2ab5bf1b4mr1611250pjb.208.1658882490617;
        Tue, 26 Jul 2022 17:41:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] gnupg: update 2.3.4 -> 2.3.6
Date: Tue, 26 Jul 2022 14:40:37 -1000
Message-Id: 
 <4e9c180baf5fea79a2ca472651b782038051b837.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168529

From: Alexander Kanavin <alex.kanavin@gmail.com>

Remove 0003-dirmngr-uses-libgpg-error.patch
(upstream addressed the issue).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


