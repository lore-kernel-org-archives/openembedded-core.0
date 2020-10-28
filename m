Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.3897.1603919169623725841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FGBCJQ2O;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bn26so885626ejb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Id49FgOFRKNW4Cua/DfrjL+x/BQnwukHECzlnnehOZs=;
        b=FGBCJQ2OA9yoT0zY/1w/tV3yP0nV+ukHGbDxb1BXvrgVToed/E5/fSwDfUlWi1QDdA
         A5X4sVvXwLHxNRmdUoN89WfFE94bMibFDK/tvPxUfTYWnNdh+fvBheMmI1+tChsJXiYO
         xrVzO1ZGpxxXNgo88lU/at7rjQ8mFSYNV1heFZkI7ySRCkd4bpUWxwgSGe7CeGxsKIkA
         HHYZ+EnS3k01hvbcE5RfbbTVMNsOICU7b6IHr3pbkb+abMpoA388iSBQmV2CobYxsFV3
         7wY2h8DnTfq2FjkKWJTrzwBUlqLNL3LKXpsf/kCqLzovDPCswo1Yo6lcS5UJarxl9xJ/
         ETNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Id49FgOFRKNW4Cua/DfrjL+x/BQnwukHECzlnnehOZs=;
        b=tmvG6vAnRORLibfe9ZVD33SR5WLyJxiRX8RvHohSt0G+Q/mwCVr/JKRwTS0Z85xW2g
         upB5uUPl8H23RwT5VeG/SWRk24i8m1GOuIrzbEdk4yd24M8yVdF4sV1LTyVkq9myiEcb
         tBnbsRfcH8vomF0clhzErbJLeOtcz81GIrUm/Ijtm7x06wURQHH4Axlc4X8St5LfEgmI
         /pjK3Jy+Xv2dfGqsl2ZUAioFKi/S6+smO+rRPOrOQELZH0lqy/cy2G9qcMQgZ2SQge+V
         oW6oOdxrnQ3wnU8MkWxZIRcntkZ8RWvq80TBITjBBcW7CRWZWblSXstAP0AshmSMED2x
         DTXA==
X-Gm-Message-State: AOAM530g5Csvov+tdeDG+uVJ4Bh+M8AB1VAXft+B36Gbwqa37c39wxi+
	W6o2/yBUaLKJrITP5Xao8afjbrBx9Ftvqw==
X-Google-Smtp-Source: ABdhPJzXOXTXo9g5dh0YiYPVBkpyTkc/x9MNrWz2E6SL6g6JGKfns/IIVYf06t9LO2i2bz90Orb/MQ==
X-Received: by 2002:a17:906:a119:: with SMTP id t25mr1033269ejy.67.1603919167831;
        Wed, 28 Oct 2020 14:06:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/33] glib-2.0: upgrade 2.64.5 -> 2.66.1
Date: Wed, 28 Oct 2020 22:05:27 +0100
Message-Id: <20201028210558.21070-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-correctly-when-building-with-mingw3.patch | 20 +++++++++----------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 ...{glib-2.0_2.64.5.bb => glib-2.0_2.66.1.bb} |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.64.5.bb => glib-2.0_2.66.1.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index d075cd3f23..d6765b163b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From d3334e83ae0da9ca184eb9c8daf0854544ece023 Mon Sep 17 00:00:00 2001
+From 333809ded70ad4e3470b7134e3fac1a42ff48e61 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 9 insertions(+), 6 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index dab65d2..e8bb2ee 100644
+index 3a19c82..b762835 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
 @@ -12,7 +12,7 @@ test_c_args = [
@@ -26,7 +26,7 @@ index dab65d2..e8bb2ee 100644
    common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
  endif
  
-@@ -132,7 +132,7 @@ else
+@@ -133,7 +133,7 @@ else
  endif
  
  #  Test programs buildable on UNIX only
@@ -35,7 +35,7 @@ index dab65d2..e8bb2ee 100644
    gio_tests += {
      'file' : {},
      'gdbus-peer' : {
-@@ -384,7 +384,7 @@ if host_machine.system() != 'windows'
+@@ -385,7 +385,7 @@ if host_machine.system() != 'windows'
  endif # unix
  
  #  Test programs buildable on Windows only
@@ -44,7 +44,7 @@ index dab65d2..e8bb2ee 100644
    gio_tests += {'win32-streams' : {}}
  endif
  
-@@ -454,7 +454,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
+@@ -455,7 +455,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
    }
  endif
  
@@ -54,10 +54,10 @@ index dab65d2..e8bb2ee 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index 3dedafc..94605e6 100644
+index 6eb23e8..36eb919 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -134,7 +134,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -137,7 +137,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
  
@@ -67,7 +67,7 @@ index 3dedafc..94605e6 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index e1b4b79..afb6eaa 100644
+index 47f3a5c..7ea7ad1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -32,6 +32,9 @@ else
@@ -78,8 +78,8 @@ index e1b4b79..afb6eaa 100644
 +  host_system = 'windows'
 +endif
  
- glib_version = meson.project_version()
- glib_api_version = '2.0'
+ if host_system == 'darwin'
+   ios_test_code = '''#include <TargetConditionals.h>
 diff --git a/tests/meson.build b/tests/meson.build
 index 6741f8f..12fdc90 100644
 --- a/tests/meson.build
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index fe87482ae2..07e37acf7d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 2a715765c6ceb2e8b4cc42e060aee75016111d1a Mon Sep 17 00:00:00 2001
+From 75c0423e1dc34fa20de70bc9932625fd0de4a912 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
index a30c5215be..52c7e42fbd 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
@@ -21,7 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "9cbd5bd2715ead1c28d53c46f7b7b6ff6166f5887b772c1a9e3bf2910cfecc11"
+SRC_URI[sha256sum] = "a269ffe69fbcc3a21ff1acb1b6146b2a5723499d6e2de33ae16ccb6d2438ef60"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.29.0

