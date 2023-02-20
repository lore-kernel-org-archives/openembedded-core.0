Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37852C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:17:21 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.17220.1676909835324553283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TLrCiFf3;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id s22so2233611lfi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sew0ycfF10/EUqWKn3O/aHyXmLWnHgRNGhURj4Lhv4g=;
        b=TLrCiFf3m0h26G2dDd6iRj+weWZlF9Eg0z5K0uf9FRsq7BU3AJuCBREv5lnbc/oajB
         ngYsRYSHrDbU1zVRgK75OrfqtsGZajFuVtPVdnuw5yB+kwqF0OYO/B2atooaih9za715
         ycbc0sEguC50BEWEIwSsGplC0zsl2vgf/4cT6/e8urruz1+vNFm1lRwYHVViKP51S5EG
         aZe7VDtUEs/0FFEGTtDNPm9A0XQdtrIcPvS2M1DknK/Mq8O5WC+h3ghX67xkdD5aiDfv
         P/u9tAhZPso5Bimz0VIWKlUlep12KDSkT4dxvciOFLD0e02My1M4xbP6EzuN7rpzgdPg
         zlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sew0ycfF10/EUqWKn3O/aHyXmLWnHgRNGhURj4Lhv4g=;
        b=uCaD/J27c23ESnPSdNJqdVBhv074WIaB7u056DmryP2us+2vrO7Tyq0SQkghBUEd+I
         5vfz2T89bkU8S/fgu5ZqRH/ZNX6XHDy3U9q8GLWj32Jq1dv8jZQ40zqW9IEbWM3+9hKz
         xjXSTFnERAk5F71DMesQ7T/D3OfJdWcsZ2O2v9pKJRbaB7HQ3IddMwMQ1kzQpYhT55wc
         6tsakjcQXStakeYa34syvCs2URcDKr3ao6xAiAQDbIRoy/aFRDQfh83uKxThfnE8crIV
         csbDvqhjeFgj/I1eFpehQZXAeQ+YAIMuIIdqiYKEgpDbq9Q/eH5aw15wezg4piiR87x0
         Bdow==
X-Gm-Message-State: AO0yUKWHWHNNrofQgLe0XGJuCxh2iNFKiILfpS5lcZqwdKzlBsLOSHF1
	WVQa5TSHZDP711oYmF1DpWFzdnZ0V8j5yL1quik=
X-Google-Smtp-Source: AK7set/MnJffOpYumFWrDSvmKvoJnOF6byWBVIoln/waJdTjbG6uKwFIfFqpQ76pHWBIGdHPBAMRrDgpfeSynI+iLhU=
X-Received: by 2002:a19:f004:0:b0:4db:3fd1:6ac3 with SMTP id
 p4-20020a19f004000000b004db3fd16ac3mr834419lfc.11.1676909833386; Mon, 20 Feb
 2023 08:17:13 -0800 (PST)
MIME-Version: 1.0
References: <20230220161045.97515-1-f_l_k@t-online.de> <MQZDQR.7MY2GTZPCC242@t-online.de>
In-Reply-To: <MQZDQR.7MY2GTZPCC242@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Feb 2023 17:17:02 +0100
Message-ID: <CANNYZj--bPnnBKRhbY5oO_WvuRN+gdP0yxOU-3OeLHjfGdsbiA@mail.gmail.com>
Subject: Re: [oe-core][RFC][PATCH] glib-2.0: update 2.74.5 -> 2.75.3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177433

Most likely merging gnome 44 updates will have to wait until after
mickledore is out. Historically, gnome releases happen too late for
making it into 'spring' yocto releases.

Alex

On Mon, 20 Feb 2023 at 17:13, Markus Volk <f_l_k@t-online.de> wrote:
>
> This was marked [RFC] because I'm unsure if glib-2.0-2.76 will be release=
d in time for mickledore but this update would be required for the upcoming=
 gnome 44 release. (gnome-control-center requires glib >=3D 2.75.0)
>
> Am Mo, 20. Feb 2023 um 17:10:45 +0100 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> - Remove backported patches - Port relocate-modules.patch Signed-off-by: =
Markus Volk <f_l_k@t-online.de> --- ...-info-don-t-assume-million-in-one-ev=
.patch | 50 ------------ ...build-do-not-use-can_run_host_binari.patch | 48=
 ------------ .../glib-2.0/glib-2.0/cpp-null.patch | 77 -------------------=
 .../glib-2.0/glib-2.0/cpp-null2.patch | 31 -------- .../glib-2.0/glib-2.0/=
