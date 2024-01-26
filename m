Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CC7C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 18:16:50 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.558.1706293005989319557
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 10:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TlnGd8QV;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ddb129350cso786205b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706293005; x=1706897805; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6BSWgpmYU7e/ufn807+ySTGXtPtyRYVyPvmSyaGnn4=;
        b=TlnGd8QV5pPy7TTMVPvNSec49ZWq1ylnMp58R/4S1NrY/TSDT7VJQH4aP+w7ZjGHUm
         NiTpKj4u8dg+xcJAY3JyHE+iVOimDC/6G4LTx/Yg90En185xINI6YrniB+OwePl4YV5E
         eVGepf163c38jjladM6LVccI36G2FCb5YqBjTzYKNsliEDKCcWhiF3kBAhQoQpbMdNaI
         98YgnPT1ri6CT3o6dJeuq0cTP462wafK+IN6YX24bBIVTjet0vnzQdvInw4qZJ3XZV4m
         1iDucQ7OvLbXGFq7/I1oUPI/+u8OFTwj7U9AxykeaLq4ywCZ1CvnDHdSEaCdoyW5GmF9
         7S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293005; x=1706897805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6BSWgpmYU7e/ufn807+ySTGXtPtyRYVyPvmSyaGnn4=;
        b=KRWRL/XV/l0aoGGDBN/r2ay4v8HUxrwssUO5vZw7e5fYut5QEVd+lqF2HQyF3LDyun
         Znh3DybeQkrF0c3SqRjFZbJP2APm0DI+Tajy+p2Ri8auOhBxF1lQgjZpDTcv+vJwNy0Y
         vHMJBkqux+6tyG+rePIH/6nSXspAcHgN9zd0eMRfRsuacGQ0bfg+Hu6pd5NqarZFXA//
         auuhIpoVZF38New9dNTECtTVscjVLXsPCJOfD6ZGEAVM2KFkFMFePSR+XcW8QLpLdUhI
         X8cXdPER7sLMvaLzsA9+1lfggAgzhUX4GOap2eLY0l106EJRC6wBhgL/zntMb48bXfj7
         R7Ug==
X-Gm-Message-State: AOJu0YzRMprq+UATdOh5j84bXWjkSlEh2KZkGD9ev75vG74IHsyYT+0P
	qRswKWdHOHfDydsyQTDrIBYlm2HJGxjo6Rwzz6Wkm2MTjoSZLRHkXkG/ot+lzTnX3ewIWmXWMSH
	3EYSDmJMDp10QiuJbXW0qnfYWcB8=
X-Google-Smtp-Source: AGHT+IGdPjq3eXh83H1HRH0zIcT4X31jF6yf+byD4XcnD6JwfH886iK9uFRCbEZovz2kPyY1dHrW99ssY6OD4PQkOgM=
X-Received: by 2002:a05:6a00:99d:b0:6dd:83a5:a893 with SMTP id
 u29-20020a056a00099d00b006dd83a5a893mr263191pfg.5.1706293005195; Fri, 26 Jan
 2024 10:16:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1705698717.git.bruce.ashfield@gmail.com> <202401261645148133b0a1@mail.local>
In-Reply-To: <202401261645148133b0a1@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 26 Jan 2024 13:16:33 -0500
Message-ID: <CADkTA4N3212Em=JUdxs69=eBGRB62A5Hh7Fy77D75q9_fYzYuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/11] linux-yocto: consolidated pull request
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194401

I'll have a look at this early next week!

Bruce

On Fri, Jan 26, 2024 at 11:45=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Bruce,
>
> I'm not sur this has been reported yet, we are seeing those warnings for
> beaglebone:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8541/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7446/s=
teps/12/logs/stdio
>
>
>
> On 19/01/2024 16:14:08-0500, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's the colllected -stable updates for 6.6 and 6.1. This will probab=
ly be
> > the last round of 6.1 updates for master, since I'll drop it shortly in
> > preparation for the release. 6.1 will of course continue to be updated =
in
> > linux-yocto and in older releases.
> >
> > I've also reenabled my CVE update script, if any of those commits don't=
 look
> > right, feel free to toss them out.
> >
> > Cheers,
> >
> > Bruce
> >
> > The following changes since commit 7af374c90c349af2c7ae9cf7d4fa14eeeb23=
b108:
> >
> >   build-appliance-image: Update to master head revision (2024-01-19 12:=
22:58 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> >   https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
> >
> > Bruce Ashfield (11):
> >   linux-yocto/6.6: update to v6.6.11
> >   linux-yocto/6.6: update CVE exclusions
> >   linux-yocto/6.1: update to v6.1.72
> >   linux-yocto/6.1: update CVE exclusions
> >   linux-yocto/6.6: cfg: arm: introduce page size fragments
> >   linux-yocto/6.6: security/cfg: add configs to harden protection
> >   linux-yocto/6.1: security/cfg: add configs to harden protection
> >   linux-yocto/6.6: update to v6.6.12
> >   linux-yocto/6.6: update CVE exclusions
> >   linux-yocto/6.1: update to v6.1.73
> >   linux-yocto/6.1: update CVE exclusions
> >
> >  .../linux/cve-exclusion_6.1.inc               | 34 +++++++++++++++----
> >  .../linux/cve-exclusion_6.6.inc               | 30 +++++++++++++---
> >  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
> >  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
> >  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
> >  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
> >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++--------
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++--------
> >  8 files changed, 92 insertions(+), 52 deletions(-)
> >
> > --
> > 2.39.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194066): https://lists.openembedded.org/g/openembed=
ded-core/message/194066
> > Mute This Topic: https://lists.openembedded.org/mt/103839206/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

