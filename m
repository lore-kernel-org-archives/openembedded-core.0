Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.8252.1630072302671850762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 06:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=yhMLo+4A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id f22so7211096qkm.5
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 06:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z19sPdE1m9FuuTafMyjwQSu6Y5QbfblqXJQQeX2LK/A=;
        b=yhMLo+4AGNCMmJz2KE8v/RGmIZyxaMiZ/Y216xgp0MEdzAWgKUK8Y8n8DmtBN/FpEt
         fXl58nn4Y+BZnbjm/5VSAvLtg9ru1CneLfcu19SCJ4jiQnCKh5iEmITM9h++fQfhlFhm
         Z4Ct3oQZyfZM1X7tQrmWjPo3FNgNV/P2SLSwM1kswQGZTBLB0aZTjyT7xefQpjxxtqr1
         zu+yE5jDvk6xmaviIlKN3XGFfxZtBnF3FUa2iw3415ThbJNIk2jm/aGKqYvyzHHbOFV7
         JcvXsR2AWOy/Tw3hqgRB2GjAD135pPpfp1RDPIYA6ZAZelhbqeJuzSsTCJ31KdKS8ufr
         kbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z19sPdE1m9FuuTafMyjwQSu6Y5QbfblqXJQQeX2LK/A=;
        b=ZLgIxhJ97J7Wk4JBOrZvi67O3F93gOlwCMPZbe7ZLeUlC5szbF1qA/FMBY7YIb2+dB
         kaSKEEm5IPIxiWxNv73Gwic6lLEoYQxjoSrhArrlHEwg8NlLiv2im/iWQKFQfS8a1X8D
         Da3c9o8SdxieVeo83+xWHCjuO8e9AwnfcUMCCRMKN5c7aLvRdWoOVMguofLw12WuTYmE
         XOrQELUqvvb59Rb11i1zj8NL+kqK2uRL0xUlD8EekcikQl8XfsBg+NelaAZCgDEFOTAl
         T+apFGDbqbDNNBgJV6/CEO9FIEcdeRa73T8XkZNzGlGbzxV1esSNS+jlst+5MIIWg489
         NgqQ==
X-Gm-Message-State: AOAM531jZEckerknS2izwp2OJv7mdwNGg5ncib0Q/o50FwU5L529DQKM
	S7aBNig2PbdnMt5Tl8zPVj94DbobodlqnA==
X-Google-Smtp-Source: ABdhPJygV5CuutzCko1VAHCXUne5e2+AgHUtz83n1ggG47Vi8QUx+5I1vI0T+5YY7ga8d+ORQhgDog==
X-Received: by 2002:a05:620a:2a10:: with SMTP id o16mr8861070qkp.481.1630072301429;
        Fri, 27 Aug 2021 06:51:41 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:51d1:38d8:2952:3ff1])
        by smtp.gmail.com with ESMTPSA id p22sm4693858qkj.16.2021.08.27.06.51.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:51:40 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] tune-*: Use more specific DEFAULTTUNE
Date: Fri, 27 Aug 2021 09:51:40 -0400
Message-Id: <20210827135140.22421-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files are using a more generic DEFAULTTUNE in their targeted tune
file.  This is contrary to what is being done in other tune files, and
this changes them to match.  It is still possible to use the more
generic DEFAULTTUNE in a machine's config file by simply specifying it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/arm/armv4/tune-arm920t.inc       | 2 +-
 meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc      | 2 +-
 meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc    | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc    | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc     | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc     | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc     | 2 +-
 meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc     | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/arm/armv4/tune-arm920t.inc b/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
index 8a615792dfb1..1b1cbdb5a7d1 100644
--- a/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
+++ b/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv4t"
+DEFAULTTUNE ?= "arm920t"
 
 require conf/machine/include/arm/arch-armv4.inc
 
diff --git a/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc b/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
index 5ab286b5767e..78b890b43c3e 100644
--- a/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
+++ b/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv4t"
+DEFAULTTUNE ?= "arm9tdmi"
 
 require conf/machine/include/arm/arch-armv4.inc
 
diff --git a/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc b/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
index 6f5033bbc12a..38ea9b7dd596 100644
--- a/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
+++ b/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv4"
+DEFAULTTUNE ?= "strongarm"
 
 require conf/machine/include/arm/arch-armv4.inc
 
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
index 66bc124dc0bc..e827afb2a08f 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7vethf-neon"
+DEFAULTTUNE ?= "cortexa15thf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
index 324673d44007..3ad00b16d81f 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7vethf-neon"
+DEFAULTTUNE ?= "cortexa17thf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
index 817eb166d6ed..0de5aadaaa3f 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7athf-neon"
+DEFAULTTUNE ?= "cortexa5thf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
index 5384369b5994..1ada527d8b32 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7vethf-neon"
+DEFAULTTUNE ?= "cortexa7thf-neon"
 
 require conf/machine/include/arm/arch-armv7ve.inc
 
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
index e27002a29a61..952302afa210 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7athf-neon"
+DEFAULTTUNE ?= "cortexa8thf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
diff --git a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
index d046a11a513a..4b4a52884d90 100644
--- a/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
+++ b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
@@ -1,4 +1,4 @@
-DEFAULTTUNE ?= "armv7athf-neon"
+DEFAULTTUNE ?= "cortexa9thf-neon"
 
 require conf/machine/include/arm/arch-armv7a.inc
 
-- 
2.20.1

