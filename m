Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.25488.1588523193360036188
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EygWkZXl;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k1so18009143wrx.4
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwbd/dsu7pPJqK1EBfxbz3d05IRoEKH+EU8PK+LS6js=;
        b=EygWkZXlrKMu7wibdrfvHYoEXmavJgPj+xCVKvR1fexF53sekL0PlrPgJ5N08zgEkN
         +FIE1B7F/N1/7GXJ0zWER8e1BpieFM7vkZJrvF9ydlupMtGCsIHElFU9F8fbXoVtxN3r
         JV8OI/8j9MO1m1ZUgyMdzVmVHZpKB7B6f8TJ7Azd1nW/bEWTcyil/bYSq2HrIDQ6VWhe
         LLRiHZ6VVnTlJD0OTsPzgB2+A/odjVtnvTv+d6caogoC5UMHELSUVcFRoBfEuXimdx4e
         qMONicvl011aDGTP1GD57dZuJ6Wz4mt9Mdm/IXJa6SDUyhwRu+Q7izFN+qX3WZXbYl1o
         L4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwbd/dsu7pPJqK1EBfxbz3d05IRoEKH+EU8PK+LS6js=;
        b=SADEnHVimYladugPNhgY76LoWP8W/owlT7ptC6hC4mqEHP8M0HgfeSaOnkfafs3Cd0
         bnUQlLvv9Kv/xEMv6A6d21c1fj7ejfuFn9L+beEZGWw3XOrO1uOqb2z1Siku6NoCWIe4
         X1mzORlQX307kJg73NpwxtIH5NkX9bzVpVm9b0BpojyUBmSmkSjTaCqutgqFHtlj1K0J
         c75h8oIWNoWXON77Ck4vTdyWIYHqisQS+17+fiPoe1BAjyYaV7onTtWfvhACzKmnL+57
         zJedQmifT6WSz6xGk5U+2fcqbFrGP6ls1ClHfzbI7ZjI9kEICoi8lsyZFO1+qRLKRQeJ
         e8WQ==
X-Gm-Message-State: AGi0PuakzC30wY22SRMGN9u4J65CRSOhaaZt5zdr9jJ6Q466NscERwPL
	n7lU0YVyW82lOv5msKrWUl+GlABJ
X-Google-Smtp-Source: APiQypJTpebGGvgN24nvLOF2cpFwZEBuZnlLwXF4oUUkR0uwijLqlWQIUwaiqabpYSX2jRUtaW8bcw==
X-Received: by 2002:a5d:6851:: with SMTP id o17mr14222282wrw.267.1588523191274;
        Sun, 03 May 2020 09:26:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/17] glib-2.0: update 2.62.4 -> 2.64.2
Date: Sun,  3 May 2020 18:25:45 +0200
Message-Id: <20200503162559.946-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a couple of missing ptest dependencies.

