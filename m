Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BACC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 23:08:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8285.1678921691777813674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 16:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FuKyNQoD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id m35so36214wms.4
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678921690;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wdIrcg9ioWupGombdUn9GRer4tQBEqbDevI9VRZT2Ak=;
        b=FuKyNQoDWtG2G56MHQyXXYw8b2d/9LegNqk7mp221D/Bee0FeYokv3FYVh8cjAvHET
         xBBRF23ekLY3UIm/Dr2IoiiTjTRWQILdwV+rFpWVgdZDIODAHNIv7yTBRKrMECsrnYHA
         /rOyk0g3yKXo2g3Dwo+pQbRvADptwHpb3EyTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678921690;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wdIrcg9ioWupGombdUn9GRer4tQBEqbDevI9VRZT2Ak=;
        b=i0L+EetxUWqVftLfAnmdtlooIZeEdZ/9nfQXNuWH9l3W6rGT1vNQlGxCIX1jsy/O+Z
         jytS+O2RbdERocj7y+OPia1uxP6sg0cesqs4MCQHezjuc3/EkAgp68KzdNjIqVhbavYc
         AjV0U/lPAQklc1Ii3p5azUohKBBfYdz9rPQKk1YjWpclDdIItYuNEggOCvZGOv9YJjc5
         mRY79sGcr7+9JR4QrMRAW5B7Ij62rbB+42pq7MdiHGLXtfVuHSETRytHim/8tVN9f/jG
         mSydZyRaE+csdf3Blu0UqUogBmpP1KlGtoNQfvdbL+EBbepkJgx4dIo4tt2/VlrZWsbc
         EYXA==
X-Gm-Message-State: AO0yUKWTcw56sWNn4eDdz6KWnZ642rdNg/Rxy2Z3MibrO7+mScE6QjcT
	iZdltPecGIQL25gdN1ASnam21g==
X-Google-Smtp-Source: AK7set/8WILJRa/GsaRVd5Xi6xAjQIrPBqEXDkAtvBDvHvU35LOSwMGXRPY1dvnZo1P8N439/kXmVA==
X-Received: by 2002:a05:600c:4f4e:b0:3eb:29fe:f91e with SMTP id m14-20020a05600c4f4e00b003eb29fef91emr19428299wmq.21.1678921690122;
        Wed, 15 Mar 2023 16:08:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4181:67:6e43:6a9? ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id bd20-20020a05600c1f1400b003e21dcccf9fsm3169305wmb.16.2023.03.15.16.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 16:08:09 -0700 (PDT)
Message-ID: <4ffadaa158a865afd1bc4c76c79244d904fefb54.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meson.bbclass: Split into meson-common and
 meson classes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zoltan Boszormenyi <zboszor@gmail.com>, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Mar 2023 23:08:08 +0000
In-Reply-To: <efae316a-c655-ab08-13cb-214be93b59f2@gmail.com>
References: <20230315080020.2648416-1-zboszor@gmail.com>
	 <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
	 <efae316a-c655-ab08-13cb-214be93b59f2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 23:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178662

On Wed, 2023-03-15 at 18:20 +0100, Zoltan Boszormenyi wrote:
> 2023. 03. 15. 17:52 keltez=C3=A9ssel, Ross Burton =C3=ADrta:
> > On 15 Mar 2023, at 08:00, Zoltan Boszormenyi via lists.openembedded.org=
 <zboszor=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> >   apart from the CONFIGURE_FILES line which would still be needed in th=
e python-meson case anyway.
> >=20
> > I can=E2=80=99t see what is gained here, just inherit meson.
>=20
> The problem is that "inherit meson python_pep517" ends up with
>=20
> do_configure () {
>  =C2=A0=C2=A0=C2=A0 meson_do_configure
> }
>=20
> do_compile () {
>  =C2=A0=C2=A0=C2=A0 meson_do_compile
> }
>=20
> when the python_pep517_ prefixed ones are needed.
> It has something to do with the fact that both has the line
>=20
> EXPORT_FUNCTIONS do_configure do_compile do_install
>=20
> Which one wins may depend on inheritance order but
> who's to say for sure and why can't this be order agnostic?

Which one wins being due to inheritance order is by design.

The export functions code adds wrappers meaning by default,
XXXX_do_configure is called by do_configure but if needed you can write
a custom function which does something like:

do_configure () {
    pep517_do_configure
    meson_do_configure
    autotools_do_configure
}
   =20
i.e. call class specific definitions in an order of your choosing. I
appreciate the above wouldn't make much sense but you see the idea
behind it.

> I need most of meson.bbclass for the settings in the new
> meta_mesonpy class to pass to meson but using the pep517
> machinery.

I really dislike these "common" class abstractions and I think we need
to find a better way to handle things. Order does matter to class
inheritance already so we can rely and document that if needed.

Cheers,

Richard


