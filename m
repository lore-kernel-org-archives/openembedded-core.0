Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD67D2F7DB
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 01:36:51 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.39188.1729129008945249276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 18:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UEiPLBPu;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5eb5d55cc60so260506eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 18:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729129008; x=1729733808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdPaq9GQyQHFAn9Bv/7/OP/4jXJhIeM1uHki61Uqdts=;
        b=UEiPLBPu5dPWW56B/LMOkFcFoNmOM6sHrBHQdswxz5PG4sn6hZUSpOYCX84pgBrehx
         rylpPImCWTuhHdTuZj20cpA/nZe7JhPgwxSE2Bl7nVBahiz0NiDF1g5pDdnxg+4M+jTC
         KQ/VpRUxizJ5Kg3dy4aGR40ePdcz6NQnMPX+bX82A8yXgjK5vzlBMHw2G68iYZE6PYh3
         iBOgQC8kt4bT/tNT0qtvbZuqFSiaUL/yBpvD1D/l7FOlYqp3kcwGzkeWP1zE1LIJ1dg3
         wHvN7l5YCaeUHwEOVGJkNBJQkLDbF227JTSDwomJHH9zI2wWg3f42nShelIUjuJDwiHq
         0ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729129008; x=1729733808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdPaq9GQyQHFAn9Bv/7/OP/4jXJhIeM1uHki61Uqdts=;
        b=FA88tkmyRrUpdo76kAtrOuBD9gVSZT+Sn/idE/H48762CG93NmY9dWwMQHP6Wij0dQ
         MlK8SPYViRopjD72r2ZT6h8CeQn8r3Cb4hhX7tJAJayB0Kt2n9mo3tnwjoLcNwgftYzY
         AG45uKROtaBcpMQ1aytSxcSJu1nTsKi3hNyCC9+kPDViH+L5Cz1GUunNpEf0fgiyyvSJ
         FgSzrG8TYFuus3FUlHdBd+l3qalSjK2OjqPA1OY5pPny42rXnaNLrHvrGyNCrv+KZpWv
         W514M8Z/Tsmn0RRLd6Tvc0TDU65tSvy23lEiwgE73szXOclZ1SxERvT1U6Lk96Cn/AoM
         rN8Q==
X-Gm-Message-State: AOJu0YxUMPNJ7bUBpehOetjVd5ocfQZbhDj+r1AAK1+iWkDwNrfC37gH
	SE9XhKllEVTeh2IYo7DOvsYnVZOhw9ase7QeXihrb8QCCaYNU3Xv6t5MwMZ68bmqK9fEhwPoDF+
	zTuwKuHJ6ftZCxpjFRd2sO94/ztw=
X-Google-Smtp-Source: AGHT+IFe6O7dNPbnQhfuaUzegZJkN2H9TlWoCsF3egwNuYaHFbTur9xErcOPz7ZkjV/6vCW+/IRClTX8DpvSQ5K2agE=
X-Received: by 2002:a4a:b403:0:b0:5eb:75c2:5987 with SMTP id
 006d021491bc7-5eb75c259fcmr158948eaf.4.1729129008056; Wed, 16 Oct 2024
 18:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241016122555.21496-1-workjagadeesh@gmail.com>
In-Reply-To: <20241016122555.21496-1-workjagadeesh@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Oct 2024 18:36:21 -0700
Message-ID: <CAMKF1srq8CNR7xuNDov3Vh4JjipFWjzuroeL35HFF=CKKS0vhQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tune-cortexa32: set tune feature as armv8a
To: workjagadeesh@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205981

On Wed, Oct 16, 2024 at 5:26=E2=80=AFAM Jagadeesh Krishnanjanappa via
lists.openembedded.org
<workjagadeesh=3Dgmail.com@lists.openembedded.org> wrote:
>
> Cortexa32 is a 32-bit armv8a architecture processor, so set the tune feat=
ure
> as armv8a instead of aarch64 which is 64-bit armv8a architecture.
>

That's right. its aarch32 only arch. This change is fine to apply.

> It solves the following build error while compiling libgcc-initial
> and libssp-nonshared.
> -- snip --
> aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mf=
pu=3Dneon'
> aarch64-poky-linux-musl-gcc: error: unrecognized command-line option '-mf=
loat-abi=3Dhard'
> -- snip --
>
> Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> ---
>  meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc b/me=
ta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> index 25bdf12b18..0eb938a240 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> @@ -10,7 +10,7 @@ AVAILTUNES +=3D "cortexa32 cortexa32-crypto"
>  ARMPKGARCH:tune-cortexa32             =3D "cortexa32"
>  ARMPKGARCH:tune-cortexa32-crypto      =3D "cortexa32"
>  # We do not want -march since -mcpu is added above to cover for it
> -TUNE_FEATURES:tune-cortexa32          =3D "aarch64 cortexa32 crc callcon=
vention-hard neon"
> +TUNE_FEATURES:tune-cortexa32          =3D "armv8a cortexa32 crc callconv=
ention-hard neon"
>  TUNE_FEATURES:tune-cortexa32-crypto   =3D "${TUNE_FEATURES:tune-cortexa3=
2} crypto"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa32             =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv8a-crc} cortexa32 cortexa32hf-neon"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa32-crypto      =3D "${PACKAGE_EXTRA_ARCH=
S:tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypt=
o"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205965): https://lists.openembedded.org/g/openembedde=
d-core/message/205965
> Mute This Topic: https://lists.openembedded.org/mt/109042469/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

