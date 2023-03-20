Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DB9C7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 10:01:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.10071.1679306465055922992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 03:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ekiCegkd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j2so9711623wrh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 03:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679306463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bX2FuDlA/zwJahMs2Rao0FRPHD428WyFTxDcUdsfQLM=;
        b=ekiCegkdnA0R4DHuG56OQgBmxfInS4a6TRlcsbTDjyf7CW4wX8aKYtrqTAJ1pdWVVu
         vKbMFqhYRQatcpq9ycgLP9PbKxPtiBNCy4dqlbyVbcwp6RVy88AcNlzd6x2rl0fSxsT8
         mtmjAT76Q/77tAdhK5akJxdwNlH901dvxYG00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679306463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bX2FuDlA/zwJahMs2Rao0FRPHD428WyFTxDcUdsfQLM=;
        b=B47RXprzoocZoNPp2MCvM6i6Sl1VQIc666X/zBs0IM49WFW5jNlv/Eye7xkBumEn7y
         m/sZ3SO/u8nGL0mql5IFGP6Od8BIDgRqXAZbjBcnDJRQvmTPoGuWgTFmKvt59hPV6+87
         W5koiEVTO7FH8CLW3pEz0QaLr+6Tn2PtnlJni9qFKxEdByW7hNSlwGA/dUHreaGLBfpZ
         LUDh9IxG7sDoMP1RPCP/wN04TptvuysNRA+6a0Phz7wglrNhCtgeGGq1t84khVyyWFWT
         3T29qwitVj72IByQXPlZkJrZIWpiQV990RRzF1nuz6lwdx7qQYLUG3+A0IyG50gBd0bn
         lg0g==
X-Gm-Message-State: AO0yUKXI1rvHWnP86WuPFvUUwLEswpCsI64OmlVDkREd0yKQ7ZYEc2rh
	rBXgN81OwuKySbmne/2QKiFFTw==
X-Google-Smtp-Source: AK7set/wQBUiHuLcWtrx14/aKpnK6rclBx3huBmruPkJRAuYSphAYZxcIE5QcgP08buOQP0JbihMdQ==
X-Received: by 2002:adf:e941:0:b0:2ce:e571:5cc3 with SMTP id m1-20020adfe941000000b002cee5715cc3mr9044059wrn.28.1679306463553;
        Mon, 20 Mar 2023 03:01:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1e4e:398:789f:af73? ([2001:8b0:aba:5f3c:1e4e:398:789f:af73])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d48ce000000b002d45575643esm6457866wrs.43.2023.03.20.03.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 03:01:03 -0700 (PDT)
Message-ID: <b035e00a13a04de67dea942bb202671b7c7d0393.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] mesa: update 22.3.5 -> 23.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2023 10:01:02 +0000
In-Reply-To: <CANNYZj8w3QZ5H4L76ZD=qY3YmLYDP31nrJQWxh+BS+Ub7dc=ww@mail.gmail.com>
References: <20230316094102.2628727-1-alex@linutronix.de>
	 <20230316094102.2628727-6-alex@linutronix.de>
	 <CAMKF1sqhwupoW0kV7ao94DvdbxTH4B5i3HfMwOnp6M+g0g85Sg@mail.gmail.com>
	 <CANNYZj9rnnKP_wGaqqg8ozVz1Q5ikbqccQCADshnFpuozG3MyQ@mail.gmail.com>
	 <CAMKF1spQmR-yy3nvjDs6aDMKd-NB3yBMPTTCvp8XNptfYRPjPQ@mail.gmail.com>
	 <CANNYZj8w3QZ5H4L76ZD=qY3YmLYDP31nrJQWxh+BS+Ub7dc=ww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 10:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178809

On Mon, 2023-03-20 at 08:09 +0100, Alexander Kanavin wrote:
> On Sat, 18 Mar 2023 at 19:38, Khem Raj <raj.khem@gmail.com> wrote:
> > Perhaps in the next cycle yes and definitely for the next LTS it
> > should be dropped.
> >=20
> > Its stll supported via Extended Security Maintenance (ESM)  and users
> > maybe still be using it.
>=20
> The question is: are ubuntu 18.04 workers going to be maintained after
> 18.04 transitions to ESM next month? In all likelihood they won't be,
> as it is a commercial subscription, and then we can't continue to test
> with it.

I think the fact it can work with buildtools should mean we're ok. As
mentioned, we already need it there for python version requirements and
as mentioned, it is EOL soon anyway.

Cheers,

Richard

