Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59652C7EE2E
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 13:27:44 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.6058.1685101786489257671
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 04:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=eIb6yizM;
 spf=pass (domain: snapchat.com, ip: 209.85.218.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-973bf581759so106455866b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1685101785; x=1687693785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Mohg/8NGt/b/AqnE3Tt8/g7sDVErhrAZd0cjiE2ds=;
        b=eIb6yizMfIduNICYlHpFWa4veL7znGJmUq56w4ALZ84Fm4Tx0Y+9roS5SmOG/ziFKG
         ZZymgNQ56A4zk+0GWUO3RnP8vkEBYUncCNlVSz89IwAvuBJ69Y0dNaUD5230Tt5gF7IX
         yLBZmrs3YQ8Uf/Agb//sklEkh3eqBJJ/OWaDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685101785; x=1687693785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+Mohg/8NGt/b/AqnE3Tt8/g7sDVErhrAZd0cjiE2ds=;
        b=ASoJEuqj0BLgd2dYHUomVWJSBy3o59ydrqh48Mn6/+AnVb+gM2nn7aZfLwLsKc9xe/
         +ztrZPaVNt6PuLrdDNds9MAnWB6KlPqRpz8J8S1QOv5gzOLG4MLgh4nfcnIJ/JS5B5kR
         tzCeaCi3MlMzj5z2+zibV4l/6y+KyIMNHgKfpgRg8/ouqpTpkTl4gCdgvKlwJk7mxCN8
         /xPk8PHFKFEUziuxVufbC+oFmdDtrrGxt/kz1X/iMSH1BN+DlM2ekRMoQ/AyqDuzC1RV
         SSNgCX9lyWjERaIEo9cVYqbFW4w1aItmKydIGV1CFnWmxH8Fv7huJ5FYrSlOY6LFZACm
         Xg8w==
X-Gm-Message-State: AC+VfDyRjpYyNwSmrHE/nb3GO6mms1qqFPUInXqX9zSZTXhcfWMYTjJM
	HO3YpiSFKeZCcy/clAjclq1GKeWRa2CENDbLOjUnXA==
X-Google-Smtp-Source: ACHHUZ7O7XqLCIvyBnpWBphOpNCGEixpST7zQhwbqJjxmI0pmSU+GmIE/0oyP3CiImkcuiJMjNc5V451NIOBfHiTxoY=
X-Received: by 2002:a17:907:16a3:b0:96f:afe9:25c7 with SMTP id
 hc35-20020a17090716a300b0096fafe925c7mr1661875ejc.10.1685101784898; Fri, 26
 May 2023 04:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230525132235.1022441-1-ecordonnier@snap.com> <0D9F1393-5095-4AB2-9815-92AE4752681F@arm.com>
In-Reply-To: <0D9F1393-5095-4AB2-9815-92AE4752681F@arm.com>
From: "Etienne Cordonnier" <ecordonnier@snap.com>
Date: Fri, 26 May 2023 13:49:33 +0200
Message-ID: <CAHUKmYaXZNJoxaHesVtW64Ps0mMMucKNVeX6CeV+-Sy8VOP0jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] fix hard-coded .so file extension
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004d190f05fc97556a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 13:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181768

--0000000000004d190f05fc97556a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good point. I had a look at the git history of libxcrypt and at the git
history of poky, and I didn't find anything producing a file
"libcrypt-*.so". Maybe this was just a copy-paste mistake?
Removing FILES:${PN} altogether indeed does not change the files contained
in libxcrypt and libxcrypt-dev. I'll send an updated patch.

On Thu, May 25, 2023 at 9:09=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 25 May 2023, at 14:22, Etienne Cordonnier via lists.openembedded.org
> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
> >
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > E.g. Darwin uses .dylib instead.
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> > meta/recipes-core/libxcrypt/libxcrypt.inc | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > index 61b0381076..7b484d86bc 100644
> > --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> > +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > @@ -17,10 +17,10 @@ SRC_URI +=3D "file://fix_cflags_handling.patch"
> >
> > PROVIDES =3D "virtual/crypt"
> >
> > -FILES:${PN} =3D "${libdir}/libcrypt*.so.* \
> > -               ${libdir}/libcrypt-*.so \
> > -               ${libdir}/libowcrypt*.so.* \
> > -               ${libdir}/libowcrypt-*.so \
> > +FILES:${PN} =3D "${libdir}/libcrypt*${SOLIBS} \
> > +               ${libdir}/libcrypt-*${SOLIBSDEV} \
> > +               ${libdir}/libowcrypt*${SOLIBS} \
> > +               ${libdir}/libowcrypt-*${SOLIBSDEV} \
> > =E2=80=9C
>
> Is this actually right though? The current packaging is:
>
> libxcrypt:
>         /usr/lib/libcrypt.so.2
>         /usr/lib/libcrypt.so.2.0.0
> libxcrypt-dev:
>         /usr/include/crypt.h
>         /usr/lib/libcrypt.so
>         /usr/lib/pkgconfig/libcrypt.pc
>         /usr/lib/pkgconfig/libxcrypt.pc
>
> Which is what I=E2=80=99d expect.  I suspect removing this FILES statemen=
t would
> result in the same packaging and work on Darwin too.
>
> Ross

--0000000000004d190f05fc97556a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good point. I had a look at the git history of libxcrypt a=
nd at the git history of poky, and I didn&#39;t find anything producing a f=
ile &quot;libcrypt-*.so&quot;. Maybe this was just a copy-paste mistake?<br=
>Removing FILES:${PN} altogether indeed does not change the files contained=
 in libxcrypt and libxcrypt-dev. I&#39;ll send an updated patch.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May=
 25, 2023 at 9:09=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@=
arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On 25 May 2023, at 14:22, Etienne Cordonnier vi=
a <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_b=
lank">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.c=
om@lists.openembedded.org" target=3D"_blank">snap.com@lists.openembedded.or=
g</a>&gt; wrote:<br>
&gt; <br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; E.g. Darwin uses .dylib instead.<br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-core/libxcrypt/libxcrypt.inc | 8 ++++----<br>
&gt; 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-=
core/libxcrypt/libxcrypt.inc<br>
&gt; index 61b0381076..7b484d86bc 100644<br>
&gt; --- a/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
&gt; +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
&gt; @@ -17,10 +17,10 @@ SRC_URI +=3D &quot;file://fix_cflags_handling.patc=
h&quot;<br>
&gt; <br>
&gt; PROVIDES =3D &quot;virtual/crypt&quot;<br>
&gt; <br>
&gt; -FILES:${PN} =3D &quot;${libdir}/libcrypt*.so.* \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libc=
rypt-*.so \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libo=
wcrypt*.so.* \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libo=
wcrypt-*.so \<br>
&gt; +FILES:${PN} =3D &quot;${libdir}/libcrypt*${SOLIBS} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libc=
rypt-*${SOLIBSDEV} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libo=
wcrypt*${SOLIBS} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/libo=
wcrypt-*${SOLIBSDEV} \<br>
&gt; =E2=80=9C<br>
<br>
Is this actually right though? The current packaging is:<br>
<br>
libxcrypt:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/libcrypt.so.2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/libcrypt.so.2.0.0<br>
libxcrypt-dev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/include/crypt.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/libcrypt.so<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/pkgconfig/libcrypt.pc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/pkgconfig/libxcrypt.pc<br>
<br>
Which is what I=E2=80=99d expect.=C2=A0 I suspect removing this FILES state=
ment would result in the same packaging and work on Darwin too.<br>
<br>
Ross</blockquote></div>

--0000000000004d190f05fc97556a--

