Return-Path: <attila.hannibal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEBDC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:31:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.15639.1707391868873309802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3DAdAhv;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: attila.hannibal@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55790581457so2286537a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 03:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707391867; x=1707996667; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wENFjPhLtkp0J5PjoI/yN8wDF3JCmGaABHXlAG49EEc=;
        b=O3DAdAhvAJNmTyv6LQ840cUElMS4fjIpkijIP8ty4aLcnSivplevotMHM3docF5k6+
         VwsIMCoDcYeDDi54o9aDiBnKnSUQBZdmSkMbR9DX+gHzaNOogd4jbLiGnsFqLpQsdQpw
         2hanBb8CctU+9fWetSK1ypWMuUcR2R/4yQUx2yzFtb2q6sCdd/g7Z9zPliQSuCRsKslK
         afJSy6JvGUvs5S7TvxKFa99KeQ9Jm09qakgEif82mD8oMEDLtyWID6nyzLV0YSr6FxXf
         I+Tz7S7Dkr/6llQn2HuB1zGbe/wgcgmyDie9GdYQFf98xxjjKFU98ffcWLJ/B7/KVobj
         Xu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707391867; x=1707996667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wENFjPhLtkp0J5PjoI/yN8wDF3JCmGaABHXlAG49EEc=;
        b=STsWr+Gfv1iH5rOPxLjrnPT4wundrnuI1r60SIYkGqSm+zY4tmtSS7PYhZtxOiYGDQ
         kUvFBnzgIFP8GXQGFlKF5SLgdHJsZtHo2UpkWAJ/22+CKHpYkzkn7kRkCL8nKCsTtnTx
         6yD/az2pybUFOOXL9MXQ8x26hYMfVSukWgWxRBNhmAgvLsgOG6vS/6e9xcgeOlwReg0p
         8Pxb4vYsyq5hgW57djrpLCCUol1FYloX2UXTBF2JoPiMrfxfzBGQ3B2OzjGbP/GVnP4I
         Hkc26y6o8ZMpjn6ZYbPOCuRBQKoGgjth+wyds0zH0knJCTxZQQsaSv3zPwKoW2CJm5YI
         36mA==
X-Gm-Message-State: AOJu0YzXogxxsgvA3+XSzvoWzW1UA5xWdPUzzUywwP1MkNSvrHa9XXq3
	iX+jwqOdJqZgUGegQEGRn1Mi/LWho9Ku3mnt3HDt1JTcf0736jOsoN7e5ERUBhHBcTQzneSAQzJ
	hfzgh9WtkYQaRxX3UBfZdYEW/h3Y=
X-Google-Smtp-Source: AGHT+IE/77Gt2HSnjn/wVVcdejBvDdUh/dWSqV7uVNMZPx/vNIFiCO0h0eVUyf/p8g2lpf86jxbm4bOuqYG4PgY2mwY=
X-Received: by 2002:aa7:d595:0:b0:561:e8c:793a with SMTP id
 r21-20020aa7d595000000b005610e8c793amr921500edq.33.1707391867082; Thu, 08 Feb
 2024 03:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20240208111737.6480-1-attila.hannibal@heitec.hu> <ad2c67bb503873dd90a5fb08df1c1922e6adfc17.camel@linuxfoundation.org>
In-Reply-To: <ad2c67bb503873dd90a5fb08df1c1922e6adfc17.camel@linuxfoundation.org>
From: =?UTF-8?Q?Attila_Hannib=C3=A1l?= <attila.hannibal@gmail.com>
Date: Thu, 8 Feb 2024 12:30:55 +0100
Message-ID: <CANsWD5rkpdej1QXuNBBSmaQ4cXY9p7uhYyqN=jZRB7NS_+1DCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-omx: remove commercial license flag
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Attila Hannibal <attila.hannibal@heitec.hu>
Content-Type: multipart/alternative; boundary="000000000000badb7a0610dd258a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195138

