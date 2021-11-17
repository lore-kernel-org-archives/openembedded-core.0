Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AD4C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:07:52 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web12.8274.1637161658986361941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:07:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AZ97Y0cv;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 84so1833761vkc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zeX4/FcZclm/99fhnwMHrH6JlKqddQk1LiehZS7Gl6k=;
        b=AZ97Y0cvbBi/IPCG5W3TiX+KXV8656a/zK2Y4bg9zIWkExOFVsehw/bxwBB0kBIdlV
         laFGSN7WqTiYrTvBEHFKeT3g7YbYMWjhopNV+iPvGryiyUoVQNnUS02oXj3XOCcH2tD3
         ZMjMIAGSzRaumjXUtwRwjj8tD1Y5q15Xjw/YeCpn9ZEKgU0Mv1AJr0L9eU8eQ7BiZAVB
         /s1/4KxdHcBFo2Q6ccN8Lrf107yb13Zz8TlcByV6FL69OZwoYUGoRlUV2FIacBx80z9U
         cpcY7a3RE4SpIQFieQdzdWya1yDkBiK4pA+9AgstY8V+mZ4K3w2iwVcIwOnSqayI/9u2
         N/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeX4/FcZclm/99fhnwMHrH6JlKqddQk1LiehZS7Gl6k=;
        b=ew3/HvW9Shzk8o97Oel3yfkePEgZ5xsyXB+NPxwajBKOx0tNQ/1q4ao2VyUowBcz9/
         2ORNnynEkAEc0nqtXTgS+/cf0Tl1UYU5AC1mUC6f5acwlbhj+6pTFiRlSyzANY+hjPow
         xyPsML3RwG6dRQN5HUOH3RDHEJ7EYTciC8fF7WRdP4OlJ0+F9rDO6CqRrH8NOkGMOb6O
         C6av2dB1xogAvvKoZ56w1ZhUQt206pI5/dCi/mNXEEbWcDC8a1U3ewM88b1XtcabLGfo
         o0M64rd3f/YlVStnFjBDyYzADQ1DM60hy+v2vXs2/uBFtfMHtiqJcnliRio0AefzlGap
         n17g==
X-Gm-Message-State: AOAM530uF4ElndwB99Oe5ga9AcEPp1KuOArHotGC5aBN3KtOobgKKVsJ
	X5QEfGu1i+MNXP1iBqot19FpP1xWkHOFf4hK5+o=
X-Google-Smtp-Source: 
 ABdhPJy2gJUaQIXwXo/OFAqE3M4lAxuEVCMiG9kMPC2PS2QiKYuD6de5G8kyi6ST8CtgUWHB4KNSM1l6/HyAVMuzPuI=
X-Received: by 2002:a05:6122:1803:: with SMTP id
 ay3mr90748324vkb.24.1637161657865;
 Wed, 17 Nov 2021 07:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
 <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
In-Reply-To: <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 16:07:26 +0100
Message-ID: 
 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 paul.eggleton@microsoft.com
Content-Type: multipart/alternative; boundary="0000000000000e99b505d0fd67dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:07:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158395

--0000000000000e99b505d0fd67dc
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Nov 2021 at 15:59, Luca Boccassi <luca.boccassi@gmail.com> wrote:

> On Wed, 2021-11-17 at 13:53 +0100, Alexander Kanavin wrote:
> > Shouldn't this be enabled in regular yocto builds first, e.g. allow
> > systemd-native and then add the needed checks to systemd.bbclass?
> > Maybe nativesdk support isn't then needed at all?
> >
> > Alex
>
> I'm not sure I follow, that would break the build? These changes are
> necessary to make it work. I am including the package in the local sdk
> configuration, without these patches it does not build.
>

What I'm trying to say is running those systemd analyzers should be enabled
in regular yocto builds first before it's enabled in SDKs. It's not a good
idea to have a feature that is available in SDKs but not available in
direct use of bitbake to build recipes.

Alex



>
> > On Wed, 17 Nov 2021 at 13:32, Luca Bocassi <luca.boccassi@gmail.com>
> > wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > >
> > > systemd-analyze in the next release will gain the ability to
> > > run the 'security' and 'verify' verbs offline, on local units.
> > > This is very useful at build time and/or in CI systems to detect
> > > errors and issues before changes are deployed, as a static
> > > analyzer tool.
> > > This series enables building the systemd recipe for the nativesdk
> > > targets, so that systemd-analyze can be included in the SDK and
> > > called by users/build systems/CI systems.
> > >
> > > Luca Boccassi (8):
> > >   systemd: skip chown when building for nativesdk
> > >   systemd: skip postinst in nativesdk builds
> > >   systemd: remove /var in nativesdk builds
> > >   volatile-binds: remove /var in nativesdk builds
> > >   volatile-binds: add nativesdk
> > >   kbd: add nativesdk
> > >   os-release: add nativesdk
> > >   systemd: add nativesdk
> > >
> > >  meta/recipes-core/kbd/kbd_2.4.0.bb            |  2 +-
> > >  meta/recipes-core/os-release/os-release.bb    |  2 ++
> > >  meta/recipes-core/systemd/systemd-conf_1.0.bb |  2 ++
> > >  .../systemd/systemd-serialgetty.bb            |  2 ++
> > >  meta/recipes-core/systemd/systemd_249.5.bb    | 29
> > > +++++++++++++++++--
> > >  .../volatile-binds/volatile-binds.bb          |  7 +++++
> > >  6 files changed, 41 insertions(+), 3 deletions(-)
> > >
>
>

