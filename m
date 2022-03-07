Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2602C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 17:35:46 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.857.1646674542274479955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cloH0E7o;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 3so8900438lfr.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 09:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WPBxV79xFHfzbIagg4DV+JbG3Qr+dN6PwYToW+PmD9E=;
        b=cloH0E7oZbHPMiCeAxmVsBWUsUM68L/rYcrdH51DJovktyz366Osn6aUtbtnCsnnQc
         VR1LrMPfiux0+FLXf082/UeNZGiw3ZcOiIKik+SM2aPZMrhwV5n4OpN+MMrnU2khSKBU
         45AEFB7xxAe+BiZ+OzyfSe14XQj0GT1rpIpHakORWUtopd6fv+/6zAIjOFmGsucjTyGP
         lpMt2Q+OABNeYxpKNTHGJMRhYF7W0fCFIuW6+I59IIAwVSx4ZyoWPi4cEPea+aMDvWZy
         98EI7AArq4cb0gM4zbQJswf6RIhYpi9BGHKyh/0L02rh6FHTNThRDOkw4Olxr+eY2tl1
         Bm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WPBxV79xFHfzbIagg4DV+JbG3Qr+dN6PwYToW+PmD9E=;
        b=C/pkpEBCVOvq4Pn9abv5LytHHUzUtQJdULWToA/GKhUWleTUm0GIHzeQ5BxRVtqep2
         /xV3wwHGEliRjEl8Yn4h/aYLTqLPHs8j9BfhC7lZ2ezkweDuLt69voWFlpgwLErlbwvw
         ODFTMY8qRo8UpzdKrWqDz2xAQk1QUKX3QmQNYdrL/7YWuckd5TAHiuimmV9YskCxPGEg
         e4JUvwWsC1BupWWQB9/5Hv4RofgvCTqs5gKWshP2gyCtYPS2h96g+QUKvpejDPlsNZju
         GD5CPgdn5SZrGDCFcnBRI19dlBMSJ+kr0VBJplF+ukBt2QtEKhGV1v3vK911syUT6jTr
         0X/A==
X-Gm-Message-State: AOAM530dR3so3Nxwp+gbnGQcfhbYNfMr6Gw14U1BFFTXdIgNvassA1VD
	k16r5cYOn404HeiJJQi1MZLP2AN4Xy2BRTplJyQ=
X-Google-Smtp-Source: 
 ABdhPJyTnlAYVWCZCjuQaoeZujkXkAEQP2rKf9GgwTG6h1Bg8CcmGY9TlhKPqyRkCyFzDCnBIVbXdD4oTFih9PP7jzs=
X-Received: by 2002:a19:654c:0:b0:448:2649:1169 with SMTP id
 c12-20020a19654c000000b0044826491169mr6754481lfj.555.1646674540451; Mon, 07
 Mar 2022 09:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20220307085919.426627-1-quaresma.jose@gmail.com>
 <d0ce368f42264868a8af1e4c390fbe58@axis.com>
 <a293ee7c3829c56572d618628a129ae4ef7a0de7.camel@linuxfoundation.org>
In-Reply-To: 
 <a293ee7c3829c56572d618628a129ae4ef7a0de7.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 7 Mar 2022 17:35:29 +0000
Message-ID: 
 <CANPvuRkN7kcxGd0diyAacSLniuKi+gHAwOH-=idaT6cnwsWxbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] gstreamer1.0-plugins-bad/ugly: use the
 GPL-2.0-or-later only when it is in use
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000b5a9a05d9a44bc0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 17:35:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162857

--0000000000000b5a9a05d9a44bc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 7/03/2022 =C3=A0(s) 15:50:

> On Mon, 2022-03-07 at 15:33 +0000, Peter Kjellerstedt wrote:
> > >
> > > diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb
> > > index 9b6f80aa89..577ba16af7 100644
> > > --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb
> > > +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-ugly_1.20.0.bb
> > > @@ -1,4 +1,5 @@
> > >  require gstreamer1.0-plugins-common.inc
> > > +require gstreamer1.0-plugins-license.inc
> > >
> > >  DESCRIPTION =3D "'Ugly GStreamer plugins"
> > >  HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
> > > @@ -8,7 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
> > >
> > >
> file://tests/check/elements/xingmux.c;beginline=3D1;endline=3D21;md5=3D4c=
771b8af188724855cb99cadd390068"
> > >
> > >  LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
> > > -LICENSE_FLAGS =3D "commercial"
> >
> > I still think this is wrong. I.e., the commercial flag is not
> > related to a plugin using GPL or not, but rather the fact that it
> > is in ugly. E.g., the reason may be patent considerations and
> > can apply to any of the plugins regardless of license.
>

yes i'm making some confusion here with the commercial flag and the GPL
license, the reason is:

faad have commercial flag
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multime=
dia/faad2/faad2_2.8.8.bb?id=3Dc0a4a0355d1f37849f47d9f29c5c5dbd59806a3a

