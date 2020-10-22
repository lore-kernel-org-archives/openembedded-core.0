Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.575.1603385266545446334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 09:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: aehs29@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id m20so2675087ljj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 09:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wn3XJMTiYNpGxdRa+6+iCpUh9tSn62psRUvhxFn29RM=;
        b=XiRTcZYiJ+qe55rGaMbiQea+fDvHE/y5GDI2d5k3+6pFsPlcxNtQ0eNg1W3aELcU5Z
         F+VctcNmtt2+l3b06vH3NuNmhepZDOJB1oEC1afEr5Jxt7AEUa6tKJOpAgWcdUs4xEzp
         VYbsHqbmrpqAWJTCWu73ctmGlFtFZmI1d759/C4PIWR0iNfpagmkB6evDVo1ap58MDee
         D8/N1qNNj8SmkEHD2dNKkPAsQknlT//XnsehQximtBnEJsssOVLJYX8lql5cgfi9+isk
         X2ZMQh/rcxZHvGuffqaeb6KTEL0Iv696borrINEOoOBAShut6xQSnNXhuPq7XMwdViWp
         6eGA==
X-Gm-Message-State: AOAM532MvW8iURoVdO3wLtLW6J4nPDdh8y5oF5QXt1SaTouANakDdp46
	1g5TlvPDhhhcc/2dxX10dyDjinkvDkI=
X-Google-Smtp-Source: ABdhPJy8OHolrh4/9kMSypskw3w84hd2/IHkvGk0Xsf5Amv8VqfL5KYaU0JrlGloFXeinm1tsM1rCw==
X-Received: by 2002:a2e:81da:: with SMTP id s26mr1295591ljg.184.1603385264301;
        Thu, 22 Oct 2020 09:47:44 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 27sm331082lfy.109.2020.10.22.09.47.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 09:47:44 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id r127so3064836lff.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 09:47:43 -0700 (PDT)
X-Received: by 2002:a19:593:: with SMTP id 141mr1082739lff.144.1603385263541;
 Thu, 22 Oct 2020 09:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201022083222.1506844-1-alejandro@enedino.org>
 <20201022083612.kourjuijorkmw26a@qschulz> <63688d349ae0d710cf2f139c22df4dc76c3aac3b.camel@linuxfoundation.org>
In-Reply-To: <63688d349ae0d710cf2f139c22df4dc76c3aac3b.camel@linuxfoundation.org>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Thu, 22 Oct 2020 10:47:30 -0600
X-Gmail-Original-Message-ID: <CAHMutrYrafDgye-CvTQskD3-_=v8u6YsxA5o8Bjgjtj_1dKebQ@mail.gmail.com>
Message-ID: <CAHMutrYrafDgye-CvTQskD3-_=v8u6YsxA5o8Bjgjtj_1dKebQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-helloworld: Fix install path since S doesnt have a trailing slash
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Quentin Schulz <quentin.schulz@streamunlimited.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000012549205b24539cf"

--00000000000012549205b24539cf
Content-Type: text/plain; charset="UTF-8"

Hey folks,

