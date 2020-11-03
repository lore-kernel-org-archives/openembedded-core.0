Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.3482.1604435902782206618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 12:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dHn6Sbog;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id v4so19898077edi.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 12:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GXeeseDDl7j6Aqzd0LrQmeUTTCORRrR0dyM3hQzTI4Q=;
        b=dHn6Sbog6BscyH8ifVvydvJkB/C9rCqeCHuXNhjxppgoRrg6vvX+cobVfz8VmZh8xS
         MpMmEErwuzNAM3nry7MRx/DJSjHTgnGRbvKpsCPNJs1x/CsTgyumroked1OgKuI463Mf
         Qh5PEwThBlc2/zwZIfawEbuzUjyl+sX8enSzW59bGoTv6LbIUQ8fz6K1exDXPj25dmVQ
         cgkLIVZ8qde8/SZTOPtTKbQOfnQa4GVgHlPfOKDwRSJ2XeIdyF1HPwySJZdy5/C0YHyX
         9sRpIYlEueULM2iJEiZ9drXdGzUhMTbvn8ODhkE8FLZyVatrGqdCSO1uIudFHYifxqOM
         GBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GXeeseDDl7j6Aqzd0LrQmeUTTCORRrR0dyM3hQzTI4Q=;
        b=Q6FNlqToaryJKDiM16ICgJAnHrd9xkEGUepBWFhmybkEgRiytK10qgsbzBvByGkvAq
         o6ww7VRw2yZm0Zm7ZeVB/7A+nlEKnZJ8/6N5U6W6HwxmtLUOHFmnmezuG1SEzSNYmDjR
         g3MaBhY71W4zLiG/KEm2YqGG1VMHJTSgRVM9xAgMaCajr0U0aqsXj2OGa4oEDtwRKhTs
         K6SU5DDkSZY1QBacFsi8Pj3wjNisw9VAziIUwkQ4QCO7wi+xvdUTzVqfVnQRR3QxLe/x
         1R1e9ROtz8NvBDqEPTZebr3CSmOmpQK3/TJ0x6Q4LwWCFu3jkFzCIQAdSzE5tTHILfN2
         LWVg==
X-Gm-Message-State: AOAM530rk6KkZwTZDC71kz/o52jiM4ybxzz41gDbJH2RXGxEyxT6JkFq
	3WnvFA1T101tmbrBvjOBI1yggejFqaK0jCgBUr8=
X-Google-Smtp-Source: ABdhPJz2bmM6utWxQKwzdaWuiMhiUQAzdQyWEiAi/N4Lh/5nOGjEP+4SDoAgmu7n9r1jFfX0cyeeX1zUysf7Tl+xTPU=
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr22982631edv.264.1604435901198;
 Tue, 03 Nov 2020 12:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20201102164907.27572-1-alex.kanavin@gmail.com> <20201102164907.27572-38-alex.kanavin@gmail.com>
In-Reply-To: <20201102164907.27572-38-alex.kanavin@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 3 Nov 2020 21:38:10 +0100
Message-ID: <CA+chaQf3rhtHrsxAuZcQCfoAgYRQEjUQA-g-0SeqpgnuuKuGjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 38/80] libxkbcommon: upgrade 0.10.0 -> 1.0.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f4b5e305b339d777"

--000000000000f4b5e305b339d777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to trigger do_configure failure in some builds:

Found CMake: NO
Run-time dependency libxml-2.0 found: NO (tried pkgconfig)

../libxkbcommon-1.0.1/meson.build:329:4: ERROR: Dependency "libxml-2.0" no=
t
found, tried pkgconfig

and in the build where it works I see:

Found CMake: NO
Run-time dependency xkeyboard-config found: NO (tried pkgconfig and cmake)
Has header "unistd.h" : YES
Checking if "__builtin_expect" links: YES
Header <unistd.h> has symbol "eaccess" : YES
Header <unistd.h> has symbol "euidaccess" : YES
Header <sys/mman.h> has symbol "mmap" : YES
Header <stdlib.h> has symbol "mkostemp" : YES
Header <fcntl.h> has symbol "posix_fallocate" : YES
Header <string.h> has symbol "strndup" : YES
Header <stdio.h> has symbol "asprintf" : YES
Header <stdlib.h> has symbol "secure_getenv" : YES
Header <getopt.h> has symbol "getopt_long" : YES
Header <limits.h> has symbol "PATH_MAX" : YES
Checking if "-Wl,--version-script" links: YES
Program bison found: YES
Using 'PKG_CONFIG_PATH' from environment with value:
'/OE/build/luneos-hardknott/webos-ports/tmp-glibc/work/cortexa7t2hf-neon-v=
fpv4-webos-linux-gnueabi/libxkbcommon/1.0.1-r0/recipe-sysroot/usr/lib/pkgco=
nfig:/OE/build/luneos-hardknott/webos-ports/tmp-glibc/work/cortexa7t2hf-neo=
n-vfpv4-webos-linux-gnueabi/libxkbcommon/1.0.1-r0/recipe-sysroot/usr/share/=
pkgconfig'
Run-time dependency libxml-2.0 found: YES 2.9.10

with libxml-2 included through wayland so I guess it's the wayland
PACKAGECONFIG enabled based on DISTRO_FEATURES, will check and send patch
shortly.

