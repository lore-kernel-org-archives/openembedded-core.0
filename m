Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.31233.1629151307976538477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 15:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=mFRXD1iO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id dt3so8277783qvb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N+6v5k6wdiZrNsBUWikaaJd5/kpqIt/oiZJAcISHlUI=;
        b=mFRXD1iOiYnwXVegZ8cSduR3YS89yqv17EWfe8YtElSoBTQ+rXJTtrSx9Hg+j5+khU
         JlE34OVg6VP6LWADHBaq4ySyM9JEkoUYNdk5R+6PgdfcUjHktyZx6f/Nb14LnBV31DEs
         2pXL9x1GJS+nno+y5AyVfsvNCas72IlCfWwxEDSLz/tLl3AFSlPTynFJyv60wxm3XNXt
         Sye5Q+0CVyKUDsiPS41v2+X08YG7oF31TfJn0Cmuy/N+Z6BdBg57sCezZDflydK/jcTA
         yCSIMvSZmg+e0EjjBRI2OPKa7F5ySLsc4lcafD5sWdcx8WJLH6PwX18TTSXmn6A6sv59
         BOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+6v5k6wdiZrNsBUWikaaJd5/kpqIt/oiZJAcISHlUI=;
        b=aeWMF3wKURX2l02P86e7haFzgM43cJAPAHHmqL6DRPP6eiOfVzy9uiz9eB5jFU4V2Y
         +bJBvL4hD2QAqTrtoxl1bC2dRC0atswExIdjqczoSSgxj8/dFW4fYGhF8txWLlCNU0D6
         bxytm6vQ0DP2PaGpBF2eAw3tgJJWUJeqw3R2LWr60vQtRWf0dQsAVQhqNKRy/rmgnJZ1
         WGleU3BK5lL+BTCeUvz6O/CTpCpZPLdutdoeOcuR+IicdAX7Bx2Wo8vCC31YJSYLKA6w
         jrAaphtkarrK6tB60D1CssLYoojEtPHG2y4VX5VPQShPAStrd+FR9HQlJv6GFBFsmvmO
         KOMg==
X-Gm-Message-State: AOAM532XdNO3T6UAad5RhgWPU05YwBjp80Y1J6/UQtWF1TcSL1zv6wJI
	JgopWFE98fr5rtJ4ENB3P32XoaoypuCi7g==
X-Google-Smtp-Source: ABdhPJzKKNl21VaOkXiMjI5q0UbYp5VcVk4yizuie1CkNVyJL70E9Yzc5bTGWRmc8cml5QsJcP6lKQ==
X-Received: by 2002:a0c:c490:: with SMTP id u16mr151848qvi.26.1629151306985;
        Mon, 16 Aug 2021 15:01:46 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:f177:a44a:469d:7e14])
        by smtp.gmail.com with ESMTPSA id v6sm118292qkg.1.2021.08.16.15.01.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 15:01:46 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] yocto-bsp: update machine confs with new tune locations
Date: Mon, 16 Aug 2021 18:01:43 -0400
Message-Id: <20210816220144.26018-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816220144.26018-1-jdmason@kudzu.us>
References: <20210816220144.26018-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf         | 2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf               | 2 +-
 meta-yocto-bsp/conf/machine/genericx86-64.conf            | 2 +-
 meta-yocto-bsp/conf/machine/genericx86.conf               | 2 +-
 meta-yocto-bsp/conf/machine/include/genericx86-common.inc | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index 65c79fd34db6..fa7275fe2d26 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -12,7 +12,7 @@ MACHINE_EXTRA_RRECOMMENDS = "kernel-modules kernel-devicetree"
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 DEFAULTTUNE ?= "cortexa8hf-neon"
-include conf/machine/include/tune-cortexa8.inc
+include conf/machine/include/arm/armv7a/tune-cortexa8.inc
 
 IMAGE_FSTYPES += "tar.bz2 jffs2 wic wic.bmap"
 EXTRA_IMAGECMD:jffs2 = "-lnp "
diff --git a/meta-yocto-bsp/conf/machine/edgerouter.conf b/meta-yocto-bsp/conf/machine/edgerouter.conf
index fbe33be9d157..447862f550bc 100644
--- a/meta-yocto-bsp/conf/machine/edgerouter.conf
+++ b/meta-yocto-bsp/conf/machine/edgerouter.conf
@@ -2,7 +2,7 @@
 #@NAME: Edgerouter
 #@DESCRIPTION: Machine configuration for a generic edgerouter
 
-require conf/machine/include/tune-mips64.inc
+require conf/machine/include/mips/tune-mips64.inc
 
 MACHINE_FEATURES = "pci ext2 ext3 serial"
 
diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
index 81ec24e97146..14913ea1f152 100644
--- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for generic x86_64 (64-bit) PCs and servers. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
 
 DEFAULTTUNE ?= "core2-64"
-require conf/machine/include/tune-core2.inc
+require conf/machine/include/x86/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
 
 SERIAL_CONSOLES_CHECK = "ttyS0"
diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
index 1387bde852f8..ed4fc8a3de8d 100644
--- a/meta-yocto-bsp/conf/machine/genericx86.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for generic x86 (32-bit) PCs. Supports a moderately wide range of drivers that should boot and be usable on "typical" hardware.
 
 DEFAULTTUNE ?= "core2-32"
-require conf/machine/include/tune-core2.inc
+require conf/machine/include/x86/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "gma500-gfx-check"
diff --git a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
index 59d96d1417b0..253a855dc344 100644
--- a/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
+++ b/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
@@ -1,5 +1,5 @@
-include conf/machine/include/x86-base.inc
-require conf/machine/include/qemuboot-x86.inc
+include conf/machine/include/x86/x86-base.inc
+require conf/machine/include/x86/qemuboot-x86.inc
 MACHINE_FEATURES += "wifi efi pcbios"
 
 PREFERRED_VERSION_linux-yocto ?= "5.10%"
-- 
2.20.1

