Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD73AC43219
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 19:01:26 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.738.1668452476635806052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 11:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MZxjM3Q1;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id h9so20038523wrt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 11:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbFPWM8HvcFazviPEH6DR11R6gXvVLeIf7z3FXuYBDg=;
        b=MZxjM3Q1CfSqmYP+N3dmvinHa4iXDXkznfp0bw2D9iDXxFfnXcLE3AQGAv5UgRSTJP
         1GpUe2NLae5REQNZm00tz/mNY1okEaok634tdkNv/ZaK8iAysj9k4i6fFmA2ROzvP4Ww
         gZh9sk1j9UNEvKWCpCDhAKqi5yv/J+kdyZHW7SMGzxs5NOeKHSYGd5GAgh/ew//Rkwh9
         gfJyScgxRLp247NTMwnHjVXwTj+p902NH2QEck6kvJPyjqxFuZDJgWBRKdazu6uXRBcM
         Er9zX+IpQXyxFAP1qxtWL5T0nY+gRufNqIgiLt2pQD/DegYrvTqxjz4aQtN/MWnbFlAI
         m2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbFPWM8HvcFazviPEH6DR11R6gXvVLeIf7z3FXuYBDg=;
        b=psnjoD62KUvca+zo5unUS+Bhifc6/NTA6u5M+RJGAR57Y1uhJgOdIENurmlcQ973+7
         uv9IKxOPS4l/2wchQtRo0pJLWYIUTgnejHsBiNlxi7cCJm1cpDmiP2KUT6M6lYvaKibJ
         UAvLYwKcl55kHYAIhnH94ayuEUZulM8o4awmwaKjDU/Gt01ChQBW2/8Y/HIHg27D83ID
         LDQ5oU3oTrtNavKF6c4Piyn6y1Lyx/noTMbe5KmpnNmXl8fTg+y8zHdnHAtQYf7n8tPT
         +kHWFvn50s7JG/bEzMsew6UM3deHDQ/KPbVSAyDhEbFpbZEgKyls+WNDAHg7Wmhqx6T5
         WfUg==
X-Gm-Message-State: ANoB5pnLIS3TkjPZSqa1sC4TsOjXP+IfPIfr7wkCs3H6v64n8qT2DgQk
	trh1DMIIrThPtMS1xfp3GC61tuIXm5E=
X-Google-Smtp-Source: AA0mqf5er+V2g8hEv0LKZqU5/UBJm+AG2wgnx0d50AUZkQlDkSLXqahPxLvRNN7ZWmwes3RJsoguAw==
X-Received: by 2002:a05:6000:1f98:b0:236:a920:73e8 with SMTP id bw24-20020a0560001f9800b00236a92073e8mr8706251wrb.5.1668452474695;
        Mon, 14 Nov 2022 11:01:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c7-20020a1c3507000000b003c6f1732f65sm18091811wma.38.2022.11.14.11.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 11:01:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/8] glib-2.0: update 2.72.3 -> 2.74.1
Date: Mon, 14 Nov 2022 20:00:50 +0100
Message-Id: <20221114190056.2612669-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114190056.2612669-1-alex@linutronix.de>
References: <20221114190056.2612669-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 19:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173255

Patches:
0001-Do-not-ignore-return-value-of-write.patch
merged upstream

Enable-more-tests-while-cross-compiling.patch
replaced with a request to upstream to solve
this correctly with meson's exe_wrapper:
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067
https://github.com/mesonbuild/meson/issues/11029

License-update: formatting

Make needed adjustments to ptests.