--0000000000000e99b505d0fd67dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Nov 2021 at 15:59, Luca Bo=
ccassi &lt;<a href=3D"mailto:luca.boccassi@gmail.com">luca.boccassi@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Wed, 2021-11-17 at 13:53 +0100, Alexander Kanavin wrote:<br>
&gt; Shouldn&#39;t this be enabled in regular yocto builds first, e.g. allo=
w<br>
&gt; systemd-native and then add the needed checks to systemd.bbclass?<br>
&gt; Maybe nativesdk support isn&#39;t then needed at all?<br>
&gt; <br>
&gt; Alex<br>
<br>
I&#39;m not sure I follow, that would break the build? These changes are<br=
>
necessary to make it work. I am including the package in the local sdk<br>
configuration, without these patches it does not build.<br></blockquote><di=
v><br></div><div>What I&#39;m trying to say is running those systemd analyz=
ers should be enabled in regular yocto builds first before it&#39;s enabled=
 in SDKs. It&#39;s not a good idea to have a feature that is available in S=
DKs but not available in direct use of bitbake to build recipes.</div><div>=
<br></div><div>Alex<br></div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; On Wed, 17 Nov 2021 at 13:32, Luca Bocassi &lt;<a href=3D"mailto:luca.=
boccassi@gmail.com" target=3D"_blank">luca.boccassi@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; From: Luca Boccassi &lt;<a href=3D"mailto:luca.boccassi@microsoft=
.com" target=3D"_blank">luca.boccassi@microsoft.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; systemd-analyze in the next release will gain the ability to<br>
&gt; &gt; run the &#39;security&#39; and &#39;verify&#39; verbs offline, on=
 local units.<br>
&gt; &gt; This is very useful at build time and/or in CI systems to detect<=
br>
&gt; &gt; errors and issues before changes are deployed, as a static<br>
&gt; &gt; analyzer tool.<br>
&gt; &gt; This series enables building the systemd recipe for the nativesdk=
<br>
&gt; &gt; targets, so that systemd-analyze can be included in the SDK and<b=
r>
&gt; &gt; called by users/build systems/CI systems.<br>
&gt; &gt; <br>
&gt; &gt; Luca Boccassi (8):<br>
&gt; &gt; =C2=A0 systemd: skip chown when building for nativesdk<br>
&gt; &gt; =C2=A0 systemd: skip postinst in nativesdk builds<br>
&gt; &gt; =C2=A0 systemd: remove /var in nativesdk builds<br>
&gt; &gt; =C2=A0 volatile-binds: remove /var in nativesdk builds<br>
&gt; &gt; =C2=A0 volatile-binds: add nativesdk<br>
&gt; &gt; =C2=A0 kbd: add nativesdk<br>
&gt; &gt; =C2=A0 os-release: add nativesdk<br>
&gt; &gt; =C2=A0 systemd: add nativesdk<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0meta/recipes-core/kbd/<a href=3D"http://kbd_2.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">kbd_2.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt; =C2=A0meta/recipes-core/os-release/<a href=3D"http://os-release.b=
b" rel=3D"noreferrer" target=3D"_blank">os-release.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 2 ++<br>
&gt; &gt; =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd-conf_1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">systemd-conf_1.0.bb</a> |=C2=A0 =
2 ++<br>
&gt; &gt; =C2=A0.../systemd/<a href=3D"http://systemd-serialgetty.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd-serialgetty.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt; &gt; =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a>=C2=A0 =C2=A0 |=
 29<br>
&gt; &gt; +++++++++++++++++--<br>
&gt; &gt; =C2=A0.../volatile-binds/<a href=3D"http://volatile-binds.bb" rel=
=3D"noreferrer" target=3D"_blank">volatile-binds.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 7 +++++<br>
&gt; &gt; =C2=A06 files changed, 41 insertions(+), 3 deletions(-)<br>
&gt; &gt; <br>
<br>
</blockquote></div></div>

--0000000000000e99b505d0fd67dc--

