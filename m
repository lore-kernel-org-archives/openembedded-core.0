Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72C6C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 07:27:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.2282.1678865266982689636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 00:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oTaKBnva;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id t11so23118465lfr.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 00:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678865265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+nma59Srtx8wDS262hscC6HCrciZJit3U98P3YJruC4=;
        b=oTaKBnvasaQJtzq/IoQGjFW6TJ70n9XxynWnDaJ/L0kQJC+UuAop4l2DEKY3+VF0V9
         gWxgYMS3BDb0C6j518B0uucE0ekxBJpKhidwIx36k1yfeSFs6NifCZMI984VpMgVql3Y
         0Xr7UlBjkEDOQwUkaMO1qSx4myLsNB46wmwfkzQnl6ZZsP7Pl8C5CHbm2RqoYVG6JLe/
         5G4VdQ3MfY3wguFv1+agg6H35hmhfV2Y7eVlUNw9hADEbWwCoc8OBwps1Xgt3wLVPMRY
         XYtUw+RxDMxvGuSm0/YIlzqyKQUU3TShbR/ArNGGZ5q/eJgRj85Q5+8Ca06PMMl1BqJf
         gRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678865265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nma59Srtx8wDS262hscC6HCrciZJit3U98P3YJruC4=;
        b=kFudiG6M6nLYvx4v1sm3mP/V9JYfPQLfslSb9UAGgR+/x5O5LnJ0qBVUbkeF0X2S00
         PNkOrsc7BuXxhTLR1QJalcF2GwNV6ZcUJbbg7h/uevnkbqosH02/QzLkZdKwPd7qSM5V
         6Pi0THxaieNZTthvJekyoOwmlTEycIoDLj+oj6iAq31kgKZLi1pAiqHuRQlD7n4PR3al
         7T/4e4h86qGsUVKpCgrOjpvsiMB5h35GjPFOXvp7SK7HVsPxTZC14YQQ8CCAOPcWsuyI
         qaLexdin9mYcIbXNZmLmpvCCSU7F8W90tz85b8MipMBnzKIeznkqsjFwIBIcVXwrhL3E
         DLEw==
X-Gm-Message-State: AO0yUKXuUPFIMHzMVdQRCGmQH3ANs4VHEu4uWGiR/3MJdNP3lYneX5vC
	f7YppjMJmU2PL08oiXfafSD9psOb5TR+jB3po9E=
X-Google-Smtp-Source: AK7set8pQ2T24WEaE4g8BMr/ksqDAf7QXOAPUQ3XgYf5cha4QKF81Z51Wo6JrfCDYM6RAaST0rBiuvLGXvmsDTPasmc=
X-Received: by 2002:a19:7515:0:b0:4d8:5810:1ffa with SMTP id
 y21-20020a197515000000b004d858101ffamr1622321lfe.11.1678865264915; Wed, 15
 Mar 2023 00:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230315070909.422721-1-f_l_k@t-online.de>
In-Reply-To: <20230315070909.422721-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Mar 2023 08:27:33 +0100
Message-ID: <CANNYZj-k2EG4giH=zhXQywFhnVnpuaFtc4ngHgn8SV3w2kQhrw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] glib: update 2.74.6 -> 2.76.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bdd73205f6eb472e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178524

--000000000000bdd73205f6eb472e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Which image did you build to run the test? Note that the fail happened in
core-image-ptest-glib-2.0, that=E2=80=99s what you should build and run. Gu=
esswork
is a fast track to frustration.

Alex

On Wed 15. Mar 2023 at 8.09, Markus Volk <f_l_k@t-online.de> wrote:

