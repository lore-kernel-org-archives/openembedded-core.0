Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD26C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 16:26:22 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.361.1643819181796050022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 08:26:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JPnUOM/f;
 spf=pass (domain: gmail.com, ip: 209.85.210.47,
 mailfrom: krussell7711@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id
 b12-20020a9d754c000000b0059eb935359eso19964599otl.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 08:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0PomnhQNz4vmxxya0rp9POFTHTZv6oMh0+wIgiDqmkI=;
        b=JPnUOM/fQo9GPOR0OfgtslicasKkBPpEhXFSG2FFBa4msILBmDFI9lx3TsrS2ImVoV
         IKaCjB1atL5TkLsT5Y5mgdIOMy6aycfdeY0M2/PMw4v+q6QOuUDusaSP6LZYkIdy/MNr
         5b3aJ15P5UOalN3ECDZfT4tnMwTZh/TUs64h9jdKLJs+HTxBT8TVI208rPHjssuNceCU
         GtWBZXuCN3qIfJBVxxv3ldAZ02/KwZTt7p2HRKdB0VKCQuh/kvM6KLCEkZJIHOa2doru
         Rb541oMW0B37lLuWnhoW2yEDMnymrEY+27e+PZevALp6pUUL6MLAx+m5tDoZl9HGVYUZ
         KwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0PomnhQNz4vmxxya0rp9POFTHTZv6oMh0+wIgiDqmkI=;
        b=xmoRp1RI8d3aCypQfF+1qhk7pCDNeybA0y9+f+swmt57Dpr1PJ1h0vWLTeoHgDmAyV
         1K0fca7QEuqVVewpEctNzZNAN1OqpjKDYmv1LBdjeUk6LOdhRlIVpmboTZPoIVRNwwVJ
         n0QdZxCaBRzXinHTcRGZMBCq0Ec9R0ZlKgahBnOWHdd+MrtS1Frw2EDbcn88lPhGYi+A
         m81dz5EsR8OH56rH/NPE06r+2kYd85A2OqGDere8U3tQtnrBquxqWVwqU/4knR1nK4cL
         mppA7jQdNjAmom/8QlJJM3Jh96kPFLlp/5bWsdzCcHUSzAIeSKWL2qSwb1EVr6UvRnoB
         OuzA==
X-Gm-Message-State: AOAM533sTOt3nIlTXrVayCasldgZol3HTZ2kb4yD0zKQ5S4Zivh3sdQu
	P0/YoMD4e8AvfhWGNYJheMdcdrA9H9oXIRqPPp8=
X-Google-Smtp-Source: 
 ABdhPJzM/mApoYmryA4q3NJOg1Wmb6lOa/v01a/Go2b9tl993Cl+P7Vt062RXyoOqRAglFXCO1TEzwyHkjLH68GezNY=
X-Received: by 2002:a9d:67d0:: with SMTP id
 c16mr16966375otn.270.1643819180979;
 Wed, 02 Feb 2022 08:26:20 -0800 (PST)
MIME-Version: 1.0
References: <20210917080804.2545478-1-ch@denx.de>
 <CAFrQVPNNvMxNDgP7GkSQitP6_4D5u1wDvzZRcJKd195Byo4u2Q@mail.gmail.com>
 <fa9e9247-c4f0-8896-bf54-95a03eff2105@denx.de>
In-Reply-To: <fa9e9247-c4f0-8896-bf54-95a03eff2105@denx.de>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 2 Feb 2022 11:26:09 -0500
Message-ID: 
 <CAFrQVPNiHZ8MEv0uaHUpi4J=Erefa1GLzGYh_af19X6A-gxg4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: add systemd-udev-settle wants to
 service
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Alex Kiernan <alex.kiernan@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	Alban Bedel <alban.bedel@aerq.com>, Wes Lindauer <wesley.lindauer@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005b7b8a05d70b7a40"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 16:26:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161220

--0000000000005b7b8a05d70b7a40
Content-Type: text/plain; charset="UTF-8"

Thanks, Claudius.

On Wed, Feb 2, 2022 at 8:08 AM Claudius Heine <ch@denx.de> wrote:

> Hi Kyle,
>
> On 2022-02-02 13:38, Kyle Russell wrote:
> > Is this the correct approach?  Even the systemd-udev-settle.service man
> > pages recommends not using its service.  Were the kernel modules really
> > not loaded when rngd started?  Or is the original problem just a matter
> > of waiting for sufficient entropy?
>
> IIRC, the rngd could not find any random source device node (/dev/hwrng
> in that case), so the service failed to start.
>

If /dev/hwrng didn't exist, this feels like the original problem was a
misconfigured
kernel or module that wasn't being loaded properly.


> The patch you are commenting on only adds `Wants` weak dependency to
> make sure `systemd-udev-settle.service` is pulled in to the job queue,
> the `After` ordering rule was already there.
>

Correct.  Just because an `After` exists does not mean the service gets
pulled into
the job queue, so prior to this change no other service was causing the
deprecated
systemd-udev-settle.service to be run during boot.  But now, every device
including
openssh (which has a default PACKAGECONFIG option for rng-tools) now depends
on this deprecated service, which may cause unexpected boot delays.


> So changing this service file to be triggered by a udev event or maybe
> wrap it in a script, which makes sure the right modules are loaded and
> device nodes are available, could be an improvement, but it would be out
> of scope of this patch IMO.
>

I'm more curious whether this change should be reverted from upstream.  It
seems
like a drop-in file could have been applied to your distro instead of
adding a dependency
on a deprecated service for all openssh users.

Kyle


> >
> > On Fri, Sep 17, 2021 at 4:08 AM Claudius Heine <ch@denx.de
> > <mailto:ch@denx.de>> wrote:
> >
> >     rngd needs to start after `systemd-udev-settle` in order for the
> kernel
> >     modules of the random source hardware to be loaded before it is
> started.
> >
> >     However, since the `rngd.service` does not require or want
> >     `systemd-udev-settle.service` it might not be scheduled for start and
> >     the `After=systemd-udev-settle.service` there has no effect.
> >
> >     Adding `Wants=systemd-udev-settle.service` provides a weak
> requirement
> >     to it, so that the `rngd` is started after it, if possible.
> >
> >     Signed-off-by: Claudius Heine <ch@denx.de <mailto:ch@denx.de>>
> >     ---
> >
> >     Hi,
> >
> >     this is a fix, which should probably be backported to the maintained
> >     releases.
> >
> >     regards,
> >     Claudius
> >
> >       meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +
> >       1 file changed, 1 insertion(+)
> >
> >     diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >     b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >     index 0559b97991..568686e80e 100644
> >     --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >     +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> >     @@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
> >       DefaultDependencies=no
> >       After=systemd-udev-settle.service
> >       Before=sysinit.target shutdown.target
> >     +Wants=systemd-udev-settle.service
> >       Conflicts=shutdown.target
> >
> >       [Service]
> >     --
> >     2.33.0
> >
> >
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#156129):
> >     https://lists.openembedded.org/g/openembedded-core/message/156129
> >     <https://lists.openembedded.org/g/openembedded-core/message/156129>
> >     Mute This Topic: https://lists.openembedded.org/mt/85671578/4454381
> >     <https://lists.openembedded.org/mt/85671578/4454381>
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <https://lists.openembedded.org/g/openembedded-core/unsub>
> >     [bkylerussell@gmail.com <mailto:bkylerussell@gmail.com>]
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000005b7b8a05d70b7a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks, Claudius.<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 2, 2022 =
at 8:08 AM Claudius Heine &lt;<a href=3D"mailto:ch@denx.de">ch@denx.de</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Ky=
le,<br>
<br>
On 2022-02-02 13:38, Kyle Russell wrote:<br>
&gt; Is this the correct approach?=C2=A0 Even the systemd-udev-settle.servi=
ce man <br>
&gt; pages recommends not using its service.=C2=A0 Were the kernel modules =
really <br>
&gt; not loaded when rngd started?=C2=A0 Or is the original problem just a =
matter <br>
&gt; of waiting for sufficient entropy?<br>
<br>
IIRC, the rngd could not find any random source device node (/dev/hwrng <br=
>
in that case), so the service failed to start.<br></blockquote><div><br></d=
iv><div>If /dev/hwrng didn&#39;t exist, this feels like the original proble=
m was a misconfigured</div><div>kernel or module that wasn&#39;t being load=
ed properly.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
The patch you are commenting on only adds `Wants` weak dependency to <br>
make sure `systemd-udev-settle.service` is pulled in to the job queue, <br>
the `After` ordering rule was already there.<br></blockquote><div><br></div=
><div>Correct.=C2=A0 Just because an `After` exists does not mean the servi=
ce gets pulled into</div><div>the job queue, so prior to this change no oth=
er service was causing the deprecated</div><div>systemd-udev-settle.service=
 to be run during boot.=C2=A0 But now, every device including</div><div>ope=
nssh (which has a default PACKAGECONFIG option for rng-tools) now depends</=
div><div>on this deprecated service, which may cause unexpected boot delays=
.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
So changing this service file to be triggered by a udev event or maybe <br>
wrap it in a script, which makes sure the right modules are loaded and <br>
device nodes are available, could be an improvement, but it would be out <b=
r>
of scope of this patch IMO.<br></blockquote><div><br></div><div>I&#39;m mor=
e curious whether this change should be reverted from upstream.=C2=A0 It se=
ems</div><div>like a drop-in file could have been applied to your distro in=
stead of adding a dependency</div><div>on a deprecated service for all open=
ssh users.<br></div><div><br></div><div>Kyle<br></div><div>=C2=A0<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; On Fri, Sep 17, 2021 at 4:08 AM Claudius Heine &lt;<a href=3D"mailto:c=
h@denx.de" target=3D"_blank">ch@denx.de</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ch@denx.de" target=3D"_blank">ch@denx.de<=
/a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0rngd needs to start after `systemd-udev-settle` in =
order for the kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0modules of the random source hardware to be loaded =
before it is started.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0However, since the `rngd.service` does not require =
or want<br>
&gt;=C2=A0 =C2=A0 =C2=A0`systemd-udev-settle.service` it might not be sched=
uled for start and<br>
&gt;=C2=A0 =C2=A0 =C2=A0the `After=3Dsystemd-udev-settle.service` there has=
 no effect.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Adding `Wants=3Dsystemd-udev-settle.service` provid=
es a weak requirement<br>
&gt;=C2=A0 =C2=A0 =C2=A0to it, so that the `rngd` is started after it, if p=
ossible.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Claudius Heine &lt;<a href=3D"mailto=
:ch@denx.de" target=3D"_blank">ch@denx.de</a> &lt;mailto:<a href=3D"mailto:=
ch@denx.de" target=3D"_blank">ch@denx.de</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0this is a fix, which should probably be backported =
to the maintained<br>
&gt;=C2=A0 =C2=A0 =C2=A0releases.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Claudius<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-support/rng-tools/rng-tools/rng=
d.service | 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-support/rng-tools/rng-too=
ls/rngd.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-support/rng-tools/rng-tools/rngd.ser=
vice<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0559b97991..568686e80e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-support/rng-tools/rng-tools/rngd=
.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-support/rng-tools/rng-tools/rngd=
.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -3,6 +3,7 @@ Description=3DHardware RNG Entropy =
Gatherer Daemon<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DefaultDependencies=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0After=3Dsystemd-udev-settle.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Before=3Dsysinit.target shutdown.target<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Wants=3Dsystemd-udev-settle.service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Conflicts=3Dshutdown.target<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[Service]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.33.0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#156129):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/156129" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/156129</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/156129" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/message/156129</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/85671578/4454381" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/mt/85671578/4454381</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/85=
671578/4454381" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/85671578/4454381</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-core/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bkylerussell@gmail.com" target=
=3D"_blank">bkylerussell@gmail.com</a> &lt;mailto:<a href=3D"mailto:bkyleru=
ssell@gmail.com" target=3D"_blank">bkylerussell@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000005b7b8a05d70b7a40--

