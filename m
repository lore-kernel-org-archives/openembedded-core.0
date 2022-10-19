Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C88C433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 06:35:00 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web08.5020.1666161291673487007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 23:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qAJ2dMst;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-132fb4fd495so19510302fac.12
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jhh6pECSZkWqfcJ2jqWwR23VukfNffZ4fqMn7X9UO1w=;
        b=qAJ2dMst0AihT8HHlXYlbAh1GiBXoHqNccM81A3I3hq58wFxwlzgtIbclpFzSLkB5O
         qjsDodAf3cv7f0wGCOf/4tFjd9iJoXimNlTsM9WTdxXLWTXF53mHpUYhlUnympenvVhg
         9ytDDGTjQ8LEXhrNLIULkzGldBaIChYlD8IbuR112Zo2+Xpb+V91VJX+2r9TOepcqN1/
         oV7swLPVSJWFh4tNDI+5n2Wf87NZKKnSK1hZQ9gs0OV1w38MzLFb17C0Od39/yzsogSI
         n5FvgSBjsP0HEbfN7YgvOePXvgYfjxyqlfGMMZKtTYJavQzh1oKwTCGixOldjuVWBp3K
         UewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhh6pECSZkWqfcJ2jqWwR23VukfNffZ4fqMn7X9UO1w=;
        b=oO+Apf9eKU2BX9vLcZ8p72tBz3DeQs3QfIFbKOuqbaRlEZ12YWxXhrAYaf2oYIcnsV
         NC6P9btVI5Iyj3uGZqwxEQ8OgIb4PEKJ+1131qhluAI9EWw43w7/36NBLyTviZ1LDuac
         tJRgO5XpGxs174Bhf277jhINfOO1qlzH9SzT3h5qqLolUL7OUFnXdj/SxzrtAdkHfhOu
         /jCU4oAskFCFxIlMpVkq7+DWwfPcpCWxRh7RbQM5pMUnhO2EW//ERLtxgDu0g+OTsT3u
         JhMd2VgQX7m5CzkoQV9gwoBVKXOJtYKXQN6w6y0PrL5LiEsamol/eBpaqCARgd9erXJw
         H1ig==
X-Gm-Message-State: ACrzQf1AHxzh/JJFKjMsA+69q9tFo31lPV5vtoL6B34CFkzpOo1nKXQE
	mGrg6fxy5XOt+86GyzyMUewwvY7UfFRKQ3t7eKo=
X-Google-Smtp-Source: AMsMyM6A3MlieLSc3R92br8+J5s0zsI9bq6TUf2tqza2cyN5Vin/ZT9aMFYBqAg1n1baN2qHNYnW/DVQ7ThHj4WFpSA=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr20015712oae.262.1666161290918; Tue, 18
 Oct 2022 23:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
In-Reply-To: <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Oct 2022 23:34:24 -0700
Message-ID: <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 06:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171958

On Tue, Oct 18, 2022 at 10:42 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Can you show examples where this is needed? Custom variable does not seem=
 a good idea. I also worry that it=E2=80=99ll break automated updates (it=
=E2=80=99s bad enough with mesa-gl, this might make it worse).

https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mesa/me=
sa_git.bb

>
> Alex
>
> On Wed 19. Oct 2022 at 1.08, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This helps override the SRC_URI in entirety if needed by
>> and overriding recipe
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2: Weakly define NATIVE_PATCHES
>>
>>  meta/recipes-graphics/mesa/mesa.inc | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics=
/mesa/mesa.inc
>> index c94e439363..04d78a6aa5 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -19,10 +19,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/me=
sa-${PV}.tar.xz \
>>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.pat=
ch \
>>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.p=
atch \
>>             file://0001-util-format-Check-for-NEON-before-using-it.patch=
 \
>> +           ${NATIVE_PATCHES} \
>>             "
>> -
>> +NATIVE_PATCHES ?=3D ""
>>  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD=
 enabled
>> -SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-ALWA=
YS_INLINE-compiler-error.patch"
>> +NATIVE_PATCHES:class-native =3D "file://0001-nir-nir_opt_move-fix-ALWAY=
S_INLINE-compiler-error.patch"
>>
>>  SRC_URI[sha256sum] =3D "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332=
880f2d0066bdafa8c"
>>
>> --
>> 2.38.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171948): https://lists.openembedded.org/g/openembedd=
ed-core/message/171948
>> Mute This Topic: https://lists.openembedded.org/mt/94420106/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

