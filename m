Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367CFC43217
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:13:37 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.53783.1638807215992563631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7QthPs4;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id a24so10315288qvb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KjFbU6QSFfheAzDcAxhgotpYIo/F4kUJl1SEMvhVuQU=;
        b=e7QthPs4erN/ujhosmlF1hZ9z+zsSMGxrCQ4GS1+11Lcn4UQuSa+xJkP89qBMcmRho
         7P57qdwkssjLcRnpSyOc5hT+3fks+PWaHOL4KqUO6PXBZF1yQNYpQTxQcQ0a2goNiOM7
         nQfSwywVjJ2QJc5P99Nog6z9KTdssN6u+eMDoQ2NQ8ugXupGkRG1VfzzcBceSOtPwUGc
         P+TQ2dCToxCJpIflsY2HAtSGjsxwL43bi3jrR/qq+OnubtmfSnN5sDV1+/56CAmN58An
         prH4F3h23M5H5nwIf+81YlRoRoSS+OLqP8RavOqmPVwm1atfN0GTM8bu9ulZH7fMhCce
         lYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KjFbU6QSFfheAzDcAxhgotpYIo/F4kUJl1SEMvhVuQU=;
        b=CdFpbLDDgl0AEl2pAKq3+dhcmINoPWZsvLcjMBMAaSHe/uG9jSYwxKt1KP2oc+DFV9
         K1dNBhAcdPygfGTa+QNYTtaJOKo2pmfr58UWQdMSp/T1lBuyj+sQt56olC0UohOf29mA
         QS/c9VlXwF43V8epxYyruUouI1IorojJuqAC2jXoJWrGi8D1llx1YXPX7WU8IcR+hiZ6
         ujrrfG+vjcGFTRNWcNQMN+ddGXFVGM0qzYBBSQ5elSFvQlFiaKlTTjdhC889ViSF5zI0
         +P5sCEnxwC8wjX8usEmwOaiXLdlyZrAnJK6OVaqMhj8aOz/b8OcvYSPu5tfpG4DUvV2C
         /Pyg==
X-Gm-Message-State: AOAM533Ejwvi76J1+6zcysR22oUzxrZG4ihaP/gozbm7Cc9JQObvOzqJ
	SkthMi26g1Ja0J1SbIi0AxK/yTF3yak3LMqUenA=
X-Google-Smtp-Source: 
 ABdhPJzWnKQQhRFgrzOu781aLiGNGYkslx8dJSmAuY/iDF/la9+OiO1NsYpXJay3f4ntj6+AFa7dxE6K2MnUti5ZODc=
X-Received: by 2002:a05:6214:c28:: with SMTP id
 a8mr39146916qvd.24.1638807215110;
 Mon, 06 Dec 2021 08:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-5-alex@linutronix.de>
 <b5d775737830c3ca7864bf650eac4b5ac2cbe19a.camel@linuxfoundation.org>
In-Reply-To: 
 <b5d775737830c3ca7864bf650eac4b5ac2cbe19a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Dec 2021 08:13:24 -0800
Message-ID: 
 <CAMKF1sq9wA5knwViKTFqEo6-YY1jm0fKgQ0JyWRRS7-=jYtw=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/26] python3: drop unneeded multiprocessing
 module patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e97ed605d27c89a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 16:13:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159253

--000000000000e97ed605d27c89a8
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 6, 2021 at 3:07 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2021-12-04 at 08:13 +0100, Alexander Kanavin wrote:
> > I ran the reproducing sequence on qemux86, and it went fine:
> >
> > root@qemux86:~# python3
> > Python 3.10.0 (default, Oct  4 2021, 17:55:55) [GCC 11.2.0] on linux
> > Type "help", "copyright", "credits" or "license" for more information.
> > > > > import multiprocessing
> > > > > pool_sema = multiprocessing.BoundedSemaphore(value=1)
> > > > > pool_sema.acquire()
> > True
> > > > > pool_sema.release()
> > > > >
> >
> > Additionally AB testing revealed no issues, and the description isn't
> entirely
> > clear about where and how the problem occurs, so I can't submit it
> upsream
> > without having that understanding and how to demonstrate the problem.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >
>
> There is a slightly different explanation here. libpthread was merged into
> libc
> so this fix becomes a null-op on glibc. Not sure if musl has a separate
> pthread
> but if so we could/should test that?


Musl has always been a single shared object from day one infact glibc is
now moving in that direction so it will work fine on musl

>
>
> Cheers,
>
> Richard
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159219):
> https://lists.openembedded.org/g/openembedded-core/message/159219
> Mute This Topic: https://lists.openembedded.org/mt/87494766/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e97ed605d27c89a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 6, 2021 at 3:07 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat, 2021-=
12-04 at 08:13 +0100, Alexander Kanavin wrote:<br>
&gt; I ran the reproducing sequence on qemux86, and it went fine:<br>
&gt; <br>
&gt; root@qemux86:~# python3<br>
&gt; Python 3.10.0 (default, Oct=C2=A0 4 2021, 17:55:55) [GCC 11.2.0] on li=
nux<br>
&gt; Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &=
quot;license&quot; for more information.<br>
&gt; &gt; &gt; &gt; import multiprocessing<br>
&gt; &gt; &gt; &gt; pool_sema =3D multiprocessing.BoundedSemaphore(value=3D=
1)<br>
&gt; &gt; &gt; &gt; pool_sema.acquire()<br>
&gt; True<br>
&gt; &gt; &gt; &gt; pool_sema.release()<br>
&gt; &gt; &gt; &gt; <br>
&gt; <br>
&gt; Additionally AB testing revealed no issues, and the description isn&#3=
9;t entirely<br>
&gt; clear about where and how the problem occurs, so I can&#39;t submit it=
 upsream<br>
&gt; without having that understanding and how to demonstrate the problem.<=
br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; <br>
<br>
There is a slightly different explanation here. libpthread was merged into =
libc<br>
so this fix becomes a null-op on glibc. Not sure if musl has a separate pth=
read<br>
but if so we could/should test that?</blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Musl has always been a single shared object from day on=
e infact glibc is now moving in that direction so it will work fine on musl=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159219): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159219" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159219</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87494766/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87494766/1997914</a><br>
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

--000000000000e97ed605d27c89a8--

