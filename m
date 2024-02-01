Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91541C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 15:53:22 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.18969.1706802797785610391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 07:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdoKxnk4;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d07b400bb8so7979201fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 07:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706802796; x=1707407596; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Nfk+9ZoXWFkHaF/hlHqmeoVRu6NUBziy6LeC3nikRI=;
        b=hdoKxnk4HIMsCwc93xvq5GGA7SN+AUyNPPU5lc65g3UEVuwgXeqyaHXYC63cq7YxAj
         vnhaIN4ziODVF1xzoN6p5/4H0z7NE81pOs5fRb9I+J1+6nnfF4/Q4uBlICizp/5hP/aK
         4XnMUsBJrjsx6v8VANicClZtkZBAaQFAAnGuiPER2r9UTZ4z1E0FfVTUI6ETIEIw6wwU
         WTupI13gp3IGoFoG5rQSLo7URQZL0ehtafOx8sEsRe36Fc0RoUsJ9BBINiyXG7ga8T7C
         Jju006MToEdnnyPs/3qu2TAO7rZ1JXDN9hjdqoDlDz0e3u5xBtyYnDMtcErwp6zekeuE
         qXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706802796; x=1707407596;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Nfk+9ZoXWFkHaF/hlHqmeoVRu6NUBziy6LeC3nikRI=;
        b=uxDDdwrhvw6k4PO9vk1jtQVlSyHwSss9i+gP6TBLOdw/+PSSG1p+sjuougmOEawcVL
         o1XM2Y9uemjQOz0+APZ6MhMOZo9RDvRAWHWgXXVeRand/id1u+v06Oij5GRvgc8UChjP
         MLKC9fQDazprXobHqEVTNTMvwZBChD4hg/gZSaeqqvgd2ICRxl2wZH9l2mJSv77qMcJX
         DGHWHjtp84kpr/SY+QFB2LvZrqCtibSGkrx8a12ydO/wwz8izUdA9Of3dL2NtTkHegcf
         5XY7PDK8DjRER2iT5x95U6znLiplmyCkxKFw9yE7MCZlW3QPxrb53VSSrylqVPp7Dakf
         7/7w==
X-Gm-Message-State: AOJu0YzudBPEXQfJ1tRHrPnlm4qzuDfbUwGoE6Hq7Xz5ApAA9XbchOEH
	EJyAatbLWLsvGK8lQRtAUCiSv2smcvR7XMdEBZoMx5nxO8AE1mwI1GBZEVLo
X-Google-Smtp-Source: AGHT+IFE6OSaS9UUjNImdfX+Cm1bix/ngNFX52huwDv6eC1SuBtLdJplARnItI7DLfyQTsYf/2AA/g==
X-Received: by 2002:a2e:7211:0:b0:2d0:7f4b:b1a6 with SMTP id n17-20020a2e7211000000b002d07f4bb1a6mr425071ljc.9.1706802795610;
        Thu, 01 Feb 2024 07:53:15 -0800 (PST)
Received: from [192.168.101.51] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id fk1-20020a056402398100b0055d19c9daf2sm6889108edb.15.2024.02.01.07.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 07:53:15 -0800 (PST)
Message-ID: <fa6bb15ef0fe0d21d7ef63daf03b0d7b86f021f2.camel@gmail.com>
Subject: Re: [OE-core] [master][PATCH] kernel-devsrc: fix missing RDEPENDS
 gawk and make
From: claus.stovgaard@gmail.com
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 01 Feb 2024 16:53:14 +0100
In-Reply-To: <CADkTA4MeOQR1Tq+nzQAnEch9B06F9eudYe_UGrFoSsW6GbM5WA@mail.gmail.com>
References: <20240201115326.506503-1-claus.stovgaard@gmail.com>
	 <CADkTA4NBTEH9js2E+KBGx3_LeLzd0RDCVY9gw2gHp-qP5ooO_Q@mail.gmail.com>
	 <b594d06bbba5dd65e8f1f9a7cc865a7e5aaaff66.camel@gmail.com>
	 <CADkTA4MUkExGV3WM6LLZA6i9Nk=XU9G2Yc+0AkQchY5UJgAbMg@mail.gmail.com>
	 <212ff1e6d6315bba5371855ebd826bbbdd58f365.camel@gmail.com>
	 <CADkTA4MeOQR1Tq+nzQAnEch9B06F9eudYe_UGrFoSsW6GbM5WA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 15:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194595

On Thu, 2024-02-01 at 09:52 -0500, Bruce Ashfield wrote:
> On Thu, Feb 1, 2024 at 9:37=E2=80=AFAM <claus.stovgaard@gmail.com> wrote:
> >=20
> > On Thu, 2024-02-01 at 08:41 -0500, Bruce Ashfield wrote:
> > > On Thu, Feb 1, 2024 at 8:31=E2=80=AFAM <claus.stovgaard@gmail.com> wr=
ote:
> > >=20
> >=20
> > I looked a bit more into it, and I could remove the check-sysctl-
> > docs
> > script, but it will still end up needing an awk.
> > (Also check-sysctl-docs has been there since 5.10)
> >=20
> > A quick look revealed the folloing files.
> >=20
> > usr/src/kernel/arch/x86/tools/gen-insn-attr-x86.awk:#!/usr/bin/awk
> > -f
> > usr/src/kernel/scripts/ver_linux:#!/usr/bin/awk -f
> > usr/src/kernel/tools/arch/x86/tools/gen-insn-attr-
> > 86.awk:#!/usr/bin/awk
> > -f
> >=20
> > My guess is that for all normal SDK's a awk/gawk has always been
> > present, hiding the issue. So I would suggest that we just change
> > the
> > RDEPEND to cover all architectures, and not depend on some other
> > package include gawk.
>=20
> Definitely. We don't want any dependencies being fulfilled
> transitively.
>=20
> In particular since gawk has already been required by arm64 for a
> while,
> it isn't a completely unreasonable thing to add.
>=20
> >=20
> > (I only noticed the gawk issue, because I had a SDK with had the
> > "make"
> > issue, and created the most basic setup to reproduce it with poky
> > only.
> > For all normal SDK's I would expect it to include gawk)
> >=20
> > What do you think Bruce?
>=20
> Seems reasonable to me.
>=20
> Bruce
> >=20

Sounds good. I have made a patch for this

Regards
Claus

> >=20

