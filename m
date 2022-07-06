Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35A2C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 21:44:58 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.426.1657143893174688018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dZ+4TxiE;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id j21so28104246lfe.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcdUVv2Qw3sRZXe6IUHolNRure8dfDZVj8S920zCbhY=;
        b=dZ+4TxiE1PUogWWfZYNaHt7q+ValLhrTj35VGaI2r6z3bDBGDx2UaC6axFqNZs4VaR
         rGZCFemAiRG3W74SS7aEUZC4YL0jWyICp/ZBDEv9tFNzgZMzOEXsoWYqzeMSMWxB0ekK
         bv/RoSASmRoOqsWgmA7nFvAo2kZ7y3RyOWk5iyMFlrnogPLFFSFEPNR9NKy2qhCA3Zz5
         PdUnxPCqMbTduVm58JYuHxmCH9DJjnsqqw3rWSjickzIcSaWbMPfAkT1pq1ONwuUXMlL
         J3+hVQHCIW+Z6fSj9TWfiiaQmAh8vKCLQ0ohA29xONLoSnbed11O2N/cWPviH4oyFnNE
         mBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcdUVv2Qw3sRZXe6IUHolNRure8dfDZVj8S920zCbhY=;
        b=W0noi9kx3VYKEkLAnjbd5Vh+jWpoZwutum/RI5ystlvyl6e/rB3MwbvFGf2DJyTreS
         TaOeCFWsiD2AoIKQs9jLLL5Q47oDp/gOXWJ/5WizWVCNm8YqoOiR1+qfgUtUXJ5g8wIJ
         V0gUnDaTIFdZ9rBvx6T8YTQC/5cZFOUZaWAF5GoPj5/4EzurPhZvhTkgfmjZg1DcDQIu
         aDowj41i3osuCbElvqMDsF49OVheYCSR+hrHNaLmKI2LbtNfp0LOXnHBy0me+uXT9LR+
         o5gr3UDI0D/alrg+7qZaNhdNzAHeFE9y4aIIhwfJTyQwQtmCjIP4+jq1ziBXgjR7vods
         MzwQ==
X-Gm-Message-State: AJIora++3+tOdSmokp/cyYKqInSDlrYjtq36luAdeqw4CIbT1o0Ui3BM
	1I+oPbBGvLkoRYYV6h1EeHBLg4/gtAZlaH7FMqs=
X-Google-Smtp-Source: 
 AGRyM1tTlbPJK+2Tf0xDwkQcr/QamfKU6hH8A2ZzsWgWzAJp4iNFn2/OTk+mtaHoLWkTg0qIuH144miI4wEk1DB+9sw=
X-Received: by 2002:a05:6512:3b26:b0:47f:9895:703c with SMTP id
 f38-20020a0565123b2600b0047f9895703cmr28853200lfv.395.1657143891388; Wed, 06
 Jul 2022 14:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220706195311.974830-1-JPEWhacker@gmail.com>
 <CANNYZj9RJP67u40+OmHD8u6Oykah7WUhpSOwgABis_EsFQtzeQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9RJP67u40+OmHD8u6Oykah7WUhpSOwgABis_EsFQtzeQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 6 Jul 2022 16:44:39 -0500
Message-ID: 
 <CAJdd5GZrA8oZ_kHUxiZgDSpuu2cEpRJkEOgjgN=DH7A9p5ORzA@mail.gmail.com>
Subject: Re: [OE-core][RFC] Layer Setup JSON schema and example
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 21:44:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167749

On Wed, Jul 6, 2022 at 4:11 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 6 Jul 2022 at 21:54, Joshua Watt <JPEWhacker@gmail.com> wrote:
> >  $ python3 -m pip install jsonschema
> >  $ jsonschema -i meta/lib/layers.example.json meta/lib/layers.schema.json
>
> Since jsonschema is not a standard module, we need to think for a bit
> about how and when validation should occur with tools available
> directly in core. I would like it to happen every time json is
> produced or (about to be) consumed, but then the module should be
> coming from somewhere, either from the host or from a native recipe,
> both look like not a great idea. Thoughts? Is this where 'oe-setup
> installed via pip' approach starts to show benefits? :)

Ya, for a 100% "standalone" tool, I'm not sure if we can do any real
validation in python without external modules. For testing, can either
add the requirement for the `python3-jsonschema` system package, or
maybe use python3-jsonschema-native?

>
> Alex

