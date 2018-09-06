Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 36023795D2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:57 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id f4-v6so8498494edq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5GUgMrVj2/tdpthvzl1DzDCa6q3Ptfvp3fWT2OXrDdc=;
	b=rQcYt2QPZhE8/WSRkNdlLFRCmUlYDmn7haJqzVfLF8o6W9RLlCnI0TogwoSoJeahic
	eHzt43c6QORFzQUo7PfcYAkuK6WccJJKbYomJnuCtfvwT88BjdfxkkvmmNAzjTGPWalP
	cfExs+hJFWfFVRR+MEEBYS/qm476Y153zW80crAc6FZzZwg4s1148qm0rkJvSFSLcE48
	dZLP2ymqLJhxYTdxyYF3DqiF4SghWhv3HLBvm2En91iYi669/6jx+wEFPiXn7iLSkGv5
	XwENgmiHNj/StpVFKztSqzHTmg4BqSS4a7JLbvBiwKdbVoMKevuzqXSb2OXhuFQQzOJ5
	DFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5GUgMrVj2/tdpthvzl1DzDCa6q3Ptfvp3fWT2OXrDdc=;
	b=EZV2LJN55Yq9UZUyYD31VCIjohaQ1Vx5A8soaGFXWwepNqBczQXM2iOzQzFhUSdUxT
	1GQC2Sds7xAbpsZc7i8AG8j4Ly16X65ouchQiVJKdTG+Ya0xm3g77vtgfEn4LjE0Ue6a
	ZsB1hkmG+sfCz66O06SAzdLaSikgV1As15eAHn8Kx5g4HboDHJ9OLhCRKJ9yt1HsPZXg
	+Qc0yeq5diDFNGq9oDJiPwpCAd268pbsHqPJtdp/ICHTClX5j+QCZNwRQXgJXXZ26Bmo
	apKT3z/mshTeaGZqi1C27WpwxU9TORm3PXsA6whW8L3wTmpTCNhNFMeE+B1oANmbgVPz
	+iyA==
X-Gm-Message-State: APzg51DrdpWORzlUwiRo+dHZMFCIOT9rbOUjHwccfEjUtvmvrLPQRQNY
	qbIsxLm+G9WNtSbp8lnCoFhJkQaaYVA=
X-Google-Smtp-Source: ANB0VdbD+bYVg5OQiEEDP3FUlBsVM2qbS0b5q44VlD23vX52l6KiTFQOIY1FlDTPmY490+nS2kj3Eg==
X-Received: by 2002:a50:f419:: with SMTP id
	r25-v6mr2845177edm.226.1536230457618; 
	Thu, 06 Sep 2018 03:40:57 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:35 +0200
Message-Id: <1536230436-30342-20-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 20/21] glib: update to 2.58.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 10:40:57 -0000