resindvd don't have commercial flag
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multime=
dia/libdvdread/libdvdread_6.1.2.bb?id=3D1dc583540355ab6af483b20b945cbd7c429=
84ccf
https://git.openembedded.org/meta-openembedded/tree/meta-multimedia/recipes=
-multimedia/libdvdnav/libdvdnav_6.1.1.bb?id=3D51f61a7899f40e9910baea12217ed=
8a27ac09f62

x265 have commercial flag
https://git.openembedded.org/meta-openembedded/tree/meta-multimedia/recipes=
-multimedia/x265/x265_3.2.1.bb?id=3D90683147fa6840b16816a75154dba89725ddb0a=
3

I will drop the LICENSE_FLAGS change from my patch and will send a v5.

jose

>
> >
>
> Agreed, that flag should be independent of whether GPL is there or not.
>
> Cheers,
>
> Richard
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000b5a9a05d9a44bc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia segunda, 7/03/2022 =C3=A0(s) 15:50:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, 2022-03-07 at 15:33 +0000, =
Peter Kjellerstedt wrote:<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://=
gstreamer1.0-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">g=
streamer1.0-plugins-ugly_1.20.0.bb</a> b/meta/recipes-multimedia/gstreamer/=
<a href=3D"http://gstreamer1.0-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gstreamer1.0-plugins-ugly_1.20.0.bb</a><br>
&gt; &gt; index 9b6f80aa89..577ba16af7 100644<br>
&gt; &gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreame=
r1.0-plugins-ugly_1.20.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstream=
er1.0-plugins-ugly_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreame=
r1.0-plugins-ugly_1.20.0.bb</a><br>
&gt; &gt; @@ -1,4 +1,5 @@<br>
&gt; &gt; =C2=A0require gstreamer1.0-plugins-common.inc<br>
&gt; &gt; +require gstreamer1.0-plugins-license.inc<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0DESCRIPTION =3D &quot;&#39;Ugly GStreamer plugins&quot;<br>
&gt; &gt; =C2=A0HOMEPAGE =3D &quot;<a href=3D"https://gstreamer.freedesktop=
.org/" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.freedesktop.o=
rg/</a>&quot;<br>
&gt; &gt; @@ -8,7 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da=
6f89e2100d9b6cdffcea4f398e37343 \<br>
&gt; &gt; <br>
&gt; &gt; file://tests/check/elements/xingmux.c;beginline=3D1;endline=3D21;=
md5=3D4c771b8af188724855cb99cadd390068&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0LICENSE =3D &quot;LGPL-2.1-or-later &amp; GPL-2.0-or-later&=
quot;<br>
&gt; &gt; -LICENSE_FLAGS =3D &quot;commercial&quot;<br>
&gt; <br>
&gt; I still think this is wrong. I.e., the commercial flag is not <br>
&gt; related to a plugin using GPL or not, but rather the fact that it <br>
&gt; is in ugly. E.g., the reason may be patent considerations and <br>
&gt; can apply to any of the plugins regardless of license.<br></blockquote=
><div><br></div><div>yes i&#39;m making some confusion here with the commer=
cial flag and the GPL license, the reason is:</div><div><br></div><div>faad=
 have commercial flag<br><a href=3D"https://git.openembedded.org/meta-opene=
mbedded/tree/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb?id=3Dc0a4a0355=
d1f37849f47d9f29c5c5dbd59806a3a">https://git.openembedded.org/meta-openembe=
dded/tree/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb?id=3Dc0a4a0355d1f=
37849f47d9f29c5c5dbd59806a3a</a><br><br>resindvd don&#39;t have commercial =
flag<br><a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta=
-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb?id=3D1dc583540355ab6a=
f483b20b945cbd7c42984ccf">https://git.openembedded.org/meta-openembedded/tr=
ee/meta-oe/recipes-multimedia/libdvdread/libdvdread_6.1.2.bb?id=3D1dc583540=
355ab6af483b20b945cbd7c42984ccf</a><br><a href=3D"https://git.openembedded.=
org/meta-openembedded/tree/meta-multimedia/recipes-multimedia/libdvdnav/lib=
dvdnav_6.1.1.bb?id=3D51f61a7899f40e9910baea12217ed8a27ac09f62">https://git.=
openembedded.org/meta-openembedded/tree/meta-multimedia/recipes-multimedia/=
libdvdnav/libdvdnav_6.1.1.bb?id=3D51f61a7899f40e9910baea12217ed8a27ac09f62<=
/a><br><br>x265 have commercial flag<br><a href=3D"https://git.openembedded=
.org/meta-openembedded/tree/meta-multimedia/recipes-multimedia/x265/x265_3.=
2.1.bb?id=3D90683147fa6840b16816a75154dba89725ddb0a3">https://git.openembed=
ded.org/meta-openembedded/tree/meta-multimedia/recipes-multimedia/x265/x265=
_3.2.1.bb?id=3D90683147fa6840b16816a75154dba89725ddb0a3</a><br></div><div><=
br></div><div>I will drop the LICENSE_FLAGS change=C2=A0from my patch and w=
ill send a v5.</div><div><br></div><div>jose</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; <br>
<br>
Agreed, that flag should be independent of whether GPL is there or not.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000000b5a9a05d9a44bc0--

