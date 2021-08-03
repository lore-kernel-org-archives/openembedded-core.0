Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.3645.1628018940145268615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 12:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZfZcPAfV;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id hw6so108030ejc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 12:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kd83HTIVgeKK5vYS02cn4wBQBNt6hCvAsmgKfCcfVOc=;
        b=ZfZcPAfV5FyzHYZ3+QFWKIqytmaQKgGDc6HDlxBV9E48Dx+zJSrtvtvI8J2eU9qGOx
         qaVKRmjhPi9UrjWbRPUurjy/FMrXnhY8oQ+kBJ7GrUpgYYECrpptPKaVc4NSBFgf8lQi
         tHHvfQygGgDEjD4ZOC3B1njKOA77WWiO2exSwBL9EcgV47CvIjpIZzqXwSvyDvKQM+I/
         Q2OAYxtzvoyX193R1a+gP6dUMGzGvhnhRpxPQZNDhxXsKGFDvwB90ENyLnVxaOkUBOHD
         NA0xUQm9Esbi+InEs4GFeFQxdZUDTQ4m02lgK+CaGkG38HGZUIszoWOZjkh2jJqDi+2Z
         CuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kd83HTIVgeKK5vYS02cn4wBQBNt6hCvAsmgKfCcfVOc=;
        b=uX6uhNIiq9iwnoo2cTjhvy9h0z+nwb5cLyrHMWdl3G5TQ/74tyZALNfM1UYgQl+ffr
         wPtDp3VzJuz8saKhqw4RphRExaG4l7Dy3Je3+Jz+872jBWRrHeDUWW9NddPi/mAX2xH8
         SqatE5J7bqxpZSZUGSKGs7Ouc5zGgO3C2yu98J7RatkTQL7sEX55MIxSvI92lKUsiTv8
         MU/7CQqH7vDFd7E4PxuEoI1iRYZIaC5fzoNRyPb4+WoXQweYnwjtiHbBMNBmJaGcc3EB
         udf3TV2qJSBVNJU/uxUFeyja2JAveLjMK/LnXiWZodIRxoX48G/+GTAvGs7SnLHmrdsB
         Pfjw==
X-Gm-Message-State: AOAM5330phz9QUqHTRc9k55hZbzBXRCISD0hbgy9jCG71aBc9icREUHS
	SRK8nIEj04oW36yeK+L0IAp1vKlSIcQv8vCPOHQ=
X-Google-Smtp-Source: ABdhPJxJUaMZarBmV+Qx8n/AVpRSyf/topZw1R5lVNqOFLD17FwX4FqcI7cIrP1eUAaoqcbCJ8JQz5/9MqT2FFZ02y8=
X-Received: by 2002:a17:906:82ca:: with SMTP id a10mr21748113ejy.137.1628018938653;
 Tue, 03 Aug 2021 12:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <1696468844291952.7588@lists.openembedded.org> <20210803190435.332065-1-Martin.Jansa@gmail.com>
 <CAJ86T=Ut+dDkAnFUNJec=4b9v0BbSz_u+3PVkmXmGpxuOxXLeA@mail.gmail.com>
In-Reply-To: <CAJ86T=Ut+dDkAnFUNJec=4b9v0BbSz_u+3PVkmXmGpxuOxXLeA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 3 Aug 2021 21:28:47 +0200
Message-ID: <CA+chaQd3Mf14rf1Ai-00yNTQjF_83Qzqyc8D47y-UvqmvY4H4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: use ld.bfd as efi-ld when gold is being used by default with ld-is-gold
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000086b17705c8acb297"

--00000000000086b17705c8acb297
Content-Type: text/plain; charset="UTF-8"

Probably as lld isn't supported as well:
https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a764e31

