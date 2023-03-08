Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1CEC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 09:34:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.3100.1678268033790705004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 01:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eMW2hWxL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id l25so14715040wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678268032;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWXuYm6SFYsirqeK383qyzUAMXOW05THkyDx/0h0q7g=;
        b=eMW2hWxLEhAD4n3s9UXszk4Wa1RIr6rwZ23NFStydaUbnZVTXHHsELa5uQLaxbU7+y
         gmWCMgouSe3ZZyk0NQhr1hrzaXcTu1CANRkS80ECINxU7kVekR9fl0uzIfLCI0UHPbb5
         dJEtN6Q9pSelW7rFenPuaeHdJNMgjl+sR6hxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678268032;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nWXuYm6SFYsirqeK383qyzUAMXOW05THkyDx/0h0q7g=;
        b=tvdUQNi2SfGjKhqNxe8Dq9uAiUMQjk0/kFtLLh6UmC2dbcyXzJfnS6i/qcxPQoOtwO
         SIpIAG5gh2aJ+OjhpMYHhRK063C1AtFhO9G5Og3jktdXFbu+/TvovqPj8bV6TEZQiGkw
         KVopubSP8wtWml4tuKiQdo1CXQ3nLu3/jxInDLSxI5VNw3L4JnHuY78/x4oDsjNUeIw3
         dcLWWjUxhuuBEDF2haizml31g1GSRAuTdSgz1RB7jUUktamvcM3jZWQqGdkJfcZvK0Yv
         qeVlE7T1P9Buo/aMRMdEYUmLdFp4rCoaQ/1+LyEvCeFdbbEXncPw9MjB174TlJgVuuGI
         3D1g==
X-Gm-Message-State: AO0yUKUYNS32P+D7Q95SHK/do0v3DfeFrGl2kvTyeQGur3iJWml2lDnL
	rH23LThQbigMBBCEKl/GIro6bA==
X-Google-Smtp-Source: AK7set8CxM618G4K/OyJGzsXs8laKBjNhc39DhZEu5J3a4oj2ddDvqv/HlfTN8jX0KUMP+ph1QbJ3w==
X-Received: by 2002:a5d:4ec2:0:b0:2c5:483f:1580 with SMTP id s2-20020a5d4ec2000000b002c5483f1580mr16676751wrv.12.1678268031953;
        Wed, 08 Mar 2023 01:33:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id l36-20020a05600c08a400b003eb39e60ec9sm14677789wmp.36.2023.03.08.01.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 01:33:51 -0800 (PST)
Message-ID: <1bb970e2a519aca668d4cb5338347916d3628d34.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2023 09:33:51 +0000
In-Reply-To: <20230223065816.3151823-1-raj.khem@gmail.com>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178161

On Wed, 2023-02-22 at 22:58 -0800, Khem Raj wrote:
> Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PATH i=
s searched before
> DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> DT_RUNPATH, this order ensures that injecting
> malicious shared objects is way harder with DT_RUNPATH.
>=20
> This is now default on major linux distributions already
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index b2dbf241df..c69d29448f 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -96,6 +96,7 @@ EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} \
>                  --disable-werror \
>                  --enable-deterministic-archives \
>                  --enable-plugins \
> +                --enable-new-dtags \
>                  --disable-gdb \
>                  --disable-gdbserver \
>                  --disable-libdecnumber \

FWIW I 100% agree we should look to enable this.=C2=A0

Sadly, doing so exposes a bug where things that should rebuild don't.
That manifests as a failure in the reproducible test builds on the
autobuilder. I suspect a taskhash problem somewhere, maybe hash
equivalence, maybe somewhere else, hard to say without debugging it.

I've been trying to get to this to help. The first issue was to sort
the other gdb issue this appeared to trigger but was in fact unrelated
and an issue from the recent binutils/gdb version upgrade. I've
debugged the initial buildtools tarball bug and re-deployed buildtools
on the infrastructure. That fixed some of the manifestations but not
all, I then debugged the remaining ones, worked out the regression in
upstream gdb and sent a patch yesterday which was merged upstream to
fix it.

I am trying to get to helping with the problem this patch causes but
these things take a ton of time. Whilst I may get paid to work on the
project, I am one person and I'm getting pulled in a ridiculous number
of directions at once.

People should worry this triggers a reproducibility issue, it means
there is a bug somewhere.

I am hoping to get to this and to help try and debug it but the patch
cannot merge until we get to the bottom of the issue it triggers.

Cheers,

Richard





