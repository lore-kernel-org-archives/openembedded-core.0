Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B11C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:29:30 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.8714.1636626564166681209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f+srTBNk;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id az37so10780635uab.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cTBAHCrI+FzHSgF6Djqa7XP0Tmw4xR4SECKECm+zAZY=;
        b=f+srTBNkRCycIWAX0G+HpjdfibYA4COUuC0AJjGcMFKB1ZJtSC60NKi1AQdYSqKExa
         c4zQ0BslcKtAEDmJxx66nI57pDfNvL9hkWAnrtR0HxXsPyY1EUockqEX87sDw0kARxps
         izSg8R+JzhIICEMgT+QnxecKmZPCkjC+6AVAOu8vC48GPK1EyWvuMns+1JQVxMR5Ph0k
         5HtbuUuqUe5kgPYdt9O78+M9fJRo5UEWgmZReKaQyNHce3otWEcOI5w24Lh4c5V0rQt2
         zANel4AttcJ67qlK+HbQAtis3WU8/qBgLy6rGt1Idg2vCzHIILco6Yb/cIcq+6hqZIuC
         3f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTBAHCrI+FzHSgF6Djqa7XP0Tmw4xR4SECKECm+zAZY=;
        b=i3NR91n61pxlyVc4aM3UfsaQnY3IfLf5pXVGN1fCG0e3/BTNer5yqJCiRUalA8JgIk
         8CsdUwhp4yJus3jCc0Oj1xMy+kEb4U8DppiE3FshokSkyus5xdz7VHVUEIcOLL/6WDlz
         JkIPQNfpg5OIZ/BO4/nDP75BMXU48WsdyybaocJy7HA762kKyILmnjYxMVkTmedl50/W
         q/wgrLbBDSklc9kjCHq5OzX1KmK3p18nKMOjcjpX2ScRljbRjH8wzHVFKyXvA1dU2mY0
         kZ2jv5wb5QYed1RgorFqwWnlJxVspz+ClobdzpkGEesZ03yAADctQ9BqmlmIS5Ha4hvA
         BpiQ==
X-Gm-Message-State: AOAM533CIocAXz8LIA2yTBDB0f7QyQz5hNbhBPKlqIayyud9GGohZPcf
	M+kzpcaFGhRqkkJyq3mgP3y04YGF90bp/6C3YmhiyaMs
X-Google-Smtp-Source: 
 ABdhPJxAUQjydSwKVOUt/GfcmEe/LwQgfJPEKg3waii46qfGX2STmxA3K6PuT9ubv9SeBVsHCVUbZ8lCoyZw4QssfZQ=
X-Received: by 2002:a67:ca8f:: with SMTP id a15mr8848576vsl.18.1636626563194;
 Thu, 11 Nov 2021 02:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20211110193937.2606747-1-alex@linutronix.de>
 <20211110193937.2606747-4-alex@linutronix.de>
 <16B67702B21FC1CD.14836@lists.openembedded.org>
 <78932c364d7ab967ad0733ac5b5d0d95bf7af5ed.camel@linuxfoundation.org>
In-Reply-To: 
 <78932c364d7ab967ad0733ac5b5d0d95bf7af5ed.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Nov 2021 11:29:11 +0100
Message-ID: 
 <CANNYZj8JtC1yTeDDu=wFTvSaut3ar+Nxtw5Khj_okog04E4vYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/24] xserver-xorg: update 1.20.13 -> 21.1.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ede40c05d080d055"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 10:29:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158161

--000000000000ede40c05d080d055
Content-Type: text/plain; charset="UTF-8"

Patch already sent ;)

Alex

