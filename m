Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B52C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:26:48 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.12661.1660055206008469380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dT+QlzJ3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso9030988wma.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=xoyycSFFxvNUOv0FbU4QWWTG20J6g38JDLiaes1bbAo=;
        b=dT+QlzJ35u0FK3rX93GnJ/BLnVHU6iYsyaDVaQi6GhE/+E821UdKMoimssLKTwydlC
         zlNKe25KVANZyLAF3tCbNIG7TLrIbbtpmZnDQT/qeJny0RWkB+OOxpaBtN5r9DpotNF3
         5q/GH1tC6EBJnpvO31LPFYajugrdcfh11SdZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=xoyycSFFxvNUOv0FbU4QWWTG20J6g38JDLiaes1bbAo=;
        b=yd61rDRKRvEWGkIBQdsaVwFuDYHLfCwkj+rKSpbBSwf+o6QErMyWJiM+ue/m5Y78PN
         i6d8J/xVArRdToObIt14bcrBKSIjvOZTOk46Myl7e/LtRLqyXvYenVf1B+4nnHMAls+r
         y+YW7cggiVsWsOI9/oJfqBdvUdIM3rQq84qga4GxpvBoV4oozR3I1t2s2n1clr97V8io
         FjERrkHogB57vl9eBgCFB6ybwzFcWu/rOANeEXsMwgEMm+6DNSg7WJNXW0Vz0SD9l+7P
         lCYtoGuPGUmlXlQ4LV/6pX7xG6R2aasaYQjwkGfWdXi0W3VG8RqZvNUW8NzUBUjA0AaW
         Pimw==
X-Gm-Message-State: ACgBeo3DtBE0cFlZgr+WGmymMI8th6NkJqVVJzReKzTn45sO+2n5DIzS
	1O+KZpsRwDlIl8oxePBA9XWgTA==
X-Google-Smtp-Source: 
 AA6agR7DWd4SVXWctii4j+4X7IfhJ3iyctaC+kRa4pqy8lKDMUSKvMK/IGtC2qoW7jdyANCqyQJjNQ==
X-Received: by 2002:a05:600c:25ce:b0:3a5:a3b7:bbfe with SMTP id
 14-20020a05600c25ce00b003a5a3b7bbfemr1754763wml.115.1660055204444;
        Tue, 09 Aug 2022 07:26:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222?
 ([2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222])
        by smtp.gmail.com with ESMTPSA id
 n4-20020a7bc5c4000000b003a3253b705dsm16391109wmk.35.2022.08.09.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 07:26:42 -0700 (PDT)
Message-ID: 
 <8f42b33efeab6f5c631401871ec36ee4b9bc57bc.camel@linuxfoundation.org>
Subject: Re: [PATCH] kern-devsrc: Drop auto.conf creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2022 15:26:41 +0100
In-Reply-To: 
 <CADkTA4MNbF9my_zeO+Bq3P5fcWDDijyYe_vcuyUuze2bXeGwgw@mail.gmail.com>
References: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
	 <CADkTA4MBRL7JuLA8D32K1_CcyDMcRO=hfJyghPHyUZtwKw-nqA@mail.gmail.com>
	 <bfc1c1a5b9ac8093b409129b825c41696650f66a.camel@linuxfoundation.org>
	 <CADkTA4OnaX_jAn7GLbOVRSONWqTcMdc9Zk4Fg4ULdeUDEDjnXw@mail.gmail.com>
	 <38993922ecd0f4c3d774ff9fd5d4053ad80ea6af.camel@linuxfoundation.org>
	 <CADkTA4MNbF9my_zeO+Bq3P5fcWDDijyYe_vcuyUuze2bXeGwgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 14:26:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169154

On Tue, 2022-08-09 at 10:22 -0400, Bruce Ashfield wrote:
> On Tue, Aug 9, 2022 at 10:08 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2022-08-09 at 09:29 -0400, Bruce Ashfield wrote:
> > > On Tue, Aug 9, 2022 at 9:26 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Tue, 2022-08-09 at 09:16 -0400, Bruce Ashfield wrote:
> > > > > On Tue, Aug 9, 2022 at 7:14 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >=20
> > > > > > After this commit in the mainline kernel, the quoting is differ=
ent in auto.conf
> > > > > > compared to .config:
> > > > > >=20
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D129ab0d2d9f38b9d43df35235fc66c6740d6928b
> > > > > >=20
> > > > > > We therefore can't just copy one over the other or it leads to =
syntax/quoting
> > > > > > errors. We end up running make prepare anyway in all our tests =
so drop
> > > > > > this copy for fix 5.19 kernels.
> > > > >=20
> > > > > It is safe to stop doing this manipulation now.
> > > > >=20
> > > > > But I am curious, I was running on-target tests for 5.19+ and did=
n't
> > > > > have any issues, what is breaking that I managed to miss ?
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5=
629/steps/13/logs/stdio
> > > >=20
> > > > Basically any kernelmodule.KernelModuleTest.test_kernel_module whic=
h
> > > > was run was failing (which would run on any image with kernel-devsr=
c in
> > > > and a toolchain). It failed everywhere, all sdk qemu machines equal=
ly.
> > >=20
> > > odd. I never did see that same error, and I built and installed kerne=
l
> > > module for all the architectures.
> >=20
> > Did you use the oeqa code or something else? It seems odd you didn't
> > see it as it was quite consistent on my local system and the
> > autobuilders :/
>=20
> I run everything by hand, oeqa has always taken too long in my
> infrastructure, so I run the kernel tests myself.

You could do something like:

IMAGE_CLASSES +=3D "testimage"
TEST_SUTITES =3D "ping ssh kernelmodule"

and then

bitbake core-image-sato-sdk
bitbake core-image-sato-sdk -c testimage

just to run that one.

(I might have missed a test dependency which would need to be added to
the list in TEST_SUITES but you get the idea)

Cheers,

Richard

