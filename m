Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.1533.1603648807602803673
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 11:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oK1HtDJW;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id n18so3651845vsl.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPM0eXRlo15hJ/rp2KqTmhW8c9vrXVWhSsv7bqnO5/8=;
        b=oK1HtDJW3iGWa96UEQlKcaBxZqRzuxsoZ2VmT8BzLcq3n6L5tD2E0+A7lww1JiWwTR
         xv01IUqJAZtWRvPFdxYFiVEuHu3JYYFXMgoiE4hKiFUwvO8nLEUMmJoKi5HayQSerb/o
         dhYBGvyexN7Ha+9GtRM5k5b5hma4WnogRSfQBYrJPFapPLslnocK5znLvwG+7kBQtE+m
         Pg5M8w3fic6c7JdgZvjAyE9sfAMLPYo7m3XzZKws+xNIL50giY8njh5ZlhbJVJZ+A4i6
         oecWOBvdslUSxNGcl1kaZ1vCgXSnZ3USHxrHulTk5bElmkQo71nCxVC/VjE2R0j+yrwA
         2hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPM0eXRlo15hJ/rp2KqTmhW8c9vrXVWhSsv7bqnO5/8=;
        b=hcZWHcyVehNBazAh4T9G2n1KPcGBCEE1dkoJdO+aRHRe31Jg6JjGLog33rfYtapmLj
         xb8GUt6lMb+gzHQn78Sn5uXrPn/MjVBxtYP/GEjlZmAJvGI4QrNFzj3zsSu/U77yj+RE
         DfZy6p4YZJagGCF3uPN/r8Gh3KUSCJ9uCTSLHQmr8rqxJwm2qWjmKfntW2ZVdDEiU1IW
         nfH14MyW8Ceq5KVWqt3fNKf+leXbFjPuMspXAkAaWDzb4YBlKZnZmwvnSzRl7WKlsIGD
         OhnKNrTNwHXZeSGA4GaeSGZR1VncB3qHhyRRGMfQ0IquDNRWN/sEZjZxaKdpezEna4FT
         AibA==
X-Gm-Message-State: AOAM531rQ2X9n8pIFHNuPpxgZAhocfd2wpp4GSFE4LnmB/oj2hIZ25wA
	nNQN2rvS41u0rlSdh9N0Db5uk22NzPDYWFc6fEM=
X-Google-Smtp-Source: ABdhPJyOBvkNuOxMbAaYXYgqRFEIFUGx4aeCQrYWTDZoJRBpH3X2j0N/XgPKoeUEWN/9p86Jbd9Y3aKix2tWrOEdado=
X-Received: by 2002:a67:ea0b:: with SMTP id g11mr12676485vso.20.1603648806708;
 Sun, 25 Oct 2020 11:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
 <436d7e8c6bb8f34052c59924eb8020145e413dfa.camel@linuxfoundation.org> <CANPvuRkv-Jk8L7AhN7hYhHNA8ArU21PbE8egm9N2ZytsQEBGKw@mail.gmail.com>
In-Reply-To: <CANPvuRkv-Jk8L7AhN7hYhHNA8ArU21PbE8egm9N2ZytsQEBGKw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 25 Oct 2020 18:59:55 +0100
Message-ID: <CANNYZj_o8zbiCP+2VPUkg5y_gMTLd4Ww6j6x=ywaCeCSZWNgWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/5] spirv-tools: import from meta-oe to OE core
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000077e89405b282951f"

--00000000000077e89405b282951f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Almost always the person adding the recipes to core should be the
maintainer for them as well - unless you can nominate someone else and the=
y
confirm.

Alex

On Sun, 25 Oct 2020 at 17:11, Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:

