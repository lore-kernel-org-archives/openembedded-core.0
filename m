Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587E4C0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 21:00:24 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.1343.1689800414132790241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 14:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cU6ryTce;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so63197e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 14:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689800412; x=1692392412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ODFtX8yxWeKFE12kNG6PkS9sq3jTxLQYf/pX29v+w+k=;
        b=cU6ryTce5E3jpM63STYlkoVlmJzd/qWIcA2qDhs+rcSc2IuzwPEoFi3DPwhrka6Ptj
         xGdoMLECG5L0QBbP/xRyL6ozUret3jtaFpSMEMfZ7hzbaL2XG3N1dHwFx8Hi70BV3vz4
         UT2OUCX3bMv/A/4MGPmTlO47dFt9HqKnKJa9q2KEq/sIpouxgYfw7AbH+DoTeDyt1XRc
         inXP/q4irO1O0xmG/Dic+p3NW7aequUX8J3YkL/osz7JuD6qWT/Jxd1MQu6nxL8ku5Um
         62ov62sSQyg8kx2nvbPw+XjP4b7TMRFgeM+BtjMlSFB0O19j/ZJRkEC6bO2FAU7qDlrR
         BrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689800412; x=1692392412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODFtX8yxWeKFE12kNG6PkS9sq3jTxLQYf/pX29v+w+k=;
        b=k1q2wQrlsO88H6dOX5Zz83tKrN1hkmXXBJ9dWYTPUkn2sh4cAXcgXHoLbo0Bv7awUE
         BA2DSHWfTXPnImREvpXKNL7+Tl/tvFgLahn9LmbPV0fYo22Ah7ZRSj5tqvsU6fBmSRlR
         E8r+SI5o1u98stkNHtRdlONyMeZtvv46a4CozaAqFWZFX1WJluuI+tVhxGbtk60noRbo
         ZiRfXu1dbKM5ViLpNhbDiTvS4qrC1pH02rw7NB/u8AoWpYaO+vo7FpqUeZLe8Ok4+sWg
         MWjvVwwzMS00vO6bhOGCRPC95cmusJ8gp95VYCVf08StRZzFmYhhh8rOyv4o8HP2SNMO
         iZ5A==
X-Gm-Message-State: ABy/qLY9z9xJmIuGWlVeXRT9KdTumelTUNETDMAEVDbgHlJ3HDRnUHDk
	YkGnerK7i4dv7ZckypWMMQFswOY3889bre6Urjo=
X-Google-Smtp-Source: APBJJlGn3PN60g/LO4WpLU0n54KOwLByPy8tPOFFV5YREG5oOCiEI6lgIXRlbxGRfzcVfhwsyNahlrSAQP09hgkyMjU=
X-Received: by 2002:a19:8c56:0:b0:4fd:d32b:2338 with SMTP id
 i22-20020a198c56000000b004fdd32b2338mr128071lfj.23.1689800411423; Wed, 19 Jul
 2023 14:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230719200252.1203047-1-charlie.johnston@ni.com> <17735F6200BCFB48.26345@lists.openembedded.org>
In-Reply-To: <17735F6200BCFB48.26345@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jul 2023 22:59:59 +0200
Message-ID: <CANNYZj9X0mQn+bi758xiSAVa48d=NVEDBXCNkO89Fc37kWZ-OQ@mail.gmail.com>
Subject: Re: [oe-core][RFC PATCH 0/3] Add packagefeed recipe class
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 21:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184614

Specifically please take a look at,
./recipes-core/meta/package-index.bb
and
generate_index_files() in lib/oe/package_manager/__init__.py

I think we should rather extend these instead of adding overlapping
code which works differently.

Alex

On Wed, 19 Jul 2023 at 22:39, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> You need to start by describing the use case. What problem does the
> code solve that existing packagefeed code does not? Can we rather
> extend the already existing code, its tests, and its documentation, to
> support that use case?
>
> Alex
>
>
> On Wed, 19 Jul 2023 at 22:03, Charlie Johnston <charlie.johnston@ni.com> wrote:
> >
> > Hello,
> >
> > I've been working on a packagefeed.bbclass to allow recipes that define a feed. I have a working prototype which has been tested against poky using all 3 package types.
> > This is my first time submitting this type of change, so I'm looking for some feedback to cover the gaps in my knowledge.
> > Are there tests that need to be added for this type of change?
> > Should this type of recipe class be SSTATE cache enabled?
> > What documentation changes are necessary for this type of change?
> >
> > Thanks,
> > Charlie Johnston
> > charlie.johnston@ni.com
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184611): https://lists.openembedded.org/g/openembedded-core/message/184611
> Mute This Topic: https://lists.openembedded.org/mt/100243054/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