> - remove backported patches
> - update relocate-modules.patch
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-info-don-t-assume-million-in-one-ev.patch | 50 ------------
>  ...build-do-not-use-can_run_host_binari.patch | 48 ------------
>  .../glib-2.0/glib-2.0/cpp-null.patch          | 77 -------------------
>  .../glib-2.0/glib-2.0/cpp-null2.patch         | 31 --------
>  .../glib-2.0/glib-2.0/relocate-modules.patch  | 11 ++-
>  meta/recipes-core/glib-2.0/glib-2.0/run-ptest |  2 +-
>  ...{glib-2.0_2.74.6.bb =3D> glib-2.0_2.76.0.bb} |  6 +-
>  7 files changed, 9 insertions(+), 216 deletions(-)
>  delete mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assu=
me-million-in-one-ev.patch
>  delete mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use=
-can_run_host_binari.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.74.6.bb =3D>
> glib-2.0_2.76.0.bb} (87%)
>
> diff --git
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-as=
sume-million-in-one-ev.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-as=
sume-million-in-one-ev.patch
> deleted file mode 100644
> index 57ada66907..0000000000
> ---
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-as=
sume-million-in-one-ev.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@arm.com>
> -Date: Tue, 6 Jul 2021 19:26:03 +0100
> -Subject: [PATCH] gio/tests/g-file-info: don't assume million-in-one even=
ts
> -
> -Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990]
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
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
> -   ts =3D g_date_time_difference (dt_usecs, dt);
> --  g_assert_cmpint (ts, >, 0);
> -+  g_assert_cmpint (ts, >=3D, 0);
> -   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
> -
> -   /* Try again with nanosecond precision. */
> -@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void)
> -   g_assert_nonnull (dt_usecs);
> -
> -   ts =3D g_date_time_difference (dt_usecs, dt);
> --  g_assert_cmpint (ts, >, 0);
> -+  g_assert_cmpint (ts, >=3D, 0);
> -   g_assert_cmpint (ts, <, G_USEC_PER_SEC);
> -
> -   /* Try again with nanosecond precision. */
> diff --git
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-u=
se-can_run_host_binari.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-u=
se-can_run_host_binari.patch
> deleted file mode 100644
> index db08b5af55..0000000000
> ---
> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-u=
se-can_run_host_binari.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Fri, 11 Nov 2022 13:12:42 +0100
> -Subject: [PATCH] tests/meson.build: do not use can_run_host_binaries()
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
> -Upstream-Status: Submitted [
> https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
> -   compiler_type =3D '--compiler=3D@0@'.format(cc.get_id())
> -
> -diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> -index 69508178e..e4f75f302 100644
> ---- a/glib/tests/meson.build
> -+++ b/glib/tests/meson.build
> -@@ -411,7 +411,7 @@ executable('testing-helper', 'testing-helper.c',
> - )
> -
> - # some testing of gtester functionality
> --if meson.can_run_host_binaries() and host_system !=3D 'windows'
> -+if not meson.is_cross_build() and host_system !=3D 'windows'
> -   xmllint =3D find_program('xmllint', required: false)
> -   if xmllint.found()
> -     tmpsample_xml =3D custom_target('tmpsample.xml',
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
> deleted file mode 100644
> index 63cbf90ab2..0000000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Marco=3D20Trevisan=3D20=3D28Trevi=3DC3=3DB1o=3D29?=3D =
<mail@3v1n0.net>
> -Date: Sat, 29 Oct 2022 04:30:52 +0200
> -Subject: [PATCH] glib/gmacros: Always define NULL as nullptr in C++11 an=
d
> - newer
> -
> -Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72=
a6885cde6066
> ]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
> -+#    if __cplusplus >=3D 201103L
> -+#      define NULL (nullptr)
> -+#    else
> -+#      define NULL (0L)
> -+#    endif /* __cplusplus >=3D 201103L */
> - #  else /* !__cplusplus */
> - #  define NULL        ((void*) 0)
> - #  endif /* !__cplusplus */
> -+#elif defined (__cplusplus) && __cplusplus >=3D 201103L
> -+#  undef NULL
> -+#  define NULL (nullptr)
> - #endif
> -
> - #ifndef       FALSE
> -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp
> -index 6ac60791c8..045457c6e2 100644
> ---- a/glib/tests/cxx.cpp
> -+++ b/glib/tests/cxx.cpp
> -@@ -34,21 +34,12 @@ test_typeof (void)
> -   MyObject *obj3 =3D g_atomic_pointer_get (&obj2);
> -   g_assert_true (obj3 =3D=3D obj);
> -
> --#if __cplusplus >=3D 201103L
> --  MyObject *obj4 =3D nullptr;
> --#else
> -   MyObject *obj4 =3D NULL;
> --#endif
> -   g_atomic_pointer_set (&obj4, obj3);
> -   g_assert_true (obj4 =3D=3D obj);
> -
> --#if __cplusplus >=3D 201103L
> --  MyObject *obj5 =3D nullptr;
> --  g_atomic_pointer_compare_and_exchange (&obj5, nullptr, obj4);
> --#else
> -   MyObject *obj5 =3D NULL;
> -   g_atomic_pointer_compare_and_exchange (&obj5, NULL, obj4);
> --#endif
> -   g_assert_true (obj5 =3D=3D obj);
> -
> -   MyObject *obj6 =3D g_steal_pointer (&obj5);
> -@@ -195,11 +186,7 @@ test_steal_pointer (void)
> - int
> - main (int argc, char *argv[])
> - {
> --#if __cplusplus >=3D 201103L
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
> -From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Marco=3D20Trevisan=3D20=3D28Trevi=3DC3=3DB1o=3D29?=3D =
<mail@3v1n0.net>
> -Date: Sat, 29 Oct 2022 04:16:00 +0200
> -Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a point=
er
> - type
> -
> -Otherwise it may not be recognized as valid sentinel
> -Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436=
fe72c1dcdeb4
> ]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
> -+#if __cplusplus >=3D 201103L
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
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> index ae6881b61e..4a2eb3b1a7 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> @@ -14,6 +14,9 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>  Port patch to 2.48
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>
> +Port patch to 2.75
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
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
>  +        module_dir =3D g_strdup (GIO_MODULE_DIR);
>  +      }
> - #endif
> -     }
> -
> + #ifdef __APPLE__
> + #include "TargetConditionals.h"
> + #if TARGET_OS_OSX
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
> b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
> index c476d67310..b10a72ffa1 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
> @@ -5,6 +5,6 @@ if id -u glib2-test; then
>     userdel glib2-test
>  fi
>  useradd glib2-test
> -cd /tmp
> +cd /var/volatile/tmp
>  su glib2-test -c 'gnome-desktop-testing-runner glib'
>  userdel glib2-test
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.76.0.bb
> similarity index 87%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.76.0.bb
> index 5b79ae481c..550b5cab4c 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.0.bb
> @@ -14,14 +14,10 @@ SRC_URI =3D
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
>
> file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
> -
>  file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch \
> -
>  file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch \
> -           file://cpp-null.patch \
> -           file://cpp-null2.patch \
>             "
>  SRC_URI:append:class-native =3D " file://relocate-modules.patch"
>
> -SRC_URI[sha256sum] =3D
> "069cf7e51cd261eb163aaf06c8d1754c6835f31252180aff5814e5afc7757fbc"
> +SRC_URI[sha256sum] =3D
> "525bb703b807142e1aee5ccf222c344e8064b21c0c45677ef594e587874c6797"
>
>  # Find any meson cross files in FILESPATH that are relevant for the
> current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178523):
> https://lists.openembedded.org/g/openembedded-core/message/178523
> Mute This Topic: https://lists.openembedded.org/mt/97622689/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bdd73205f6eb472e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Which image did you build to run the test? Note that=
 the fail happened in core-image-ptest-glib-2.0, that=E2=80=99s what you sh=