Drop upstreamed patches, refresh the rest.
Add an explicit dependency on gettext-native, as glib is no longer
fooled by setting msgfmt to /bin/false.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...stall-gio-querymodules-as-libexec_PROGRAM.patch | 14 ++---
 ...st-for-pthread_getname_np-before-using-it.patch | 70 ----------------------
 ...s-Ignore-other-per-value-options-than-ski.patch | 32 ----------
 .../Enable-more-tests-while-cross-compiling.patch  | 29 ++++-----
 ...un-media-sdX-drive-mount-if-username-root.patch | 16 +++--
 .../glib-2.0/glib-2.0/relocate-modules.patch       |  6 +-
 .../{glib-2.0_2.56.1.bb => glib-2.0_2.58.0.bb}     |  6 +-
 meta/recipes-core/glib-2.0/glib.inc                |  4 +-
 8 files changed, 32 insertions(+), 145 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.56.1.bb => glib-2.0_2.58.0.bb} (72%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 561d100..97d0aff 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 80682c171ccb27d01343d4cfcfb4dd49b7863ccc Mon Sep 17 00:00:00 2001
+From 856045927b9ab391165c0ebabf401835f8439eab Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -8,24 +8,22 @@ renamer does not cope with library packages with files in ${bindir}
 
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Upstream-Status: Inappropriate [OE specific]
+
 ---
  gio/Makefile.am | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/gio/Makefile.am b/gio/Makefile.am
-index b7f91cc..4d81cc0 100644
+index e14cad2..bf2bcc7 100644
 --- a/gio/Makefile.am
 +++ b/gio/Makefile.am
-@@ -702,7 +702,8 @@ gio.def: libgio-2.0.la
+@@ -835,7 +835,8 @@ gio.def: libgio-2.0.la
  gio-2.0.lib: libgio-2.0.la gio.def
  	$(AM_V_GEN) lib.exe -machine:@LIB_EXE_MACHINE_FLAG@ -name:libgio-2.0-$(LT_CURRENT_MINUS_AGE).dll -def:$(builddir)/gio.def -out:$@
  
--bin_PROGRAMS = gio-querymodules glib-compile-schemas glib-compile-resources gsettings
-+bin_PROGRAMS = glib-compile-schemas glib-compile-resources gsettings
+-bin_PROGRAMS = gio-querymodules glib-compile-schemas glib-compile-resources gsettings gio-launch-desktop
++bin_PROGRAMS = glib-compile-schemas glib-compile-resources gsettings gio-launch-desktop
 +libexec_PROGRAMS = gio-querymodules
  
  glib_compile_resources_LDADD = libgio-2.0.la 		\
  	$(top_builddir)/gobject/libgobject-2.0.la	\
--- 
-2.1.4
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch
deleted file mode 100644
index c6e4966..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From f627fe16099a2b08d8b4e9023ae6b4f352451967 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Nov 2016 08:59:08 -0800
-Subject: [PATCH] Test for pthread_getname_np before using it
-
-Its a GNU extention and not all libc implement it
-musl e.g. implements the setname API but not getname
-in any case, it seems to be safer to check for the
-function before using it.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- config.h.in         |  3 +++
- configure.ac        | 10 ++++++++++
- glib/tests/thread.c |  2 +-
- 3 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/config.h.in b/config.h.in
-index 2c35ff1..da7ac30 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -326,6 +326,9 @@
- #undef HAVE_PTHREAD_COND_TIMEDWAIT_RELATIVE_NP
- 
- /* Have function pthread_setname_np(const char*) */
-+#undef HAVE_PTHREAD_GETNAME_NP
-+
-+/* Have function pthread_setname_np(const char*) */
- #undef HAVE_PTHREAD_SETNAME_NP_WITHOUT_TID
- 
- /* Have function pthread_setname_np(pthread_t, const char*) */
-diff --git a/configure.ac b/configure.ac
-index 4309671..209770a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2121,6 +2121,16 @@ AS_IF([ test x"$have_threads" = xposix], [
-              AC_DEFINE(HAVE_PTHREAD_COND_TIMEDWAIT_RELATIVE_NP,1,
-                 [Have function pthread_cond_timedwait_relative_np])],
-             [AC_MSG_RESULT(no)])
-+        dnl gets thread names
-+        AC_MSG_CHECKING(for pthread_getname_np(pthread_t, char*, size_t))
-+        AC_LINK_IFELSE(
-+            [AC_LANG_PROGRAM(
-+                [#include <pthread.h>],
-+                [pthread_getname_np(pthread_self(),"example",0)])],
-+            [AC_MSG_RESULT(yes)
-+             AC_DEFINE(HAVE_PTHREAD_GETNAME_NP,1,
-+                [Have function pthread_setname_np(const char*)])],
-+            [AC_MSG_RESULT(no)])
-         dnl Sets thread names on OS X 10.6, iOS 3.2 (and higher)
-         AC_MSG_CHECKING(for pthread_setname_np(const char*))
-         AC_LINK_IFELSE(
-diff --git a/glib/tests/thread.c b/glib/tests/thread.c
-index 5447836..2f248a6 100644
---- a/glib/tests/thread.c
-+++ b/glib/tests/thread.c
-@@ -174,7 +174,7 @@ test_thread5 (void)
- static gpointer
- thread6_func (gpointer data)
- {
--#ifdef HAVE_PTHREAD_SETNAME_NP_WITH_TID
-+#if defined(HAVE_PTHREAD_SETNAME_NP_WITH_TID) && defined(HAVE_PTHREAD_GETNAME_NP)
-   char name[16];
- 
-   pthread_getname_np (pthread_self(), name, 16);
--- 
-2.10.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch
deleted file mode 100644
index c87635a..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 12ffb50d587003a46678567b771c6e984035a5e9 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sat, 28 Apr 2018 03:07:50 +0200
-Subject: [PATCH] glib-mkenums: Ignore other per value options than 'skip' and
- 'nick'
-
-If some other per value option was present than 'skip' or 'nick' then
-a KeyError would occur. Ignoring such options matches the behaviour of
-the old, Perl-based glib-mkenums.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=795008]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- gobject/glib-mkenums.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index fe9a10756..4ccc1f458 100755
---- a/gobject/glib-mkenums.in
-+++ b/gobject/glib-mkenums.in
-@@ -218,7 +218,7 @@ def parse_entries(file, file_name):
-             if options is not None:
-                 options = parse_trigraph(options)
-                 if 'skip' not in options:
--                    entries.append((name, value, options['nick']))
-+                    entries.append((name, value, options.get('nick', None)))
-             else:
-                 entries.append((name, value))
-         elif re.match(r's*\#', line):
--- 
-2.12.0
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index b98f933..50781e7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -1,7 +1,7 @@
-From d762907d33b81cf7469b5696c87f2188d2050afb Mon Sep 17 00:00:00 2001
+From 4b1a6d247c78125096a6ea5ab3cab8a1f000dc23 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 9 Nov 2015 11:07:27 +0200
-Subject: [PATCH 06/10] Enable more tests while cross-compiling
+Subject: [PATCH] Enable more tests while cross-compiling
 
 Upstream disables a few tests while cross-compiling because their build requires
 running other built binaries. This usually makes sense but in the cross-compile
@@ -16,10 +16,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  2 files changed, 11 insertions(+), 7 deletions(-)
 
 diff --git a/gio/tests/Makefile.am b/gio/tests/Makefile.am
-index acc1da4..9176640 100644
+index 1f0bed7..8295deb 100644
 --- a/gio/tests/Makefile.am
 +++ b/gio/tests/Makefile.am
-@@ -516,10 +516,9 @@ test_programs += \
+@@ -550,10 +550,9 @@ test_programs += \
  endif
  
  # -----------------------------------------------------------------------------
@@ -32,7 +32,7 @@ index acc1da4..9176640 100644
  test_programs += resources
  resources_SOURCES = resources.c
  nodist_resources_SOURCES = test_resources.c test_resources2.c test_resources2.h
-@@ -543,7 +542,11 @@ if !ENABLE_INSTALLED_TESTS
+@@ -578,7 +577,11 @@ if !ENABLE_INSTALLED_TESTS
  libresourceplugin_la_LDFLAGS += -rpath /
  endif
  
@@ -44,7 +44,7 @@ index acc1da4..9176640 100644
  
  test-generated.txt: test1.txt
  	$(AM_V_GEN) echo "Generated" > $@ && \
-@@ -564,7 +567,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
+@@ -599,7 +602,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
  
  EXTRA_DIST += test.gresource.xml test1.txt test2.gresource.xml test2.txt test3.gresource.xml test3.txt test4.gresource.xml
  CLEANFILES += test-generated.txt test_resources.c test_resources2.[ch] plugin_resources.c test.gresource
@@ -53,10 +53,10 @@ index acc1da4..9176640 100644
  BUILT_SOURCES += giotypefuncs.inc
  
 diff --git a/tests/gobject/Makefile.am b/tests/gobject/Makefile.am
-index 656941d..68555ff 100644
+index 0e60987..927d13a 100644
 --- a/tests/gobject/Makefile.am
 +++ b/tests/gobject/Makefile.am
-@@ -48,10 +48,13 @@ if ENABLE_TIMELOOP
+@@ -51,10 +51,13 @@ if ENABLE_TIMELOOP
  installed_test_programs += timeloop-closure
  endif
  
@@ -72,14 +72,9 @@ index 656941d..68555ff 100644
  
  testmarshal.h: stamp-testmarshal.h
  	@true
-@@ -69,7 +72,6 @@ BUILT_SOURCES += testmarshal.h testmarshal.c
- CLEANFILES += stamp-testmarshal.h
+@@ -71,4 +74,3 @@ testmarshal.c: testmarshal.h testmarshal.list $(glib_genmarshal)
+ BUILT_SOURCES += testmarshal.h testmarshal.c
+ CLEANFILES += stamp-testmarshal.h testmarshal.h testmarshal.c
  EXTRA_DIST += testcommon.h testmarshal.list
- BUILT_EXTRA_DIST += testmarshal.h testmarshal.c
 -endif # !CROSS_COMPILING
- 
- dist-hook: $(BUILT_EXTRA_DIST)
- 	files='$(BUILT_EXTRA_DIST)';				\
--- 
-2.14.1
-
+\ No newline at end of file
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch b/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
index 3d0c008..3040479 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
@@ -1,4 +1,4 @@
-From c53e94a520b573aa0dcf12903e9563fe8badc34c Mon Sep 17 00:00:00 2001
+From 66e5fd5e870a2de04ec0f0c5dbfa23db496bad43 Mon Sep 17 00:00:00 2001
 From: Marius Avram <marius.avram@intel.com>
 Date: Wed, 27 Aug 2014 12:10:41 +0300
 Subject: [PATCH] Allow /run/media/sdX drive mount if username root
@@ -14,17 +14,18 @@ graphical applications such as the File Manager (pcmanfm).
 Upstream-Status: Inappropriate
 
 Signed-off-by: Marius Avram <marius.avram@intel.com>
+
 ---
- gio/gunixmounts.c |    5 +++++
+ gio/gunixmounts.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/gio/gunixmounts.c b/gio/gunixmounts.c
-index 4999354..f6c1472 100644
+index 355329c..6467fc5 100644
 --- a/gio/gunixmounts.c
 +++ b/gio/gunixmounts.c
-@@ -2136,6 +2136,11 @@ g_unix_mount_guess_should_display (GUnixMountEntry *mount_entry)
-           mount_path[sizeof ("/run/media/") - 1 + user_name_len] == '/')
-         is_in_runtime_dir = TRUE;
+@@ -2745,6 +2745,11 @@ g_unix_mount_guess_should_display (GUnixMountEntry *mount_entry)
+             is_in_runtime_dir = TRUE;
+         }
  
 +      /* Allow no username in path in /run/media if current user is root */
 +      if (strcmp(user_name, "root") == 0 &&
@@ -34,6 +35,3 @@ index 4999354..f6c1472 100644
        if (is_in_runtime_dir || g_str_has_prefix (mount_path, "/media/"))
          {
            char *path;
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 0c8cbd7..f9794d3 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From c8fa58dc2e9322727ba21eafbe9a69a5f68ffd35 Mon Sep 17 00:00:00 2001
+From 8326961841f4d16c7239e747de11e3817c35cfd2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,7 +19,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 1ead84c..f744aa2 100644
+index 36c0cef..912e490 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -40,6 +40,8 @@
@@ -31,7 +31,7 @@ index 1ead84c..f744aa2 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1083,7 +1085,15 @@ get_gio_module_dir (void)
+@@ -1099,7 +1101,15 @@ get_gio_module_dir (void)
  #endif
        g_free (install_dir);
  #else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.56.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
similarity index 72%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.56.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
index 7bc437d..92c7997 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.56.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
@@ -13,12 +13,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
-           file://0001-Test-for-pthread_getname_np-before-using-it.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
-           file://0001-glib-mkenums-Ignore-other-per-value-options-than-ski.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "988af38524804ea1ae6bc9a2bad181ff"
-SRC_URI[sha256sum] = "40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d"
+SRC_URI[md5sum] = "9b5d21c802f55bf37171c4fbfe7d32d1"
+SRC_URI[sha256sum] = "c0f4ce0730b4f95c47b711613b5406a887c2ee13ea6d25930d72a4fa7fdb77f6"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d6d9133..6dab192 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -87,10 +87,10 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 CPPFLAGS_append_class-target_mips16e = " -DNVALGRIND=1"
 
 # GLib generally requires gettext to be present so for USE_NLS to yes.  For
-# native builds as i18n is disabled globally we can tell it to use a fake msgfmt.
+# native builds as i18n is disabled globally we have to add a gettext-native dependency.
 USE_NLS_class-target = "yes"
 USE_NLS_class-nativesdk = "yes"
-CACHED_CONFIGUREVARS_append_class-native = " ac_cv_path_MSGFMT=/bin/false"
+DEPENDS_append_class-native = " gettext-native"
 
 EXEEXT = ""
 EXEEXT_mingw32 = ".exe"
-- 
2.7.4


