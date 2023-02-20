Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0CBC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:13:51 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.17320.1676909624332045352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout05.t-online.de (Postfix) with SMTP id 50F4F22959
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 17:13:42 +0100 (CET)
Received: from [192.168.178.83] ([79.219.230.185]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pU8nM-0OhePg0; Mon, 20 Feb 2023 17:13:40 +0100
Date: Mon, 20 Feb 2023 17:13:34 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][RFC][PATCH] glib-2.0: update 2.74.5 -> 2.75.3
To: openembedded-core@lists.openembedded.org
Message-Id: <MQZDQR.7MY2GTZPCC242@t-online.de>
In-Reply-To: <20230220161045.97515-1-f_l_k@t-online.de>
References: <20230220161045.97515-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-GhGMxzOeXxCLO7Oa5hdj"
X-TOI-EXPURGATEID: 150726::1676909620-D571F046-724C5CBD/0/0 CLEAN NORMAL
X-TOI-MSGID: a655f712-58ef-4de3-9285-ea5a30fd2738
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177432

--=-GhGMxzOeXxCLO7Oa5hdj
Content-Type: text/plain; charset=us-ascii; format=flowed

This was marked [RFC] because I'm unsure if glib-2.0-2.76 will be 
released in time for mickledore but this update would be required for 
the upcoming gnome 44 release. (gnome-control-center requires glib >= 
2.75.0)

