Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39793C77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 15:45:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.21170.1683733513039772885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 08:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=B4LKUyU3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f42d937d61so16670815e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683733511; x=1686325511;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j+eJPeFbPJZktgACnL4nzOF0+Atzco9zYns/+m1WaRU=;
        b=B4LKUyU3t7jUfq2x8RHTaQKrQbVWAR2s2uXXEie/9QNdk+kid8+UepI/g3dWZ56i5p
         kAc+t0SykoB2m6O3Shqc+BJl1a9yAeirVRS9im6PMKaj5v9iGU/k7bj5UYmUh6D2yY8i
         YVg4vxwyQC6NVB+QHhLbr+09VUQPZ/v2IJ0lU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683733511; x=1686325511;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+eJPeFbPJZktgACnL4nzOF0+Atzco9zYns/+m1WaRU=;
        b=lgDZ9LdqrcvPqf4ZeZ9t/z9xQ2nddmZnhtKuQMIwc/S6BKaVtgGJJAZjNT+tMkDtJc
         KTe5dTJBqbDc+tBxhI4Wo2IEAMgaBw5PvLm9nfnq30+RU5V69aOXjBUeIgb1Y5xdrx6r
         CBpgL1uJvcdfD7mkcP9rwq3PnpqCG9QHpKdZ+/oFIhRjCSoCi/8o3jOb1YCNTqOvSJql
         +sfzUzzsJbJfue1lXQ0WFD8SatzuiRJepxg8imxfX7ITDfJa5RV5Q0hHLLXPOJqFthJv
         2MgKYGuPzx+GdudCrtzxiY9Cht+4Kqg7ckDkGjTXmuWtxnEdoSZaU9e1XqccAZGnfSbc
         tBcA==
X-Gm-Message-State: AC+VfDzJeOPaPrG45Sp1OMDO/gHJiI1zxIlP2RuKWbqDMKkXUYYJGgF9
	qrmFnVxlckeKbmn0pPy92ff9/Q==
X-Google-Smtp-Source: ACHHUZ4mr9sySskw6d63FE44W6wn9jweL6k7WwH6h/7hwthbQg2KZJB/30TEd34ZHZmmURkFuptZgQ==
X-Received: by 2002:a7b:cd83:0:b0:3f4:2ae5:b35d with SMTP id y3-20020a7bcd83000000b003f42ae5b35dmr4981755wmj.40.1683733511467;
        Wed, 10 May 2023 08:45:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:97c0:2f0a:108:d273? ([2001:8b0:aba:5f3c:97c0:2f0a:108:d273])
        by smtp.gmail.com with ESMTPSA id p8-20020a056000018800b002f28de9f73bsm17961438wrx.55.2023.05.10.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:45:11 -0700 (PDT)
Message-ID: <7358419d11a14ede93b1185278d7449c703f824e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Further updates to the ppc patch after
 upstream discussion
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2023 16:45:10 +0100
In-Reply-To: <CAMKF1soShQAh8LgR8juuRc1TXPUu-eyA0XCWH2Z2wj82yttMOA@mail.gmail.com>
References: <20230510112603.1720223-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1soShQAh8LgR8juuRc1TXPUu-eyA0XCWH2Z2wj82yttMOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 15:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181114

On Wed, 2023-05-10 at 08:04 -0700, Khem Raj wrote:
> On Wed, May 10, 2023 at 4:26=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > After someone tested real hardware, the patch needs tweaks to match the=
 3.0 ISA
> > behaviour. It won't change much from our perspective but may as well ke=
ep the
> > patch in sync.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/qemu/qemu/ppc.patch | 89 +++++++++++------------
> >  1 file changed, 44 insertions(+), 45 deletions(-)
> >=20
> > diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-d=
evtools/qemu/qemu/ppc.patch
> > index 1fe6a3b4139..22d26e23d9b 100644
> > --- a/meta/recipes-devtools/qemu/qemu/ppc.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/ppc.patch
> > @@ -1,11 +1,12 @@
> > -From d92b63b7d15d4fd202c5802dfe444a96f5d8109c Mon Sep 17 00:00:00 2001
> > +From 31f02021ac17442c514593f7b9ed750ea87c21b1 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Sat, 6 May 2023 07:42:35 +0100
> >  Cc: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
> >  Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
> >  Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> >  Cc: Richard Henderson <richard.henderson@linaro.org>
> > -Subject: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS* instruc=
tions on
> > +Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > +Subject: [PATCH v3] target/ppc: Fix fallback to MFSS for MFFS* instruc=
tions on
> >   pre 3.0 ISAs
> >=20
> >  The following commits changed the code such that the fallback to MFSS =
for MFFSCRN,
> > @@ -22,25 +23,23 @@ instructions which is used in glibc libm functions =
for example.
> >  The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was als=
o missing.
> >=20
> >  This patch restores the fallback to MFSS for these instructions on pre=
 3.0s ISAs
> > -as the hardware decoder would, fixing the segfaulting libm code. It an=
d also ensures
> > -the MFSS instruction is used for currently reserved bits to handle oth=
er potential
> > -ISA additions more correctly.
> > -
> > -Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/2023050=
6065240.3177798-1-richard.purdie@linuxfoundation.org/]
>=20
> I think you dropped this line accidentally.

Ah, yes. Patch merge issues, fixed in master-next.

Cheers,

Richard

