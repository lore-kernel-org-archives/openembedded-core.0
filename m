Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA502C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 11:47:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11342.1670500018589597987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 03:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QvgIkCjX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id u12so1289262wrr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 03:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s4xlD1kYBP18Lw65fliS+afmjJMZ6PcrB/dulRZ1rY=;
        b=QvgIkCjXWvA792WewpreF1PQRBJOBFqpgeGGTYtW36OZ3TblJeYzHS7xIcTHnVtlsn
         r1fl2Bs48ua94hi7mzMPkiT+NfoKjM+KbNfkeWJdZ4pprF3rwb4NmNfSJflyHt2a1gau
         WLFQqkLDJGH3bMqrs2fMj19B5v6wvziKobWxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2s4xlD1kYBP18Lw65fliS+afmjJMZ6PcrB/dulRZ1rY=;
        b=iT/ca4IQMEhxnr0NoZrStaGRs0Z9YDvoa1RHmgMiMAlx5dFEityczGizxxA2rmZMAG
         +odX2oXPWkeTHoCMfirajejsF2xPgO0hG0ASr2prIshutB7XRIjxskD/gBRx65J9gQRO
         UzGELstGLPo8+LwoV96NWJoBNHkUPMsB2OkWL/fD6LzNvjpx/HezYQwj9QagE8WJRKrP
         VtcXp8ACiySt11owkONQnl6aGEvkaTqUbZ/hOhPP5bxtuXxLJQWNSTSFWAdbm0ORZpfa
         9uLX5/ivthog5RshDtlxJ10pcsKdq5iQB5De9wxzi54L2ZepeGwZfONm+7GAVuyuRkXu
         fV5g==
X-Gm-Message-State: ANoB5plsuR7Ex98soc3Udk08BLFHuKAP302IjT7LxEe0apk5e9BMZWmk
	5LH/Az+NAwmfzJYKn1hbCT7Apg==
X-Google-Smtp-Source: AA0mqf6xkdyW4nMmvCsFRM9ICLlkv6VX/7DuXE/5/xjmxzz8eK10WvWGsaXQDd8MW4thPO44hzHFbA==
X-Received: by 2002:adf:fac5:0:b0:242:2bf4:d6b3 with SMTP id a5-20020adffac5000000b002422bf4d6b3mr1143215wrs.40.1670500016723;
        Thu, 08 Dec 2022 03:46:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91? ([2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91])
        by smtp.gmail.com with ESMTPSA id b6-20020a5d6346000000b00242442c8ebdsm17074930wrw.111.2022.12.08.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:46:56 -0800 (PST)
Message-ID: <d1a79c7a320b7dffc26773efb7c647ec29d8084f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] How to run yocto compliance against
 openembedded-core layer
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2022 11:46:54 +0000
In-Reply-To: <PH0PR11MB5014D1EF18B80173A9C9EB30F1149@PH0PR11MB5014.namprd11.prod.outlook.com>
References: 
	<PH0PR11MB5014D1EF18B80173A9C9EB30F1149@PH0PR11MB5014.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 11:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174398

On Thu, 2022-12-01 at 02:47 +0000, Yu, Mingli wrote:
> Hi,
>=20
> There comes below error when run yocto compliance against
> openembedded-core layer.=C2=A0 Any hints?
> 1, mkdir -p /yocto
> 2, cd /yocto && git clone git://git.yoctoproject.org/poky
> 3, cd /yocto/poky && . oe-init-build-env build
> 4, yocto-check-layer-wrapper ../meta
> [snip]
> INFO: Detected layers:
> ERROR: meta: Can't be DISTRO and BSP type at the same time. Both
> conf/distro and conf/machine folders were found.
> 5, ls ../meta
> classes =C2=A0 =C2=A0 =C2=A0 =C2=A0 COPYING.MIT =C2=A0recipes-connectivit=
y =C2=A0recipes-gnome =C2=A0 =C2=A0
> =C2=A0 recipes-rt =C2=A0 =C2=A0 =C2=A0 site
> classes-global =C2=A0files =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes-core =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes-graphics =C2=A0
> =C2=A0recipes-sato
> classes-recipe =C2=A0lib =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes-devtoo=
ls =C2=A0 =C2=A0 =C2=A0recipes-kernel =C2=A0 =C2=A0
> =C2=A0recipes-support
> conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recipes-bsp =C2=A0recipes-e=
xtended =C2=A0 =C2=A0 =C2=A0recipes-multimedia
> =C2=A0recipes.txt

I checked and whilst we do check meta-yocto-bsp, meta-poky and other
things here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/6320

and we have another target which checks a variety of other layers, it
does look like we don't check OE-Core itself!

We have a bit of a challenge to run tests against the core since
without core, we don't actually have anything to compare it with. Also,
core does have a README for example but it is at a different level to
that from component layers.

I think the best thing to do here is accept the core layer is a bit
special but teach the tests to handle it correctly. I'll send a patch
which sorts this out. We should then add to the autobuilder tests too.

Cheers,

Richard




