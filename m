Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB59C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 18:17:52 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.1101.1713550669367737582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 11:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OUQueBnN;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-238e171b118so1253162fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713550668; x=1714155468; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aqgw1OG4r1aVw7TmzIsLqRQ1hdmyOjl6HXsXRSmh3ck=;
        b=OUQueBnNlWaWtrPPOyq0X5hVyPtkHRv+tA4L8+iTgAegOklW1SbKSfas02b6Un3NRP
         zpZditylzLkrGIrTeO8Gb3ouYU/QF6LZpDaMVvGJ+ccWLdMTFh/6rrLceMpqvws/WeLS
         jjTy5GIO94JQYALvDUZXqpHBbWTXJNM6+oxlJ5nC5BnNoUyuyAi614S6LJOmyPSuUAI4
         u3cdk/8tO3BVWFY0nR7zRH5wV1hTjCBrcpjAccANdOUpBFiXd0MdyqkK94zQ6Fkj7EPD
         UsHFAtIC1q7iMcihnyp5bDiJv7hSobFIU+TFHegjJ5dTa/Evj6/o8aupVrnlwa6hT0cE
         jQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713550668; x=1714155468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aqgw1OG4r1aVw7TmzIsLqRQ1hdmyOjl6HXsXRSmh3ck=;
        b=AvPw+xk85v+1ryZNEudrKlgFKZ57dJaH3kgBvpwpycBGatN/3gC9ytwQyc9KZMpLpQ
         FGnyBFarze70JLG02WLFM7Td7hh6racBTdZut716cpCZNhdsC/YnWLg8GKk2E0uE/f0L
         VgyoyHT8h4dckCBqKLgeaU3TfU3V0DjT5xvZR4NrDsSGBqcrJzRziRu+jviy+kpq1HT8
         cGsgwmJItORB6BtSZxW1PbIROeIhGIfMnK096aRcA75BHwhOscX4eoH+AGMoBOnpyb4L
         GxvLnM9dGd03PNDl2BMdcch6VqdtVqcJvnTMRqzcPYx3T9YEpzTpt+0PJbE1fHGJGqyo
         SD4Q==
X-Gm-Message-State: AOJu0YwTSJd3r0tPdrZ95xvOgZYggRQPP1ron102QK07FprTE46A1gXK
	dfRZCAdbz9IWSFUdC1A+Z3l5whVhe4y6ruQldCR5oopIRMDUJj0bpGWCm5IUUoU5ZN6W+5DZtuZ
	Y0ZsyukTv5w5ja3MupipLnriTFcU=
X-Google-Smtp-Source: AGHT+IEhQxCAqui2Q56NnbvoqddmxRfPwi10kww2H4+p2k1i2fkhZxVWDs7FYXTHI0K/DIv1I+SvwlDQY/0KPVi9XYw=
X-Received: by 2002:a05:6870:b14c:b0:22e:a7a1:6e56 with SMTP id
 a12-20020a056870b14c00b0022ea7a16e56mr3349610oal.29.1713550668633; Fri, 19
 Apr 2024 11:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240419175309.214181-1-jose.quaresma@foundries.io>
In-Reply-To: <20240419175309.214181-1-jose.quaresma@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Apr 2024 11:17:21 -0700
Message-ID: <CAMKF1sqndbA_ahF0uG=TTe14f0B9woY0HCDCsGPhxYWnYoE0rQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] go: Drop the linkmode completely
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 18:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198560

On Fri, Apr 19, 2024 at 10:53=E2=80=AFAM Jose Quaresma via
lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> This will make possible to restore the default dynamic linking globally
> which is what we had before the 1.20.X release.
>

Looks good overall. how do we support the static linking if user wanted ?

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes-recipe/go.bbclass          | 2 --
>  meta/recipes-devtools/go/go-runtime.inc | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbcl=
ass
> index cc3564c36a..d32509aa6d 100644
> --- a/meta/classes-recipe/go.bbclass
> +++ b/meta/classes-recipe/go.bbclass
> @@ -48,8 +48,6 @@ GO_RPATH:class-native =3D "${@'-r ${STAGING_LIBDIR_NATI=
VE}/go/pkg/${TARGET_GOTUPLE
>  GO_RPATH_LINK:class-native =3D "${@'-Wl,-rpath-link=3D${STAGING_LIBDIR_N=
ATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}=
"
>  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK}=
 ${LDFLAGS}"
>  GO_LINKMODE ?=3D ""
> -GO_LINKMODE:class-nativesdk =3D "--linkmode=3Dexternal"
> -GO_LINKMODE:class-native =3D "--linkmode=3Dexternal"
>  GO_EXTRA_LDFLAGS ?=3D ""
>  GO_LINUXLOADER ?=3D "-I ${@get_linuxloader(d)}"
>  # Use system loader. If uninative is used, the uninative loader will be =
patched automatically
> diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devto=
ols/go/go-runtime.inc
> index 3f1e795dd9..413cf6d33f 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -15,7 +15,7 @@ export CGO_LDFLAGS =3D "${@ ' '.join(filter(lambda f: n=
ot f.startswith('-fdebug-pr
>  export GOCACHE =3D "${B}/.cache"
>
>  GO_EXTLDFLAGS ?=3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
> -GO_SHLIB_LDFLAGS ?=3D '-ldflags=3D"--linkmode=3Dexternal -extldflags '${=
GO_EXTLDFLAGS}'"'
> +GO_SHLIB_LDFLAGS ?=3D '-ldflags=3D"-extldflags '${GO_EXTLDFLAGS}'"'
>
>  do_configure() {
>         :
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198558): https://lists.openembedded.org/g/openembedde=
d-core/message/198558
> Mute This Topic: https://lists.openembedded.org/mt/105623011/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

