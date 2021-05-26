Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.5087.1622021012592650023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 02:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BtM7DmyE;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: samuli.piippo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id v12so304174plo.10
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 02:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZOoSGyqaNwCsmcIc72apg54YIX1E1O4t1K7/wPCUf3Q=;
        b=BtM7DmyE0fKX9/nuWUJM9EYnuHBTrnYg9eq927+E5K07D5xazTEGv0dI7TBVsd5mJE
         /JqtmoTBzj/d6E/wdm6XM8l/NteTcitw1jRUvmjznWOySIN++ZbnfKuJ+z9GJsNXzvvX
         7LhXeg2U3fJyeOcZgv/xHVycai4beHYJPy/AUmsbHcqH8IGWC6heuLRwcQfpG/OvRb2S
         MemdlryFh5QClNFBy+ZqPypTTP2yvUfuu/YATW5Cm5pAZNaNuy0rMKGD6aIk6SURryx8
         wxzPzMF9dCUgI/q3Bu3siHrWJY5ecnH1Jw3dtrVcMcUp2Oh5RS55ZjVwktFEA7MToShk
         USTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZOoSGyqaNwCsmcIc72apg54YIX1E1O4t1K7/wPCUf3Q=;
        b=iFPhWV2/393kDpdKejO9XnQ6xZOKmcnnEzcPj7vhBKlBsI7iVUnnIwoPgtBl8B7QjW
         +OZaHflxyqBJ9me4MGYjNoh/GCXMK00aN8rO/GdZayBukqkQNdi/llILHAHxG4Ybd6nu
         S9CrjWITo2RJPNI2ynAdA9TE+uz5+eQYYdU46rThFA9a0sLOtKQU1Ha6Pp4rYFjlbXSS
         QeOEh/Udm9NZKlk2RipkGtv0a6Sf0rUStAamo5ArxMtyStekIuj2IMEYyzAioImgis6i
         sfqFmcWzmpOfb66Rs/VX9H98DslpPU6O2FTYngDJ71EJmC5A6jzLXF9dy2S3ejaneuxZ
         a95g==
X-Gm-Message-State: AOAM530xVa3pxkxvhu42UYe/QCBPe53VV9MuYvOHfgbeUPN1Q572boXd
	mrLi7i0DOdDI4tKCg+VeX2Bf4lt17mgV00qi0+g=
X-Google-Smtp-Source: ABdhPJw5ul4vEPGip1uHgg76QwuXQXba6HG+uPzvbae/aPJXZsnEsOb/6APsV2gr2wzJ1+v0zatXYLlSon4q8AWv96Y=
X-Received: by 2002:a17:90a:9511:: with SMTP id t17mr35334390pjo.108.1622021012063;
 Wed, 26 May 2021 02:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210521143328.3368988-1-samuli.piippo@qt.io> <ea6eee79c5a985e385579eda3786c515dbfdd5a1.camel@linuxfoundation.org>
In-Reply-To: <ea6eee79c5a985e385579eda3786c515dbfdd5a1.camel@linuxfoundation.org>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Wed, 26 May 2021 12:23:21 +0300
Message-ID: <CABXoSoUs-V6_0Tk7SrsDCewX3QudEzQitz2iPb=zMu1-MnY6kQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] Revert "gcc-cross-canadian: Add symlink to real-ld alongside other symlinks"
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003e0a4d05c33832a3"

--0000000000003e0a4d05c33832a3
Content-Type: text/plain; charset="UTF-8"

Was the "gcc-cross-canadian: add symlinks for ld.bfd and ld.gold" change
included in that test build?


On Sat, 22 May 2021 at 08:41, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-05-21 at 17:33 +0300, Samuli Piippo wrote:
> > This reverts commit cdd86896c8d29135f937968e9aa07f919cf543d3.
> >
> > real-ld is always used if that is found, which means you cannot
> > switch between bfd and gold linkers using -fuse-ld gcc option.
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > ---
> >  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > index 878feaf810..e8fbb6186b 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > @@ -131,8 +131,6 @@ do_install () {
> >
> >
> >
> >
> >               ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix
> $dest$t$suffix
> >       done
> > -     t=real-ld
> > -     ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
> >
> >
> >
> >
> >       # libquadmath headers need to  be available in the gcc libexec dir
> >       install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
>
> It seems the issue that commit fixed back in 2015 is still there if
> we revert this:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3490/steps/26/logs/stdio
>
> Cheers,
>
> Richard
>
>

--0000000000003e0a4d05c33832a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Was the &quot;gcc-cross-canadian: add symlinks for ld=
.bfd and ld.gold&quot; change included in that test build?</div><br></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat,=
 22 May 2021 at 08:41, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2021-05-21 a=
t 17:33 +0300, Samuli Piippo wrote:<br>
&gt; This reverts commit cdd86896c8d29135f937968e9aa07f919cf543d3.<br>
&gt; <br>
&gt; real-ld is always used if that is found, which means you cannot<br>
&gt; switch between bfd and gold linkers using -fuse-ld gcc option.<br>
&gt; <br>
&gt; Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io=
" target=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --<br>
&gt; =C2=A01 file changed, 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/r=
ecipes-devtools/gcc/gcc-cross-canadian.inc<br>
&gt; index 878feaf810..e8fbb6186b 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc<br>
&gt; @@ -131,8 +131,6 @@ do_install () {<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${BINRELP=
ATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0done<br>
&gt; -=C2=A0 =C2=A0 =C2=A0t=3Dreal-ld<br>
&gt; -=C2=A0 =C2=A0 =C2=A0ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $d=
est$t$suffix<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0# libquadmath headers need to=C2=A0 be avail=
able in the gcc libexec dir<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/gcc/${TARGET_SYS}/$=
{BINV}/include/<br>
<br>
It seems the issue that commit fixed back in 2015 is still there if=C2=A0<b=
r>
we revert this:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/44/build=
s/3490/steps/26/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3490/steps/26/logs/=
stdio</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000003e0a4d05c33832a3--
