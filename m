Return-Path: <bkylerussell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83A0C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 12:38:58 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web09.63531.1643805538151970791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 04:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KG929vaM;
 spf=pass (domain: gmail.com, ip: 209.85.167.178,
 mailfrom: krussell7711@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id t199so22762317oie.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 04:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QPolDJSkbpTYECRBnC/o9icBWt8/3izSbj+3Y6HiDBI=;
        b=KG929vaM1Th+jHlsBf0PUt1iGE99+7U1q/lFAsrVkbFZfL/C36t8fXhPIs0AW6pcF6
         OW/j3RrjuLCxMZhber6kPab/0CkhdGa3BwLhvDdSLS5tZ5K3d83b48P1SbyQ5PoxckE1
         TVqMciWA9gJqsIKLUd2imJAMr1wEVPDsvwEGWoBPIjIcjhsCuS3d96NU03Yrx0v/HX6o
         yrDksFEMxTnWgWIO+UCrzQSnRMF8gXhEqY1j+2yLJHIu8x3ECtkwKd33u+4CDGrPyckw
         os7S0IfZ6otcMfWvbP9pEsWE5xtyofCk5vC890F34lZkt20Y88xv9zpP0uksXvuxa+Cy
         kEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPolDJSkbpTYECRBnC/o9icBWt8/3izSbj+3Y6HiDBI=;
        b=iwCNzgpMp+jCTdlw0WXZll+Qz7Dy9LSg8LcxhThodNMvO205QmUsas9Z1tN2oAnaQK
         nsQO/ABdWnYMBSTzkVXFgIyzPWEt+sliXZ/l1JR5g1DWt5PRwe3Oqna5GVn0xSX8u1jF
         9FVGUfAtzhZfOGBxuxwbChh9NRzp64UKfVNdCzlxGEo11gIwzSv8dSAoZcqzE4ljJl/b
         M9rf8BdLsoMkADgZYjzeStHHCtVAXhDsaQCu0vq385S299U5UMiO/0vKjkfQ4GWYc6Y+
         gRGN5yKEeu5QF2cQ6VWtsKC2Ygy+cRRH3uaFKO0BJ6eTkuQJw5bdx88dWmTnrD6bzhFV
         ubYQ==
X-Gm-Message-State: AOAM5303Fc5Gllz+T0iksUXbjt/frOPLAvBuQt/L7sSU5zFR1L1j2b+e
	T7xmmAA7K9ZJc8vpzrQzaSn3t1lOdYQYgG2K3v0=
X-Google-Smtp-Source: 
 ABdhPJxW5lB9Y7OoOquB9gL7Qh2V/08s4p04c+3sO9D/k1Ywna4esU2zY7HPGGy0ww8Qsn86BfiK4vhrXRgJAVrJqVA=
X-Received: by 2002:a54:4583:: with SMTP id z3mr4372507oib.103.1643805537293;
 Wed, 02 Feb 2022 04:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20210917080804.2545478-1-ch@denx.de>
In-Reply-To: <20210917080804.2545478-1-ch@denx.de>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 2 Feb 2022 07:38:46 -0500
Message-ID: 
 <CAFrQVPNNvMxNDgP7GkSQitP6_4D5u1wDvzZRcJKd195Byo4u2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: add systemd-udev-settle wants to
 service
To: Claudius Heine <ch@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>,
	Alex Kiernan <alex.kiernan@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	Alban Bedel <alban.bedel@aerq.com>, Wes Lindauer <wesley.lindauer@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002159d405d7084d1c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 12:38:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161193

--0000000000002159d405d7084d1c
Content-Type: text/plain; charset="UTF-8"

Is this the correct approach?  Even the systemd-udev-settle.service man
pages recommends not using its service.  Were the kernel modules really not
loaded when rngd started?  Or is the original problem just a matter of
waiting for sufficient entropy?

On Fri, Sep 17, 2021 at 4:08 AM Claudius Heine <ch@denx.de> wrote:

> rngd needs to start after `systemd-udev-settle` in order for the kernel
> modules of the random source hardware to be loaded before it is started.
>
> However, since the `rngd.service` does not require or want
> `systemd-udev-settle.service` it might not be scheduled for start and
> the `After=systemd-udev-settle.service` there has no effect.
>
> Adding `Wants=systemd-udev-settle.service` provides a weak requirement
> to it, so that the `rngd` is started after it, if possible.
>
> Signed-off-by: Claudius Heine <ch@denx.de>
> ---
>
> Hi,
>
> this is a fix, which should probably be backported to the maintained
> releases.
>
> regards,
> Claudius
>
>  meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> index 0559b97991..568686e80e 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -3,6 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
>  DefaultDependencies=no
>  After=systemd-udev-settle.service
>  Before=sysinit.target shutdown.target
> +Wants=systemd-udev-settle.service
>  Conflicts=shutdown.target
>
>  [Service]
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156129):
> https://lists.openembedded.org/g/openembedded-core/message/156129
> Mute This Topic: https://lists.openembedded.org/mt/85671578/4454381
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bkylerussell@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002159d405d7084d1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this the correct approach?=C2=A0 Even the systemd-udev-=
settle.service man pages recommends not using its service.=C2=A0 Were the k=
ernel modules really not loaded when rngd started?=C2=A0 Or is the original=
 problem just a matter of waiting for sufficient entropy?</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 20=
21 at 4:08 AM Claudius Heine &lt;<a href=3D"mailto:ch@denx.de">ch@denx.de</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">rn=
gd needs to start after `systemd-udev-settle` in order for the kernel<br>
modules of the random source hardware to be loaded before it is started.<br=
>
<br>
However, since the `rngd.service` does not require or want<br>
`systemd-udev-settle.service` it might not be scheduled for start and<br>
the `After=3Dsystemd-udev-settle.service` there has no effect.<br>
<br>
Adding `Wants=3Dsystemd-udev-settle.service` provides a weak requirement<br=
>
to it, so that the `rngd` is started after it, if possible.<br>
<br>
Signed-off-by: Claudius Heine &lt;<a href=3D"mailto:ch@denx.de" target=3D"_=
blank">ch@denx.de</a>&gt;<br>
---<br>
<br>
Hi,<br>
<br>
this is a fix, which should probably be backported to the maintained releas=
es.<br>
<br>
regards,<br>
Claudius<br>
<br>
=C2=A0meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/r=
ecipes-support/rng-tools/rng-tools/rngd.service<br>
index 0559b97991..568686e80e 100644<br>
--- a/meta/recipes-support/rng-tools/rng-tools/rngd.service<br>
+++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service<br>
@@ -3,6 +3,7 @@ Description=3DHardware RNG Entropy Gatherer Daemon<br>
=C2=A0DefaultDependencies=3Dno<br>
=C2=A0After=3Dsystemd-udev-settle.service<br>
=C2=A0Before=3Dsysinit.target shutdown.target<br>
+Wants=3Dsystemd-udev-settle.service<br>
=C2=A0Conflicts=3Dshutdown.target<br>
<br>
=C2=A0[Service]<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156129): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156129" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156129</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85671578/4454=
381" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85671578/4454381</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bkylerussell@gmail.com" ta=
rget=3D"_blank">bkylerussell@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002159d405d7084d1c--

