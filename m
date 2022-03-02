Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A78BC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 19:04:51 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.1622.1646247890805440969
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 11:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yw2SPrJn;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id s15so2532114qtk.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 11:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFNhtyoBByq5V4JwYTWEfdvW8bNW7jkuAispoOi1wsg=;
        b=Yw2SPrJnkHWa/xwsftuK2QeA+jmYOI1HO8DN1IrUpgx2pzDF+QE+O5Rpao6AhN1PdC
         ml2cSvpp2qzc+tVg/3dE6pdsYFAOXkXIMeqB2o4BjysCdUH5OhJDHQgSH1OlxK2ktzrO
         w1eJLBz1USI94fwAHwNxEbwuBcFo2bQSTvk+ofyEjBf+Rb/rt0CuoE5tbTLsPDobyDQw
         FmnQEay0gkzqcJPZeyaCa6QKxYrBpAnKjBTEZYfJ2Y029pONqIQmf3zjlTZs+dLN3tLT
         mTF68hMexT+aQRWD8ndstHz3xQ5T6wfoW6YsjB47r3Fb+dzRPCbehDHGlpxI8rsRb3kJ
         cahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFNhtyoBByq5V4JwYTWEfdvW8bNW7jkuAispoOi1wsg=;
        b=bQe4Hs6FTPzBItr5EPZJw9nKam/YKKpMDq2PBivFe9ln3SM5OP/hnBP6oIVqCNFt9C
         2lqYs5GlunmO+E8tz/GLUaE54+PzuewiHs21cOISEwF0I9xrLYVhdK0cr11NHDIJBy4b
         V+5m27o7i99geUdtoJ8jPfR1fbyfYn+l/q34UBj0q6CKd+E0YDIZ1tfO5srAxjCjLs0L
         VXk6BeV4c7Qyix2U9tqjKuhHiu8reTmNDKCvue9vgy9cHlaszOGV2iKvOGN8MnAI9/Kf
         v+/GdG2YPHQZrdkNvo6Yl8HnA+N5ROrX86S2/q9LKhvlPIzJ32hLOSaN28xtBRIDEwBH
         gm2w==
X-Gm-Message-State: AOAM531KM4T04qqZRaGawyehvgWBMzZ+EU40rpwaLTZkEhh8n1/1vN3a
	rVG+GbHmSjbNThZHl3R1LAQOASVtBvJ8M3TXSx8=
X-Google-Smtp-Source: 
 ABdhPJy6Y/BzRJwuj4JT4T8H9cIXJpqS40czReDmIv5imFqU5UqDEAwQtodO0Ytfu0X55rwb4YI8D9XAkEtqPUddZfU=
X-Received: by 2002:a05:622a:104c:b0:2de:377e:25d9 with SMTP id
 f12-20020a05622a104c00b002de377e25d9mr24812491qte.229.1646247889793; Wed, 02
 Mar 2022 11:04:49 -0800 (PST)
MIME-Version: 1.0
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
 <CAMKF1spreuzybUvdA-2o_J6Q4pFoFdSQMrc3LN89DWOs0BW7zA@mail.gmail.com>
 <16D881D0D78DCA29.25756@lists.openembedded.org>
 <AM9PR09MB4642BEA4F3119E5652ACD6E7A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1srTWtYeSO-0vcJ5=RM0xz+5BOoRse-vbyDqSJ6kk-MYqw@mail.gmail.com>
 <AM9PR09MB4642589C438F3ECB0598A6A0A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642589C438F3ECB0598A6A0A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 11:04:23 -0800
Message-ID: 
 <CAMKF1spJpdP13hcDD3KdENAjE_qEDn2gGDCzQxBw+v-ycou53Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Ross Burton <ross@burtonini.com>, Tim Orling <ticotimo@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 19:04:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162621

On Wed, Mar 2, 2022 at 11:01 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
>
> On 02.03.22 19:45, Khem Raj wrote:
> > v4 is definitely better than v3, I see one case it could address as well e.g.
> >
> > python3-pymetno produces PyMetno-0.9.0-py3-none-any.whl, so if
> > guessing code could address the case-sensitive piece here would be
> > good.
>
> I'm torn on this one, I agree that it would really nice to have in terms
> of a seamless transition, but it would require either some bash/shell
> hacks to disable case sensitive filename globs or some "after compile"
> renaming - I'm not sure how to tackle this.
> If everyone else agrees I would vote for "after compile" renaming to a
> fully lower case filename - any thoughts?
>

I think the suggestion that Ross has is a good one to install the wheel file
intentionally to a known location using --dist-dir and then use a more
relaxed regexp to package it.

> >
> > On Wed, Mar 2, 2022 at 1:21 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
> >>
> >> v4 is out.
> >> I tried to make it work with the dist-dir/bdist-dir option, but
> >> apparently this isn't respected by setuptools in all of the tested recipes.
> >> That's why I went with applying cleandirs on
> >> ${SETUPTOOLS_SETUP_PATH}/dist, that should do the trick as well.
> >>
> >> v4 is tested against all core python recipes, all the python recipes in
> >> my layers and a reasonable subset from meta-oe
> >>
> >> On 02.03.22 09:06, Konrad Weihmann wrote:
> >>> My bad - one of the brackets in the name guessing slipped...
> >>> Will send a v4 soon
> >>>
> >>> On 02.03.22 06:20, Khem Raj wrote:
> >>>> this is causing 100+ packages to fail see
> >>>>
> >>>> https://errors.yoctoproject.org/Errors/Build/142116/
> >>>>
> >>>> I suggest to include meta-python for wider testing of such changes.
> >>>>
> >>>> On Tue, Mar 1, 2022 at 12:14 PM Ross Burton <ross@burtonini.com> wrote:
> >>>>>
> >>>>> On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
> >>>>>> where the wheel file is called
> >>>>>> pytest_runner-5.3.1-py3-none-any.whl
> >>>>>
> >>>>> I'm thinking we should tell pip to install the wheels to a directory
> >>>>> we control and then just install *.whl.
> >>>>>
> >>>>> IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
> >>>>> it's clean on builds.
> >>>>>
> >>>>> Ross
> >>>
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#162595): https://lists.openembedded.org/g/openembedded-core/message/162595
> >>> Mute This Topic: https://lists.openembedded.org/mt/89472354/3647476
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>