Drop backports.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Do-not-ignore-return-value-of-write.patch |   6 +-
 ...t-write-bindir-into-pkg-config-files.patch |  10 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |   7 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |   6 +-
 ...ng-about-deprecated-paths-in-schemas.patch |  11 +-
 ...-correctly-when-building-with-mingw3.patch |  22 ++--
 ...ces.c-comment-out-a-build-host-only-.patch |   3 +-
 ...on-Run-atomics-test-on-clang-as-well.patch |  10 +-
 ...dcode-python-path-into-various-tools.patch |  14 +--
 ...-GSource-iterator-if-iteration-can-m.patch |  43 -------
 ...-memory-leaks-and-memory-corruption-.patch | 109 ------------------
 ...e-mutex-unlocking-in-destructor-righ.patch |  36 ------
 ...ble-more-tests-while-cross-compiling.patch |  32 ++---
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  10 +-
 ...{glib-2.0_2.62.4.bb => glib-2.0_2.64.2.bb} |   7 +-
 meta/recipes-core/glib-2.0/glib.inc           |   6 +-
 16 files changed, 68 insertions(+), 264 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.62.4.bb => glib-2.0_2.64.2.bb} (83%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
index 0ebf138d60..f3a0069633 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
@@ -1,4 +1,4 @@
-From d250652782b65b071b7cc8f01f2db833df104e0e Mon Sep 17 00:00:00 2001
+From 658c034d92027dc8af5f784cae852123fac79b19 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 16 Apr 2016 13:28:59 -0700
 Subject: [PATCH] Do not ignore return value of write()
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/glib/tests/unix.c b/glib/tests/unix.c
-index 9d55a6c..a07f945 100644
+index 7639d06..f941141 100644
 --- a/glib/tests/unix.c
 +++ b/glib/tests/unix.c
-@@ -32,14 +32,15 @@ test_pipe (void)
+@@ -33,14 +33,15 @@ test_pipe (void)
    GError *error = NULL;
    int pipefd[2];
    char buf[1024];
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index edac4c9f75..5fe3aa898e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 60b36289ac314ad972cf81c1acd19f6f2e58ff25 Mon Sep 17 00:00:00 2001
+From 0797a40627a4cb5439a24b872edc65356dceaaf0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
@@ -16,13 +16,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 71e88c4..8ce3987 100644
+index 532b086..98468a3 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -831,14 +831,14 @@ pkg.generate(libgio,
+@@ -820,14 +820,14 @@ pkg.generate(libgio,
                 'schemasdir=' + join_paths('${datadir}', schemas_subdir),
                 'bindir=' + join_paths('${prefix}', get_option('bindir')),
-                'giomoduledir=' + giomodulesdir,
+                'giomoduledir=' + pkgconfig_giomodulesdir,
 -               'gio=' + join_paths('${bindir}', 'gio'),
 -               'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
 -               'glib_compile_schemas=' + join_paths('${bindir}', 'glib-compile-schemas'),
@@ -43,7 +43,7 @@ index 71e88c4..8ce3987 100644
    install_dir : glib_pkgconfigreldir,
    filebase : 'gio-2.0',
 diff --git a/glib/meson.build b/glib/meson.build
-index 91a48f1..978fb73 100644
+index aaf5f00..1e0992b 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
 @@ -375,9 +375,9 @@ pkg.generate(libglib,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index d8cf269bb8..16f2d31496 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 15f807481de53942525b48952c5b6bbb9fb66542 Mon Sep 17 00:00:00 2001
+From c94e669de98a3892c699bd8d0d2b5164b2de747e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
@@ -9,7 +9,7 @@ based systems therefore lets set DATADIRNAME to "share".
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-%% original patch: uclibc_musl_translation.patch
+
 ---
  m4macros/glib-gettext.m4 | 4 ++++
  1 file changed, 4 insertions(+)
@@ -29,6 +29,3 @@ index df6fbf0..47db864 100644
  	    *)
  	    CATOBJEXT=.mo
              DATADIRNAME=lib
--- 
-2.17.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index a3d71f2b7a..597864d9ac 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From d29dfba67b1808eea6d428085f95b6e42cf2d1e4 Mon Sep 17 00:00:00 2001
+From 0015db45cd1bfefc04959dffab5dabeead93136f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 4e5e021..90a741a 100644
+index 2ef60ed..532b086 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -940,6 +940,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -936,6 +936,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 67ca6240bc..6fd93526ce 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,7 +1,7 @@
-From 2acf40361eecd17c6981743dabd06e25a9934258 Mon Sep 17 00:00:00 2001
+From 4f47b8a8d650d185aa61aec2f56a283522a723c4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
-Subject: [PATCH 05/10] Remove the warning about deprecated paths in schemas
+Subject: [PATCH] Remove the warning about deprecated paths in schemas
 
 Some schemas in gsettings-desktop-schemas (such as proxy and locale)
 are still using deprecated paths, as of 3.16.1. This causes warning
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
-index b8de090..130f89b 100644
+index 7888120..7acbd5b 100644
 --- a/gio/glib-compile-schemas.c
 +++ b/gio/glib-compile-schemas.c
-@@ -1219,19 +1219,6 @@ parse_state_start_schema (ParseState  *state,
+@@ -1232,19 +1232,6 @@ parse_state_start_schema (ParseState  *state,
        return;
      }
  
@@ -38,6 +38,3 @@ index b8de090..130f89b 100644
    state->schema_state = schema_state_new (path, gettext_domain,
                                            extends, extends_name, list_of);
  
--- 
-2.14.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index b02169e09b..d075cd3f23 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From cfff734af6bff6a30a649f784ecf698658c01884 Mon Sep 17 00:00:00 2001
+From d3334e83ae0da9ca184eb9c8daf0854544ece023 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  4 files changed, 9 insertions(+), 6 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 95aafc1..9025eb2 100644
+index dab65d2..e8bb2ee 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -13,7 +13,7 @@ test_c_args = [
+@@ -12,7 +12,7 @@ test_c_args = [
    '-UG_DISABLE_ASSERT',
  ]
  
@@ -26,7 +26,7 @@ index 95aafc1..9025eb2 100644
    common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
  endif
  
-@@ -120,7 +120,7 @@ if dbus1_dep.found()
+@@ -132,7 +132,7 @@ else
  endif
  
  #  Test programs buildable on UNIX only
@@ -35,7 +35,7 @@ index 95aafc1..9025eb2 100644
    gio_tests += {
      'file' : {},
      'gdbus-peer' : {
-@@ -332,7 +332,7 @@ if host_machine.system() != 'windows'
+@@ -384,7 +384,7 @@ if host_machine.system() != 'windows'
  endif # unix
  
  #  Test programs buildable on Windows only
@@ -44,7 +44,7 @@ index 95aafc1..9025eb2 100644
    gio_tests += {'win32-streams' : {}}
  endif
  
-@@ -397,7 +397,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
+@@ -454,7 +454,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
    }
  endif
  
@@ -54,10 +54,10 @@ index 95aafc1..9025eb2 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index c47133f..cad975f 100644
+index 3dedafc..94605e6 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -132,7 +132,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -134,7 +134,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
  
@@ -67,7 +67,7 @@ index c47133f..cad975f 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index 717d1bc..2a3beb8 100644
+index e1b4b79..afb6eaa 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -32,6 +32,9 @@ else
@@ -81,10 +81,10 @@ index 717d1bc..2a3beb8 100644
  glib_version = meson.project_version()
  glib_api_version = '2.0'
 diff --git a/tests/meson.build b/tests/meson.build
-index ce30442..5710f2c 100644
+index 6741f8f..12fdc90 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
-@@ -66,7 +66,7 @@ test_extra_programs = {
+@@ -73,7 +73,7 @@ test_extra_programs = {
    'unicode-collate' : {},
  }
  
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 3dfef176fd..d33fdd4d8b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 730803f2bc3f2f1a74f4db809a224066e7eae114 Mon Sep 17 00:00:00 2001
+From 92de6c7eb30b961b24a2dce812d5276487b7d23d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
@@ -8,6 +8,7 @@ not cross-compatible (hardcodes ld and objcopy).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  gio/tests/resources.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 833ad2540e..44482dd2b7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From cce617bec254e327ed7bcad60f58208024c6dc42 Mon Sep 17 00:00:00 2001
+From 4b97f457b7b44117e27d2a218c4b68e7fe3fe4ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -9,15 +9,16 @@ Fixes
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 9731de4..c678931 100644
+index afb6eaa..6aa70f5 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1634,7 +1634,7 @@ atomicdefine = '''
+@@ -1692,7 +1692,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
@@ -26,6 +27,3 @@ index 9731de4..c678931 100644
      # Old gcc release may provide
      # __sync_bool_compare_and_swap but doesn't define
      # __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
--- 
-2.23.0
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 872340df96..1c645f3a9a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,10 +1,11 @@
-From b9160d951b9af647b97766c57295ca4f45cf9521 Mon Sep 17 00:00:00 2001
+From 79ce7e545dd3a93f77d2146d50b6fa061fbceed9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
-Subject: [PATCH 10/10] Do not hardcode python path into various tools
+Subject: [PATCH] Do not hardcode python path into various tools
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  gio/gdbus-2.0/codegen/gdbus-codegen.in | 2 +-
  gobject/glib-genmarshal.in             | 2 +-
@@ -12,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/gio/gdbus-2.0/codegen/gdbus-codegen.in b/gio/gdbus-2.0/codegen/gdbus-codegen.in
-index 8050981..e693ef3 100755
+index 67d3675..4e92a7a 100755
 --- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
 +++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
 @@ -1,4 +1,4 @@
@@ -22,7 +23,7 @@ index 8050981..e693ef3 100755
  # GDBus - GLib D-Bus Library
  #
 diff --git a/gobject/glib-genmarshal.in b/gobject/glib-genmarshal.in
-index 09e8408..b2f9d99 100755
+index 7380f24..c8abeaa 100755
 --- a/gobject/glib-genmarshal.in
 +++ b/gobject/glib-genmarshal.in
 @@ -1,4 +1,4 @@
@@ -32,7 +33,7 @@ index 09e8408..b2f9d99 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index d4bfd11..051fce4 100755
+index 91ad779..3ebef62 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
@@ -41,6 +42,3 @@ index d4bfd11..051fce4 100755
  
  # If the code below looks horrible and unpythonic, do not panic.
  #
--- 
-2.14.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch b/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
deleted file mode 100644
index 37b77d567c..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ef2be42998e3fc10299055a5a01f7c791538174c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Mon, 3 Feb 2020 15:38:28 +0200
-Subject: [PATCH] GMainContext - Fix GSource iterator if iteration can modify
- the list
-
-We first have to ref the next source and then unref the previous one.
-This might be the last reference to the previous source, and freeing the
-previous source might unref and free the next one which would then leave
-use with a dangling pointer here.
-
-Fixes https://gitlab.gnome.org/GNOME/glib/issues/2031
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/b06c48de7554607ff3fb58d6c0510cfa5088e909]
-
----
- glib/gmain.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/glib/gmain.c b/glib/gmain.c
-index af979c8..a9a287d 100644
---- a/glib/gmain.c
-+++ b/glib/gmain.c
-@@ -969,13 +969,17 @@ g_source_iter_next (GSourceIter *iter, GSource **source)
-    * GSourceList to be removed from source_lists (if iter->source is
-    * the only source in its list, and it is destroyed), so we have to
-    * keep it reffed until after we advance iter->current_list, above.
-+   *
-+   * Also we first have to ref the next source before unreffing the
-+   * previous one as unreffing the previous source can potentially
-+   * free the next one.
-    */
-+  if (next_source && iter->may_modify)
-+    g_source_ref (next_source);
-
-   if (iter->source && iter->may_modify)
-     g_source_unref_internal (iter->source, iter->context, TRUE);
-   iter->source = next_source;
--  if (iter->source && iter->may_modify)
--    g_source_ref (iter->source);
-
-   *source = iter->source;
-   return *source != NULL;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch b/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
deleted file mode 100644
index cf97d9d3db..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 611430a32a46d0dc806a829161e2dccf9c0196a8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Mon, 3 Feb 2020 15:35:51 +0200
-Subject: [PATCH] GMainContext - Fix memory leaks and memory corruption when
- freeing sources while freeing a context
-
-Instead of destroying sources directly while freeing the context, and
-potentially freeing them if this was the last reference to them, collect
-new references of all sources in a separate list before and at the same
-time invalidate their context so that they can't access it anymore. Only
-once all sources have their context invalidated, destroy them while
-still keeping a reference to them. Once all sources are destroyed we get
-rid of the additional references and free them if nothing else keeps a
-reference to them anymore.
-
-This fixes a regression introduced by 26056558be in 2012.
-
-The previous code that invalidated the context of each source and then
-destroyed it before going to the next source without keeping an
-additional reference caused memory leaks or memory corruption depending
-on the order of the sources in the sources lists.
-
-If a source was destroyed it might happen that this was the last
-reference to this source, and it would then be freed. This would cause
-the finalize function to be called, which might destroy and unref
-another source and potentially free it. This other source would then
-either
-- go through the normal free logic and change the intern linked list
-  between the sources, while other sources that are unreffed as part of
-  the main context freeing would not. As such the list would be in an
-  inconsistent state and we might dereference freed memory.
-- go through the normal destroy and free logic but because the context
-  pointer was already invalidated it would simply mark the source as
-  destroyed without actually removing it from the context. This would
-  then cause a memory leak because the reference owned by the context is
-  not freed.
-
-Fixes https://github.com/gtk-rs/glib/issues/583 while still keeping
-https://bugzilla.gnome.org/show_bug.cgi?id=661767 fixes.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/aa20167d419c649f34fed06a9463890b41b1eba0]
-
----
- glib/gmain.c | 35 ++++++++++++++++++++++++++++++++++-
- 1 file changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/glib/gmain.c b/glib/gmain.c
-index a9a287d..10ba2f8 100644
---- a/glib/gmain.c
-+++ b/glib/gmain.c
-@@ -538,6 +538,7 @@ g_main_context_unref (GMainContext *context)
-   GSourceIter iter;
-   GSource *source;
-   GList *sl_iter;
-+  GSList *s_iter, *remaining_sources = NULL;
-   GSourceList *list;
-   guint i;
-
-@@ -557,10 +558,30 @@ g_main_context_unref (GMainContext *context)
-
-   /* g_source_iter_next() assumes the context is locked. */
-   LOCK_CONTEXT (context);
--  g_source_iter_init (&iter, context, TRUE);
-+
-+  /* First collect all remaining sources from the sources lists and store a
-+   * new reference in a separate list. Also set the context of the sources
-+   * to NULL so that they can't access a partially destroyed context anymore.
-+   *
-+   * We have to do this first so that we have a strong reference to all
-+   * sources and destroying them below does not also free them, and so that
-+   * none of the sources can access the context from their finalize/dispose
-+   * functions. */
-+  g_source_iter_init (&iter, context, FALSE);
-   while (g_source_iter_next (&iter, &source))
-     {
-       source->context = NULL;
-+      remaining_sources = g_slist_prepend (remaining_sources, g_source_ref (source));
-+    }
-+  g_source_iter_clear (&iter);
-+
-+  /* Next destroy all sources. As we still hold a reference to all of them,
-+   * this won't cause any of them to be freed yet and especially prevents any
-+   * source that unrefs another source from its finalize function to be freed.
-+   */
-+  for (s_iter = remaining_sources; s_iter; s_iter = s_iter->next)
-+    {
-+      source = s_iter->data;
-       g_source_destroy_internal (source, context, TRUE);
-     }
-   UNLOCK_CONTEXT (context);
-@@ -585,6 +606,18 @@ g_main_context_unref (GMainContext *context)
-   g_cond_clear (&context->cond);
-
-   g_free (context);
-+
-+  /* And now finally get rid of our references to the sources. This will cause
-+   * them to be freed unless something else still has a reference to them. Due
-+   * to setting the context pointers in the sources to NULL above, this won't
-+   * ever access the context or the internal linked list inside the GSource.
-+   * We already removed the sources completely from the context above. */
-+  for (s_iter = remaining_sources; s_iter; s_iter = s_iter->next)
-+    {
-+      source = s_iter->data;
-+      g_source_unref_internal (source, NULL, FALSE);
-+    }
-+  g_slist_free (remaining_sources);
- }
-
- /* Helper function used by mainloop/overflow test.
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch b/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
deleted file mode 100644
index 4c9e9f5182..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3e9d85f1b75e2b1096d9643563d7d17380752fc7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
-Date: Tue, 11 Feb 2020 09:34:38 +0200
-Subject: [PATCH] GMainContext - Move mutex unlocking in destructor right
- before freeing the mutex
-
-This does not have any behaviour changes but is cleaner. The mutex is
-only unlocked now after all operations on the context are done and right
-before freeing the mutex and the context itself.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/730a75fc8e8271c38fbd5363d1f77a00876b9ddc]
-
----
- glib/gmain.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/glib/gmain.c b/glib/gmain.c
-index 10ba2f8..b1df470 100644
---- a/glib/gmain.c
-+++ b/glib/gmain.c
-@@ -584,7 +584,6 @@ g_main_context_unref (GMainContext *context)
-       source = s_iter->data;
-       g_source_destroy_internal (source, context, TRUE);
-     }
--  UNLOCK_CONTEXT (context);
-
-   for (sl_iter = context->source_lists; sl_iter; sl_iter = sl_iter->next)
-     {
-@@ -595,6 +594,7 @@ g_main_context_unref (GMainContext *context)
-
-   g_hash_table_destroy (context->sources);
-
-+  UNLOCK_CONTEXT (context);
-   g_mutex_clear (&context->mutex);
-
-   g_ptr_array_free (context->pending_dispatches, TRUE);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index 48899ce852..41ecfa1df8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 0061d66057dfd7e7267772df60b36474fb180eed Mon Sep 17 00:00:00 2001
+From 7cde170afe6854d674b50e32b4c1d3b511be9abe Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
 Subject: [PATCH] Enable more tests while cross-compiling
@@ -15,10 +15,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 382dfcc..c171717 100644
+index 788cf97..dab65d2 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -191,7 +191,7 @@ if host_machine.system() != 'windows'
+@@ -203,7 +203,7 @@ if host_machine.system() != 'windows'
  
    #  Test programs that need to bring up a session bus (requires dbus-daemon)
    have_dbus_daemon = find_program('dbus-daemon', required : false).found()
@@ -27,8 +27,8 @@ index 382dfcc..c171717 100644
      annotate_args = [
        '--annotate', 'org.project.Bar', 'Key1', 'Value1',
        '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
-@@ -465,12 +465,12 @@ if installed_tests_enabled
-   install_data('static-link.py', install_dir : installed_tests_execdir)
+@@ -548,12 +548,12 @@ if installed_tests_enabled
+   endforeach
  endif
  
 -if not meson.is_cross_build() or meson.has_exe_wrapper()
@@ -42,7 +42,7 @@ index 382dfcc..c171717 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate-source',
-@@ -494,7 +494,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -577,7 +577,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_gresource = custom_target('test.gresource',
      input : 'test.gresource.xml',
      output : 'test.gresource',
@@ -51,7 +51,7 @@ index 382dfcc..c171717 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -505,7 +505,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -588,7 +588,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_c = custom_target('test_resources2.c',
      input : 'test3.gresource.xml',
      output : 'test_resources2.c',
@@ -60,7 +60,7 @@ index 382dfcc..c171717 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -516,7 +516,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -599,7 +599,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    test_resources2_h = custom_target('test_resources2.h',
      input : 'test3.gresource.xml',
      output : 'test_resources2.h',
@@ -69,7 +69,7 @@ index 382dfcc..c171717 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -528,7 +528,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -611,7 +611,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      input : 'test2.gresource.xml',
      depends : big_test_resource,
      output : 'test_resources.c',
@@ -78,7 +78,7 @@ index 382dfcc..c171717 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -539,7 +539,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -622,7 +622,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_c = custom_target('digit_test_resources.c',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.c',
@@ -87,7 +87,7 @@ index 382dfcc..c171717 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--sourcedir=' + meson.current_build_dir(),
-@@ -550,7 +550,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -633,7 +633,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
    digit_test_resources_h = custom_target('digit_test_resources.h',
      input : '111_digit_test.gresource.xml',
      output : 'digit_test_resources.h',
@@ -96,11 +96,11 @@ index 382dfcc..c171717 100644
                 '--target=@OUTPUT@',
                 '--sourcedir=' + meson.current_source_dir(),
                 '--generate',
-@@ -579,11 +579,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   # LLVM once that support is in a stable release.
-   objcopy = find_program('objcopy', required : false)
+@@ -668,11 +668,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
  
--  if build_machine.system() == 'linux' and cc.get_id() == 'gcc' and objcopy.found()
+   ld = find_program('ld', required : false)
+ 
+-  if build_machine.system() == 'linux' and cc.get_id() == 'gcc' and objcopy.found() and objcopy_supports_add_symbol and ld.found()
 +  if not meson.is_cross_build()
      test_gresource_binary = custom_target('test5.gresource',
        input : 'test5.gresource.xml',
@@ -110,7 +110,7 @@ index 382dfcc..c171717 100644
                   '--target=@OUTPUT@',
                   '--sourcedir=' + meson.current_source_dir(),
                   '--sourcedir=' + meson.current_build_dir(),
-@@ -595,7 +595,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
+@@ -684,7 +684,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
      test_resources_binary_c = custom_target('test_resources_binary.c',
        input : 'test5.gresource.xml',
        output : 'test_resources_binary.c',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index fc320dcab8..fe87482ae2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 8c623acdbea3ecc2812bbaafcfc892758fa978da Mon Sep 17 00:00:00 2001
+From 2a715765c6ceb2e8b4cc42e060aee75016111d1a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,11 +19,11 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 1007abd..5380982 100644
+index c420260..a023745 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -44,6 +44,8 @@
- #include "gnetworkmonitor.h"
+@@ -47,6 +47,8 @@
+ #include "gmemorymonitordbus.h"
  #ifdef G_OS_WIN32
  #include "gregistrysettingsbackend.h"
 +#else
@@ -32,7 +32,7 @@ index 1007abd..5380982 100644
  #include <glib/gstdio.h>
  
 @@ -1158,7 +1160,15 @@ get_gio_module_dir (void)
- #endif
+                                      NULL);
        g_free (install_dir);
  #else
 -      module_dir = g_strdup (GIO_MODULE_DIR);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
similarity index 83%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
index d496235003..1a8e9d659e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
@@ -16,15 +16,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch \
-           file://0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch \
-           file://0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "d52234ecba128932bed90bbc3553bfe5"
-SRC_URI[sha256sum] = "4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc"
+SRC_URI[md5sum] = "78b6bda8664763a09bd12d864c0ba46c"
+SRC_URI[sha256sum] = "9a2f21ed8f13b9303399de13a0252b7cbcede593d26971378ec6cb90e87f2277"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7ebed0e5fd..fb84db83c2 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,6 +30,8 @@ LEAD_SONAME = "libglib-2.0.*"
 
 inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages features_check
 
+DEPENDS_append_class-target = "${@' gtk-doc' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 # This avoids the need to depend on target python3, which in case of mingw is not even possible.
@@ -42,7 +44,7 @@ PACKAGECONFIG ??= "system-pcre libmount \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 # To use the system pcre it must be configured with --enable-unicode-properties
 PACKAGECONFIG[system-pcre] = "-Dinternal_pcre=false,-Dinternal_pcre=true,libpcre"
-PACKAGECONFIG[libmount] = "-Dlibmount=true,-Dlibmount=false,util-linux"
+PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
 PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 # libelf is auto-detected without a configuration option
 PACKAGECONFIG[libelf] = ",,elfutils"
@@ -168,6 +170,8 @@ RDEPENDS_${PN}-ptest += "\
             ${PN}-locale-th \
             python3-core \
             python3-modules \
+            python3-dbusmock \
+            ${PN}-codegen \
            "
 
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
-- 
2.26.1

