Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2469C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 04:47:21 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.7270.1651553231181980528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 21:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D+lA7sXO;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id x17so28493972lfa.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 21:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hqqphp4RMbAjIlZO9swEQon7zLKEjk6hoIvJ3ZzvMZw=;
        b=D+lA7sXOXKjwdCp5R/LMMVv34pvmJBR4Xn6cIGE6YhaVxTdJhFAUuEjQbaATnMM92f
         ulsiNLcrVHt+mYwx+wseMP+RbfDyCFkXDyl/h3XvrUZ/qVOMrmt6zXHotPbRRyLQ6bdr
         EuMV3iyXrd64VJlqr2RdSz7522NIJJUzk6QVz/3Y1BRz8ad+1T22PlK1RR37g6teVJmN
         0lmKrApOTlvuQBmdEWsF4eL9zIhxMMuq8sbBwAEeq8YtEZRz8QEZ9P9SliTHoyB09oTH
         nsMYc1YrhqF/8CoKtqQdLDCqko9etZewSoKdYOMjbmd74Nu+voQBA1U78NyzSC6RkrdL
         T36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqqphp4RMbAjIlZO9swEQon7zLKEjk6hoIvJ3ZzvMZw=;
        b=VE5NcPo2kvvIdKm86GNony4ku674Lz0Vuh2idy8sg2VgXpvHiL4GIcZafLNLVDHW1o
         r9COvceDWrikfkIhr8BwnWynAVtprntUlBSm6+7oTdylJHov8URRGRDhRXXhkalbYxpf
         84RXjEbagXT8VjcrUVQnEtfm+S0o6JgLCSPAKyfT+pYk0y2ynnjwTZOIy3F+XSsPwSDA
         lfjCqQiAuqjw5NrqYD91y9gugcmKkemJHW1WwOsTo0c0939rMh47F1IMUzS4yYrVTg9Q
         Zd3RJRW5Ys3fUELSDZN25hRnNZ4bx06SlTEyHbdVlnNFOMHjSMZUaClU3sAJcZCfA8Sj
         mkbw==
X-Gm-Message-State: AOAM530xqJXFAcKSP9yk/0J/wVGbsdvCENDa2J9Qtiw3lwv2xiegWUOf
	owBuoWIKdP9VluK1Em7bHAj1mfHru9dIbqLVYdo=
X-Google-Smtp-Source: 
 ABdhPJz/taqQhLXayh5Pa5YV1Bw7yLHcr1MDtd3IXVHjuYrbT7dMHB+gaS5L4u3nj9dwB/nwJFLMeGCop7hMYtvITFU=
X-Received: by 2002:ac2:5b1e:0:b0:472:2c9f:5891 with SMTP id
 v30-20020ac25b1e000000b004722c9f5891mr10390737lfn.534.1651553229301; Mon, 02
 May 2022 21:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220502211001.4183095-1-wes@mitsi.com>
 <20220502211001.4183095-2-wes@mitsi.com>
 <CAPnigKkL5LeyUj5NGwb0iYOeEBGSvm0FAO25zmVD2G9KATEijg@mail.gmail.com>
In-Reply-To: 
 <CAPnigKkL5LeyUj5NGwb0iYOeEBGSvm0FAO25zmVD2G9KATEijg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 May 2022 06:46:58 +0200
Message-ID: 
 <CANNYZj-19bZmShcS4ws_3hDKpxiir7-abo5M-_WEiEUUCCK25Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: disable libjitterentropy due to cpu
 usage
To: wak@google.com
Cc: Wes Malone <wes@mitsi.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008f6a6a05de14334a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 04:47:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165189

--0000000000008f6a6a05de14334a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I wonder why this needs to be disabled altogether at build time. Can=
=E2=80=99t
rng-tools figure out the right sources at run time?

Alex

On Mon 2. May 2022 at 23.33, William A. Kennington III via
lists.openembedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:

> Isn't this desirable if you don't have an hwrng? We want to generate
> entropy so we can perform cryptographic operations by default if we
> bring in rng-tools.
>
> On Mon, May 2, 2022 at 2:10 PM Wes Malone <wes@mitsi.com> wrote:
> >
> > After boot rngd maxes out the processor initializing JITTER entropy for
> > some minutes. Here we disable libjitterentropy in favor of only using
> > the hardware random source via config.
> >
> > Signed-off-by: Wes Malone <wes@mitsi.com>
> > ---
> >  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > index 0696351903..4eed060960 100644
> > --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> > @@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfig
> >
> >  EXTRA_OECONF =3D "--without-rtlsdr"
> >
> > -PACKAGECONFIG ??=3D "libjitterentropy"
> >  PACKAGECONFIG:libc-musl =3D "libargp libjitterentropy"
> >
> >  PACKAGECONFIG[libargp] =3D
> "--with-libargp,--without-libargp,argp-standalone,"
> > --
> > 2.36.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165177):
> https://lists.openembedded.org/g/openembedded-core/message/165177
> Mute This Topic: https://lists.openembedded.org/mt/90845997/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008f6a6a05de14334a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, I wonder why this needs to be disabled altogether at=
 build time. Can=E2=80=99t rng-tools figure out the right sources at run ti=
me?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 2. M=
ay 2022 at 23.33, William A. Kennington III via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;wak=3D<a href=3D"mailto:googl=
e.com@lists.openembedded.org">google.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border=
-left-color:rgb(204,204,204)">Isn&#39;t this desirable if you don&#39;t hav=
e an hwrng? We want to generate<br>
entropy so we can perform cryptographic operations by default if we<br>
bring in rng-tools.<br>
<br>
On Mon, May 2, 2022 at 2:10 PM Wes Malone &lt;<a href=3D"mailto:wes@mitsi.c=
om" target=3D"_blank">wes@mitsi.com</a>&gt; wrote:<br>
&gt;<br>
&gt; After boot rngd maxes out the processor initializing JITTER entropy fo=
r<br>
&gt; some minutes. Here we disable libjitterentropy in favor of only using<=
br>
&gt; the hardware random source via config.<br>
&gt;<br>
&gt; Signed-off-by: Wes Malone &lt;<a href=3D"mailto:wes@mitsi.com" target=
=3D"_blank">wes@mitsi.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a> | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tool=
s_6.15.bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a> b/met=
a/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">rng-tools_6.15.bb</a><br>
&gt; index 0696351903..4eed060960 100644<br>
&gt; --- a/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a><br>
&gt; +++ b/meta/recipes-support/rng-tools/<a href=3D"http://rng-tools_6.15.=
bb" rel=3D"noreferrer" target=3D"_blank">rng-tools_6.15.bb</a><br>
&gt; @@ -21,7 +21,6 @@ inherit autotools update-rc.d systemd pkgconfig<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--without-rtlsdr&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG ??=3D &quot;libjitterentropy&quot;<br>
&gt;=C2=A0 PACKAGECONFIG:libc-musl =3D &quot;libargp libjitterentropy&quot;=
<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[libargp] =3D &quot;--with-libargp,--without-libarg=
p,argp-standalone,&quot;<br>
&gt; --<br>
&gt; 2.36.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165177): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165177" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165177</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90845997/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90845997/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008f6a6a05de14334a--

