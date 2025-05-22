Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDD6C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:35:20 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.25468.1747924510367683125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nl/KOtEi;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so3964874fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747924509; x=1748529309; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqCeiYOeEoQAOITAxRZJJEgTnpN4DeW0mwW3QIQCHAo=;
        b=Nl/KOtEiuSXN8PCqIqqNXl+tTlzYhJXaDaEZfB48tsX/dwnig7gWfgfWmFVKK9xXXd
         4hK1/HOJp+NXp4qYKrV+43JAmYn5wz0DodZyxJ7GlG7617Blljp1MJXE4NbXVda2zpwt
         m2m7WjsHLpZnZMaPRdZhE+muL5gPRQPPpjHviE5SogNJ4D18+jVMu4QamwdeER1y7AaL
         U/eyVG+71P2b0bDPsSmpSVqx0gChA+2LVBP/RQbq6RU1tO2OX2Jqby6FnKnSTZkjZcdZ
         s51Kxbqj/4yv9FChNbKqyIFYnFrgZGR0N7rexBxNQgRpM53JcCXgH5DNOF2S8F+ZT7Kq
         +x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747924509; x=1748529309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqCeiYOeEoQAOITAxRZJJEgTnpN4DeW0mwW3QIQCHAo=;
        b=fZ8d7ygH1hwl6hxOOUi7vDVEIV1fSoobgWY//K0cEs9wg/EFWMJ7b1wuuqN9ILdblD
         DIq2CDpvVJo83cghcCMK0KMVvVJo4g7wVnjRknUpdScZhpi3C2OjE6xsgUdXxiCtjCyB
         0B4MVr/fWQcbiOZNA7g3vNzvltRX1w3squUjaR/NejQC/Jr/zKYNo5c7hXczRImrT90K
         7/kuIytn8lhptxIn9f67LtuLTCxccVpHI1OQ0/0litfCvXM3nKWgAtzrk8RGmFZQ5NOe
         +WI1Eip+IvkUVQ19zyOTq1b8HTLEpetF34E65A3tayAiQBNcdpYnkk0L8kwEL9wKpeCJ
         UTEA==
X-Gm-Message-State: AOJu0YwZttoF1zqHIWDbSCbvj1MEe75MQLg+O2Rh6Jf9ARAbEooW8mnE
	Q5uMP0XNN3nEOJihnFNPyAYNE6XmRFNKeAkHKdBw7dmatI5FqsJPYNG9wwJmh3ZAOGHLUZUESk1
	+9ldBqFBeJAe9GDnzrfUJGDqsfwkBYSY42gLv
X-Gm-Gg: ASbGncsGFd9EMqAJtR/YqkCn1XgyM55p001CyNiB+hfoGRhCzhRHRbudHQIPaiyt0KE
	/xhcufgJf6l0ca6Ogp0odH4T2MubXjAzjruueeyAz05B2bDtg0ak8B6TXNckrT5k5IceSFFLjcO
	iFy4pbuzZGwJaXNDoLKPJjWTyksGLDlNg=
X-Google-Smtp-Source: AGHT+IHl2ANyM+tjCOGehEyox6+88j6iZ87MxWWkS1QZCpvRBM8S5UCAZWRdWSphlqWziQUaOgrMjdjJHXEubIXXZeU=
X-Received: by 2002:a05:6870:a2d1:b0:2b8:608d:5dd1 with SMTP id
 586e51a60fabf-2e39bfd2338mr20024481fac.18.1747924508991; Thu, 22 May 2025
 07:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250521162632.27169-1-reatmon@ti.com> <CAMKF1spnAHWh=gytPt=vfaFBh81A0VRxFvWqqZnWk07YAQNSVw@mail.gmail.com>
 <c97759ed-254e-4154-85ab-7f653bf34617@ti.com>
In-Reply-To: <c97759ed-254e-4154-85ab-7f653bf34617@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 07:34:42 -0700
X-Gm-Features: AX0GCFsfzQ7oksgLK9hwp6HyqxWi0KW898YqxOy0DZDM1Orc0AfogWA-nbu8oy4
Message-ID: <CAMKF1srxrrqLR139_e8DUMDpjeijHqJCVmNL-8fseC8V95j7rg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sbc: Fix for gcc 15 compile error
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217111

On Thu, May 22, 2025 at 7:04=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 5/21/2025 3:27 PM, Khem Raj wrote:
> > On Wed, May 21, 2025 at 9:26=E2=80=AFAM Ryan Eatmon via lists.openembed=
ded.org
> > <reatmon=3Dti.com@lists.openembedded.org> wrote:
> >>
> >> With the move to gcc 15, the code is not generating a compile error.
> >>
> >> ../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
> >>     error: too many arguments to function 'sbc_analyze_eight_armv6';
> >>        expected 0, have 3
> >>
> >> Simple fix is to drop the C standard down to gnu17 to avoid this new
> >> error.
> >>
> >> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >> ---
> >>   meta/recipes-multimedia/sbc/sbc_2.1.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-mul=
timedia/sbc/sbc_2.1.bb
> >> index 5aaa52313f..8b91e7e65b 100644
> >> --- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
> >> +++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
> >> @@ -19,5 +19,7 @@ SRC_URI[sha256sum] =3D "426633cabd7c798236443516dfa8=
335b47e004b0ef37ff107e0c7ead32
> >>
> >>   inherit autotools pkgconfig
> >>
> >> +CFLAGS +=3D "-std=3Dgnu17"
> >
> > maybe changing
> > static void __attribute__((naked)) sbc_analyze_eight_armv6()
> >
> > to
> > static void __attribute__((naked)) sbc_analyze_eight_armv6(const
> > unsigned char *buffer, int size, int channels)
> >
> > in that file helps ?
>
> Likely that would help.  I guess the philosophy question is...
>
> Patch the source code  vs.  Lower the C standard to match what the
> existing source was developed under?
>
> What is the preferred method for handling things like this?

I think it's subjective. distro hat on you want to do minimal changes and
perhaps pinning to C17 is fine, but we won't know when to remove it unless
we put some markers so its technical debt we will carry

However, fixing the package itself is paying the debt now and helps the
ecosystem but it does mean some extra work in upstreaming the patch
I know you have already reported the bug but this is one step more to
provide a potential fix as well.

>
> >
> >
> >> +
> >>   PACKAGES =3D+ "${PN}-examples"
> >>   FILES:${PN}-examples +=3D "${bindir}/*"
> >> --
> >> 2.17.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#217048): https://lists.openembedded.org/g/openembe=
dded-core/message/217048
> >> Mute This Topic: https://lists.openembedded.org/mt/113232263/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

