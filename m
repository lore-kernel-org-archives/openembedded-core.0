Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web12.712.1588015997220232860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 12:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=URS3ggJt;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id d6so3642801vko.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQq0drF518XeKOcGcKI4q/7ENufkQEILdFRVbkw5cdM=;
        b=URS3ggJtcS/l6ZZMkSvJHxFBCncqxb9PjWK5Ulg6HdFnZTqc1Si72HZDF6z14iq94v
         pMyt0wxnWbhlQUBMeXAs2PbP7GYKQ2l2zk/y4Ve3X5juialoIo8DCtDAIUav5xzRhCr0
         jgOqrP/BjiUL4ZA6UYdcxTecgwsMWEPwy/0j/qVDqWFvtSscGPwgbxtQFQqlE1uYHuu1
         KNr6r0kExKCxVTzMJwFE1ll3msoHmos6sN703xeRf5Tjjx5mfjoWRXWCOZyarAZ+CXdw
         XBDUdVBXjenp4RPFRWCWPuekZgChzptDRqmKAlTbUvvGhSSTY3ZuFKImUxauwd9ujIPC
         ctDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQq0drF518XeKOcGcKI4q/7ENufkQEILdFRVbkw5cdM=;
        b=Gnhhw+N8ymtIOH1ZO6CztIa13SYftDh3t3MUoyPhz8s5Z38mMobsDo5+E4aQLSZifW
         2rgs+sn9yvqk56C20IIOunGTLU5YxDHTAEfKd1KZu4XGXzlevaSfIGcZsqILO/en2SBi
         uRISUbKGoni58MHioR60NuKJlyuhB+C6eoN2YeY8RZaWxaLYt7fDUo0SmD2rtfLtDYio
         dBWx8uoY9FYKCEZIIFEpYZ7bthuU0FO8LWG1Rhvxr7A+ez2vokyfS6gKYag3x4VSRUdN
         2DhidK4y0CMnqqTSImy1iLr3cNTtVE0Ds6PL588OdwZMBsM3OuiHthdR+G7W6m21kRqt
         lAkQ==
X-Gm-Message-State: AGi0PuZWwAu90G4ez4hL3fzAu9s9604PjPaN1ObOK6w97mgGcT5EBx1v
	AY54ltVt9+yTO2jHPiF+c5Vjg78kuRQlUP+AazY=
X-Google-Smtp-Source: APiQypImdUGna2WMxjQO1ydbRBUxA/fmjHAUsjoDTftfLVMsTzqI/tLcbjHp1LyFlc2xl3/ObB2Hvo+ihs0FgALUHxM=
X-Received: by 2002:a1f:c643:: with SMTP id w64mr12456496vkf.0.1588015996362;
 Mon, 27 Apr 2020 12:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200427182223.8449-1-alex.kanavin@gmail.com> <CAGDS+nmzf8crNJn=3x9HZGnXH5CHx6oyZ5GxWG3XH7k1jKAvOg@mail.gmail.com>
In-Reply-To: <CAGDS+nmzf8crNJn=3x9HZGnXH5CHx6oyZ5GxWG3XH7k1jKAvOg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 27 Apr 2020 21:33:05 +0200
Message-ID: <CANNYZj_PN0A7LCLJ=kLM1Jciehpcbw5cv7iW8H6Hh46ZnOKPsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildtools-extended-tarball: add libgomp-dev
To: Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005c7b2c05a44ac965"

--0000000000005c7b2c05a44ac965
Content-Type: text/plain; charset="UTF-8"

Yes, it is.

Alex

On Mon, 27 Apr 2020 at 21:30, Steve Sakoman <sakoman@gmail.com> wrote:

> Alexander,
>
> Is the patch we discussed on IRC as suitable for dunfell?
>
> Steve
>
> On Mon, Apr 27, 2020 at 8:22 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This is needed in particular for newer versions of rpm
> > which would otherwise fail to build due to absence of omp.h header.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb
> b/meta/recipes-core/meta/buildtools-extended-tarball.bb
> > index e38967af3f..c32d0107c3 100644
> > --- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
> > +++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
> > @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK += "\
> >      nativesdk-gettext \
> >      nativesdk-libatomic \
> >      nativesdk-libgcc \
> > +    nativesdk-libgomp-dev \
> >      nativesdk-libstdc++ \
> >      nativesdk-libstdc++-dev \
> >      nativesdk-libstdc++-staticdev \
> > --
> > 2.26.1
> >
> > 
>

--0000000000005c7b2c05a44ac965
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, it is.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Mon, 27 Apr 2020 at 21:30, Steve Sakoman &lt;<a href=3D"mailto:sakoman@gma=
il.com">sakoman@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Alexander,<br>
<br>
Is the patch we discussed on IRC as suitable for dunfell?<br>
<br>
Steve<br>
<br>
On Mon, Apr 27, 2020 at 8:22 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is needed in particular for newer versions of rpm<br>
&gt; which would otherwise fail to build due to absence of omp.h header.<b=
r>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/meta/<a href=3D"http://buildtools-extended-ta=
rball.bb" rel=3D"noreferrer" target=3D"_blank">buildtools-extended-tarball.=
bb</a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://buildtools-exte=
nded-tarball.bb" rel=3D"noreferrer" target=3D"_blank">buildtools-extended-t=
arball.bb</a> b/meta/recipes-core/meta/<a href=3D"http://buildtools-extende=
d-tarball.bb" rel=3D"noreferrer" target=3D"_blank">buildtools-extended-tarb=
all.bb</a><br>
&gt; index e38967af3f..c32d0107c3 100644<br>
&gt; --- a/meta/recipes-core/meta/<a href=3D"http://buildtools-extended-ta=
rball.bb" rel=3D"noreferrer" target=3D"_blank">buildtools-extended-tarball.=
bb</a><br>
&gt; +++ b/meta/recipes-core/meta/<a href=3D"http://buildtools-extended-ta=
rball.bb" rel=3D"noreferrer" target=3D"_blank">buildtools-extended-tarball.=
bb</a><br>
&gt; @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nativesdk-gettext \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nativesdk-libatomic \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nativesdk-libgcc \<br>
&gt; +=C2=A0 =C2=A0 nativesdk-libgomp-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nativesdk-libstdc++ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nativesdk-libstdc++-dev \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 nativesdk-libstdc++-staticdev \<br>
&gt; --<br>
&gt; 2.26.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--0000000000005c7b2c05a44ac965--
