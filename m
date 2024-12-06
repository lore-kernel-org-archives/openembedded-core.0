Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2398CE77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 10:01:40 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.33528.1733479296933255237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 02:01:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePU9EHhD;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30037784fceso2384011fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 02:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733479295; x=1734084095; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxQowFLlIiET99tTqdld2s3Q5uSpiwy46S6sHIWLty0=;
        b=ePU9EHhDxh2sRpwy/6tOjRZ36z6D9Ui5nc2OpiofHToCM/vWznEcICQjeXdsdhH/dn
         +ouVbvH1mP3q7JhaPsDcQ0kQjUjndPqmS5mUwH9l87Yu80aG+vZyh/hisoi5Zhxgj/RL
         9wWf0YM1EQv6yMyS50tQnA7wsHtY0XvU4C0l8YbZ0sBB2Liu7KJTYwKSUpkYceUIWyK7
         Y15iYTGB2Ah8fBIdnTeKxtoP6/37m/TV/k+YQMAqH5Y2/q9VFJ0BIfHC6nsrCwG4ksHv
         zBE8f7MH4srYy7ofKx+YqaYimbnSlD1qWmEZaJpy/P184T5+QA3Fqj45AEl6ZOmVg+sR
         TLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479295; x=1734084095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxQowFLlIiET99tTqdld2s3Q5uSpiwy46S6sHIWLty0=;
        b=UiMLDkhZPtKDcGkKkNM6gv4WcErXU1hTiSXwdgFMby5fy+sUkfrtr/j9R5/T4zvkps
         pqV98vQskrFZ1Dl+sNRiQTTxiyOj6ffQYhhSPWZOHXEQr1pNMYjfd79oRnKE55yJGfS/
         +2tMkeipijDbRio50TcKQ95sF6LDHMY2ioaa1Xo0uoXo7t5mzjqdegA4obz1kZs4NVU5
         jNXdWeGhU0qkZB8cfyV2oeRnNHx/FO319slHlvhzGx5GRakhrBGvRTiHQs4L2BknSRv7
         FcZRgRLRSYfOiGe+qMHLQ/Nei+6ihNGvj8oWVvECRsnx3aSs88u0u8ZcWiCHTfrC4mX5
         JSRQ==
X-Gm-Message-State: AOJu0YySG1MnTIrI8S5bRwWGnJdGqgGXeInzDIDj3iavH6dvKmBG5j5S
	8aDAo0199F4NWjPJ/x7t8owj1bLat7uZ40dUQ8OnWaM0yNYA+ozT0p2fY6vhhm5UnNJHW5bJzXH
	XyNITcctFOAQ6eXCJPj4DgwBW4JAIPqMG
X-Gm-Gg: ASbGncuZTOKqF/P4h9b/B0Ld7WJOlYP5pt1xzjcQdQPJNcQYaD16oXn4mGKKi9BGTRA
	KULVJKKZLhCJlvlTbxZ6eeNJC1VWRTaI8qQ==
X-Google-Smtp-Source: AGHT+IGImRJjkR1O9UZgDfSTsXeA6RJFoG9VSGrI6Dy+gdwcOskcfKc+U4FOh08OY0jGmiAc37PxUjN39gbBe6EOD6s=
X-Received: by 2002:a2e:a54e:0:b0:300:3a15:8f23 with SMTP id
 38308e7fff4ca-3003a15937fmr1312741fa.7.1733479294704; Fri, 06 Dec 2024
 02:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20241206092740.1896316-1-pratheeksha.s.n@ni.com>
In-Reply-To: <20241206092740.1896316-1-pratheeksha.s.n@ni.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Dec 2024 11:01:23 +0100
Message-ID: <CA+chaQf5NMirgDDxMH_diFAcB1bjeFRasOjL4jR3n57AdrQrQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg-keyrings: mark IPK as allarch
To: pratheeksha.s.n@ni.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 10:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208413

RDEPENDS:${PN} =3D "opkg"

makes it effectively TUNE_PKGARCH unless explicitly removed in
SIGGEN_EXCLUDERECIPES_ABISAFE or SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS

On Fri, Dec 6, 2024 at 10:27=E2=80=AFAM pratheekshasn via
lists.openembedded.org <pratheeksha.s.n=3Dni.com@lists.openembedded.org>
wrote:
>
> inherit allarch as package contains entirely cross-platform content.
>
> Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> ---
>  meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb b/meta/recip=
es-devtools/opkg/opkg-keyrings_1.0.bb
> index 84aeb98068..75d5b5216c 100644
> --- a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
> @@ -2,6 +2,8 @@ SUMMARY =3D "Keyrings for verifying opkg packages and fee=
ds"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
>
> +inherit allarch
> +
>  # Distro-specific keys can be added to this package in two ways:
>  #
>  #   1) In a .bbappend, add .gpg and/or .asc files to SRC_URI and install=
 them to
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208408): https://lists.openembedded.org/g/openembedde=
d-core/message/208408
> Mute This Topic: https://lists.openembedded.org/mt/109955189/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

