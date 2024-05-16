Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767F4C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 05:29:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.5980.1715837387627208537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 22:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hqgiltz7;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2df83058d48so3919411fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 22:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715837385; x=1716442185; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YdFXnIGmRLRVPEvO8GV0BepTlDMEgJMpGkZFQ7L1Gg=;
        b=Hqgiltz7i0iCzfn2v5ZQlDG/Pu3jtUm4zsFiQ/MX49XN30CzTfKQRg3E6SYbc/Jnyh
         nU81yNWKwyxfhQxzl9DIeyEr2kvb/IH8ocmFZoNnITYjCgjH8IocaQVLWoFDeXIsFp2w
         EjDK0t/vxoykwHxyDj9udIRFu55cWmXG63J7uLTSASz/CHkhIQlLmV2Gbf1Mq8l9bHBe
         +nFsjcQVfk9VlsPSHgs+AozZZPKAXJyjXvgWzQa6sOOYVJNexwApoCzlUjYD1vdpfvvm
         q9wOA2AoiI7K88xvcH2Z7+ZQgXWK6PGyVawwCrZD4sJlTg3/RJXeEve1q5YOLDnDlxaD
         XvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715837385; x=1716442185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YdFXnIGmRLRVPEvO8GV0BepTlDMEgJMpGkZFQ7L1Gg=;
        b=F/J79fLZiVzkS80jynGx7M1br5OeCcWtHsPU1HjQzKgZ+Y8Ls47e6OxpeEReRRuRRv
         NAx3Qb7chdBl4qxIeHO16xV2kThagM7YeKEuJAFoHNyc2aXURtHOXSmd2HoCnSAo70g3
         f7FBlb+J+l3G9eCBahPNK4u+fOAHcGFIo/ZcBQz3c5EXZgESwBMBAL7qWbd6JJyzVT/g
         c5zHCDvel0A6Dd4TEFK9LdFd/4xJbJExG+gEnXGg4Uec/zudXDUA/y7zgXmMjrbPz93B
         FwDv4ZZx5kUQR4EBZZ13RNSmy2RSvMLOZnjuDFa+2obw6d54gV2M/r2mQ80+XTCA9PYl
         Ti5g==
X-Gm-Message-State: AOJu0Yzm3JTKAUvQnN1VNwls/qsgCBdfXSVsQAmIu4basN8ExjMrz1uP
	oQXB3OIHPy46BNItlo4edfdj3XBtn8MOXvOwspeaohf2bhxpa6CCqp49TPCuX0PejOw6O1As8FC
	fA0cFpqOoG6KUoiBXH4242oWLl/I=
X-Google-Smtp-Source: AGHT+IHwNNKS0FzvmV+YSwTeX6KUa9cIWOJDKfwVAYsJ+Cgw2MtSb+WurzFlijOu7fOhnkYuOty+uHIaMJ4XpV5m5Os=
X-Received: by 2002:a2e:9093:0:b0:2df:edd9:d005 with SMTP id
 38308e7fff4ca-2e51fd45434mr112787891fa.14.1715837385322; Wed, 15 May 2024
 22:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240506074548.16296-1-peter.marko@siemens.com>
In-Reply-To: <20240506074548.16296-1-peter.marko@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 May 2024 07:29:31 +0200
Message-ID: <CA+chaQdY=sq6egqkXewCq0BQutX4Z7r+coWG+3Vz0SJihJFWjg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] glibc: correct license
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 05:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199437

Hi Peter,

what about BSD-4-Clause-UC, BSD-3-Clause, ISC licenses included in glibc.

I've suggested to add them long time ago in:
https://lists.openembedded.org/g/openembedded-core/topic/91285771#msg166005
which resulted in:
https://sourceware.org/bugzilla/show_bug.cgi?id=3D28007
https://sourceware.org/pipermail/libc-alpha/2022-May/139167.html
but the discussion upstream stopped shortly after and the oe-core
change was never merged because of that. Maybe it's time to re-check
and ping upstream again after 2 years.

Cheers,

On Mon, May 6, 2024 at 9:46=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> The license per [1] is LGPL-2.1-or-later and
> [2] converted last LGPL-2.1-only references.
>
> License-Update: corrected from LGPL-2.1-only to LGPL-2.1-or-later based o=
n [1] and [2]
>
> [1] https://www.gnu.org/software/libc/
> [2] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommitdiff;h=3D273a835f=
e7c685cc54266bb8b502787bad5e9bae
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-core/glibc/glibc-common.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core=
/glibc/glibc-common.inc
> index b9516e77f0..91a3f5bcd5 100644
> --- a/meta/recipes-core/glibc/glibc-common.inc
> +++ b/meta/recipes-core/glibc/glibc-common.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "GLIBC (GNU C Library)"
>  DESCRIPTION =3D "The GNU C Library is used as the system C library in mo=
st systems with the Linux kernel."
>  HOMEPAGE =3D "http://www.gnu.org/software/libc/libc.html"
>  SECTION =3D "libs"
> -LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
> +LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
>
>  LIC_FILES_CHKSUM ?=3D "file://LICENSES;md5=3Df77e878d320e99e94ae9a4aea7f=
491d1 \
>        file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199036): https://lists.openembedded.org/g/openembedde=
d-core/message/199036
> Mute This Topic: https://lists.openembedded.org/mt/105935723/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