On Mon, Nov 2, 2020 at 5:50 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../xorg-lib/{libxkbcommon_0.10.0.bb =3D> libxkbcommon_1.0.1.bb} | 3 +-=
-
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.10.0.bb =3D>
> libxkbcommon_1.0.1.bb} (88%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
> b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
> similarity index 88%
> rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
> rename to meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
> index 16d9c36eae..4ef20b0721 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
> @@ -9,8 +9,7 @@ DEPENDS =3D "util-macros flex-native bison-native"
>
>  SRC_URI =3D "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
>
> -SRC_URI[md5sum] =3D "2d9ad3a46b317138b5e72a91cf105451"
> -SRC_URI[sha256sum] =3D
> "57c3630cdc38fb4734cd57fa349e92244f5ae3862813e533cedbd86721a0b6f2"
> +SRC_URI[sha256sum] =3D
> "ab68b25341c99f2218d7cf3dad459c1827f411219901ade05bbccbdb856b6c8d"
>
>  UPSTREAM_CHECK_URI =3D "http://xkbcommon.org/"
>
> --
> 2.29.0
>
>
>=20
>
>

--000000000000f4b5e305b339d777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This seems to trigger do_configure failure in some bu=
ilds:</div><div><br></div>Found CMake: NO<br>Run-time dependency libxml-2.0=
 found: NO (tried pkgconfig)<br><br>../libxkbcommon-1.0.1/meson.build:329:4=
: ERROR: Dependency &quot;libxml-2.0&quot; not found, tried pkgconfig<br><d=
iv><br></div><div>and in the build where it works I see:</div><div><br></di=
v><div>Found CMake: NO<br>Run-time dependency xkeyboard-config found: NO (t=
ried pkgconfig and cmake)<br>Has header &quot;unistd.h&quot; : YES<br>Check=
ing if &quot;__builtin_expect&quot; links: YES<br>Header &lt;unistd.h&gt; h=
as symbol &quot;eaccess&quot; : YES<br>Header &lt;unistd.h&gt; has symbol &=
quot;euidaccess&quot; : YES<br>Header &lt;sys/mman.h&gt; has symbol &quot;m=
map&quot; : YES<br>Header &lt;stdlib.h&gt; has symbol &quot;mkostemp&quot; =
: YES<br>Header &lt;fcntl.h&gt; has symbol &quot;posix_fallocate&quot; : YE=
S<br>Header &lt;string.h&gt; has symbol &quot;strndup&quot; : YES<br>Header=
 &lt;stdio.h&gt; has symbol &quot;asprintf&quot; : YES<br>Header &lt;stdlib=
.h&gt; has symbol &quot;secure_getenv&quot; : YES<br>Header &lt;getopt.h&gt=
; has symbol &quot;getopt_long&quot; : YES<br>Header &lt;limits.h&gt; has s=
ymbol &quot;PATH_MAX&quot; : YES<br>Checking if &quot;-Wl,--version-script&=
quot; links: YES<br>Program bison found: YES<br>Using &#39;PKG_CONFIG_PATH&=
#39; from environment with value: &#39;/OE/build/luneos-hardknott/webos-por=
ts/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-webos-linux-gnueabi/libxkbcommon/=
1.0.1-r0/recipe-sysroot/usr/lib/pkgconfig:/OE/build/luneos-hardknott/webos-=
ports/tmp-glibc/work/cortexa7t2hf-neon-vfpv4-webos-linux-gnueabi/libxkbcomm=
on/1.0.1-r0/recipe-sysroot/usr/share/pkgconfig&#39;<br>Run-time dependency =
libxml-2.0 found: YES 2.9.10<br></div><div><br></div><div>with libxml-2 inc=
luded through wayland so I guess it&#39;s the wayland PACKAGECONFIG enabled=
 based on DISTRO_FEATURES, will check and send patch shortly.</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Nov 2, 2020 at 5:50 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin=
@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Signed-off-by: Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt;<br>
---<br>
=C2=A0.../xorg-lib/{<a href=3D"http://libxkbcommon_0.10.0.bb" rel=3D"noref=
errer" target=3D"_blank">libxkbcommon_0.10.0.bb</a> =3D&gt; <a href=3D"http=
://libxkbcommon_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon=
_1.0.1.bb</a>} | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/xorg-lib/{<a href=3D"http://libxkbcommo=
n_0.10.0.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_0.10.0.bb</a=
> =3D&gt; <a href=3D"http://libxkbcommon_1.0.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libxkbcommon_1.0.1.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon=
_0.10.0.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_0.10.0.bb</a>=
 b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_=
0.10.0.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_0.10.0.bb</a><=
br>
rename to meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
index 16d9c36eae..4ef20b0721 100644<br>
--- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_0.10.0=
.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_0.10.0.bb</a><br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
@@ -9,8 +9,7 @@ DEPENDS =3D &quot;util-macros flex-native bison-native&quo=
t;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://xkbcommon.org/download/$%7BBPN%7=
D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://xkbcommon.o=
rg/download/${BPN}-${PV}.tar.xz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;2d9ad3a46b317138b5e72a91cf105451&quot;<br>
-SRC_URI[sha256sum] =3D &quot;57c3630cdc38fb4734cd57fa349e92244f5ae3862813=
e533cedbd86721a0b6f2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ab68b25341c99f2218d7cf3dad459c1827f411219901=
ade05bbccbdb856b6c8d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://xkbcommon.org/" rel=
=3D"noreferrer" target=3D"_blank">http://xkbcommon.org/</a>&quot;<br>
<br>
-- <br>
2.29.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f4b5e305b339d777--
