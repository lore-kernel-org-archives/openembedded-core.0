Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9673C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 15:47:30 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.55095.1739807247507093942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 07:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HQitznZv;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2bc5212b2easo1783196fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739807247; x=1740412047; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpgcN4vxidIYtCpQBoCcvMCdqPKxqKqXVFJu7n3z8WA=;
        b=HQitznZvWXxm8T7UJOnVi4zgg2pluw1SMq2BscF7x5Fzn6WIj/z4/VGTj5nkqY8LSi
         aLUl19tS/CyMeHvbKoFM88skrGjHott0bg021aTKEhiAAFerGrZ7agJSAGNlaQSBIXMD
         gQB2LoYgqXn5MKrHigpNWeVHt7Rpw8QU2J5IL3CL9Vrg3SiJdXhBqdh/WisE59hhboD1
         okmz3WTBaAm7uRx65VdhUCv/AXMNY6EU2RtrqyK38TM6BU8KRkCveMq+MYm0hrrSVx9H
         1epDU1Wd2MIF6klL3BT0C1qCZbKEHWgHAf7MVZ2VCXZ1BWupMxP9EBryp5vsJKUpdQwR
         vpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807247; x=1740412047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpgcN4vxidIYtCpQBoCcvMCdqPKxqKqXVFJu7n3z8WA=;
        b=OoQGYEx8w4lhAGBYzmp1Ye+0wSctVKp6LiaK4dpcgim1eUvK8H1Lnm6TbrMjRcb17S
         F2inxbgMorh60wBh2fCFL9Bky7q1QRrqxQ+4VwUPqrs2ZmqshSfOlJVoMBozlYNggF6q
         DgATU/kNOZrLeCpvI5vLA4QiF4SG82hiIOokHBjySPPERQ9X2UJHK0oZxGrWiBSCwM7J
         ws9EQlZgEdrx/zN25A08HQ3/HLQvS1LGkeHCO3iV4mrGeCj2NBk/LUOjPSbRY/8cDhD9
         jUWV4FTz4xoV5Q2ASbE/U9w4iPTie4VZcKuzT6xyLSLLTdDIHiR7MzXU18hoLCzSMOJh
         egmg==
X-Forwarded-Encrypted: i=1; AJvYcCXg2gK4NspU35mOxxgxCJ5f5BljDCxKLXjwUYH4Fefijzb7/Gr9YR9EzaNbMSTTzSfC5Pjg5cAeP7RiiP/9u5og4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6kh1L+Kan4iDTkVUTWo8R4DnUazELxjgFpiorLzhw51wTuIMr
	36tbBM7Ns5POgsbu4C63d+iXWcjUNUFw6gqFxTFxDMqaVvzqFRtayS9z0vOMigqCHWpWmRmMBWo
	en6c+QgVvLuJVuvJMxpsoJFmqwD0=
X-Gm-Gg: ASbGncu2fOfq7PhhLFPKDttvTlqig52jh4a5W13SHIlDxiZML8/KFUu9fmpPWPn6X/v
	Oo2rocgy8aX/FIrcQ0e4sN5KQR3rkEvFTaP/4JpSz5arCkJBYVT4Rqachz2zcfFi/FoZb70y08N
	bqd3/l5LZ2Ik8=
X-Google-Smtp-Source: AGHT+IH12EhfznVhmA18ML0AkeV416QSyBVYys9fFYxZObAWa2yYSL2/Uw1yEH9iAc4j4xhQECNw4VZ0v45H+a5JHG4=
X-Received: by 2002:a05:6870:8190:b0:29e:499d:1d33 with SMTP id
 586e51a60fabf-2bc99abd2a9mr6202460fac.14.1739807246709; Mon, 17 Feb 2025
 07:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20250215204941.1453502-1-festevam@gmail.com> <D7ULRO9YDXHS.1QDCIQ63BGI8E@bootlin.com>
In-Reply-To: <D7ULRO9YDXHS.1QDCIQ63BGI8E@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2025 07:46:59 -0800
X-Gm-Features: AWEUYZnJu9nrl68Ylojh0IvXqLKGGBevQGpnJ18bn45gA1yO158YFuzroAlEDQU
Message-ID: <CAMKF1sr1MZ1d6hPMMezqQgyWe0dOdDd3CZHgp5KCiEANWJw8xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mtd-utils: Upgrade to 2.3.0
To: mathieu.dubois-briand@bootlin.com
Cc: festevam@gmail.com, openembedded-core@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 15:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211544

On Mon, Feb 17, 2025 at 1:11=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On Sat Feb 15, 2025 at 9:49 PM CET, Fabio Estevam via lists.openembedded.=
org wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > Upgrade to mtd-utils 2.3.0.
> >
> > Details about the 2.3.0 release:
> >
> > https://lore.kernel.org/linux-mtd/1b7a55a6-1c5b-4e86-8006-e2010e54367e@=
sigma-star.at/T/#u
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
>
> Hi Fabio,
>
> Thanks for your patch. However, I believe this is breaking some builds
> on the autobuilder, with the following error:
>
> ERROR: mtd-utils-2.3.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-=
worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/mtd-ut=
ils/2.3.0/temp/run.do_compile.2425952' failed with exit code 1
> ...
> | In file included from ../git/ubifs-utils/common/bitops.c:7:
> | ../git/ubifs-utils/common/defs.h:16:10: fatal error: execinfo.h: No suc=
h file or directory
> |    16 | #include <execinfo.h>
> |       |          ^~~~~~~~~~~~
> | compilation terminated.
> | make: *** [Makefile:4822: ubifs-utils/common/mkfs_ubifs-bitops.o] Error=
 1
> | ERROR: oe_runmake failed

you need to DEPEND on libexecinfo for musl and also add -lexecinfo to LDFLA=
GS

>
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1045/s=
teps/12/logs/stdio
>
> Can you have a look at this issue please?
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211535): https://lists.openembedded.org/g/openembedde=
d-core/message/211535
> Mute This Topic: https://lists.openembedded.org/mt/111205949/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