--000000000000badb7a0610dd258a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, based on the Readme in the gstreamer-omx repo (
https://github.com/GStreamer/gst-omx/blob/master/README) it and its
contents are LGPL.

In case it uses external codecs, shouldn't the external codecs recipe(s)
contain the commercial license flag?



Attila

On Thu, Feb 8, 2024 at 12:22=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2024-02-08 at 12:17 +0100, Attila Hannibal wrote:
> > The gstreamer OpenMAX IL plugin is completely LGPL licensed,
> > the "commercial" marking should be removed.
> >
> > Signed-off-by: Attila Hannibal <attila.hannibal@heitec.hu>
> > ---
> >  meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-omx_1.22.9.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-omx_1.22.9.bb
> > index 05d64748bb..fad3714839 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.9.bb
> > @@ -4,7 +4,6 @@ HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
> >  SECTION =3D "multimedia"
> >
> >  LICENSE =3D "LGPL-2.1-or-later"
> > -LICENSE_FLAGS =3D "commercial"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36=
4516c
> \
> >
> file://omx/gstomx.h;beginline=3D1;endline=3D21;md5=3D5c8e1fca32704488e76d=
2ba9ddfa935f"
> >
>
> This is not about the license of the code but whether you can actually
> use the codecs in there without some kind of license to do so.
>
> Even if code is open source, the algorithms it implements can have
> other restrictions.
>
> Cheers,
>
> Richard
>
>

--000000000000badb7a0610dd258a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"gmail-MsoPlainText" style=3D"=
margin:0cm;font-size:11pt;font-family:&quot;Courier New&quot;">Yes, based o=
n the Readme in the gstreamer-omx repo (<a href=3D"https://github.com/GStre=
amer/gst-omx/blob/master/README" style=3D"color:rgb(5,99,193)">https://gith=
ub.com/GStreamer/gst-omx/blob/master/README</a>)
it and its contents are LGPL.</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:11pt;font-fam=
ily:&quot;Courier New&quot;">In case it uses external codecs, shouldn&#39;t=
 the external
codecs recipe(s) contain the commercial license flag?</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:11pt;font-fam=
ily:&quot;Courier New&quot;">=C2=A0</p>

<p class=3D"gmail-MsoPlainText" style=3D"margin:0cm;font-size:11pt;font-fam=
ily:&quot;Courier New&quot;">Attila</p></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 8, 2024 at 12:22=E2=80=
=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Thu, 2024-02-08 at 12:17 +0100, At=
tila Hannibal wrote:<br>
&gt; The gstreamer OpenMAX IL plugin is completely LGPL licensed,<br>
&gt; the &quot;commercial&quot; marking should be removed.<br>
&gt; <br>
&gt; Signed-off-by: Attila Hannibal &lt;<a href=3D"mailto:attila.hannibal@h=
eitec.hu" target=3D"_blank">attila.hannibal@heitec.hu</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-omx_1.22.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.22.=
9.bb</a> | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-omx_1.22.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-om=
x_1.22.9.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-omx_1.22.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-om=
x_1.22.9.bb</a><br>
&gt; index 05d64748bb..fad3714839 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-omx_1.22.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.22.=
9.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-omx_1.22.9.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-omx_1.22.=
9.bb</a><br>
&gt; @@ -4,7 +4,6 @@ HOMEPAGE =3D &quot;<a href=3D"http://gstreamer.freedes=
ktop.org/" rel=3D"noreferrer" target=3D"_blank">http://gstreamer.freedeskto=
p.org/</a>&quot;<br>
&gt;=C2=A0 SECTION =3D &quot;multimedia&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LICENSE =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt; -LICENSE_FLAGS =3D &quot;commercial&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd2559=
51079008b364516c \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://omx/gstomx.h;beginline=3D1;endline=3D21;md5=3D5c8e1fca3270448=
8e76d2ba9ddfa935f&quot;<br>
&gt;=C2=A0 <br>
<br>
This is not about the license of the code but whether you can actually<br>
use the codecs in there without some kind of license to do so.<br>
<br>
Even if code is open source, the algorithms it implements can have<br>
other restrictions.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000badb7a0610dd258a--

