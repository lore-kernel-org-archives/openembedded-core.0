Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE161CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 10:30:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.24089.1697711403455480155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 03:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FZYuXtm5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso3547075e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697711401; x=1698316201; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qb4zABQXno0AKchaHg9LLTTt6xNryj84gYNAC80gBV4=;
        b=FZYuXtm5aVw/CSLH1UvmJPaxkyD/zKXhZ5ydd9UIvUFc1j8qbaWyEyH/6HToSDIb5g
         +HFirFjKg33dzo2D2zX/GW5+OrzXVpY1IIFl3F/9dAt2GMrzOwrKCgBE16HAP9I1zGpH
         eAiYCsTXkWL7c3nRAEWLPhyHhMP+22vSL/s08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711401; x=1698316201;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qb4zABQXno0AKchaHg9LLTTt6xNryj84gYNAC80gBV4=;
        b=I01q5ru7vH2uwXO08/Qg9dKb4fLRJK+bVhTTGOoXrb1Nu9d4DSz1CabUPvb+2ygvMf
         APXGbFylYR/DtaUqxIHvOUDveZ2HGXDGK2fMlArxH2CEuokXFfJq3uObOCv56hCQZ4Vf
         wb5OYXqdEXVsnnr5ih/n5Qz4Y8wC3C24a36gFgW7YcvML+G6JxA8iF7hNLLl5XF+fhDY
         9Sp6GBq+hZz6eKJe52eorIX8h/mwpr7DVRpK7OQ3C5CBSAxGHV0me7yw5eiP2tQah0vk
         f/tMeqgIwHyMhW/42tcAJFLftLzbwHIoxDlAWXd+AAkPdiBskUNMQqOTUHxUE10s1qrp
         gp1w==
X-Gm-Message-State: AOJu0YwnrSTgJKCjRV2QOmY6Wo5l2CcWS/yrv7dK3xLoUVRZQrQ0SR1F
	BG9GIJJwiN14kEqptHHCF2Vccw==
X-Google-Smtp-Source: AGHT+IEdqdh0judA2fdB/wO8H79+0OF+WuqOx4vxrn8N7UoNk8zfJ+2JDHj+lKnZcmHBJMhqMf0duQ==
X-Received: by 2002:adf:a356:0:b0:32d:bf1c:ce65 with SMTP id d22-20020adfa356000000b0032dbf1cce65mr1444464wrb.22.1697711401614;
        Thu, 19 Oct 2023 03:30:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb? ([2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb])
        by smtp.gmail.com with ESMTPSA id e6-20020adfe386000000b0032d96dd703bsm4161667wrm.70.2023.10.19.03.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:30:01 -0700 (PDT)
Message-ID: <730245bb03edf4093e70e17f486642a853fe7942.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Add SECURITY.md
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Date: Thu, 19 Oct 2023 11:30:00 +0100
In-Reply-To: <CAApg2=RbNM458cX23K-fc_j=bMoY7CERGbUy1s3Bmj2OP5S+Zg@mail.gmail.com>
References: <20231017152517.26675-1-rybczynska@gmail.com>
	 <c3e775b4b76cbedfa9a4b0cdaff70deb575bd293.camel@linuxfoundation.org>
	 <CAApg2=RbNM458cX23K-fc_j=bMoY7CERGbUy1s3Bmj2OP5S+Zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 10:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189443

On Wed, 2023-10-18 at 07:03 +0200, Marta Rybczynska wrote:
> On Tue, Oct 17, 2023 at 11:50=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2023-10-17 at 17:25 +0200, Marta Rybczynska wrote:
> > > Add a SECURITY.md filr with hints for security researchers and other
> > > parties who might report potential security vulnerabilities.
> > >=20
> > > Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> > > ---
> > >  SECURITY.md | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > >  create mode 100644 SECURITY.md
> > >=20
> > > diff --git a/SECURITY.md b/SECURITY.md
> > > new file mode 100644
> > > index 0000000000..900da76e59
> > > --- /dev/null
> > > +++ b/SECURITY.md
> > > @@ -0,0 +1,17 @@
> > > +How to Report a Vulnerability?
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Please send a message to security AT yoctoproject DOT org, including=
 as many details
> > > +as possible: the layer or software module affected, the recipe and i=
ts version,
> > > +and any example code, if available.
> >=20
> > Rather than send everyone to the security address, can we suggest
> > bugzilla as the first port of call for anything public knowledge and
> > less urgent and to only to use the security address for non-public or
> > urgent issues?
> >=20
> > We do have the ability to mark bugs as security and private and then
> > triage unlocks them too.
> >=20
>=20
> Absolutely. I will be sending a v2 to OE-core only. When we agree on this=
 one,
> I will send it also to other layers. As they might come in different
> combinations,
> a SECURITY.md for each layer (like README) gives us best visibility.

I'm happy with the OE-Core v2 so plan to merge that to the nanbield and
master branches even if we've built rc1. I'm assuming Steve will add to
the LTS branches too?

Cheers,

Richard

