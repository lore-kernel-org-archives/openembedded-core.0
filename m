Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A0CC001E0
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 15:20:34 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.110428.1692026430236637843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 08:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hIyvi9DQ;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1c4dda61eb0so901732fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 08:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692026429; x=1692631229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKkXTsKeM0eWtsW+hkFE360nUJjrTy5IWH7DOT9bdzU=;
        b=hIyvi9DQRhBTVRU1t4L8F3XM8JjDW53ilcBSyqOLWi0axZqkXwtILHLM+J/aSNavxr
         G1nmVBt4hDZdwDzNCclBVIvZDNG9+xXKhkTc9bQWw5x5d1SeUEbv2hlJP4j5HOr+5+d1
         vGbe0PsKfdfBkkWCIHT5ljLEzqjjNhkIF3SHolZjTSJiK31j/1tYvXH7saEpXA+GcNae
         6P5IM8c7A5j3/tO2M/QkBejAXnYp1w8EqLrFKXhXe/jlJiwfc/c7h1osvTV5KLiEdOXV
         8ofTLDNr26xXdUhoRv7hJssgTZNmLM/8O5OspVo0k7oLbuglVblBR6zcZzyta0dUaGYu
         WlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692026429; x=1692631229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKkXTsKeM0eWtsW+hkFE360nUJjrTy5IWH7DOT9bdzU=;
        b=LS0PYPkQaRMluR7HJ3RQFnnjMytelE+4xaj08jckPRruVgSj9JluvP/4iPcZO6oX7V
         DYcof7dqZwaFubxn7pyZ1VUVo5nvJ+cTFGsD+PF6G3FcR+6hVi4d9EmqN7Qt8q1+b20J
         dRgW7lOkL4oou1hpr3cSZBkwSluiS79c8LXrFNdN+Ve6akJkbfmTB2MQFTWxK9p9TTnR
         wH4sRS0fAcIbZ7CRC+u9/3mlEkmowYvlc1JMaEL7UWt7hQDzOV8vG3KVhuEmWc006x2F
         eVQi15V+W4g5viCJHr+k6tL3kWQTsc6fkTWcZTd+nvWhR7SRHsWI3YusRu1ENq21P6o6
         4YDQ==
X-Gm-Message-State: AOJu0YzGPJOdg4jKKX22aEOkLsx4xaFTv4veJJmJKT9k21yBKsCjI07y
	BOQFg9hkEtK3KeH/xoKhfrb1tiniGbX8kU94T+M=
X-Google-Smtp-Source: AGHT+IGoZjNm8geC0zZOIBcU+aRVb3ZjFPIlVGsopDLZzJf0BEPLdoV9AtjspyWjqYSpv3LT88LMS95Vaiq2eAG0B7A=
X-Received: by 2002:a05:6870:468e:b0:1bb:867e:caeb with SMTP id
 a14-20020a056870468e00b001bb867ecaebmr10358824oap.51.1692026429427; Mon, 14
 Aug 2023 08:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230814115051.3980959-1-sanjanasanju1608@gmail.com>
In-Reply-To: <20230814115051.3980959-1-sanjanasanju1608@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2023 08:20:03 -0700
Message-ID: <CAMKF1sr2akFJUeuy2C8E4ucjR4OH+WW_xMY6ChCQhw8s+wXq+A@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] binutils: stable 2.40 branch updates
To: Sanjana V <sanjanasanju1608@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com, 
	sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 15:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185936

On Mon, Aug 14, 2023 at 4:51=E2=80=AFAM Sanjana V <sanjanasanju1608@gmail.c=
om> wrote:
>
> Below commits on binutils-2.40 stable branch are updated.
>
> 391fd4d9ee5 PR30697, ppc32 mix of local-dynamic and global-dynamic TLS
> 7ad52a2357f [GOLD] powerpc DT_RELACOUNT
> 03f49a0619c PR30536, ppc64el gold linker produces unusable clang-16 binar=
y
>
LGTM

> Signed-off-by: sanjana <sanjanasanju1608@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.40.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/reci=
pes-devtools/binutils/binutils-2.40.inc
> index fb99d93b26..33e7f4198d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.40.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
> @@ -18,7 +18,7 @@ SRCBRANCH ?=3D "binutils-2_40-branch"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV ?=3D "7343182dd163d14b7e17c255515940dff67f2bbd"
> +SRCREV ?=3D "391fd4d9ee5d2b78244cbcd57fc405738359b70b"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"
>  SRC_URI =3D "\
>       ${BINUTILS_GIT_URI} \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185933): https://lists.openembedded.org/g/openembedde=
d-core/message/185933
> Mute This Topic: https://lists.openembedded.org/mt/100734909/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

