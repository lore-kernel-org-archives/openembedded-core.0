Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.190.1616596792601430487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=jyAM/xvg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id x26so17457233pfn.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KAsBa4YWS6XZuFej21MgXEe+rxxx/cjoMvj5rxnjRoE=;
        b=jyAM/xvgOX+OMy7Fkec9u4rBhRcf3yoQ9TevFBXCFBfPzc08sbGI5m2NeEtA7iggmv
         8IlknM/2WPleMEDVQmGcBm6S3zhOQtgOYwFJEhK0hxUnb8n++lT5gq2zZ4MiPiZOFBaC
         vfEHlE3xwzQQsXr5dKYcDgL10XnaRziKv/j3aSvKCG/xweREHr+7QO3Pi1PIkHgFulhZ
         G5LUbDIgjrHklhxW0WBDoVhX+EVXWUQ8HQELclj7KzsVvSfPMREpYN5yv12NpisdtLwg
         mRiww7CwuCvtT+GXfqVcmMUubF8DAyWNK0eYbw07jk7ORs4FYax71EtiDz2omb27zkHl
         RRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAsBa4YWS6XZuFej21MgXEe+rxxx/cjoMvj5rxnjRoE=;
        b=MDSUPnNGIHEu+dhRHmYbvKSyCMQnjKG7gTDJ+y0zJ4HUG7hMNRLA+L0htiljXCh//7
         9lGstrwM3Xo+21FRKULq8kr7Xsnfb3280WbcEcHXBqCz20cdWGQNnGHO3Zv946E1naeQ
         RcyaEfqiTN5eaWcQLoGbhiaUr13+xvcWRBe4nCQYzr+i3HCHi/WvJZ5vsNB1OkamK2fX
         xwvL0AWfR78NPCJXGM3/oTS/+TR6sKV8hzW02fbvjKN+Lm4PznOYlRcUKPabFijrD8bW
         NSmZYpNzcTy6sXcCsV9Nw+sjTP5PZu+1/onTNnMRvKZrNkxdcvdAhxg90q8XK20EtTnl
         bTJA==
X-Gm-Message-State: AOAM533jXeYQG0MURIdH1EIfjhLhszRFBlSBfAZgzEVP56PSTGtF1kXY
	n+H67BFGbqs7sqPcjzLhyqGyOq7iT1XKUkXh
X-Google-Smtp-Source: ABdhPJwpkfS5IFoiaGA07sR5CcAs0EgY4v+EIG/awV2t3oSaelHRZq6ORJ629/EBDTa0kDc4h68l/A==
X-Received: by 2002:a62:3201:0:b029:211:3dcc:c9ca with SMTP id y1-20020a6232010000b02902113dccc9camr3512871pfy.46.1616596791503;
        Wed, 24 Mar 2021 07:39:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.39.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:39:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/21] maintainers: update own email address
Date: Wed, 24 Mar 2021 04:39:02 -1000
Message-Id: <71aac912966eccdd92fbe93e4555a4939b8973d5.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denys Dmytriyenko <denis@denix.org>

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63e5f91d46d76800452ed8a0fade8dd3db1fc88e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 40 ++++++++++++------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3fb925cc2d..ef1e7fe2f4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -88,8 +88,8 @@ RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.o
 RECIPE_MAINTAINER_pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
-RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -125,7 +125,7 @@ RECIPE_MAINTAINER_pn-core-image-sato-dev = "Richard Purdie <richard.purdie@linux
 RECIPE_MAINTAINER_pn-core-image-sato-ptest-fast = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-core-image-sato-sdk-ptest = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-coreutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-cpio = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-cpio = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-cracklib = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-createrepo-c = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-cronie = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -233,7 +233,7 @@ RECIPE_MAINTAINER_pn-gobject-introspection = "Alexander Kanavin <alex.kanavin@gm
 RECIPE_MAINTAINER_pn-gperf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gpgme = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-gptfdisk = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-grub = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-grub-bootconf = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -254,9 +254,9 @@ RECIPE_MAINTAINER_pn-gstreamer1.0-rtsp-server = "Anuj Mittal <anuj.mittal@intel.
 RECIPE_MAINTAINER_pn-gstreamer1.0-vaapi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-gtk+3 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-gtk-doc = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-gzip = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-harfbuzz = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-hdparm = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-help2man-native = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-hwlatdetect = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -454,10 +454,10 @@ RECIPE_MAINTAINER_pn-ltp = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lttng-modules = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-lttng-ust = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-lz4 = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-lzo = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-lzip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-lzop = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-lz4 = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-lzo = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-lzip = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-lzop = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-m4 = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-m4-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-make = "Robert Yang <liezhi.yang@windriver.com>"
@@ -501,7 +501,7 @@ RECIPE_MAINTAINER_pn-mpeg2dec = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-mpfr = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mpg123 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-msmtp = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-musl = "Khem Raj <raj.khem@gmail.com>"
@@ -545,7 +545,7 @@ RECIPE_MAINTAINER_pn-pango = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-parted = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-patch = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-patchelf = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-pbzip2 = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-pbzip2 = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
@@ -685,7 +685,7 @@ RECIPE_MAINTAINER_pn-udev-extraconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-unfs3 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-uninative-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-unzip = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-unzip = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-update-rc.d = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-usbinit = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-usbutils = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -706,11 +706,11 @@ RECIPE_MAINTAINER_pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@denix.org>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -764,6 +764,6 @@ RECIPE_MAINTAINER_pn-xtrans = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@denix.org>"
+RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@denix.org>"
-- 
2.25.1

