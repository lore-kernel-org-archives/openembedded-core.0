Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E9DC2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 04:16:26 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.65661.1718943384685858062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 21:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNxrn9MI;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25cb3f1765bso900528fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 21:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718943384; x=1719548184; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsMnWHkyuek2S70kFS29sNM3a3bmbJDlU6FGQWPpyNI=;
        b=RNxrn9MILWUJnTSr/kqxR2cXG+IY211SwkauKLh0UBGZFnvdujSF88+z7BXN+9Obpz
         MtIUR6Wmq8AVydLgc1A4lgpipm0qdCTdLPIoGtLgXNovr3bl+0PRcgK5jO1KGpQ5FBrL
         gYn8SmKqR8CxAoMMh9B5UnNBahMvB2RVJP7VT5O+rNG0KdzAcZU5CnEq3BrzEo36wy12
         GJfURm+fGMziwS/lQU6DAbm9gQxkmZgiXAaDiXoUZHv96uXgAAwh4MK9o/BKOqeTBxKH
         BxHufGm0hAEmduFtky8mFuiSbp86KDzO+xqtEnYpboMBzS6EheQJKJqfcMpgyXqO0zD6
         zYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718943384; x=1719548184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsMnWHkyuek2S70kFS29sNM3a3bmbJDlU6FGQWPpyNI=;
        b=F4cxfGsWe3mRFDzxpM3b5Na17bNH9BB7m6TEbVtGbydRUbikdklznc99gESUkQuh3D
         FanvkjlNv3j36dRlFjUXYBKVP0yxMLdx43+h2Au9ZBqd+bxg6J6pKP4WSkneHw70D04G
         ZMt9clp7H9KxGBGjkwZCY6u5HzQpw4qvI4Vc3T4XaxomQMWLc50nfVsQN6mNYiCxcvM/
         G9XXzdmyDQOR/LEbMsk5kqOaQ/XyixiSSEdUbjBtzZ/zNj2AQFU+wVRVC4OMgQA7VnvL
         gif9uM1+UACkBiWa9+UQRZ875jCfMmEDdYgi699GSj++1Wo1X3vqbuskzqOLx+NqIW4L
         AVVQ==
X-Gm-Message-State: AOJu0Yz2YGbxUXGPMMMT8+f7SqSc9l49EmoCas23qXiEIkDDEK0fFjKC
	nR3ABAfEoGJbiexNA6IsBe1vLoK5t5qytKimyZD1BzUfu/jj9sT2qTQwPFwTSd6uJTPwF9q5H/s
	5tsYO0y3hoF9ijTNkKGO0tXskUPc=
X-Google-Smtp-Source: AGHT+IEdHcN31Du+5FrF9vPm8+a5RjBfCCUSuVCrMTsA0//VTXLUPAHB1xQffsKCFlhd1lp0inqN0+OWRUMq5gmAB2U=
X-Received: by 2002:a05:6870:968e:b0:254:bd24:de83 with SMTP id
 586e51a60fabf-25c948fe061mr7080391fac.12.1718943383795; Thu, 20 Jun 2024
 21:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240610214456.2757397-1-JPEWhacker@gmail.com> <20240619221805.3038528-1-JPEWhacker@gmail.com>
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2024 21:15:56 -0700
Message-ID: <CAMKF1srHCo13pG2wNjqbYBVBoF7sYRPBMSG=PdXAVsZ6Ldw5pQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 0/7] Add SPDX 3.0 support
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 04:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200991

Hey Joshua

https://errors.yoctoproject.org/Errors/Build/187139/

does this seem related to this changeset

On Wed, Jun 19, 2024 at 3:18=E2=80=AFPM Joshua Watt via lists.openembedded.=
org
<JPEWhacker=3Dgmail.com@lists.openembedded.org> wrote:
>
> This patch series add support for SPDX 3.0 and sets it as the default.
> Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> the same time; users may choose to specifically use SPDX 3.0 instead of
> 2.2 by doing INHERIT +=3D "create-spdx-3.0"
>
> v2: Added tests and addressed feedback
>
>
> Joshua Watt (7):
>   classes-recipe/image: Add image file manifest
>   classes/create-spdx-3.0: Add class
>   classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
>   selftest: spdx: Add SPDX 3.0 test cases
>   classes-recipe: nospdx: Add class
>   classes/spdx-common: Move SPDX_SUPPLIER
>   Switch default spdx version to 3.0
>
>  meta/classes-recipe/image.bbclass            |   58 +
>  meta/classes-recipe/image_types.bbclass      |    2 +
>  meta/classes-recipe/image_types_wic.bbclass  |    1 +
>  meta/classes-recipe/nospdx.bbclass           |   13 +
>  meta/classes-recipe/packagegroup.bbclass     |    2 +
>  meta/classes/create-spdx-2.2.bbclass         |    8 +
>  meta/classes/create-spdx-3.0.bbclass         | 1116 ++++
>  meta/classes/create-spdx-image-3.0.bbclass   |  203 +
>  meta/classes/create-spdx.bbclass             |    2 +-
>  meta/classes/spdx-common.bbclass             |   32 +-
>  meta/lib/oe/sbom30.py                        | 1118 ++++
>  meta/lib/oe/spdx30.py                        | 5996 ++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/spdx.py         |  119 +-
>  meta/recipes-core/meta/build-sysroots.bb     |    5 +-
>  meta/recipes-core/meta/meta-world-pkgdata.bb |    3 +-
>  15 files changed, 8654 insertions(+), 24 deletions(-)
>  create mode 100644 meta/classes-recipe/nospdx.bbclass
>  create mode 100644 meta/classes/create-spdx-3.0.bbclass
>  create mode 100644 meta/classes/create-spdx-image-3.0.bbclass
>  create mode 100644 meta/lib/oe/sbom30.py
>  create mode 100644 meta/lib/oe/spdx30.py
>
> --
> 2.43.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200929): https://lists.openembedded.org/g/openembedde=
d-core/message/200929
> Mute This Topic: https://lists.openembedded.org/mt/106770352/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

