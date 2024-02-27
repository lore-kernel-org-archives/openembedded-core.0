Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD4DC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 17:37:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.495.1709055443540112866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 09:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EchLtnm/;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc1ff58fe4so40705265ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709055443; x=1709660243; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIs1qfJnrDSmrInrQ/YMp+BKMtaL9zfFXMPCozHKmsI=;
        b=EchLtnm/LziWuA1U3rXcb5dl5p6maRaEymt/ArT6xAF7PH9IKP3BfVv/U93jAPeLHu
         XQXi1vm4EoR+qE91pdP/X5awvyQmZCrUB4lOasxL1JsJJHPKRGpOKFJ7vsPbV1xGMeOU
         QvjEBoqQ0QoE+NdQ90pLELVSRz2911qkqSNUdvyOs786uFEkGreP2OHkgVY/47mUtYSZ
         +/crskPcqSOKHVXi/ztkDarIagxRgRgAQLOWZ5vj8VzsBpzLBe/beVb8gyL1H/y8WYZU
         Cs3bHxCb5WxfuyDYlgblsMQ2mCIaRagu1mqZTDodFeb7rOy7fosbBoUqmV6x/RmHRjx/
         +CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709055443; x=1709660243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIs1qfJnrDSmrInrQ/YMp+BKMtaL9zfFXMPCozHKmsI=;
        b=omBR1JtwlVlKGMKTyNFtMiVhwfDmLBKa4A7iVTSEViJK8uR8iP+2Vvz+33nwz4mPXX
         6/3LC0OqXQqB1v9dSFm9z4HnuOJA3mTXHSML1XsoUi62QjeyYc0h3vQVHxyFKAJa4Knw
         Bs4mvVDRYrr00dOhZ6/ATJzAH6f11EAr3ggcULMET7SmCXqlpTp8rJI9VYkaTtevLTiA
         r6P5P9tj87t2gwiKr18NkQvMOk6quo9918KkgxlhlvkC7XiwQrpl9sr3QM6HlTp7sBo6
         WpELt0wRodmQl0CYf9l3UAMTH1UKKp+GMuOD0lSJgeDSyZV9thLIiNOzqsmT1Yot8par
         /4BQ==
X-Gm-Message-State: AOJu0YxyppNU5X6BemQN74g5wRn5XCRA4uQWCw5bGaPtPdDlmcnn6DuW
	W1Yic0DyN19uiVmEJIFDiQlSMKiTugDbZJtVqz/mmygCyJmACl6JKm2PQOKXLbofnpihzb8jT09
	juQS2c5nRLBc/O9PP9X2m7jGjJ6g=
X-Google-Smtp-Source: AGHT+IHWfyfv2IbUkJqqKhzG+K1TWZIo/kGU5N8NENYbNqCagTG8UwwipF5Ht7CMhmw0o+q+w6mvEkkIXS4dts+X7BQ=
X-Received: by 2002:a17:903:24c:b0:1da:190c:3481 with SMTP id
 j12-20020a170903024c00b001da190c3481mr13879851plh.34.1709055442900; Tue, 27
 Feb 2024 09:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20240227170902.3718203-1-ejo@pengutronix.de>
In-Reply-To: <20240227170902.3718203-1-ejo@pengutronix.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2024 12:37:11 -0500
Message-ID: <CADkTA4MJnWAKC=k=QMVGGLF5h-S3Oxq6sNcaHsafYb9NKHBFAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kernel.bbclass: slightly fix wording, case, and
 spaces in version check
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 17:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196283

On Tue, Feb 27, 2024 at 12:09=E2=80=AFPM Enrico J=C3=B6rns <ejo@pengutronix=
.de> wrote:
>
> * Version -> version
> * match of kernel -> match the kernel
> * Add missing spaces around "=3D" sign

There's nothing technically wrong with the missing spaces. Putting the
assignment in a recipe with or without the spaces should work.

Bruce

>
> Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> ---
>  meta/classes-recipe/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 31e4a683d1..837064cef7 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -509,7 +509,7 @@ do_kernel_version_sanity_check() {
>         reg=3D"${reg}${EXTRAVERSION}"
>
>         if [ -z `echo ${PV} | grep -E "${reg}"` ]; then
> -               bbfatal "Package Version (${PV}) does not match of kernel=
 being built (${vers}). Please update the PV variable to match the kernel s=
ource or set KERNEL_VERSION_SANITY_SKIP=3D\"1\" in your recipe."
> +               bbfatal "Package version (${PV}) does not match the kerne=
l being built (${vers}). Please update the PV variable to match the kernel =
source or set KERNEL_VERSION_SANITY_SKIP =3D \"1\" in your recipe."
>         fi
>         exit 0
>  }
> --
> 2.39.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

