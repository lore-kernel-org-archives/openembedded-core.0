Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.15440.1585153046955676545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 09:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WnnCNvh6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id b12so3125106wmj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FlP4+vciYRKAyphvJ+J3ILnE9boUnVgaT2GD99vwOcA=;
        b=WnnCNvh6xF8n6dpVGTYMy/fxOS73RWslKD8SODNKR6p+4KDa86x7bhq5QAYQqsytLM
         G/qfIKO0pCcUuUy3IUUrWw6lOAlYcI9Jp0llyAreqqQo2deUzR7CpFsm7Rs8jndsdMUJ
         rYlNjxf/jl5sqwmaVQkoiwp5lLFwF2tMukJI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FlP4+vciYRKAyphvJ+J3ILnE9boUnVgaT2GD99vwOcA=;
        b=mX/PzuXWRyNI4vPVJqtPpxf5U/qA1cK+p+oOkDb57qgCa13DpiVv+MLukOIWYzwHg7
         71Qjw0IC0r1H/Hwnpt3udfnxkI7hLHBtbbrmv0UgjUA2hyA4F5OPKy2m1GpIIasvVL3p
         IozbmwsQwpDQUCi/I7FWPGhhE8qlMZQorw768wLQuYbdsEZvXexm3JQZZR35VZSC0wRd
         C+HjmZY3ctEi/MVdW3eztIX/vjP7GdE9y63C47A0PamWDNVVFxNCuEG/jHUOZB4jmt1f
         eCsyWvHGkEewZYP/QrHqpT5+6MMRqxNQnX/ySKRG5ILK715O+kmtQN9PE6+5VHODXdof
         WvdA==
X-Gm-Message-State: ANhLgQ3q48liwzGlTBhK90HhmeAwwYc9fewXnv1vzhjCvVUf63/bkTru
	KMujQZ12PGVBjQFuM7QBCtvWF0+gfH8=
X-Google-Smtp-Source: ADFU+vuWaG8yFkhiquskSwcLqq7CzbBEzKkoTGKJyL1lQezKyTzmCSgzLhNqwIwH5u+Pf4xhinY7/g==
X-Received: by 2002:a1c:6605:: with SMTP id a5mr4240132wmc.32.1585153043041;
        Wed, 25 Mar 2020 09:17:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l12sm33507593wrt.73.2020.03.25.09.17.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 09:17:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] documentation.conf: Drop obsolete variable docs
Date: Wed, 25 Mar 2020 16:17:19 +0000
Message-Id: <20200325161720.498276-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fetcher *DIR variables were dropped a while back, drop the docs
that reference them (thanks Robert Day).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/documentation.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 0b21d1f63ec..44d69197bf2 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -118,7 +118,6 @@ CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class
 CORE_IMAGE_EXTRA_INSTALL[doc] = "Specifies the list of packages to be added to the image. You should only set this variable in the conf/local.conf file in the Build Directory."
 COREBASE[doc] = "Specifies the parent directory of the OpenEmbedded Core Metadata layer (i.e. meta)."
 CONF_VERSION[doc] = "Tracks the version of local.conf.  Increased each time build/conf/ changes incompatibly."
-CVSDIR[doc] = "The directory where cvs checkouts will be stored in."
 
 #D
 
@@ -178,7 +177,6 @@ FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when co
 
 #G
 
-GITDIR[doc] = "The directory where Git clones will be stored."
 GROUPADD_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the groupadd command if you wish to add a group to the system when the package is installed."
 GROUPMEMS_PARAM[doc] = "When a recipe inherits the useradd class, this variable specifies for a package what parameters should be passed to the groupmems command if you wish to modify the members of a group when the package is installed."
 GRUB_GFXSERIAL[doc] = "Configures the GNU GRand Unified Bootloader (GRUB) to have graphics and serial in the boot menu."
@@ -393,7 +391,6 @@ STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required t
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
 STAMPS_DIR[doc] = "Specifies the base directory in which the OpenEmbedded build system places stamps."
 SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
-SVNDIR[doc] = "The directory where Subversion checkouts will be stored."
 SYSLINUX_DEFAULT_CONSOLE[doc] = "Specifies the kernel boot default console."
 SYSLINUX_OPTS[doc] = "Lists additional options to add to the syslinux file."
 SYSLINUX_SERIAL[doc] = "Specifies the alternate serial port or turns it off."
-- 
2.25.1

