Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4043C4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:49:00 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.129182.1671094134577135538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VBUbMfsM;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id c1so14575681lfi.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wv1WC2EnNOGtWx1VYRRF4A2cx3XCVQCdEtYv7+2R/WU=;
        b=VBUbMfsM5Lchru4TdBplIEePIAvZmI2gJ+60CGaXxfgo3xb+ETNyknob/5rDXVToaU
         o15jhOBL2a88K3yoTR2VeF/zuNyjrTWW6mj3glfpAo+S76XrG4uqk5TzIUjT2nwW2Ueo
         PiDXMrkPm/mqy1MIuG1f9HxmepUzzwUwtdfqGhIOFgDIsMZmSi6kHd68wS0B76O8kMug
         cio5XY2pV4RaaX5vsOfNi4PXzunBfyZsUguNjiG4Fx4opTD0XRSSDWZA9yEmxMiVhP4M
         Ae/0v2eyclBdyY4bwoluSlfccvGzyPhYdoPkJEXl73T6pfiErtlpKkqJW5jhKBnVorzS
         dJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wv1WC2EnNOGtWx1VYRRF4A2cx3XCVQCdEtYv7+2R/WU=;
        b=whQOjy8uEuKMJC/XmTQ6a7BrmikM+ttRRMLPWXsyZoI4XdQYL9UQuGR/+xKSVJmSUG
         Winz3V3GIJSu1JpvoY2COofieILcmUjN39nKyWVPGPHwFPlHZSEOoiPxkJ4eX/Mya5Ti
         p6N2Ib7MD9fe9o5JXl2z3x2eZpckh83kUke4bY9D2GRL/Dnrj6aCj+X5RiB4VFOF5tOg
         Acaujz9Q22NqDDg0XxEHl5qW5o5YbM9/2v4wFxWWwzd05wZu3TNqHvrIOCfmX0dB0qP0
         CQ+xG8g2DfD6cRDCvs8Iln+t91BGzk0xmwDHmN+T9+8lkQzUFXqNnFhFsRG1d2dhcsm9
         YVeg==
X-Gm-Message-State: ANoB5pn8T+Fw0uRzI61xL7hWAWlK3ryJxrJxSCc7xvOTUcy2IV3/5+jS
	1VqIg7z/cyCsLIDuUK48D0tiov7vW/B1lRya/Ng=
X-Google-Smtp-Source: AA0mqf7tH+n66pjs0vU6IXKln1Lfg0NwVVUNl5nNKfWSeYkgjE3xrY+AhRLAXuZZYk+FYIWqmiibWhTympUANnoDu40=
X-Received: by 2002:a05:6512:2253:b0:4b6:eb69:f8a8 with SMTP id
 i19-20020a056512225300b004b6eb69f8a8mr899423lfu.491.1671094132342; Thu, 15
 Dec 2022 00:48:52 -0800 (PST)
MIME-Version: 1.0
References: <20221214142854.2300854-1-rybczynska@gmail.com> <CAOSpxdYBQpVbgUHCNmpjVGnNYCwF-A4bhidQHtXOAN56gHSoZQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYBQpVbgUHCNmpjVGnNYCwF-A4bhidQHtXOAN56gHSoZQ@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 15 Dec 2022 09:48:40 +0100
Message-ID: <CAApg2=R0O6Uti3MDriniTMj-u7sG7UHYK0BhEeDbVgRsRoZTkA@mail.gmail.com>
Subject: Re: [kirkstone][OE-core][PATCH] efibootmgr: update compilation with musl
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002507c505efd9ecbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174574

--0000000000002507c505efd9ecbb
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 14, 2022 at 5:08 PM Steve Sakoman <steve@sakoman.com> wrote:

> On Wed, Dec 14, 2022 at 4:29 AM Marta Rybczynska <rybczynska@gmail.com>
> wrote:
> >
> > Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d
> > (efivar: add musl libc compatibility) efibootmgr compiles with
> > musl too. Update the variable to take that into account.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
> > ---
> >  meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> > index 11d8b9061d..be6571b3fa 100644
> > --- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> > +++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> > @@ -34,6 +34,4 @@ do_install () {
> >  }
> >
> >  CLEANBROKEN = "1"
> > -# https://github.com/rhboot/efivar/issues/202
> > -COMPATIBLE_HOST:libc-musl = 'null'
>
> I see that master also has the above -- should it also be removed in
> master?  If so, resubmit for master and I will backport to kirkstone.
>
>
>
Al three branches finished compilation just fine, so all three are
submitted. You can pick it up the moment
it hits master.

Kind regards,
Marta

--0000000000002507c505efd9ecbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 14, 2022 at 5:08 PM Steve=
 Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, =
Dec 14, 2022 at 4:29 AM Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@g=
mail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Since the commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d<br>
&gt; (efivar: add musl libc compatibility) efibootmgr compiles with<br>
&gt; musl too. Update the variable to take that into account.<br>
&gt;<br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@linaro.org" target=3D"_blank">marta.rybczynska@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-bsp/efibootmgr/<a href=3D"http://efibootmgr_17.bb" =
rel=3D"noreferrer" target=3D"_blank">efibootmgr_17.bb</a> | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/efibootmgr/<a href=3D"http://efibootmgr_=
17.bb" rel=3D"noreferrer" target=3D"_blank">efibootmgr_17.bb</a> b/meta/rec=
ipes-bsp/efibootmgr/<a href=3D"http://efibootmgr_17.bb" rel=3D"noreferrer" =
target=3D"_blank">efibootmgr_17.bb</a><br>
&gt; index 11d8b9061d..be6571b3fa 100644<br>
&gt; --- a/meta/recipes-bsp/efibootmgr/<a href=3D"http://efibootmgr_17.bb" =
rel=3D"noreferrer" target=3D"_blank">efibootmgr_17.bb</a><br>
&gt; +++ b/meta/recipes-bsp/efibootmgr/<a href=3D"http://efibootmgr_17.bb" =
rel=3D"noreferrer" target=3D"_blank">efibootmgr_17.bb</a><br>
&gt; @@ -34,6 +34,4 @@ do_install () {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 CLEANBROKEN =3D &quot;1&quot;<br>
&gt; -# <a href=3D"https://github.com/rhboot/efivar/issues/202" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/rhboot/efivar/issues/202</a><b=
r>
&gt; -COMPATIBLE_HOST:libc-musl =3D &#39;null&#39;<br>
<br>
I see that master also has the above -- should it also be removed in<br>
master?=C2=A0 If so, resubmit for master and I will backport to kirkstone.<=
br>
<br><br></blockquote><div><br></div><div><span class=3D"ng" style=3D"backgr=
ound:rgba(0,0,0,0) none repeat scroll 0% 0%!important">Al three</span> bran=
ches finished compilation just fine, so all three are submitted. You can pi=
ck it up the moment</div><div>it hits master.</div><div><br></div><div>Kind=
 regards,</div><div>Marta <br></div></div></div>

--0000000000002507c505efd9ecbb--

