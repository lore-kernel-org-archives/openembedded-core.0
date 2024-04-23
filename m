Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137F1C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 11:41:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.16335.1713872481574246166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 04:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k1Zw1UMh;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a52582ecde4so501847166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713872480; x=1714477280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFhWr5pC9INQvFmMlpDQgW855i4UAMJC4+UtXsh9lRk=;
        b=k1Zw1UMhEuVbOneba4tYBuN+rAVF57w2Rg0WOc1sy4iMML4oBeC7LapPLSxqikOjtg
         VgsI1138S4TaIHtX7vU/b3mS3Ld9rQW5xplZXHCSq2dVUwFLidSAZ8nM4TU293ITMBLR
         tY6EzLvyjjIofBxnTgme+u713wFEzMzXygSBeQAbjF+fDVk4TQxpcTLbM9padDAA/mCs
         7gnOTSW4kgzRAoIJBKukvjOeWaNvi9hK3prYGNhccO5UMXK2eno5LoKfiBvg2pVP3pdi
         GaZdK57N4vzFk07NYxpr9XpqRUVCoGdIB5aEHui6bHpIK/cCqt6mJD9b/F+7+UimXWDH
         VTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713872480; x=1714477280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFhWr5pC9INQvFmMlpDQgW855i4UAMJC4+UtXsh9lRk=;
        b=erG8JPt1jEv1ktm3pmzziGYBMu6ttO3k83y+MClFclmgHv4AXHIb9BP5jZ12GXCyrN
         KL8ug6/s6croyFEX8cr/NkI/ANKBnltGbbwh+mND3IGKtJZn7zoJsOo3AaGIEjP9xlPw
         ddukGXWr05c+T1CoKnNjmL0/wXz0g93SGY4PJlxp4KXP7i+Z2U0KcjRC/aJ5gc2JxpB/
         Eu6LHDZXzaZjGqTnrcqxChUFYd/kHZbdCkNXJTNBRf7EI/0RF/tVPl/ehiYHCS+bDqEf
         RA/d8IsmTCZ4JA2CgDGP5pm/IVk3J2AY6V5LK4JCQqJVKM4Tx3W7ZjMGSX9ZiNtLK1nK
         VwqA==
X-Gm-Message-State: AOJu0Yz95dTvs6AFRVr/EEhVE/aQasd5brC+VrisUKP1AM3doqba+us9
	egXPMmJPx7vVWGGbrpnAYTZiBO5wvAQpRqgojNOkqmdQanv35BgJjmsWcw==
X-Google-Smtp-Source: AGHT+IHtSDNk/+2hyXT6NH6xv6XFPFKnLA5ajybL39jWeZfaiuo5K6jMRomEs0053gyTSqbaZtZ18w==
X-Received: by 2002:a17:906:3b59:b0:a56:4c83:fcb9 with SMTP id h25-20020a1709063b5900b00a564c83fcb9mr3456111ejf.55.1713872479173;
        Tue, 23 Apr 2024 04:41:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a7-20020a170906670700b00a522bef9f06sm6934567ejp.181.2024.04.23.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 04:41:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] glib/gobject-introspection: update 2.78.4 -> 2.80.0, 1.78.1 -> 1.80.0
Date: Tue, 23 Apr 2024 13:41:15 +0200
Message-Id: <20240423114115.932621-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240423114115.932621-1-alex.kanavin@gmail.com>
References: <20240423114115.932621-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 11:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198616

From: Alexander Kanavin <alex@linutronix.de>

With these versions, which need to be updated in lockstep, upstream has
relocated glib introspection data from g-i tree to glib tree and made
its generation a part of the overall glib build. This creates a circular
dependency, where g-i tools are linked with glib, but glib needs the tools
to build its g-i data. (I don't know why the two source trees
couldn't be simply merged into one, or g-i data for glib couldn't be generated
inside g-i build against sysroot glib).

Upstream is suggesting building glib twice, first without building g-i data,
then building g-i and linking it with that version, then building
the final glib, and that's what is being done here (via the new
glib-initial recipe, which is sysroot-only, and is not pulled in
via indirect dependencies either).

Other glib changes:
0001-Do-not-write-bindir-into-pkg-config-files.patch restores
writing bindir variable into glib.pc file (meson only writes
it out if other variables depend on it, and this custom patch
removes that dependency).

0001-girepository-introspection-correctly-install-.gir-fi.patch
ensures correct installation of .gir into something else
than $datadir (useful in multilib).

Merge previous glib .bb into .inc, so that glib and glib-initial
recipes could be cleanly separated with no duplication.

