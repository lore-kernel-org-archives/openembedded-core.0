Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.224.1632333240743531136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 10:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j8k/LW54;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id f130so12583578qke.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 10:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEfJVy5gPI5OFYAEhJIxQUt9CN0QQIrFTpiEuHcWy/E=;
        b=j8k/LW54J+COYbqugKT7JpYE8Vr42aRR9Xq25hGT9sHyRNCm+CROHDOvmgjqAHVACs
         layEH4PcK2n/aUHy/C0jQeAyRzKvdtAkO6vklEwRsKHwoY9iBMs/tvUvRvvqTmP57Oym
         92VFvfG+uVGMSkTK/7yJiVuPOSvKn9xAorcb0osfxXBx4BQy676OCdYpVvTvAbp1P8ql
         vf234oqDw5JZ97FggcMbmJ+xYaIh2QQ36P7jXbInL/uIDuT/YXjU+WAcZkfzFLAwJol3
         JtNNBtv6qXXvcW587XD+JQxKM3bOIl0+5FuCmcOFkFocVZMYEcsjQK6arL3R4xoTVoxG
         JkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEfJVy5gPI5OFYAEhJIxQUt9CN0QQIrFTpiEuHcWy/E=;
        b=BKQzf4yx3cEOpj3EBtTvsKRervn1U/4qcRlHCKaVqT3b7v7qBPbm/Ha2/PYFNqGoE3
         wnAf+UpjH2APOFwRLmZ8I+CWwmgFAIcps2cLrmwljCkIedQ1IMOkWuyMVH4WSwxHzord
         0rhb6A9vyA+z3hM8kJTVxyzQufWSiLBQXZ25bbEEk6OCihLc+EY2yWV6M/kZinlly7rS
         /F5WkZnZBsSW1K2PwU/GRO1P1FK9OQoeQlPTolkfXqPWM3WRqteDCzZdtejCZYrnJaFB
         1VO7bCwBkX+vixjVzrgvwGn0+ugRhx5QgR4QGt3x0vVTMAl8Zncxgz64ow1PBZZoElGC
         ahnA==
X-Gm-Message-State: AOAM531X9zu1qZ1JfZdmqQ39+D8HdAtsEjdKDyf/YvrBI3QGyYbywgXY
	YqDqu4DD5q+qeLMYJuSOEGLKLmQH41FAcA==
X-Google-Smtp-Source: ABdhPJwByhGAE5kWV9ujqKf8ch6Klv1FWSec1K8WKcdSp31lSbjCsgkA0Mdz+rx0TWUOqPqJKUQxpw==
X-Received: by 2002:a37:f906:: with SMTP id l6mr505003qkj.506.1632333239850;
        Wed, 22 Sep 2021 10:53:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n16sm1809484qta.51.2021.09.22.10.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:53:59 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] poky: set default kernel to 5.14
Date: Wed, 22 Sep 2021 13:53:53 -0400
Message-Id: <3d02da3cab9f55034bcb47c67dc572ba0cf563d4.1632332981.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632332981.git.bruce.ashfield@gmail.com>
References: <cover.1632332981.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

both -rt and -standard have been updated to 5.14, so we switch out
defaults.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 meta-poky/conf/distro/poky.conf      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index b8f5f21a31..756c65a2f9 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -43,7 +43,7 @@ FULL_OPTIMIZATION="-Os -pipe ${DEBUG_FLAGS}"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "5.13%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "5.14%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index ae0c52178a..e161e4943a 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
-PREFERRED_VERSION_linux-yocto ?= "5.13%"
-PREFERRED_VERSION_linux-yocto-rt ?= "5.13%"
+PREFERRED_VERSION_linux-yocto ?= "5.14%"
+PREFERRED_VERSION_linux-yocto-rt ?= "5.14%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
 SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
-- 
2.19.1

