Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.5344.1605279158827234290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WE6uoRlf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id h6so7256767pgk.4
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VwjgjiiOboA8lxOcYbafPMV86RVnT/pY7sKY/5Uq4kc=;
        b=WE6uoRlfr9UKob4kx92MBKOc+gwW/Q3eN8++ccIa39hvyqTGpi+btfaTpPdmbegInW
         6z+Mjt8I6epH2xtW3KxhPEj5bSfYEN8mHiEiytgui66mJLJg6t5j8+TtiThpeyLIHkO3
         MSqU8T7iY6eYd6Vc8+nHUcau0b1MJVh+y4cF0icyu1ixPVLssKx8ctemrh0kJuIhhGBl
         U7fSDboTZNyS9QPX4Eh/EHm1vIbLsUspEJZhF4chfWBq5KTFuriJBynmGnrZjhaf6dUD
         4Axp0yOrDL2LkGAC3VKiNWxCatV+PA2rEXM+nt/LCTfumPRzp5O1GOYYmskv1PcAaMNq
         OASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VwjgjiiOboA8lxOcYbafPMV86RVnT/pY7sKY/5Uq4kc=;
        b=epCjfRhfxGyiEkZjL6glxG78x7CLPd9mX1R6B0iOzPzetjVMuSFXsVMt3nT1qMNudv
         mrbkZMpzkuU4SsCiDVj/P2h3nS00UEreI6n3db2IegyZgeRLCgtZo4izgpQ6rouXBXSe
         OJ2m/sI2A+SOzVdol4t5nggDYWDIq2+2/n2zXkNGfpcIQwVuUNBicoGXihca2/uveYtV
         aoQzyCquXqnBgyYoMtQB8GhtXK9vATnwJBKAKlU96MHJHOpdiFxCfcV+fNAcev6EIhJC
         /g5dNIq7L+HNfktsHB9VTuXOsSF9FaJ+0BYHGEqdSfxklAYSP8CB4IblQWD8by8PXlbq
         PULg==
X-Gm-Message-State: AOAM531A9NHVt8spcSBtmw9bxFemP+uequByFmiYSyt0D+uzLMBzjzAz
	tauqRuKX07fbYYPQafKU0FZCTW5fB14/9UhM
X-Google-Smtp-Source: ABdhPJy1fCjlPunvJncIeyvGjtc1uSQUKAPU2X1v21Ezu820abLuuyr3qSLtFgd479J7HMnWy+DEow==
X-Received: by 2002:a17:90a:4497:: with SMTP id t23mr3374798pjg.39.1605279157798;
        Fri, 13 Nov 2020 06:52:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:37 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/18] dosfstools: add mkfs.vfat to ALTERNATIVE
Date: Fri, 13 Nov 2020 04:52:05 -1000
Message-Id: <4afa9f08123df819e53b5d9d586f7a34dcde1ef1.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Ricardo Salveti <ricardo@foundries.io>

The mkfs.vfat tool can also be provided by busybox via the CONFIG_MKFS_VFAT
configuration (not enabled by default in OE but can be enabled on
systems avoiding components based on GPLv3).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1227a29974671fd52014deaca7ac859a037cdeb5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 23b8836670..e4ab113391 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b741247
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig update-alternatives
 
 EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 
@@ -26,3 +26,7 @@ BBCLASSEXTEND = "native"
 
 # Add codepage437 to avoid error from `dosfsck -l`
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "mkfs.vfat"
+ALTERNATIVE_LINK_NAME[mkfs.vfat] = "${sbindir}/mkfs.vfat"
-- 
2.17.1

