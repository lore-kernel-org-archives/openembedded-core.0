Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web12.34017.1611564129131546606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 00:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mkBC9qzZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id y8so948248vky.4
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 00:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ssOh9pc438KqEUMY4daWoB6UzPYHL1uMTvQenoQwgNw=;
        b=mkBC9qzZKLQ8VegBkNJyOVy9AFDFbSvdWPpe1y9vxmexNagQMLIZsiqYFPjzFx+DTI
         9QdrIGfuRVFpnSOn7KQ2yYmBMec2EXw49xz8J3nEJ75AebYhgsv5nqw44uA76DSTOv1h
         7e3iI9l/W1SFCs8ZLeF+lsHEolyjvvHrGUeHbNNSWqWSev3BAD0mIuiH32xS/WVm5zyN
         Umc6MSl3rfVyrQzSftE0CxxaTEJJMAiT4sIqie+v0yA2gAclRIC+a842H55PpSjV498G
         qJyY6tdjg602Glje6FyKgvlCbYQfA/C5JvVrNaHTfmsjWlMl01/3UdYXkMx9kR/pP/Bx
         VtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ssOh9pc438KqEUMY4daWoB6UzPYHL1uMTvQenoQwgNw=;
        b=CUn2Z31rJlRzqMPBHnAlWQBqaBif6KMnZYsdpzo4zrvUuCgkK5UTzdRun0cpZgEroc
         uNfIFh4zblwbdxTO2sIJxCbhxVIt7tozRfl2FXk/9yEErqlsROY2yepwqLKA5l9rroY9
         asjBGY1gKcP1ZvEhvKR01M0N2ESelKCv0MH8z0OLZMJT+9vAd2ZcOWQPJpRS3a2XjIA4
         M2f8wsWVIN827yYgoeZnx9MQnwb+AXj8OvtY5etYBna4E1G5z4UIqTB75tN80Gzs8F/f
         NL/AI//pM2W74ZVQ9A5TEIH57WrHcyJtYfZxAAxjGtlsTpbZXbgG91nYC8HvWThh/E+l
         rloQ==
X-Gm-Message-State: AOAM530/Jx+GxhJVqYKMNtjwLy4wcxMlLczHvp1CDNV72jYkTcJLF+1c
	m8mnGLXsNhWkZffyXnO9iA/YxSUzQBmAvQ9A6aw=
X-Google-Smtp-Source: ABdhPJy/Vi/OkjH0zB6Xou6VdLtvX2YoU8JeF7hJWjOh7Dx6BRKLCTjWVVcAn752zmVXP7HRMJtFqAcPCLEuFRsC9wc=
X-Received: by 2002:a1f:27cf:: with SMTP id n198mr281357vkn.16.1611564128249;
 Mon, 25 Jan 2021 00:42:08 -0800 (PST)
MIME-Version: 1.0
References: <1611537373-1667-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1611537373-1667-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 25 Jan 2021 09:41:56 +0100
Message-ID: <CANNYZj9=hnobX-y=zPSYoNpogtRrtPJR0XojYR7jVyJ1GY-hOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wayland: upgrade 1.18.0 -> 1.18.92
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065ad1605b9b583a7"

--00000000000065ad1605b9b583a7
Content-Type: text/plain; charset="UTF-8"

1.18.92 is a pre-release, which should be obvious from the version number.

Alex

