Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51900C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 23:52:48 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.42816.1704325963108330146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 15:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XvWevG4B;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7b7a9f90f34so590234639f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 15:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704325962; x=1704930762; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OningRdNRHsDafQnmzK5G59O5/gdyjcLjseQLEPBTjY=;
        b=XvWevG4BdWM4TOvC+WKwIcpOlUjdGM5hGcA0JU7LNBaFldyo01QkFX4z1wTxa2MfLD
         iRxFT7w5Ikr7yQ9kleijCRnt5A63fIWlr5shoAk6VQ9OW/hqwwvgLFQ8R9nY2/y8X9dZ
         CgfJ1sy5A+kZuKtMuabBbEtm1wKcnzhFKvxzO4HiK4j8Mt2clTe90z4XyQ0COMFKxQiy
         lLZ8LCJ6ny6MSGmf4wXLr46kN8bMUV32tMEEl3s2+5HTu3qEVgF8L43j68Erm6uTlOGN
         ItfHId959d4iEZYQEzfP4Hb9oydh/VpddLzx2cg1vLFB+Sw8hLCAmgQPMC0ZhwFeSrn7
         astg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704325962; x=1704930762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OningRdNRHsDafQnmzK5G59O5/gdyjcLjseQLEPBTjY=;
        b=pAyH58dMUwOkGZ02KiFlb+B1q60+B0+QHTp82OwdggTvQo55tTQo18HeOAqay7I00a
         7VHDKtjHiT6lIwA6l67oAq4+PtQPfRJl6qn/F6+3smYa6ARa9BnBy0GNvrDGlxllaeGH
         QRSSLsUDGB6MpIF+7J5weMPpDcuK/zvqEaYNbUWv5xavcF7Yv4J3bAq5xYXq/0aD3V3w
         ID3DHKTeGI0R65RnX5nxPFIiG3F3/NdTBh6mxZHCwQAnqEifzQuJN2N81/1SQNoB4PYA
         I2riLBSR4u9yT8kI005rYd+sbk81qeqYWT+5wrf7AWABUtgBoqwb8nQUbFjpvLTSdmPh
         N1tg==
X-Gm-Message-State: AOJu0YwhMjB3iXnEncmWbMs82bjnWKzTKyV4tIyWKCFF6uvjLTsO+D6D
	FL9iLMHbKz0pE6JvwNkhdd7iZate46iSOEXCQMg=
X-Google-Smtp-Source: AGHT+IHKc0i7NX/au0QsUYDwI09UljTd4IKS5Lfxb1WJfZhqrfmVeujDX86IQCXRymVxsWJARFcuxg3kfgJPK7E8w+I=
X-Received: by 2002:a05:6e02:2218:b0:35d:a38a:fc83 with SMTP id
 j24-20020a056e02221800b0035da38afc83mr19421536ilf.67.1704325962209; Wed, 03
 Jan 2024 15:52:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
 <0e71617a87f786db81fcb971833ad8897c88841c.camel@linuxfoundation.org> <17A6FA95DD1732F0.5872@lists.openembedded.org>
In-Reply-To: <17A6FA95DD1732F0.5872@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Jan 2024 18:52:30 -0500
Message-ID: <CADkTA4NpFszvHQ0XXT7JrSW7XoFHU43zjiJiqdNSwgRnxZU03Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
To: bruce.ashfield@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Jon Mason <Jon.Mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 23:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193298

On Wed, Jan 3, 2024 at 6:37=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Jan 3, 2024 at 6:25=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2024-01-01 at 23:31 -0500, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Richard,
> > >
> > > As promised, I waited until the new year to send this update
> > > to introduce the 6.6 kernel and libc-headers.
> > >
> > > I'll be sending patches to the appropriate lists to remove
> > > 6.5 shortly and make 6.6 the default. Once we have the reference
> > > boards updated to 6.6, the 6.1 kernel will also be removed.
> > >
> > > I've built 6.6 for all supported arches, core-image-* and have
> > > also tested against musl.
> > >
> > > Patches to meta-oe have been sent, and the work done with
> > > 6.6 as the -dev kernel means that the tightly coupled packages
> > > already build against 6.6.
> > >
> > > I'm sure there will be issues .. as there always are, but at
> > > this point, I need more eyes and test cycles to find those
> > > issues.
> >
> > Thanks for putting this together (and deferring it!). I ran some tests
> > with this series and the QA warning tweak applied. It looks like the
> > remaining issues are:
> >
> > Some issue with 6.6 preempt-rt failing to fetch:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8393/=
steps/34/logs/stdio
>
> urk. That's an easy fix. I did a run with my scripts not updated for 6.6,
> I must have missed -rt. I'll send another patch to apply on the end of
> the series
> for it.
>
> >
> > Some issue with qemuarm64 ptest images failing:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5933
> >
> > [    1.664613] jitterentropy: Initialization failed with host not compl=
iant with requirements: 9
> >
> > which looks familiar but I'm failing to page in the context offhand.
> >
>
> It does ring a bell, I'm looking into it.

https://patchwork.yoctoproject.org/project/oe-core/patch/20231003122542.764=
073-1-ross.burton@arm.com/

It looks like we are supposed to ignore it, did the move to the text files
drop that ignore entry ? or did it otherwise slip through the cracks ?

Bruce

>
> Bruce
>
> > There is also a meta-arm config check issue (copying Jon/Ross):
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5059
> >
> > The build is close to finishing but hasn't quiet at the time of
> > writing.
> >
> > Cheers,
> >
> > Richard
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193296): https://lists.openembedded.org/g/openembedde=
d-core/message/193296
> Mute This Topic: https://lists.openembedded.org/mt/103476582/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

