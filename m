Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91ABC54EED
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 16:36:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.78434.1674751005580457484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 08:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RUTsLCnN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id fl24so1535529wmb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 08:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UuI7OUIwr0drUce3OQ9SanqmbQeJIcq8niXH5TsewIA=;
        b=RUTsLCnNTsZ4DjuqGszK3Dm2nNpiDuS/weHloJLn3qI050HBzJhBleBlwzQXJWRMYn
         oZebIEAaAFYvR7qMZ3LgL2FykMtFvCqLmscuY/N4NF/ENUvMheRdup4TDN40wbRNBhhC
         stqNb2sBHLxnYUeP8UqDgVNjAtjIo4jCqpxuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuI7OUIwr0drUce3OQ9SanqmbQeJIcq8niXH5TsewIA=;
        b=OvONYmWx7FrNJMooryrX6ZYcDmVRh89yWQmcSDkrOMsH56Ttcjq0Z3gDxhUI9hLzgq
         v2M/x1p2xpaxumGgBN0nAbcFk9lnfrGt8YmmazOIC324efO44YDKTnbRfbsM+SguJEDM
         tapRvKnTRYvupKioejAmU3B1+U7SBTozUbCB1G5d4qQ6ODbgfUsvZuJeb6hC7OpcbK5Q
         I9suUtTSIIN2A8D03KJr5GtSRQhtPmBHv4RCT9OjmA2bGfGFwlyRmQdYfbp3pwTON0F9
         9Yw44Xb100JBjfeNvAgvE4yxGPNS60jkW2CRZ5sdAYUNGOpLRSfJk8r/E1fieTNDUmwy
         kA3Q==
X-Gm-Message-State: AFqh2krycG2rHpAyb3toe8CaBAbcIB/WI86lSpS2ixAtjNpx44B024Qs
	EZkeJWIu5yF3ySv2T/AAY+P8O6subaFp5432
X-Google-Smtp-Source: AMrXdXtBBe/cJjecWb+8kZNGfIRJoVx9aoJ2ZJh7VlG0rnoZpa2VCzewQt5ff82G0PBxygDaNZXJCg==
X-Received: by 2002:a05:600c:1c1b:b0:3d9:ebf9:7004 with SMTP id j27-20020a05600c1c1b00b003d9ebf97004mr34331668wms.29.1674751004058;
        Thu, 26 Jan 2023 08:36:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003dc0cb5e3f1sm1739195wmp.46.2023.01.26.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:36:43 -0800 (PST)
Message-ID: <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2023 16:36:43 +0000
In-Reply-To: <Y9Kol1jla2OQMzOa@mail.local>
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
	 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
	 <Y9Kol1jla2OQMzOa@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 16:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176407

On Thu, 2023-01-26 at 17:21 +0100, Alexandre Belloni wrote:
> On 26/01/2023 12:39:02+0000, Richard Purdie wrote:
> > On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >=20
> > > Richard,
> > >=20
> > > As promised, here are the commits to switch us over to 6.1 as the
> > > default.
> > >=20
> > > I'll also send a series for poky to bump things there as well.
> > >=20
> > > Also, if there are any significant problems, we'll just shelve this
> > > while I look at any issues. But at this point, it is worth getting
> > > the patches out there to move the needle to 6.1
> >=20
> > Thanks!
> >=20
> > I think the issues are:
> >=20
> > a) two selftest failures:
> >=20
> >   oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_virtual_kerne=
l_modify
> >   oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> >=20
> > b) meta-arm issues
> >=20
> > c) meta-virt issue (which you have a patch pending for in -next)
> >=20
>=20
> Unfortunately, I have to add
>=20
> d) perf reproducibility issues:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2294/s=
teps/13/logs/stdio

Ahrrg.

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230126-poma_o8=
v/packages/diff-html/


/lib/modules/6.1.5-yocto-standard/build/include/generated/compile.h

from

#define=C2=B7LINUX_COMPILE_HOST=C2=BB      "alma8-ty-2.yocto.io

to

#define=C2=B7LINUX_COMPILE_HOST=C2=BB      "ubuntu2004-ty-1"

Bruce: Any idea if we can set that to some specific value?

We probably should start by fixing that and then see if that improves
things...

Cheers,

Richard





