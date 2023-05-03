Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1259BC77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 23:24:03 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.37326.1683156232671816224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 16:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Zr+1jgd0;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-38e5c33305cso3967197b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683156232; x=1685748232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G093FnIAv+NrSDpXNWYIKKL3suV5EkO+bqG95U+zZkQ=;
        b=Zr+1jgd0EM0P6scGPu2smQgPZUJcV35JwtVP8puQ7yBQo5mRwIF/o1ou2eygQpvegV
         oBJnXLEJrTVKS2nZ7yWQjo5nHOLQa+jLR6jfiawcJpI0mjEArjTu2RuvY/pAckktUzxK
         GSmib4EsjNzZted9YZhHSZFzGq4o4etBe36H0UomePUblcGXudwNnYMhhDcuKqislSrX
         pcvXCSLkVrKzsNuVVcrQqXslheOXq3CfaNtRH70p1PG7Gc+RzNaa5kkP4LWh6jSIv0nP
         aKTPEQ2/cZVKn5RWbQrITOHnPlwk7tP9RgyOnx4ib/dUqWDq3rWy3ymlLbBrXsomIHMP
         inIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683156232; x=1685748232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G093FnIAv+NrSDpXNWYIKKL3suV5EkO+bqG95U+zZkQ=;
        b=DP5Qz3zZSCdnuCZh96dK662ePPZTHhZU0L4jU03SpKHKfPy6xRX+IxWNEhkkMvqb/b
         cALWuAGKxs1X1tFrfSCliu8yw7I4aGjq3i/MKWVwSuOmqfzLGh8q2436eJnHfcwYMtZ7
         +XUa1QQm1vOTzV/0/rXh2JleRxcvC4/Hu+tuzaLh5K/PN0vhZus8UA6eO3B8f0iwkg9M
         nP+EGJ2Wbx/IHEurB9ZwGjfv8XIvdQgHusWJohNBEzcODC63k/KuW7THjZA/iGHcDeVI
         K6QVmEcfr7VF0qHrzt9QJBMkvttKEkXQzS5Oj7MdbWR9ePSpKcBW6G/bdFw6oYv2l+qC
         dd2g==
X-Gm-Message-State: AC+VfDzXXh5In2Kjr+dG8yn3MZRlaAU60yDCkcCVzTXdCHR3L+hXkhuj
	2a7INpMmuu60WSf5ztGuX3VhxJKlbGVirLciTo0=
X-Google-Smtp-Source: ACHHUZ7dj6zwhXbkHPMYZVYgsuLVJFxP7ybym1x/gj75pXtDENH85mvfE44QAb9oBxVNG7OAC+n4EBxmVQSuhXhXj7w=
X-Received: by 2002:a05:6808:1895:b0:38d:f7b4:c57b with SMTP id
 bi21-20020a056808189500b0038df7b4c57bmr965782oib.8.1683156231696; Wed, 03 May
 2023 16:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230502152544.1962685-1-ross.burton@arm.com>
In-Reply-To: <20230502152544.1962685-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 May 2023 16:23:25 -0700
Message-ID: <CAMKF1srojnmdPQk9jPRwh6pd4ZJUTDKn84c9PPVgPnh8Hu6FgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] piglit: upgrade to latest revision
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 23:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180839

fails to compile with clang see

https://errors.yoctoproject.org/Errors/Details/702836/
https://errors.yoctoproject.org/Errors/Details/702832/

On Tue, May 2, 2023 at 8:25=E2=80=AFAM Ross Burton <ross.burton@arm.com> wr=
ote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
> index 78b47985bcb..1daeb35b588 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -13,7 +13,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.g=
it;protocol=3Dhttps;branch=3Dma
>             "
>  UPSTREAM_CHECK_COMMITS =3D "1"
>
> -SRCREV =3D "0f4a875b05feb44426a2d43146f5e3c6ea5f8038"
> +SRCREV =3D "c39bc6062a373c371d9c8076a66acbb26c661471"
>  # (when PV goes above 1.0 remove the trailing r)
>  PV =3D "1.0+gitr${SRCPV}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180748): https://lists.openembedded.org/g/openembedde=
d-core/message/180748
> Mute This Topic: https://lists.openembedded.org/mt/98641339/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

