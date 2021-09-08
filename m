Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.15282.1631124098494755799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WNIrEzOI;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id g16so4581119wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poqcu33GMaaGwgmUQyLA5spoO8L8KGPZrq7bLxwYNKc=;
        b=WNIrEzOINl8RVXb7+IEVCxY5G3shIeagyuZiNqbzYcMV3SdQWxHoLl55rg2f74iuDs
         tllgp18gY3J/+g9WRSpoSXBFob/nOnDl04QRvlLGHd0jsAEPuvx0eObXiB0Hyoxo2Hbj
         NBMW1SVKqi2JgJDOmg4crpSt3UkciVhRxCgpcQnKjeyl5dV2bImKjrWwWW91VptuuM5d
         1tkOF6xaanTWoCU0+74Rm4tysD1SDaCjcS9fw6r8uploNiubvVENrtO92p96O69oHxbJ
         JDWf6vEUaYW1Lwb0zl6tLxWqG+jXS87Vbf3sUergmm337ySHUmuw0WCyTqJVCA3WJXI9
         9iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poqcu33GMaaGwgmUQyLA5spoO8L8KGPZrq7bLxwYNKc=;
        b=TcSCePSCRhjsyIpeaDxj/N5XGMnVrifKGBm6dmLDojdExaz/FNvViRPM5mZo+KrXHL
         NBdxEa5ztcf8USdXqYosCj/saFuQHyNcLDp9lLeKgsOkkw1yVlvaVsUB5zWYqnghGrMV
         09kFZ3+MDPqKti9t57jAflRiEV2UfFHQj68+NckRiNf+6g2xzjGDT01fulxuPo6fgi8Q
         MR8AK54XljrzW11QeYxi1dcqJ6AydmxlUCjytahZOjSW7NCy+SBEm0tEHonWwONKsLGS
         M+ee77NGHOlx3qIYVsinp9NBxuU6RkdnKokV6DO4ifd9gANDElekS/qgFE5ePrxwAHUT
         fNwg==
X-Gm-Message-State: AOAM531OooXEPHW3Hp2NQgbqBC6SC0Vbk4tDQaaEoDd8NzhauitixBbr
	TAQybpH52jmE29Qyb1aRro+bwG4RWic=
X-Google-Smtp-Source: ABdhPJwmude6di7UXu9g+tOPfReFv4P7xbgA2VoTAcfA5OvEkpDoEDxVM0LXGVwUepDVcoMt54xLmw==
X-Received: by 2002:adf:f552:: with SMTP id j18mr5159460wrp.273.1631124097071;
        Wed, 08 Sep 2021 11:01:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/26] gnupg: update 2.3.1 -> 2.3.2
Date: Wed,  8 Sep 2021 20:01:11 +0200
Message-Id: <20210908180125.103473-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Drop chunk from relocate.patch, the upstream code no longer exists.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 +--
 .../gnupg/gnupg/relocate.patch                | 39 +++++++------------
 .../gnupg/{gnupg_2.3.1.bb => gnupg_2.3.2.bb}  |  2 +-
 3 files changed, 19 insertions(+), 28 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.3.1.bb => gnupg_2.3.2.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index ecd6263626..a66a8e62b0 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 52ba9d34cd9317145ee8a93afd5d73dd0cbf3182 Mon Sep 17 00:00:00 2001
+From c873c85b1ee1c35ebbba0bc80c2352c64787a5fd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7a2d410..14a7203 100644
+index d03ea3b..a6dfa19 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1841,7 +1841,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1958,7 +1958,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 9b0f0a8ce0..f9f38c2876 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From d6992692d1c36983b709fe1ff049cc91ef2c408a Mon Sep 17 00:00:00 2001
+From 5a68a37ae2649e0988965cfe3a63a0142f0182a1 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -8,23 +8,23 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- common/homedir.c | 16 ++++++++--------
- 1 file changed, 8 insertions(+), 8 deletions(-)
+ common/homedir.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 85e09c4..e1410e2 100644
+index 7969a2c..06b8016 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -788,7 +788,7 @@ gnupg_socketdir (void)
+@@ -918,7 +918,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
 -      name = _gnupg_socketdir_internal (0, &dummy);
 +      name = getenv("GNUPG_SOCKETDIR") ?: _gnupg_socketdir_internal (0, &dummy);
+       gpgrt_annotate_leaked_object (name);
      }
  
-   return name;
-@@ -814,7 +814,7 @@ gnupg_sysconfdir (void)
+@@ -946,7 +946,7 @@ gnupg_sysconfdir (void)
      }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
@@ -33,7 +33,7 @@ index 85e09c4..e1410e2 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -843,7 +843,7 @@ gnupg_bindir (void)
+@@ -978,7 +978,7 @@ gnupg_bindir (void)
    else
      return rdir;
  #else /*!HAVE_W32_SYSTEM*/
@@ -42,7 +42,7 @@ index 85e09c4..e1410e2 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -856,7 +856,7 @@ gnupg_libexecdir (void)
+@@ -991,7 +991,7 @@ gnupg_libexecdir (void)
  #ifdef HAVE_W32_SYSTEM
    return gnupg_bindir ();
  #else /*!HAVE_W32_SYSTEM*/
@@ -51,8 +51,8 @@ index 85e09c4..e1410e2 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -870,7 +870,7 @@ gnupg_libdir (void)
-     name = xstrconcat (w32_rootdir (), DIRSEP_S "lib" DIRSEP_S "gnupg", NULL);
+@@ -1008,7 +1008,7 @@ gnupg_libdir (void)
+     }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
 -  return GNUPG_LIBDIR;
@@ -60,8 +60,8 @@ index 85e09c4..e1410e2 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -884,7 +884,7 @@ gnupg_datadir (void)
-     name = xstrconcat (w32_rootdir (), DIRSEP_S "share" DIRSEP_S "gnupg", NULL);
+@@ -1026,7 +1026,7 @@ gnupg_datadir (void)
+     }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
 -  return GNUPG_DATADIR;
@@ -69,8 +69,8 @@ index 85e09c4..e1410e2 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -900,7 +900,7 @@ gnupg_localedir (void)
-                        NULL);
+@@ -1045,7 +1045,7 @@ gnupg_localedir (void)
+     }
    return name;
  #else /*!HAVE_W32_SYSTEM*/
 -  return LOCALEDIR;
@@ -78,12 +78,3 @@ index 85e09c4..e1410e2 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -971,7 +971,7 @@ gnupg_cachedir (void)
-     }
-   return dir;
- #else /*!HAVE_W32_SYSTEM*/
--  return GNUPG_LOCALSTATEDIR "/cache/" PACKAGE_NAME;
-+  return getenv("GNUPG_LOCALSTATEDIR") ?: GNUPG_LOCALSTATEDIR "/cache/" PACKAGE_NAME;
- #endif /*!HAVE_W32_SYSTEM*/
- }
- 
diff --git a/meta/recipes-support/gnupg/gnupg_2.3.1.bb b/meta/recipes-support/gnupg/gnupg_2.3.2.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.3.1.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.2.bb
index b8b0314d2f..135395e55d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.1.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.2.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "c498db346a9b9a4b399e514c8f56dfc0a888ce8f327f10376ff984452cd154ec"
+SRC_URI[sha256sum] = "e1d953e0e296072fca284215103ef168885eaac596c4660c5039a36a83e3041b"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.31.1

