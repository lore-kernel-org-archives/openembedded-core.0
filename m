Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB47C27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 14:42:37 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.11430.1718116948557979254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 07:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RMnEs4xE;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c32d934c2so3285935e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 07:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718116947; x=1718721747; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rT64FhtuiNSViugpE5yI9XqtvwVF4NU7z/zYT4ghBA=;
        b=RMnEs4xENQW7WcnxkAxkpgxcuatInov24pWI2LNCPTO6I1AUgEtW/TckW7oRaUV49l
         fy2qlTr+VBIlpCBKYppKIOx6IVEacp3ME0vLmFtHBv0EUW8N1Y9Zn9wH1ERfy1sXvzrd
         wflQjQfFDbuSGAXRBRpzCWXy4MmhYPYrh/u5fLNHjyIkVdnEytXfd6n7oalcWQIuc1+4
         6UwOdjwOcXOjaEBozXnGp2Vm1KbNhOp0jERqXJip5Of+/DimsJGhoO01G279dDLUp2hF
         OpdM27VkM3PLHap/Ma2pTI6FJD6Pt7IwtlG4jbkUbQLlnVTdvEpFS4qte/3cdLA11d+5
         FGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718116947; x=1718721747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rT64FhtuiNSViugpE5yI9XqtvwVF4NU7z/zYT4ghBA=;
        b=YRmu2AABTBzQReduqMnGhw1NdISPf3xOaXekfU74xYLRhSCoN68OSIlMx3JY0eu8Nq
         EcpcdtclI6xvSzwqTUrXH1D9+OMZ7bxCAYxzs8lrv5/P6EQNV5AGtc5RZHK6yMCOa7ya
         ZlYlP3xbuCr2t3M/nZatOmkwWCdhxFYIg0/Pcsh7TSSipsYm1Ni5N1MrdGRRTGM2doir
         br40n97i4C6dRWfiWlzb/u7de9MBH0yCzMxmMng/UzJXdpNu2KkOotbKCIuuBHIbfkVC
         9NvQvJr/IxuRU6UXTFWo2bkoOyKUW81Jk+GGd68gLXpcZ/pVKsql1YiaHcOnim5MxgVY
         u6pQ==
X-Gm-Message-State: AOJu0YwUtf3vQPsjmK3oUNsKcI5T4fXW0juKst/uMN1J110AiP6a6wq9
	R41pvbIJIi3v/xYtT/Up++Rx9RDFMQNrXFAPD9zYpej3K0mdDjsyLm3CNfEZLZbl2c2VrZPxT3L
	ezNT0wthqBYn7eobCMzfy5o6tYPk=
X-Google-Smtp-Source: AGHT+IH5qwsJiih2i3OQUKi1ULjRsPRA5GPtSaQTyXP4vFdIGaG+u/tJw/3ADA56GBXC30+IznTk9h5zfbDXD3rrR2U=
X-Received: by 2002:a05:6512:239a:b0:52c:8b1a:5513 with SMTP id
 2adb3069b0e04-52c8b1a5670mr4290218e87.47.1718116946484; Tue, 11 Jun 2024
 07:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240610214456.2757397-1-JPEWhacker@gmail.com> <f92d6abb21f57454942351ff10ae808c5d109e64.camel@linuxfoundation.org>
In-Reply-To: <f92d6abb21f57454942351ff10ae808c5d109e64.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 11 Jun 2024 08:42:12 -0600
Message-ID: <CAJdd5GYnm3kSkvKR=fmXiRitKv-ez-3bZg1L3u_ot8Fe_FtYnw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/6] Add SPDX 3.0 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 14:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200531

On Tue, Jun 11, 2024 at 4:40=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-06-10 at 15:41 -0600, Joshua Watt via
> lists.openembedded.org wrote:
> > This patch series add support for SPDX 3.0. Currently it is not
> > possible
> > to have SPDX 2.2 and SPDX 3.0 enabled at the same time; users may
> > choose
> > to specifically use SPDX 3.0 instead of 2.2 by doing INHERIT +=3D
> > "create-spdx-3.0"
> >
> > The default version is not changed yet, although that will likely
> > happen
> > soon
> >
> > Joshua Watt (6):
> >   classes-recipe/image: Add image file manifest
> >   classes/spdx-common: Move common SPDX to new class
> >   classes/spdx-common: Add SPDX version to path
> >   classes/spdx-common: Return empty list from extract_licenses
> >   classes/create-spdx-3.0: Add class
> >   classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
>
> I set 3.0 to the default for testing and there were some interesting
> looking failures:
>
> https://valkyrie.yoctoproject.org/#/builders/43/builds/52/steps/11/logs/s=
tdio
>
> I'm guessing:
>
> https://valkyrie.yoctoproject.org/#/builders/37/builds/60
>
> is due to a missing patch?

Hah, I don't think so, I just neglected to test SDK builds. My bad.

>
> Other failures:
>
> https://valkyrie.yoctoproject.org/#/builders/74/builds/44/steps/13/logs/s=
tdio
> https://valkyrie.yoctoproject.org/#/builders/93/builds/51/steps/11/logs/s=
tdio

That one appears to be some corner case I need to figure out.

>
> but I stopped the build at this point.

Thanks

>
> Cheers,
>
> Richard