Am Mo, 20. Feb 2023 um 17:10:45 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> - Remove backported patches
> - Port relocate-modules.patch
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-info-don-t-assume-million-in-one-ev.patch | 50 ------------
>  ...build-do-not-use-can_run_host_binari.patch | 48 ------------
>  .../glib-2.0/glib-2.0/cpp-null.patch          | 77 
> -------------------
>  .../glib-2.0/glib-2.0/cpp-null2.patch         | 31 --------
>  .../glib-2.0/glib-2.0/relocate-modules.patch  | 11 ++-
>  ...{glib-2.0_2.74.5.bb => glib-2.0_2.75.3.bb} |  6 +-
>  6 files changed, 8 insertions(+), 215 deletions(-)
>  delete mode 100644 
> meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
>  delete mode 100644 
> meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
>  delete mode 100644 
> meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.5.bb => 
> glib-2.0_2.75.3.bb} (87%)
> 
> diff --git 
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch 
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
> deleted file mode 100644
> index 57ada66907..0000000000
> --- 
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 
> 2001
> -From: Ross Burton <ross.burton@arm.com <mailto:ross.burton@arm.com>>
> -Date: Tue, 6 Jul 2021 19:26:03 +0100
> -Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one 
> events
> -
> -Upstream-Status: Backport 
> [<https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990>]
> -Signed-off-by: Ross Burton <ross.burton@arm.com 
> <mailto:ross.burton@arm.com>>
> -
> - don't happen
> -
> -The access and creation time tests create a file, gets the time in
> -seconds, then gets the time in microseconds and assumes that the
> -difference between the two has to be above 0.
> -
> -As rare as this may be, it can happen:
> -
> -$ stat g-file-info-test-50A450 -c %y
> -2021-07-06 18:24:56.000000767 +0100
> -
> -Change the test to simply assert that the difference not negative to
> -handle this case.
> -
> -This is the same fix as 289f8b, but that was just modification time.
> -
> ----
> - gio/tests/g-file-info.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
> -index d9ad045..c9b12b0 100644
> ---- a/gio/tests/g-file-info.c
> -+++ b/gio/tests/g-file-info.c
> -@@ -307,7 +307,7 @@ test_g_file_info_access_time (void)
> -   g_assert_nonnull (dt_usecs);
> -
> -   ts = g_date_time_difference (dt_usecs, dt);
> --  g_assert_cmpint (ts, >, 0);
> -+  g_assert_cmpint (ts, >=, 0);
> -   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
> -
> -   /* Try again with nanosecond precision. */
> -@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void)
> -   g_assert_nonnull (dt_usecs);
> -
> -   ts = g_date_time_difference (dt_usecs, dt);
> --  g_assert_cmpint (ts, >, 0);
> -+  g_assert_cmpint (ts, >=, 0);
> -   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
> -
> -   /* Try again with nanosecond precision. */
> diff --git 
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch 
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
> deleted file mode 100644
> index db08b5af55..0000000000
> --- 
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 
> 2001
> -From: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> -Date: Fri, 11 Nov 2022 13:12:42 +0100
> -Subject: [PATCH] tests/meson.build: do not use 
> can_run_host_binaries()
> -
> -can_run_host_binaries() returns true even when cross compiling,
> -if there is an executable wrapper defined that can run
> -cross-binaries under some kind of emulation.
> -
> -Unfortunately, custom_target() will not use the wrapper
> -and will attempt to execute the command directly. Until
> -this is addressed in meson upstream, we have to disable
> -these targets in cross scenarios.
> -
> -Upstream-Status: Submitted 
> [<https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067>]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> -
> ----
> - gio/tests/meson.build  | 2 +-
> - glib/tests/meson.build | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> -index 49cfa25ce..ea59656f9 100644
> ---- a/gio/tests/meson.build
> -+++ b/gio/tests/meson.build
> -@@ -652,7 +652,7 @@ if installed_tests_enabled
> -   endforeach
> - endif
> -
> --if meson.can_run_host_binaries()
> -+if not meson.is_cross_build()
> -
> -   compiler_type = '--compiler=@0@'.format(cc.get_id())
> -
> -diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> -index 69508178e..e4f75f302 100644
> ---- a/glib/tests/meson.build
> -+++ b/glib/tests/meson.build
> -@@ -411,7 +411,7 @@ executable('testing-helper', 'testing-helper.c',
> - )
> -
> - # some testing of gtester functionality
> --if meson.can_run_host_binaries() and host_system != 'windows'
> -+if not meson.is_cross_build() and host_system != 'windows'
> -   xmllint = find_program('xmllint', required: false)
> -   if xmllint.found()
> -     tmpsample_xml = custom_target('tmpsample.xml',
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch 
> b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
> deleted file mode 100644
> index 63cbf90ab2..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 17 00:00:00 
> 2001
> -From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= 
> <mail@3v1n0.net <mailto:mail@3v1n0.net>>
> -Date: Sat, 29 Oct 2022 04:30:52 +0200
> -Subject: [PATCH] glib/gmacros: Always define NULL as nullptr in 
> C++11 and
> - newer
> -
> -Upstream-Status: Backport 
> [<https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066>]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> ----
> - glib/gmacros.h     |  9 ++++++++-
> - glib/tests/cxx.cpp | 13 -------------
> - 2 files changed, 8 insertions(+), 14 deletions(-)
> -
> -diff --git a/glib/gmacros.h b/glib/gmacros.h
> -index 5302841105..9fe8270822 100644
> ---- a/glib/gmacros.h
> -+++ b/glib/gmacros.h
> -@@ -870,10 +870,17 @@
> -  */
> - #ifndef NULL
> - #  ifdef __cplusplus
> --#  define NULL        (0L)
> -+#    if __cplusplus >= 201103L
> -+#      define NULL (nullptr)
> -+#    else
> -+#      define NULL (0L)
> -+#    endif /* __cplusplus >= 201103L */
> - #  else /* !__cplusplus */
> - #  define NULL        ((void*) 0)
> - #  endif /* !__cplusplus */
> -+#elif defined (__cplusplus) && __cplusplus >= 201103L
> -+#  undef NULL
> -+#  define NULL (nullptr)
> - #endif
> -
> - #ifndef	FALSE
> -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
> -index 6ac60791c8..045457c6e2 100644
> ---- a/glib/tests/cxx.cpp
> -+++ b/glib/tests/cxx.cpp
> -@@ -34,21 +34,12 @@ test_typeof (void)
> -   MyObject *obj3 = g_atomic_pointer_get (&obj2);
> -   g_assert_true (obj3 == obj);
> -
> --#if __cplusplus >= 201103L
> --  MyObject *obj4 = nullptr;
> --#else
> -   MyObject *obj4 = NULL;
> --#endif
> -   g_atomic_pointer_set (&obj4, obj3);
> -   g_assert_true (obj4 == obj);
> -
> --#if __cplusplus >= 201103L
> --  MyObject *obj5 = nullptr;
> --  g_atomic_pointer_compare_and_exchange (&obj5, nullptr, obj4);
> --#else
> -   MyObject *obj5 = NULL;
> -   g_atomic_pointer_compare_and_exchange (&obj5, NULL, obj4);
> --#endif
> -   g_assert_true (obj5 == obj);
> -
> -   MyObject *obj6 = g_steal_pointer (&obj5);
> -@@ -195,11 +186,7 @@ test_steal_pointer (void)
> - int
> - main (int argc, char *argv[])
> - {
> --#if __cplusplus >= 201103L
> --  g_test_init (&argc, &argv, nullptr);
> --#else
> -   g_test_init (&argc, &argv, NULL);
> --#endif
> -
> -   g_test_add_func ("/C++/typeof", test_typeof);
> -   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", 
> test_atomic_pointer_compare_and_exchange);
> ---
> -GitLab
> -
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch 
> b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
> deleted file mode 100644
> index 763d5ce539..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon Sep 17 00:00:00 
> 2001
> -From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= 
> <mail@3v1n0.net <mailto:mail@3v1n0.net>>
> -Date: Sat, 29 Oct 2022 04:16:00 +0200
> -Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a 
> pointer
> - type
> -
> -Otherwise it may not be recognized as valid sentinel
> -Upstream-Status: Backport 
> [<https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4>]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> ----
> - glib/tests/cxx.cpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
> -index 045457c6e2..aa5e0cb576 100644
> ---- a/glib/tests/cxx.cpp
> -+++ b/glib/tests/cxx.cpp
> -@@ -186,7 +186,11 @@ test_steal_pointer (void)
> - int
> - main (int argc, char *argv[])
> - {
> -+#if __cplusplus >= 201103L
> -   g_test_init (&argc, &argv, NULL);
> -+#else
> -+  g_test_init (&argc, &argv, static_cast<void *>(NULL));
> -+#endif
> -
> -   g_test_add_func ("/C++/typeof", test_typeof);
> -   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", 
> test_atomic_pointer_compare_and_exchange);
> ---
> -GitLab
> diff --git 
> a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch 
> b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index ae6881b61e..4a2eb3b1a7 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -14,6 +14,9 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>  Port patch to 2.48
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com 
> <mailto:jussi.kukkonen@intel.com>>
> 
> +Port patch to 2.75
> +Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> +
>  ---
>   gio/giomodule.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> @@ -31,7 +34,7 @@ index f5dbb45..c926e77 100644
>   #endif
>   #include <glib/gstdio.h>
> 
> -@@ -1261,7 +1263,15 @@ get_gio_module_dir (void)
> +@@ -1270,7 +1272,15 @@
>                                        NULL);
>         g_free (install_dir);
>   #else
> @@ -45,6 +48,6 @@ index f5dbb45..c926e77 100644
>  +      } else {
>  +        module_dir = g_strdup (GIO_MODULE_DIR);
>  +      }
> - #endif
> -     }
> -
> + #ifdef __APPLE__
> + #include "TargetConditionals.h"
> + #if TARGET_OS_OSX
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb 
> b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb
> similarity index 87%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb
> index d54f077cb0..40c7126120 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb
> @@ -14,14 +14,10 @@ SRC_URI = 
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             
> file://0001-Do-not-write-bindir-into-pkg-config-files.patch 
> <file://0001-do-not-write-bindir-into-pkg-config-files.patch/> \
>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch 
> <file://0001-meson-run-atomics-test-on-clang-as-well.patch/> \
>             
> file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch 
> <file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch/> 
> \
> -           
> file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch 
> <file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch/> 
> \
> -           
> file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch 
> <file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch/> 
> \
> -           file://cpp-null.patch <file://cpp-null.patch/> \
> -           file://cpp-null2.patch <file://cpp-null2.patch/> \
>             "
>  SRC_URI:append:class-native = " file://relocate-modules.patch" 
> <file://relocate-modules.patch/>
> 
> -SRC_URI[sha256sum] = 
> "ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608a5c14c8"
> +SRC_URI[sha256sum] = 
> "7c517d0aff456c35a039bce8a8df7a08ce95a8285b09d1849f8865f633f7f871"
> 
>  # Find any meson cross files in FILESPATH that are relevant for the 
> current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.34.1
> 


