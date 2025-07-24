Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB00C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 18:33:29 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.1251.1753382005900503383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 11:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6WglARo;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e75f30452so10052947b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753382005; x=1753986805; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/+13pWz3S/ADmU8zPzF6OxKwlX4sR+EcSqa3YDCepw=;
        b=N6WglARourTgkF8z1w4EEi9rYHkuMLp/kXXs1PoTyzOg23WKp5Uxfl+vgXImK1mdqb
         5nIr+RZgPIWjOkACMSiJjcLLVpM6eMrjADR3k95TzvDeayD2tiaOUCAU9acVjQQpG2vc
         QWYgU1GGCEtdGhmWQqnUAGpfjDGA/N6RLZGVfTJ3yuO3LX7h31MUzAw3BgpUB7jcmAqx
         bqJhI1X6QKiU3/Imi3JV86n/md5wYh/CXRVjdFblg1gZ6AtzpBKIrYVi7QetynCUr7Eq
         NG66Bli7GdCieNC2M+icBTrXSVb0QpG0IeA/tJFODIdIUQ7J4MinE3qCbu3+JVT31IUH
         Y9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753382005; x=1753986805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/+13pWz3S/ADmU8zPzF6OxKwlX4sR+EcSqa3YDCepw=;
        b=SI8m/iDcXurL+Ea19Aee6UAiHhUGdZN6D9e0kCIIGKfnOFegpW3x/Nq6hYl+79gprY
         Q04l+1xAWENs3jMnA9F2CAq0WNVvQH66P2EEQWfdXL78rPSyTkBtuKfQsVvYHSxYvN1N
         zH46USeW5KVoAJA2TfZl4rY538xUOAEmlqk+MQGH845ivdEehijdFWMbFL2TNYlbgBXq
         wEX4JW4G1MVg2wrNAh4tiTrqlaKnMEwLDiW5vued0+yKg72kvrBOaX9ZGQ1rTIunxTmu
         aIb8+tavVevbf1Zf4JowKXCsdd5wiQHpNsqu4tMARUNw4oftLUlq07MUX5GSSmbXnjY8
         2GvA==
X-Gm-Message-State: AOJu0YzamOPMqCjxW+ANxM0Ohxe/61nTywp9Gm6KmhLDadwn2w3jEiQB
	Yya3qUTPDbtO88D3MU/sqw7LIOzVlpvEeR5moXEnQRwHzph1DrB5FaDN83XfV4aQEjRFHkCHEBJ
	Rlk/qb/XP5cEZepgFQTQ9tUGnIEaq690=
X-Gm-Gg: ASbGncvU0q7OkhTuzQ2quhByPzxk3tHQGkf+XRTLJb/KubJzcHWVhIGaEt2Wjjh9j4y
	b9Ba8uXC+CvuOPyyW+gjAoWhB2NS2XasDNB27WOqvpYTzGLDpUSJfkSZK5N6OYgQfvNicseAXOZ
	/08ScSKp7IZXgQRBe0bo9BgRhXWnqOQcqbbBN1YAW4pK9rUC//mfleDtQF43PwD+KJfMtl0LOxJ
	9F8QRg0gwUY4K1YdNpH21K4yqoG14w0oW+1yJaxsdZD4ZA=
X-Google-Smtp-Source: AGHT+IHslftgfV1pl88pJmS/FWkOkhgCUsl3WwLo267YDc7FPwozU0KKJker4bI70UCL+4muX78EYR6/ZueqMfD7flw=
X-Received: by 2002:a05:690c:6a11:b0:718:38bd:bb45 with SMTP id
 00721157ae682-719b43727ddmr103952637b3.40.1753382004759; Thu, 24 Jul 2025
 11:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250724170600.1113476-1-raj.khem@gmail.com> <d4128d48-9dda-461c-a932-d31edfe1f43c@cherry.de>
