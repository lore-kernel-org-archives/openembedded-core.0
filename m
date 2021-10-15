Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA98FC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 20:54:57 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.2925.1634331296565835580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 13:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=krd8GoYt;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id h19so20535585uax.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 13:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B9QM/jVMRX7ZoB6NGvUbjp2mN45EGgiZukf+yl9x0Yo=;
        b=krd8GoYtIQVvlbgDvdeJi0uVYgZMt0o5LXSZJ2iYH1iP8i2/1cwK+svdKII9XL3AG0
         voERFtL3WnbpNtV6wVCg6yc5ckvNoa6JuXzUCSWUYk1UOzOg5YfH07d6c/hFiKBFFVJM
         3n0aHQ7ILamTcPLvOCWU3PAr7P+0DbrUExP3szAMNZDksb5+nF36C0xMsO/Mm0z9tDP6
         V6epDYxdiKYcz8o1AEx8DFrdQ8eMOiKvQtmgaCFz4B4Ph/ljhcVg1B/BMblRdubNeYy0
         jG/saK0Bar06aUhU8ztMCkOEBw48EonAdNTnNsQ7zRGD+6wZmflZbHt3Ci2KPdy/1cm9
         1RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B9QM/jVMRX7ZoB6NGvUbjp2mN45EGgiZukf+yl9x0Yo=;
        b=KzbG1FAm3Pm/qw03+Hc13iY6t757NPS8G3e5SFY4XBshRHcLL/wP/h6EUSHktvXZCo
         vVQkWBY98CWpXcxY/zZ4Q39k1zVFc2oJs/G2xcjk9wkgt/aJJRIZoXXE2WI9qRdHBS9m
         VA8keV/KrvbcU9ezah8gDFR7C6ZSjqtDdbMGglRc4ZTRSwHoZhmE5xGCOmQB+QoyY0xO
         lV9tOEg/M892a2sMTMrwFyoNRUNHrcVg+LCM5uG0FkY5Nf3nsXFeYboJQ7UBPpEZe+Wg
         Ui3IyBxcQWIlwn/dhET56un3VPPjxGNpCnYnWlb8CRvp1OR0et3C3GDjKAli6ybhFSmu
         bWOw==
X-Gm-Message-State: AOAM533pmHMwBz4TfCWHp2+hT8yhtiGhd5xWvvfbz/Q73LeH+NQCwH5e
	Zq28DX+F2U47G2vGk2O9uHWfRh5czzGcluSiaok=
X-Google-Smtp-Source: 
 ABdhPJymScBP5OmbkE41zoFcFTjNyVCOgl9cHNQFOOXDAjx2uYTRHM03QBCusSmOPy4qWqk9kIJnKzmywUNPtevnHuU=
X-Received: by 2002:a05:6102:951:: with SMTP id
 a17mr16667097vsi.18.1634331295373;
 Fri, 15 Oct 2021 13:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211015170630.1069043-1-alex@linutronix.de>
 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
In-Reply-To: 
 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Oct 2021 22:54:44 +0200
Message-ID: 
 <CANNYZj-RwGKeut0Lf2iecz-VvcMiBdLZ8TcZeAeKNN1Wn3O0vw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] populate_sdk_base: add support for zstd
 compression (and default to it)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004e74ee05ce6a6826"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 20:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157009

--0000000000004e74ee05ce6a6826
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Oct 2021 at 19:29, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> Can you quantify "more"?
>
> I'd be interested to know if a higher compression helps and what the
> time/cost
> tradeoff is too. Not sure I'm keep to have it increase in size. This likely
> increases the eSDK size a lot too?
>

The benefit is indeed not unquestionable, hence the RFC.

1. The eSDK is mostly made of already compressed sstate artifacts, so the
effect on size is minimal and the zstd's time benefit is clear:

$ bitbake -c populate_sdk_ext core-image-sato (to have everything ready)
$ bitbake -c cleansstate core-image-sato buildtools-tarball
$ time bitbake -c populate_sdk_ext core-image-sato

xz time/size
4m46s 1.7G

zstd compression level/time/size
19 3m4s 1.7G
10 2m44s 1.8G

2. For the basic SDK (bitbake commands are similar), xz's better (but
slower) compression does show clearly, but zstd's time wins are similar :

xz time/size
5m20s 581M

zstd compression level/time/size:
19 4m5s 837M
15 3m44s 979M
10 3m22s 993M
default(3) 3m19s 1.1G

Alex

--0000000000004e74ee05ce6a6826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 15 Oct 2021 at 19:29, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
Can you quantify &quot;more&quot;?<br>
<br>
I&#39;d be interested to know if a higher compression helps and what the ti=
me/cost<br>
tradeoff is too. Not sure I&#39;m keep to have it increase in size. This li=
kely<br>
increases the eSDK size a lot too?<br></blockquote><div><br></div>The benef=
it is indeed not unquestionable, hence the RFC.</div><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote">1. The eSDK is mostly made of alr=
eady compressed sstate artifacts, so the effect on size is minimal and the =
zstd&#39;s time benefit is clear:</div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">$ bitbake -c populate_sdk_ext core-image-sato (=
to have everything ready)<br></div><div class=3D"gmail_quote">$ bitbake -c =
cleansstate core-image-sato buildtools-tarball<br></div><div class=3D"gmail=
_quote">$ time bitbake -c populate_sdk_ext core-image-sato<br></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">xz time/size</div>=
<div class=3D"gmail_quote">4m46s 1.7G</div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">zstd compression level/time/size</div><div =
class=3D"gmail_quote">19 3m4s	1.7G<br>10 2m44s 1.8G</div><div class=3D"gmai=
l_quote"><br></div><div class=3D"gmail_quote"></div><div class=3D"gmail_quo=
te">2. For the basic SDK (bitbake commands are similar), xz&#39;s better (b=
ut slower) compression does show clearly, but zstd&#39;s time wins are simi=
lar : <br></div><div><br></div><div>xz time/size<br></div><div class=3D"gma=
il_quote">5m20s 581M</div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">zstd compression level/time/size:</div><div class=3D"gmail=
_quote"></div><div class=3D"gmail_quote">19 4m5s	837M<br>15 3m44s 979M<br>1=
0 3m22s 993M<br>default(3) 3m19s 1.1G</div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">Alex<br></div></div>

--0000000000004e74ee05ce6a6826--

