Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16074EB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 21:23:48 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.1743.1687799564825535289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 10:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=ch77lAD5;
 spf=pass (domain: snapchat.com, ip: 209.85.218.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-988a076a7d3so529501866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 10:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1687799563; x=1690391563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9eHTtx8/8K8f17dReRzf/jYJH6su371IF69p1u29ZfY=;
        b=ch77lAD5snM/M361ds3zjPqZp7vfoUI3u33xpTD5MHgGxAO9FEWIeGlVYtRmDAopca
         DzaNmOOhomFbo0HPgaQBn2eHYBPVaV0NqB20ll6s6zka1e0ljiK//xLWqABDT9WccRxI
         NoKs428PlN8rjOOmxPhbtGGawl1cwcqT32LCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687799563; x=1690391563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eHTtx8/8K8f17dReRzf/jYJH6su371IF69p1u29ZfY=;
        b=UIRQ117Rs3Qw3FfxqvtQfIsXS2L3nPjZumzXSdA+Rml2XFu2JyZhWMcOr0HL8P4F7a
         iu2k1p69yXzJ7cjYKM+c35yYVa4C5eEnsAJL0bNzNXYmMR3Rrz3lqRzSUHJWBrWxQtOB
         YVEraf9m4JfkDbhphutJQKzZf8gZhl88bJw8G0OZO3OaCDYq7P8VGlsjAJ0YqnMkqglw
         gla38qMpO7Ga5bEnBjGU2hnsV2zTHZeSQxYyHSm23S0MNUv9/zWcgdZnNLZUQ92wfPTm
         HyEcr27zaC0XkEDrqJOBhrsr9zwWEgc5OlvzerSxLljiJhBWyvabXHU4QItul5Jf5zXn
         dLXQ==
X-Gm-Message-State: AC+VfDxJuvZXaIZYaubziA9okM5EOnRsDKd0kJ+btEvag7WE7QvVIIWb
	rh8xQVMXywz+hEaOZ7WwYBclFrsNHjzDZqyhQHrIxA==
X-Google-Smtp-Source: ACHHUZ4kvtz21tirLviZ1IQ0AdtwsvIB2D1Fg7qZtqavvcLqniwx+T26rJz2RnUezFKyinmn1IixhkE0dHVV4QQpwXw=
X-Received: by 2002:a17:907:6e88:b0:988:8536:8886 with SMTP id
 sh8-20020a1709076e8800b0098885368886mr26704641ejc.21.1687799555978; Mon, 26
 Jun 2023 10:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230526115155.1953481-1-ecordonnier@snap.com>
 <CAHUKmYbZdJ3kws3ujidWy89pZSM_siGYBbcLzMJtWKbT_6A5dQ@mail.gmail.com>
 <B5654344-F58D-4A5D-8AD7-668A866E9CD4@arm.com> <2023060915502700eeb2a1@mail.local>
In-Reply-To: <2023060915502700eeb2a1@mail.local>
From: "Etienne Cordonnier" <ecordonnier@snap.com>
Date: Mon, 26 Jun 2023 19:12:25 +0200
Message-ID: <CAHUKmYavmC2sXTqswwBZ7VZcTioUtgiukLt-i-aA_iQ7MGRkfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcrypt: fix hard-coded ".so" extension
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fcdcb705ff0b741d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 21:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183430

--000000000000fcdcb705ff0b741d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> It didn't apply cleanly on my master-next and I was waiting for things
> to calm down to get back to it.

OK, thanks for the update. Don't hesitate to let me know in case I should
rebase the patch to avoid a git conflict. It seems to work on the latest
master-next. The files in libxcrypt and libxcrypt-dev are the same before
and after the patch:

$ oe-pkgdata-util list-pkg-files libxcrypt
libxcrypt:
/usr/lib/libcrypt.so.2
/usr/lib/libcrypt.so.2.0.0

libxcrypt-dev:
/usr/include/crypt.h
/usr/lib/libcrypt.so
/usr/lib/pkgconfig/libcrypt.pc
/usr/lib/pkgconfig/libxcrypt.pc


On Fri, Jun 9, 2023 at 5:50=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 09/06/2023 15:19:12+0000, Ross Burton wrote:
> > Probably just fell through a crack, I=E2=80=99ve queued it locally for =
testing.
> >
>
> It didn't apply cleanly on my master-next and I was waiting for things
> to calm down to get back to it.
>
> > Sorry about that!
> >
> > Ross
> >
> > > On 9 Jun 2023, at 10:37, Etienne Cordonnier via lists.openembedded.or=
g
> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
> > >
> > > Hello,
> > > is everything OK with the patch? Is there anything blocking a merge?
> > >
> > > On Fri, May 26, 2023 at 1:52=E2=80=AFPM <ecordonnier@snap.com> wrote:
> > > From: Etienne Cordonnier <ecordonnier@snap.com>
> > >
> > > 2 issues:
> > > - the .so extension is hard-coded, and therefore the libxcryt package
> compiled with
> > >   meta-darwin is empty, because the dylib files are not contained in
> FILES_${PN}
> > > - nothing actually produces a file libcrypt-*.so (the symlink file is
> libcrypt.so, without dash), thus
> > >   defining FILES:${PN} manually to contain libcrypt-*.so has no effec=
t.
> > >
> > > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > > ---
> > >  meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------
> > >  1 file changed, 6 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc
> b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > > index 61b0381076..454a55d73d 100644
> > > --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> > > +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > > @@ -17,12 +17,6 @@ SRC_URI +=3D "file://fix_cflags_handling.patch"
> > >
> > >  PROVIDES =3D "virtual/crypt"
> > >
> > > -FILES:${PN} =3D "${libdir}/libcrypt*.so.* \
> > > -               ${libdir}/libcrypt-*.so \
> > > -               ${libdir}/libowcrypt*.so.* \
> > > -               ${libdir}/libowcrypt-*.so \
> > > -"
> > > -
> > >  S =3D "${WORKDIR}/git"
> > >
> > >  BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
> > > --
> > > 2.36.1.vfs.0.0
> > >
> > >
> > >
> > >
> >
>
> >
> >=20
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&d=3DDw=
IDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3D12f3CsTplzLkTcoMijzp0ABurdB9V1l2zSzRlTZfbJX-s=
-QgWApUHSds7cLJYJfD&s=3DqgbUtzi4aOcTJaUzK5IgGCUAlilJwvwSsSgKsBLvADI&e=3D
>

--000000000000fcdcb705ff0b741d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; It didn&#39;t apply cleanly on my master-next and I w=
as waiting for things<br>&gt; to calm down to get back to it.<br><br>OK, th=
anks for the update. Don&#39;t hesitate to let me know in case I should reb=
ase the patch to avoid a git conflict. It seems to work on the latest maste=
r-next. The files in libxcrypt and libxcrypt-dev are the same before and af=
ter the patch:<br><br>$ oe-pkgdata-util list-pkg-files libxcrypt<br>libxcry=
pt:<br>	/usr/lib/libcrypt.so.2<br>	/usr/lib/libcrypt.so.2.0.0<br><br>libxcr=
ypt-dev:<br>	/usr/include/crypt.h<br>	/usr/lib/libcrypt.so<br>	/usr/lib/pkg=
config/libcrypt.pc<br>	/usr/lib/pkgconfig/libxcrypt.pc<br><br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 9=
, 2023 at 5:50=E2=80=AFPM Alexandre Belloni &lt;<a href=3D"mailto:alexandre=
.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On 09/06/2023 15:19:12+0=
000, Ross Burton wrote:<br>
&gt; Probably just fell through a crack, I=E2=80=99ve queued it locally for=
 testing.<br>
&gt; <br>
<br>
It didn&#39;t apply cleanly on my master-next and I was waiting for things<=
br>
to calm down to get back to it.<br>
<br>
&gt; Sorry about that!<br>
&gt; <br>
&gt; Ross<br>
&gt; <br>
&gt; &gt; On 9 Jun 2023, at 10:37, Etienne Cordonnier via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> &lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedd=
ed.org" target=3D"_blank">snap.com@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; &gt; <br>
&gt; &gt; Hello,<br>
&gt; &gt; is everything OK with the patch? Is there anything blocking a mer=
ge?<br>
&gt; &gt; <br>
&gt; &gt; On Fri, May 26, 2023 at 1:52=E2=80=AFPM &lt;<a href=3D"mailto:eco=
rdonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt; wrote:<br=
>
&gt; &gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.c=
om" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; 2 issues:<br>
&gt; &gt; - the .so extension is hard-coded, and therefore the libxcryt pac=
kage compiled with<br>
&gt; &gt;=C2=A0 =C2=A0meta-darwin is empty, because the dylib files are not=
 contained in FILES_${PN}<br>
&gt; &gt; - nothing actually produces a file libcrypt-*.so (the symlink fil=
e is libcrypt.so, without dash), thus<br>
&gt; &gt;=C2=A0 =C2=A0defining FILES:${PN} manually to contain libcrypt-*.s=
o has no effect.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonni=
er@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------<br>
&gt; &gt;=C2=A0 1 file changed, 6 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/rec=
ipes-core/libxcrypt/libxcrypt.inc<br>
&gt; &gt; index 61b0381076..454a55d73d 100644<br>
&gt; &gt; --- a/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
&gt; &gt; +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc<br>
&gt; &gt; @@ -17,12 +17,6 @@ SRC_URI +=3D &quot;file://fix_cflags_handling.=
patch&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 PROVIDES =3D &quot;virtual/crypt&quot;<br>
&gt; &gt; <br>
&gt; &gt; -FILES:${PN} =3D &quot;${libdir}/libcrypt*.so.* \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}=
/libcrypt-*.so \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}=
/libowcrypt*.so.* \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}=
/libowcrypt-*.so \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 BUILD_CPPFLAGS =3D &quot;-I${STAGING_INCDIR_NATIVE}&quot;<b=
r>
&gt; &gt; -- <br>
&gt; &gt; 2.36.1.vfs.0.0<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.c=
om&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D12f3CsTplzLkTcoMijzp=
0ABurdB9V1l2zSzRlTZfbJX-s-QgWApUHSds7cLJYJfD&amp;s=3DqgbUtzi4aOcTJaUzK5IgGC=
UAlilJwvwSsSgKsBLvADI&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https:=
//urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bootlin.com&amp;d=3DDwIDaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D12f3CsTplzLkTcoMijzp0ABurdB9V1l2zSzRl=
TZfbJX-s-QgWApUHSds7cLJYJfD&amp;s=3DqgbUtzi4aOcTJaUzK5IgGCUAlilJwvwSsSgKsBL=
vADI&amp;e=3D</a> <br>
</blockquote></div>

--000000000000fcdcb705ff0b741d--

