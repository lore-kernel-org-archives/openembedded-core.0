Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.1413.1628631907580611161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 14:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=C1DM/Wyx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id t66so113041qkb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 14:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4LioFkj26iGN+UJwFisRtcrnak+WfEv5oCs/PwldvYU=;
        b=C1DM/WyxfWy8mwhnbn4NvfevcKNqGsDhZoWZp4NF6fkoOsWAv7mj1GuqFdG/mGnYcg
         59T9iy2tPfp+zVC2q4CGNV6OpDw0oqxdb2WrnxeFpamGCeTi5h8DUJsCdMTp05ayqP0A
         2bKiczGxUYehmSFt3tvCKvgJuyki0aKhZGwcgwnaJ/pzdqsJbiLnrzts1ERwQ2bl8Hvg
         xZEVDemxzjPaByQ+0WP5jyRti+8Daam5aHJGbvCNxIjr05DDZ8wocTHsFvhlZQ/5chjx
         kPKZDoH28GXMVMEnTG2fRCYD6W2e5jgp0b9eBmTUaMhFOSNRz8gX2vFm2SGq9Kev/oPB
         yqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4LioFkj26iGN+UJwFisRtcrnak+WfEv5oCs/PwldvYU=;
        b=PzXQAlaBv0Yip18MGYYWJDFyXK2eEpKIhJRkXgCrBfkYiaU3tTnV2KhpnhvW/5urlw
         mBihkIK0eNd5C3tz2e9kKvMF+U4JmWrVe8UZGU/fcjYjk6b4FVcv2KS1VECBmnZwNT3N
         V2wnT4qd1GHz3bs4FTwGnLGhJ46b/MTU33z89+yOVyOPtkDk7eZfChYmBtcORN3NWl28
         aUXhO/oapIVyllaB5TV1X9ididgF1iAP/X5jqJEEcyJm2wfwV5j/6dY9pdp09nqDVVcE
         0bWMfP2ZO0uSCY7iTsjAVb911jWdsnt1q7kH5UxHizHWZ862Bk3h3jyyPt1xPawH2odI
         9NeQ==
X-Gm-Message-State: AOAM5337KX6XmE6T/mbARBimubZh+Y5/cNNrLJSHprCyZBnOlccA00Uw
	SwHX/Ns1GW3m73iMH8lKS55OPPeogmzEuQ==
X-Google-Smtp-Source: ABdhPJwzGGojOpju6A2OECP66RnoyxAAh8hWunltYMh30glUXFHeaVfr/Z9+MsbWHEp4EOAW5vryZg==
X-Received: by 2002:a37:6697:: with SMTP id a145mr13478903qkc.237.1628631905798;
        Tue, 10 Aug 2021 14:45:05 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:3d70:ad83:63ae:3283])
        by smtp.gmail.com with ESMTPSA id b11sm5833035qtt.42.2021.08.10.14.45.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 14:45:05 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] yocto-bsp: update machine confs with new tune locations
Date: Tue, 10 Aug 2021 17:45:02 -0400
Message-Id: <20210810214503.17791-3-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210810214503.17791-1-jdmason@kudzu.us>
References: <20210810214503.17791-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf | 2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf       | 2 +-
 meta-yocto-bsp/conf/machine/genericx86-64.conf    | 2 +-
 meta-yocto-bsp/conf/machine/genericx86.conf       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
index 65c79fd34db6..eb4e0fb1b157 100644
--- a/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
+++ b/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf
@@ -12,7 +12,7 @@ MACHINE_EXTRA_RRECOMMENDS = "kernel-modules kernel-devicetree"
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 DEFAULTTUNE ?= "cortexa8hf-neon"
-include conf/machine/include/tune-cortexa8.inc
+include conf/machine/include/arm/tune-cortexa8.inc
 
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
-- 
2.20.1

