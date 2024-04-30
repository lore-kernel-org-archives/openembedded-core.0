Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C96C10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:18 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.200.1714512256289099127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tlP+Edhf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso41020275ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512255; x=1715117055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wowby6aUO5ryY5yvYClreVbso9SrSER2Aw4eJmjTpI=;
        b=tlP+EdhfVwBv+gL6xAGEx37C6W8DxtH13S+wvvcGY6rwLpXi6zQtgBXg7gZyadJpjw
         Yfy1MJCCdDdveS70TBSuSOkE+AXRUhVBKiOAJHfQo4NeCfbp9X1dEY7ikuKAtpEAm9Pn
         /mL0R1+DYMNvSHmoceE4/ykHM6etAPpgGhO/9jil2SfzolJCjL5GKRgVkHPUv3NuxKfi
         nlEOM6B/ZVpTPUkyY707VOeMDUcN8FBAFVh4cFQ3p07ziYZ+zCDPOEReSGhsFIyTZSs/
         Rdbk4JDp2XrIjjzI253YxCe16jJghL+nB6YJ7V6KxDvxTeitaMzngUORA1ebRNafRXms
         jNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512255; x=1715117055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wowby6aUO5ryY5yvYClreVbso9SrSER2Aw4eJmjTpI=;
        b=vP/6LgaWF6vI9uzB5l1hBfyjjuGj9TobUir7Ga4yvJXBf4TaJhHxA3lafgNJuZfdod
         92n5ihF7iOfrWVClpkNJJviaB5nJlr3iZJ2yLJIuMf7SQH/e9GG6XZRUd8FXMDfSRyYb
         r1hJjx49/pj5omEMGQUacvwhXt2sQ/NnER0loEkqO1cWZRc91W01n3RrnfJ3AbnjuaDW
         gOgP86RTcQNA23rmpanGOH3x/JR9UHLjaw0FoC7OC8AWiSw0W8DcSXmCbDhQjFtkJ8D1
         KXcgEWS2gpI6vg6n6dFSf2TVFezbZAJ71ns1fNKRIRV9kUTCdZIi79w35YXY39azulGc
         /Hrg==
X-Gm-Message-State: AOJu0YwAgvTgflK7OjrgQWbE/RufuHV2POH4hVIXOfGtJt/fUQYB98pl
	u/0dVIKM2z5M2uSnRsYiN10+lUQ5kMe8nLTPYvoZ3K7yZeajH5MbmGBJHuBZ0znInb893Ju0Re0
	4cyg=
X-Google-Smtp-Source: AGHT+IGVF9eh4tg56fE6lHpmgHVj+Uc3wcshqf8xWWTL7TcaOMg7XzcrFuYmYnnnRDNHGIR6Z3K8mA==
X-Received: by 2002:a17:903:1108:b0:1e5:8629:44d with SMTP id n8-20020a170903110800b001e58629044dmr682586plh.1.1714512255326;
        Tue, 30 Apr 2024 14:24:15 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/17] rpm: update 4.19.1 -> 4.19.1.1
Date: Tue, 30 Apr 2024 14:23:47 -0700
Message-Id: <d05416b6d6ec197b42f20652ed53ada1eb697d67.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198766

From: Alexander Kanavin <alex.kanavin@gmail.com>