On Tue, Aug 3, 2021 at 9:19 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Aug 3, 2021 at 12:04 PM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > * since the upgrade to 249.1 in:
> >
> https://git.openembedded.org/openembedded-core/commit/?id=323ec445dfe22860cd450c303db5ed8fcb4e791c
> >   the builds with ld-is-gold are failing with:
> >
> >   [17/21] Generating linuxx64.elf.stub with a custom command
> >   FAILED: src/boot/efi/linuxx64.elf.stub
> >
>  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld
> -o src/boot/efi/linuxx64.elf.stub -T
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds
> -shared -Bsymbolic -nostdlib -znocombreloc --build-id=sha1 -L
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o
> src/boot/efi/string-util-fundamental.c.o src/boot/efi/disk.c.o
> src/boot/efi/graphics.c.o src/boot/efi/measure.c.o src/boot/efi/pe.c.o
> src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o src/boot/efi/linux.c.o
> src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnuefi
> /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
> >
>  /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld:
> internal error in segment_precedes, at ../../gold/layout.cc:3721
> >   [18/21] Generating boot.c.o with a custom command
> >   ninja: build stopped: subcommand failed.
> >   WARNING: exit code 1 from a shell command.
> >
> >   as reported in:
> >   https://lists.openembedded.org/g/openembedded-core/message/154246
> >
> >   work around this by using ld.bfd when ld-is-gold is in DISTRO_FEATURES
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/systemd/systemd-boot_249.1.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb
> b/meta/recipes-core/systemd/systemd-boot_249.1.bb
> > index d767b5bf8d..18f4fe55ce 100644
> > --- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
> > @@ -19,11 +19,13 @@ objcopy = ${@meson_array('OBJCOPY', d)}
> >  EOF
> >  }
> >
> > +EFI_LD = "${@d.getVar('LD').split()[0]}"
> > +
> >  EXTRA_OEMESON += "-Defi=true \
> >                    -Dgnu-efi=true \
> >                    -Defi-includedir=${STAGING_INCDIR}/efi \
> >                    -Defi-libdir=${STAGING_LIBDIR} \
> > -                  -Defi-ld=${@ d.getVar('LD').split()[0]} \
> > +                  -Defi-ld=${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', 'ld.bfd', '${EFI_LD}', d)} \
>
> Could this just be set to ld.bfd in all cases?
>

--00000000000086b17705c8acb297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Probably as lld isn&#39;t supported as well:<div><a href=
=3D"https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9=
bf86a764e31">https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc=
49b78e6c9bf86a764e31</a><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 9:19 PM Andre McCu=
rdy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, A=
ug 3, 2021 at 12:04 PM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmai=
l.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * since the upgrade to 249.1 in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/=
commit/?id=3D323ec445dfe22860cd450c303db5ed8fcb4e791c" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=
=3D323ec445dfe22860cd450c303db5ed8fcb4e791c</a><br>
&gt;=C2=A0 =C2=A0the builds with ld-is-gold are failing with:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0[17/21] Generating linuxx64.elf.stub with a custom command=
<br>
&gt;=C2=A0 =C2=A0FAILED: src/boot/efi/linuxx64.elf.stub<br>
&gt;=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linu=
x-ld -o src/boot/efi/linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/=
core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_e=
fi.lds -shared -Bsymbolic -nostdlib -znocombreloc --build-id=3Dsha1 -L /OE/=
build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe=
-sysroot/usr/lib /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string=
-util-fundamental.c.o src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/b=
oot/efi/measure.c.o src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/bo=
ot/efi/util.c.o src/boot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi=
/stub.c.o -lefi -lgnuefi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux=
/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0=
/libgcc.a<br>
&gt;=C2=A0 =C2=A0/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd=
-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linu=
x-ld: internal error in segment_precedes, at ../../gold/layout.cc:3721<br>
&gt;=C2=A0 =C2=A0[18/21] Generating boot.c.o with a custom command<br>
&gt;=C2=A0 =C2=A0ninja: build stopped: subcommand failed.<br>
&gt;=C2=A0 =C2=A0WARNING: exit code 1 from a shell command.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0as reported in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/154246" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/message/154246</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0work around this by using ld.bfd when ld-is-gold is in DIS=
TRO_FEATURES<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a> | 4 +++-<=
br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_=
249.1.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a> b/=
meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
&gt; index d767b5bf8d..18f4fe55ce 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
&gt; @@ -19,11 +19,13 @@ objcopy =3D ${@meson_array(&#39;OBJCOPY&#39;, d)}<=
br>
&gt;=C2=A0 EOF<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +EFI_LD =3D &quot;${@d.getVar(&#39;LD&#39;).split()[0]}&quot;<br>
&gt; +<br>
&gt;=C2=A0 EXTRA_OEMESON +=3D &quot;-Defi=3Dtrue \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
Dgnu-efi=3Dtrue \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
Defi-includedir=3D${STAGING_INCDIR}/efi \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
Defi-libdir=3D${STAGING_LIBDIR} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-=
ld=3D${@ d.getVar(&#39;LD&#39;).split()[0]} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Defi-=
ld=3D${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ld-is-gold&#39;, =
&#39;ld.bfd&#39;, &#39;${EFI_LD}&#39;, d)} \<br>
<br>
Could this just be set to ld.bfd in all cases?<br>
</blockquote></div>

--00000000000086b17705c8acb297--
