Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCEDC433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:42:52 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.54182.1638808971695061989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FmYafIQ1;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id o1so20827397uap.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KNHvQB7T6AfF0n1N2KJBuLPH/pkp3YmvsPTLqdWzvhQ=;
        b=FmYafIQ1OIFV+ak+hxk67tc5CDjFDbB1nWNFEh7zn/cDJgLRVQ8BX04lgl90PwM4gE
         GROs72J0iwVaT/TZMEHy0jBxtdyrsd4zWSRSpmZJ0uHNdt9MEGa0HOWcf1AZQyAK5SaZ
         Fl9f7eJHBfRjgnDmeeaf0Zv8Q1KQVzQNACybnb8cPsao9vczDrx2uCdi7J3CXKsEcYzX
         vb0yxdZnZIU3P+O1MEV8xI6Gx7UpC85Qq1wl3dYeq99q6agQpF7O1epTt2NEs5LaWKBh
         BlaWRlALSi9Wnm0v3nAoKromZbTGmYlAh+DUbWMmvdP8jDYUadC+IIzLabH03f6Nyx8r
         KaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KNHvQB7T6AfF0n1N2KJBuLPH/pkp3YmvsPTLqdWzvhQ=;
        b=zOQpjELEuDRQdf7phkixKc0KxyCYwCxXpeqEoyJbGQ99e+4UTSBmU66/P2JNwF2H3I
         Lx3JjQJCVa8A77Wf7jORdMWNvYdrqIjJvZUzz9/94SLE+qCBBaJWiSpJdO4yN7n9Lfg9
         p+gPZNtIYToO6klbJ/Iiw3kn9z9mgtA4BueQiq13tWgdwWICCIP5a9o7BlcWoZbWrbzf
         lIez2EhuCFKLJX3UZNxysNza/ZbMFHd0V8ZqDy6XJX5Kq9x9BeCadyRSFhANbiClada2
         mLr3fThl5m/x+prySy2bGCC4NnEHhuPwwhJyniY+nhfI11wVDRduLeoUwT8eNrdXGQw7
         PKGQ==
X-Gm-Message-State: AOAM533TaRCSI5IkL9c/U3gNcSiADx+riizM4ggujdqA01NPZiKZLY0C
	MwU2/7vvIu8LyTvOLYcqRSjsrF8m++1QCTPluUo=
X-Google-Smtp-Source: 
 ABdhPJyxukGNgcTW5MBjEU+2iP1ia8rSZ4biGEVguxJB/Tw+T7AnEVVjvXJeRT07FjMUoVz6dk/yWvMKqf6cHJxTFus=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr36989429vst.42.1638808970891;
 Mon, 06 Dec 2021 08:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8r-3BvcYnaiBbTGzBJ_iAPg6Sn83Dt4N4NLUh+vP-=yQ@mail.gmail.com>
 <f0d640e1911f8e9577ef7ee5ffef426b084861f4.camel@linuxfoundation.org>
 <CANNYZj82Y67WWDXi0FPHu1sEPCxkK4eUiA3_2km0t-sscr_Oig@mail.gmail.com>
 <16BE3764EC109E5A.28785@lists.openembedded.org>
 <AM9PR09MB46424FBD593826C43E06C47DA86D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46424FBD593826C43E06C47DA86D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 17:42:39 +0100
Message-ID: 
 <CANNYZj9qz1n-U7bjPHtmA949TCWkxua3bFA1jEmfjoGEAMSdkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] minicom: Upgrade 2.7.1 -> 2.8
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000090930505d27cf2ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 16:42:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159258

--00000000000090930505d27cf2ae
Content-Type: text/plain; charset="UTF-8"

I just sent the proper fix to bitbake-devel :)

Alex

On Mon, 6 Dec 2021 at 17:41, Konrad Weihmann <kweihmann@outlook.com> wrote:

