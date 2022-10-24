Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE2CC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 19:02:54 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.151.1666638170379413847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 12:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KW9w3YoJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id b18so13923719ljr.13
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PToV667n4L4vZ3ow86ROy6wrwUDy1fesRuQMLbsXFII=;
        b=KW9w3YoJf4n5pSzOCeCIFTDZwlTAbMm0oKojBCmnp/3Kolhd0XV9WtdVu/KoafZY5x
         nLNp3HKAstRati1nzlmgLaGc/lTNptlMyXy2Z4izA/Xq+EF+L8Z+diQQJEe4emPDDpuf
         rlv8is9wAAs7ivFl88Kw4VQbXXV6muB2AvG0qXWWVdN2dD4dTjOzFs1iWre9gQaaCevf
         BzNN/2FPQZtP74BogaWUPcxKPvj7rICo479wWnKi0b9Y9b94/pAe+voNFKlgpikA42yR
         c92NeMHAs18881gCC1y2l1tTV8BZWRrulH3fdpeFfWOk9RT5v63m8GVdV72qqxBkwVXU
         c8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PToV667n4L4vZ3ow86ROy6wrwUDy1fesRuQMLbsXFII=;
        b=GpNoG93Co6g5R4v0kbGEUr9xydVoI7tSr1bs8sZ0h2ITEJqxQmvr0hXiOBnQUhJXn6
         lajWIFuGeFPso2ld9NqUUzLm0+M9ZaTRWDDz/V4qe87TY9+S4g5QeOSjdJ4ANIHyKeYv
         X1CuHvq27buHSE19QKb6U9vJN1XAzbjM7intVms1qzz++fNm7O3iePN5EbmFc0beNHiH
         SiKidOhpaiF1z5JDeutR5esVrDLebWAnhLRH0FVM2svmC2c7Jphhnh+dXMb4WPONAimt
         i7c5MZ7wF/mYA5sNyT3Soss9ZwQX+7BgvokxyTMl+9dsV+Aq2WRZO/lU23IE2omt1VdU
         dbjg==
X-Gm-Message-State: ACrzQf34iTGasfW3Sy4pb/KMknJEVJxj/2L/Cd8OsCNSm+5TmUmqu5NX
	dMscy7D661AVe++VzqcZkKPprIMnyNTDVy/Gkww=
X-Google-Smtp-Source: AMsMyM7hqXZ9qdis0loz8uStfY0lkfG5E71VVuG3WlxbRoTskjeVDtgvktif3yZogDd8THyLNYkw4DcYPK9ipRCW81M=
X-Received: by 2002:a05:651c:1950:b0:26f:e54b:8c54 with SMTP id
 bs16-20020a05651c195000b0026fe54b8c54mr12057793ljb.108.1666638168549; Mon, 24
 Oct 2022 12:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <Byab.1666631419068358312.NzkU@lists.openembedded.org>
In-Reply-To: <Byab.1666631419068358312.NzkU@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Oct 2022 21:02:36 +0200
Message-ID: <CANNYZj9rnMUQSgetqvuDsNR8mROvMtWUj3cPOF8C5kiOi5CdCA@mail.gmail.com>
Subject: Re: [OE-core] rust: conflicts between Yocto and CC-RS compiler parameters
To: Anton Antonov <anton.antonov@arm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 19:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172115

On Mon, 24 Oct 2022 at 19:10, Anton Antonov <anton.antonov@arm.com> wrote:

>   To fix the issue in our recipe we can define =E2=80=9CCRATE_CC_NO_DEFAU=
LTS=E2=80=9D env variable which disables adding compiler flags in "cc-rs":
> https://github.com/rust-lang/cc-rs#external-configuration-via-environment=
-variables
>   So, my questions is: shouldn=E2=80=99t =E2=80=9CCRATE_CC_NO_DEFAULTS=E2=
=80=9D be defined in the Rust bbclass instead of expecting that owners of a=
ll Rust apps recipes would be aware about this issue for some machines and =
would add workarounds in their recipes?
>    I've tried to add "CRATE_CC_NO_DEFAULTS" into rust-target-config.bbcla=
ss, but it breaks building rust-native. Looks like we don=E2=80=99t define =
all the required parameters for native builds and rely (maybe not even inte=
ntionally) on parameters defined by cc-rs crate. Therefore to do it properl=
y there should be some logic around defining of "CRATE_CC_NO_DEFAULTS" in r=
ust-target-config.bbclass. I would be happy to hear ideas or recommendation=
s.

I'd suggest you discuss the issue with cc-rs upstream first.
Historically, we don't want components making guesses about
target-specific compiler flags, and end up disabling or overriding
them, so that compiler output is consistent across the whole build.

Alex

