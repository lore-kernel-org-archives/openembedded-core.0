Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9561C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:09:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.21306.1669129766279616369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ddbVPDNP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id t1so10925502wmi.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OnEx5WZodzWaygt+YfxTFOEM/bugaF1NIUiFXNaJPzQ=;
        b=ddbVPDNPLhWkbmSRbBX1ukNm3B2aZRc2vY5J1HPssszAP+UOIrD6BcMw67cS3bUFe6
         oVHSqvO2NXCez+gRJuaEJdMMTtqGfQRBGRN3dG7VosoM7Yqx1KGFwMlgtzbzuCRMdJYE
         3mMDLSJwJo/9bVaZADA5aC9N92BFZTKILpPKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnEx5WZodzWaygt+YfxTFOEM/bugaF1NIUiFXNaJPzQ=;
        b=POTJ3hreQuCpOoUu+sXc0gc7ZQbnJF2Yp3Cli6eUUa2zrlFiT40Ncaun8zv+ecV2Tt
         iu8ovNJiBkhnj4fmMl7ieSTkaTXHtwhXbjKjkXCQCRhopCxqRZf/hg62VMWlw5Qso85V
         Afzg5hwAw4eCw252VVi4oRxeyy3SvEE+FMNVtzTXqf/qxS8byM7Ln7eJyX4fJi2exUsz
         /RH3znQ8ePe///6j21SNNc4u9+Zem4PTC93w9TsDV0nD0veq7YOj017f1Az8Ji+LRI1h
         ufpFle4miTycUJYrEJ95Vkab+zEOHUTBVELex09FdalJ8522QKbJYDgp6IGTYl1U9YQ5
         1tHg==
X-Gm-Message-State: ANoB5pni298gLNEX/TtPJstaldKYT0xwlP3FLar7dGvTU4xOWcRqAhqE
	fFmBITgwjWrIeW3fAZ6PgNhafQ==
X-Google-Smtp-Source: AA0mqf409jzuNFqssyc3iiFCKAgsupWfA2Cy4+R4RVy4finhwO55yQZtYvtOgiayNZCGbISF/HzuRg==
X-Received: by 2002:a05:600c:3495:b0:3cf:a258:99b with SMTP id a21-20020a05600c349500b003cfa258099bmr16427954wmq.34.1669129764581;
        Tue, 22 Nov 2022 07:09:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445? ([2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d50d0000000b00235da296623sm14237978wrt.31.2022.11.22.07.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 07:09:23 -0800 (PST)
Message-ID: <ab2f02ff2654669a3c0b26bf741514698966b292.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 22 Nov 2022 15:09:21 +0000
In-Reply-To: <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com>
References: <20221120133122.2464634-1-alex@linutronix.de>
	 <20221120133122.2464634-5-alex@linutronix.de>
	 <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
	 <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173683

On Tue, 2022-11-22 at 16:03 +0100, Alexander Kanavin wrote:
> On Tue, 22 Nov 2022 at 13:29, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I understand why you want to do that but this will totally break the
> > nfs export support, I could see at least one issue having looked at the
> > first few patches this was dropping.
>=20
> I can go over every spot in poky/ where unfs is mentioned and verify
> that it works correctly there, would that be ok?

It would help, yes. If you do that it could be good to understand and
document which areas we do/don't have test coverage of some kind for as
we could then look at either adding it or dropping that support if it
isn't used.

>=20
> There was one failure in a-full with glibc tests, and that's fixed,
> but I can see there are more spots revealed by grep, e.g. runqemu and
> sdk_ext. They just aren't automatically tested.

A change that worried me a lot was the removal of the custom ports as
it means only one client can run on a given system. I think that could
mean that we'd potentially hit issues if two tests ran on the same
build server. That is relatively unlikely but it is the kind of race
we've spent a lot of time removing on the autobuilder to avoid rare
failures. I didn't look further at the other patches being removed,
that one worried me alone.

Cheers,

Richard

