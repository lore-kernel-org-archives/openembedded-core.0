Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4767.1792538578518206383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=au2JBZ61;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so825436f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538577; x=1793143377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M0kkC5k69Ne+LFvUu4L/MIsGCpzgo+eBy/mbDEiqQ5U=;
        b=au2JBZ618wUQ1p3J94Dev42m707IBAfywnFBjdGZy5i/N810zHkyMBdhsUCjHOXWDv
         fY41+xxU4RmyxOL54t7easrvubETHG4Xx7iPnvoJWayaDtXFoJz4ejXtK1+38O5Pep/o
         +3EEQ+2evNkida2H0OiSGsmMMMboKdcQWPGPqYfScpxV3ZKJP9ptkXSTBmLEFUMoSMYJ
         Fb4FvFOb0OrGP5nzCePANqGpCepBdYhRSU3lWKG1JIftSFRtitF3oX8d5DPRbBX5JihB
         NvBcSr32v2culXY1fCf3of/lbDsbOSMNHs7mtU2XiSOW2Ox9XTVrGbQN2WoaMVhllL9k
         n2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538577; x=1793143377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M0kkC5k69Ne+LFvUu4L/MIsGCpzgo+eBy/mbDEiqQ5U=;
        b=tWHngMnNbw9lwEy4BQkZOa/moz3Tv9mnt0a5qXPgpR5fCJv3rnyATljJB3pXlhmNQo
         unk5QJR4ucQQQubX9UXNmgwQx0/xyLidzvG0u4kttUNljstWqkauoinTRAJe0kYhEwPm
         qE8x0Pidxa8DGPJ6wqF1bPOPVPX+/snax8x2/KmXS+PUne3HWOidPZZLLXQHrX1zWrrO
         rN9WEsO+XYsWIuFNL+wgkxYSZAbwWnMq9QFDAXJp0lRvzmU1W0P0fsDtpjbplKMBJ77V
         CUigluJdEl9rclhKX8hoWVNJRzlMG3swC3KlHCBZ1kfxYvYQjrsQUlAuZ45gciy+FZQS
         96/Q==
X-Gm-Message-State: AFq9FYLftmI0OpaYJwvN6YaomANBhOFB8f8/uYgCfsfhO9ZlFS2SgaWd
	ArbS7kA3FO0tqjmMoYc1AdCfzaiwuvyR8P4tcfWEMGqCc6LhNSfvNktpnPmX0uxlruhZXs9UwrG
	oa6p0k8E=
X-Gm-Gg: AYBFou0v3PTb2mTuiTMAaTfM6nf9ARegvofHMyNs90Dyt1MWqUVwyg1eZsf8YN7NhEF
	U4YOwN+rPae1WzoYMWi2soLioYU+Kup2KlQwQUYuWa030x27VvkMvre3l75XfgyzE2oRUjMIzS7
	IvjzOZy92jrIUvJUyY5v85kYw03u+SKuoUVL2umAA18x628m/hOawQijvfu4+05qSwnLcJbJyI7
	jTeEjJJY3UVOBbVdjcs7zvi8+8cJKpJiPY21Gv+JDXmFImuOyEunoTYJj7so3NH42AynPAhWOHO
	4o18l2EQeFa4zmNBELE+/YkRdqvcDj5oXSSMPOwjzW1e/TvdzutYMfHCF8DFMuiRwdmtna83Ff3
	ghDqxURSg90OIEWozv4OA39qDrqXT7uPdtfRj7sw+wzOR7nPjBNcV3NcNAJUrMAlHPcB2AWPTmk
	Hpmqs4TaEMubvzhTFfNTD2VKlDZcwjmyi0pARv4OhJRh/XHRUY28jNOXHs6V/TL1ZGZBANYM/IM
	J9Ld3/ZtLnZYRq+jOnCDTKslau9HwmzMdm82Vx+amyMIIqo2d7hjBptwocyh46djUcT0ueoZnX/
	2ujghzL+jsG+zR7IWtCIUCJh6DpZ72ntvGT+kUwYbUSAMAwTTvUXRPM=