relocate-modules.patch | 11 ++- ...{glib-2.0_2.74.5.bb =3D> glib-2.0_2.75.3=
.bb} | 6 +- 6 files changed, 8 insertions(+), 215 deletions(-) delete mode =
100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t=
-assume-million-in-one-ev.patch delete mode 100644 meta/recipes-core/glib-2=
.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch=
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch dele=
te mode 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch rename m=
eta/recipes-core/glib-2.0/{glib-2.0_2.74.5.bb =3D> glib-2.0_2.75.3.bb} (87%=
) diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-in=
fo-don-t-assume-million-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2=
.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch deleted =
file mode 100644 index 57ada66907..0000000000 --- a/meta/recipes-core/glib-=
2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patc=
h +++ /dev/null @@ -1,50 +0,0 @@ -From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d=
563e Mon Sep 17 00:00:00 2001 -From: Ross Burton <ross.burton@arm.com> -Dat=
e: Tue, 6 Jul 2021 19:26:03 +0100 -Subject: [PATCH] gio/tests/g-file-info: =
don't assume million-in-one events - -Upstream-Status: Backport [https://gi=
tlab.gnome.org/GNOME/glib/-/merge_requests/2990] -Signed-off-by: Ross Burto=
n <ross.burton@arm.com> - - don't happen - -The access and creation time te=
sts create a file, gets the time in -seconds, then gets the time in microse=
conds and assumes that the -difference between the two has to be above 0. -=
 -As rare as this may be, it can happen: - -$ stat g-file-info-test-50A450 =
-c %y -2021-07-06 18:24:56.000000767 +0100 - -Change the test to simply ass=
ert that the difference not negative to -handle this case. - -This is the s=
ame fix as 289f8b, but that was just modification time. - ---- - gio/tests/=
g-file-info.c | 4 ++-- - 1 file changed, 2 insertions(+), 2 deletions(-) - =
-diff --git a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c -index d9ad=
045..c9b12b0 100644 ---- a/gio/tests/g-file-info.c -+++ b/gio/tests/g-file-=
info.c -@@ -307,7 +307,7 @@ test_g_file_info_access_time (void) - g_assert_=
nonnull (dt_usecs); - - ts =3D g_date_time_difference (dt_usecs, dt); -- g_=
assert_cmpint (ts, >, 0); -+ g_assert_cmpint (ts, >=3D, 0); - g_assert_cmpi=
nt (ts, <, G_USEC_PER_SEC); - - /* Try again with nanosecond precision. */ =
-@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void) - g_assert_nonnu=
ll (dt_usecs); - - ts =3D g_date_time_difference (dt_usecs, dt); -- g_asser=
t_cmpint (ts, >, 0); -+ g_assert_cmpint (ts, >=3D, 0); - g_assert_cmpint (t=
s, <, G_USEC_PER_SEC); - - /* Try again with nanosecond precision. */ diff =
--git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-n=
ot-use-can_run_host_binari.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001=
-gio-tests-meson.build-do-not-use-can_run_host_binari.patch deleted file mo=
de 100644 index db08b5af55..0000000000 --- a/meta/recipes-core/glib-2.0/gli=
b-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch +++ /=
dev/null @@ -1,48 +0,0 @@ -From fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mo=
n Sep 17 00:00:00 2001 -From: Alexander Kanavin <alex@linutronix.de> -Date:=
 Fri, 11 Nov 2022 13:12:42 +0100 -Subject: [PATCH] tests/meson.build: do no=
t use can_run_host_binaries() - -can_run_host_binaries() returns true even =
when cross compiling, -if there is an executable wrapper defined that can r=
un -cross-binaries under some kind of emulation. - -Unfortunately, custom_t=
arget() will not use the wrapper -and will attempt to execute the command d=
irectly. Until -this is addressed in meson upstream, we have to disable -th=
ese targets in cross scenarios. - -Upstream-Status: Submitted [https://gitl=
ab.gnome.org/GNOME/glib/-/merge_requests/3067] -Signed-off-by: Alexander Ka=
navin <alex@linutronix.de> - ---- - gio/tests/meson.build | 2 +- - glib/tes=
ts/meson.build | 2 +- - 2 files changed, 2 insertions(+), 2 deletions(-) - =
-diff --git a/gio/tests/meson.build b/gio/tests/meson.build -index 49cfa25c=
e..ea59656f9 100644 ---- a/gio/tests/meson.build -+++ b/gio/tests/meson.bui=
ld -@@ -652,7 +652,7 @@ if installed_tests_enabled - endforeach - endif - -=
-if meson.can_run_host_binaries() -+if not meson.is_cross_build() - - compi=
ler_type =3D '--compiler=3D@0@'.format(cc.get_id()) - -diff --git a/glib/te=
sts/meson.build b/glib/tests/meson.build -index 69508178e..e4f75f302 100644=
 ---- a/glib/tests/meson.build -+++ b/glib/tests/meson.build -@@ -411,7 +41=
