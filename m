Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.296.1612807666922959544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 10:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=0i87uD15;
 spf=pass (domain: smile.fr, ip: 209.85.208.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f53.google.com with SMTP id t5so19580102eds.12
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 10:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EPGC6yR+Mt0eBGsicKWJsPEXBbu8qWA/tTwp1tVQvV0=;
        b=0i87uD15rKE84Ck6XBmhtRXfV2DMQwUguzSsbG7hgg6mJJHbeP424YOvRmVJUE6MXm
         HfQJ4lovicBHrMlF/o2nqUxZ1K6obgX4LiKD/rd8KY9SpouDFhUo0ffahFi9kBgEfA1O
         8cBeh4sORaKzxvKvptdzF/RZcFimsmIXVH/+tcF8H0CHxfmm1z9jGrMOgDh29nLYxsaj
         LbcqzX8s7Te3JCvC47go5tAn9EsvzqvlJ8dxNeFnf8LwYx6E/sbdZjKZVDyws/kmxwQ5
         DtOk98EPey8yce6Kc+NxabkTI+XIBSfrFFu/1IIhzytrOdPEfu/niQLxe1f4iVWu+e+4
         1bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EPGC6yR+Mt0eBGsicKWJsPEXBbu8qWA/tTwp1tVQvV0=;
        b=JYtH7y9V+nTsGexxQnuwhH++nhA4cfP2z8C1LgirNTmDM4mf31NptSbsu7rCcwCcEv
         KblHtVPXuROS5BS2HqHhEfu7v8yokzpntj1o1+XPsJRoM2hioSEDNFhJ1AG3+iRoBW69
         SfSr8lVOMD11Oz+cjAnUMft7TJCSRGSr2SQyeUkQar1TqT1M4Ojp61iyCYU1cXlhTi1n
         4bKHj8/b/SlFWdlDmhCzzAOfTceQeGSbED8FZXzOYaLxGOfWXtkqKfrtFyjiuvzTTHXa
         gc8qpUKvvoRVdszdC6XThdqS72+p3cio9zqklUd/ZdVPHV3irT6Of5Zf/ElO3ho6G6it
         emqw==
X-Gm-Message-State: AOAM533VXzwp31FPJPXxhmyu2IjWo3xpWIarej6vY7Q9HeE39nBGom8R
	xCE6II3G5t8UaP9yqCUgEoOZAwgvv25XRVSjQiZwNA==
X-Google-Smtp-Source: ABdhPJzdfIIVa9m49NXuuqwthHNEjw1844aj0rWJtqJKORipgxzV34w6K0IIooHTxNaDxQgLoezbTIY6ztwSFH6MED0=
X-Received: by 2002:aa7:d656:: with SMTP id v22mr18354343edr.349.1612807665354;
 Mon, 08 Feb 2021 10:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20210208175226.4081-1-yoann.congal@smile.fr> <AM9PR09MB464216503C5A3768E2779FF6A88F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB464216503C5A3768E2779FF6A88F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Yoann Congal" <yoann.congal@smile.fr>
Date: Mon, 8 Feb 2021 19:07:18 +0100
Message-ID: <CAMSfU+7EdBfWRMOEvZTz-KieyhGrpGsQ8WYU9+eW48H4eCUgeg@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH] npm.bbclass: avoid building target nodejs for native npm recipes
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fc297805bad70b7a"

--000000000000fc297805bad70b7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 8 f=C3=A9vr. 2021 =C3=A0 18:55, Konrad Weihmann <kweihmann@outlook.=
com> a
=C3=A9crit :

>
>
> On 08.02.21 18:52, Yoann Congal wrote:
> > The current recipe unconditionally RDEPENDS on nodejs (the target one)=
.
> > When building on the "-native recipe" of "BBCLASSEXTEND native" recipe=
,
> > the target nodejs is unnecessarily built.
> >
> > This patch fixes this by only RDEPENDS on nodejs when building for the
> target.
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >   meta/classes/npm.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> > index 79f55febcc..61d16cf23d 100644
> > --- a/meta/classes/npm.bbclass
> > +++ b/meta/classes/npm.bbclass
> > @@ -20,7 +20,7 @@
> >   inherit python3native
> >
> >   DEPENDS_prepend =3D "nodejs-native "
> > -RDEPENDS_${PN}_prepend =3D "nodejs "
> > +RDEPENDS_${PN}_class-target_prepend +=3D "nodejs"
>
> This doesn't look right. Either
>
> RDEPENDS_${PN}_class-target_prepend =3D "nodejs "
>   or
> RDEPENDS_${PN}_class-target +=3D "nodejs"
>
> but not both. plus prepend does require a trailing blank iirc
>

Oh wow, I should not have missed that :-/

I'll send a PATCHv2.

Thanks!


> >
> >   NPM_INSTALL_DEV ?=3D "0"
> >
> >
> >
> >
> >
> >
>
>=20
>
>

--=20
Yoann Congal
Smile ECS - Expert technique
yoann.congal@smile.fr

--000000000000fc297805bad70b7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 8 f=C3=A9vr. 2021 =C3=A0=
=
=C2=A018:55, Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">=
kweihmann@outlook.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
<br>
On 08.02.21 18:52, Yoann Congal wrote:<br>
&gt; The current recipe unconditionally RDEPENDS on nodejs (the target one=
).<br>
&gt; When building on the &quot;-native recipe&quot; of &quot;BBCLASSEXTEN=
D native&quot; recipe,<br>
&gt; the target nodejs is unnecessarily built.<br>
&gt; <br>
&gt; This patch fixes this by only RDEPENDS on nodejs when building for th=
e target.<br>
&gt; <br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/npm.bbclass | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass<br>
&gt; index 79f55febcc..61d16cf23d 100644<br>
&gt; --- a/meta/classes/npm.bbclass<br>
&gt; +++ b/meta/classes/npm.bbclass<br>
&gt; @@ -20,7 +20,7 @@<br>
&gt;=C2=A0 =C2=A0inherit python3native<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0DEPENDS_prepend =3D &quot;nodejs-native &quot;<br>
&gt; -RDEPENDS_${PN}_prepend =3D &quot;nodejs &quot;<br>
&gt; +RDEPENDS_${PN}_class-target_prepend +=3D &quot;nodejs&quot;<br>
<br>
This doesn&#39;t look right. Either<br>
<br>
RDEPENDS_${PN}_class-target_prepend =3D &quot;nodejs &quot;<br>
=C2=A0 or<br>
RDEPENDS_${PN}_class-target +=3D &quot;nodejs&quot;<br>
<br>
but not both. plus prepend does require a trailing blank iirc<br></blockqu=
ote><div><br></div><div>Oh wow, I should not have missed that :-/</div><div=
><br></div><div>I&#39;ll send a PATCHv2.<br></div><div>=C2=A0</div><div>Tha=
nks!</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0NPM_INSTALL_DEV ?=3D &quot;0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Con=
gal</font><div><font face=3D"Raleway, regular">Smile ECS - Expert technique=
</font></div><div><font face=3D"Raleway, regular"><a href=3D"mailto:yoann.c=
ongal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a></font></div></d=
iv></div></div>

--000000000000fc297805bad70b7a--