On Thu, 11 Nov 2021 at 11:27, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-11-11 at 10:26 +0000, Richard Purdie via
> lists.openembedded.org
> wrote:
> > On Wed, 2021-11-10 at 20:39 +0100, Alexander Kanavin wrote:
> > > libxcvt is a new dependency (thanks Oleksandr!).
> > >
> > > Include ${libdir}/xorg/modules/input/*.so into the main
> > > package (if for someone separate packaging matters, please
> > > investigate what they do).
> > >
> > > Remove options no longer present upstream.
> > >
> > > Remove patches available upstream; drop a chunk as well.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  .../xorg-xserver/xserver-xorg.inc             |  7 +--
> > >  ...-duplicate-definitions-of-IOPortBase.patch | 24 ++-------
> > >  ...probing-a-non-PCI-platform-device-on.patch | 34 -------------
> > >  ...t-xtest-Initialize-array-with-braces.patch | 36 -------------
> > >  .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------
> > >  .../xserver-xorg/sdksyms-no-build-path.patch  | 50 -------------------
> > >  ...xorg_1.20.13.bb => xserver-xorg_21.1.1.bb} |  6 +--
> > >  7 files changed, 7 insertions(+), 184 deletions(-)
> > >  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
> > >  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
> > >  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
> > >  delete mode 100644
> meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
> > >  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb
> => xserver-xorg_21.1.1.bb} (77%)
> > >
> >
> > I think there is some dependency issue:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4349
> >
> > but I'm wondering why this only showed up on this rebuild and not
> previously
> > too...
>
> Sorry, it did and the buildbot UI let me miss it, it also failed here:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4344
>
> Cheers,
>
> Richard
>
>
>

--000000000000ede40c05d080d055
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Patch already sent ;)</div><div><br></div><div>Alex<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, 11 Nov 2021 at 11:27, Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, 2021-11-11 at 10:26 +0000, Richard Purdie via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a><br>
wrote:<br>
&gt; On Wed, 2021-11-10 at 20:39 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; libxcvt is a new dependency (thanks Oleksandr!).<br>
&gt; &gt; <br>
&gt; &gt; Include ${libdir}/xorg/modules/input/*.so into the main<br>
&gt; &gt; package (if for someone separate packaging matters, please<br>
&gt; &gt; investigate what they do).<br>
&gt; &gt; <br>
&gt; &gt; Remove options no longer present upstream.<br>
&gt; &gt; <br>
&gt; &gt; Remove patches available upstream; drop a chunk as well.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linut=
ronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../xorg-xserver/xserver-xorg.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +--<br>
&gt; &gt;=C2=A0 ...-duplicate-definitions-of-IOPortBase.patch | 24 ++------=
-<br>
&gt; &gt;=C2=A0 ...probing-a-non-PCI-platform-device-on.patch | 34 --------=
-----<br>
&gt; &gt;=C2=A0 ...t-xtest-Initialize-array-with-braces.patch | 36 --------=
-----<br>
&gt; &gt;=C2=A0 .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 --------=
-----<br>
&gt; &gt;=C2=A0 .../xserver-xorg/sdksyms-no-build-path.patch=C2=A0 | 50 ---=
----------------<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://xorg_1.20.13.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">xorg_1.20.13.bb</a> =3D&gt; <a href=3D"http://xserver-xorg_=
21.1.1.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xorg_21.1.1.bb</a>}=
 |=C2=A0 6 +--<br>
&gt; &gt;=C2=A0 7 files changed, 7 insertions(+), 184 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserv=
er-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserv=
er-xorg/0001-test-xtest-Initialize-array-with-braces.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserv=
er-xorg/pkgconfig.patch<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserv=
er-xorg/sdksyms-no-build-path.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-graphics/xorg-xserver/{<a href=3D"http:=
//xserver-xorg_1.20.13.bb" rel=3D"noreferrer" target=3D"_blank">xserver-xor=
g_1.20.13.bb</a> =3D&gt; <a href=3D"http://xserver-xorg_21.1.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">xserver-xorg_21.1.1.bb</a>} (77%)<br>
&gt; &gt; <br>
&gt; <br>
&gt; I think there is some dependency issue:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/47/=
builds/4349" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/47/builds/4349</a><br>
&gt; <br>
&gt; but I&#39;m wondering why this only showed up on this rebuild and not =
previously<br>
&gt; too...<br>
<br>
Sorry, it did and the buildbot UI let me miss it, it also failed here:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/47/build=
s/4344" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/47/builds/4344</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000ede40c05d080d055--

