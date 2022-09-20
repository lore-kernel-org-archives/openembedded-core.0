Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CFCC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 12:55:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.11479.1663678530084340821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 05:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XG92hwsW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id s14so2195301wro.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=F6Gz06SLwkrRW6P5FRRcejTdxveu+UZpRaqvu7hJGhI=;
        b=XG92hwsWk7T/SBkm2JzT4RREmQK1fAmlO4KMB2Ib+85/oPFec/eRZwJqOhX8+1Sryp
         9Vbkk/Yamq6p9fWJ0nQqBBRpAfhaicmHJFyvpung4dSHNS7h2jU9Z5fVkomAwdEQqMpG
         vqAtq51+PmdexQzhB3wmNo4sZ59YBWGYM0Ql4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=F6Gz06SLwkrRW6P5FRRcejTdxveu+UZpRaqvu7hJGhI=;
        b=dCy7kLKTkDUatrzgMgtUlBnYU/IRP3MJGXTa1FnZ4KrabjNSGKUO7+dTGJfulJOaPt
         IRpTD5zXysMqVaHrAiGJKTH+H8Dqr79BViVeyuuq4KyaqnNgaukD/yllhbOtld3u4Cck
         voLeaL+foSXmKNmRXHLvKIKM3KRGIVVjmgyzLRgOfqjopuI1ZKUrWLbmrH/iJj3YN0i4
         Z8m3Us418Ga6TkS8gO96SR0XpG+6fTz8o9yem9P2X6c2fsnTwbLrFheZSVb5AmyFNmsc
         gxRwK4fZL1rouVo2YTumMQofJvuy59IMLNW45qd+qGUD7p/5fl+hM+A9eYvQSgS1PEIf
         reuQ==
X-Gm-Message-State: ACrzQf0HAGUSGdyYoI8FGxkwPOdI32SlPMD01BDMseo7Z1sgBP1B90nW
	i7UHAqCx0KS0e7secewStoYDlQ==
X-Google-Smtp-Source: 
 AMsMyM6W3svt/Zv+JL+kxROtxH5ozFCxaJ9mirZ2GhwW3Lce1y1bf8nIAnxLrRgD0kaJKv7M+1Rkdw==
X-Received: by 2002:adf:d1e3:0:b0:22a:b9e2:8841 with SMTP id
 g3-20020adfd1e3000000b0022ab9e28841mr13637851wrd.184.1663678528397;
        Tue, 20 Sep 2022 05:55:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d363:331f:b5a4:a50a?
 ([2001:8b0:aba:5f3c:d363:331f:b5a4:a50a])
        by smtp.gmail.com with ESMTPSA id
 p8-20020a1c5448000000b003b486027c8asm17479326wmi.20.2022.09.20.05.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 05:55:27 -0700 (PDT)
Message-ID: 
 <aa9014096363f371afa9b472ea8fce3329d80eaa.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Andrei Gherzan
	 <andrei@gherzan.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2022 13:55:26 +0100
In-Reply-To: 
 <CADkTA4Oon-WbV8x+TTfhDH2eGo6yjoQpxPsE-RXuqU0u7OWx0g@mail.gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
	 <029dd3e7238551e5ff6c687a001988485c6a3687.camel@linuxfoundation.org>
	 <CADkTA4Oon-WbV8x+TTfhDH2eGo6yjoQpxPsE-RXuqU0u7OWx0g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 12:55:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170899

On Tue, 2022-09-20 at 08:53 -0400, Bruce Ashfield wrote:
> On Tue, Sep 20, 2022 at 8:22 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2022-09-19 at 10:28 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >=20
> > > Richard,
> > >=20
> > > Here's the next set of -stable updates to the active reference kernel=
s.
> > > I also have updates back to 5.4 that I'll send to the various stable
> > > branches shortly.
> > >=20
> > > I also have a couple of kern-tools fixes. One to solve a problem repo=
rted
> > > on the list about some directory structures (typically created from K=
AS)
> > > to break the meta-data phase of the kernel build. I've fixed that iss=
ue,
> > > then fixed the other regressions that fix caused, and have everything
> > > passing sanity. There shouldn't be any fallout, but I'll be keeping a
> > > close eye on things.
> > >=20
> > > I also have Khem's MDIO configuration change in the queue, along with
> > > a previously hidden kern-tools feature that allows it to not warn if
> > > something is 'enabled' (y or m).
> >=20
> > I have a patch in master-next I'm testing for the perf issue. On
> > testing that, this set of config warnings became clear for poky-tiny:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157
>=20
> That's very likely due to this change from Andrei :
> https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-5.19&id=
=3Dd334505d98a85ffe7549026d10e43cccd897e19c
>=20
> Was that a qemuarm64 configuration ?

It warned on qemux86:
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157/step=
s/12/logs/stdio

qemux86-64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157/step=
s/16/logs/stdio

qemuarm64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157/step=
s/18/logs/stdio

so on all the arches we test for tiny.

Cheers,

Richard

