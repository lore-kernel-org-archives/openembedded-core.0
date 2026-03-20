Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6E71093181
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:22:01 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7209.1773991319131553075
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TnR6oBy8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260320072156008a035cd40002073a-vjfvoe@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260320072156008a035cd40002073a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Mar 2026 08:21:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Cm2wq2MLRoZH83alv3yAZwrTpbEu8OU53qifzz0pRDU=;
 b=TnR6oBy8aSllWG/hScBcUogKcwsPs3lyW9SQcxgDecmwKAG8mMs3nOhrxSJ83LznwraeoX
 2Z5UzbSsj5GGP7mjtyru5nEoh8n/OUVgTBXDfyHzwhQH6FmfQAj558plff4zHLTLkPfZ13eU
 Rhd4Z83huh8uCa6TJ7mmZS8yEHv6F9wsInZO0bHR8vJHM9yIThpUImU/4MaAIVghE9u91Cqm
 IXQVgAy1b6OwB7IQGJcT98Qpv57jmZiNS3rgeex4GR3rh5SWe97Ke/mIWYpDyNZUCospvkYh
 PhenH0QzdPfR1LXTPCDbQiSqIGyOKIPXl3lmiCX+aSbY9WH97Im/S2kQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] glib-2.0: upgrade 2.86.4 -> 2.88.0
Date: Fri, 20 Mar 2026 08:30:31 +0100
Message-Id: <20260320073031.8449-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233582

Deleted patches included in this release.
Refreshed patches and resolved conflicts.
Reworked relocate-modules.patch because of upstream commit which moved
the code we were using into macos specific function, so get the code
back to place we need it.
* https://gitlab.gnome.org/GNOME/glib/-/commit/9adec080ab80787eb53ef4dafaa1561e31731a6a

Release notes with filtered "bugs fixed" and "translation updates":

