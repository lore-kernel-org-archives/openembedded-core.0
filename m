Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8D6C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 15:01:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.39760.1656687679003591066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 08:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iSZ/3I2f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id k7so3584645wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=AwrDbXag70lmPofPJ/t3Yi29LUCxWf50ZQYQjq2UYr0=;
        b=iSZ/3I2f+/Q1nD9SwxGs13FyV6d0XJnpPnqsUFHFjVK9mhxfynwR3NDQEHhu80mJKs
         EVIrf91S+3zq8oG7/rkXUzfQYjxqCwS/9JtM9nHGuma7kKJUPyFO9xX6nRwWXO5AZPDL
         gRdQa5FEr1ygo9O7KgmCLiqjU+9DxYtceIjok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=AwrDbXag70lmPofPJ/t3Yi29LUCxWf50ZQYQjq2UYr0=;
        b=zlq5L1u5zq57miziv6JAKPy55M98QyJS5oH4EQVe/IVT5lqQ+zt8FJaVuF7/ghY7A/
         C/Jy8vF7OPoBrNt63QvfK+xCPhPv+gcHSn3HYlls++F5hhDjY8KhFJwQt5z3DrBaaLOq
         UXsDRFAaZLmTFVlU9YhG7dK+lNIxVtk0yBo0QTGGZN7mkVlB2xqkHcKq7vMOyLl+viUu
         XevsvXHxgZS4oFQwSFXE3bWcQDUxpxIo1XX8PN62WyRNB3E0GbDYCQcR1I/afS+CqKZI
         lXVcvSj63TEvEMvW38sBm/UiJ2INYLpkzHPsQwsv8K/1bVSvFOxV+cxXd+jTo5nH53oS
         ti5A==
X-Gm-Message-State: AJIora/+lLpTLmZ1cxmQAz9ax/BCUDZSQWKklsg/ei5m6vR/vMiHmQf4
	7pBW3dpDYSYsybJhG9a8th5y7w==
X-Google-Smtp-Source: 
 AGRyM1uGWJ61kH/dg4wa3O4K4ebzvy8uuYmuVxVk7W6tiAdGF7fKODQ/a1h5FX2GCn32ObEi0dty4g==
X-Received: by 2002:adf:d1ca:0:b0:21b:a81c:47f3 with SMTP id
 b10-20020adfd1ca000000b0021ba81c47f3mr14042979wrd.22.1656687677372;
        Fri, 01 Jul 2022 08:01:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4bc1000000b00219e77e489fsm22045186wrt.17.2022.07.01.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 08:01:16 -0700 (PDT)
Message-ID: 
 <0f5a0dbb2359bb4fe02e6669463787e042463ff2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 01 Jul 2022 16:01:16 +0100
In-Reply-To: 
 <CADkTA4NAgvcGGoWcFOSUO74i8Fp7018ONvzy0c5ghpGowM7Gvw@mail.gmail.com>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
	 <16FDAC3178C621FE.2437@lists.openembedded.org>
	 <16FDB5A16CDF6390.2437@lists.openembedded.org>
	 <16FDB9E325C9E889.5468@lists.openembedded.org>
	 <694b9d319c6fa7a57807a188e5c8b27992a17e76.camel@linuxfoundation.org>
	 <CADkTA4NAgvcGGoWcFOSUO74i8Fp7018ONvzy0c5ghpGowM7Gvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 15:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167533

On Fri, 2022-07-01 at 10:57 -0400, Bruce Ashfield wrote:
> On Fri, Jul 1, 2022 at 10:49 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Fri, 2022-07-01 at 15:10 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Fri, 2022-07-01 at 13:52 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Fri, 2022-07-01 at 10:59 +0100, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > On Thu, 2022-06-30 at 15:16 -0400, bruce.ashfield@gmail.com wrote=
:
> > > > > > With conference travel and issues with meta-virtualization, I'v=
e been
> > > > > > behind in sending this out .. but I have been queueing changes,=
 I just
> > > > > > wanted to be around in case something breaks.
> > > > > >=20
> > > > > > Here are the -stable updates and the start of my efforts to bri=
ng
> > > > > > 5.19 in as the new reference kernel for the fall release.
> > > > > >=20
> > > > > > lttng-modules needed it's normal tweaks to work against the 5.1=
9 source,
> > > > > > but otherwise, nothing significant has popped up.  I have other=
 parts
> > > > > > of that uprev under test (libc-headers, systemtap, etc).
> > > > >=20
> > > > > Thanks Bruce!
> > > > >=20
> > > > > Unfortunately there was one issue the autobuilder found, a
> > > > > reproducibility issue in perf:
> > > > >=20
> > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-202206=
30-53gdlqxv/packages/diff-html/
> > > > >=20
> > > > > I've not looked into it other than looking at the above link but =
it
> > > > > seems some python paths are creeping into the binaries.
> > > >=20
> > > > This looked a little suspicious to me:
> > > >=20
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/co=
mmit/?h=3Dlinux-5.15.y&id=3D18f2967418d031a390a5befe855dd0faa8af70b9
> > >=20
> > > Confirmed that it is this change. Not sure why but at least we have a=
n
> > > idea of where the isssue is.
> > >=20
> > > I've also sent a patch to insane.bbclass to change WARN_QA such that =
we
> > > can detect this kind of issue much earlier in people's local builds. =
It
> > > may expose issues in other layers but those issues probably do need
> > > exposing at this point too...
> >=20
> > This breaks:
> >=20
> > override PYTHON :=3D $(call get-executable-or-default,PYTHON,$(subst -c=
onfig,,$(PYTHON_AUTO)))
> >=20
> > as somehow PYTHON is expanded to a full path, yet:
> >=20
> > override PYTHON :=3D $(call get-executable-or-default,PYTHON,$(PYTHON_A=
UTO))
> >=20
> > this works and doesn't expand PYTHON. I have no idea why, it doesn't
> > make sense.
> >=20
>=20
> urk. I'm off today for a Stat holiday (and Monday as well), but will
> poke at this throughout the weekend to try and come up with ideas
>=20
> first step, get geared up to test reproducibility locally, step 0,
> find my old notes on the subject :)

The insane.bbclass change helps as you don't need a full
reproducibility build test. It is basically looking for buildpaths
(TOPDIR) in the binaries.

In other words just do a "strings perf | grep python3" and if you see a
full build path there, there is a problem.

You can see if on the compile commandline with a -DPYTHON=3D definition
too. If it is a full path, it is broken.

Cheers,

Richard



