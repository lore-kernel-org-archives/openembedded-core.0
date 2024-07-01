Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DF3C3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 15:43:37 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.116.1719848612806327481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 08:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exCAH2Hq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdb0d816bso3150282e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719848610; x=1720453410; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/h19A6acfRMZZVmbgqphJ1KHB3iq99aZcjo6Pquykg=;
        b=exCAH2HqBgLHSsv9jDqCJ6SWTcXUc5xd+c1BFtY3Iind+FEWhTMnagZJo4hPvwriGZ
         1yTktc7sfRLDKZUmA5dqVAwm6KyWxGq2f6MKzGzs/QdmT0g7GWUxagJlqtqcdcP/cqPh
         KSKr/oWQL1G6gkGWP6subt4uTZ8tkHeoh5gDuhdNXatt21dTqI5629jr0BReIWmwKlLo
         rbHhwsEuatHGO1iyKzuyzgJ2ErAclRstAZNXPO0BSqoXtQ7msbRuRBTW1ofywHkF+CFr
         SClji/7V/QCAj3412Jh0mqTutdbSqOvjxCmGRq6A5+62/pMmR/98GRCVfIKIxAFBedm3
         yJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848610; x=1720453410;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/h19A6acfRMZZVmbgqphJ1KHB3iq99aZcjo6Pquykg=;
        b=WUrvD+QAhNlkUnGzDnBkM69OWfOZhmZJ61HcWg2dVmfVTpcTdCbc7w0bMMZ2h+Uk2H
         8J/1C22wntgrnON6HGyOt6SP4KgyCSsKyOcIWAmpF40g5Z6v/nvDugKYyOOtJi62qkIf
         YoEtdG/RDdVeKIYqGKN3hac+1RJL/4jRJICQl5+OJ0+Vjfcj2o4Yx1LnAWv2XIqTwfDF
         e+3iLTqq3FF3K3+tYCv77tmkveBPc2yX/A+4pWKZ0ZS3AfKKFF7XWwy49Fqxc5HuAF8R
         j4iWvufUJmhIIL2DhlAv8hAeDfx4ztDuI/KTiM03RRb31NKA65QXmn53FdHjSk5aqK5p
         bogQ==
X-Gm-Message-State: AOJu0Yxd0aUYQGFg6Lv1msuhsm3GYYGcEhxIlGtlM4WaNe1pkaCDqcqh
	wO6ihXhWKKhXeHPX1FdnvTiFCmkpzfFmwouTQGPJjhRmjWrWpj6e3aU+C4tcJOHDwe7pPaapRiQ
	8+uc+hfrEE8zhXYzGDO/u8TD9v1jezw==
X-Google-Smtp-Source: AGHT+IEmn16vpc5B6995lkJ09Ol3mG1yV6OKpFV5haxVlp80Q98s/Wd62Y/cRnl3ESqqSZ46PvlHkZ854XtSagy6fWM=
X-Received: by 2002:a05:6512:3ba3:b0:52e:713e:697a with SMTP id
 2adb3069b0e04-52e7b8e551bmr2821537e87.13.1719848609080; Mon, 01 Jul 2024
 08:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240701144152.1018433-1-JPEWhacker@gmail.com>
In-Reply-To: <20240701144152.1018433-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 1 Jul 2024 09:43:16 -0600
Message-ID: <CAJdd5GZbPC4fbW2hG9ENpRqs+4jw4vbsf-ZCpXX44xw5dthM9Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Handle SemVer License
 List Versions
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 15:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201308

Hang on, apparently we call this a lot of places, V2 coming soon

On Mon, Jul 1, 2024 at 8:42=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> w=
rote:
>
> SPDX transitioned the license list to use SemVer visioning, (e.g.
> "MAJOR.MINOR.MICRO"), but SPDX 2 only allows "MAJOR.MINOR". For maximum
> compatibility, only keep the first two version numbers and discard the
> rest which allows it to work with either scheme
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 99061320e53..6c568d9dbb1 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -417,7 +417,9 @@ python do_create_spdx() {
>      doc.documentNamespace =3D get_namespace(d, doc.name)
>      doc.creationInfo.created =3D creation_time
>      doc.creationInfo.comment =3D "This document was created by analyzing=
 recipe files during the build."
> -    doc.creationInfo.licenseListVersion =3D d.getVar("SPDX_LICENSE_DATA"=
)["licenseListVersion"]
> +    # Newer versions of the SPDX license list are SemVer ("MAJOR.MINOR.M=
ICRO"),
> +    # but SPDX 2 only uses "MAJOR.MINOR".
> +    doc.creationInfo.licenseListVersion =3D ".".join(d.getVar("SPDX_LICE=
NSE_DATA")["licenseListVersion"].split(".")[:2])
>      doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spd=
x.bbclass")
>      doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX=
_ORG"))
>      doc.creationInfo.creators.append("Person: N/A ()")
> --
> 2.45.2
>