Overview of changes in GLib 2.88.0, 2026-03-16
Overview of changes in GLib 2.87.5, 2026-03-12
* Brown paper bag release to attempt to fix the dist-job in CI; this caused it to be impossible to build a release archive for 2.87.4
Overview of changes in GLib 2.87.4, 2026-03-12
* Avoid installing broken symlinks as part of the test data for the gdatetime tests (!5054 (merged), work by Alessandro Astone)
* Fix g_file_set_contents() with non-ASCII filenames on Windows (#3873 (closed), work by Lukas K.)
Overview of changes in GLib 2.87.3, 2026-02-25
* Improved support for GNotification on Windows (#3867 (closed), #3869 (closed), work by Oscar Pernia Moreno)
* Fix module lookups via GModule on Cygwin (#3741 (closed), work by Ailin Nemui)
* Fix local timezone lookup with nested symlinks in /etc/localtime (#3816 (closed), work by Alessandro Astone)
* Fix ordering and sequential consistency of gatomic memory barriers on MSVC and fallback GCC code paths (#3829 (closed), #3852 (closed), work by Luca Bacci)
* Fix various integer overflow bugs (#3870 (closed), #3871 (closed), #3872 (closed), CVE-2026-1484, CVE-2026-1485, CVE-2026-1489, work by Marco Trevisan)
* Add GSocketControlMessage subclasses for receiving IP_TOS and IPV6_TCLASS (!4846 (merged), work by Jakub Adam)
* Support polling more than 1024 FDs on macOS (!4953 (merged), work by Ihar Hrachyshka)
* Remove platform-specific backward compatibility from GLib-2.0 as it’s impossible to support (#3839 (closed), !4881 (merged), work by Marco Trevisan)
* Improve introspection annotations for delimiters on g_strsplit_set() (this may require changes in introspection bindings)
* Basic support for building and running some functionality on tvOS and watchOS (!4992 (merged), work by Nirbheek Chauhan)
* Add g_get_monotonic_time() variant with nanosecond precision (!5004 (merged), work by Benjamin Otte)
Overview of changes in GLib 2.87.2, 2026-01-19
* Add initial support for GNotification on Windows (#3857 (closed), work by Oscar Pernia Moreno)
Overview of changes in GLib 2.87.1, 2025-12-30
* Several low-risk CVE fixes (#3827 (closed), #3834 (closed), #3845 (closed))
* Fix return type of gi_callable_info_get_closure_native_address() (#3859 (closed), work by Philip Chimento)
* Tweak thread pool handling for GTask threads to prevent stalls (#3840 (closed), work by Ignazio Pillai)
* Respect NO_COLOR environment variable in log output (!4898 (merged), work by Aaron Andersen)
* Update file system type lists to mark more file system types as system ones and to recognise ntfs3 file systems (!4916 (merged) and #3828 (closed), work by Christian Hergert and Alexander Schwinn)
* Add G_GNUC_FLAG_ENUM attribute to mark enums as flags (!4900 (merged), work by Philip Chimento)
* Add a static CRT constructor and fusion manifest XML for GLib utilities on Windows so that stderr can be unbuffered and streams are flushed on exit (#3733 (closed), work by Luca Bacci)
* Fix G_FILE_MONITOR_WATCH_HARD_LINKS on Windows (#3819 (closed), work by Jehan)
Overview of changes in GLib 2.87.0, 2025-11-03
* Update to Unicode 17.0.0 (!4793 (merged), work by Peng Wu)
* Support runtime extensions to gdbus-codegen tool to allow modifying its output in project-specific ways (!4812 (merged), work by Sebastian Wick)
* Use document portal to open all the URIs for snaps (!4822 (merged), work by Marco Trevisan)
* Add g_markup_parse_context_get_offset() API for getting error locations in XML files (!4879 (merged), work by Matthias Clasen)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...t-write-bindir-into-pkg-config-files.patch |  4 +-
 ...-gio-querymodules-as-libexec_PROGRAM.patch |  4 +-
 ...tetime-ptest-failure-with-glibc-2.43.patch | 78 -------------------
 ...on-Run-atomics-test-on-clang-as-well.patch |  2 +-
 ...ot-enable-pidfd-features-on-native-g.patch |  2 +-
 .../glib-2.0/files/CVE-2026-0988.patch        | 58 --------------
 .../glib-2.0/files/relocate-modules.patch     | 43 +++++-----
 ...l_2.86.4.bb => glib-2.0-initial_2.88.0.bb} |  0
 ...{glib-2.0_2.86.4.bb => glib-2.0_2.88.0.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  4 +-
 10 files changed, 32 insertions(+), 163 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/0001-glib-2.0-fix-gdatetime-ptest-failure-with-glibc-2.43.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.86.4.bb => glib-2.0-initial_2.88.0.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.86.4.bb => glib-2.0_2.88.0.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 06841ddfb8..8b783e81ea 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -18,7 +18,7 @@ diff --git a/gio/meson.build b/gio/meson.build
 index 2f8f188..57c48d2 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -912,17 +912,18 @@ libgio_dep = declare_dependency(link_with : libgio,
+@@ -934,17 +934,18 @@ libgio_dep = declare_dependency(link_with : libgio,
  pkg.generate(libgio,
    requires : ['glib-2.0', 'gobject-2.0'],
    variables : [
@@ -49,7 +49,7 @@ diff --git a/glib/meson.build b/glib/meson.build
 index 209bcbf..a86cfd3 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -464,9 +464,10 @@ pkg.generate(libglib,
+@@ -480,9 +480,10 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : [
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 2ebf01b672..5b7c323996 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -16,11 +16,11 @@ diff --git a/gio/meson.build b/gio/meson.build
 index 39256d3..2f8f188 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1049,6 +1049,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
+@@ -1071,6 +1071,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
 +  install_dir: glib_libexecdir,
-   dependencies : [libgio_dep, libgobject_dep, libgmodule_dep, libglib_dep])
+   dependencies : [libgio_dep, libgobject_dep, libgmodule_dep, libglib_dep, app_profile_dep])
  
  glib_compile_schemas = executable('glib-compile-schemas',
diff --git a/meta/recipes-core/glib-2.0/files/0001-glib-2.0-fix-gdatetime-ptest-failure-with-glibc-2.43.patch b/meta/recipes-core/glib-2.0/files/0001-glib-2.0-fix-gdatetime-ptest-failure-with-glibc-2.43.patch
deleted file mode 100644
index f023e687f4..0000000000
--- a/meta/recipes-core/glib-2.0/files/0001-glib-2.0-fix-gdatetime-ptest-failure-with-glibc-2.43.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 7c837a520f51db74e482bc8196ed5ff40e432307 Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Mon, 23 Feb 2026 12:30:08 +0000
-Subject: [PATCH] gdatetime: Fix comparison against cached LC_TIME value
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The string pointer returned by `setlocale (LC_TIME, NULL)` may change if
-other code calls `setlocale()` again. But because internally glibc
-implements it using `strdup()`, the pointer value itself may actually
-stay the same even if the string contents change.
-
-This started happening more commonly in glibc 2.43, due to an internal
-`malloc()` change which happened to trigger this latent bug.
-
-In the situations where this happened, it resulted in an outdated cached
-era value being used.
-
-Fix it by taking a copy of the `LC_TIME` string. Unfortunately this
-means a reachable (‘leaked’) static string allocation at the end of the
-process’ life, but tooling should ignore that if we mark it with
-`g_ignore_leak()`.
-
-Debugged by Sam James, Wilco and Douglas R. Reno. See also
-https://sourceware.org/bugzilla/show_bug.cgi?id=33899#c6.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7c837a520f51db74e482bc8196ed5ff40e432307]
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-Signed-off-by: Hemanth Kumar M D <hemanth.kumar.m.d@windriver.com>
----
- glib/gdatetime.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/glib/gdatetime.c b/glib/gdatetime.c
-index c4d7445432..8d67354cf2 100644
---- a/glib/gdatetime.c
-+++ b/glib/gdatetime.c
-@@ -65,6 +65,7 @@
- #include <langinfo.h>
- #endif
- 
-+#include "glib-private.h"
- #include "gatomic.h"
- #include "gcharset.h"
- #include "gcharsetprivate.h"
-@@ -2981,14 +2982,14 @@ date_time_lookup_era (GDateTime *datetime,
- {
-   static GMutex era_mutex;
-   static GPtrArray *static_era_description = NULL;  /* (mutex era_mutex) (element-type GEraDescriptionSegment) */
--  static const char *static_era_description_locale = NULL;  /* (mutex era_mutex) */
-+  static char *static_era_description_locale = NULL;  /* (mutex era_mutex) (owned) */
-   const char *current_lc_time = setlocale (LC_TIME, NULL);
-   GPtrArray *local_era_description;  /* (element-type GEraDescriptionSegment) */
-   GEraDate datetime_date;
- 
-   g_mutex_lock (&era_mutex);
- 
--  if (static_era_description_locale != current_lc_time)
-+  if (g_strcmp0 (static_era_description_locale, current_lc_time) != 0)
-     {
-       const char *era_description_str;
-       size_t era_description_str_len;
-@@ -3061,7 +3062,9 @@ date_time_lookup_era (GDateTime *datetime,
- 
-       g_free (tmp);
- 
--      static_era_description_locale = current_lc_time;
-+      g_free (static_era_description_locale);
-+      static_era_description_locale = g_strdup (current_lc_time);
-+      g_ignore_leak (static_era_description_locale);
-     }
- 
-   if (static_era_description == NULL)
--- 
-GitLab
-
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index e4b0d6be79..149833dc43 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -17,7 +17,7 @@ diff --git a/meson.build b/meson.build
 index dab1d61..cc3a5ed 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2092,7 +2092,7 @@ atomicdefine = '''
+@@ -2100,7 +2100,7 @@ atomicdefine = '''
  # We know that we can always use real ("lock free") atomic operations with MSVC
  if cc.get_id() == 'msvc' or cc.get_id() == 'clang-cl' or cc.links(atomictest, name : 'atomic ops')
    have_atomic_lock_free = true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 712ae25b27..efd5d3de1b 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -17,7 +17,7 @@ diff --git a/meson.build b/meson.build
 index cc3a5ed..58dd87a 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1090,7 +1090,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
deleted file mode 100644
index daf86224d5..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From c5766cff61ffce0b8e787eae09908ac348338e5f Mon Sep 17 00:00:00 2001
-From: Philip Withnall <pwithnall@gnome.org>
-Date: Thu, 18 Dec 2025 23:12:18 +0000
-Subject: [PATCH] gbufferedinputstream: Fix a potential integer overflow in
- peek()
-
-If the caller provides `offset` and `count` arguments which overflow,
-their sum will overflow and could lead to `memcpy()` reading out more
-memory than expected.
-
-Spotted by Codean Labs.
-
-Signed-off-by: Philip Withnall <pwithnall@gnome.org>
-
-Fixes: #3851
-
-CVE: CVE-2026-0988
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c5766cff61ffce0b8e787eae09908ac348338e5f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- gio/gbufferedinputstream.c        |  2 +-
- gio/tests/buffered-input-stream.c | 10 ++++++++++
- 2 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/gio/gbufferedinputstream.c b/gio/gbufferedinputstream.c
-index 9e6bacc62..56d656be0 100644
---- a/gio/gbufferedinputstream.c
-+++ b/gio/gbufferedinputstream.c
-@@ -590,7 +590,7 @@ g_buffered_input_stream_peek (GBufferedInputStream *stream,
- 
-   available = g_buffered_input_stream_get_available (stream);
- 
--  if (offset > available)
-+  if (offset > available || offset > G_MAXSIZE - count)
-     return 0;
- 
-   end = MIN (offset + count, available);
-diff --git a/gio/tests/buffered-input-stream.c b/gio/tests/buffered-input-stream.c
-index a1af4eeff..2b2a0d9aa 100644
---- a/gio/tests/buffered-input-stream.c
-+++ b/gio/tests/buffered-input-stream.c
-@@ -60,6 +60,16 @@ test_peek (void)
-   g_assert_cmpint (npeek, ==, 0);
-   g_free (buffer);
- 
-+  buffer = g_new0 (char, 64);
-+  npeek = g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM (in), buffer, 8, 0);
-+  g_assert_cmpint (npeek, ==, 0);
-+  g_free (buffer);
-+
-+  buffer = g_new0 (char, 64);
-+  npeek = g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM (in), buffer, 5, G_MAXSIZE);
-+  g_assert_cmpint (npeek, ==, 0);
-+  g_free (buffer);
-+
-   g_object_unref (in);
-   g_object_unref (base);
- }
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 09de155d08..4c2638ae61 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -13,32 +13,39 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+Port patch to 2.88
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
- gio/giomodule.c | 7 -------
- 1 file changed, 7 deletions(-)
+ gio/giomodule.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
 index 38761e4..afa7878 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1272,11 +1272,6 @@ get_gio_module_dir (void)
-       g_free (install_dir);
+@@ -1312,6 +1312,24 @@ get_gio_module_dir (void)
+       module_dir = get_gio_module_dir_darwin ();
  #else
        module_dir = g_strdup (GIO_MODULE_DIR);
--#ifdef __APPLE__
--#include "TargetConditionals.h"
--/* Only auto-relocate on macOS, not watchOS etc; older macOS SDKs only define TARGET_OS_MAC */
--#if (defined (TARGET_OS_OSX) && TARGET_OS_OSX) || \
--     (!defined (TARGET_OS_OSX) && defined (TARGET_OS_MAC) && TARGET_OS_MAC)
- #include <dlfcn.h>
-       {
-         g_autofree gchar *path = NULL;
-@@ -1295,8 +1290,6 @@ get_gio_module_dir (void)
-               }
-           }
-       }
--#endif
--#endif
++#include <dlfcn.h>
++      {
++        g_autofree gchar *path = NULL;
++        g_autofree gchar *possible_dir = NULL;
++        Dl_info info;
++
++        if (dladdr (get_gio_module_dir, &info))
++          {
++            /* Gets path to the PREFIX/lib directory */
++            path = g_path_get_dirname (info.dli_fname);
++            possible_dir = g_build_filename (path, "gio", "modules", NULL);
++            if (g_file_test (possible_dir, G_FILE_TEST_IS_DIR))
++              {
++                g_free (module_dir);
++                module_dir = g_steal_pointer (&possible_dir);
++              }
++          }
++      }
  #endif
      }
  
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.86.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index ea3ab519dd..349c33bd33 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -231,14 +231,12 @@ SRC_URI += "\
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
-           file://CVE-2026-0988.patch \
-           file://0001-glib-2.0-fix-gdatetime-ptest-failure-with-glibc-2.43.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "d4e2b5d791d5015ffd8c6971ad8e975a0a55c1a14926cdb25cf843ff00682260"
+SRC_URI[archive.sha256sum] = "3546251ccbb3744d4bc4eb48354540e1f6200846572bab68e3a2b7b2b64dfd07"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