1,7 @@ executable('testing-helper', 'testing-helper.c', - ) - - # some test=
ing of gtester functionality --if meson.can_run_host_binaries() and host_sy=
stem !=3D 'windows' -+if not meson.is_cross_build() and host_system !=3D 'w=
indows' - xmllint =3D find_program('xmllint', required: false) - if xmllint=
.found() - tmpsample_xml =3D custom_target('tmpsample.xml', diff --git a/me=
ta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch b/meta/recipes-core/glib-2=
.0/glib-2.0/cpp-null.patch deleted file mode 100644 index 63cbf90ab2..00000=
00000 --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch +++ /dev/nul=
l @@ -1,77 +0,0 @@ -From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon Sep 1=
7 00:00:00 2001 -From: =3D?UTF-8?q?Marco=3D20Trevisan=3D20=3D28Trevi=3DC3=
=3DB1o=3D29?=3D <mail@3v1n0.net> -Date: Sat, 29 Oct 2022 04:30:52 +0200 -Su=
bject: [PATCH] glib/gmacros: Always define NULL as nullptr in C++11 and - n=
ewer - -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/co=
mmit/0ca5254c5d92aec675b76b4bfa72a6885cde6066] -Signed-off-by: Alexander Ka=
navin <alex@linutronix.de> ---- - glib/gmacros.h | 9 ++++++++- - glib/tests=
/cxx.cpp | 13 ------------- - 2 files changed, 8 insertions(+), 14 deletion=
s(-) - -diff --git a/glib/gmacros.h b/glib/gmacros.h -index 5302841105..9fe=
8270822 100644 ---- a/glib/gmacros.h -+++ b/glib/gmacros.h -@@ -870,10 +870=
,17 @@ - */ - #ifndef NULL - # ifdef __cplusplus --# define NULL (0L) -+# i=
f __cplusplus >=3D 201103L -+# define NULL (nullptr) -+# else -+# define NU=
LL (0L) -+# endif /* __cplusplus >=3D 201103L */ - # else /* !__cplusplus *=
/ - # define NULL ((void*) 0) - # endif /* !__cplusplus */ -+#elif defined =
(__cplusplus) && __cplusplus >=3D 201103L -+# undef NULL -+# define NULL (n=
ullptr) - #endif - - #ifndef FALSE -diff --git a/glib/tests/cxx.cpp b/glib/=
tests/cxx.cpp -index 6ac60791c8..045457c6e2 100644 ---- a/glib/tests/cxx.cp=
p -+++ b/glib/tests/cxx.cpp -@@ -34,21 +34,12 @@ test_typeof (void) - MyObj=
ect *obj3 =3D g_atomic_pointer_get (&obj2); - g_assert_true (obj3 =3D=3D ob=
j); - --#if __cplusplus >=3D 201103L -- MyObject *obj4 =3D nullptr; --#else=
 - MyObject *obj4 =3D NULL; --#endif - g_atomic_pointer_set (&obj4, obj3); =