ould build and run. Guesswork is a fast track to frustration.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div></div><div><div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 15. Mar 20=
23 at 8.09, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"=
_blank">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">- remove=
 backported patches<br>
- update relocate-modules.patch<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...-info-don-t-assume-million-in-one-ev.patch | 50 ------------<br>
=C2=A0...build-do-not-use-can_run_host_binari.patch | 48 ------------<br>
=C2=A0.../glib-2.0/glib-2.0/cpp-null.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 77 -------------------<br>
=C2=A0.../glib-2.0/glib-2.0/cpp-null2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 31 --------<br>
=C2=A0.../glib-2.0/glib-2.0/relocate-modules.patch=C2=A0 | 11 ++-<br>
=C2=A0meta/recipes-core/glib-2.0/glib-2.0/run-ptest |=C2=A0 2 +-<br>
=C2=A0...{<a href=3D"http://glib-2.0_2.74.6.bb" rel=3D"noreferrer" target=
=3D"_blank">glib-2.0_2.74.6.bb</a> =3D&gt; <a href=3D"http://glib-2.0_2.76.=
0.bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.76.0.bb</a>} |=C2=A0 =
6 +-<br>
=C2=A07 files changed, 9 insertions(+), 216 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests=
-g-file-info-don-t-assume-million-in-one-ev.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests=
-meson.build-do-not-use-can_run_host_binari.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch=
<br>
=C2=A0delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patc=
h<br>
=C2=A0rename meta/recipes-core/glib-2.0/{<a href=3D"http://glib-2.0_2.74.6.=
bb" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.74.6.bb</a> =3D&gt; <a =
href=3D"http://glib-2.0_2.76.0.bb" rel=3D"noreferrer" target=3D"_blank">gli=
b-2.0_2.76.0.bb</a>} (87%)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info=
-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch<br>
deleted file mode 100644<br>
index 57ada66907..0000000000<br>
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-=
assume-million-in-one-ev.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 2001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
-Date: Tue, 6 Jul 2021 19:26:03 +0100<br>
-Subject: [PATCH] gio/tests/g-file-info: don&#39;t assume million-in-one ev=
ents<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glib/=
-/merge_requests/2990" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
gnome.org/GNOME/glib/-/merge_requests/2990</a>]<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
-<br>
- don&#39;t happen<br>
-<br>
-The access and creation time tests create a file, gets the time in<br>
-seconds, then gets the time in microseconds and assumes that the<br>
-difference between the two has to be above 0.<br>
-<br>
-As rare as this may be, it can happen:<br>
-<br>
-$ stat g-file-info-test-50A450 -c %y<br>
-2021-07-06 18:24:56.000000767 +0100<br>
-<br>
-Change the test to simply assert that the difference not negative to<br>
-handle this case.<br>
-<br>
-This is the same fix as 289f8b, but that was just modification time.<br>
-<br>
----<br>
- gio/tests/g-file-info.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c<br>
-index d9ad045..c9b12b0 100644<br>
---- a/gio/tests/g-file-info.c<br>
-+++ b/gio/tests/g-file-info.c<br>
-@@ -307,7 +307,7 @@ test_g_file_info_access_time (void)<br>
-=C2=A0 =C2=A0g_assert_nonnull (dt_usecs);<br>
- <br>
-=C2=A0 =C2=A0ts =3D g_date_time_difference (dt_usecs, dt);<br>
--=C2=A0 g_assert_cmpint (ts, &gt;, 0);<br>
-+=C2=A0 g_assert_cmpint (ts, &gt;=3D, 0);<br>
-=C2=A0 =C2=A0g_assert_cmpint (ts, &lt;, G_USEC_PER_SEC);<br>
- <br>
-=C2=A0 =C2=A0/* Try again with nanosecond precision. */<br>
-@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void)<br>
-=C2=A0 =C2=A0g_assert_nonnull (dt_usecs);<br>
- <br>
-=C2=A0 =C2=A0ts =3D g_date_time_difference (dt_usecs, dt);<br>
--=C2=A0 g_assert_cmpint (ts, &gt;, 0);<br>
-+=C2=A0 g_assert_cmpint (ts, &gt;=3D, 0);<br>
-=C2=A0 =C2=A0g_assert_cmpint (ts, &lt;, G_USEC_PER_SEC);<br>
- <br>
-=C2=A0 =C2=A0/* Try again with nanosecond precision. */<br>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build=
-do-not-use-can_run_host_binari.patch b/meta/recipes-core/glib-2.0/glib-2.0=
/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch<br>
deleted file mode 100644<br>
index db08b5af55..0000000000<br>
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not=
-use-can_run_host_binari.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
-Date: Fri, 11 Nov 2022 13:12:42 +0100<br>
-Subject: [PATCH] tests/meson.build: do not use can_run_host_binaries()<br>
-<br>
-can_run_host_binaries() returns true even when cross compiling,<br>
-if there is an executable wrapper defined that can run<br>
-cross-binaries under some kind of emulation.<br>
-<br>
-Unfortunately, custom_target() will not use the wrapper<br>
-and will attempt to execute the command directly. Until<br>
-this is addressed in meson upstream, we have to disable<br>
-these targets in cross scenarios.<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.gnome.org/GNOME/glib=
/-/merge_requests/3067" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.gnome.org/GNOME/glib/-/merge_requests/3067</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
-<br>
----<br>
- gio/tests/meson.build=C2=A0 | 2 +-<br>
- glib/tests/meson.build | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/gio/tests/meson.build b/gio/tests/meson.build<br>
-index 49cfa25ce..ea59656f9 100644<br>
---- a/gio/tests/meson.build<br>
-+++ b/gio/tests/meson.build<br>
-@@ -652,7 +652,7 @@ if installed_tests_enabled<br>
-=C2=A0 =C2=A0endforeach<br>
- endif<br>
- <br>
--if meson.can_run_host_binaries()<br>
-+if not meson.is_cross_build()<br>
- <br>
-=C2=A0 =C2=A0compiler_type =3D &#39;--compiler=3D@0@&#39;.format(cc.get_id=
())<br>
- <br>
-diff --git a/glib/tests/meson.build b/glib/tests/meson.build<br>
-index 69508178e..e4f75f302 100644<br>
---- a/glib/tests/meson.build<br>
-+++ b/glib/tests/meson.build<br>
-@@ -411,7 +411,7 @@ executable(&#39;testing-helper&#39;, &#39;testing-help=
er.c&#39;,<br>
- )<br>
- <br>
- # some testing of gtester functionality<br>
--if meson.can_run_host_binaries() and host_system !=3D &#39;windows&#39;<b=
r>
-+if not meson.is_cross_build() and host_system !=3D &#39;windows&#39;<br>
-=C2=A0 =C2=A0xmllint =3D find_program(&#39;xmllint&#39;, required: false)<=
br>
-=C2=A0 =C2=A0if xmllint.found()<br>
-=C2=A0 =C2=A0 =C2=A0tmpsample_xml =3D custom_target(&#39;tmpsample.xml&#39=
;,<br>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch b/meta/reci=
pes-core/glib-2.0/glib-2.0/cpp-null.patch<br>
deleted file mode 100644<br>
index 63cbf90ab2..0000000000<br>
--- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch<br>
+++ /dev/null<br>
@@ -1,77 +0,0 @@<br>
-From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Marco=3D20Trevisan=3D20=3D28Trevi=3DC3=3DB1o=3D29?=3D &l=
t;<a href=3D"mailto:mail@3v1n0.net" target=3D"_blank">mail@3v1n0.net</a>&gt=
;<br>
-Date: Sat, 29 Oct 2022 04:30:52 +0200<br>
-Subject: [PATCH] glib/gmacros: Always define NULL as nullptr in C++11 and<=
br>
- newer<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glib/=
-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec67=
5b76b4bfa72a6885cde6066</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- glib/gmacros.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++++-<br>
- glib/tests/cxx.cpp | 13 -------------<br>
- 2 files changed, 8 insertions(+), 14 deletions(-)<br>
-<br>
-diff --git a/glib/gmacros.h b/glib/gmacros.h<br>
-index 5302841105..9fe8270822 100644<br>
---- a/glib/gmacros.h<br>
-+++ b/glib/gmacros.h<br>
-@@ -870,10 +870,17 @@<br>
-=C2=A0 */<br>
- #ifndef NULL<br>
- #=C2=A0 ifdef __cplusplus<br>
--#=C2=A0 define NULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0L)<br>
-+#=C2=A0 =C2=A0 if __cplusplus &gt;=3D 201103L<br>
-+#=C2=A0 =C2=A0 =C2=A0 define NULL (nullptr)<br>
-+#=C2=A0 =C2=A0 else<br>
-+#=C2=A0 =C2=A0 =C2=A0 define NULL (0L)<br>
-+#=C2=A0 =C2=A0 endif /* __cplusplus &gt;=3D 201103L */<br>
- #=C2=A0 else /* !__cplusplus */<br>
- #=C2=A0 define NULL=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((void*) 0)<br>
- #=C2=A0 endif /* !__cplusplus */<br>
-+#elif defined (__cplusplus) &amp;&amp; __cplusplus &gt;=3D 201103L<br>
-+#=C2=A0 undef NULL<br>
-+#=C2=A0 define NULL (nullptr)<br>
- #endif<br>
- <br>
- #ifndef=C2=A0 =C2=A0 =C2=A0 =C2=A0FALSE<br>
-diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp<br>
-index 6ac60791c8..045457c6e2 100644<br>
---- a/glib/tests/cxx.cpp<br>
-+++ b/glib/tests/cxx.cpp<br>
-@@ -34,21 +34,12 @@ test_typeof (void)<br>
-=C2=A0 =C2=A0MyObject *obj3 =3D g_atomic_pointer_get (&amp;obj2);<br>
-=C2=A0 =C2=A0g_assert_true (obj3 =3D=3D obj);<br>
- <br>
--#if __cplusplus &gt;=3D 201103L<br>
--=C2=A0 MyObject *obj4 =3D nullptr;<br>
--#else<br>
-=C2=A0 =C2=A0MyObject *obj4 =3D NULL;<br>
--#endif<br>
-=C2=A0 =C2=A0g_atomic_pointer_set (&amp;obj4, obj3);<br>
-=C2=A0 =C2=A0g_assert_true (obj4 =3D=3D obj);<br>
- <br>
--#if __cplusplus &gt;=3D 201103L<br>
--=C2=A0 MyObject *obj5 =3D nullptr;<br>
--=C2=A0 g_atomic_pointer_compare_and_exchange (&amp;obj5, nullptr, obj4);<=
br>
--#else<br>
-=C2=A0 =C2=A0MyObject *obj5 =3D NULL;<br>
-=C2=A0 =C2=A0g_atomic_pointer_compare_and_exchange (&amp;obj5, NULL, obj4)=
;<br>
--#endif<br>
-=C2=A0 =C2=A0g_assert_true (obj5 =3D=3D obj);<br>
- <br>
-=C2=A0 =C2=A0MyObject *obj6 =3D g_steal_pointer (&amp;obj5);<br>
-@@ -195,11 +186,7 @@ test_steal_pointer (void)<br>
- int<br>
- main (int argc, char *argv[])<br>
- {<br>
--#if __cplusplus &gt;=3D 201103L<br>
--=C2=A0 g_test_init (&amp;argc, &amp;argv, nullptr);<br>
--#else<br>
-=C2=A0 =C2=A0g_test_init (&amp;argc, &amp;argv, NULL);<br>
--#endif<br>
- <br>
-=C2=A0 =C2=A0g_test_add_func (&quot;/C++/typeof&quot;, test_typeof);<br>
-=C2=A0 =C2=A0g_test_add_func (&quot;/C++/atomic-pointer-compare-and-exchan=
ge&quot;, test_atomic_pointer_compare_and_exchange);<br>
--- <br>
-GitLab<br>
-<br>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch b/meta/rec=
ipes-core/glib-2.0/glib-2.0/cpp-null2.patch<br>
deleted file mode 100644<br>
index 763d5ce539..0000000000<br>
--- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Marco=3D20Trevisan=3D20=3D28Trevi=3DC3=3DB1o=3D29?=3D &l=
t;<a href=3D"mailto:mail@3v1n0.net" target=3D"_blank">mail@3v1n0.net</a>&gt=
;<br>
-Date: Sat, 29 Oct 2022 04:16:00 +0200<br>
-Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a pointer=
<br>
- type<br>
-<br>
-Otherwise it may not be recognized as valid sentinel<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/glib/=
-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f5=
17c6bc80436fe72c1dcdeb4</a>]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- glib/tests/cxx.cpp | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp<br>
-index 045457c6e2..aa5e0cb576 100644<br>
---- a/glib/tests/cxx.cpp<br>
-+++ b/glib/tests/cxx.cpp<br>
-@@ -186,7 +186,11 @@ test_steal_pointer (void)<br>
- int<br>
- main (int argc, char *argv[])<br>
- {<br>
-+#if __cplusplus &gt;=3D 201103L<br>
-=C2=A0 =C2=A0g_test_init (&amp;argc, &amp;argv, NULL);<br>
-+#else<br>
-+=C2=A0 g_test_init (&amp;argc, &amp;argv, static_cast&lt;void *&gt;(NULL)=
);<br>
-+#endif<br>
- <br>
-=C2=A0 =C2=A0g_test_add_func (&quot;/C++/typeof&quot;, test_typeof);<br>
-=C2=A0 =C2=A0g_test_add_func (&quot;/C++/atomic-pointer-compare-and-exchan=
ge&quot;, test_atomic_pointer_compare_and_exchange);<br>
--- <br>
-GitLab<br>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch<br>
index ae6881b61e..4a2eb3b1a7 100644<br>
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch<br>
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch<br>
@@ -14,6 +14,9 @@ Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.bur=
ton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
=C2=A0Port patch to 2.48<br>
=C2=A0Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@in=
tel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
<br>
+Port patch to 2.75<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 gio/giomodule.c | 12 +++++++++++-<br>
=C2=A0 1 file changed, 11 insertions(+), 1 deletion(-)<br>
@@ -31,7 +34,7 @@ index f5dbb45..c926e77 100644<br>
=C2=A0 #endif<br>
=C2=A0 #include &lt;glib/gstdio.h&gt;<br>
<br>
-@@ -1261,7 +1263,15 @@ get_gio_module_dir (void)<br>
+@@ -1270,7 +1272,15 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free (install_dir);<br>
=C2=A0 #else<br>
@@ -45,6 +48,6 @@ index f5dbb45..c926e77 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 module_dir =3D g_strdup (GIO_MODULE_DIR)=
;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 }<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
+ #ifdef __APPLE__<br>
+ #include &quot;TargetConditionals.h&quot;<br>
+ #if TARGET_OS_OSX<br>
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-c=
ore/glib-2.0/glib-2.0/run-ptest<br>
index c476d67310..b10a72ffa1 100644<br>
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest<br>
+++ b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest<br>
@@ -5,6 +5,6 @@ if id -u glib2-test; then<br>
=C2=A0 =C2=A0 userdel glib2-test<br>
=C2=A0fi<br>
=C2=A0useradd glib2-test<br>
-cd /tmp<br>
+cd /var/volatile/tmp<br>
=C2=A0su glib2-test -c &#39;gnome-desktop-testing-runner glib&#39;<br>
=C2=A0userdel glib2-test<br>
diff --git a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.74.6.b=
b" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.74.6.bb</a> b/meta/recip=
es-core/glib-2.0/<a href=3D"http://glib-2.0_2.76.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">glib-2.0_2.76.0.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.74.6.bb=
" rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.74.6.bb</a><br>
rename to meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.76.0.bb" =
rel=3D"noreferrer" target=3D"_blank">glib-2.0_2.76.0.bb</a><br>
index 5b79ae481c..550b5cab4c 100644<br>
--- a/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.74.6.bb" rel=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.74.6.bb</a><br>
+++ b/meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.76.0.bb" rel=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.76.0.bb</a><br>
@@ -14,14 +14,10 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/glib=
-${PV}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-write-bindir-i=
nto-pkg-config-files.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-Run-atomics-tes=
t-on-clang-as-well.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gio-tests-resources.c=
-comment-out-a-build-host-only-.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gio-tests-g-file-info=
-don-t-assume-million-in-one-ev.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gio-tests-meson.build=
-do-not-use-can_run_host_binari.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cpp-null.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cpp-null2.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:class-native =3D &quot; file://relocate-modules.patch&=
quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;069cf7e51cd261eb163aaf06c8d1754c6835f31252180=
aff5814e5afc7757fbc&quot;<br>
+SRC_URI[sha256sum] =3D &quot;525bb703b807142e1aee5ccf222c344e8064b21c0c456=
77ef594e587874c6797&quot;<br>
<br>
=C2=A0# Find any meson cross files in FILESPATH that are relevant for the c=
urrent<br>
=C2=A0# build (using siteinfo) and add them to EXTRA_OEMESON.<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178523): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178523" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178523</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97622689/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97622689/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>

--000000000000bdd73205f6eb472e--

