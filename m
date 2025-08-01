Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB0DC87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 22:17:38 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.100031.1754086653773118982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 15:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HdZUU7jz;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8e2b50f8f1so1387854276.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754086653; x=1754691453; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I92Can9vunbM+Z8VnVfYmeDI6dXzxdO8YhG5Yms6ttw=;
        b=HdZUU7jzFcnoJy8u153fCqAMquq5Dfs0/CwFLeHCaQxU2btdnkOqUo8/RSR1+7JM50
         yxIQAmHrshL1lNmCQBH4b4QEjFfKAsJbrCJ83hMr8SI5VGhCIUUwbF+01+uHPj3wh3BI
         MIU4/73uT+eKPZCEC/Ri2coPJJXQm0WaoJKbAu1bOEzPtPYgJU8ihzRgEqIW7hI/ibHW
         RbhPYvOkdbYZTpvkGrzMi0OBU3Qw3C9FuQ5dS7j051t4QuJg2PRgUCnbUnDh7xmdQNIC
         eb/YDY3zS/UOc8ZmERSiN+nblaa8Hc/nC+X/F8pPja2gQKOQ7cy4zga+YPim7W2a78Un
         FUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754086653; x=1754691453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I92Can9vunbM+Z8VnVfYmeDI6dXzxdO8YhG5Yms6ttw=;
        b=HreosrrTuHx9bz20TjzoCHBMWjRcEQTB3k4nRm19gy6MWaAG4v+GSrhtDG6i21tWiR
         LAUdTqftyPsY8iQh5TPvP8m5BOdWg2VgnmzjfCn9eyw1/9IayP1Bz9eoEa5IL50mrSL6
         8j7ytqI9wlJRg6L3lj+L2HxJ85w2xcgb7J43gEWcX32qIWc4bFCQtorZQ3viTZxp4RLn
         NRpGXe5VMWjFy9Wm5oWcRY8et0zo0mDC+E+PmB+nn4yJV0JSSXTEuBNAF3TkCZ32zCNz
         3aEih8Wh3LTgRgxiKpt/5hFN2uRKPtCzVhrT4Jc933I4u1ODrN0HDHEJjI6BmwaS0yLi
         Z1wg==
X-Gm-Message-State: AOJu0YweSvGGWWjK4GxIvJacq04ktFeyD7hD3giUTd3TRwyvesZlPuhn
	/aEgcOsui7vse0F4BJUUwtys9Zb7S53pq2UFFKJ35HR9LOIff8nqBsoUqjO9PAeIpn4EMqRwIGM
	euWBLZbPlXtCOMM7IAHbEyVRlaKUaNtE=
X-Gm-Gg: ASbGnctlaMEnP19gpLnnSS/y/yy2xJG1TnTOZ3ENbrDGkjc9rqzBYaBrWPdroVLfevA
	SyNlykzgDWY+JVBBPOPxM17wJoRO8NS6lnvIXxclNwn+Q0JhRQ6k4ht98PkR7WiSIcnw1O276Fh
	zpUAPXZ6sYKQi7VA6AY0jis/NS9u2sgKLXLA+Q0V5Uq9rSc76L5etqk2xydfOSSqiY59nlfxG6B
	A974yz6km/cXEgoP4eHZIxbSHQUZ1qXKNPXvecT
X-Google-Smtp-Source: AGHT+IFnEaK7pXc5g0QCCwl6zy48Rtc2r93mnXviElBhEGPO3yGGRQ2rGwOFSdJvmoou1ZbSI/9Ge2vAPsljt59xSOs=
X-Received: by 2002:a05:690c:4481:b0:71a:2cb:db1c with SMTP id
 00721157ae682-71b7ef6619fmr18886697b3.25.1754086652694; Fri, 01 Aug 2025
 15:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250724170600.1113476-1-raj.khem@gmail.com> <d4128d48-9dda-461c-a932-d31edfe1f43c@cherry.de>
 <CAMKF1sqWyUx78Nqc=LsMPq4nLGMzSstV1XePH1hNs8b=vr+JjA@mail.gmail.com> <0bb1a924-2288-4034-a468-bbf358ff28b8@cherry.de>
In-Reply-To: <0bb1a924-2288-4034-a468-bbf358ff28b8@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Aug 2025 15:17:06 -0700
X-Gm-Features: Ac12FXyEH7mfNdo2bfTHRd0LRhS1yFzDWreCXuJkAHSYv_HR7ncj55TnY5MEdro
Message-ID: <CAMKF1sopDpP_ayPbJJ2A3VmVixJeSQBXU95PqPcLg8KGttOaUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu
 when crypto not in features
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 22:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221377