On Thu, Oct 22, 2020, 4:16 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-10-22 at 10:36 +0200, Quentin Schulz wrote:
> > Hi Alejandro,
> >
> > On Thu, Oct 22, 2020 at 02:32:22AM -0600, Alejandro Hernandez Samaniego
> wrote:
> > > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > > ---
> > >  .../baremetal-examples/baremetal-helloworld_git.bb            | 4
> ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> b/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > > index 7a580bd885..946a12d0a5 100644
> > > --- a/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > > +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/
> baremetal-helloworld_git.bb
> > > @@ -40,8 +40,8 @@ EXTRA_OEMAKE_append = "
> QEMUARCH=${BAREMETAL_QEMUARCH} V=1"
> > >  # Install binaries on the proper location for baremetal-image to
> fetch and deploy
> > >  do_install(){
> > >      install -d ${D}/${base_libdir}/firmware
> > > -    install -m 755
> ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> > > -    install -m 755
> ${B}build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> > > +    install -m 755
> ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.bin
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin
> > > +    install -m 755
> ${B}/build/hello_baremetal_${BAREMETAL_QEMUARCH}.elf
> ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf
> >
> > I'm almost certain do_install is being run under the ${B} directory by
> > default:
> > https://docs.yoctoproject.org/ref-manual/ref-tasks.html#do-install
> >
> > So I'd actually just remove ${B} (or ${B}/) from the path?
>
> Personally, I think it makes it more obvious what is going on...
>

I think since this is in meta-skeleton and its meant to be instructive, I'd
rather have it specifically call out what its doing.

Alejandro


> Cheers,
>
> Richard
>
>

--00000000000012549205b24539cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hey folks,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Oct 22, 2020, 4:16 AM Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Thu, 2020-10-22 at 10:36 +0200, Quentin Schulz wrote:<br>
&gt; Hi Alejandro,<br>
&gt; <br>
&gt; On Thu, Oct 22, 2020 at 02:32:22AM -0600, Alejandro Hernandez Samanieg=
o wrote:<br>
&gt; &gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=
=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alej=
andro@enedino.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../baremetal-examples/<a href=3D"http://baremetal-hellowor=
ld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-hellow=
orld_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/<=
a href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">baremetal-helloworld_git.bb</a> b/meta-skeleton/recipes-=
baremetal/baremetal-examples/<a href=3D"http://baremetal-helloworld_git.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-helloworld_git.b=
b</a><br>
&gt; &gt; index 7a580bd885..946a12d0a5 100644<br>
&gt; &gt; --- a/meta-skeleton/recipes-baremetal/baremetal-examples/<a href=
=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; &gt; +++ b/meta-skeleton/recipes-baremetal/baremetal-examples/<a href=
=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt; &gt; @@ -40,8 +40,8 @@ EXTRA_OEMAKE_append =3D &quot; QEMUARCH=3D${BAR=
EMETAL_QEMUARCH} V=3D1&quot;<br>
&gt; &gt;=C2=A0 # Install binaries on the proper location for baremetal-ima=
ge to fetch and deploy<br>
&gt; &gt;=C2=A0 do_install(){<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/${base_libdir}/firmware<br>
&gt; &gt; -=C2=A0 =C2=A0 install -m 755 ${B}build/hello_baremetal_${BAREMET=
AL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin<br>
&gt; &gt; -=C2=A0 =C2=A0 install -m 755 ${B}build/hello_baremetal_${BAREMET=
AL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf<br>
&gt; &gt; +=C2=A0 =C2=A0 install -m 755 ${B}/build/hello_baremetal_${BAREME=
TAL_QEMUARCH}.bin ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.bin<br>
&gt; &gt; +=C2=A0 =C2=A0 install -m 755 ${B}/build/hello_baremetal_${BAREME=
TAL_QEMUARCH}.elf ${D}/${base_libdir}/firmware/${BAREMETAL_BINNAME}.elf<br>
&gt; <br>
&gt; I&#39;m almost certain do_install is being run under the ${B} director=
y by<br>
&gt; default:<br>
&gt; <a href=3D"https://docs.yoctoproject.org/ref-manual/ref-tasks.html#do-=
install" rel=3D"noreferrer noreferrer" target=3D"_blank">https://docs.yocto=
project.org/ref-manual/ref-tasks.html#do-install</a><br>
&gt; <br>
&gt; So I&#39;d actually just remove ${B} (or ${B}/) from the path?<br>
<br>
Personally, I think it makes it more obvious what is going on...<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><d=
iv dir=3D"auto">I think since this is in meta-skeleton and its meant to be =
instructive, I&#39;d rather have it specifically call out what its doing.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--00000000000012549205b24539cf--