> It's of course *not* the file extension, but the .orig. that is
> confusing the default upstream regex check
>
> This here worked for me
>
> UPSTREAM_CHECK_REGEX = "${BPN}_(?P<pver>\d+(\.\d+)+)\.orig\..*"
>
> but surely it can be fine tuned
>
> On 06.12.21 17:30, Konrad Weihmann wrote:
> > I think the answer is that latest release is a bz2, while the older one
> > are gzipped
> >
> >
> http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.7.1.orig.tar.gz
> >
> > vs.
> >
> >
> http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.8.orig.tar.bz2
> >
> > On 06.12.21 16:57, Alexander Kanavin wrote:
> >> This one is odd and it should be working. I'll cherry-pick your update
> >> and get to the bottom of it. This may mean we are missing other
> >> updates that are coming from debian tarballs.
> >>
> >> Alex
> >>
> >> On Mon, 6 Dec 2021 at 14:59, Richard Purdie
> >> <richard.purdie@linuxfoundation.org
> >> <mailto:richard.purdie@linuxfoundation.org>> wrote:
> >>
> >>     On Mon, 2021-12-06 at 14:43 +0100, Alexander Kanavin wrote:
> >>      > Since AUH didn't pick this up, can you run 'devtool
> >>     latest-version minicom'
> >>      > with this update, as it probably would report something that
> >>     needs fixing via
> >>      > regexp?
> >>
> >>     That shows:
> >>
> >>     WARNING: latest_versionstring: package minicom_2.8.orig.tar.bz2
> >>     don't match pattern
> >>
> >>     Cheers,
> >>
> >>     Richard
> >>
> >>
> >>
> >>
> >>
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159255):
> https://lists.openembedded.org/g/openembedded-core/message/159255
> > Mute This Topic: https://lists.openembedded.org/mt/87539156/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000090930505d27cf2ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I just sent the proper fix to bitbake-devel :)</div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, 6 Dec 2021 at 17:41, Konrad Weihma=
nn &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It&#39=
;s of course *not* the file extension, but the .orig. that is <br>
confusing the default upstream regex check<br>
<br>
This here worked for me<br>
<br>
UPSTREAM_CHECK_REGEX =3D &quot;${BPN}_(?P&lt;pver&gt;\d+(\.\d+)+)\.orig\..*=
&quot;<br>
<br>
but surely it can be fine tuned<br>
<br>
On 06.12.21 17:30, Konrad Weihmann wrote:<br>
&gt; I think the answer is that latest release is a bz2, while the older on=
e <br>
&gt; are gzipped<br>
&gt; <br>
&gt; <a href=3D"http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.=
7.1.orig.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.debian.org=
/debian/pool/main/m/minicom/minicom_2.7.1.orig.tar.gz</a><br>
&gt; <br>
&gt; vs.<br>
&gt; <br>
&gt; <a href=3D"http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.=
8.orig.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://ftp.debian.org/=
debian/pool/main/m/minicom/minicom_2.8.orig.tar.bz2</a><br>
&gt; <br>
&gt; On 06.12.21 16:57, Alexander Kanavin wrote:<br>
&gt;&gt; This one is odd and it should be working. I&#39;ll cherry-pick you=
r update <br>
&gt;&gt; and get to the bottom of it. This may mean we are missing other <b=
r>
&gt;&gt; updates that are coming from debian tarballs.<br>
&gt;&gt;<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 6 Dec 2021 at 14:59, Richard Purdie <br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org" t=
arget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 On Mon, 2021-12-06 at 14:43 +0100, Alexander Ka=
navin wrote:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; Since AUH didn&#39;t pick this up, c=
an you run &#39;devtool<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 latest-version minicom&#39;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; with this update, as it probably wou=
ld report something that<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 needs fixing via<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &gt; regexp?<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 That shows:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 WARNING: latest_versionstring: package minicom_=
2.8.orig.tar.bz2<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 don&#39;t match pattern<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Cheers,<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Richard<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#159255): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/159255" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/159255</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87539156=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87539156/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--00000000000090930505d27cf2ae--

