Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB389CAC5BB
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 02:13:09 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web10.3111.1759371182292370277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 19:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wc2D1lcq;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6353e91a04aso687808d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 19:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759371181; x=1759975981; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGy+kkAeKbovs7spksrPbIwC+P8bdfJrZnnZ5hkzj48=;
        b=Wc2D1lcqjA/29/Hs+KwF8ElBiQYtO4ZkadJsRdF4LkkffRGxa2dKnMJcqKcS/httnQ
         CmqfHQuJS0wgo9bvNS5j2VRYvE/+mMKa6oE72MFBsBIULtCHHgpTfNHb2cAUFXYxIjhz
         tyWs24mAY5tIzBcCHZENi5qAydpYuff9qvAwr2QHTHEhE2YVH+FAj3U0zVgJ/TRFWHf4
         +3eTZE4TG0rbeV6pQ+xiOo7FCKIVhFOZyRSwUUbWlePTBT2zp9dPJDIz8GsBsGFRPXFA
         yaoSZ5G4rPTDal+viCr0b/ET2dAnKyZUpzVbVImJ3oeLht/JGXHfIkW+f6NeJvdfp3uh
         Sjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759371181; x=1759975981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGy+kkAeKbovs7spksrPbIwC+P8bdfJrZnnZ5hkzj48=;
        b=oCyAmM34PXtvpvmz879gWwG/HG4H4iIEcS1g78buhf6AUtueLU9KWQ22VdokD0VLf3
         iwz1QXfkAezoztNDVGogLTin8xBoNI+wwG6NpROlXBPc4IsKSwoy9bSeYWsASrOTVsQ/
         /NLjWVb5BSn0MUsYC8fV7TXZIXuiO5Kh3RRpZaOhc0xKjV9PsQEw7lP35VlE03WoyLBS
         rZ5482OpR8xuntpxY0eOlkArxQnDxHWMXvv9BvtQ/hWxrn2/NNyB5s4WoCotpVKUx29s
         tj3xJiAGywdgzGbHrhZuniQpvVt8135nwjR01qHv9n61xxzT0YnkRrXMCFBP+yivnMcC
         iI4g==
X-Gm-Message-State: AOJu0YwelsB6Mx4Mmkt6uLRR2hCVm/qUFKz0DwFsjjL3iamxccKn32Gu
	StGl1FTTlMovKMM9KD8JRC5X1P/gS4P7HKxK/KujdZDVv7B2Bmt3J2mpSHqFXLTG5ygkQCALTtv
	Tz8I1bytXV1ZLNW1zW3su/rcHm5QJ1OU=
X-Gm-Gg: ASbGncuVn0zrpQWst+GgG/YQTBJ90P8O1w7k2SjlJ0C65owqWikbY9ZAHAPaF35XVoQ
	IsJfE/8n3k/3VO2q3bmiObxVPM68gpkfRgI88VzgYe+AnqwkG9jz+QWBtvtOopTKRDmwph+pUb9
	AAP3bscQpU3qQlsbrNkr4Eg6rsDPFJfJT466c+/79ULcXkt3c3s5dCQNOH6/KaT3UXIzb3oukxH
	RfdTCvvE9JHLx01EIOdRl45a5Hht1i0429tx1MmyC/u8W50dyU2W2e2G9zmr+mRrZRu203W0KqC
	GsfSzbeqe0yKwYP9vVczQeMuvyEsObpTztB81zkj0IT81kg24NuyQLO4dxv/rCg=
X-Google-Smtp-Source: AGHT+IFhms+am70Y3J09krzLx7CwzRzNessgk+zBDb7n7ulOlZkMzsGpJ1+bmIdFvGWLwh5DpZlr4S8UcALlZr2cSAs=
X-Received: by 2002:a05:690e:25f2:b0:636:d7b8:c56f with SMTP id
 956f58d0204a3-63b6ff96750mr5532309d50.36.1759371181269; Wed, 01 Oct 2025
 19:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251002000810.226673-1-denis@denix.org> <20251002000810.226673-3-denis@denix.org>
In-Reply-To: <20251002000810.226673-3-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 19:12:34 -0700
X-Gm-Features: AS18NWBS-qnthDft-F2BNTcugo5njQsH9LwPPOFy-Pop4Ed1U0dzkTGB_p1RTxc
Message-ID: <CAMKF1spcHAvNJtsStzG0OgigTKkU_QHgApdY1m5Q+Zf4aecTRg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] musl: set compatibility a bit more flexible
To: denis@denix.org
Cc: openembedded-core@lists.openembedded.org, 
	Denys Dmytriyenko <denys@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 02:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224342

On Wed, Oct 1, 2025 at 5:08=E2=80=AFPM Denys Dmytriyenko via
lists.openembedded.org <denis=3Ddenix.org@lists.openembedded.org> wrote:
>
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Like musl Linux config, baremetal also uses musl as a libc, but
> it has a different host triplet set. Hence adjust COMPATIBLE_HOST
> to accomodate this use case by checking that musl is a preferred
> provider of libc.

This sounds a bit odd. Why do we use musl for baremetal targets ?
while musl does have FDPIC support but I don't think thats how we
use it.

>
> [YOCTO #15982]
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta/recipes-core/musl/bsd-headers.bb      | 2 +-
>  meta/recipes-core/musl/libssp-nonshared.bb | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/mu=
sl/bsd-headers.bb
> index ad9ba81e4f..c6a3814a49 100644
> --- a/meta/recipes-core/musl/bsd-headers.bb
> +++ b/meta/recipes-core/musl/bsd-headers.bb
> @@ -25,7 +25,7 @@ do_install() {
>  #
>  # We will skip parsing for non-musl systems
>  #
> +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_virtual=
/libc', 'musl', '.*', 'null', d)}"
>
> -COMPATIBLE_HOST =3D ".*-musl.*"
>  DEV_PKG_DEPENDENCY =3D ""
>  RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> diff --git a/meta/recipes-core/musl/libssp-nonshared.bb b/meta/recipes-co=
re/musl/libssp-nonshared.bb
> index 4bcbaef7ea..6f12ff0c9b 100644
> --- a/meta/recipes-core/musl/libssp-nonshared.bb
> +++ b/meta/recipes-core/musl/libssp-nonshared.bb
> @@ -29,7 +29,8 @@ do_install() {
>  #
>  # We will skip parsing for non-musl systems
>  #
> -COMPATIBLE_HOST =3D ".*-musl.*"
> +COMPATIBLE_HOST =3D "${@oe.utils.conditional('PREFERRED_PROVIDER_virtual=
/libc', 'musl', '.*', 'null', d)}"
> +
>  RDEPENDS:${PN}-staticdev =3D ""
>  DEV_PKG_DEPENDENCY =3D ""
>  RRECOMMENDS:${PN}-dbg =3D "${PN}-staticdev (=3D ${EXTENDPKGV})"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224333): https://lists.openembedded.org/g/openembedde=
d-core/message/224333
> Mute This Topic: https://lists.openembedded.org/mt/115544473/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

