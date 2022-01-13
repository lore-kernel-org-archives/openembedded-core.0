Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E23EC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 00:14:48 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.2055.1642032887584909139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 16:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EuxxFFZd;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id g21so4955679qtk.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 16:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gAMekuvPxXMSXOfo6ZHf/EGCqs6JpKpN4QhWK2XVjHA=;
        b=EuxxFFZdpStOM+jPBIO/rumjRSWS4kFWcGLrAro/QWzlrF1JjcPDA+8i1J8Lwa6WGp
         7OU5Fr+D7oeFWYvIwl0gzZ6X8/qYEiJLBUWSBps7zqFS3+kYs1HAftbvxHnMKBeUm8yn
         iXKFyLC7b8gGJenfMMjr/X3HbPQBpdR1WA2cUFEVHcVP3gOJP32gx5lXRJL9n4aGGO4T
         zcUHwgeFnF07UFqt+sajjcFZ+S4H7goKALCURPBF05dTPe4T+iSkI0qmCSK+OUXp0ACa
         UxZcCBp5QK2PnCVODW3IScvsaQpF9CkJf8AjrL1yLU4TAQJ8exDGYcmUb0rvJQ+fvsWG
         8moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gAMekuvPxXMSXOfo6ZHf/EGCqs6JpKpN4QhWK2XVjHA=;
        b=5zfYXerx1qrwQJo3Hibglo4lz6+JEL6+H4xKk7eOquyhwK57iWLih+iq98S9GTpwc/
         mol1I6L8H9ZJ7sWL1eYDILUd4a4iV6/hpf3M0Z0XcTrgFRLTGEFcOG/CoXctEEQGanGg
         bUvMeZKVDdaSgltaWfkFnASpMQvtpXnKTHkNqbail1sUkNo9Ns1TJYwMiNq0eVSnyQQb
         qKqWqGFDg0pAwDiuWLUghZ6cKItQzfXTmFz716GIhZR9Skw/6uGpw+MaeZJP7uHudOIV
         EaMPsDskVuWWez0ES/2uiPEnYMnhVualJH7BZxYOHDx+MbtVxe2dPDg1zcQkC8YRo9Q5
         /bZA==
X-Gm-Message-State: AOAM530OHisBbKkASKvhkGJHbTutqzBtjhnRPDw2VALa6UABwtG0MavJ
	QP7WYgZsoteyqZ3vowwebKvU2Io9O6v8yRl2Ayw=
X-Google-Smtp-Source: 
 ABdhPJxWLc2pQ3c3CK9isBX0yI04Fftyb9FFiO5PGfLzib7qSy/omQW6uKXUwUI9aHlpNGKSPQ8m8xGHSHY3tUP3K+8=
X-Received: by 2002:ac8:134c:: with SMTP id f12mr1746504qtj.229.1642032886653;
 Wed, 12 Jan 2022 16:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20220112090708.1597301-1-kexin.hao@windriver.com>
 <CAPoiz9wdB1z_mC5Td6RpN63ED_7Mm+7vBmDQtf=XoRmYLwCrVA@mail.gmail.com>
 <bc571d45ac0dc66bb9a3409b1215815ca369283f.camel@linuxfoundation.org>
In-Reply-To: 
 <bc571d45ac0dc66bb9a3409b1215815ca369283f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Jan 2022 16:14:36 -0800
Message-ID: 
 <CAMKF1soTS_EkdEf4ZzHd_QJjcs=161+L=Vq+btm4A4EYKpcXDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa72: Enable the crc extension by
 default for cortexa72
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jon Mason <jdmason@kudzu.us>, Kevin Hao <kexin.hao@windriver.com>,
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eb27d005d56b92a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 00:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160502

--000000000000eb27d005d56b92a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 1:58 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2022-01-12 at 14:23 -0500, Jon Mason wrote:
> > On Wed, Jan 12, 2022 at 4:11 AM Kevin Hao <kexin.hao@windriver.com>
> wrote:
> > >
> > > The crc extension is optional for the ARMv8.0 but is mandatory for th=
e
> > > cortexa72, so there is no reason not to enable it for the cortexa72
> > > tune. With this change, the cortexa72-crc seems redundant. But we
> > > had better to keep it to be compatible with the BSP which already use=
d
> > > that tune.
> > >
> > > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> >
> > Acked-by: Jon Mason <jdmason@kudzu.us>
> >
> > From the GCC sources, it's hard coded for A34, A35, A53, A57, A72,
> > A73, and almost all of the others listed.  I can patch the rest.
>
> I did wonder if we should just drop the duplicate tune too. It will cause
> an
> error but it is an error that should be quickly/easily fixed...


I am good with that problem is only for bsp layers which support multiple
releases with a single branch but I guess that=E2=80=99s something less of =
a
concern for me

>
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160501):
> https://lists.openembedded.org/g/openembedded-core/message/160501
> Mute This Topic: https://lists.openembedded.org/mt/88369540/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eb27d005d56b92a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 12, 2022 at 1:58 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2022-=
01-12 at 14:23 -0500, Jon Mason wrote:<br>
&gt; On Wed, Jan 12, 2022 at 4:11 AM Kevin Hao &lt;<a href=3D"mailto:kexin.=
hao@windriver.com" target=3D"_blank">kexin.hao@windriver.com</a>&gt; wrote:=
<br>
&gt; &gt; <br>
&gt; &gt; The crc extension is optional for the ARMv8.0 but is mandatory fo=
r the<br>
&gt; &gt; cortexa72, so there is no reason not to enable it for the cortexa=
72<br>
&gt; &gt; tune. With this change, the cortexa72-crc seems redundant. But we=
<br>
&gt; &gt; had better to keep it to be compatible with the BSP which already=
 used<br>
&gt; &gt; that tune.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Kevin Hao &lt;<a href=3D"mailto:kexin.hao@windrive=
r.com" target=3D"_blank">kexin.hao@windriver.com</a>&gt;<br>
&gt; <br>
&gt; Acked-by: Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us" target=3D"=
_blank">jdmason@kudzu.us</a>&gt;<br>
&gt; <br>
&gt; From the GCC sources, it&#39;s hard coded for A34, A35, A53, A57, A72,=
<br>
&gt; A73, and almost all of the others listed.=C2=A0 I can patch the rest.<=
br>
<br>
I did wonder if we should just drop the duplicate tune too. It will cause a=
n<br>
error but it is an error that should be quickly/easily fixed...</blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">I am good with that problem =
is only for bsp layers which support multiple releases with a single branch=
 but I guess that=E2=80=99s something less of a concern for me=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160501): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160501" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160501</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88369540/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88369540/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000eb27d005d56b92a3--

