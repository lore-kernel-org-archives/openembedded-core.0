Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D54ACA100C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 20:21:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.32837.1693945256857839961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 13:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IdDVSCyF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-402d0eda361so21266025e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 13:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693945255; x=1694550055; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SgE5IIVm9t0zfRliXOU2fe8nHP89D3CTSX+a0/J7Clc=;
        b=IdDVSCyF8BNfTRffN/+aGNAxxq23cD06B3qZSet4gqtg6JUbahda5xPg9i1DxOdKAK
         1z89r12fUA6j0z8rXEfZQ3SFItD7WYqAuPtIF2z66x9qxV5D4juFUwy3oJnmM3U1XuYU
         eZh1Dn98A8DE7QxmSiDG9/OHlN2H8ARXfbQMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945255; x=1694550055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgE5IIVm9t0zfRliXOU2fe8nHP89D3CTSX+a0/J7Clc=;
        b=fXLvk/2D2EAP77Wjez72acuBmiHwGtjuWlVDtCANw8IUKO1OZuNsnhz5+LNkbsCwzN
         f7Iw6d9fp/taylJBRiQu6uZnB6uXFgZeahhA4CJQVQlGvbZFoU0PhzIzCLrJMXOhvu2x
         GC5AbdUMoo64wKbr9I5gVY5mAaq/9DFgWpa5fLThMCJn/z4jHBfuMULewIJzmYH052jT
         q9S57HAedBbNHkE8Cbt6aLvv6sOF+xl8R3icv9gSGNHAwTUFq1WFJomqvtriFCTryd4W
         aKTjlq18uta+TZ5U/YukU29bk+e1GWo9hLPBYfTsk2rsTA3KuAwiGXTewkzeoViP/AIm
         5cmQ==
X-Gm-Message-State: AOJu0Yyb0+xxW+1nvRaOL/TgsPwyZihDAXD/uajheW6G8SHfKGQ1gbyC
	x0oxlU5WmAT3fDIDku78+wyEzw==
X-Google-Smtp-Source: AGHT+IGer/5TKbloIHQ9UQ2b6Ge6Zd5ho6TDKqPqxzrVqralQV7hLlMOuhWa5PkUzK3mmY7yjtosbA==
X-Received: by 2002:a05:600c:2409:b0:3fa:97ad:2ba5 with SMTP id 9-20020a05600c240900b003fa97ad2ba5mr650062wmp.31.1693945255288;
        Tue, 05 Sep 2023 13:20:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:81e2:ebec:c0f0:bc4f? ([2001:8b0:aba:5f3c:81e2:ebec:c0f0:bc4f])
        by smtp.gmail.com with ESMTPSA id t4-20020a1c7704000000b003fefe70ec9csm20945608wmi.10.2023.09.05.13.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:20:54 -0700 (PDT)
Message-ID: <029bf8ad5334526b40c924d5fa43b0238783b34d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] Add DOCS-WIP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Date: Tue, 05 Sep 2023 21:20:54 +0100
In-Reply-To: <CANNYZj9OT2-ewQNGnTkVmtcgYz1FAMat4H_S6zfPHBtDz8u6wg@mail.gmail.com>
References: <1781038DDC42F2C1.32676@lists.openembedded.org>
	 <b9ac5c81f623c560f74e98294b4855bb8da9b534.camel@linuxfoundation.org>
	 <CANNYZj9OT2-ewQNGnTkVmtcgYz1FAMat4H_S6zfPHBtDz8u6wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 20:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187256

On Tue, 2023-09-05 at 21:58 +0200, Alexander Kanavin wrote:
> On Tue, 5 Sept 2023 at 21:32, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This has proven contentious. Whilst I think it would help our docs
> > maintenance, there are differing views:
> >=20
> > * it should be a directory for conflict reasons
> > * we don't want a top level directory for this
> > * we don't want a directory called "WIP" as it looks bad
> > * we shouldn't have "partial" half way staging, either the docs are in
> > repo or they're not
> >=20
> > I'm weary, I can't reconcile the views being expressed, some people
> > haven't clearly haven't read or understood the proposal reasoning and
> > its turning into a perfect bike shedding exercise.
> >=20
> > Much as I think it would be the right direction, some people won't be
> > happy, the complaints are going to annoy me and I'm going to abandon
> > the patch.
>=20
> Ugh, this is *not* the outcome I was expecting. Whoever is bike
> shedding: shame on you.
>=20
> My two eurocents:
> 1. Top level directory is fine.
> 2. Top level directory called 'WIP' is fine, if it's not in a release
> or a stable branch.

Well, some of the views are mine, some of them are not, I just tried to
summarise for the archives. I am definitely against a WIP directory,
the optics on that look terrible as it is too open to
misinterpretation. There is no guarantee it would not make a release.

Whilst I understand the technical merit of a directory, I really don't
want a directory at all, the idea was to keep it really simple and it
was working on the assumption that things would not be long in the file
so merge conflicts would be minimal. With a clever choice of section
separator, I think diff could be fooled into  doing a decent job since
we don't care about ordering.

The bike shedding was going to quickly go in the direction of "we could
have multiple directories, one for release note annotations, one for
migration guide and one for docs changes, we could then have a script
which did X and Y and magic and ... like python or ZZZ does" and this
is partly why I'm just giving up, lots of excitement about complicated
things which nobody has time to implement/maintain.=C2=A0Case in point, how
many people have helped improve the docs build automation since it was
created? The code mostly works but is horrible, it could be so much
nicer.

Given the direction things were looking to go, I don't have the
time/energy to discuss/argue this any further.

To be honest I'm struggling with things in general. Problematic patches
come in and I end up arguing about them on my own even if I know that
were they to merge I'd get a load of "why did you let X in when it
causes Y performance to degrade or complicates Z". There is far to much
reliance that I'll block things and therefore nobody else has to make
the effort :/.

> 3. I'm regularly adding features or changing behavior that require doc
> updates. I'm just as regularly forgetting to document what I'm doing,
> and this would've helped. The most notorious example is per image
> license checks which went undocumented for several years.

You're not alone, 2/2 was an example of my own making I was trying to
head off issues with.


Cheers,

Richard