Summary of changes from RPM 4.19.1
Fixes
Packaging: Don’t warn about missing user/group on skipped files [Regression] (#2814)
Packaging: Make user/group lookup caching thread-safe [Regression] (#2843)
Lua interface: Fix regression in Lua scriptlet runaway child detection [Regression] (#2818)
Build: CMakeLists.txt: restore readline support as an explicit option [Regression] (#2852)
Build: Fix unconditional uses of Linux-specific extensions [Regression] (#2812)
Build: Add missing include for check_symbol_exists (#2831)
Build: Don’t use _nl_msg_cat_cntr if it’s not available (#2856)

Drop patches:
files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
(upstream resolved the issue)

files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
(backports)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d233e33a5ca12f95878c3ee9e34d9d9c61e49f68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...olor-setting-for-mips64_n32-binaries.patch |  3 +-
 ...ook-for-lua-with-pkg-config-rather-t.patch |  7 +--
 ...estore-readline-support-as-an-explic.patch | 42 --------------
 ...satisfiable-dependency-when-building.patch |  3 +-
 ...lib-rpm-as-the-installation-path-for.patch |  9 ++-
 ...1-Do-not-read-config-files-from-HOME.patch |  9 ++-
 ...-PATH-environment-variable-before-ru.patch |  5 +-
 ...l-dependency-on-non-POSIX-GLOB_ONLYD.patch | 56 -------------------
 ...lling-execute-package-scriptlets-wit.patch |  5 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |  3 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |  3 +-
 .../files/0001-perl-disable-auto-reqs.patch   |  3 +-
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch | 13 ++---
 ...txt-do-not-install-non-existent-docs.patch | 26 ---------
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |  2 +-
 ...ge-logging-level-around-scriptlets-t.patch |  5 +-
 .../rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb}    |  7 +--
 17 files changed, 32 insertions(+), 169 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
 rename meta/recipes-devtools/rpm/{rpm_4.19.1.bb => rpm_4.19.1.1.bb} (96%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
index 96fe57dfeb..25aa69d7da 100644
--- a/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Add-a-color-setting-for-mips64_n32-binaries.patch
@@ -1,11 +1,10 @@
-From ecc45e3ae837ab50603088dcc8fd2f8e67a7ece6 Mon Sep 17 00:00:00 2001
+From f4cf90b5a298d6a3199e8b4c07f520aaf593ce2b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 9 Mar 2017 18:54:02 +0200
 Subject: [PATCH] Add a color setting for mips64_n32 binaries
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  build/rpmfc.c | 4 ++++
  rpmrc.in      | 2 ++
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch
index 5053caae33..e4edc884b1 100644
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch
+++ b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch
@@ -1,4 +1,4 @@
-From ca4655f36c3c7883eb50381902890b23f0e8aaab Mon Sep 17 00:00:00 2001
+From c39a074ff3c4d21c100d387661c7d725b5eae7b0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 29 Nov 2023 14:06:15 +0100
 Subject: [PATCH] CMakeLists.txt: look for lua with pkg-config rather than
@@ -8,16 +8,15 @@ Otherwise cmake will try to find libm, badly, and fail.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7f0630453..d0ea565f3 100644
+index 4a383ceba..ed847c09a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -187,7 +187,7 @@ set(REQFUNCS
+@@ -190,7 +190,7 @@ set(REQFUNCS
  )
  
  find_package(PkgConfig REQUIRED)
diff --git a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch b/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
deleted file mode 100644
index db83b176b4..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3c2e529c6cc1bae4bc94cbed7358c6e0cdd2de02 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 16 Jan 2024 13:43:36 +0100
-Subject: [PATCH] CMakeLists.txt: restore readline support as an explicit
- option
-
-This was lost in autotools -> cmake transition. The particular
-reason to make it explicit is that readline is gpl version 3
-licensed, and in some builds components under that license
-need to be excluded.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2852]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0a474106e..89e27417f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -31,6 +31,7 @@ option(WITH_AUDIT "Build with audit support" ON)
- option(WITH_FSVERITY "Build with fsverity support" OFF)
- option(WITH_IMAEVM "Build with IMA support" OFF)
- option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
-+option(WITH_READLINE "Build with readline support" ON)
- 
- set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
- set(RPM_VENDOR "vendor" CACHE STRING "rpm vendor string")
-@@ -193,7 +194,11 @@ find_package(BZip2)
- find_package(Iconv)
- 
- pkg_check_modules(POPT REQUIRED IMPORTED_TARGET popt)
--pkg_check_modules(READLINE IMPORTED_TARGET readline)
-+
-+if (WITH_READLINE)
-+    pkg_check_modules(READLINE REQUIRED IMPORTED_TARGET readline)
-+endif()
-+
- pkg_check_modules(ZSTD IMPORTED_TARGET libzstd>=1.3.8)
- pkg_check_modules(LIBELF IMPORTED_TARGET libelf)
- pkg_check_modules(LIBDW IMPORTED_TARGET libdw)
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
index df5543873c..d0ed711086 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch
@@ -1,4 +1,4 @@
-From d77429bf20d138ec8ce577c0080cae1f1bc2aa6f Mon Sep 17 00:00:00 2001
+From 86e585cc0dd06dfa20f584af8b59d52a59accb45 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 9 Jan 2017 18:52:11 +0200
 Subject: [PATCH] Do not add an unsatisfiable dependency when building rpms in
@@ -9,7 +9,6 @@ hand produces rpms that way by design.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  build/pack.c | 4 ----
  1 file changed, 4 deletions(-)
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index b056d19741..b571a0ae8c 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 7948f21e08bc7552b281ed0098a9c8099d2370cb Mon Sep 17 00:00:00 2001
+From 73d6841d9ef2a8ac7bd63f9645a3efe8038dfdd4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -6,19 +6,18 @@ Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
 
 Upstream-Status: Denied [https://github.com/rpm-software-management/rpm/pull/263]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 2 +-
  macros.in      | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2767915fb..7f0630453 100644
+index 7808115c1..4a383ceba 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -32,7 +32,7 @@ option(WITH_FSVERITY "Build with fsverity support" OFF)
- option(WITH_IMAEVM "Build with IMA support" OFF)
+@@ -33,7 +33,7 @@ option(WITH_IMAEVM "Build with IMA support" OFF)
  option(WITH_FAPOLICYD "Build with fapolicyd support" ON)
+ option(WITH_READLINE "Build with readline support" ON)
  
 -set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/lib/rpm" CACHE PATH "rpm home")
 +set(RPM_CONFIGDIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/rpm" CACHE PATH "rpm home")
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
index 6a18679da2..796088df53 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-read-config-files-from-HOME.patch
@@ -1,20 +1,19 @@
-From 4f34994d9ad38d96976578a9d1a006f72e5aca50 Mon Sep 17 00:00:00 2001
+From e210458d125793915abce30420d866a30305c37a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Jan 2017 14:11:30 +0200
 Subject: [PATCH] Do not read config files from $HOME
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  lib/rpmrc.c | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index 269d490ac..f39dcfc11 100644
+index 9437a0ff1..483585ae4 100644
 --- a/lib/rpmrc.c
 +++ b/lib/rpmrc.c
-@@ -458,8 +458,7 @@ static void setDefaults(void)
+@@ -459,8 +459,7 @@ static void setDefaults(void)
      if (!defrcfiles) {
  	defrcfiles = rstrscat(NULL, confdir, "/rpmrc", ":",
  				confdir, "/" RPM_VENDOR "/rpmrc", ":",
@@ -24,7 +23,7 @@ index 269d490ac..f39dcfc11 100644
      }
  
  #ifndef MACROFILES
-@@ -471,8 +470,7 @@ static void setDefaults(void)
+@@ -472,8 +471,7 @@ static void setDefaults(void)
    				confdir, "/" RPM_VENDOR "/macros", ":",
  				SYSCONFDIR "/rpm/macros.*", ":",
  				SYSCONFDIR "/rpm/macros", ":",
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
index 318f65ed37..328fbf86ac 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-reset-the-PATH-environment-variable-before-ru.patch
@@ -1,4 +1,4 @@
-From 25beba1efc31901a3bb0b1b6f0604d6583dc0513 Mon Sep 17 00:00:00 2001
+From a8fe7a7a2e41c9f127ed26407d57076babcb89e8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Jan 2017 13:32:06 +0200
 Subject: [PATCH] Do not reset the PATH environment variable before running
@@ -8,13 +8,12 @@ We add lots of native stuff into it and scriptlets rely on that.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  lib/rpmscript.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 36e37cf77..37ada014c 100644
+index 57689bb68..7b7e26606 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
 @@ -252,7 +252,7 @@ static void doScriptExec(ARGV_const_t argv, ARGV_const_t prefixes,
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch b/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
deleted file mode 100644
index 8e73e07704..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 1b3a182f38895de5ea8dda5a77867345845fb967 Mon Sep 17 00:00:00 2001
-From: Panu Matilainen <pmatilai@redhat.com>
-Date: Mon, 18 Dec 2023 12:25:04 +0200
-Subject: [PATCH] Fix unconditional dependency on non-POSIX GLOB_ONLYDIR flag
-
-This regressed when we axed our internal glob copy in commit
-66fa46c006bae0f28d93238b8f7f1c923645eee5. Luckily GLOB_ONLYDIR is only
-an optimization so we can just skip it if not available.
-
-Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/57f3711846f44da0f37cbc5dd66e8fba80a3bee1]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- CMakeLists.txt  | 1 +
- config.h.in     | 1 +
- rpmio/rpmglob.c | 2 ++
- 3 files changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d0ea565f3..0a474106e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -351,6 +351,7 @@ if (LIBDW_FOUND)
- 	set(HAVE_LIBDW 1)
- endif()
- 
-+check_symbol_exists(GLOB_ONLYDIR "glob.h" HAVE_GLOB_ONLYDIR)
- check_symbol_exists(major "sys/sysmacros.h" MAJOR_IN_SYSMACROS)
- if (NOT MAJOR_IN_SYSMACROS)
- 	check_symbol_exists(major "sys/mkdev.h" MAJOR_IN_MKDEV)
-diff --git a/config.h.in b/config.h.in
-index cb97827d0..ab1757a9a 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -100,6 +100,7 @@
- #cmakedefine HAVE_ZSTD @HAVE_ZSTD@
- #cmakedefine HAVE___PROGNAME @HAVE___PROGNAME@
- #cmakedefine HAVE___SECURE_GETENV @HAVE___SECURE_GETENV@
-+#cmakedefine HAVE_GLOB_ONLYDIR @HAVE_GLOB_ONLYDIR@
- #cmakedefine MAJOR_IN_MKDEV @MAJOR_IN_MKDEV@
- #cmakedefine MAJOR_IN_SYSMACROS @MAJOR_IN_SYSMACROS@
- #cmakedefine RUNDIR @rundir@
-diff --git a/rpmio/rpmglob.c b/rpmio/rpmglob.c
-index 8276eddb4..243568766 100644
---- a/rpmio/rpmglob.c
-+++ b/rpmio/rpmglob.c
-@@ -84,8 +84,10 @@ int rpmGlobPath(const char * pattern, rpmglobFlags flags,
-     gflags |= GLOB_BRACE;
-     if (home != NULL && strlen(home) > 0) 
- 	gflags |= GLOB_TILDE;
-+#if HAVE_GLOB_ONLYDIR
-     if (dir_only)
- 	gflags |= GLOB_ONLYDIR;
-+#endif
-     if (flags & RPMGLOB_NOCHECK)
- 	gflags |= GLOB_NOCHECK;
- 
diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index fc89b44132..e4251a1a73 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -1,4 +1,4 @@
-From 82e6d1ad126df88c58120a31fc025691039db7f3 Mon Sep 17 00:00:00 2001
+From 34c0d3263f3e0b366a2320e0823f46673f7ba928 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 17 Jan 2017 14:07:17 +0200
 Subject: [PATCH] When cross-installing, execute package scriptlets without
@@ -24,13 +24,12 @@ Amended 2018-07-03 by Olof Johansson <olofjn@axis.com>:
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  lib/rpmscript.c | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index b18f851a3..36e37cf77 100644
+index 3f6313278..57689bb68 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
 @@ -448,8 +448,7 @@ exit:
diff --git a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
index 5820b2e7e5..2f6397aa8a 100644
--- a/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
+++ b/meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
@@ -1,4 +1,4 @@
-From ebe65b0e8622c37463697dcec779a42290c33810 Mon Sep 17 00:00:00 2001
+From ae4fdd8e8d052835973e6ff4b7550f93bde30a98 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 31 Aug 2021 10:37:05 +0200
 Subject: [PATCH] build/pack.c: do not insert payloadflags into .rpm metadata
@@ -9,7 +9,6 @@ host to the next and breaks reproducibility for .rpm).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  build/pack.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
index 8b9f1f7294..98e52da3a8 100644
--- a/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
+++ b/meta/recipes-devtools/rpm/files/0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch
@@ -1,4 +1,4 @@
-From bfceae7386b5fec108f98ad59ad96e57aecb08d3 Mon Sep 17 00:00:00 2001
+From b04ecb793a3c859985eead5e261785b27a4c4a20 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 7 May 2020 17:40:58 +0800
 Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
@@ -27,7 +27,6 @@ Fixed by performing a 'last-in-wins' resolution when "neither is preferred".
 Upstream-Status: Submitted <https://github.com/rpm-software-management/rpm/issues/193>
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  lib/transaction.c | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
index 388694d234..55108e7f1c 100644
--- a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
+++ b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
@@ -1,4 +1,4 @@
-From 7894b508a61bb87f05f7eb0a1e912a2422f4fcd2 Mon Sep 17 00:00:00 2001
+From 58bf006646a063837c46b695f7e7ebb69bee7238 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Tue, 15 Aug 2017 16:41:57 -0500
 Subject: [PATCH] perl: disable auto requires
@@ -12,7 +12,6 @@ generation.  This matches the behavior from the previous RPM5 implementation.
 Upstream-Status: Inappropriate [OE specific configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
 ---
  fileattrs/perl.attr    | 2 +-
  fileattrs/perllib.attr | 2 +-
diff --git a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
index 89c23f8197..c5caa7dc5e 100644
--- a/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-Add-support-for-prefixing-etc-from-RPM_ETCCONFIGDIR-.patch
@@ -1,4 +1,4 @@
-From e53c0e2586bc6f4677db3c6898a6428283a6b785 Mon Sep 17 00:00:00 2001
+From d7143dc4e75c8bcc5cc4c852a4b972942b7e4d07 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Jan 2017 13:33:05 +0200
 Subject: [PATCH] Add support for prefixing /etc from RPM_ETCCONFIGDIR
@@ -9,16 +9,15 @@ from target rootfs instead of its own native sysroot.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  lib/rpmrc.c | 19 ++++++++++++++-----
  1 file changed, 14 insertions(+), 5 deletions(-)
 
 diff --git a/lib/rpmrc.c b/lib/rpmrc.c
-index f39dcfc11..f27f88753 100644
+index 483585ae4..ea858c290 100644
 --- a/lib/rpmrc.c
 +++ b/lib/rpmrc.c
-@@ -455,10 +455,14 @@ const char * lookupInDefaultTable(const char * name,
+@@ -456,10 +456,14 @@ const char * lookupInDefaultTable(const char * name,
  static void setDefaults(void)
  {
      const char *confdir = rpmConfigDir();
@@ -34,7 +33,7 @@ index f39dcfc11..f27f88753 100644
      }
  
  #ifndef MACROFILES
-@@ -468,9 +472,9 @@ static void setDefaults(void)
+@@ -469,9 +473,9 @@ static void setDefaults(void)
  				confdir, "/platform/%{_target}/macros", ":",
  				confdir, "/fileattrs/*.attr", ":",
    				confdir, "/" RPM_VENDOR "/macros", ":",
@@ -47,7 +46,7 @@ index f39dcfc11..f27f88753 100644
      }
  #else
      macrofiles = MACROFILES;
-@@ -1114,7 +1118,11 @@ static void read_auxv(void)
+@@ -1115,7 +1119,11 @@ static void read_auxv(void)
   */
  static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  {
@@ -60,7 +59,7 @@ index f39dcfc11..f27f88753 100644
      static struct utsname un;
      char * chptr;
      canonEntry canon;
-@@ -1434,6 +1442,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
+@@ -1435,6 +1443,7 @@ static void defaultMachine(rpmrcCtx ctx, const char ** arch, const char ** os)
  
      if (arch) *arch = un.machine;
      if (os) *os = un.sysname;
diff --git a/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch b/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
deleted file mode 100644
index e7f0adc70c..0000000000
--- a/meta/recipes-devtools/rpm/files/0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4e388caabf0906f09d697b8d08623a022f7270b2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Wed, 29 Nov 2023 14:09:06 +0100
-Subject: [PATCH] docs/CMakeLists.txt: do not install non-existent docs/html
-
-Building html would require doxygen-native.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- docs/CMakeLists.txt | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/docs/CMakeLists.txt b/docs/CMakeLists.txt
-index 52dce7b4e..c01ff7757 100644
---- a/docs/CMakeLists.txt
-+++ b/docs/CMakeLists.txt
-@@ -18,7 +18,6 @@ if (DOXYGEN_FOUND)
- elseif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/html/index.html)
- 	set(doxsrc ${CMAKE_CURRENT_SOURCE_DIR})
- endif()
--install(DIRECTORY ${doxsrc}/html/ DESTINATION ${CMAKE_INSTALL_DOCDIR}/API)
- 
- install(FILES
- 	README.md
diff --git a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
index 3d4b09bedb..23dce30086 100644
--- a/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
+++ b/meta/recipes-devtools/rpm/files/0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch
@@ -1,4 +1,4 @@
-From f78e05544fb5ae9ef688963f19666f1af34c3d5c Mon Sep 17 00:00:00 2001
+From 29c2a0c18b0c773128bf62c611b4c53fe4471105 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 16 Jan 2024 09:59:26 +0100
 Subject: [PATCH] rpmio/rpmglob.c: avoid using GLOB_BRACE if undefined by C
diff --git a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
index b3d57cc870..732202c46f 100644
--- a/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
+++ b/meta/recipes-devtools/rpm/files/0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch
@@ -1,4 +1,4 @@
-From 0005ab544230020e854e9709b2bc0501702c2968 Mon Sep 17 00:00:00 2001
+From f01d9c24bb86bc47ad2453483518dbb25953cac7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Jan 2019 18:14:18 +0100
 Subject: [PATCH] rpmscript.c: change logging level around scriptlets to INFO
@@ -9,13 +9,12 @@ irrelevant noise to rootfs logs.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  lib/rpmscript.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 37ada014c..bab0c97a6 100644
+index 7b7e26606..1dcd23be5 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
 @@ -291,7 +291,7 @@ static char * writeScript(const char *cmd, const char *script)
diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
similarity index 96%
rename from meta/recipes-devtools/rpm/rpm_4.19.1.bb
rename to meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
index a495f7ced2..0802f26295 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb
@@ -37,14 +37,11 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.19.x;protoc
            file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-CMakeLists.txt-look-for-lua-with-pkg-config-rather-t.patch \
-           file://0002-docs-CMakeLists.txt-do-not-install-non-existent-docs.patch \
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
-           file://0001-Fix-unconditional-dependency-on-non-POSIX-GLOB_ONLYD.patch \
-           file://0001-CMakeLists.txt-restore-readline-support-as-an-explic.patch \
            "
 
 PE = "1"
-SRCREV = "98b301ebb44fb5cabb56fc24bc3aaa437c47c038"
+SRCREV = "13b4521341781293c41ac898aa9c2d2f6bc1f21d"
 
 S = "${WORKDIR}/git"
 
@@ -135,6 +132,8 @@ do_install:append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
             -e 's:${STAGING_DIR_NATIVE}/::g' \
 	    ${D}/${libdir}/rpm/macros
+	sed -i -e 's:${RECIPE_SYSROOT}/::g' \
+	    ${D}/${libdir}/cmake/rpm/rpm-targets.cmake
 
 }
 
-- 
2.34.1


