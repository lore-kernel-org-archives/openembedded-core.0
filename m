Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B47FC433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 17:55:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.19039.1658685321764906009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 10:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SauBySOc;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id l15so9000293wro.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BI5brtzCnNogqhxZcAvH9TDDoYkoddBgHxYxHiCKtf0=;
        b=SauBySOctlshWo56DKyA/p5bqfyfJoKLvwRgBsYn0Ox3hu66ukPN6XUDS03uBq7lDQ
         TO22FxG54Gj6uDqEN3FKnCgc7e3btFYKit0SW05vU4JWq7+xefDKw87onBlDxCddOSy8
         +FJd02+010jyBTMawEFzz09XyFyYE0o9J2UdBpQZztxIL+vIRs+Jl4r/1RpkG7g8SjbN
         tTuQ83L9ZbpUt8mN6Ul/KsTpC5RAdx39qsnIeBXySQeyruHsRDHnvPIl5nTQy4Iqr8K0
         9ZsydH9IC46G6mHKA/g6RndGHu0MwJpNyKDWZOBmZ8DkrH1WZbASmnuqtkYIG/LyQ6M1
         1zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BI5brtzCnNogqhxZcAvH9TDDoYkoddBgHxYxHiCKtf0=;
        b=gyTswQ1RuADB25id2n9DpJ6g7S8KSD9Iy+299/JiwQcuWR4WvwcCjS65HzRpJerMbx
         Lhwe4BGbZqNMaCLPJc1v3wvXhcBxcl+bTR5Wyq/76IYMKDshfICEoEn/7cIWS3UY/crX
         nCzIQz06tX7u2InWDwxWuS3Yx2/x8PRrwiZgszXi2/QO68AnsUg5w7oZ+UOeRHNGXlyz
         35vpNCEn1ue9R/u70O64UHfLU0v8HebpDOt0sT+2HJBUdABJlx7cr+8H+9iXvlRtf0Q2
         jTF3jqwv42ZU2ARLQV26hWiciUWsfzbk5ChZ+uXrLPXpiktxT26saGL90KIJ2QnBuEmZ
         SUMg==
X-Gm-Message-State: AJIora9r+wqtpNlFq4HyyNLQJiDhD9x5BexAvjyBoGuD0pN8izKLVhEl
	Ky9pnpP5LSqtD8IKj8gL06Uf5QVg7Gl5AVvDf8I=
X-Google-Smtp-Source: 
 AGRyM1vhJX3/QOHWG+fPfiNDJGe5vP6UipucmKhgZd7jscaENYk7QSEvUdP7F2neqiClgsVqxIjOEB5jqdvqImMGYUo=
X-Received: by 2002:a05:6000:2a4:b0:21e:6e0e:df1f with SMTP id
 l4-20020a05600002a400b0021e6e0edf1fmr5317343wry.516.1658685319883; Sun, 24
 Jul 2022 10:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657772638.git.steve@sakoman.com>
 <05760b29576aa8797bbae2e9a1a6a44d3c6aa97e.1657772638.git.steve@sakoman.com>
In-Reply-To: 
 <05760b29576aa8797bbae2e9a1a6a44d3c6aa97e.1657772638.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 24 Jul 2022 19:54:52 +0200
Message-ID: 
 <CA+chaQfp6PbQpQuUz57f7uorXduNEj6ybSXOSE4wSmwnMxb0UA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/27] glibc: stable 2.35 branch updates
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000049306c05e490c599"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 17:55:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168463

--00000000000049306c05e490c599
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 6:36 AM Steve Sakoman <steve@sakoman.com> wrote:

> From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
>
> Below commits on Glibc-2.35 development branch are updated.
>
> glibc:
> ....
> 2d05ba7f8e Linux: Implement a useful version of _startup_fatal
>
...

This last commit seems to cause build failure with DEBUG_BUILD:

x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse
--sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-=
webos-linux/glibc/2.35-r0/recipe-sysroot
-Wl,-rpath-link=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/cor=
e2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux:/OE/build/luneos-k=
irkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/buil=
d-x86_64-webos-linux/math:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/=
work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/elf:/OE/bu=
ild/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/=
2.35-r0/build-x86_64-webos-linux/dlfcn:/OE/build/luneos-kirkstone/webos-por=
ts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-lin=
ux/nss:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos=
-linux/glibc/2.35-r0/build-x86_64-webos-linux/nis:/OE/build/luneos-kirkston=
e/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_6=
4-webos-linux/rt:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core=
2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/resolv:/OE/build/lu=
neos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r=
0/build-x86_64-webos-linux/mathvec:/OE/build/luneos-kirkstone/webos-ports/t=
mp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/s=
upport:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos=
-linux/glibc/2.35-r0/build-x86_64-webos-linux/nptl
-o
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/support/shell-container
-pie -Wl,-O1 -nostdlib -nostartfiles  -Wl,-O1 -Wl,--hash-style=3Dgnu
-Wl,--as-needed
-fmacro-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/=
core2-64-webos-linux/glibc/2.35-r0=3D/usr/src/debug/glibc/2.35-r0

 -fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work=
/core2-64-webos-linux/glibc/2.35-r0=3D/usr/src/debug/glibc/2.35-r0

 -fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work=
/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot=3D

 -fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work=