Backport a couple of patches to address musl failures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-Do-not-ignore-return-value-of-write.patch |  39 ------
 ...t-write-bindir-into-pkg-config-files.patch |  14 +-
 ...-correctly-when-building-with-mingw3.patch |  46 +++----
 ...-info-don-t-assume-million-in-one-ev.patch |  23 ++--
 ...build-do-not-use-can_run_host_binari.patch |  48 +++++++
 ...ble-more-tests-while-cross-compiling.patch | 123 ------------------
 .../glib-2.0/glib-2.0/cpp-null.patch          |  77 +++++++++++
 .../glib-2.0/glib-2.0/cpp-null2.patch         |  31 +++++
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   8 +-
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest |   1 +
 ...{glib-2.0_2.72.3.bb => glib-2.0_2.74.1.bb} |   7 +-
 meta/recipes-core/glib-2.0/glib.inc           |  16 ++-
 12 files changed, 208 insertions(+), 225 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.3.bb => glib-2.0_2.74.1.bb} (90%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
deleted file mode 100644
index f3a0069633..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-ignore-return-value-of-write.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 658c034d92027dc8af5f784cae852123fac79b19 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 16 Apr 2016 13:28:59 -0700
-Subject: [PATCH] Do not ignore return value of write()
-
-gcc warns about ignoring return value when compiling
-with fortify turned on.
-
-assert when write() fails
-
-Upstream-Status: Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- glib/tests/unix.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/glib/tests/unix.c b/glib/tests/unix.c
-index 7639d06..f941141 100644
---- a/glib/tests/unix.c
-+++ b/glib/tests/unix.c
-@@ -33,14 +33,15 @@ test_pipe (void)
-   GError *error = NULL;
-   int pipefd[2];
-   char buf[1024];
--  gssize bytes_read;
-+  gssize bytes_read, bytes_written;
-   gboolean res;
- 
-   res = g_unix_open_pipe (pipefd, FD_CLOEXEC, &error);
-   g_assert (res);
-   g_assert_no_error (error);
- 
--  write (pipefd[1], "hello", sizeof ("hello"));
-+  bytes_written = write (pipefd[1], "hello", sizeof ("hello"));
-+  g_assert (bytes_written != -1 && "write() failed");
-   memset (buf, 0, sizeof (buf));
-   bytes_read = read (pipefd[0], buf, sizeof(buf) - 1);
-   g_assert_cmpint (bytes_read, >, 0);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 5fe3aa898e..9bdd99d8a2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 0797a40627a4cb5439a24b872edc65356dceaaf0 Mon Sep 17 00:00:00 2001
+From 4a41bf7b050168726cc4fad4c1c72fc7c18ab779 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
@@ -16,16 +16,16 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 532b086..98468a3 100644
+index 36b5bad..137e75a 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -820,14 +820,14 @@ pkg.generate(libgio,
+@@ -862,14 +862,14 @@ pkg.generate(libgio,
                 'schemasdir=' + join_paths('${datadir}', schemas_subdir),
                 'bindir=' + join_paths('${prefix}', get_option('bindir')),
                 'giomoduledir=' + pkgconfig_giomodulesdir,
 -               'gio=' + join_paths('${bindir}', 'gio'),
--               'gio_querymodules=' + join_paths('${bindir}', 'gio-querymodules'),
--               'glib_compile_schemas=' + join_paths('${bindir}', 'glib-compile-schemas'),
+-               'gio_querymodules=@0@'.format(pkgconfig_multiarch_bindir / 'gio-querymodules'),
+-               'glib_compile_schemas=@0@'.format(pkgconfig_multiarch_bindir / 'glib-compile-schemas'),
 -               'glib_compile_resources=' + join_paths('${bindir}', 'glib-compile-resources'),
 -               'gdbus=' + join_paths('${bindir}', 'gdbus'),
 -               'gdbus_codegen=' + join_paths('${bindir}', 'gdbus-codegen'),
@@ -43,10 +43,10 @@ index 532b086..98468a3 100644
    install_dir : glib_pkgconfigreldir,
    filebase : 'gio-2.0',
 diff --git a/glib/meson.build b/glib/meson.build
-index aaf5f00..1e0992b 100644
+index c365901..c3d6601 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -375,9 +375,9 @@ pkg.generate(libglib,
+@@ -397,9 +397,9 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
index 59de3fa969..2e1e2313e8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
@@ -1,31 +1,31 @@
-From 4f327be49fd6ac5a77da6e48459b37f37a601977 Mon Sep 17 00:00:00 2001
+From ba1728bc27c88597164957d000b70ec4be6edf28 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 13 Feb 2019 15:32:05 +0100
 Subject: [PATCH] Set host_machine correctly when building with mingw32
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  gio/tests/meson.build  | 8 ++++----
  glib/tests/meson.build | 2 +-
  meson.build            | 3 +++
- tests/meson.build      | 2 +-
- 4 files changed, 9 insertions(+), 6 deletions(-)
+ 3 files changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index abe676767c60..34b347815308 100644
+index f644aa2..64a8684 100644
 --- a/gio/tests/meson.build
 +++ b/gio/tests/meson.build
-@@ -27,7 +27,7 @@ if build_machine.system() == 'linux'
-   endif # libutil.length() > 0
- endif # build_machine.system() == 'linux'
+@@ -29,7 +29,7 @@ endif
+ 
+ test_cpp_args = test_c_args
  
 -if host_machine.system() == 'windows'
 +if host_system == 'windows'
    common_gio_tests_deps += [iphlpapi_dep, winsock2, cc.find_library ('secur32')]
  endif
  
-@@ -176,7 +176,7 @@ else
+@@ -210,7 +210,7 @@ if have_dbus_daemon
  endif
  
  #  Test programs buildable on UNIX only
@@ -33,8 +33,8 @@ index abe676767c60..34b347815308 100644
 +if host_system != 'windows'
    gio_tests += {
      'file' : {},
-     'gdbus-peer' : {
-@@ -434,7 +434,7 @@ if host_machine.system() != 'windows'
+     'gdbus-peer-object-manager' : {},
+@@ -462,7 +462,7 @@ if host_machine.system() != 'windows'
  endif # unix
  
  #  Test programs buildable on Windows only
@@ -43,7 +43,7 @@ index abe676767c60..34b347815308 100644
    gio_tests += {'win32-streams' : {}}
  endif
  
-@@ -504,7 +504,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
+@@ -532,7 +532,7 @@ if cc.get_id() != 'msvc' and cc.get_id() != 'clang-cl'
    }
  endif
  
@@ -53,10 +53,10 @@ index abe676767c60..34b347815308 100644
      'gdbus-example-unix-fd-client' : {
        'install' : false,
 diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index a0c64afe6ae9..48407f99569c 100644
+index db01b54..6950817 100644
 --- a/glib/tests/meson.build
 +++ b/glib/tests/meson.build
-@@ -151,7 +151,7 @@ if glib_conf.has('HAVE_EVENTFD')
+@@ -188,7 +188,7 @@ if glib_conf.has('HAVE_EVENTFD')
    }
  endif
  
@@ -66,10 +66,10 @@ index a0c64afe6ae9..48407f99569c 100644
      glib_tests += {
        'gpoll' : {
 diff --git a/meson.build b/meson.build
-index e0b14319fb58..f6756a3c7dfb 100644
+index 43bb468..5f9b59c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -54,6 +54,9 @@ else
+@@ -43,6 +43,9 @@ else
  endif
  
  host_system = host_machine.system()
@@ -79,19 +79,3 @@ index e0b14319fb58..f6756a3c7dfb 100644
  
  if host_system == 'darwin'
    ios_test_code = '''#include <TargetConditionals.h>
-diff --git a/tests/meson.build b/tests/meson.build
-index 5ff99a4a8258..8a4dad0ccae7 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -53,7 +53,7 @@ test_extra_programs = {
-   'assert-msg-test' : {},
- }
- 
--if host_machine.system() != 'windows'
-+if host_system != 'windows'
-   tests += {
-     'timeloop' : {},
-   }
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
index c33fa88a76..57ada66907 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
@@ -1,10 +1,11 @@
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 14838522a706ebdcc3cdab661d4c368099fe3a4e Mon Sep 17 00:00:00 2001
+From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Tue, 6 Jul 2021 19:26:03 +0100
 Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one events
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
  don't happen
 
 The access and creation time tests create a file, gets the time in
@@ -20,15 +21,16 @@ Change the test to simply assert that the difference not negative to
 handle this case.
 
 This is the same fix as 289f8b, but that was just modification time.
+
 ---
  gio/tests/g-file-info.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
-index 59411c3a8..a213e4b92 100644
+index d9ad045..c9b12b0 100644
 --- a/gio/tests/g-file-info.c
 +++ b/gio/tests/g-file-info.c
-@@ -239,7 +239,7 @@ test_g_file_info_access_time (void)
+@@ -307,7 +307,7 @@ test_g_file_info_access_time (void)
    g_assert_nonnull (dt_usecs);
  
    ts = g_date_time_difference (dt_usecs, dt);
@@ -36,8 +38,8 @@ index 59411c3a8..a213e4b92 100644
 +  g_assert_cmpint (ts, >=, 0);
    g_assert_cmpint (ts, <, G_USEC_PER_SEC);
  
-   /* Try round-tripping the access time. */
-@@ -316,7 +316,7 @@ test_g_file_info_creation_time (void)
+   /* Try again with nanosecond precision. */
+@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void)
    g_assert_nonnull (dt_usecs);
  
    ts = g_date_time_difference (dt_usecs, dt);
@@ -45,7 +47,4 @@ index 59411c3a8..a213e4b92 100644
 +  g_assert_cmpint (ts, >=, 0);
    g_assert_cmpint (ts, <, G_USEC_PER_SEC);
  
-   /* Try round-tripping the creation time. */
--- 
-2.34.1
-
+   /* Try again with nanosecond precision. */
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
new file mode 100644
index 0000000000..db08b5af55
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
@@ -0,0 +1,48 @@
+From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 11 Nov 2022 13:12:42 +0100
+Subject: [PATCH] tests/meson.build: do not use can_run_host_binaries()
+
+can_run_host_binaries() returns true even when cross compiling,
+if there is an executable wrapper defined that can run
+cross-binaries under some kind of emulation.
+
+Unfortunately, custom_target() will not use the wrapper
+and will attempt to execute the command directly. Until
+this is addressed in meson upstream, we have to disable
+these targets in cross scenarios.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ gio/tests/meson.build  | 2 +-
+ glib/tests/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gio/tests/meson.build b/gio/tests/meson.build
+index 49cfa25ce..ea59656f9 100644
+--- a/gio/tests/meson.build
++++ b/gio/tests/meson.build
+@@ -652,7 +652,7 @@ if installed_tests_enabled
+   endforeach
+ endif
+ 
+-if meson.can_run_host_binaries()
++if not meson.is_cross_build()
+ 
+   compiler_type = '--compiler=@0@'.format(cc.get_id())
+ 
+diff --git a/glib/tests/meson.build b/glib/tests/meson.build
+index 69508178e..e4f75f302 100644
+--- a/glib/tests/meson.build
++++ b/glib/tests/meson.build
+@@ -411,7 +411,7 @@ executable('testing-helper', 'testing-helper.c',
+ )
+ 
+ # some testing of gtester functionality
+-if meson.can_run_host_binaries() and host_system != 'windows'
++if not meson.is_cross_build() and host_system != 'windows'
+   xmllint = find_program('xmllint', required: false)
+   if xmllint.found()
+     tmpsample_xml = custom_target('tmpsample.xml',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
deleted file mode 100644
index f5c161fe04..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 1f3c05529c0c9032ae0a289fb1f088b7541fc9b0 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 9 Nov 2015 11:07:27 +0200
-Subject: [PATCH] Enable more tests while cross-compiling
-
-Upstream disables a few tests while cross-compiling because their build requires
-running other built binaries. This usually makes sense but in the cross-compile
-case we can depend on glib-2.0-native.
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- gio/tests/meson.build | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 3ed23a5..5df932a 100644
---- a/gio/tests/meson.build
-+++ b/gio/tests/meson.build
-@@ -253,7 +253,7 @@ if host_machine.system() != 'windows'
-     }
-   endif
- 
--  if have_dbus_daemon
-+  if true
-     annotate_args = [
-       '--annotate', 'org.project.Bar', 'Key1', 'Value1',
-       '--annotate', 'org.project.Bar', 'org.gtk.GDBus.Internal', 'Value2',
-@@ -603,14 +603,14 @@ if installed_tests_enabled
-   endforeach
- endif
- 
--if not meson.is_cross_build() or meson.has_exe_wrapper()
-+if meson.is_cross_build()
- 
-   compiler_type = '--compiler=@0@'.format(cc.get_id())
- 
-   plugin_resources_c = custom_target('plugin-resources.c',
-     input : 'test4.gresource.xml',
-     output : 'plugin-resources.c',
--    command : [glib_compile_resources,
-+    command : ['glib-compile-resources',
-                compiler_type,
-                '--target=@OUTPUT@',
-                '--sourcedir=' + meson.current_source_dir(),
-@@ -636,7 +636,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   test_gresource = custom_target('test.gresource',
-     input : 'test.gresource.xml',
-     output : 'test.gresource',
--    command : [glib_compile_resources,
-+    command : ['glib-compile-resources',
-                compiler_type,
-                '--target=@OUTPUT@',
-                '--sourcedir=' + meson.current_source_dir(),
-@@ -649,7 +649,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   test_resources2_c = custom_target('test_resources2.c',
-     input : 'test3.gresource.xml',
-     output : 'test_resources2.c',
--    command : [glib_compile_resources,
-+    command : ['glib-compile-resources',
-                compiler_type,
-                '--target=@OUTPUT@',
-                '--sourcedir=' + meson.current_source_dir(),
-@@ -662,7 +662,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   test_resources2_h = custom_target('test_resources2.h',
-     input : 'test3.gresource.xml',
-     output : 'test_resources2.h',
--    command : [glib_compile_resources,
-+    command : ['glib-compile-resources',
-                compiler_type,
-                '--target=@OUTPUT@',
-                '--sourcedir=' + meson.current_source_dir(),
-@@ -676,7 +676,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-     input : 'test2.gresource.xml',
-     depends : big_test_resource,
-     output : 'test_resources.c',
--    command : [glib_compile_resources,
-+    command : ['glib-compile-resources',
-                compiler_type,
-                '--target=@OUTPUT@',
-                '--sourcedir=' + meson.current_source_dir(),
-@@ -689,7 +689,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   digit_test_resources_c = custom_target('digit_test_resources.c',
-     input : '111_digit_test.gresource.xml',
-     output : 'digit_test_resources.c',
--    command : [glib_compile_resources,
-+    command : ['glib-compile-resources',
-                compiler_type,
-                '--target=@OUTPUT@',
-                '--sourcedir=' + meson.current_source_dir(),
-@@ -702,7 +702,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-   digit_test_resources_h = custom_target('digit_test_resources.h',
-     input : '111_digit_test.gresource.xml',
-     output : 'digit_test_resources.h',
--    command : [glib_compile_resources,
-+    command : ['glib-compile-resources',
-                compiler_type,
-                '--target=@OUTPUT@',
-                '--sourcedir=' + meson.current_source_dir(),
-@@ -744,11 +744,11 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
- 
-   ld = find_program('ld', required : false)
- 
--  if build_machine.system() == 'linux' and objcopy.found() and objcopy_supports_add_symbol and ld.found()
-+  if not meson.is_cross_build()
-     test_gresource_binary = custom_target('test5.gresource',
-       input : 'test5.gresource.xml',
-       output : 'test5.gresource',
--      command : [glib_compile_resources,
-+      command : ['glib-compile-resources',
-                  compiler_type,
-                  '--target=@OUTPUT@',
-                  '--sourcedir=' + meson.current_source_dir(),
-@@ -762,7 +762,7 @@ if not meson.is_cross_build() or meson.has_exe_wrapper()
-     test_resources_binary_c = custom_target('test_resources_binary.c',
-       input : 'test5.gresource.xml',
-       output : 'test_resources_binary.c',
--      command : [glib_compile_resources,
-+      command : ['glib-compile-resources',
-                  compiler_type,
-                  '--target=@OUTPUT@',
-                  '--sourcedir=' + meson.current_source_dir(),
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
new file mode 100644
index 0000000000..63cbf90ab2
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
@@ -0,0 +1,77 @@
+From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Sat, 29 Oct 2022 04:30:52 +0200
+Subject: [PATCH] glib/gmacros: Always define NULL as nullptr in C++11 and
+ newer
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ glib/gmacros.h     |  9 ++++++++-
+ glib/tests/cxx.cpp | 13 -------------
+ 2 files changed, 8 insertions(+), 14 deletions(-)
+
+diff --git a/glib/gmacros.h b/glib/gmacros.h
+index 5302841105..9fe8270822 100644
+--- a/glib/gmacros.h
++++ b/glib/gmacros.h
+@@ -870,10 +870,17 @@
+  */
+ #ifndef NULL
+ #  ifdef __cplusplus
+-#  define NULL        (0L)
++#    if __cplusplus >= 201103L
++#      define NULL (nullptr)
++#    else
++#      define NULL (0L)
++#    endif /* __cplusplus >= 201103L */
+ #  else /* !__cplusplus */
+ #  define NULL        ((void*) 0)
+ #  endif /* !__cplusplus */
++#elif defined (__cplusplus) && __cplusplus >= 201103L
++#  undef NULL
++#  define NULL (nullptr)
+ #endif
+ 
+ #ifndef	FALSE
+diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
+index 6ac60791c8..045457c6e2 100644
+--- a/glib/tests/cxx.cpp
++++ b/glib/tests/cxx.cpp
+@@ -34,21 +34,12 @@ test_typeof (void)
+   MyObject *obj3 = g_atomic_pointer_get (&obj2);
+   g_assert_true (obj3 == obj);
+ 
+-#if __cplusplus >= 201103L
+-  MyObject *obj4 = nullptr;
+-#else
+   MyObject *obj4 = NULL;
+-#endif
+   g_atomic_pointer_set (&obj4, obj3);
+   g_assert_true (obj4 == obj);
+ 
+-#if __cplusplus >= 201103L
+-  MyObject *obj5 = nullptr;
+-  g_atomic_pointer_compare_and_exchange (&obj5, nullptr, obj4);
+-#else
+   MyObject *obj5 = NULL;
+   g_atomic_pointer_compare_and_exchange (&obj5, NULL, obj4);
+-#endif
+   g_assert_true (obj5 == obj);
+ 
+   MyObject *obj6 = g_steal_pointer (&obj5);
+@@ -195,11 +186,7 @@ test_steal_pointer (void)
+ int
+ main (int argc, char *argv[])
+ {
+-#if __cplusplus >= 201103L
+-  g_test_init (&argc, &argv, nullptr);
+-#else
+   g_test_init (&argc, &argv, NULL);
+-#endif
+ 
+   g_test_add_func ("/C++/typeof", test_typeof);
+   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
+-- 
+GitLab
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
new file mode 100644
index 0000000000..763d5ce539
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
@@ -0,0 +1,31 @@
+From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Sat, 29 Oct 2022 04:16:00 +0200
+Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a pointer
+ type
+
+Otherwise it may not be recognized as valid sentinel
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ glib/tests/cxx.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
+index 045457c6e2..aa5e0cb576 100644
+--- a/glib/tests/cxx.cpp
++++ b/glib/tests/cxx.cpp
+@@ -186,7 +186,11 @@ test_steal_pointer (void)
+ int
+ main (int argc, char *argv[])
+ {
++#if __cplusplus >= 201103L
+   g_test_init (&argc, &argv, NULL);
++#else
++  g_test_init (&argc, &argv, static_cast<void *>(NULL));
++#endif
+ 
+   g_test_add_func ("/C++/typeof", test_typeof);
+   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
+-- 
+GitLab
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index c0114397d8..7723ac6672 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 9a66887179d28d696562dcac43ad05d67580cfdb Mon Sep 17 00:00:00 2001
+From 0da0b608fdbb144c39225233cbdd89995b76904b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,10 +19,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 2a043cc..e2d2310 100644
+index f5dbb4555..c926e77a8 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -56,6 +56,8 @@
+@@ -58,6 +58,8 @@
  #ifdef G_OS_WIN32
  #include "gregistrysettingsbackend.h"
  #include "giowin32-priv.h"
@@ -31,7 +31,7 @@ index 2a043cc..e2d2310 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1267,7 +1269,15 @@ get_gio_module_dir (void)
+@@ -1261,7 +1263,15 @@ get_gio_module_dir (void)
                                       NULL);
        g_free (install_dir);
  #else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
index 7a231b514b..c476d67310 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
@@ -5,5 +5,6 @@ if id -u glib2-test; then
    userdel glib2-test
 fi
 useradd glib2-test
+cd /tmp
 su glib2-test -c 'gnome-desktop-testing-runner glib'
 userdel glib2-test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb
similarity index 90%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb
index b5ab6502a3..8fd785a7fd 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.1.bb
@@ -7,20 +7,21 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
-           file://Enable-more-tests-while-cross-compiling.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
-           file://0001-Do-not-ignore-return-value-of-write.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch \
+           file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch \
+           file://cpp-null.patch \
+           file://cpp-null2.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "4a39a2f624b8512d500d5840173eda7fa85f51c109052eae806acece85d345f0"
+SRC_URI[sha256sum] = "0ab981618d1db47845e56417b0d7c123f81a3427b2b9c93f5a46ff5bbb964964"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ffddefe22e..843b6bd29b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -5,10 +5,10 @@ HOMEPAGE = "https://developer.gnome.org/glib/"
 # pcre is under BSD;
 # docs/reference/COPYING is with a 'public domain'-like license!
 LICENSE = "LGPL-2.1-or-later & BSD-3-Clause & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://glib/glib.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
-                    file://gmodule/COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=b88abb7f3ad09607e71cb9d530155906 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5 \
+                    file://glib/glib.h;beginline=4;endline=17;md5=72f7cc2847407f65d8981ef112e4e630 \
+                    file://LICENSES/LGPL-2.1-or-later.txt;md5=41890f71f740302b785c27661123bff5 \
+                    file://gmodule/gmodule.h;beginline=4;endline=17;md5=72f7cc2847407f65d8981ef112e4e630 \
                     file://docs/reference/COPYING;md5=f51a5100c17af6bae00735cd791e1fcc"
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
@@ -21,7 +21,7 @@ DEPENDS = "glib-2.0-native \
            virtual/libintl \
            virtual/libiconv \
            libffi \
-           libpcre \
+           libpcre2 \
            zlib"
 
 PACKAGES += "${PN}-codegen ${PN}-utils"
@@ -45,7 +45,7 @@ PACKAGECONFIG[libelf] = ",,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
 
-EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false"
+EXTRA_OEMESON = "-Ddtrace=false -Dsystemtap=false"
 
 do_configure:prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
@@ -54,6 +54,7 @@ do_configure:prepend() {
 FILES:${PN} = "${libdir}/lib*${SOLIBS} \
                ${libdir}/gio \
                ${libexecdir}/*gio-querymodules \
+               ${libexecdir}/*gio-launch-desktop \
                ${datadir}/glib-2.0/schemas"
 
 FILES:${PN}-utils += "${bindir}/glib-genmarshal \
@@ -130,6 +131,8 @@ do_install:append:class-target () {
                 mv ${D}${datadir}/installed-tests/glib/static-link.test ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
         fi
 	fi
+        # https://gitlab.gnome.org/GNOME/glib/-/issues/2810
+        rm -f ${D}${datadir}/installed-tests/glib/thread-pool-slow.test
 }
 
 # As we do not build python3 for windows, makes no sense to ship the script that's using it
@@ -148,6 +151,7 @@ RDEPENDS:${PN}-ptest += "\
             coreutils \
             libgcc \
             dbus \
+            desktop-file-utils \
             gnome-desktop-testing \
             tzdata \
             tzdata-americas \
-- 
2.30.2


