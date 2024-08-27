Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70722C5473B
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.71663.1724736241944781963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CgG4lEBb;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a869332c2c2so754755166b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736240; x=1725341040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWJq4ibfQVb8n5Glj7LAOcfWT8d6sHBwXs/qPrraIs0=;
        b=CgG4lEBbM5htkQFGoz/3o+rSxxS2YAbzGjx6Pah2bXx8NRUj6fsFDG9V+U8wufv7cd
         lTWE4r/FnTT9O2RBwP6qOGyiftlXJrzstH6fWNkFqU/mkex8VKWO0z6KERV1Zx7VwGUt
         wQlFT7vQumftlS/wREmLhiB0WzHav3hBrVxBemf6PoFSRAMO8sTOLmITLNiEhwhEX8xL
         LnaQkHiPAlnrZfHwxxbPlS0h6O/CNjg+PRUrPvJWAt575uRGk6iQdw8mU1jSjUKVqTmd
         iIqT1lI0zWvdGayg9ovphsShUo66tLCRDHqzCxJCHIx+9xElqCW7SoRhn3YkGRcoxwOO
         Qb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736240; x=1725341040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWJq4ibfQVb8n5Glj7LAOcfWT8d6sHBwXs/qPrraIs0=;
        b=txqkQuvRf9ZdL4/t0J/af2TvNb9KKbT1nsdlnKN7IUYlK8bSo31Fi7juIYV1WJnxAX
         Y1L/uIDQHsXSGRtrJcw9PxnoPYdGS3YwQRAcORhmtPFiQni6hEh3UHpH434uzxRUTtPo
         BUbdZ5jeqaINiBTJVejZnU0DGe3g9Ev5/AZvaUhEciMH1yZI8eCZ2kli97qxNB/y9W7f
         iQfdgfodqG0pNNLmG1YRAYvbS/D0WSvsQ9Vj2JyUliGhUC7gSTeCDzuTk2sYMaNLk1uX
         0vOu++HL5UM/Yp0FNpLqkT2+pmpO4c96a2HEfq+AFazWag8H0Tq97NfBFzQ0Y3JWRbWa
         3L9Q==
X-Gm-Message-State: AOJu0YxvoWBsgaPLxlUpnO0vj116s+7YsTv+P+5GP+nsrVII3JNCTvMY
	Oi6TJJYlUMawRms+8q0e59uaT0d9rZlzbyVNq8VefD/yoOErbwBGrNwtNA==
X-Google-Smtp-Source: AGHT+IFDeuop+rK4bnVfsdo96HO0mPb/O8XnERi5RxXRZxf3XcSYnKGTd2ZrToCUSX7KMAM7XUIkUQ==
X-Received: by 2002:a17:907:97cf:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a86e2a25c77mr167257466b.31.1724736239643;
        Mon, 26 Aug 2024 22:23:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:23:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/34] glib-2.0: update 2.80.2 -> 2.80.4
Date: Tue, 27 Aug 2024 07:23:24 +0200
Message-Id: <20240827052354.1319810-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203780

From: Alexander Kanavin <alex@linutronix.de>