X-Received: by 2002:a05:600c:4f91:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a1fdd0c00bmr3719575e9.7.1792538576555;
        Tue, 20 Oct 2026 16:22:56 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/25] glib-2.0: upgrade 2.88.2 -> 2.88.3
Date: Wed, 21 Oct 2026 01:22:19 +0200
Message-ID: <7e10ca136d7d4dbaf56814f3c8e1537c05999ce6.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248328
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.88.3/NEWS#L1-L17

Source: NEWS

Overview of changes in GLib 2.88.3, 2026-07-29
==============================================

* Fix potential miscompilation with GCC 17 with G_GNUC_CONST on get_type()
  functions (#3984, work by Sam James)

* Bugs fixed:
  - #3984 G_GNUC_CONST vs get_type comes home to roost (Sam James)
  - #3985 (CVE-2026-15588) Security report: GDBusServer pre-authentication DoS
    via unbounded SASL line buffering (Philip Withnall)
  - !5225 Backport !5223 "Drop G_GNUC_CONST for *_get_type" to glib-2-88
  - !5241 Backport !5240 "gdbusauth: Limit length of lines read from client" to
    glib-2-88
  - !5242 Backport !5238 "gpoll: Correctly zero-out heap-allocated fd_sets on
    macOS" to glib-2-88
  - !5243 gdbusauth: Unmark a new string as translatable
  - !5259 Backport !5248, !5249: several Meson/gcc fixes to glib-2-88

CVE-2026-58016 patches refreshed due to context changes in the new
version. The patch content is unchanged, only line offsets updated.

Backport fix for buildpaths QA error from upstream !5259: use the .in
template as input for the installed service file.
[https://gitlab.gnome.org/GNOME/glib/-/commit/ed5956d]

Pre-existing failure: glib/gdbus-server-auth.test (SIGABRT, same in both versions)

This commit is roughly equivalent to OE-Core rev: d44fcc04348344add7546d1e80806026aafbf108
Exact cherry-pick is not possible as the branches diverged a bit in
patch formatting.
Created by copying glib-2.0 directory from OE-Core rev: 8de7017a3161ffb04f36e9c6ba2f7ead402dc4a5
(and reverting LICENSE change)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...t-write-bindir-into-pkg-config-files.patch |  6 ++--
 ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |  2 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch | 21 +++++------
 ...ng-about-deprecated-paths-in-schemas.patch |  2 +-
 ...ces.c-comment-out-a-build-host-only-.patch |  2 +-
 ...es-Fix-installed-service-file-using-.patch | 35 +++++++++++++++++++
 ...on-Run-atomics-test-on-clang-as-well.patch |  4 +--
 ...ot-enable-pidfd-features-on-native-g.patch |  4 +--
 ...dcode-python-path-into-various-tools.patch |  4 +--
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 14 ++++----
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 10 +++---
 .../glib-2.0/files/relocate-modules.patch     |  4 +--
 .../glib-2.0/files/skip-timeout.patch         |  2 +-
 ...l_2.88.2.bb => glib-2.0-initial_2.88.3.bb} |  0
 ...{glib-2.0_2.88.2.bb => glib-2.0_2.88.3.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  3 +-
 16 files changed, 73 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.2.bb => glib-2.0-initial_2.88.3.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.2.bb => glib-2.0_2.88.3.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 8b783e81ea6..c22ef9fdb32 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 6fe3965383d94b3030e85ab899955858710fec5c Mon Sep 17 00:00:00 2001
+From 94f8f5bf51db5219022f6a646e784cb67d284282 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 2f8f188..57c48d2 100644
+index f9aa0c8..48ff2a5 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -934,17 +934,18 @@ libgio_dep = declare_dependency(link_with : libgio,
@@ -46,7 +46,7 @@ index 2f8f188..57c48d2 100644
    uninstalled_variables : [
      'gio=${prefix}/gio/gio',
 diff --git a/glib/meson.build b/glib/meson.build
-index 209bcbf..a86cfd3 100644
+index 0fb6e26..9eebf73 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
 @@ -480,9 +480,10 @@ pkg.generate(libglib,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index b91624da8b3..bd7a04cccfd 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 966c58aae35f9e2bcef5238e0331a119e0e51abd Mon Sep 17 00:00:00 2001
+From c80659ca01051f8e83dccd4eda15a811b0ea377d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 5b7c3239962..8f6fd984727 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 0de3a3a791ca32f2330eb3a8ad9da0fe6dce950c Mon Sep 17 00:00:00 2001
+From 25d6cb83b6b46181fbdad1a6f872a3788d6e4843 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -9,18 +9,19 @@ renamer does not cope with library packages with files in ${bindir}
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
 ---
- gio/meson.build | 1 +
- 1 file changed, 1 insertion(+)
+ gio/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 39256d3..2f8f188 100644
+index a3e6f18..f9aa0c8 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1071,6 +1071,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1066,7 +1066,7 @@ executable('gresource', 'gresource-tool.c',
+ 
+ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodule-priv.c',
+   install : true,
+-  install_dir : multiarch_bindir,
++  install_dir : glib_libexecdir,
+   install_tag : 'bin',
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
-   link_args : noseh_link_args,
-+  install_dir: glib_libexecdir,
-   dependencies : [libgio_dep, libgobject_dep, libgmodule_dep, libglib_dep, app_profile_dep])
- 
- glib_compile_schemas = executable('glib-compile-schemas',
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index d6dd66357ae..d64576b11e7 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From b829f3205e4d8390f02eaa8e7a7bf85e51cbb7ed Mon Sep 17 00:00:00 2001
+From 29be4e2681b78d7856143056f769040be076b03d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 7a2fc0b7efa..579999fd6d0 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 912e674bb0a3b51dabaa58da1834491ef94e6a2a Mon Sep 17 00:00:00 2001
+From 12bf3fded3b4c0c7b2d7ae7810d6eef47ed747e5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch
new file mode 100644
index 00000000000..755e51cdd3d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-services-Fix-installed-service-file-using-.patch
@@ -0,0 +1,35 @@
+From ed5956d0000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 30 Jul 2026 11:28:36 +0000
+Subject: [PATCH] gio/tests/services: Fix installed service file containing
+ build path
+
+The refactoring in !5259 changed the installed service file's
+configure_file() to use the build output as input instead of the
+original .in template. Since @installed_tests_dir@ is already
+substituted in the build output, the installed version gets the
+build directory path instead of the install prefix.
+
+Use the .in template directly as input for the installed version.
+
+Closes #4011
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ed5956d]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ gio/tests/services/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gio/tests/services/meson.build b/gio/tests/services/meson.build
+index 1111111..2222222 100644
+--- a/gio/tests/services/meson.build
++++ b/gio/tests/services/meson.build
+@@ -18,7 +18,7 @@ foreach service_file_name : dbus_service_files
+     # Build a second copy of the service file for the installed
+     # version of the tests.
+     installed_service_file = configure_file(
+-      input: service_file,
++      input: service_file_name + '.in',
+       output: service_file_name + '.to-install',
+       configuration: installed_cdata,
+     )
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 149833dc434..3f9b9e47413 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 26ddae02d7677bcff7c3933ee856d34df41b548f Mon Sep 17 00:00:00 2001
+From 0530e624dd47ee18aab18c8d403da12bb297f26e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index dab1d61..cc3a5ed 100644
+index 22ed181..87497b7 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index efd5d3de1b1..0912859698c 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From c6cd3c0a66ae8f210185e0cb05b2172dc192ce9e Mon Sep 17 00:00:00 2001
+From 0147fb147548e0657f298ab8e050ef8aaad3c850 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index cc3a5ed..58dd87a 100644
+index 87497b7..6955b02 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 8dbdf746b7d..c032d575eb0 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 40e40230e6a3c52b79c6f92e8c060bd4d93f0374 Mon Sep 17 00:00:00 2001
+From 2bafa636db0241952b9168c62f051900ebf8b058 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -32,7 +32,7 @@ index 0578b74..56e8e2e 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 7e794e9..4b619f8 100755
+index f388714..37ed491 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index 9beafd106d1..f6883ba85cc 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -1,8 +1,8 @@
-From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
+From 9a59b64b294843842efc86148485c8b3530cdfd1 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:27:37 +0100
-Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling for
- <node> element nesting
+Subject: [PATCH] gdbusintrospection: Fix XML parser state handling for <node>
+ element nesting
 
 The check for whether a `<node>` element in D-Bus introspection XML was
 nested correctly was broken. `<node>` elements can only be at the top
@@ -27,7 +27,7 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
  2 files changed, 34 insertions(+), 1 deletion(-)
 
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index c7be334ce2f7..6f722ee6153d 100644
+index df5daa3..78a63e2 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
 @@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
@@ -40,7 +40,7 @@ index c7be334ce2f7..6f722ee6153d 100644
            g_set_error_literal (error,
                                 G_MARKUP_ERROR,
 diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspection.c
-index 44cb7a96af45..daca313f77e7 100644
+index cb99c94..05710d4 100644
 --- a/gio/tests/gdbus-introspection.c
 +++ b/gio/tests/gdbus-introspection.c
 @@ -300,6 +300,38 @@ test_extra_data (void)
@@ -89,6 +89,4 @@ index 44cb7a96af45..daca313f77e7 100644
 +  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
  
    ret = session_bus_run ();
-
---
-2.54.0
+ 
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a07aa529ae8..3acb16f75d6 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -1,7 +1,7 @@
-From a75052ceeebea434f271b670766acd5416bc83b9 Mon Sep 17 00:00:00 2001
+From 02e38caa6265e25da87836ec46c9e514d4a81159 Mon Sep 17 00:00:00 2001
 From: Philip Withnall <pwithnall@gnome.org>
 Date: Thu, 16 Apr 2026 15:08:10 +0100
-Subject: [PATCH 2/2] gdbusintrospection: Add some assertions before array
+Subject: [PATCH] gdbusintrospection: Add some assertions before array
  dereferences
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -27,7 +27,7 @@ Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
-index 6f722ee6153d..ed0d291f99f0 100644
+index 78a63e2..4df8e87 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
 @@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
@@ -93,6 +93,4 @@ index 6f722ee6153d..ed0d291f99f0 100644
 +  g_assert (data->nodes->len > 0);
    return data->nodes->pdata[data->nodes->len - 1];
  }
-
---
-2.54.0
+ 
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 4c2638ae615..6c982ca7355 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 14bbc77bc465b42454112bc6a33264c2c3e013e5 Mon Sep 17 00:00:00 2001
+From 226f4955e53c6b3f360f346e41a0a22b74cbbaae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -21,7 +21,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 38761e4..afa7878 100644
+index 7311775..abc2c79 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -1312,6 +1312,24 @@ get_gio_module_dir (void)
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 8ef140d0d7f..7bc83adf6bf 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From f77b9dd72dd0103c7a28dd7e1cdf6e316ecbf030 Mon Sep 17 00:00:00 2001
+From 64e957f0fb32ed54748ceb4f220cb4773743d6ec Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cad74f53f71..50cdeff1589 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,12 +237,13 @@ SRC_URI += "\
            file://skip-timeout.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://0001-gio-tests-services-Fix-installed-service-file-using-.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "cf3f215a640c8a4257f14317586b8f1fdd25a10a93cb4bdda147c0f9ad88e74f"
+SRC_URI[archive.sha256sum] = "ab24d24e698dfa1e408b7bcdb508f4aafc906185a8b8ce72fdf79bbbdc9b383b"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
