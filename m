Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C02C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 23:37:18 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.42508.1704325030416948808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 15:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEA8PXN1;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7b7fd9e17d8so539880539f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 15:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704325029; x=1704929829; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78/MealusHRzpjSaPpMae4Ghg7aHnu/Z4wQSThW+TYI=;
        b=PEA8PXN1dIz/VpJCzJfWok9+eKQuB0ihDHgzxpVOp0SpLVpXkzK4rV0bA1uujEhScr
         ML9hlITx/CHpnva9n0+SgRQFmGTAy96zvzwtcLBkF9vkGQNzVNtQZttcTQqU+xKBtU+V
         l3EkGLzP/p9an131+LutfZ1X6AFSlhI8eeus28Jo3hKcqjQ8rQ8/76gCy6hX92/0ZrTt
         6CPfVkuahz3lao9E/kLEgR4i48s8ENh60YD7VkQYT1YiGLZP7IJeSz4KeFIBNjLon/7b
         fsyokH4cqvMg45Df4l0ec8SY5HPCh63Exjy/utwBzKFURD81pK4uCiunk+Qjcyly+yuf
         6liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704325029; x=1704929829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78/MealusHRzpjSaPpMae4Ghg7aHnu/Z4wQSThW+TYI=;
        b=BfhvupTtL5LuRRomaxY8DLlGMLAKB9yVApm18Sdo+oFM/Qjb75wOJXPL7HH9bvyQto
         01CO11zZAZF96HXcMvFfUDJf4EwuW7DscGbqttqyPGWoi87P2Af6TrPJQebg64NtDqcc
         ggodHUezIGQvdsar+iV2O3TszXtvE0pSxEJe6PFPX251GjcvFFOqOv9oi7kCFKHYKloU
         XpJopr7FlkfmenEorM23FapyXalpCvoIq65SnIbhYYgRKVVOdaLdZ9jFNc3ECwjE/R77
         tfOZoWeYRWDHcdgu8dbvVNkCcHMf/MLbNxRoqK1wzCi1fGzrKBgzVvtuOZz2IcLuPabT
         dD4Q==
X-Gm-Message-State: AOJu0YwZZfiLUQLNtwD2Cb71fi4R2UGqVi17joGkvXpVV8Ifvtl++sji
	+VNLQNs7qnEQOKad/w0uWMIWCdgI72yS1dBuOts=
X-Google-Smtp-Source: AGHT+IFJTx9gB+jUfxL3HFNQnS7cDW6qUu0WHmkrMS0HCKJjb0XbDW7Lkie3+BdwOICGyiHp/qO+SZjmQXPwMdTLtwM=
X-Received: by 2002:a05:6602:39b:b0:7bb:a8fc:4a3d with SMTP id
 f27-20020a056602039b00b007bba8fc4a3dmr4651698iov.5.1704325029330; Wed, 03 Jan
 2024 15:37:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704169585.git.bruce.ashfield@gmail.com> <0e71617a87f786db81fcb971833ad8897c88841c.camel@linuxfoundation.org>
In-Reply-To: <0e71617a87f786db81fcb971833ad8897c88841c.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Jan 2024 18:36:57 -0500
Message-ID: <CADkTA4Ne1c1gjrHZqJjeRg+d6pvNd25MEmu+btsQy3CXrZdVpA@mail.gmail.com>
Subject: Re: [PATCH 0/7] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Jon Mason <Jon.Mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 23:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193296

On Wed, Jan 3, 2024 at 6:25=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-01-01 at 23:31 -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > As promised, I waited until the new year to send this update
> > to introduce the 6.6 kernel and libc-headers.
> >
> > I'll be sending patches to the appropriate lists to remove
> > 6.5 shortly and make 6.6 the default. Once we have the reference
> > boards updated to 6.6, the 6.1 kernel will also be removed.
> >
> > I've built 6.6 for all supported arches, core-image-* and have
> > also tested against musl.
> >
> > Patches to meta-oe have been sent, and the work done with
> > 6.6 as the -dev kernel means that the tightly coupled packages
> > already build against 6.6.
> >
> > I'm sure there will be issues .. as there always are, but at
> > this point, I need more eyes and test cycles to find those
> > issues.
>
> Thanks for putting this together (and deferring it!). I ran some tests
> with this series and the QA warning tweak applied. It looks like the
> remaining issues are:
>
> Some issue with 6.6 preempt-rt failing to fetch:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8393/st=
eps/34/logs/stdio

urk. That's an easy fix. I did a run with my scripts not updated for 6.6,
I must have missed -rt. I'll send another patch to apply on the end of
the series
for it.

>
> Some issue with qemuarm64 ptest images failing:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5933
>
> [    1.664613] jitterentropy: Initialization failed with host not complia=
nt with requirements: 9
>
> which looks familiar but I'm failing to page in the context offhand.
>

It does ring a bell, I'm looking into it.

Bruce

> There is also a meta-arm config check issue (copying Jon/Ross):
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5059
>
> The build is close to finishing but hasn't quiet at the time of
> writing.
>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

