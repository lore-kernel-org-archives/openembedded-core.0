Return-Path: <matt@madison.systems>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5A919785A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:09:14 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id c80so33296516lfh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ED3vEV/0peWPFVUxGi8bMpUYrB5QW9TfOQ4RLEpUclU=;
	b=vVx6BXdOroXadfULokhsNx/rFK0XNo4oBVhASDaSbht5rsam1uoH3nxxhWPdY8GZ5S
	5ZsYiCc0uSyeXyl7136xVkml6FVmRKVHNiF3mZcdhwc4ZJd2fRWwe+Ge0weVxN0MX1UJ
	YfkTKSWbVma2tNE6UXn6qh9MN590BwpxaNbO/0GBZk35R9S/kNdlo5RZaMZha/ncxTZC
	Rtq7lo336vmVyZI0sdG1Fb62bq15l4DR5H5avltnYQryR5RiIP7Z0ajzsf0w5Lr4WnZu
	cY4Zgsf5eAgCMm6m16ppfKxLohPkpTxfME7lXPu31CpdjTgoXk7JyzU0r8E61BK38ZPN
	8u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ED3vEV/0peWPFVUxGi8bMpUYrB5QW9TfOQ4RLEpUclU=;
	b=IPisiTq3D0S09NFkZOFEN0JIz3QiMoNZxdWoEUpXbv8qE8d/MbVHwTjQK3xO6Uuaal
	J8VEmHyWBOnlorwgdsaxO17WKto2SgRNyGtOTJCUjUDZfuaj/d+Pz7YToSdFCRv1KoJQ
	Mq0TMiam/A/Hx0W3N9gWtM0llzx743KZbFQxdVlNhbu2GKEfnqZZxto3omN+W4ffMivp
	aouUGqWpLziCITX+YTBHAim7T1+m5q1azwQGljKT2h866i7YbpNonXUHdPlmveHc7ZM+
	JcqryIeAEZTFNrhvuB1dqG32ONdDrJI1ZVOKuLy9oRcJrtftBU0FryGE4PxvgyxeJo2T
	y97A==
X-Gm-Message-State: AHPjjUhqNbiEmgzjy1d70/fjPFj0uXe3lNlhjS7dOVeXJ8ZD9U+4jfe7
	x1eLmkgbWEVzisltISKjrfZdoxwd7qYqkOVNdhdVS16K
X-Google-Smtp-Source: AOwi7QB0UAKMu7OCUX3rH9dilhSXbUyiluOwvhRFZ5pXAYMUuHpvS9JStXjrGTVwbApqvrzPTOMupHDp009CduNuD9U=
X-Received: by 10.46.66.145 with SMTP id h17mr2243844ljf.140.1505300955028;
	Wed, 13 Sep 2017 04:09:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Wed, 13 Sep 2017 04:09:14 -0700 (PDT)
In-Reply-To: <CAMKF1sphM28T3CC1hkb9Hi8MbGGweBC-Q9YKQTy3J4jnVt8FGQ@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<20170912125031.4009-7-otavio@ossystems.com.br>
	<CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
	<CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
	<CA+chaQcSMj-47DzgRrwWoUGNyc4WKoGM72bqKSf1YZHO2sskpQ@mail.gmail.com>
	<CAP9ODKocG317bbmcnDvOGp5VJnAUsFy8DbRBVZ51a3akkg5tSQ@mail.gmail.com>
	<CAMKF1sphM28T3CC1hkb9Hi8MbGGweBC-Q9YKQTy3J4jnVt8FGQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 13 Sep 2017 04:09:14 -0700
Message-ID: <CAGgRHJoGOnasgdNytjLAv=De1SS=tdPKCi3+wLeehFQzHQB4ig@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Will Newton <willn@resin.io>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2017 11:09:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 12:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Sep 12, 2017 at 12:20 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Sep 12, 2017 at 3:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> Seems like this version was already picked to master-next, so probably
>>> better to leave as standalone change now.
>>>
>>> The version currently in master fails to build for arm with thumb enabled:
>>> http://errors.yoctoproject.org/Errors/Details/155765/
>>>
>>> Is it fixed somewhere in this new patchset?
>>>
>>> # github.com/golang/dep/cmd/dep
>>> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/go/pkg/tool/linux_amd64/link:
>>> R_ARM_THM_CALL, are you using -marm?
>>> WARNING: exit code 2 from a shell command.
>>> ERROR: Function failed: do_compile (log file is located at
>>> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/temp/log.do_compile.13531)
>>
>> No, it is not.
>>
>> It seems that Go, when using CGO, does not play nice with Thumb. Matt,
>> do you know if there is a known fix for it?
>
> Disable CGO for thumb, we have a variable to select cgo

Yeah, I don't think Go handles Thumb at all. Maybe we should set
ARM_INSTRUCTION_SET to "arm" in goarch.bbclass?

-Matt

