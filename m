Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B15EC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:38:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.4820.1715060319911310894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwRWmsRR;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5206a5854adso1921361e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060318; x=1715665118; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Eq6AFcQcEKzhylR0Ugb4nDaUePgkLLbeWDcF+bRU3Q=;
        b=UwRWmsRRBPWVqmNcgrnQNpPTgELXWyezMPl/jh65gsfBt/FxVeNW5sT7U9wHwWHE34
         7EWofdXx09SzBQ1d5zizJasFS/NaJD7FG3c3Yfyq0vxWR1PTwR62fx7ecndsMyIretlA
         JW/syj2Eg93eXrYZQd6eYp1ezoVt+o9AI0aV+FBiYu14NLO/7m4hTcy26oH4WDUxfEnk
         ERz1VVdulfmangxf63Q17CT9DtxQOIUzdls9rqE35hAEn/vvgTns9ZQLuUOIBOx7uxNM
         DY8OR1fiN2RAQRUIOXWap8f+z2tbi0y+j9VKbDg8318ITuvx+ldMFlG9WEsX61mUMuml
         m55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060318; x=1715665118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Eq6AFcQcEKzhylR0Ugb4nDaUePgkLLbeWDcF+bRU3Q=;
        b=lpq1BS53LvM8UgB5uoUUBMWe2NvlJEfBJXPOhWzNfWGRBLr5Tj4iESMunUdVk+PMww
         NT+H3vfqFNO2b0Z6Kn4nnxhv3jA3mBTk920H4U5q9ZvLmwXbPymI8R4ga6nTQ7bfw4L8
         48EJLFUJsyOoew7MV+n3eaDteIntp+mE7vwZBy6RA64TqzUaaxayC1W51BAkuSYpEqI0
         XbeBo5+hES/8X901Jx1hEj2a1nm75wgfeo1TAufGrE2jNPm2DuqeU4zfTFAZ3OdEPaYv
         pFfpCwU8i5QWuqplOooAOprwnTNUeB9Zs2+9I1kL9/zuV87ThJYig99u25ftbpEvXiHU
         lZiA==
X-Gm-Message-State: AOJu0Yw17zKtbYA6paXviFLAM6DXt4KFk+g41tF+fFqs40Fem+ppBpbm
	4lrzofm9V2QwnmdU3mHPcAmf+psBUD94IlgxQCgfUe6YYOl+O0ygBJG4HDf1wNFl4QSWA2eGRpx
	/RXTwp11+O3JsTmrVFGRPJACNmsg=
X-Google-Smtp-Source: AGHT+IF6ElNHTwujKPwtx24qdS8yT265lnAJNUTCYUCxTbkysaEsNVAYtqO6NfKnRurXaoctzntPEx3yFJtubqrjlQg=
X-Received: by 2002:a19:ca1d:0:b0:51e:f02b:6226 with SMTP id
 a29-20020a19ca1d000000b0051ef02b6226mr6874085lfg.23.1715060317904; Mon, 06
 May 2024 22:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-4-raj.khem@gmail.com>
In-Reply-To: <20240507053320.1566814-4-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 May 2024 07:38:26 +0200
Message-ID: <CA+chaQem=rzFHQAOmEqiOzzYTjPqXN6k9MULVGQ5t_Du0bGp7g@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] zip lrzsz connman-gnome libfm: ignore various
 issues fatal with gcc-14
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199079

On Tue, May 7, 2024 at 7:33=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> work arounds for:
> oe-core/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb:do_compile
> oe-core/meta/recipes-connectivity/connman/connman-gnome_0.7.bb:do_compile
> oe-core/meta/recipes-support/libfm/libfm_1.3.2.bb:do_compile
> oe-core/meta/recipes-extended/zip/zip_3.0.bb:do_compile
>
> http://errors.yoctoproject.org/Errors/Build/183127/
>
> More fixes on ML (especially for -native with gcc-14 on host)
> zip: https://lists.openembedded.org/g/openembedded-core/message/198783
> cdrtools: https://lists.openembedded.org/g/openembedded-core/message/1988=
99
> syslinux: https://lists.openembedded.org/g/openembedded-core/message/1989=
01
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
...
> diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended=
/zip/zip_3.0.bb
> index 70df5ab8728..e7705b8faf4 100644
> --- a/meta/recipes-extended/zip/zip_3.0.bb
> +++ b/meta/recipes-extended/zip/zip_3.0.bb
> @@ -53,3 +53,8 @@ BBCLASSEXTEND =3D "native"
>
>  # exclude version 2.3.2 which triggers a false positive
>  UPSTREAM_CHECK_REGEX =3D "^zip(?P<pver>(?!232).+)\.tgz"
> +
> +# http://errors.yoctoproject.org/Errors/Details/766953/
> +# unix/unix.c:84:51: error: passing argument 4 of 'fread' from incompati=
ble pointer type [-Wincompatible-pointer-types]
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> +# proper fix on ML: https://lists.openembedded.org/g/openembedded-core/m=
essage/198783

I think we should take the proper fix from ML instead of this work
around (I just haven't tested it yet).

