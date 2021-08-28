Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web08.174.1630174326486850782
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EOAyaDKQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id y3so10886735ilm.6
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2JIOhUCTDUgMZFghrSDEe4Ckqf7Hdx6tKWJyeLi9TBQ=;
        b=EOAyaDKQJEDQYvwjaELRbq+MzL9KJv+KfhT7RFsNPEa97sc3wAEi8mC8DhbO/DLzO6
         hVrL9c/bH26X7rrJ6fFJxLPZiJ80rcX6okpYyNao0k8grM8/T3k7XP+HMInboP5/O463
         MRCCwGv8UjVVnGwFXiBSkU2kYNJu4y7769Ob/3MGfv1pNOUr12aBKxEia73m88p9kOni
         4YFwcTM4rd5fnT4xbHrnULWp5uYv97AS45+jVV+5ZdsB+grheTcgTjIrd9VYB5q8fTfW
         t2Gncp7CunlmbqBD1lz00NmVaMqEImoTtvbKncQPYcic2cBwtNl33lIbp1zPPS+b5y+e
         afkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2JIOhUCTDUgMZFghrSDEe4Ckqf7Hdx6tKWJyeLi9TBQ=;
        b=qAtkapFczp9UKQznNfDR+tF8V87ik3v+Y/E2Kf7n8Yb7PsEmesKzPO0mEb5YXnt99q
         6JAFcnqzo4jQzcSFivhJVACW+ROrmGkKaEDAa6tMp9Zamc/NyqgHOtKVIOHvRdMdFyoa
         EOLUTJ5MFs6xg1SDFKIm8g90BEKm/IxxG0/wkaqN8eLQPrNSFK3Q794bkvZXSx4gZwii
         QIW6HQDasAKtWNVzdCukzkHrGrO+RpH3lOjsVbK4ytYLq6GM2pYA0tNGeMaDzIsxNWMM
         VdUPNYeL5NnvQIgWZrAWTEqmhxQwMcwviLT2/z/4XfwzX7nn8YUxZWJnzBO4mfy/xiYK
         OP3A==
X-Gm-Message-State: AOAM530bi6+zqxM/ySGud9v7TG3Ear7vsdV6pp1eX9O5AJAunF5tVc8a
	uGF7Wc2D6qmQoiKjp6Vir3SAy5d2RSJWiVGi
X-Google-Smtp-Source: ABdhPJw/TzmdE8VKaQY38sgA2/GhhSXf9Nvsj5o/yJprGcBb1OD2B7Gm9bzpM9xCndDGkUadfbJcpg==
X-Received: by 2002:a05:6e02:dcc:: with SMTP id l12mr10771079ilj.20.1630174325427;
        Sat, 28 Aug 2021 11:12:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/36] gnupg: upgrade 2.2.20 -> 2.2.21
Date: Sat, 28 Aug 2021 08:10:51 -1000
Message-Id: <08186dd7594820dbb7e9c7f7385672917882b262.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 1aeb32228d92568e90f313a2a027c6790937eb8a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50e1649a320f2e631da9e6393efb8459fd979e88)
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/gnupg/relocate.patch                | 20 +++++++++----------
 .../{gnupg_2.2.20.bb => gnupg_2.2.21.bb}      |  3 +--
 3 files changed, 14 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.20.bb => gnupg_2.2.21.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 2c204e0245..0e78f5679e 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From e7ad11cf54475e455fdb84d118e4782961698567 Mon Sep 17 00:00:00 2001
+From 0e51c62706a8c54e90a2d98c5250ecc894c65182 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 919ab31..cd58fdb 100644
+index f3c9863..a57f559 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1855,7 +1855,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1856,7 +1856,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index e5a82aa76d..25732a8277 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 59c077f32e81190955910cae02599c7a3edfa7fb Mon Sep 17 00:00:00 2001
+From 6e3b1d89758c3ee7072aeefa305ce5fe76f2e439 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index e9e75d0..19140aa 100644
+index 4b6e46e..58989b4 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -760,7 +760,7 @@ gnupg_socketdir (void)
+@@ -763,7 +763,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -24,7 +24,7 @@ index e9e75d0..19140aa 100644
      }
  
    return name;
-@@ -786,7 +786,7 @@ gnupg_sysconfdir (void)
+@@ -789,7 +789,7 @@ gnupg_sysconfdir (void)
      }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -33,7 +33,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -815,7 +815,7 @@ gnupg_bindir (void)
+@@ -818,7 +818,7 @@ gnupg_bindir (void)
    else
      return rdir;
  #else /*!HAVE_W32_SYSTEM*/
@@ -42,7 +42,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -828,7 +828,7 @@ gnupg_libexecdir (void)
+@@ -831,7 +831,7 @@ gnupg_libexecdir (void)
  #ifdef HAVE_W32_SYSTEM
    return gnupg_bindir ();
  #else /*!HAVE_W32_SYSTEM*/
@@ -51,7 +51,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -842,7 +842,7 @@ gnupg_libdir (void)
+@@ -845,7 +845,7 @@ gnupg_libdir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "lib" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -60,7 +60,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -856,7 +856,7 @@ gnupg_datadir (void)
+@@ -859,7 +859,7 @@ gnupg_datadir (void)
      name = xstrconcat (w32_rootdir (), DIRSEP_S "share" DIRSEP_S "gnupg", NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -69,7 +69,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -872,7 +872,7 @@ gnupg_localedir (void)
+@@ -875,7 +875,7 @@ gnupg_localedir (void)
                         NULL);
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -78,7 +78,7 @@ index e9e75d0..19140aa 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -940,7 +940,7 @@ gnupg_cachedir (void)
+@@ -943,7 +943,7 @@ gnupg_cachedir (void)
      }
    return dir;
  #else /*!HAVE_W32_SYSTEM*/
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.20.bb b/meta/recipes-support/gnupg/gnupg_2.2.21.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.2.20.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.21.bb
index 6629fc8556..f0aca9ef3e 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.21.bb
@@ -25,8 +25,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[md5sum] = "4ff88920cf52b35db0dedaee87bdbbb1"
-SRC_URI[sha256sum] = "04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30"
+SRC_URI[sha256sum] = "61e83278fb5fa7336658a8b73ab26f379d41275bb1c7c6e694dd9f9a6e8e76ec"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

