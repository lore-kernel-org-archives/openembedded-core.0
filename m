Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAB9C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 18:18:13 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.156794.1698689889433963041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 11:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8cS2Ny7;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1e993765c1bso3329286fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698689888; x=1699294688; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhD3fu103tbPod0EmzxZiabNkiXphcJowub9kfeqKfo=;
        b=J8cS2Ny7PJ5AKu7g4Ny1e6Gdne980M5U4FaLY+m0DsKXms2BDeAv+6oaYKPxyb35O+
         iNq26S+IAr0Y4n+sF8lJyeRdEVqhFC0sYksp7XE0OARaeMIdk1fBStzMiMHPzsFLGjdm
         bEzdyp5piVuvBJvZ4wsYUaITAqrDbBaghWRh2tOj2GOmlNRaNerjAmHGyWU2OD9P6fN5
         zu0mFcMr8hRVBj/YDnWmKIhBmZeaNvd61pnEJ3zILX8QGxRLeyJQkU7yq50y9YGlEifl
         vnX7+u5ju+rS3cUwBZY0Y2Clj0frGMV/aDzyW5mJTUaTYTZpATpV0QXJCxZT7HCtKlnv
         +bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698689888; x=1699294688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhD3fu103tbPod0EmzxZiabNkiXphcJowub9kfeqKfo=;
        b=n2prpO1ukV3qlpfLnGqnWC5DCFTFPDoD5OaVOkAv30P9tff0HvSJ9gpByReqzKeu9v
         ozDZ9Xl1U8uOLtzjmtOxMlBagiWiHAu7nS7nz8Wt83bp3pK2Owwv9+nc75ejJZInWUYM
         u8AMsK1FN+Kn4dDY7oAKB+xLXq/rLAKHpncQnn3PlXxiZ2ta0AjDQsa2avsndptO3/FP
         9P5fh7QBjxM3fpXEQJH2sOXPX6jD4gjHRZaSLBHIrGVOKv1l/Lar5qjwDfTPQDpQH+lo
         //YaDFLTYCNlfTfKta4npirboeDp/qZDRRYDXpwtc61lbioRxXL1sn1qJm3sjCcg0vnN
         gsEw==
X-Gm-Message-State: AOJu0YwMSaA3phUElwrlicsYJInr6Dqde29ZW9cSmIPkA1FshGD3Cizt
	q/36fAvKCx/cPcd/ipgV2PlDWlJLSW8CglCFBcU=
X-Google-Smtp-Source: AGHT+IGq6WVeTW1LQRkaaOOpwLWFqGk8hTAsdXD+7RjGKqKn+i9D0VyeJ/1BrINpo2pRg4xB82DvuOIFu2wQpLmf5ZI=
X-Received: by 2002:a05:6871:5a91:b0:1ea:2c8b:e18e with SMTP id
 oo17-20020a0568715a9100b001ea2c8be18emr14069734oac.8.1698689888593; Mon, 30
 Oct 2023 11:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231030180413.553254-1-jose.quaresma@foundries.io>
In-Reply-To: <20231030180413.553254-1-jose.quaresma@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2023 11:17:42 -0700
Message-ID: <CAMKF1srC-e=ZO95mF0ZUQkp70wKApBaArtVgcEysOEUkn+29Yg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] license.bbclass: prefere plus singnal over
 append on IMAGE_CLASSES
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 18:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189805

On Mon, Oct 30, 2023 at 11:04=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail=
.com> wrote:
>
> The append override is much harder to remove so chnage that.

typo in 'change'
however, I think one can do :remove op to remove it intentionally,
with this change it will
need to be redefined by user who is using license bbclass explicitly,
which is less intuitive.

>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes-global/license.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/li=
cense.bbclass
> index b2e0d3faba..b915d39acd 100644
> --- a/meta/classes-global/license.bbclass
> +++ b/meta/classes-global/license.bbclass
> @@ -418,7 +418,7 @@ SSTATETASKS +=3D "do_populate_lic"
>  do_populate_lic[sstate-inputdirs] =3D "${LICSSTATEDIR}"
>  do_populate_lic[sstate-outputdirs] =3D "${LICENSE_DIRECTORY}/"
>
> -IMAGE_CLASSES:append =3D " license_image"
> +IMAGE_CLASSES +=3D "license_image"
>
>  python do_populate_lic_setscene () {
>      sstate_setscene(d)
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189804): https://lists.openembedded.org/g/openembedde=
d-core/message/189804
> Mute This Topic: https://lists.openembedded.org/mt/102281098/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