In-Reply-To: <d4128d48-9dda-461c-a932-d31edfe1f43c@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2025 11:32:58 -0700
X-Gm-Features: Ac12FXw0msXm_E9WUK9TFbqFk836djktKPJWa1hxdT5zsEL4xg0r2x3VRboWH9o
Message-ID: <CAMKF1sqWyUx78Nqc=LsMPq4nLGMzSstV1XePH1hNs8b=vr+JjA@mail.gmail.com>
Subject: Re: [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu when crypto
 not in features
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 18:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220856

On Thu, Jul 24, 2025 at 10:10=E2=80=AFAM Quentin Schulz
<quentin.schulz@cherry.de> wrote:
>
> Hi Khem
>
> On 7/24/25 7:06 PM, Khem Raj wrote:
> > When crypto is not in tune features then add +nocryto to
> > -mcpu explicitly. This makes the behavior between clang
> > and gcc match. Currently -mcpu=3Dcortex-a72 has different
> > behavior in clang and gcc in terms of what features are
> > considered default. Clang enables different set of common
> > features than gcc on other hand. For example clang
> > enables crypto with default set but gcc
> > does not, gcc recommends to disable unavailable extensions
> > in -mcpu [1] explicitly. crypto is optional on cortex-a53
> > and cortex-a72. This is not as common but Broadcom
> > SOCs in raspberrypi3/4 have dropped crypto for cost
> > reasons [2]. This results in illegal instruction
> > traps [3] [4] when building components e.g. chromium,
> > qtwebengine, weston etc. with clang using -mcpu=3Dcortex-a72
> > for rpi4 target.
> >
> > Adding +nocrypto makes clang behave like gcc does today. We
> > do have separate tune if crypto enabled cortex-a72 cores
> > are to be targeted (cortexa72-cryto) as DEFAULTTUNE
> >
> > They are added to default feature file since crypto extension
> > is available in multiple arm architecture versions e.g. armv8,
> > armv9. It is optional extension as per spec [5]
> >
> > Extensions can be enabled and disabled with -mcpu using the same
> > syntax as with -march, and have same effect thats why it is
> > intrumented via TUNE_CCARGS_MARCH_OPTS
> >
>
> I believe this is incorrect. TUNE_CCARGS_MARCH_OPTS applies to -march,
> not -mcpu.

Well, it applied to both in cpu specific tune files ( e.g.
tune-cortexa55.inc ) we override
arch specific TUNE_FEATURES and replace with then CPU specific TUNE_FEATURE=
S
 This results in  TUNE_CCARGS_MARCH being empty and TUNE_CCARGS_MARCH_OPTS
are still valid and they can appended to TUNE_CCARGS

in conf/machine/include/arm/arch-arm.inc we have
TUNE_CCARGS .=3D "${TUNE_CCARGS_MARCH}${TUNE_CCARGS_MARCH_OPTS
}"

Due to include order this append appears after the TUNE_CCARGS is
appended with -mcpu option in a mcpu tune file e.g. tune-cortexa55.inc

TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', '
-mcpu=3Dcortex-a55', '', d)}"

so in the end we get -mcpu=3Dcortex-a55+nocrypto or
-mcpu=3Dcortex-a55+crypto in this case
if you were optimizing widely for an arch then the effect will be via
TUNE_CCARGS_MARCH and
TUNE_CCARGS_MARCH_OPTS

I do wonder whether renaming both TUNE_CCARGS_MARCH and
TUNE_CCARGS_MARCH_OPTS to something more generic could help lessen the
confusion. It's there because we have -march and
introduced -mcpu options later on.

>
> If that is correct, then The whole explanation should be targeting march
> and not mcpu as we're changing march and not mcpu (though I assume they
> trickle from march to mcpu inside the toolchain).
>

your assumption is right. Although, now thinking of this a bit more. I
think we can rename the
TUNE_CCARGS_MARCH_OPTS as I suggested in prior email to something like
TUNE_CCARGS_CPU_EXTENSIONS but in the end they are march options from
gcc/clang's
perspective, its just they are instrumented via either march or mcpu

hope that helps.
> Cheers,
> Quentin