On Mon, 25 Jan 2021 at 02:16, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> 0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
> removed since it is included in 1.18.92
>
> refresh the following patches:
> 0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> 0002-meson.build-find-the-native-wayland-scanner-directly.patch
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...missing-dependencies-on-protocol-hea.patch | 115 ------------------
>  ...hardcode-the-path-to-wayland-scanner.patch |  23 ++--
>  ...-the-native-wayland-scanner-directly.patch |  15 ++-
>  .../{wayland_1.18.0.bb => wayland_1.18.92.bb} |   5 +-
>  4 files changed, 24 insertions(+), 134 deletions(-)
>  delete mode 100644
> meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
>  rename meta/recipes-graphics/wayland/{wayland_1.18.0.bb =>
> wayland_1.18.92.bb} (91%)
>
> diff --git
> a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
> b/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
> deleted file mode 100644
> index 61de0e04e8..0000000000
> ---
> a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
> +++ /dev/null
> @@ -1,115 +0,0 @@
> -From b2c74f6a3dbe0aee2413800837314136947a4985 Mon Sep 17 00:00:00 2001
> -From: Jan Beich <jbeich@FreeBSD.org>
> -Date: Sat, 15 Feb 2020 02:03:45 +0000
> -Subject: [PATCH] meson/tests: add missing dependencies on protocol headers
> -
> -In file included from ../tests/connection-test.c:43:
> -In file included from ../tests/test-compositor.h:30:
> -../src/wayland-client.h:40:10: fatal error: 'wayland-client-protocol.h'
> file not found
> - #include "wayland-client-protocol.h"
> -          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> -In file included from ../tests/display-test.c:45:
> -In file included from ../src/wayland-server.h:104:
> -src/wayland-server-protocol.h:4454:2: error: unterminated /* comment
> -        /**
> -        ^
> -In file included from ../tests/cpp-compile-test.cpp:2:
> -In file included from src/wayland-server-protocol.h:8:
> -In file included from ../src/wayland-server.h:104:
> -src/wayland-server-protocol.h:3:2: error: unterminated conditional
> directive
> - #ifndef WAYLAND_SERVER_PROTOCOL_H
> -  ^
> -../tests/headers-protocol-test.c:33:2: error: including
> wayland-server-protocol.h did not include wayland-server.h!
> - #error including wayland-server-protocol.h did not include
> wayland-server.h!
> -  ^
> -In file included from ../tests/headers-protocol-test.c:26:
> -In file included from src/wayland-client-protocol.h:8:
> -In file included from ../src/wayland-client.h:40:
> -src/wayland-client-protocol.h:1358:2: error: unterminated conditional
> directive
> - #ifndef WL_SHM_FORMAT_ENUM
> -  ^
> -In file included from ../tests/protocol-logger-test.c:34:
> -In file included from ../src/wayland-client.h:40:
> -src/wayland-client-protocol.h:2613:1: error: unterminated /* comment
> -/**
> -^
> -../tests/resources-test.c:49:36: error: use of undeclared identifier
> 'wl_seat_interface'
> -        res = wl_resource_create(client, &wl_seat_interface, 4, 0);
> -                                          ^
> -Upstream-Status: Backport
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - tests/meson.build | 26 ++++++++++++++++++--------
> - 1 file changed, 18 insertions(+), 8 deletions(-)
> -
> -diff --git a/tests/meson.build b/tests/meson.build
> -index c28a2a3..f1af7b4 100644
> ---- a/tests/meson.build
> -+++ b/tests/meson.build
> -@@ -69,7 +69,7 @@ test(
> -       executable(
> -               'cpp-compile-test',
> -               'cpp-compile-test.cpp',
> --              wayland_server_protocol_core_h,
> -+              wayland_server_protocol_h,
> -               include_directories: src_inc
> -       )
> - )
> -@@ -91,17 +91,25 @@ tests = {
> -       'array-test': [],
> -       'client-test': [ wayland_server_protocol_h ],
> -       'display-test': [
> -+              wayland_client_protocol_h,
> -+              wayland_server_protocol_h,
> -               tests_server_protocol_h,
> -               tests_client_protocol_c,
> -               tests_protocol_c,
> -       ],
> --      'connection-test': [ wayland_server_protocol_h ],
> -+      'connection-test': [
> -+              wayland_client_protocol_h,
> -+              wayland_server_protocol_h,
> -+      ],
> -       'event-loop-test': [ wayland_server_protocol_h ],
> -       'fixed-test': [],
> -       'interface-test': [ wayland_client_protocol_h ],
> -       'list-test': [],
> -       'map-test': [],
> --      'sanity-test' : [ wayland_server_protocol_h ],
> -+      'sanity-test' : [
> -+              wayland_client_protocol_h,
> -+              wayland_server_protocol_h,
> -+      ],
> -       'socket-test': [
> -               wayland_client_protocol_h,
> -               wayland_server_protocol_h,
> -@@ -116,7 +124,7 @@ tests = {
> -               files('../src/wayland-server.c'),
> -               wayland_server_protocol_h,
> -       ],
> --      'resources-test': [ wayland_server_protocol_core_h ],
> -+      'resources-test': [ wayland_server_protocol_h ],
> -       'message-test': [
> -               wayland_client_protocol_h,
> -               wayland_server_protocol_h,
> -@@ -126,14 +134,16 @@ tests = {
> -               wayland_server_protocol_h,
> -       ],
> -       'protocol-logger-test': [
> --              wayland_server_protocol_core_h,
> --              wayland_client_protocol_core_h,
> -+              wayland_client_protocol_h,
> -+              wayland_server_protocol_h,
> -       ],
> -       'headers-test': [
> -+              wayland_client_protocol_h,
> -+              wayland_server_protocol_h,
> -               'headers-protocol-test.c',
> --              'headers-protocol-core-test.c',
> --              wayland_server_protocol_core_h,
> -               wayland_client_protocol_core_h,
> -+              wayland_server_protocol_core_h,
> -+              'headers-protocol-core-test.c',
> -       ],
> -       'os-wrappers-test': [],
> - }
> diff --git
> a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> index 2199548bdf..f3355b27e7 100644
> ---
> a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> +++
> b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> @@ -12,15 +12,18 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/src/meson.build b/src/meson.build
> -index 294aee0..7e410fa 100644
> +index 7ca6d8f..7cc5c0f 100644
>  --- a/src/meson.build
>  +++ b/src/meson.build
> -@@ -49,7 +49,7 @@ pkgconfig.generate(
> -               'datarootdir=' + join_paths('${prefix}',
> get_option('datadir')),
> -               'pkgdatadir=' + join_paths('${datarootdir}',
> meson.project_name()),
> -               'bindir=' + join_paths('${prefix}', get_option('bindir')),
> --              'wayland_scanner=${bindir}/wayland-scanner'
> -+              'wayland_scanner=wayland-scanner'
> -       ],
> -       filebase: 'wayland-scanner'
> - )
> +@@ -52,7 +52,7 @@ if get_option('scanner')
> +                       'datarootdir=' + join_paths('${prefix}',
> get_option('datadir')),
> +                       'pkgdatadir=' + join_paths('${datarootdir}',
> meson.project_name()),
> +                       'bindir=' + join_paths('${prefix}',
> get_option('bindir')),
> +-                      'wayland_scanner=${bindir}/wayland-scanner'
> ++                      'wayland_scanner=wayland-scanner'
> +               ],
> +               filebase: 'wayland-scanner'
> +       )
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> index f98037a850..9efb22f24e 100644
> ---
> a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> +++
> b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> @@ -12,16 +12,19 @@ Signed-off-by: Alexander Kanavin <
> alex.kanavin@gmail.com>
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
>  diff --git a/src/meson.build b/src/meson.build
> -index 3e8c9bf..294aee0 100644
> +index d91c503..7ca6d8f 100644
>  --- a/src/meson.build
>  +++ b/src/meson.build
> -@@ -55,8 +55,7 @@ pkgconfig.generate(
> - )
> +@@ -59,8 +59,7 @@ if get_option('scanner')
> + endif
>
> - if meson.is_cross_build()
> --      scanner_dep = dependency('wayland-scanner', native: true, version:
> '>=1.14.0')
> + if meson.is_cross_build() or not get_option('scanner')
> +-      scanner_dep = dependency('wayland-scanner', native: true, version:
> meson.project_version())
>  -      wayland_scanner_for_build =
> find_program(scanner_dep.get_pkgconfig_variable('wayland_scanner'))
> -+      wayland_scanner_for_build = find_program('wayland-scanner')
> ++        wayland_scanner_for_build = find_program('wayland-scanner')
>   else
>         wayland_scanner_for_build = wayland_scanner
>   endif
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> b/meta/recipes-graphics/wayland/wayland_1.18.92.bb
> similarity index 91%
> rename from meta/recipes-graphics/wayland/wayland_1.18.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.18.92.bb
> index 00be3aac27..d7217981f6 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.18.92.bb
> @@ -17,10 +17,9 @@ SRC_URI = "
> https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>
> file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
>             file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
>             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
> -
>  file://0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch \
>             "
> -SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
> -SRC_URI[sha256sum] =
> "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
> +SRC_URI[md5sum] = "90f204964ee697edf46905910f0d4052"
> +SRC_URI[sha256sum] =
> "5b5696d8f58230971e848c0e25b987ab1c2b52f07eba6e88f036556606fb65cd"
>
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>
> --
> 2.25.1
>
>
>
>
> 
>
>

--00000000000065ad1605b9b583a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>1.18.92 is a pre-release, which should be obvious fro=
m the version number.<br></div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 25=
 Jan 2021 at 02:16, Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com=
">wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">0001-meson-tests-add-missing-dependencies-on-protoco=
l-hea.patch<br>
removed since it is included in 1.18.92<br>
<br>
refresh the following patches:<br>
0002-Do-not-hardcode-the-path-to-wayland-scanner.patch<br>
0002-meson.build-find-the-native-wayland-scanner-directly.patch<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" ta=
rget=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...missing-dependencies-on-protocol-hea.patch | 115 ----------------=
--<br>
=C2=A0...hardcode-the-path-to-wayland-scanner.patch |=C2=A0 23 ++--<br>
=C2=A0...-the-native-wayland-scanner-directly.patch |=C2=A0 15 ++-<br>
=C2=A0.../{<a href=3D"http://wayland_1.18.0.bb" rel=3D"noreferrer" target=
=3D"_blank">wayland_1.18.0.bb</a> =3D&gt; <a href=3D"http://wayland_1.18.9=
2.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.92.bb</a>} |=C2=A0 =
=
=C2=A05 +-<br>
=C2=A04 files changed, 24 insertions(+), 134 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-meson-=
tests-add-missing-dependencies-on-protocol-hea.patch<br>
=C2=A0rename meta/recipes-graphics/wayland/{<a href=3D"http://wayland_1.18=
.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a> =3D&gt; <=
a href=3D"http://wayland_1.18.92.bb" rel=3D"noreferrer" target=3D"_blank">w=
ayland_1.18.92.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-mi=
ssing-dependencies-on-protocol-hea.patch b/meta/recipes-graphics/wayland/wa=
yland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch<br>
deleted file mode 100644<br>
index 61de0e04e8..0000000000<br>
--- a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-d=
ependencies-on-protocol-hea.patch<br>
+++ /dev/null<br>
@@ -1,115 +0,0 @@<br>
-From b2c74f6a3dbe0aee2413800837314136947a4985 Mon Sep 17 00:00:00 2001<br=
>
-From: Jan Beich &lt;jbeich@FreeBSD.org&gt;<br>
-Date: Sat, 15 Feb 2020 02:03:45 +0000<br>
-Subject: [PATCH] meson/tests: add missing dependencies on protocol header=
s<br>
-<br>
-In file included from ../tests/connection-test.c:43:<br>
-In file included from ../tests/test-compositor.h:30:<br>
-../src/wayland-client.h:40:10: fatal error: &#39;wayland-client-protocol.=
h&#39; file not found<br>
- #include &quot;wayland-client-protocol.h&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
-In file included from ../tests/display-test.c:45:<br>
-In file included from ../src/wayland-server.h:104:<br>
-src/wayland-server-protocol.h:4454:2: error: unterminated /* comment<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
-In file included from ../tests/cpp-compile-test.cpp:2:<br>
-In file included from src/wayland-server-protocol.h:8:<br>
-In file included from ../src/wayland-server.h:104:<br>
-src/wayland-server-protocol.h:3:2: error: unterminated conditional direct=
ive<br>
- #ifndef WAYLAND_SERVER_PROTOCOL_H<br>
-=C2=A0 ^<br>
-../tests/headers-protocol-test.c:33:2: error: including wayland-server-pr=
otocol.h did not include wayland-server.h!<br>
- #error including wayland-server-protocol.h did not include wayland-serve=
r.h!<br>
-=C2=A0 ^<br>
-In file included from ../tests/headers-protocol-test.c:26:<br>
-In file included from src/wayland-client-protocol.h:8:<br>
-In file included from ../src/wayland-client.h:40:<br>
-src/wayland-client-protocol.h:1358:2: error: unterminated conditional dir=
ective<br>
- #ifndef WL_SHM_FORMAT_ENUM<br>
-=C2=A0 ^<br>
-In file included from ../tests/protocol-logger-test.c:34:<br>
-In file included from ../src/wayland-client.h:40:<br>
-src/wayland-client-protocol.h:2613:1: error: unterminated /* comment<br>
-/**<br>
-^<br>
-../tests/resources-test.c:49:36: error: use of undeclared identifier &#39=
;wl_seat_interface&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D wl_resource_create(client, &amp;wl_se=
at_interface, 4, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
^<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- tests/meson.build | 26 ++++++++++++++++++--------<br>
- 1 file changed, 18 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/tests/meson.build b/tests/meson.build<br>
-index c28a2a3..f1af7b4 100644<br>
---- a/tests/meson.build<br>
-+++ b/tests/meson.build<br>
-@@ -69,7 +69,7 @@ test(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0executable(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp-compile-t=
est&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;cpp-compile-t=
est.cpp&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_core_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include_directorie=
s: src_inc<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
- )<br>
-@@ -91,17 +91,25 @@ tests =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;array-test&#39;: [],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;client-test&#39;: [ wayland_server_protoc=
ol_h ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;display-test&#39;: [<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_client_protocol=
_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests_server_proto=
col_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests_client_proto=
col_c,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tests_protocol_c,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
--=C2=A0 =C2=A0 =C2=A0 &#39;connection-test&#39;: [ wayland_server_protoco=
l_h ],<br>
-+=C2=A0 =C2=A0 =C2=A0 &#39;connection-test&#39;: [<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_client_protocol=
_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;event-loop-test&#39;: [ wayland_server_pr=
otocol_h ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fixed-test&#39;: [],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;interface-test&#39;: [ wayland_client_pro=
tocol_h ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;list-test&#39;: [],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;map-test&#39;: [],<br>
--=C2=A0 =C2=A0 =C2=A0 &#39;sanity-test&#39; : [ wayland_server_protocol_h=
 ],<br>
-+=C2=A0 =C2=A0 =C2=A0 &#39;sanity-test&#39; : [<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_client_protocol=
_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;socket-test&#39;: [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_client_pro=
tocol_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_server_pro=
tocol_h,<br>
-@@ -116,7 +124,7 @@ tests =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files(&#39;../src/=
wayland-server.c&#39;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_server_pro=
tocol_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
--=C2=A0 =C2=A0 =C2=A0 &#39;resources-test&#39;: [ wayland_server_protocol=
_core_h ],<br>
-+=C2=A0 =C2=A0 =C2=A0 &#39;resources-test&#39;: [ wayland_server_protocol=
_h ],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;message-test&#39;: [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_client_pro=
tocol_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_server_pro=
tocol_h,<br>
-@@ -126,14 +134,16 @@ tests =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_server_pro=
tocol_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;protocol-logger-test&#39;: [<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_core_h,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_client_protocol=
_core_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_client_protocol=
_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;headers-test&#39;: [<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_client_protocol=
_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;headers-proto=
col-test.c&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;headers-protocol-c=
ore-test.c&#39;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_core_h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_client_pro=
tocol_core_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_server_protocol=
_core_h,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;headers-protocol-c=
ore-test.c&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;os-wrappers-test&#39;: [],<br>
- }<br>
diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-th=
e-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/000=
2-Do-not-hardcode-the-path-to-wayland-scanner.patch<br>
index 2199548bdf..f3355b27e7 100644<br>
--- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-=
to-wayland-scanner.patch<br>
+++ b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-=
to-wayland-scanner.patch<br>
@@ -12,15 +12,18 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/src/meson.build b/src/meson.build<br>
-index 294aee0..7e410fa 100644<br>
+index 7ca6d8f..7cc5c0f 100644<br>
=C2=A0--- a/src/meson.build<br>
=C2=A0+++ b/src/meson.build<br>
-@@ -49,7 +49,7 @@ pkgconfig.generate(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;datarootdir=
=3D&#39; + join_paths(&#39;${prefix}&#39;, get_option(&#39;datadir&#39;)),=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pkgdatadir=3D=
&#39; + join_paths(&#39;${datarootdir}&#39;, meson.project_name()),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bindir=3D&#39=
; + join_paths(&#39;${prefix}&#39;, get_option(&#39;bindir&#39;)),<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wayland_scanner=3D=
${bindir}/wayland-scanner&#39;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wayland_scanner=3D=
wayland-scanner&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0filebase: &#39;wayland-scanner&#39;<br>
- )<br>
+@@ -52,7 +52,7 @@ if get_option(&#39;scanner&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&#39;datarootdir=3D&#39; + join_paths(&#39;${prefix}&#39;, get_o=
ption(&#39;datadir&#39;)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&#39;pkgdatadir=3D&#39; + join_paths(&#39;${datarootdir}&#39;, m=
eson.project_name()),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0&#39;bindir=3D&#39; + join_paths(&#39;${prefix}&#39;, get_option=
(&#39;bindir&#39;)),<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;wayland_scanner=3D${bindir}/wayland-scanner&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;wayland_scanner=3Dwayland-scanner&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filebase: &#39;way=
land-scanner&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-t=
he-native-wayland-scanner-directly.patch b/meta/recipes-graphics/wayland/wa=
yland/0002-meson.build-find-the-native-wayland-scanner-directly.patch<br>
index f98037a850..9efb22f24e 100644<br>
--- a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-nati=
ve-wayland-scanner-directly.patch<br>
+++ b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-nati=
ve-wayland-scanner-directly.patch<br>
@@ -12,16 +12,19 @@ Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<b=
r>
=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
=C2=A0diff --git a/src/meson.build b/src/meson.build<br>
-index 3e8c9bf..294aee0 100644<br>
+index d91c503..7ca6d8f 100644<br>
=C2=A0--- a/src/meson.build<br>
=C2=A0+++ b/src/meson.build<br>
-@@ -55,8 +55,7 @@ pkgconfig.generate(<br>
- )<br>
+@@ -59,8 +59,7 @@ if get_option(&#39;scanner&#39;)<br>
+ endif<br>
<br>
- if meson.is_cross_build()<br>
--=C2=A0 =C2=A0 =C2=A0 scanner_dep =3D dependency(&#39;wayland-scanner&#39=
;, native: true, version: &#39;&gt;=3D1.14.0&#39;)<br>
+ if meson.is_cross_build() or not get_option(&#39;scanner&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 scanner_dep =3D dependency(&#39;wayland-scanner&#39=
;, native: true, version: meson.project_version())<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 wayland_scanner_for_build =3D find_program(sca=
nner_dep.get_pkgconfig_variable(&#39;wayland_scanner&#39;))<br>
-+=C2=A0 =C2=A0 =C2=A0 wayland_scanner_for_build =3D find_program(&#39;way=
land-scanner&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_scanner_for_build =3D find_program(&=
#39;wayland-scanner&#39;)<br>
=C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wayland_scanner_for_build =3D wayland_scanner<=
br>
=C2=A0 endif<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a> b/meta/rec=
ipes-graphics/wayland/<a href=3D"http://wayland_1.18.92.bb" rel=3D"noreferr=
er" target=3D"_blank">wayland_1.18.92.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.0=
.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a><br>
rename to meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.92.=
bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.92.bb</a><br>
index 00be3aac27..d7217981f6 100644<br>
--- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.0.bb" r=
el=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a><br>
+++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.92.bb" =
rel=3D"noreferrer" target=3D"_blank">wayland_1.18.92.bb</a><br>
@@ -17,10 +17,9 @@ SRC_URI =3D &quot;<a href=3D"https://wayland.freedeskto=
p.org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_b=
lank">https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-meson.build-find-the=
-native-wayland-scanner-directly.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Do-not-hardcode-the-=
path-to-wayland-scanner.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-Fix-strndup-de=
tection-on-MinGW.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson-tests-add-miss=
ing-dependencies-on-protocol-hea.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;23317697b6e3ff2e1ac8c5ba3ed57b65&quot;<br>
-SRC_URI[sha256sum] =3D &quot;4675a79f091020817a98fd0484e7208c876224226696=
7f55a67776936c2e294d&quot;<br>
+SRC_URI[md5sum] =3D &quot;90f204964ee697edf46905910f0d4052&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5b5696d8f58230971e848c0e25b987ab1c2b52f07eba=
6e88f036556606fb65cd&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://wayland.freedesktop.=
org/releases.html" rel=3D"noreferrer" target=3D"_blank">https://wayland.fre=
edesktop.org/releases.html</a>&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000065ad1605b9b583a7--
