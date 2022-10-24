Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF78EC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 19:09:34 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.222.1666638567923574601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 12:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ST31NZ7O;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id a15so9318083ljb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 12:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hif48Jak+Vnm8GJK7rbT2bmaQaYe2hL3BxGAgl0XPI8=;
        b=ST31NZ7OZeoDvsag375qVEXdCNsgi4U8H9cM9EYpRIpHX/VWGtZ0veBg25cz4L7rU6
         /bKFl1SyavhuwVvjUakcwU/m8iH46bWMwlCVAQAUFHFoeSKy6HjBZP4dx9gGxRr8Qwjv
         TTYpWkxKVgA4BJNciaI+yawmfPwzk//rLgYmpYyK0aHfqbCvQF/xTH8955TAybG4CtEu
         AiyCuCYNvxgLtcqVOtlnU2s75zhTI9lVLf+6j5UP2MlR8axN8OffH6SEzyX0aog3rRsN
         Fsw1/wHEfWvTpLmRjkX7koe8Tt43Hel068LJUahI250M2qvTDVppBZ1ijb4TrKIehcUx
         5uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hif48Jak+Vnm8GJK7rbT2bmaQaYe2hL3BxGAgl0XPI8=;
        b=Y06lFj95ECS5mZ72d7n0NIWgDfCZDYE/3aTdB7y9lyzhUge+49gR0cC4TOQrI2v7tl
         TrdbiQu42kBHQA9hOoUQEBzlXxLqPkr1CcHXkjMGSkyjpgmhZisvr+eao5T/XV5eOWMN
         c21dGND23KwzaA5U7Fqu4JwqPvEcee+AMGlfSCFCOg2RVhyZRvZqmfLMpfTDlIIO3vgX
         6cdprRwNUZMOsnO8UrOrc53/TcjG0zzVn2Y3jYy+cXOLvXRXWZfgN/Pnqkb14oFIKORw
         c9oCLGg0Zp2zEaBUJ9b5kDqAt4l3A/khmdk2NYAnB/ecwoOgCPm1ha9KECUXtZafgbcI
         3TcA==
X-Gm-Message-State: ACrzQf1GQIqhdMEE/WX7gNa87JFLX9VKNl/8cwOonPp8tKXbjsnzHBfR
	O7rBiYvnZ7/lyMKweonN4bfpkfyQxmHPEzNYwNU=
X-Google-Smtp-Source: AMsMyM5lSOpto6Bg2WmyTH+Exo0/FROG/uSTslI5Br1tsb6F6SKkOw4jEfb+LhZtxLYlZtTWRqLWL7DYWIzckCCEVpY=
X-Received: by 2002:a05:651c:1950:b0:26f:e54b:8c54 with SMTP id
 bs16-20020a05651c195000b0026fe54b8c54mr12066041ljb.108.1666638566081; Mon, 24
 Oct 2022 12:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <Byab.1666631419068358312.NzkU@lists.openembedded.org> <17211696138001AA.16920@lists.openembedded.org>
In-Reply-To: <17211696138001AA.16920@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Oct 2022 21:09:14 +0200
Message-ID: <CANNYZj-B=gp122iYz084JS-u735+rhnvTEAL0NSAP+jZzbHsnw@mail.gmail.com>
Subject: Re: [OE-core] rust: conflicts between Yocto and CC-RS compiler parameters
To: alex.kanavin@gmail.com
Cc: Anton Antonov <anton.antonov@arm.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 19:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172116

And yes, seems like we'll have to set CRATE_CC_NO_DEFAULTS globally
and fix any issues that happen because of it.

Alex

On Mon, 24 Oct 2022 at 21:02, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 24 Oct 2022 at 19:10, Anton Antonov <anton.antonov@arm.com> wrote=
:
>
> >   To fix the issue in our recipe we can define =E2=80=9CCRATE_CC_NO_DEF=
AULTS=E2=80=9D env variable which disables adding compiler flags in "cc-rs"=
:
> > https://github.com/rust-lang/cc-rs#external-configuration-via-environme=
nt-variables
> >   So, my questions is: shouldn=E2=80=99t =E2=80=9CCRATE_CC_NO_DEFAULTS=
=E2=80=9D be defined in the Rust bbclass instead of expecting that owners o=
f all Rust apps recipes would be aware about this issue for some machines a=
nd would add workarounds in their recipes?
> >    I've tried to add "CRATE_CC_NO_DEFAULTS" into rust-target-config.bbc=
lass, but it breaks building rust-native. Looks like we don=E2=80=99t defin=
e all the required parameters for native builds and rely (maybe not even in=
tentionally) on parameters defined by cc-rs crate. Therefore to do it prope=
rly there should be some logic around defining of "CRATE_CC_NO_DEFAULTS" in=
 rust-target-config.bbclass. I would be happy to hear ideas or recommendati=
ons.
>
> I'd suggest you discuss the issue with cc-rs upstream first.
> Historically, we don't want components making guesses about
> target-specific compiler flags, and end up disabling or overriding
> them, so that compiler output is consistent across the whole build.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172115): https://lists.openembedded.org/g/openembedde=
d-core/message/172115
> Mute This Topic: https://lists.openembedded.org/mt/94539875/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