> Hi Richard,
>
> The following recipes do not have a maintainer assigned to them.
> Please add an entry to meta/conf/distro/include/maintainers.inc file.
> glslang
> (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-grap=
hics/glslang/
> glslang_8.13.3559.bb)
> shaderc
> (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-grap=
hics/shaderc/
> shaderc_2019.0.bb)
> spirv-tools
> (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-grap=
hics/spir/
> spirv-tools_git.bb)
>
> spirv-tools comes from meta-oe, I can assign the same maintainer found
> in meta-oe or it is not possible?
>
> glslang and shaderc don't exist in other layers and it is created by me.
> You are saying that I can be the mateiner or have to be someone else.
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> domingo, 25/10/2020 =C3=A0(s) 14:52:
> >
> > On Sat, 2020-10-17 at 15:29 +0100, Jose Quaresma wrote:
> > > This receipe is needed to build the new shaderc
> > >
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > ---
> > >  ...0001-Avoid-pessimizing-std-move-3124.patch | 50 ++++++++++++++++=
+++
> > >  ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++++++++
> > >  meta/recipes-graphics/spir/spirv-tools_git.bb | 35 +++++++++++++
> > >  3 files changed, 120 insertions(+)
> > >  create mode 100644
> meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.pa=
tch
> > >  create mode 100644
> meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-in=
stalled-CMake-file.patch
> > >  create mode 100644 meta/recipes-graphics/spir/spirv-tools_git.bb
> >
> > Hi,
> >
> > I did run some brief tests on these, I noticed there is no maintainer
> > set for the new recipes. We need to set one for recipes in OE-Core,
> > see:
> >
> > meta/conf/distro/include/maintainers.inc
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1490/s=
teps/8/logs/step2d
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>
>

--00000000000077e89405b282951f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Almost always the person adding the recipes to core s=
hould be the maintainer for them as well - unless you can nominate someone =
else and they confirm.</div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 25 Oc=
t 2020 at 17:11, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Richard,<br>
<br>
The following recipes do not have a maintainer assigned to them.<br>
Please add an entry to meta/conf/distro/include/maintainers.inc file.<br>
glslang (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipe=
s-graphics/glslang/<a href=3D"http://glslang_8.13.3559.bb" rel=3D"noreferre=
r" target=3D"_blank">glslang_8.13.3559.bb</a>)<br>
shaderc (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipe=
s-graphics/shaderc/<a href=3D"http://shaderc_2019.0.bb" rel=3D"noreferrer" =
target=3D"_blank">shaderc_2019.0.bb</a>)<br>
spirv-tools (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/re=
cipes-graphics/spir/<a href=3D"http://spirv-tools_git.bb" rel=3D"noreferrer=
" target=3D"_blank">spirv-tools_git.bb</a>)<br>
<br>
spirv-tools comes from meta-oe, I can assign the same maintainer found<br>
in meta-oe or it is not possible?<br>
<br>
glslang and shaderc don&#39;t exist in other layers and it is created by m=
e.<br>
You are saying that I can be the mateiner or have to be someone else.<br>
<br>
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" t=
arget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia=
<br>
domingo, 25/10/2020 =C3=A0(s) 14:52:<br>
&gt;<br>
&gt; On Sat, 2020-10-17 at 15:29 +0100, Jose Quaresma wrote:<br>
&gt; &gt; This receipe is needed to build the new shaderc<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose=
@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...0001-Avoid-pessimizing-std-move-3124.patch | 50 +++++++=
++++++++++++<br>
&gt; &gt;=C2=A0 ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++=
++++++<br>
&gt; &gt;=C2=A0 meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_git.bb</a> | 35 +++=
++++++++++<br>
&gt; &gt;=C2=A0 3 files changed, 120 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-graphics/spir/files/0001-A=
void-pessimizing-std-move-3124.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-graphics/spir/files/0001-R=
espect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-graphics/spir/<a href=3D"h=
ttp://spirv-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_=
git.bb</a><br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I did run some brief tests on these, I noticed there is no maintainer=
<br>
&gt; set for the new recipes. We need to set one for recipes in OE-Core,<b=
r>
&gt; see:<br>
&gt;<br>
&gt; meta/conf/distro/include/maintainers.inc<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79=
/builds/1490/steps/8/logs/step2d" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1490/steps/8/=
logs/step2d</a><br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000077e89405b282951f--