--=-GhGMxzOeXxCLO7Oa5hdj
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This was marked [RFC] because I'm unsure if glib-2.0-2.76 will be released in time for mickledore but this update would be required for the upcoming gnome 44 release. (gnome-control-center requires glib&nbsp;<code>&gt;= 2.75.0</code>)&nbsp;</div></div><div id="geary-quote" dir="auto"><br>Am Mo, 20. Feb 2023 um 17:10:45 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Remove backported patches
- Port relocate-modules.patch

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...-info-don-t-assume-million-in-one-ev.patch | 50 ------------
 ...build-do-not-use-can_run_host_binari.patch | 48 ------------
 .../glib-2.0/glib-2.0/cpp-null.patch          | 77 -------------------
 .../glib-2.0/glib-2.0/cpp-null2.patch         | 31 --------
 .../glib-2.0/glib-2.0/relocate-modules.patch  | 11 ++-
 ...{glib-2.0_2.74.5.bb =&gt; glib-2.0_2.75.3.bb} |  6 +-
 6 files changed, 8 insertions(+), 215 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.5.bb =&gt; glib-2.0_2.75.3.bb} (87%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
deleted file mode 100644
index 57ada66907..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 2001
-From: Ross Burton &lt;<a href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;
-Date: Tue, 6 Jul 2021 19:26:03 +0100
-Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one events
-
-Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990">https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990</a>]
-Signed-off-by: Ross Burton &lt;<a href="mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt;
-
- don't happen
-
-The access and creation time tests create a file, gets the time in
-seconds, then gets the time in microseconds and assumes that the
-difference between the two has to be above 0.
-
-As rare as this may be, it can happen:
-
-$ stat g-file-info-test-50A450 -c %y
-2021-07-06 18:24:56.000000767 +0100
-
-Change the test to simply assert that the difference not negative to
-handle this case.
-
-This is the same fix as 289f8b, but that was just modification time.
-
----
- gio/tests/g-file-info.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c
-index d9ad045..c9b12b0 100644
---- a/gio/tests/g-file-info.c
-+++ b/gio/tests/g-file-info.c
-@@ -307,7 +307,7 @@ test_g_file_info_access_time (void)
-   g_assert_nonnull (dt_usecs);
- 
-   ts = g_date_time_difference (dt_usecs, dt);
--  g_assert_cmpint (ts, &gt;, 0);
-+  g_assert_cmpint (ts, &gt;=, 0);
-   g_assert_cmpint (ts, &lt;, G_USEC_PER_SEC);
- 
-   /* Try again with nanosecond precision. */
-@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void)
-   g_assert_nonnull (dt_usecs);
- 
-   ts = g_date_time_difference (dt_usecs, dt);
--  g_assert_cmpint (ts, &gt;, 0);
-+  g_assert_cmpint (ts, &gt;=, 0);
-   g_assert_cmpint (ts, &lt;, G_USEC_PER_SEC);
- 
-   /* Try again with nanosecond precision. */
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
deleted file mode 100644
index db08b5af55..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
-Date: Fri, 11 Nov 2022 13:12:42 +0100
-Subject: [PATCH] tests/meson.build: do not use can_run_host_binaries()
-
-can_run_host_binaries() returns true even when cross compiling,
-if there is an executable wrapper defined that can run
-cross-binaries under some kind of emulation.
-
-Unfortunately, custom_target() will not use the wrapper
-and will attempt to execute the command directly. Until
-this is addressed in meson upstream, we have to disable
-these targets in cross scenarios.
-
-Upstream-Status: Submitted [<a href="https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067">https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067</a>]
-Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
-
----
- gio/tests/meson.build  | 2 +-
- glib/tests/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gio/tests/meson.build b/gio/tests/meson.build
-index 49cfa25ce..ea59656f9 100644
---- a/gio/tests/meson.build
-+++ b/gio/tests/meson.build
-@@ -652,7 +652,7 @@ if installed_tests_enabled
-   endforeach
- endif
- 
--if meson.can_run_host_binaries()
-+if not meson.is_cross_build()
- 
-   compiler_type = '--compiler=@0@'.format(cc.get_id())
- 
-diff --git a/glib/tests/meson.build b/glib/tests/meson.build
-index 69508178e..e4f75f302 100644
---- a/glib/tests/meson.build
-+++ b/glib/tests/meson.build
-@@ -411,7 +411,7 @@ executable('testing-helper', 'testing-helper.c',
- )
- 
- # some testing of gtester functionality
--if meson.can_run_host_binaries() and host_system != 'windows'
-+if not meson.is_cross_build() and host_system != 'windows'
-   xmllint = find_program('xmllint', required: false)
-   if xmllint.found()
-     tmpsample_xml = custom_target('tmpsample.xml',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
deleted file mode 100644
index 63cbf90ab2..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= &lt;<a href="mailto:mail@3v1n0.net">mail@3v1n0.net</a>&gt;
-Date: Sat, 29 Oct 2022 04:30:52 +0200
-Subject: [PATCH] glib/gmacros: Always define NULL as nullptr in C++11 and
- newer
-
-Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066">https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066</a>]
-Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
----
- glib/gmacros.h     |  9 ++++++++-
- glib/tests/cxx.cpp | 13 -------------
- 2 files changed, 8 insertions(+), 14 deletions(-)
-
-diff --git a/glib/gmacros.h b/glib/gmacros.h
-index 5302841105..9fe8270822 100644
---- a/glib/gmacros.h
-+++ b/glib/gmacros.h
-@@ -870,10 +870,17 @@
-  */
- #ifndef NULL
- #  ifdef __cplusplus
--#  define NULL        (0L)
-+#    if __cplusplus &gt;= 201103L
-+#      define NULL (nullptr)
-+#    else
-+#      define NULL (0L)
-+#    endif /* __cplusplus &gt;= 201103L */
- #  else /* !__cplusplus */
- #  define NULL        ((void*) 0)
- #  endif /* !__cplusplus */
-+#elif defined (__cplusplus) &amp;&amp; __cplusplus &gt;= 201103L
-+#  undef NULL
-+#  define NULL (nullptr)
- #endif
- 
- #ifndef	FALSE
-diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
-index 6ac60791c8..045457c6e2 100644
---- a/glib/tests/cxx.cpp
-+++ b/glib/tests/cxx.cpp
-@@ -34,21 +34,12 @@ test_typeof (void)
-   MyObject *obj3 = g_atomic_pointer_get (&amp;obj2);
-   g_assert_true (obj3 == obj);
- 
--#if __cplusplus &gt;= 201103L
--  MyObject *obj4 = nullptr;
--#else
-   MyObject *obj4 = NULL;
--#endif
-   g_atomic_pointer_set (&amp;obj4, obj3);
-   g_assert_true (obj4 == obj);
- 
--#if __cplusplus &gt;= 201103L
--  MyObject *obj5 = nullptr;
--  g_atomic_pointer_compare_and_exchange (&amp;obj5, nullptr, obj4);
--#else
-   MyObject *obj5 = NULL;
-   g_atomic_pointer_compare_and_exchange (&amp;obj5, NULL, obj4);
--#endif
-   g_assert_true (obj5 == obj);
- 
-   MyObject *obj6 = g_steal_pointer (&amp;obj5);
-@@ -195,11 +186,7 @@ test_steal_pointer (void)
- int
- main (int argc, char *argv[])
- {
--#if __cplusplus &gt;= 201103L
--  g_test_init (&amp;argc, &amp;argv, nullptr);
--#else
-   g_test_init (&amp;argc, &amp;argv, NULL);
--#endif
- 
-   g_test_add_func ("/C++/typeof", test_typeof);
-   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
--- 
-GitLab
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
deleted file mode 100644
index 763d5ce539..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= &lt;<a href="mailto:mail@3v1n0.net">mail@3v1n0.net</a>&gt;
-Date: Sat, 29 Oct 2022 04:16:00 +0200
-Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a pointer
- type
-
-Otherwise it may not be recognized as valid sentinel
-Upstream-Status: Backport [<a href="https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4">https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4</a>]
-Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
----
- glib/tests/cxx.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
-index 045457c6e2..aa5e0cb576 100644
---- a/glib/tests/cxx.cpp
-+++ b/glib/tests/cxx.cpp
-@@ -186,7 +186,11 @@ test_steal_pointer (void)
- int
- main (int argc, char *argv[])
- {
-+#if __cplusplus &gt;= 201103L
-   g_test_init (&amp;argc, &amp;argv, NULL);
-+#else
-+  g_test_init (&amp;argc, &amp;argv, static_cast&lt;void *&gt;(NULL));
-+#endif
- 
-   g_test_add_func ("/C++/typeof", test_typeof);
-   g_test_add_func ("/C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_exchange);
--- 
-GitLab
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index ae6881b61e..4a2eb3b1a7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -14,6 +14,9 @@ Signed-off-by: Ross Burton &lt;ross.burton@intel.com&gt;
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen &lt;<a href="mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt;
 
+Port patch to 2.75
+Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+
 ---
  gio/giomodule.c | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)
@@ -31,7 +34,7 @@ index f5dbb45..c926e77 100644
  #endif
  #include &lt;glib/gstdio.h&gt;
  
-@@ -1261,7 +1263,15 @@ get_gio_module_dir (void)
+@@ -1270,7 +1272,15 @@
                                       NULL);
        g_free (install_dir);
  #else
@@ -45,6 +48,6 @@ index f5dbb45..c926e77 100644
 +      } else {
 +        module_dir = g_strdup (GIO_MODULE_DIR);
 +      }
- #endif
-     }
- 
+ #ifdef __APPLE__
+ #include "TargetConditionals.h"
+ #if TARGET_OS_OSX
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb
similarity index 87%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb
index d54f077cb0..40c7126120 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb
@@ -14,14 +14,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            <a href="file://0001-Do-not-write-bindir-into-pkg-config-files.patch">file://0001-Do-not-write-bindir-into-pkg-config-files.patch</a> \
            <a href="file://0001-meson-Run-atomics-test-on-clang-as-well.patch">file://0001-meson-Run-atomics-test-on-clang-as-well.patch</a> \
            <a href="file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch">file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch</a> \
-           <a href="file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch">file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch</a> \
-           <a href="file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch">file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch</a> \
-           <a href="file://cpp-null.patch">file://cpp-null.patch</a> \
-           <a href="file://cpp-null2.patch">file://cpp-null2.patch</a> \
            "
 SRC_URI:append:class-native = " <a href="file://relocate-modules.patch" "="">file://relocate-modules.patch"</a>
 
-SRC_URI[sha256sum] = "ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608a5c14c8"
+SRC_URI[sha256sum] = "7c517d0aff456c35a039bce8a8df7a08ce95a8285b09d1849f8865f633f7f871"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-GhGMxzOeXxCLO7Oa5hdj--


