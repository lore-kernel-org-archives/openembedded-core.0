Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4BEC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:20:02 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.12026.1646320801236761890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lOGRIgUo;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 5so7118728lfz.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vji1emqt5iJJ4Es8z3WS4tRMFHj0WkOIK1OCYeHnaFM=;
        b=lOGRIgUokhACXMTDVCBuiSKUFvv8wszZ6YnkrFrlkBcdlYMzZ7W3dMF1rwgnXD47xE
         c89tFVgXgDBtU2YGt45G4CurmdSq4wjU0DUcjR2PXwjOaVQIJmE5t0B3PwPbNh/+rpTj
         8M5gYCn7R9mkZGPlXH/aBi7pSSdoKjUf8LngWSoIUFr5cVx9mesXJJv+nsV78vWVVcil
         zQiswY1+KcoGKy0IPfgK8pVsfX80j62M4TW9iq3lR4VTeBPa+KEJCjB0CEzOAmlXb369
         5YMljKYVmG6ycx+opuySJF/XULScN2tZ77InvIkWVRWnNFWOGI/xTyI3iQj/o8bnF2en
         ySDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vji1emqt5iJJ4Es8z3WS4tRMFHj0WkOIK1OCYeHnaFM=;
        b=3DA+B5JjAO9oNleiZIe5qYJRpAOAFs+1qTPTnah+2Aw2cSySnX/hqCGrO6VmJ2A8tQ
         1bLyiLAc55UgvSaOht3Xi05ZFGY4PctV68nissQDkUasmG/1rOHvlkIKQrJy+Lx1fWo+
         GET/Z+sQCnZhsd+5f1CLZPiajlG8HqstFrYL8v2s6FXVZ5aKCAcqisu6ZbUQ0HgAg71T
         baAvC87aOXI/JUT5GufRkYlWxBnjR4mRGHXv8E3FcqW0HiaXK87EagXo+OJ2tM3ovFMi
         lKS208BXYTASh/z5Z48jZiTkD5Zskudpe1k7E/Wl29TekkgyRV/HYfPJfebzK1ytEoQd
         bLzQ==
X-Gm-Message-State: AOAM5307oFhSD7tnYJ0Rqsk2He7koSmj1bwfqWQgW3wmrP8k1Mhp2GdD
	NAqQhHm/6xS6gRKmKgoSLKZilTQvKWanxyvV6w8=
X-Google-Smtp-Source: 
 ABdhPJzVqgEiR090wKPx6OWHh5d0pj9hjnet01ErmQCFJ01iCmfpasQmq+KVwz7E4KHUsfWt6/7Z8WitiK9UR08tbiI=
X-Received: by 2002:a05:6512:3709:b0:436:26a3:99d3 with SMTP id
 z9-20020a056512370900b0043626a399d3mr21938745lfr.106.1646320799389; Thu, 03
 Mar 2022 07:19:59 -0800 (PST)
MIME-Version: 1.0
References: <16D8E53ED33DE8AA.24484@lists.openembedded.org>
 <f7d911b79f48eb7da976002533b1f64cccc554d3.camel@linuxfoundation.org>
In-Reply-To: 
 <f7d911b79f48eb7da976002533b1f64cccc554d3.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 3 Mar 2022 15:19:47 +0000
Message-ID: 
 <CANPvuR=GTsdG0-BNZvYTaQUYzwOFWJ5ygNnN9ykKOxcUWpBNZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-native: Drop opt-1 and opt-2 pyc files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006f229705d951eecc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 15:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162659

--0000000000006f229705d951eecc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
3/03/2022 =C3=A0(s) 14:37:

> On Thu, 2022-03-03 at 14:28 +0000, Richard Purdie via
> lists.openembedded.org
> wrote:
> > There are over 3,000 of these in python3-native (of 8,000+ files total)
> and
> > copying them to sysroots all the time seems pointless, particularly sin=
ce
> > they're only used if python is run with the -O or -OO parameters.
> >
> > Get rid of them and save the overhead. This is particularly pronounced =
in
> > builds using the api-documentation distro feature.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/python/python3_3.10.2.bb | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb
> b/meta/recipes-devtools/python/python3_3.10.2.bb
> > index 429839b6226..b28aa6505a0 100644
> > --- a/meta/recipes-devtools/python/python3_3.10.2.bb
> > +++ b/meta/recipes-devtools/python/python3_3.10.2.bb
> > @@ -152,6 +152,11 @@ do_install:append:class-native() {
> >          # (these often end up too long for the #! parser in the kernel
> as the
> >          # buffer is 128 bytes long).
> >          ln -s python3-native/python3 ${D}${bindir}/nativepython3
> > +
> > +        # Remove the opt-1.pyc and opt-2.pyc files. There are over
> 3,000 of them
> > +        # and the overhead in each recipe-sysroot-native isn't worth
> it, particularly
> > +        # when they're only used for python called with -O or -OO.
> > +        find ${D} -name *opt-*.pyc -delete
> >  }
> >
> >  do_install:append() {
> >
>
> This does pose an interesting dilemma. We could just go this far, or
> should we
> remove the remaining pyc files (~1,500 of them) and let python create the=
m
> as
> needed, or do we disable them from python entirely?
>

I think that for native recipes it can be created at runtime as needed.

Jose


> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162656):
> https://lists.openembedded.org/g/openembedded-core/message/162656
> Mute This Topic: https://lists.openembedded.org/mt/89525809/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006f229705d951eecc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 3/03/2022 =C3=A0(s) 14:37:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, 2022-03-03 at 14:28 +0000, R=
ichard Purdie via <a href=3D"http://lists.openembedded.org" rel=3D"noreferr=
er" target=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; There are over 3,000 of these in python3-native (of 8,000+ files total=
) and<br>
&gt; copying them to sysroots all the time seems pointless, particularly si=
nce<br>
&gt; they&#39;re only used if python is run with the -O or -OO parameters.<=
br>
&gt; <br>
&gt; Get rid of them and save the overhead. This is particularly pronounced=
 in<br>
&gt; builds using the api-documentation distro feature.<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3_3.10.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.10.2.bb</a> | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
10.2.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.2.bb</a> b/meta/=
recipes-devtools/python/<a href=3D"http://python3_3.10.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3_3.10.2.bb</a><br>
&gt; index 429839b6226..b28aa6505a0 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.10.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.10.2.bb</a><br>
&gt; @@ -152,6 +152,11 @@ do_install:append:class-native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # (these often end up too long for t=
he #! parser in the kernel as the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # buffer is 128 bytes long).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s python3-native/python3 ${D}${b=
indir}/nativepython3<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove the opt-1.pyc and opt-2.pyc file=
s. There are over 3,000 of them<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and the overhead in each recipe-sysroot=
-native isn&#39;t worth it, particularly<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # when they&#39;re only used for python c=
alled with -O or -OO.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${D} -name *opt-*.pyc -delete<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append() {<br>
&gt; <br>
<br>
This does pose an interesting dilemma. We could just go this far, or should=
 we<br>
remove the remaining pyc files (~1,500 of them) and let python create them =
as<br>
needed, or do we disable them from python entirely?<br></blockquote><div><b=
r></div><div>I think that for native recipes it can be created at runtime a=
s needed.</div><div><br></div><div>Jose</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162656): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162656" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162656</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89525809/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89525809/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000006f229705d951eecc--