On Fri, Aug 1, 2025 at 3:49=E2=80=AFAM Quentin Schulz <quentin.schulz@cherr=
y.de> wrote:
>
> Hi Khem,
>
> On 7/24/25 8:32 PM, Khem Raj via lists.openembedded.org wrote:
> > On Thu, Jul 24, 2025 at 10:10=E2=80=AFAM Quentin Schulz
> > <quentin.schulz@cherry.de> wrote:
> >>
> >> Hi Khem
> >>
> >> On 7/24/25 7:06 PM, Khem Raj wrote:
> >>> When crypto is not in tune features then add +nocryto to
> >>> -mcpu explicitly. This makes the behavior between clang
> >>> and gcc match. Currently -mcpu=3Dcortex-a72 has different
> >>> behavior in clang and gcc in terms of what features are
> >>> considered default. Clang enables different set of common
> >>> features than gcc on other hand. For example clang
> >>> enables crypto with default set but gcc
> >>> does not, gcc recommends to disable unavailable extensions
> >>> in -mcpu [1] explicitly. crypto is optional on cortex-a53
> >>> and cortex-a72. This is not as common but Broadcom
> >>> SOCs in raspberrypi3/4 have dropped crypto for cost
> >>> reasons [2]. This results in illegal instruction
> >>> traps [3] [4] when building components e.g. chromium,
> >>> qtwebengine, weston etc. with clang using -mcpu=3Dcortex-a72
> >>> for rpi4 target.
> >>>
> >>> Adding +nocrypto makes clang behave like gcc does today. We
> >>> do have separate tune if crypto enabled cortex-a72 cores
> >>> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> >>>
> >>> They are added to default feature file since crypto extension
> >>> is available in multiple arm architecture versions e.g. armv8,
> >>> armv9. It is optional extension as per spec [5]
> >>>
> >>> Extensions can be enabled and disabled with -mcpu using the same
> >>> syntax as with -march, and have same effect thats why it is
> >>> intrumented via TUNE_CCARGS_MARCH_OPTS
> >>>
> >>
> >> I believe this is incorrect. TUNE_CCARGS_MARCH_OPTS applies to -march,
> >> not -mcpu.
> >
> > Well, it applied to both in cpu specific tune files ( e.g.
> > tune-cortexa55.inc ) we override
> > arch specific TUNE_FEATURES and replace with then CPU specific TUNE_FEA=
TURES
> >   This results in  TUNE_CCARGS_MARCH being empty and TUNE_CCARGS_MARCH_=
OPTS
> > are still valid and they can appended to TUNE_CCARGS
> >
> > in conf/machine/include/arm/arch-arm.inc we have
> > TUNE_CCARGS .=3D "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS
> > }"
> >
> > Due to include order this append appears after the TUNE_CCARGS is
> > appended with -mcpu option in a mcpu tune file e.g. tune-cortexa55.inc
> >
> > TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', '
> > -mcpu=3Dcortex-a55', '', d)}"
> >
> > so in the end we get -mcpu=3Dcortex-a55+nocrypto or
> > -mcpu=3Dcortex-a55+crypto in this case
> > if you were optimizing widely for an arch then the effect will be via
> > TUNE_CCARGS_MARCH and
> > TUNE_CCARGS_MARCH_OPTS
> >
>
> And there's no world where we could have both cortexa55 AND armv8-a in
> TUNE_FEATURES?

cortexa55 tune files overwrite TUNE_FEATURES and armv8a will be gone
from it. In the unlikely case of such inclusion
-march then becomes ineffective.

I assume this doesn't make sense? If it does, then we
> could have -mcpu without the +crypto and -march with the +crypto, I
> assume this could be an issue? I'm probably overthinking this though,
> aren't I?
>
> > I do wonder whether renaming both TUNE_CCARGS_MARCH and
> > TUNE_CCARGS_MARCH_OPTS to something more generic could help lessen the
> > confusion. It's there because we have -march and
> > introduced -mcpu options later on.
> >
>
> It depends. If there are some scenario where we can have both -mcpu and
> -march specified, then:
> - if they can have different options (I doubt this is legal), then each
> have their own _OPTS is desirable,
> - if they cannot, then the options likely need to be repeated for both
> mcpu and march
>

internally all these extensions translate on top of some -march, it
could come via
-march or -mcpu.


> If we can have one or the other (mcpu/march), then renaming the variable
> so its name is more generic would be nice indeed :)

Yeah, although a mechanical change, it must be done carefully.

>
> Cheers,
> Quentin

