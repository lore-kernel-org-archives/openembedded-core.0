Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.3359.1594933708730641782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LN1GlB//;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id s10so8537345wrw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=h2Ob7qDBB0vvh9oGn+vCMc6n0uaKpzceq6aa6swi7wM=;
        b=LN1GlB//EI8xMPwDiY89HXS20hNdzIE216BjGRPHaHXervSibol4yzgu7GOc3Ptl13
         rK/5gqvauVfj4H+VkUfmnk1AlkdKvAMvS8T56JUAVdYLLBmu+5h0AbtAGxsibWoFTFFa
         bD/IIZr114CCJqbA3UMb0A4ebvg8uAlt/Vs0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2Ob7qDBB0vvh9oGn+vCMc6n0uaKpzceq6aa6swi7wM=;
        b=eyZITJ1LzDSWrPtn+KV4CI3dPsOi/D/5oaPHOA4QVKTS9EVMg13Stn47GTfEkEpRon
         G33pLquyItsl5tcJmAO4AHrdeYpt33/3CPwzk8WiDuVv32x5yxgtrH56z3XvBmPSVWDX
         Wh1e7UwmZoMzygz6xtEzf/ijjfQqRK0BrE9lXLBtiGwA2OygwVFbPG9BeoBkLBv0Acu9
         bQZTTqmZmhvX/k2hQBdlkDrVmH/hJXzgnUbwnTzEBo5NVClvvMKhZ9cpwl+fnBWHyUxS
         MlJERME+uN1x+6Jd+iu0TPKNCAnD8yQ8FuCAT4PlMBUhbxhX0xaU8WEwj6Imzvmhyzu2
         2urQ==
X-Gm-Message-State: AOAM53114V5hkyOWqg1dWa48gVZ2d23w6FOsV8Ca3hNqtdm4o4IGoo8W
	MFjTwPHVaq8HhuBW+IC4WrixdulWyAJwVg==
X-Google-Smtp-Source: ABdhPJxolZxU8LequUSGsv9JHncLxOnTLJuV7fH6jQ0+nNOFt+Ez8H8bKXTCXwJQOf/T17LhTfnz1w==
X-Received: by 2002:adf:8521:: with SMTP id 30mr6510213wrh.238.1594933706954;
        Thu, 16 Jul 2020 14:08:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/20] gnupg: upgrade 2.2.20 -> 2.2.21
Date: Thu, 16 Jul 2020 22:08:03 +0100
Message-Id: <20200716210808.7438-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-a-custom-value-for-the-location-of-.patch |  6 +++---
 .../gnupg/gnupg/relocate.patch                | 20 +++++++++----------
 .../{gnupg_2.2.20.bb => gnupg_2.2.21.bb}      |  3 +--
 3 files changed, 14 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.20.bb => gnupg_2.2.21.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 2c204e02452..0e78f5679ed 100644
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
index e5a82aa76d5..25732a82772 100644
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
index f754573c88b..701d769e642 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.21.bb
@@ -20,8 +20,7 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI_append_class-nativesdk = " file://relocate.patch"
 
-SRC_URI[md5sum] = "4ff88920cf52b35db0dedaee87bdbbb1"
-SRC_URI[sha256sum] = "04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30"
+SRC_URI[sha256sum] = "61e83278fb5fa7336658a8b73ab26f379d41275bb1c7c6e694dd9f9a6e8e76ec"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.1

