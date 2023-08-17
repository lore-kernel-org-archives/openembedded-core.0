Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FEBC3DA65
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 17:27:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.747.1692293223378016285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 10:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0ZdLAiyW;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c1c66876aso1059372766b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 10:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692293222; x=1692898022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYWet+gZXucyiHRH9Z3e+AjG2ppRJAczQqd3747WNM4=;
        b=0ZdLAiyW9n8paNs2LOK7BF3g3OGCZYWDxE6pHHfAcp6b9hmuu4Y2hvCyKTiKGE+zM3
         RIadFWAWHw6LRZsOlM2JTQuMxvJcU1juZK+v7mrcitbj9YR86y9GnHbQruPCj/XfAoAC
         NihLBss/aoR/zTFYX9ZDkcJDOkPYbE8wdqbiqfXA7WBypwoz4U4+8DRHkhVx+b8UTY1f
         Pys+W3oXvl+FwXs3vJkvSA0IQLuSuZw48hChcU1yLhXX877mKC9mNkjL7xFCXDtq8npd
         K6qW93ZR9iIxAl3PKfBsDPb7xkzyqGuJUzL+38qZmWpDVWunQWT7EQ2bqgfaQfcES41o
         Nvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692293222; x=1692898022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYWet+gZXucyiHRH9Z3e+AjG2ppRJAczQqd3747WNM4=;
        b=ZqyJ/a8vesRW1vDgzobs4pPqqpHS6tESLH53pYuxwABiS/Jtlbsr84mPBQeUyKHs/p
         aiuV25p9eUqw7PSBYO9LzxGtCrU4sBf2Z5ToCkoa/7XQiceyyMBI6EghkM4bEyAI0TaB
         tp7SSFioqLb4aTrTRq/uCex4JQAWlqoY7mTBSloVPVNGrt7Zz9kCkgqXH1lHBJ+x9yf0
         9V4j2E4YsjISUqaLHTm+R59tIvdEpvta2+wHEZfaymRe+kB/jP3x7Ak5PLKlXCSLjM4j
         b4lRPIrr8Hz5RzcWyg8SJri5S7lf7Fw+k2ETkXqunIk9QWjk9qhFshIEqEtpT7tFoJMJ
         lzSg==
X-Gm-Message-State: AOJu0YwpcyqoeRquPFi9vAnoCMYG35cvAuLQZHnBubuY70vV6IMNPJ7S
	08Q3aVNSkDhBh4XyKMHbpVyn8eHhc3fV7ZvTMJDF/lX9/fIXcWA0
X-Google-Smtp-Source: AGHT+IEMcs0HkGBYKiZRGZBJaAnLJVDwVqGZfAaSX5+kSKQj5KqcoixLFPNFNtgmjvPFKgQe3TnsMp4+mO4mLzsjhZk=
X-Received: by 2002:a17:906:5392:b0:98e:16b7:e038 with SMTP id
 g18-20020a170906539200b0098e16b7e038mr79616ejo.23.1692293221508; Thu, 17 Aug
 2023 10:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230817101824.613376-1-archana.polampalli@windriver.com>
In-Reply-To: <20230817101824.613376-1-archana.polampalli@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Aug 2023 07:26:49 -1000
Message-ID: <CAOSpxdYdnVvRefw2Dst94cMgUwhun7nV_u_rRUJnRgRwDB4Vyg@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] vim: upgrade 9.0.1592 -> 9.0.1664
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org, Hari.GPillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 17:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186330

Hi Archana,

This version upgrade will need to be submitted for master first before
I can take it for the stable branches.

Thanks,

Steve

On Thu, Aug 17, 2023 at 12:18=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Fixes:
> https://nvd.nist.gov/vuln/detail/CVE-2023-3896
> 8154e642a (tag: v9.0.1664) patch 9.0.1664: divide by zero when scrolling =
with 'smoothscroll' set
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  meta/recipes-support/vim/vim.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 33ae0d8079..9a7b7650a7 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,8 +19,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://no-path-adjust.patch \
>             "
>
> -PV .=3D ".1592"
> -SRCREV =3D "29b4c513b11deb37f0e0538df53d195f602fa42c"
> +PV .=3D ".1664"
> +SRCREV =3D "8154e642aa476e1a5d3de66c34e8289845b2b797"
>
>  # Remove when 8.3 is out
>  UPSTREAM_VERSION_UNKNOWN =3D "1"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186304): https://lists.openembedded.org/g/openembedde=
d-core/message/186304
> Mute This Topic: https://lists.openembedded.org/mt/100797549/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

