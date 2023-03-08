Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D7AC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 11:54:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.5032.1678276430830608594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 03:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dc9kh0PC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id g3so15085641wri.6
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 03:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678276429;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecyQdw44/56Xt7gzszo1xV3kpWjJ+KGUi3qBn8vkDvU=;
        b=dc9kh0PC+6u8o5pUuhPgqTuxodXKUvphR3uZNa97fe2fwuc1tRf1uZZ6A4tEY4bkU5
         Ybvv4RrwQT5DJMvIG2SHJd1EXDY/rXu13GFciuo5BFq8269c71fFADUyJ9MVbHh5dDeg
         iNt6RoQAp6s5lOsgBSY1viXM7N+RldkPiBn3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678276429;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecyQdw44/56Xt7gzszo1xV3kpWjJ+KGUi3qBn8vkDvU=;
        b=vOy1uBxMh1fQWvj7G/jpmXeXDFUkTQrR/+E4DccG94lA98doGa26kfGWU0/T2/+ZAw
         y2KUYgvLHyb7CLxIX5iQlpD9L4aOtXi2N5RrGgL3TnDy+35DA4/K1Z0EWECJm7KufF1j
         qGe8eE3obzOIyQbijsUnlLRev/itTjMNCsqtc2JzJx0liSzR7qaIihWNn6pLH4QsP8hr
         SRBwzNe+7rjVZ90Uax/givn4QksAKo80p1rCFX5ttRdVXY47NSoZyQm2iJxIiYJpUFrn
         qsM+5pYI+R7ATlYQAxxKGXDh7gtT/0sZyjA9BMNl1CzpVceM3z2AlFOmvpfuviRWrmWU
         2hQw==
X-Gm-Message-State: AO0yUKUvnkr7iFoU+Vkxxx7F0Swg5o/8dPlVNAQyVEsXzOlSKpa1XUp3
	lbLW1I/xvso2rXAJ/XSL8XnlG0gwuA/MT9sF5l8=
X-Google-Smtp-Source: AK7set8Socu8N6Gk5CO+rARJwcRDTC7ViGZtTkbgXh33VVLXoaAKarECZK0TXxtPMrIukjby+78l2w==
X-Received: by 2002:a05:6000:1289:b0:2c7:1524:eb07 with SMTP id f9-20020a056000128900b002c71524eb07mr10338689wrx.67.1678276429304;
        Wed, 08 Mar 2023 03:53:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id j2-20020a5d6042000000b002c70d269b4esm14850780wrt.91.2023.03.08.03.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 03:53:48 -0800 (PST)
Message-ID: <4d5be496016f74255d2dbf5d8ae56ea45998b2b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 08 Mar 2023 11:53:48 +0000
In-Reply-To: <174A67E2AA88DEE8.12537@lists.openembedded.org>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
	 <174A67E2AA88DEE8.12537@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178169

On Wed, 2023-03-08 at 09:33 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2023-02-22 at 22:58 -0800, Khem Raj wrote:
> > Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PATH=
 is searched before
> > DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> > DT_RUNPATH, this order ensures that injecting
> > malicious shared objects is way harder with DT_RUNPATH.
> >=20
> > This is now default on major linux distributions already
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes=
-devtools/binutils/binutils.inc
> > index b2dbf241df..c69d29448f 100644
> > --- a/meta/recipes-devtools/binutils/binutils.inc
> > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > @@ -96,6 +96,7 @@ EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX}=
 \
> >                  --disable-werror \
> >                  --enable-deterministic-archives \
> >                  --enable-plugins \
> > +                --enable-new-dtags \
> >                  --disable-gdb \
> >                  --disable-gdbserver \
> >                  --disable-libdecnumber \
>=20
> FWIW I 100% agree we should look to enable this.=C2=A0
>=20
> Sadly, doing so exposes a bug where things that should rebuild don't.
> That manifests as a failure in the reproducible test builds on the
> autobuilder. I suspect a taskhash problem somewhere, maybe hash
> equivalence, maybe somewhere else, hard to say without debugging it.
>=20
> I've been trying to get to this to help. The first issue was to sort
> the other gdb issue this appeared to trigger but was in fact unrelated
> and an issue from the recent binutils/gdb version upgrade. I've
> debugged the initial buildtools tarball bug and re-deployed buildtools
> on the infrastructure. That fixed some of the manifestations but not
> all, I then debugged the remaining ones, worked out the regression in
> upstream gdb and sent a patch yesterday which was merged upstream to
> fix it.
>=20
> I am trying to get to helping with the problem this patch causes but
> these things take a ton of time. Whilst I may get paid to work on the
> project, I am one person and I'm getting pulled in a ridiculous number
> of directions at once.
>=20
> People should worry this triggers a reproducibility issue, it means
> there is a bug somewhere.
>=20
> I am hoping to get to this and to help try and debug it but the patch
> cannot merge until we get to the bottom of the issue it triggers.

I did have a look and the issue is actually fairly simple, glibc is
missing a dependency directly on binutils. Most recipes have this
magically, the magic is disabled for glibc as it is part of toolchain
bootstrap and has to be manually curated.

Adding the missing dependency appears to resolve things locally so I'll
send out a patch and we'll have to run some autobuilder tests.

Cheers,

Richard

