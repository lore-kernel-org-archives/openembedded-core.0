Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92520C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 13:11:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7932.1652447481010329126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CXA4Iut+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so4741228wmn.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=LMPME3FXNkHx0DsZIi4HIfmyV78p3LAVQ+lsEjl5Sb0=;
        b=CXA4Iut+H/0mOpp4Dybb/9A/gksv+55Q9sEQPxEd+ThKGLCLVA67tQLU2x5B2jedQi
         LWP8LNOrk45AATitrUWlWzIC9hUNhRo8mIn6OO4CTofr+AJNLm+ktH7NFcO368F/eeek
         0r9idUKbHpuFPSdB839qErtunFXW1feP74duI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=LMPME3FXNkHx0DsZIi4HIfmyV78p3LAVQ+lsEjl5Sb0=;
        b=qUXrpC9yVC+lfy7U0hBQ4pPoAjhqfyW4NhczT9tYK+hlyuUg8H9grd5X+e1OhnxWrS
         +HEpEkU83lNFy797eJsWVA8PJzHM++aNLJesobbheQukMEcVSpegSQ6yGdTVStBpuZr1
         er11zfHFJiEPJqeAAs45tPSG61hLV1TaKwJvJ3TM0jH0Sp16EJiMp/W7CmCTwiKbC9Lh
         fFz4upY8J8+L2uxCrCG9T3JgMXcyvgWrAVj9p4M8bfDOttj5sozN/swqp30XcWeV8oAM
         nBu7AIfd8bqafsj3OgM90+ED8k6yuwk67OPVNwgeAgECCQzlB0RwqplQXWzALaiH3tKJ
         +mnQ==
X-Gm-Message-State: AOAM531mM49XCp1Vk+CYOo/lTy5otnXnNoBHWtlFI29AVzGGcNMuJ9QD
	brO3UCicLvjHZYuJK4t4e4KCCw==
X-Google-Smtp-Source: 
 ABdhPJyxn9l4c6NPsP4fC9tWAlT294uic54hP1WqnL3BGSs6udS8LmrXS5IrxX7lpw9EULCHMUm1pQ==
X-Received: by 2002:a05:600c:214c:b0:394:2dfe:2754 with SMTP id
 v12-20020a05600c214c00b003942dfe2754mr4520301wml.135.1652447479447;
        Fri, 13 May 2022 06:11:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8?
 ([2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8])
        by smtp.gmail.com with ESMTPSA id
 o37-20020a05600c33a500b003942a244edfsm2250174wmp.36.2022.05.13.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:11:18 -0700 (PDT)
Message-ID: 
 <9297a0be88bd4efbb2c08cf6056d460bf2442f22.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, Pgowda
 <pgowda.cve@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>, Randy MacLeod
 <rwmacleod@gmail.com>
Date: Fri, 13 May 2022 14:11:18 +0100
In-Reply-To: <aeb5d0a1-de07-9c3f-d539-e641fd9ded41@windriver.com>
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
	 <20220502223054.3aa3ecd5@melee>
	 <CALY4986U078AV7xgvpCr+Ev7sQDNW1RQymM=iPDgfN1-r29zuQ@mail.gmail.com>
	 <CALY49869zPf6F8UELEue+9BvyToT=W=hGqSRtazXZW+zPO5c=A@mail.gmail.com>
	 <215dded4d396c69a484a5404d07499b45af819d0.camel@linuxfoundation.org>
	 <CALY4984taQDm3GRxcJBCzGgHAt8jUP6fj8bD7cRe1FmjLkVoUQ@mail.gmail.com>
	 <aeb5d0a1-de07-9c3f-d539-e641fd9ded41@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:11:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165561

On Fri, 2022-05-13 at 09:06 -0400, Randy MacLeod wrote:
> On 2022-05-13 08:56, Pgowda wrote:
> =C2=A0
> > Hi Richard,
> >=20
> > Thanks for the confirmation.
> >=20
> > =C2=A0
> > > What you really need is a way to replicate the failure. How did
> > > you
> > > test this locally?
> > I ran the complete Oe-selftest suite with the latest poky sources
> > after applying the patch:-
> > oe-selftest -a -t machine -t toolchain-system
> >=20
> > Can you please let me know if I have to export any specific
> > environment to replicate the failure?
> Please explain what changes you made to you local.conf
> =C2=A0if any.
> The only one that stands out to me in:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100
> is :
> =C2=A0INHERIT +=3D 'testimage'
> but perhaps that's done automatically for:
> =C2=A0oe-selftest -a -t machine -t toolchain-system
> Also, what host distro did you use?
> The failure happened on an alma distro: worker =3D alma8-ty-2
> https://almalinux.org/
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100
>=20
> but that may also be incidental rather than required to see the
> error.
>=20
>=20


Also, going back to the original patch being tested here, why is it
needed? What are you doing to reproduce that failure?

I'm guessing you have to have enabled multilibs? Do we expect that to
work with the glibc tests?

Cheers,

Richard



