Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0D5C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:34:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.80352.1674754487527810096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ILKv4KcL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id m14so2070186wrg.13
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 09:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PbFiU1+Fh3sO4fMEjTXfnmVPA2qEQxxg4iPcCwtwnRw=;
        b=ILKv4KcLCC+SJC7grEYh+T4hfuGNac3rK6+Q05eJe3LfDYAVqe8a/JLomon4aJs79d
         h6KQ/df9xIKbzYZ99Jl9ShGbroalJhnsZYHfRQVEkM0Jr0EDbJ8sffJk1OE+4VYWyv9g
         EEYLE8iu8irtE/8BTtYzPnVd3ubPdVxPeU3Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PbFiU1+Fh3sO4fMEjTXfnmVPA2qEQxxg4iPcCwtwnRw=;
        b=WW61kjx0sW+JH9pgEQNeJ6ASTWH/Gd4SW0vOAOB/oHAqtaB1rJeq0x51gUC06fBm4i
         gIDmVMp3E75ZOYniQ0NL2jUxpztKBQQwQcgQH0h9W9snKsNrC8FRJXbVtDNnPmsQX5F5
         65cbi+H23n87bkT8tUeHrX52jGCY9OTLFqZvoRC1KDH5iI6VGkHTiDjJyowW8DT1Mmip
         zghdkjiPIyepFQT13YcEu/Is2cBsBTd5m4F29kuvpMOp9CMC0ery+EtxvASyj4HqfJHb
         P8HJ8pK2oKv+xtb+hbeNS3yGpIPrijoITWqjoKreN3htAMz6K1K5p41vCB6UhcDuG1Uu
         nFTg==
X-Gm-Message-State: AFqh2kr58g3pPQF128WHWUlKJEqZOqIMe5GqyY7PggwBHC1p4iF/OUmQ
	c6K0H1VdANJFU2KQ5yhGnTIctA==
X-Google-Smtp-Source: AMrXdXvRwicfpaiSmKxCBqCzX+Tklm2IaxnTh44w3ccG1B+S9OGK7a0WNC9GCUlLAy+U/dgCs3OzoQ==
X-Received: by 2002:a5d:5b0e:0:b0:2bd:f83a:c270 with SMTP id bx14-20020a5d5b0e000000b002bdf83ac270mr40196140wrb.67.1674754485871;
        Thu, 26 Jan 2023 09:34:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d6b81000000b002bdc39849d1sm1774109wrx.44.2023.01.26.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:34:45 -0800 (PST)
Message-ID: <7fe4aec8467d9300169904c6e43431057ce3c017.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make
 6.1 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2023 17:34:44 +0000
In-Reply-To: <CADkTA4OBwOEc5ubqWb+zdk=ESv=eLXo1_X8hEfyX9o2GX4XcEg@mail.gmail.com>
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
	 <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
	 <Y9Kol1jla2OQMzOa@mail.local>
	 <a5a031e840a8af1b5c6f71c5747898ea420457e5.camel@linuxfoundation.org>
	 <CADkTA4OBwOEc5ubqWb+zdk=ESv=eLXo1_X8hEfyX9o2GX4XcEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176414

On Thu, 2023-01-26 at 12:07 -0500, Bruce Ashfield wrote:
> On Thu, Jan 26, 2023 at 11:36 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Thu, 2023-01-26 at 17:21 +0100, Alexandre Belloni wrote:
> > > On 26/01/2023 12:39:02+0000, Richard Purdie wrote:
> > > > On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >=20
> > > > > Richard,
> > > > >=20
> > > > > As promised, here are the commits to switch us over to 6.1 as the
> > > > > default.
> > > > >=20
> > > > > I'll also send a series for poky to bump things there as well.
> > > > >=20
> > > > > Also, if there are any significant problems, we'll just shelve th=
is
> > > > > while I look at any issues. But at this point, it is worth gettin=
g
> > > > > the patches out there to move the needle to 6.1
> > > >=20
> > > > Thanks!
> > > >=20
> > > > I think the issues are:
> > > >=20
> > > > a) two selftest failures:
> > > >=20
> > > >   oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_virtual_k=
ernel_modify
> > > >   oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi
> > > >=20
> > > > b) meta-arm issues
> > > >=20
> > > > c) meta-virt issue (which you have a patch pending for in -next)
> > > >=20
> > >=20
> > > Unfortunately, I have to add
> > >=20
> > > d) perf reproducibility issues:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/22=
94/steps/13/logs/stdio
> >=20
> > Ahrrg.
> >=20
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230126-pom=
a_o8v/packages/diff-html/
> >=20
> >=20
> > /lib/modules/6.1.5-yocto-standard/build/include/generated/compile.h
> >=20
> > from
> >=20
> > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "alma8-ty-2.yocto.io
> >=20
> > to
> >=20
> > #define=C2=B7LINUX_COMPILE_HOST=C2=BB      "ubuntu2004-ty-1"
> >=20
> > Bruce: Any idea if we can set that to some specific value?
> >=20
> > We probably should start by fixing that and then see if that improves
> > things...
>=20
> Interesting. In my local builds:
>=20
> #define LINUX_COMPILE_HOST      "oe-host"
>=20
> I'm building 6.1.7, but that shouldn't be the difference.
>=20
> The value comes from: classes-recipe/kernel.bbclass:export
> KBUILD_BUILD_HOST ?=3D "oe-host",
> and has been that way for a while.
>=20
> I'm also grepping for other BUILDPATHS references, but the QA test
> should have caught
> those if that was the issue.


I just realised that there are two issues, one is perf, the other is
kernel-devsrc. The compile.h issue is in kernel-devsrc and that did
reproduce for my locally just now. I'm not sure what is wrong with
perf...

Cheers,

Richard




