Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664C6C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 16:26:14 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.1764.1636647973281025013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 08:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SixxsUc4;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id v2so4366135qve.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=S2cqQaezpdvkgbMrrSamy7xBVePd8+oDsyT7sQjMq9o=;
        b=SixxsUc4YS1IPH85cCEclF39rx0IWm/eZ0fdlWI+ZFN3+jiiK7M0CXVHNcMFXCaXas
         U7IcHe1NSNzsfqao6hCPQPKvLaTeN9hMwaWjzdGLOnNm3wELjHpv6cmQ6+7CPRHwdWnR
         d227Eorx0B39Zws48dVRcvLYa+Yx2QP6/QoSda18mVlSBvXYD8ow92zNZvY0SfJyW7BB
         jnPqmvZCPpKJ3u0RZs/iWV9JsTjZuDBbrli/E27WqQewlVF86eghmY2U3F/0T/RXs62y
         mB8/tqyPllBUAM5eGv/Fp8YAlf75Cd8nvg+eWTdD5hj25a4+R9Xh5oyNmn/9u1rKoDRR
         qdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S2cqQaezpdvkgbMrrSamy7xBVePd8+oDsyT7sQjMq9o=;
        b=til3hzDZoaQAptfWlt3CuJnEA3AVg3jKXBwq6uPOUtC+dxYXrlLKVyL72aTCWDXS5E
         W03SP2JKVgg+CRT05m4lqhPMrCywGgm06qcFowF2qEVgdhW0ms+QdltKHBqoyZ9Dk4j7
         fJh2qCdHmMAaVBX00EmYCzuFXZF7O/uByurGCAeGY4l3sPt+Wg1D9amegvHAeOF2GX5C
         F22kLEoSgFAX6cwbcD6BxbSAx6BX2WBq5XVVJmn2GSygw7ZXGE+iSG1CckdzbTAiRAEw
         V0SKAQzFAhGusj8n0UYWl/JNcLISiP5kqFQMVm89rddSDxEsoYK+KzwQ/5fIP5CHOcO/
         KGwQ==
X-Gm-Message-State: AOAM532OH2Tb6nZLe56tuQYwfztKELsv3dfqfaMmHwYMfJrdSfi3R3gC
	RI2QlD1wBzU8vTn4pVMlCwmBGoJljAEARRyJpOk=
X-Google-Smtp-Source: 
 ABdhPJyStmhG30QJVdxeQVAzFaaiLM55T6smXxYMlWBk4NRI0FSsJqTYR5llp1HFWahmoh6Gu9LEyFuI97/PT4h1/wg=
X-Received: by 2002:a0c:eb90:: with SMTP id x16mr7943976qvo.41.1636647972324;
 Thu, 11 Nov 2021 08:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20211111100531.3822580-1-alex@linutronix.de>
 <CAMKF1sq33pUGxV75AWgB20maqXeaJ-zbGykWFQSoLL+2HCVgzg@mail.gmail.com>
 <064d80643beb1d723008816d7dea76497a8d0533.camel@linuxfoundation.org>
In-Reply-To: 
 <064d80643beb1d723008816d7dea76497a8d0533.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Nov 2021 08:25:46 -0800
Message-ID: 
 <CAMKF1srJ34x1VS2kxgyni0XgmG2sutaP=3rrNcxhBWZCrYGumA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xserver-xorg: add missing libtirpc dependency
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexander Kanavin <alex@linutronix.de>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 16:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158191

On Thu, Nov 11, 2021 at 7:23 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-11-11 at 06:58 -0800, Khem Raj wrote:
> >
> >
> > On Thu, Nov 11, 2021 at 2:05 AM Alexander Kanavin <alex.kanavin@gmail.c=
om>
> > wrote:
> > > This wasn't a problem in poky, but was exposed with a nodistro build.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > index 4a7048aced..71c934ef38 100644
> > > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > @@ -28,7 +28,7 @@ inherit meson pkgconfig
> > >  inherit features_check
> > >  REQUIRED_DISTRO_FEATURES =3D "x11"
> > >
> > > -LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> > > libxkbfile
> > > libpciaccess libxcvt"
> > > +LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> > > libxkbfile
> > > libpciaccess libxcvt libtirpc"
> > >
> >
> >
> > Interesting. Do we know what the difference is?
> > Perhaps a distro feature gap ? We should try to get poky close to no di=
stro as
> > it=E2=80=99s reference distro
> > Less work in maintaining nodistro would be beneficial
>
> The difference is enable/disable of opengl. They are already very close, =
that is
> one of the few major differences and in some ways it is useful to test bo=
th.

I see. yes it is important to test opengl and non-opengl case.

>
> Cheers,
>
> Richard
> >
>
>