Convert from gtk-doc to gi-docgen, and manpages from xmlto to
docutils.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 +
 ...t-write-bindir-into-pkg-config-files.patch |  31 +-
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |   2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |   6 +-
 ...ng-about-deprecated-paths-in-schemas.patch |   2 +-
 ...-correctly-when-building-with-mingw3.patch |  20 +-
 ...ces.c-comment-out-a-build-host-only-.patch |   4 +-
 ...rospection-correctly-install-.gir-fi.patch |  88 +++++
 ...on-Run-atomics-test-on-clang-as-well.patch |   6 +-
 ...ot-enable-pidfd-features-on-native-g.patch |   6 +-
 ...dcode-python-path-into-various-tools.patch |   4 +-
 .../{glib-2.0 => files}/meson.cross.d/common  |   0
 .../meson.cross.d/common-glibc                |   0
 .../meson.cross.d/common-linux                |   0
 .../meson.cross.d/common-mingw                |   0
 .../meson.cross.d/common-musl                 |   0
 .../relocate-modules.patch                    |   8 +-
 .../glib-2.0/{glib-2.0 => files}/run-ptest    |   0
 .../{glib-2.0 => files}/skip-timeout.patch    |   7 +-
 .../glib-2.0/glib-2.0-initial_2.80.0.bb       |   5 +
 ...deprecated-distutils-module-to-the-p.patch |  34 --
 .../glib-2.0/glib-2.0/fix-regex.patch         |  54 ---
 .../glib-2.0/glib-2.0/memory-monitor.patch    | 361 ------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb |  57 ---
 meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb |   1 +
 meta/recipes-core/glib-2.0/glib.inc           |  74 +++-
 ...pository-directory-for-native-builds.patch |  11 +-
 ...8.1.bb => gobject-introspection_1.80.1.bb} |   8 +-
 28 files changed, 221 insertions(+), 569 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-Do-not-write-bindir-into-pkg-config-files.patch (68%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch (92%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch (84%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch (95%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-Set-host_machine-correctly-when-building-with-mingw3.patch (80%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch (92%)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-meson-Run-atomics-test-on-clang-as-well.patch (88%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch (84%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/0010-Do-not-hardcode-python-path-into-various-tools.patch (93%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/meson.cross.d/common (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/meson.cross.d/common-glibc (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/meson.cross.d/common-linux (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/meson.cross.d/common-mingw (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/meson.cross.d/common-musl (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/relocate-modules.patch (86%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/run-ptest (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0 => files}/skip-timeout.patch (90%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.78.1.bb => gobject-introspection_1.80.1.bb} (96%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 20eb3a04468..fbf2d4cc816 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -205,6 +205,7 @@ RECIPE_MAINTAINER:pn-gi-docgen = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-git = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-glew = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-glib-2.0 = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-glib-2.0-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-glib-networking = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
similarity index 68%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
rename to meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 8e6598fbef8..f6eba04fd4c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,26 +1,30 @@
-From e7077aa23bfcd31a8e72e39dc93ce4f854678376 Mon Sep 17 00:00:00 2001
+From 0561dcbf0918631d8106c3f6c2d8e92a5ec4b887 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
-Subject: [PATCH] Do not write $bindir into pkg-config files
+Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
 
-This would otherwise break when using the files to build other target
+This would otherwise break when using the executables to build other target
 components (we need to rely on PATH containing the paths to utilities,
 rather than use target paths).
 
 Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- gio/meson.build  | 16 ++++++++--------
- glib/meson.build |  6 +++---
- 2 files changed, 11 insertions(+), 11 deletions(-)
+ gio/meson.build  | 17 +++++++++--------
+ glib/meson.build |  7 ++++---
+ 2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 5f91586..1a95f4f 100644
+index 77cba7b..25d709e 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -884,14 +884,14 @@ pkg.generate(libgio,
+@@ -883,17 +883,18 @@ libgio_dep = declare_dependency(link_with : libgio,
+ pkg.generate(libgio,
+   requires : ['glib-2.0', 'gobject-2.0'],
+   variables : [
++    'bindir=' + '${prefix}' / get_option('bindir'),
+     'schemasdir=' + '${datadir}' / schemas_subdir,
      'dtdsdir=' + '${datadir}' / dtds_subdir,
-     'bindir=' + '${prefix}' / get_option('bindir'),
      'giomoduledir=' + pkgconfig_giomodulesdir,
 -    'gio=' + '${bindir}' / 'gio',
 -    'gio_querymodules=' + pkgconfig_multiarch_bindir / 'gio-querymodules',
@@ -42,16 +46,17 @@ index 5f91586..1a95f4f 100644
    version : glib_version,
    install_dir : glib_pkgconfigreldir,
 diff --git a/glib/meson.build b/glib/meson.build
-index c26a35e..1d8ca6b 100644
+index d2efeba..5f5841d 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -447,9 +447,9 @@ pkg.generate(libglib,
+@@ -447,9 +447,10 @@ pkg.generate(libglib,
+   subdirs : ['glib-2.0'],
+   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : [
-     'bindir=' + '${prefix}' / get_option('bindir'),
-     'datadir=' + '${prefix}' / get_option('datadir'),
 -    'glib_genmarshal=' + '${bindir}' / 'glib-genmarshal',
 -    'gobject_query=' + '${bindir}' / 'gobject-query',
 -    'glib_mkenums=' + '${bindir}' / 'glib-mkenums',
++    'bindir=' + '${prefix}' / get_option('bindir'),
 +    'glib_genmarshal=glib-genmarshal',
 +    'gobject_query=gobject-query',
 +    'glib_mkenums=glib-mkenums',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
similarity index 92%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
rename to meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index eb9dfdbcf99..129bc7f8aee 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 9a5d4bf65b658d744d610ee27ecd2ae65b14b158 Mon Sep 17 00:00:00 2001
+From ccb25e8c0bab54eac8ba0e9d7083ce81461ab72a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
similarity index 84%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
rename to meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index ad69f7ec655..3e12f8abbeb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 4933aef791857a5aac650b60af800778658b875b Mon Sep 17 00:00:00 2001
+From caab40411d8520dae77a4b7933ebaffbb00559fe Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index f9fdf6e..5f91586 100644
+index 59c2b0f..77cba7b 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1005,6 +1005,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1007,6 +1007,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
rename to meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index 0e3a62af6a6..9b0b83afa44 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 8ae2e9c2a04e089306693a021149dc6b7d1bd679 Mon Sep 17 00:00:00 2001
+From 65c036b1ede453e89893076f4ece21c946505096 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
similarity index 80%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
rename to meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index 32b4cea409c..a2f9dd9672f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,4 +1,4 @@
-From c0733f7a91dfe13152abc60c5a3064456b3e9d63 Mon Sep 17 00:00:00 2001
+From 01810df82fae752428d3756c85edb2eb7bbf3c15 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 4ef3343..e498e7e 100644
+index 232ecca..563298b 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
 @@ -29,7 +29,7 @@ endif
@@ -24,16 +24,16 @@ index 4ef3343..e498e7e 100644
    common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
  endif
  
-@@ -230,7 +230,7 @@ if have_dbus_daemon
+@@ -244,7 +244,7 @@ if have_dbus_daemon
  endif
  
  #  Test programs buildable on UNIX only
 -if host_machine.system() != 'windows'
 +if host_system != 'windows'
    gio_tests += {
-     'file' : {},
-     'gdbus-peer-object-manager' : {},
-@@ -562,7 +562,7 @@ if host_machine.system() != 'windows'
+     'file' : {
+       # FIXME: https://gitlab.gnome.org/GNOME/glib/-/issues/3148
+@@ -593,7 +593,7 @@ if host_machine.system() != 'windows'
  endif # unix
  
  #  Test programs buildable on Windows only
@@ -42,7 +42,7 @@ index 4ef3343..e498e7e 100644
    gio_tests += {'win32-streams' : {}}
  endif
  
-@@ -632,7 +632,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
+@@ -663,7 +663,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
    }
  endif
  
@@ -52,10 +52,10 @@ index 4ef3343..e498e7e 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index d80c86e..5329cda 100644
+index f6efc59..83eb5a5 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -216,7 +216,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -226,7 +226,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
  
@@ -65,7 +65,7 @@ index d80c86e..5329cda 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index 813c9b7..6ee775e 100644
+index 7534542..2560686 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -54,6 +54,9 @@ else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
similarity index 92%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
rename to meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index aee29860332..bb84f3969e4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 878e51f82100c698236fda0e069e14ea9249350c Mon Sep 17 00:00:00 2001
+From e8b4f53b567339aad90b585673d55a5c6176535a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gio/tests/resources.c b/gio/tests/resources.c
-index f567914..b21b616 100644
+index f7dc039..f708876 100644
 --- a/gio/tests/resources.c
 +++ b/gio/tests/resources.c
 @@ -1068,7 +1068,7 @@ main (int   argc,
diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
new file mode 100644
index 00000000000..76e5f587480
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-correctly-install-.gir-fi.patch
@@ -0,0 +1,88 @@
+From 4e6be5d15e5d2f8e494d22a3d49b623064f9c1a5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 23 Apr 2024 11:24:34 +0200
+Subject: [PATCH] girepository/introspection: correctly install .gir files into
+ custom locations provided via meson option
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4020]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ girepository/introspection/meson.build | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/girepository/introspection/meson.build b/girepository/introspection/meson.build
+index 9405686..862ca61 100644
+--- a/girepository/introspection/meson.build
++++ b/girepository/introspection/meson.build
+@@ -49,6 +49,7 @@ glib_gir = gnome.generate_gir(libglib,
+   export_packages: 'glib-2.0',
+   header: 'glib.h',
+   install: true,
++  install_dir_gir: glib_girdir,
+   dependencies: [
+     libgobject_dep,
+   ],
+@@ -76,6 +77,7 @@ if host_system == 'windows'
+     header: 'glib.h',
+     includes: [ glib_gir[0] ],
+     install: true,
++    install_dir_gir: glib_girdir,
+     dependencies: [
+       libgobject_dep,
+     ],
+@@ -104,6 +106,7 @@ else
+     header: 'glib.h',
+     includes: [ glib_gir[0] ],
+     install: true,
++    install_dir_gir: glib_girdir,
+     dependencies: [
+       libgobject_dep,
+     ],
+@@ -137,6 +140,7 @@ gobject_gir = gnome.generate_gir(libgobject,
+   header: 'glib-object.h',
+   includes: [ glib_gir[0] ],
+   install: true,
++  install_dir_gir: glib_girdir,
+   env: gi_gen_env_variables,
+   extra_args: gir_args + [
+       '-DGOBJECT_COMPILATION',
+@@ -162,6 +166,7 @@ gmodule_gir = gnome.generate_gir(libgmodule,
+   header: 'gmodule.h',
+   includes: [ glib_gir[0] ],
+   install: true,
++  install_dir_gir: glib_girdir,
+   dependencies: [
+     libglib_dep,
+   ],
+@@ -224,6 +229,7 @@ gio_gir = gnome.generate_gir(libgio,
+   header: 'gio/gio.h',
+   includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0] ],
+   install: true,
++  install_dir_gir: glib_girdir,
+   dependencies: [
+     libglib_dep,
+     libgobject_dep,
+@@ -249,6 +255,7 @@ if host_system == 'windows'
+     header: 'gio/gio.h',
+     includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
+     install: true,
++    install_dir_gir: glib_girdir,
+     dependencies: [
+       libglib_dep,
+       libgobject_dep,
+@@ -277,6 +284,7 @@ else
+     header: 'gio/gio.h',
+     includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
+     install: true,
++    install_dir_gir: glib_girdir,
+     dependencies: [
+       libglib_dep,
+       libgobject_dep,
+@@ -314,6 +322,7 @@ girepository_gir = gnome.generate_gir(libgirepository,
+   header: 'girepository/girepository.h',
+   includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0] ],
+   install: true,
++  install_dir_gir: glib_girdir,
+   dependencies: [ libglib_dep, libgobject_dep, libgmodule_dep, libgio_dep ],
+   extra_args: gir_args + libgirepository_gir_args,
+ )
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
similarity index 88%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
rename to meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 0b102691141..2f805299874 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From b4b523160ef550a53705fcc45ac6e10d086ce491 Mon Sep 17 00:00:00 2001
+From 3dc2e741e18ccb740e98eb4e808ff83153b70e83 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 6ee775e..8bc5fa7 100644
+index 2560686..5c46d0b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1938,7 +1938,7 @@ atomicdefine = '''
+@@ -2024,7 +2024,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
similarity index 84%
rename from meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
rename to meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 14dcb278e05..82955de6715 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 294f3e6e9a0a9f4733e85ed6810d1b743055370b Mon Sep 17 00:00:00 2001
+From 59525eedfbbfe4a16fdd0b340bc3f2479431c7d5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 8bc5fa7..df1fa60 100644
+index 5c46d0b..222c1a1 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1022,7 +1022,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
rename to meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 6dff5179c71..a51c186b004 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 50636758c73e5e61212a8f801c6c602b8aab5ba7 Mon Sep 17 00:00:00 2001
+From e6784ba43af83e22556921786c8f15e4cd246298 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -32,7 +32,7 @@ index aa5af43..56e8e2e 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 353e53a..8ed6c39 100755
+index e10b910..4b619f8 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common b/meta/recipes-core/glib-2.0/files/meson.cross.d/common
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common
rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-glibc
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-glibc
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-linux
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-linux
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mingw b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-mingw
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mingw
rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-mingw
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-musl b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-musl
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-musl
rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-musl
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
similarity index 86%
rename from meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
rename to meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 3e79bbf6796..d6e9019f396 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From f40e89b3852df37959606ee13b1a14ade81fa886 Mon Sep 17 00:00:00 2001
+From 47ea2576a13d5bc86692b4ba8cb4a8f2fd38c6ca Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 17fabe6..8021208 100644
+index 1e14955..3c09bb5 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1271,11 +1271,6 @@ get_gio_module_dir (void)
+@@ -1259,11 +1259,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir = g_strdup (GIO_MODULE_DIR);
@@ -33,7 +33,7 @@ index 17fabe6..8021208 100644
  #include <dlfcn.h>
        {
          g_autofree gchar *path = NULL;
-@@ -1294,8 +1289,6 @@ get_gio_module_dir (void)
+@@ -1282,8 +1277,6 @@ get_gio_module_dir (void)
                }
            }
        }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/files/run-ptest
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0/run-ptest
rename to meta/recipes-core/glib-2.0/files/run-ptest
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
similarity index 90%
rename from meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch
rename to meta/recipes-core/glib-2.0/files/skip-timeout.patch
index cd5ac287c3f..b1c62cc39c8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From bb11d1a4ae77d93ec0743e54077cf0f990243fa6 Mon Sep 17 00:00:00 2001
+From 682d8a616ca111c0e45c8a9cb02e992e63c69586 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
@@ -16,7 +16,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/glib/tests/timeout.c b/glib/tests/timeout.c
-index 1ae3f3a34..85a715b0f 100644
+index 1ae3f3a..85a715b 100644
 --- a/glib/tests/timeout.c
 +++ b/glib/tests/timeout.c
 @@ -214,7 +214,6 @@ main (int argc, char *argv[])
@@ -27,6 +27,3 @@ index 1ae3f3a34..85a715b0f 100644
  
    return g_test_run ();
  }
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb
new file mode 100644
index 00000000000..7da28382650
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb
@@ -0,0 +1,5 @@
+require glib.inc
+PACKAGES = ""
+PACKAGECONFIG = ""
+
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
deleted file mode 100644
index b11c283e6d7..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a8eb944a10353403241608a084787f6efcbb2eb7 Mon Sep 17 00:00:00 2001
-From: Jordan Williams <jordan@jwillikers.com>
-Date: Fri, 1 Dec 2023 09:53:50 -0600
-Subject: [PATCH] Switch from the deprecated distutils module to the packaging
- module
-
-The distutils module was removed in Python 3.12.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/6ef967a0f930ce37a8c9b5aff969693b34714291]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- gio/gdbus-2.0/codegen/utils.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/utils.py
-index 0204610..08f1ba9 100644
---- a/gio/gdbus-2.0/codegen/utils.py
-+++ b/gio/gdbus-2.0/codegen/utils.py
-@@ -19,7 +19,7 @@
- #
- # Author: David Zeuthen <davidz@redhat.com>
- 
--import distutils.version
-+import packaging.version
- import os
- import sys
- 
-@@ -166,4 +166,4 @@ def version_cmp_key(key):
-         v = str(key[0])
-     else:
-         v = "0"
--    return (distutils.version.LooseVersion(v), key[1])
-+    return (packaging.version.Version(v), key[1])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
deleted file mode 100644
index bdfbd558999..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From cce3ae98a2c1966719daabff5a4ec6cf94a846f6 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Mon, 26 Feb 2024 16:55:44 +0000
-Subject: [PATCH] tests: Remove variable-length lookbehind tests for GRegex
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-PCRE2 10.43 has now introduced support for variable-length lookbehind,
-so these tests now fail if GLib is built against PCRE2 10.43 or higher.
-
-See
-https://github.com/PCRE2Project/pcre2/blob/e8db6fa7137f4c6f66cb87e0a3c9467252ec1ef7/ChangeLog#L94.
-
-Rather than making the tests conditional on the version of PCRE2 in use,
-just remove them. They are mostly testing the PCRE2 code rather than
-any code in GLib, so donâ€™t have much value.
-
-This should fix CI runs on msys2-mingw32, which updated to PCRE2 10.43 2
-days ago.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/cce3ae98a2c1966719daabff5a4ec6cf94a846f6]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- glib/tests/regex.c | 10 ----------
- 1 file changed, 10 deletions(-)
-
-diff --git a/glib/tests/regex.c b/glib/tests/regex.c
-index 1082526292..d7a698ec67 100644
---- a/glib/tests/regex.c
-+++ b/glib/tests/regex.c
-@@ -1885,16 +1885,6 @@ test_lookbehind (void)
-   g_match_info_free (match);
-   g_regex_unref (regex);
- 
--  regex = g_regex_new ("(?<!dogs?|cats?) x", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
--  g_assert (regex == NULL);
--  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND);
--  g_clear_error (&error);
--
--  regex = g_regex_new ("(?<=ab(c|de)) foo", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
--  g_assert (regex == NULL);
--  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND);
--  g_clear_error (&error);
--
-   regex = g_regex_new ("(?<=abc|abde)foo", G_REGEX_OPTIMIZE, G_REGEX_MATCH_DEFAULT, &error);
-   g_assert (regex);
-   g_assert_no_error (error);
--- 
-GitLab
-
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch b/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
deleted file mode 100644
index 4f38509da6f..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
+++ /dev/null
@@ -1,361 +0,0 @@
-From ce840b6b111e1e109e511f6833d6aa419e2b723a Mon Sep 17 00:00:00 2001
-From: Philip Withnall <philip@tecnocode.co.uk>
-Date: Tue, 23 Jan 2024 11:16:52 +0000
-Subject: [PATCH] Merge branch '2887-memory-monitor-tests' into 'main'
-
-tests: Fix race condition in memory-monitor-dbus.test
-
-Closes #2887
-
-See merge request GNOME/glib!3844
-
-Hopefully these commits fix the occasional failures we've been seeing:
-https://bugzilla.yoctoproject.org/show_bug.cgi?id=15362
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- gio/tests/memory-monitor-dbus.py.in          | 64 +++++++++++++-------
- gio/tests/memory-monitor-portal.py.in        | 54 ++++++++++-------
- gio/tests/power-profile-monitor-dbus.py.in   | 35 ++++++-----
- gio/tests/power-profile-monitor-portal.py.in | 34 ++++++-----
- 4 files changed, 113 insertions(+), 74 deletions(-)
-
-diff --git a/gio/tests/memory-monitor-dbus.py.in b/gio/tests/memory-monitor-dbus.py.in
-index bf32918..7aae01e 100755
---- a/gio/tests/memory-monitor-dbus.py.in
-+++ b/gio/tests/memory-monitor-dbus.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
- 
- import taptestrunner
- 
-@@ -57,53 +56,74 @@ try:
-             fcntl.fcntl(self.p_mock.stdout, fcntl.F_SETFL, flags | os.O_NONBLOCK)
-             self.last_warning = -1
-             self.dbusmock = dbus.Interface(self.obj_lmm, dbusmock.MOCK_IFACE)
-+
-+            try:
-+                self.wait_for_bus_object('org.freedesktop.LowMemoryMonitor',
-+                                        '/org/freedesktop/LowMemoryMonitor',
-+                                        system_bus=True)
-+            except:
-+                raise
-+
-             self.memory_monitor = Gio.MemoryMonitor.dup_default()
-+            assert("GMemoryMonitorDBus" in str(self.memory_monitor))
-             self.memory_monitor.connect("low-memory-warning", self.memory_warning_cb)
-             self.mainloop = GLib.MainLoop()
-             self.main_context = self.mainloop.get_context()
- 
-+            # The LowMemoryMonitor API is stateless: it doesn’t expose any
-+            # properties, just a warning signal. Emit the signal in a loop until
-+            # the GMemoryMonitor instance has initialised and synchronised to
-+            # the right state.
-+            def emit_warning(level):
-+                self.dbusmock.EmitWarning(level)
-+                return GLib.SOURCE_CONTINUE
-+
-+            idle_id = GLib.idle_add(emit_warning, 0)
-+            while self.last_warning != 0:
-+                self.main_context.iteration(True)
-+            GLib.source_remove(idle_id)
-+
-         def tearDown(self):
-             self.p_mock.terminate()
-             self.p_mock.wait()
- 
--        def assertEventually(self, condition, message=None, timeout=50):
-+        def assertEventually(self, condition, message=None, timeout=5):
-             '''Assert that condition function eventually returns True.
- 
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). message is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >= 0:
--                context = GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -= 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(condition))
-+            if not message:
-+                message = 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source = GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
- 
-         def memory_warning_cb(self, monitor, level):
-+            print("Received memory warning signal, level", level)
-             self.last_warning = level
-             self.main_context.wakeup()
- 
-         def test_low_memory_warning_signal(self):
-             '''LowMemoryWarning signal'''
- 
--            # Wait 2 seconds
--            timeout = 2
--            while timeout > 0:
--                time.sleep(0.5)
--                timeout -= 0.5
--                self.main_context.iteration(False)
--
-             self.dbusmock.EmitWarning(100)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning == 100, "'100' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning == 100, "'100' low-memory warning not received", 2)
- 
-             self.dbusmock.EmitWarning(255)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning == 255, "'255' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning == 255, "'255' low-memory warning not received", 2)
- 
- except ImportError as e:
-     @unittest.skip("Cannot import %s" % e.name)
-diff --git a/gio/tests/memory-monitor-portal.py.in b/gio/tests/memory-monitor-portal.py.in
-index 748cee8..f570508 100755
---- a/gio/tests/memory-monitor-portal.py.in
-+++ b/gio/tests/memory-monitor-portal.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
- 
- import taptestrunner
- 
-@@ -80,26 +79,44 @@ try:
-             self.mainloop = GLib.MainLoop()
-             self.main_context = self.mainloop.get_context()
- 
-+            # The LowMemoryMonitor API is stateless: it doesn’t expose any
-+            # properties, just a warning signal. Emit the signal in a loop until
-+            # the GMemoryMonitor instance has initialised and synchronised to
-+            # the right state.
-+            def emit_warning(level):
-+                self.dbusmock.EmitWarning(level)
-+                return GLib.SOURCE_CONTINUE
-+
-+            idle_id = GLib.idle_add(self.emit_warning, 0)
-+            while self.last_warning != 0:
-+                self.main_context.iteration(True)
-+            GLib.source_remove(idle_id)
-+
-         def tearDown(self):
-             self.p_mock.terminate()
-             self.p_mock.wait()
- 
--        def assertEventually(self, condition, message=None, timeout=50):
-+        def assertEventually(self, condition, message=None, timeout=5):
-             '''Assert that condition function eventually returns True.
- 
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). message is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >= 0:
--                context = GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -= 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(condition))
-+            if not message:
-+                message = 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source = GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
- 
-         def portal_memory_warning_cb(self, monitor, level):
-             self.last_warning = level
-@@ -108,20 +125,13 @@ try:
-         def test_low_memory_warning_portal_signal(self):
-             '''LowMemoryWarning signal'''
- 
--            # Wait 2 seconds
--            timeout = 2
--            while timeout > 0:
--                time.sleep(0.5)
--                timeout -= 0.5
--                self.main_context.iteration(False)
--
-             self.dbusmock.EmitWarning(100)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning == 100, "'100' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning == 100, "'100' low-memory warning not received", 2)
- 
-             self.dbusmock.EmitWarning(255)
-             # Wait 2 seconds or until warning
--            self.assertEventually(lambda: self.last_warning == 255, "'255' low-memory warning not received", 20)
-+            self.assertEventually(lambda: self.last_warning == 255, "'255' low-memory warning not received", 2)
- 
- except ImportError as e:
-     @unittest.skip("Cannot import %s" % e.name)
-diff --git a/gio/tests/power-profile-monitor-dbus.py.in b/gio/tests/power-profile-monitor-dbus.py.in
-index 06e594f..f955afc 100755
---- a/gio/tests/power-profile-monitor-dbus.py.in
-+++ b/gio/tests/power-profile-monitor-dbus.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
- 
- import taptestrunner
- 
-@@ -58,6 +57,7 @@ try:
-             self.power_saver_enabled = False
-             self.dbus_props = dbus.Interface(self.obj_ppd, dbus.PROPERTIES_IFACE)
-             self.power_profile_monitor = Gio.PowerProfileMonitor.dup_default()
-+            assert("GPowerProfileMonitorDBus" in str(self.power_profile_monitor))
-             self.power_profile_monitor.connect("notify::power-saver-enabled", self.power_saver_enabled_cb)
-             self.mainloop = GLib.MainLoop()
-             self.main_context = self.mainloop.get_context()
-@@ -66,22 +66,27 @@ try:
-             self.p_mock.terminate()
-             self.p_mock.wait()
- 
--        def assertEventually(self, condition, message=None, timeout=50):
-+        def assertEventually(self, condition, message=None, timeout=5):
-             '''Assert that condition function eventually returns True.
- 
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). message is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >= 0:
--                context = GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -= 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(condition))
-+            if not message:
-+                message = 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source = GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
- 
-         def power_saver_enabled_cb(self, spec, data):
-             self.power_saver_enabled = self.power_profile_monitor.get_power_saver_enabled()
-@@ -92,10 +97,10 @@ try:
- 
-             self.assertEqual(self.power_profile_monitor.get_power_saver_enabled(), False)
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProfile', dbus.String('power-saver', variant_level=1))
--            self.assertEventually(lambda: self.power_saver_enabled == True, "power-saver didn't become enabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled == True, "power-saver didn't become enabled", 1)
- 
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProfile', dbus.String('balanced', variant_level=1))
--            self.assertEventually(lambda: self.power_saver_enabled == False, "power-saver didn't become disabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled == False, "power-saver didn't become disabled", 1)
- 
- except ImportError as e:
-     @unittest.skip("Cannot import %s" % e.name)
-diff --git a/gio/tests/power-profile-monitor-portal.py.in b/gio/tests/power-profile-monitor-portal.py.in
-index 09e9a45..ad2abf6 100755
---- a/gio/tests/power-profile-monitor-portal.py.in
-+++ b/gio/tests/power-profile-monitor-portal.py.in
-@@ -16,7 +16,6 @@ import sys
- import subprocess
- import fcntl
- import os
--import time
- 
- import taptestrunner
- 
-@@ -90,22 +89,27 @@ try:
-             self.p_mock.terminate()
-             self.p_mock.wait()
- 
--        def assertEventually(self, condition, message=None, timeout=50):
-+        def assertEventually(self, condition, message=None, timeout=5):
-             '''Assert that condition function eventually returns True.
- 
--            Timeout is in deciseconds, defaulting to 50 (5 seconds). message is
-+            Timeout is in seconds, defaulting to 5 seconds. message is
-             printed on failure.
-             '''
--            while timeout >= 0:
--                context = GLib.MainContext.default()
--                while context.iteration(False):
--                    pass
--                if condition():
--                    break
--                timeout -= 1
--                time.sleep(0.1)
--            else:
--                self.fail(message or 'timed out waiting for ' + str(condition))
-+            if not message:
-+                message = 'timed out waiting for ' + str(condition)
-+
-+            def timed_out_cb(message):
-+                self.fail(message)
-+                return GLib.SOURCE_REMOVE
-+
-+            timeout_source = GLib.timeout_source_new_seconds(timeout)
-+            timeout_source.set_callback(timed_out_cb, message)
-+            timeout_source.attach(self.main_context)
-+
-+            while not condition():
-+                self.main_context.iteration(True)
-+
-+            timeout_source.destroy()
- 
-         def power_saver_enabled_cb(self, spec, data):
-             self.power_saver_enabled = self.power_profile_monitor.get_power_saver_enabled()
-@@ -116,10 +120,10 @@ try:
- 
-             self.assertEqual(self.power_profile_monitor.get_power_saver_enabled(), False)
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProfile', dbus.String('power-saver', variant_level=1))
--            self.assertEventually(lambda: self.power_saver_enabled == True, "power-saver didn't become enabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled == True, "power-saver didn't become enabled", 1)
- 
-             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActiveProfile', dbus.String('balanced', variant_level=1))
--            self.assertEventually(lambda: self.power_saver_enabled == False, "power-saver didn't become disabled", 10)
-+            self.assertEventually(lambda: self.power_saver_enabled == False, "power-saver didn't become disabled", 1)
- 
-         def test_power_profile_power_saver_enabled_portal_default(self):
-             '''power-saver-enabled property default value'''
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
deleted file mode 100644
index b1669ead75e..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-require glib.inc
-
-PE = "1"
-
-SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://run-ptest \
-           file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
-           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
-           file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
-           file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
-           file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
-           file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
-           file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
-           file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch \
-           file://memory-monitor.patch \
-           file://fix-regex.patch \
-           file://skip-timeout.patch \
-           "
-SRC_URI:append:class-native = " file://relocate-modules.patch \ 
-                                file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-                              "
-
-SRC_URI[sha256sum] = "24b8e0672dca120cc32d394bccb85844e732e04fe75d18bb0573b2dbc7548f63"
-
-# Find any meson cross files in FILESPATH that are relevant for the current
-# build (using siteinfo) and add them to EXTRA_OEMESON.
-inherit siteinfo
-def find_meson_cross_files(d):
-    if bb.data.inherits_class('native', d):
-        return ""
-
-    thisdir = os.path.normpath(d.getVar("THISDIR"))
-    import collections
-    sitedata = siteinfo_data(d)
-    # filename -> found
-    files = collections.OrderedDict()
-    for path in d.getVar("FILESPATH").split(":"):
-        for element in sitedata:
-            filename = os.path.normpath(os.path.join(path, "meson.cross.d", element))
-            sanitized_path = filename.replace(thisdir, "${THISDIR}")
-            if sanitized_path == filename:
-                if os.path.exists(filename):
-                    bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
-                continue
-            files[filename.replace(thisdir, "${THISDIR}")] = os.path.exists(filename)
-
-    items = ["--cross-file=" + k for k,v in files.items() if v]
-    d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
-    items = ["%s:%s" % (k, "True" if v else "False") for k,v in files.items()]
-    d.appendVarFlag("do_configure", "file-checksums", " " + " ".join(items))
-
-python () {
-    find_meson_cross_files(d)
-}
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
new file mode 100644
index 00000000000..e22810a55bc
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
@@ -0,0 +1 @@
+require glib.inc
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fac8875d844..692857892ff 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -28,21 +28,25 @@ PACKAGES += "${PN}-codegen ${PN}-utils"
 
 LEAD_SONAME = "libglib-2.0.*"
 
-inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages gobject-introspection-data
-
-GTKDOC_MESON_OPTION = "gtk_doc"
+inherit meson gettext gi-docgen pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages gobject-introspection-data
 
 S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "libmount \
+                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'introspection', '', d)} \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG:class-native = ""
+
 PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
-PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, python3-docutils-native"
 PACKAGECONFIG[libelf] = "-Dlibelf=enabled,-Dlibelf=disabled,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
+PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,gobject-introspection-native gobject-introspection glib-2.0-initial"
 
-EXTRA_OEMESON = "-Ddtrace=false -Dsystemtap=false"
+EXTRA_OEMESON = "-Ddtrace=false -Dsystemtap=false \
+    ${@'-Dgir_dir_prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
+"
 
 do_configure:prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
@@ -53,14 +57,16 @@ FILES:${PN} = "${libdir}/lib*${SOLIBS} \
                ${libexecdir}/*gio-querymodules \
                ${libexecdir}/*gio-launch-desktop \
                ${datadir}/glib-2.0/dtds \
-               ${datadir}/glib-2.0/schemas"
-
+               ${datadir}/glib-2.0/schemas \
+               ${libdir}/girepository-*/*.typelib \
+"
 FILES:${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la \
                     ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
                     ${datadir}/glib-2.0/schemas/gschema.dtd \
                     ${datadir}/glib-2.0/valgrind/glib.supp \
+                    ${datadir}/gir-*/*.gir ${libdir}/gir-*/*.gir \
                     ${datadir}/gettext/its"
 FILES:${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 FILES:${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
@@ -204,3 +210,57 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
             locale-base-pl-pl.iso-8859-2 \
             locale-base-tr-tr \
            "
+
+PE = "1"
+
+SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
+           file://run-ptest \
+           file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
+           file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
+           file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
+           file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
+           file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
+           file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
+           file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
+           file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://skip-timeout.patch \
+           file://0001-girepository-introspection-correctly-install-.gir-fi.patch \
+           "
+SRC_URI:append:class-native = " file://relocate-modules.patch \ 
+                                file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
+                              "
+
+SRC_URI[sha256sum] = "8228a92f92a412160b139ae68b6345bd28f24434a7b5af150ebe21ff587a561d"
+
+# Find any meson cross files in FILESPATH that are relevant for the current
+# build (using siteinfo) and add them to EXTRA_OEMESON.
+inherit siteinfo
+def find_meson_cross_files(d):
+    if bb.data.inherits_class('native', d):
+        return ""
+
+    thisdir = os.path.normpath(d.getVar("THISDIR"))
+    import collections
+    sitedata = siteinfo_data(d)
+    # filename -> found
+    files = collections.OrderedDict()
+    for path in d.getVar("FILESPATH").split(":"):
+        for element in sitedata:
+            filename = os.path.normpath(os.path.join(path, "meson.cross.d", element))
+            sanitized_path = filename.replace(thisdir, "${THISDIR}")
+            if sanitized_path == filename:
+                if os.path.exists(filename):
+                    bb.error("Cannot add '%s' to --cross-file, because it's not relative to THISDIR '%s' and sstate signature would contain this full path" % (filename, thisdir))
+                continue
+            files[filename.replace(thisdir, "${THISDIR}")] = os.path.exists(filename)
+
+    items = ["--cross-file=" + k for k,v in files.items() if v]
+    d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
+    items = ["%s:%s" % (k, "True" if v else "False") for k,v in files.items()]
+    d.appendVarFlag("do_configure", "file-checksums", " " + " ".join(items))
+
+python () {
+    find_meson_cross_files(d)
+}
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index c9e1afffd0f..510bc426d1b 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From aeb5532f8be42d42f4e8725ca42e239b36983a4d Mon Sep 17 00:00:00 2001
+From 4e1aa0ddbc43403ff24f644b4c4912b737290c41 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -14,14 +14,13 @@ cache or sstate mirror).
 
 Upstream-Status: Inappropriate
 Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
-
 ---
  girepository/girepository.c | 15 +++++++++++++--
  girepository/meson.build    |  2 +-
  2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
-index a0754f4..2d456f9 100644
+index 12eaf36..876382c 100644
 --- a/girepository/girepository.c
 +++ b/girepository/girepository.c
 @@ -21,6 +21,8 @@
@@ -42,7 +41,7 @@ index a0754f4..2d456f9 100644
  /**
   * SECTION:girepository
   * @short_description: GObject Introspection repository manager
-@@ -215,9 +219,16 @@ init_globals (void)
+@@ -222,9 +226,16 @@ init_globals (void)
            g_free (custom_dirs);
          }
  
@@ -62,10 +61,10 @@ index a0754f4..2d456f9 100644
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
 diff --git a/girepository/meson.build b/girepository/meson.build
-index 786749a..15cf2a9 100644
+index 5ced59e..a580d9b 100644
 --- a/girepository/meson.build
 +++ b/girepository/meson.build
-@@ -45,7 +45,7 @@ girepo_internals_lib = static_library('girepository-internals',
+@@ -47,7 +47,7 @@ girepo_internals_lib = static_library('girepository-internals',
    ],
    c_args: gi_hidden_visibility_cflags + custom_c_args,
    include_directories : configinc,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
similarity index 96%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
index 05a08a50e08..582ac248fda 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "bd7babd99af7258e76819e45ba4a6bc399608fe762d83fde3cac033c50841bb4"
+SRC_URI[sha256sum] = "a1df7c424e15bda1ab639c00e9051b9adf5cea1a9e512f8a603b53cd199bc6d8"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
@@ -26,7 +26,9 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
-DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native"
+DEPENDS += " libffi zlib python3 flex-native bison-native"
+DEPENDS:append:class-native = " glib-2.0"
+DEPENDS:append:class-target = " glib-2.0-initial"
 
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
@@ -189,6 +191,6 @@ FILES:${PN}-dbg += "${libdir}/gobject-introspection/giscanner/.debug/"
 FILES:${PN}-staticdev += "${libdir}/gobject-introspection/giscanner/*.a"
 
 # setuptools can be removed when upstream removes all uses of distutils
-RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools"
+RDEPENDS:${PN} = "python3-pickle python3-xml python3-setuptools glib-2.0"
 
 BBCLASSEXTEND = "native"
-- 
2.39.2