Drop backport 0001-girepository-introspection-correctly-install-.gir-fi.patch

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-write-bindir-into-pkg-config-files.patch |  2 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  2 +-
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...rospection-correctly-install-.gir-fi.patch | 88 -------------------
 ...on-Run-atomics-test-on-clang-as-well.patch |  6 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  6 +-
 ...dcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/relocate-modules.patch     |  2 +-
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.80.2.bb => glib-2.0-initial_2.80.4.bb} |  0
 ...{glib-2.0_2.80.2.bb => glib-2.0_2.80.4.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 14 files changed, 15 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.80.2.bb => glib-2.0-initial_2.80.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.2.bb => glib-2.0_2.80.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 10568b7c9fe..ae140b9930b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 10b08af6c7dcb03f954da29b6c4f9636b8796f30 Mon Sep 17 00:00:00 2001
+From bcf62c2e776b9716880ac65e5d553d75d5fddc2e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index b9c9706fc46..6da93995696 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 55c49c51d8db5af15132653003d2b65a5215eebf Mon Sep 17 00:00:00 2001
+From 1d88f52c42a0ed469cb5976f5788b4ba25bb14f9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index bc539fe3e88..8423f63cbbb 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 53333cf3ec787cb7e60585237327390e2ca89f4c Mon Sep 17 00:00:00 2001
+From 75f9eaf2ef760ffb198b0b97a9054f435c79cde9 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 5e543339d8c..bd7ed776423 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 3db055ce8029372096be534c5cfc385f068bab17 Mon Sep 17 00:00:00 2001
+From 22dcd727203d59a025c8be4280b4654a7054322f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index aa7127b65b7..8b4304462e6 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 97b4f18c65c52c9e6412ecf8affc22f6f42d3465 Mon Sep 17 00:00:00 2001
+From 3f054111f991a9dd224b6201dafad7e2c28cb78d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
deleted file mode 100644
index 7be9cd8b845..00000000000
--- a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From f1beef5c2d09fae3a5e5a314f984cb3f20abe732 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 23 Apr 2024 11:24:34 +0200
-Subject: [PATCH] girepository/introspection: correctly install .gir files into
- custom locations provided via meson option
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4020]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- girepository/introspection/meson.build | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/girepository/introspection/meson.build b/girepository/introspection/meson.build
-index 9405686..862ca61 100644
---- a/girepository/introspection/meson.build
-+++ b/girepository/introspection/meson.build
-@@ -49,6 +49,7 @@ glib_gir = gnome.generate_gir(libglib,
-   export_packages: 'glib-2.0',
-   header: 'glib.h',
-   install: true,
-+  install_dir_gir: glib_girdir,
-   dependencies: [
-     libgobject_dep,
-   ],
-@@ -76,6 +77,7 @@ if host_system == 'windows'
-     header: 'glib.h',
-     includes: [ glib_gir[0] ],
-     install: true,
-+    install_dir_gir: glib_girdir,
-     dependencies: [
-       libgobject_dep,
-     ],
-@@ -104,6 +106,7 @@ else
-     header: 'glib.h',
-     includes: [ glib_gir[0] ],
-     install: true,
-+    install_dir_gir: glib_girdir,
-     dependencies: [
-       libgobject_dep,
-     ],
-@@ -137,6 +140,7 @@ gobject_gir = gnome.generate_gir(libgobject,
-   header: 'glib-object.h',
-   includes: [ glib_gir[0] ],
-   install: true,
-+  install_dir_gir: glib_girdir,
-   env: gi_gen_env_variables,
-   extra_args: gir_args + [
-       '-DGOBJECT_COMPILATION',
-@@ -162,6 +166,7 @@ gmodule_gir = gnome.generate_gir(libgmodule,
-   header: 'gmodule.h',
-   includes: [ glib_gir[0] ],
-   install: true,
-+  install_dir_gir: glib_girdir,
-   dependencies: [
-     libglib_dep,
-   ],
-@@ -224,6 +229,7 @@ gio_gir = gnome.generate_gir(libgio,
-   header: 'gio/gio.h',
-   includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0] ],
-   install: true,
-+  install_dir_gir: glib_girdir,
-   dependencies: [
-     libglib_dep,
-     libgobject_dep,
-@@ -249,6 +255,7 @@ if host_system == 'windows'
-     header: 'gio/gio.h',
-     includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
-     install: true,
-+    install_dir_gir: glib_girdir,
-     dependencies: [
-       libglib_dep,
-       libgobject_dep,
-@@ -277,6 +284,7 @@ else
-     header: 'gio/gio.h',
-     includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
-     install: true,
-+    install_dir_gir: glib_girdir,
-     dependencies: [
-       libglib_dep,
-       libgobject_dep,
-@@ -314,6 +322,7 @@ girepository_gir = gnome.generate_gir(libgirepository,
-   header: 'girepository/girepository.h',
-   includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
-   install: true,
-+  install_dir_gir: glib_girdir,
-   dependencies: [ libglib_dep, libgobject_dep, libgmodule_dep, libgio_dep ],
-   extra_args: gir_args + libgirepository_gir_args,
- )
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 3a8d3596b0d..ea1ab568d18 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From f04ea29f9f96892ada81bd0acfcef70183138229 Mon Sep 17 00:00:00 2001
+From de3eabf9295816b4b4eb7428dee504fd505e723d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 257afb5..5caa6e6 100644
+index b995ebc..a907736 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2024,7 +2024,7 @@ atomicdefine = '''
+@@ -2021,7 +2021,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 9be04960aaa..82a7a5ad23d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From a63c865aa9a24f3230e8e2bcb5bce88f179c7e2b Mon Sep 17 00:00:00 2001
+From 546aa941d2fd42f69b3e2bd6625d65c145a5e265 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 5caa6e6..688f214 100644
+index a907736..53cffb5 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1022,7 +1022,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1019,7 +1019,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 4dec252c1f0..30a6bd4c3ad 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From dc7f09c4f52638a70768c528d186da6f83dedc97 Mon Sep 17 00:00:00 2001
+From 20f64ba4b48e46cf238dc638dc3305036358122b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index a1ff198aa65..a00703cef8b 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 0133aeabd37a9137722abd86039d7d0797b5896f Mon Sep 17 00:00:00 2001
+From 41470a56d9ae12912e3f2f9cfb0c126b4f91cd53 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 0f8b51294ba..5ede64fd59f 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From ac75f5d9206e52eec64fef0db4cd91b58a764c99 Mon Sep 17 00:00:00 2001
+From 18d6798ba0e4e15d63a63485b729b6ef1b6a4457 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 690d1c162cb..9e742c4d3bf 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -226,13 +226,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://skip-timeout.patch \
-           file://0001-girepository-introspection-correctly-install-.gir-fi.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \ 
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[sha256sum] = "b9cfb6f7a5bd5b31238fd5d56df226b2dda5ea37611475bf89f6a0f9400fe8bd"
+SRC_URI[sha256sum] = "24e029c5dfc9b44e4573697adf33078a9827c48938555004b3b9096fa4ea034f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.39.2


