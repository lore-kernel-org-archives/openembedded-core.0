Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FB6EC874E
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 18:42:35 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web10.21337.1694112150836575732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 11:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SxPSt3X2;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: raj.khem@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-493639d616eso462928e0c.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694112150; x=1694716950; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDdc6CvTPXeR0JU1kZNqjygy97/pqbcouA2mP6o8/s4=;
        b=SxPSt3X2WQZejSn/Nz/kaeGQfoNpqVwTwcWfUH/ZJgsxRq4AqspIE/3qsTD/2fjXui
         R99CBXQow/nhhYfhPcQ7mdRMDQ83xCcppb0CZdZfulpgSoOuESGem5Z/tAFkkBX0X2h/
         fUDd+0TGZr8yjmYnGEP8crR16CNdcyUSXoAcmBUwXS2CxHqZYrWHD4Om8i1EcX/FwT5G
         wS1LYPJrEOKFh1LbqY5Ie/LtgHWm5UhMovDrQFFHjVpf5y3qrAxrF9wPmdhlZRNycSAF
         eyh16GiKSAoVcR0IwOpmTzSesR2z9pze5PjU0iO8F2oLFUqAxdGMOfs/hWqdRAE57khx
         8rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694112150; x=1694716950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDdc6CvTPXeR0JU1kZNqjygy97/pqbcouA2mP6o8/s4=;
        b=LdSxjEqpNJED5dnvnFHzx5ZsuvBJHpau5k0+B8VudNTIF5dmrhAXrmn9Grz0i65il7
         NHO7TGkFozK9j3NckdpXUL/POJ+MtLN4KiGMklUfGNGPppzQIluaeHxF29YsBInindh5
         gFz+KhLkgsCFjPP9BJOnc1Pcm3mZTbhcA6oZPag5pQc8kCnWQE3GIGrZTSEV5HYb4eQr
         0SztZnmz2fyQWy9kEI9xhkeCZ5Mhv9PkU1UDIgQDkuo7CST4P6KsotTVjPGOZS9yxOkv
         dLZsQl360oh35Iz9/zmki5KeV8S/P+nzxKrifpsiIuTBWiV0KI2uYPjKGOBIYgZ024Tu
         EJfw==
X-Gm-Message-State: AOJu0YyzgN9gnkBEzhyXDYh2orxU0yLcbBJ+23BDcZP63tsUJ1+Zs24V
	sHdOMFco4ch3emr1rkurZ/RXzBvlBDfEjBmyY88=
X-Google-Smtp-Source: AGHT+IFumc2jgNOzXwSADm2QqC1urn3FWNnsCHeld7d3yZXZAb1RXXQouZHpjX8bkElDwLwibyFmY8BZM7drjIRQJ5Y=
X-Received: by 2002:a67:e94e:0:b0:44e:828d:ce7f with SMTP id
 p14-20020a67e94e000000b0044e828dce7fmr577509vso.21.1694112149798; Thu, 07 Sep
 2023 11:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-13-alex@linutronix.de>
In-Reply-To: <20230906165633.2382629-13-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2023 11:42:03 -0700
Message-ID: <CAMKF1sqhuv9WkZZjDHgz_cwJhjz0KtE=UsAom-eh05==hD+SqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/17] gnutls: update 3.8.0 -> 3.8.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 18:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187394

This fails to build openconnect, it needs a backport

https://git.infradead.org/users/dwmw2/openconnect.git/commit/7512698217c410=
4aade7a2df669a20de68f3bb8c

On Wed, Sep 6, 2023 at 9:57=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-support/gnutls/gnutls/arm_eabi.patch    | 12 +++++++-----
>  .../gnutls/{gnutls_3.8.0.bb =3D> gnutls_3.8.1.bb}      |  2 +-
>  2 files changed, 8 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.8.0.bb =3D> gnutls_3.8.1.bb=
} (97%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/rec=
ipes-support/gnutls/gnutls/arm_eabi.patch
> index 2b61a703cb1..fe3f031fdcc 100644
> --- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
> +++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
> @@ -1,4 +1,4 @@
> -From 911213d9f72ddce468322d22d223127b93964409 Mon Sep 17 00:00:00 2001
> +From 5810d97281bb30edb786de9946e5c13186eff6a2 Mon Sep 17 00:00:00 2001
>  From: Joe Slater <jslater@windriver.com>
>  Date: Wed, 25 Jan 2017 13:52:59 -0800
>  Subject: [PATCH] gnutls: account for ARM_EABI
> @@ -9,16 +9,15 @@ reference to them.
>  Upstream-Status: Pending
>
>  Signed-off-by: Joe Slater <jslater@windriver.com>
> -
>  ---
>   tests/seccomp.c | 2 ++
>   1 file changed, 2 insertions(+)
>
>  diff --git a/tests/seccomp.c b/tests/seccomp.c
> -index a3148fe..443bc5f 100644
> +index 86442a5..03a5aa8 100644
>  --- a/tests/seccomp.c
>  +++ b/tests/seccomp.c
> -@@ -52,7 +52,9 @@ int disable_system_calls(void)
> +@@ -55,7 +55,9 @@ int disable_system_calls(void)
>
>         ADD_SYSCALL(nanosleep, 0);
>         ADD_SYSCALL(clock_nanosleep, 0);
> @@ -27,4 +26,7 @@ index a3148fe..443bc5f 100644
>  +#endif
>         ADD_SYSCALL(getpid, 0);
>         ADD_SYSCALL(gettimeofday, 0);
> - # if defined(HAVE_CLOCK_GETTIME)
> + #if defined(HAVE_CLOCK_GETTIME)
> +--
> +2.30.2
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.1.bb
> similarity index 97%
> rename from meta/recipes-support/gnutls/gnutls_3.8.0.bb
> rename to meta/recipes-support/gnutls/gnutls_3.8.1.bb
> index 1e3f34b6c53..455031dd474 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.1.bb
> @@ -25,7 +25,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
>             file://Add-ptest-support.patch \
>             "
>
> -SRC_URI[sha256sum] =3D "0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e=
1fb3815930b9bdc5"
> +SRC_URI[sha256sum] =3D "ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ed=
e9d069fe6294829c"
>
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187335): https://lists.openembedded.org/g/openembedde=
d-core/message/187335
> Mute This Topic: https://lists.openembedded.org/mt/101197354/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