- g_assert_true (obj4 =3D=3D obj); - --#if __cplusplus >=3D 201103L -- MyOb=
ject *obj5 =3D nullptr; -- g_atomic_pointer_compare_and_exchange (&obj5, nu=
llptr, obj4); --#else - MyObject *obj5 =3D NULL; - g_atomic_pointer_compare=
_and_exchange (&obj5, NULL, obj4); --#endif - g_assert_true (obj5 =3D=3D ob=
j); - - MyObject *obj6 =3D g_steal_pointer (&obj5); -@@ -195,11 +186,7 @@ t=
est_steal_pointer (void) - int - main (int argc, char *argv[]) - { --#if __=
cplusplus >=3D 201103L -- g_test_init (&argc, &argv, nullptr); --#else - g_=
test_init (&argc, &argv, NULL); --#endif - - g_test_add_func ("/C++/typeof"=
, test_typeof); - g_test_add_func ("/C++/atomic-pointer-compare-and-exchang=
e", test_atomic_pointer_compare_and_exchange); --- -GitLab - diff --git a/m=
eta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch b/meta/recipes-core/glib=
-2.0/glib-2.0/cpp-null2.patch deleted file mode 100644 index 763d5ce539..00=
00000000 --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch +++ /dev=
/null @@ -1,31 +0,0 @@ -From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon S=
ep 17 00:00:00 2001 -From: =3D?UTF-8?q?Marco=3D20Trevisan=3D20=3D28Trevi=3D=
C3=3DB1o=3D29?=3D <mail@3v1n0.net> -Date: Sat, 29 Oct 2022 04:16:00 +0200 -=
Subject: [PATCH] glib/tests/cxx: Ensure NULL is always casted to a pointer =
- type - -Otherwise it may not be recognized as valid sentinel -Upstream-St=
atus: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e=
3f517c6bc80436fe72c1dcdeb4] -Signed-off-by: Alexander Kanavin <alex@linutro=
nix.de> ---- - glib/tests/cxx.cpp | 4 ++++ - 1 file changed, 4 insertions(+=
) - -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp -index 045457c6e2=
..aa5e0cb576 100644 ---- a/glib/tests/cxx.cpp -+++ b/glib/tests/cxx.cpp -@@=
 -186,7 +186,11 @@ test_steal_pointer (void) - int - main (int argc, char *=
argv[]) - { -+#if __cplusplus >=3D 201103L - g_test_init (&argc, &argv, NUL=
L); -+#else -+ g_test_init (&argc, &argv, static_cast<void *>(NULL)); -+#en=
dif - - g_test_add_func ("/C++/typeof", test_typeof); - g_test_add_func ("/=
C++/atomic-pointer-compare-and-exchange", test_atomic_pointer_compare_and_e=
xchange); --- -GitLab diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relo=
cate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.p=
atch index ae6881b61e..4a2eb3b1a7 100644 --- a/meta/recipes-core/glib-2.0/g=
lib-2.0/relocate-modules.patch +++ b/meta/recipes-core/glib-2.0/glib-2.0/re=
locate-modules.patch @@ -14,6 +14,9 @@ Signed-off-by: Ross Burton <ross.bur=
ton@intel.com> Port patch to 2.48 Signed-off-by: Jussi Kukkonen <jussi.kukk=
onen@intel.com> +Port patch to 2.75 +Signed-off-by: Markus Volk <f_l_k@t-on=
line.de> + --- gio/giomodule.c | 12 +++++++++++- 1 file changed, 11 inserti=
ons(+), 1 deletion(-) @@ -31,7 +34,7 @@ index f5dbb45..c926e77 100644 #endi=
f #include <glib/gstdio.h> -@@ -1261,7 +1263,15 @@ get_gio_module_dir (void=
) +@@ -1270,7 +1272,15 @@ NULL); g_free (install_dir); #else @@ -45,6 +48,6=
 @@ index f5dbb45..c926e77 100644 + } else { + module_dir =3D g_strdup (GIO=
_MODULE_DIR); + } - #endif - } - + #ifdef __APPLE__ + #include "TargetCondi=
tionals.h" + #if TARGET_OS_OSX diff --git a/meta/recipes-core/glib-2.0/glib=
-2.0_2.74.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb similarity i=
ndex 87% rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb rename t=
o meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb index d54f077cb0..40c712612=
0 100644 --- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb +++ b/meta/rec=
ipes-core/glib-2.0/glib-2.0_2.75.3.bb @@ -14,14 +14,10 @@ SRC_URI =3D "${GN=
OME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \ file://0001-Do-not-write-b=
indir-into-pkg-config-files.patch \ file://0001-meson-Run-atomics-test-on-c=
lang-as-well.patch \ file://0001-gio-tests-resources.c-comment-out-a-build-=
host-only-.patch \ - file://0001-gio-tests-g-file-info-don-t-assume-million=
-in-one-ev.patch \ - file://0001-gio-tests-meson.build-do-not-use-can_run_h=
ost_binari.patch \ - file://cpp-null.patch \ - file://cpp-null2.patch \ " S=
RC_URI:append:class-native =3D " file://relocate-modules.patch" -SRC_URI[sh=
a256sum] =3D "ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608a5c1=
4c8" +SRC_URI[sha256sum] =3D "7c517d0aff456c35a039bce8a8df7a08ce95a8285b09d=
1849f8865f633f7f871" # Find any meson cross files in FILESPATH that are rel=
evant for the current # build (using siteinfo) and add them to EXTRA_OEMESO=
N.
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177432): https://lists.openembedded.org/g/openembedde=
d-core/message/177432
> Mute This Topic: https://lists.openembedded.org/mt/97088929/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