/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot-native=3D
 -fuse-ld=3Dbfd  -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=3Dboth
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/csu/Scrt1.o
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/csu/crti.o
`x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse
--sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-=
webos-linux/glibc/2.35-r0/recipe-sysroot
 --print-file-name=3DcrtbeginS.o`
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/support/shell-container.o
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/support/libsupport_nonshared.a
 -Wl,-dynamic-linker=3D/lib/ld-linux-x86-64.so.2 -Wl,-z,now
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/libc.so.6
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/libc_nonshared.a
-Wl,--as-needed
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/elf/ld.so
-Wl,--no-as-needed -lgcc  `x86_64-webos-linux-gcc  -m64 -march=3Dcore2
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse
--sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-=
webos-linux/glibc/2.35-r0/recipe-sysroot
 --print-file-name=3DcrtendS.o`
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/csu/crtn.o
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexe=
c/x86_64-webos-linux/gcc/x86_64-webos-linux/11.3.0/ld.bfd:
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux/libc.a(libc-tls.o):
in function `__libc_setup_tls':
/usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined reference to
`_startup_fatal_not_constant'

The same is reproducible with DEBUG_BUILD in current master. Reverting
2d05ba7f8e confirms that this is the only new issue with DEBUG_BUILD.

Regards,

--00000000000049306c05e490c599
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jul 14, 2022 at 6:36 AM Steve Sak=
oman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakom=
an.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Sundeep KOKKONDA &lt;<a href=3D"mail=
to:sundeep.kokkonda@gmail.com" target=3D"_blank">sundeep.kokkonda@gmail.com=
</a>&gt;<br>
<br>
Below commits on Glibc-2.35 development branch are updated.<br>
<br>
glibc:<br>....<br>2d05ba7f8e Linux: Implement a useful version of _startup_=
fatal<br></blockquote><div>...=C2=A0</div><div><br></div><div>This last com=
mit seems to cause build failure with DEBUG_BUILD:</div><div><br></div><div=
>x86_64-webos-linux-gcc =C2=A0-m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mf=
pmath=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wo=
rk/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot -Wl,-rpath-link=3D/OE/=
build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glib=
c/2.35-r0/build-x86_64-webos-linux:/OE/build/luneos-kirkstone/webos-ports/t=
mp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/m=
ath:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-li=
nux/glibc/2.35-r0/build-x86_64-webos-linux/elf:/OE/build/luneos-kirkstone/w=
ebos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-w=
ebos-linux/dlfcn:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core=
2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/nss:/OE/build/luneo=
s-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/b=
uild-x86_64-webos-linux/nis:/OE/build/luneos-kirkstone/webos-ports/tmp-glib=
c/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/rt:/OE/b=
uild/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc=
/2.35-r0/build-x86_64-webos-linux/resolv:/OE/build/luneos-kirkstone/webos-p=
orts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-l=
inux/mathvec:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64=
-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/support:/OE/build/luneo=
s-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/b=
uild-x86_64-webos-linux/nptl -o /OE/build/luneos-kirkstone/webos-ports/tmp-=
glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/supp=
ort/shell-container -pie -Wl,-O1 -nostdlib -nostartfiles =C2=A0-Wl,-O1 -Wl,=
--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build/luneos-ki=
rkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=3D/us=
r/src/debug/glibc/2.35-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-kirkstone/=
webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=3D/usr/src/de=
bug/glibc/2.35-r0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-p=
orts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot=3D =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0-fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wo=
rk/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot-native=3D =C2=A0-fuse-=
ld=3Dbfd =C2=A0-Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=3Dboth /OE/bu=
ild/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/=
2.35-r0/build-x86_64-webos-linux/csu/Scrt1.o /OE/build/luneos-kirkstone/web=
os-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-web=
os-linux/csu/crti.o `x86_64-webos-linux-gcc =C2=A0-m64 -march=3Dcore2 -mtun=
e=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/webo=
s-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot =
=C2=A0--print-file-name=3DcrtbeginS.o` /OE/build/luneos-kirkstone/webos-por=
ts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-lin=
ux/support/shell-container.o /OE/build/luneos-kirkstone/webos-ports/tmp-gli=
bc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/support=
/libsupport_nonshared.a =C2=A0-Wl,-dynamic-linker=3D/lib/ld-linux-x86-64.so=
.2 -Wl,-z,now /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-6=
4-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/libc.so.6 /OE/build/lu=
neos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r=
0/build-x86_64-webos-linux/libc_nonshared.a -Wl,--as-needed /OE/build/luneo=
s-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/b=
uild-x86_64-webos-linux/elf/ld.so -Wl,--no-as-needed -lgcc =C2=A0`x86_64-we=
bos-linux-gcc =C2=A0-m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dss=
e --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-6=
4-webos-linux/glibc/2.35-r0/recipe-sysroot =C2=A0--print-file-name=3Dcrtend=
S.o` /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-l=
inux/glibc/2.35-r0/build-x86_64-webos-linux/csu/crtn.o<br>/OE/build/luneos-=
kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/rec=
ipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-li=
nux/gcc/x86_64-webos-linux/11.3.0/ld.bfd: /OE/build/luneos-kirkstone/webos-=
ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-=
linux/libc.a(libc-tls.o): in function `__libc_setup_tls&#39;:<br>/usr/src/d=
ebug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined reference to `_startup=
_fatal_not_constant&#39;<br></div><div><br></div><div>The same is reproduci=
ble with DEBUG_BUILD in current master. Reverting 2d05ba7f8e confirms that =
this is the only new issue with DEBUG_BUILD.</div><div><br></div><div>Regar=
ds,</div></div></div>

--00000000000049306c05e490c599--

