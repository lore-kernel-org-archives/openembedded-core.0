Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.79856.1629437255634390341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UOj95JYO;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id k14so8059164pga.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=06Zj87EoENgezFGteoVxdbC+qv61hkfr7l8nfiZPrUQ=;
        b=UOj95JYOFwv6HVloW9MDvMCEToVnz7Sb8tQc/IdP8ABW35r0um4wmCOaEyH6QNiyO9
         99GovlnSGFI5zEiDYlgSiEsPLFmemKWKqb58ZGBAF5rS+t5atBJBw1Rw9Eal1QVOtMQW
         +QiDAMUpBMXbc1W1MzmdkEoskX4kOq0XF6a0ycOlwYyQJyX0Y1WPI+OdASkM/gSCaNKM
         +5TU0nbxwKOVIowx25sSHCYjiTUtjTheYnyX2XlDznkpxKJ6NdPLIkm6wpfY4ss27nHH
         MNqbV4UnWtWo8n/gus3S+1FpJoO2V7ASRDx6EDMLQwucCN6r9ZBfqHZpcgEnNYX+h7by
         ey8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=06Zj87EoENgezFGteoVxdbC+qv61hkfr7l8nfiZPrUQ=;
        b=hMqzVv0wFkdKoh3HdQKyOBZV2z8osEm61QQ8306HYRaHr1qjl6IE4Y15EWcJ+8MmRS
         xnixamTDHW+l90afI1C3TwIABwya7/S+Vxfbltav2/5WNAtPRhKRKgOSKNZDrMUG8aqI
         u21sw1uI5ya7PGjZAN4kSEKo+ObmCWcZ32l7XqGDyNrXucBtPJbesOv+UFUdqqZuArWY
         ISihe9d8VC3iJFfAbtgHiS/rFf3LNBMWyZNfDLf207O6TUvAMV2sR546Hn5Ye34gV3UK
         TMmKgukZP85c/6Ds9vX/46MrC8CNNH4/Fa13/wUNGkxQjrP8cUk9mGNwL+2R6qwsl1O/
         6/WQ==
X-Gm-Message-State: AOAM5308hfqY4ZWuY98ws8Te7WouOv74tSPVNzBtHlF95cnHQFq6WW+L
	y92b4dYbVR68u5gXLUAL6ms03HzpUOMOAg==
X-Google-Smtp-Source: ABdhPJye/AibDztlZFWQ6wtGCXX4Cl+Uc9co4U/XmmU/Cticol25R8RDdffufHRn1MVVnaVTSldiJA==
X-Received: by 2002:a63:4455:: with SMTP id t21mr17036649pgk.91.1629437255114;
        Thu, 19 Aug 2021 22:27:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id c7sm3642131pjc.31.2021.08.19.22.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 22:27:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 3/7] gnupg: upgrade 2.2.20 -> 2.2.21
Date: Thu, 19 Aug 2021 22:27:28 -0700
Message-Id: <20210820052732.2606-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820052732.2606-1-akuster808@gmail.com>
References: <20210820052732.2606-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 1aeb32228d92568e90f313a2a027c6790937eb8a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50e1649a320f2e631da9e6393efb8459fd979e88)
Signed-off-by: Armin Kuster <akuster@mvista.com>
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

