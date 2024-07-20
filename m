Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C4DC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 21:08:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.13910.1721509701333464105
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 14:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GmBy99rB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3686b554cfcso1175383f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 14:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721509699; x=1722114499; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ+QM4tWWwJ8YiRtkwtqCI463W/+jcDHVi4z9VUp4ag=;
        b=GmBy99rBrfiPiGhj1ncgs07H8BXRNU6mihMCihFYcTwqNxi5pElqiQHeC4Md6IANb2
         DR3FCvSFbmfLHYVWbeTJ1BH51Z4m+38rNpWUReVuPrG9A3uh2gbyym4UOe/9OKocjNir
         Wq5MmNRsaTrj/NMGA1HozY1bqZ8FlBlV/rmis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721509699; x=1722114499;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ+QM4tWWwJ8YiRtkwtqCI463W/+jcDHVi4z9VUp4ag=;
        b=hN89SHedZNj5CNT/h9GrQ35WXreWZW2Ol9hdNZiHkA7cLGYzrAEUHQS8/qwmintcwL
         BCoYQv7ziDwRLQFOLs5MIu0HPtBWXoCv546v1+ojoBrXI3pF5zuX4rlL2u08tvHa1O5I
         FQrwwuIc9lxVqNtcVGn2pnjmb0exPP7atvLWyzBO9isJwVNNK1ag1NsOs5Qf0WrfThbo
         v4wSzZ+wnbq/WGWFiIf6eHxvjigwvWZJ67Qv84jKEzpqZvWEjbboO6sQinBuDmjCbnq9
         k9S8qqBiMCclp3EZj6BGL/A+azggaLAm9VaGPuKNIFY1k3Ut8WZTr/OgNUndR2kqXICR
         dgiw==
X-Forwarded-Encrypted: i=1; AJvYcCV+6E/s+CEqgHpjVyNIzr2/JyLLnMPI61g6HPmnjgqVlJ4FcFJtnusExC1uYFTOUM2HnjVWyY6dzVlL/Dqraw2cRy4ebZDtHQTgHetF1e/XvRPI4H7yJkRM
X-Gm-Message-State: AOJu0YwPrykwl4qC5RKQTBEqSL+nfoCxFxr5fxUH75aFq+0KKGcNhJtj
	eeJ6xtc4RWHoWQ79MUGhOuJ6XTfAYjftvYG/wQyQmU1KL8RCgJi/AH9Fr0ae2S8=
X-Google-Smtp-Source: AGHT+IFgfZDeGiztQGuKg7sbxJZwZUBeGVad5O2J8Kre29n9ubN3C6qulDT8G1RHA2OMUC1H1dI06w==
X-Received: by 2002:adf:fa0f:0:b0:367:923b:656b with SMTP id ffacd0b85a97d-369bbc91be8mr1504519f8f.54.1721509699245;
        Sat, 20 Jul 2024 14:08:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e49:bbd4:ac1b:154b? ([2001:8b0:aba:5f3c:5e49:bbd4:ac1b:154b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ec6e5sm4580109f8f.96.2024.07.20.14.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 14:08:18 -0700 (PDT)
Message-ID: <6e2912a709610550a708ac749baffd6665bdc195.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] glib-networking: upgrade 2.78.1 -> 2.80.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2024 22:08:18 +0100
In-Reply-To: <20240719132523.976790-6-ross.burton@arm.com>
References: <20240719132523.976790-1-ross.burton@arm.com>
	 <20240719132523.976790-6-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 21:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202292

On Fri, 2024-07-19 at 14:25 +0100, Ross Burton via lists.openembedded.org w=
rote:
> 2.80.0 - March 14, 2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - Mark plugin functions as exports on Windows (!250, Amyspark)
> - Updated translations
>=20
> 2.80.rc - February 29, 2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> - GnuTLS: fix improper use of IP address in SNI extension (!247, MARTINSO=
NS Frederic)
> - GnuTLS: major performance improvement: reduce unnecessary trust list cr=
eation (!249)
> - OpenSSL: properly handle BIO_CTRL_EOF (!248)
> - Updated translations
>=20
> 2.80.alpha - January 5, 2024
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> - GnuTLS: Add warning when system has no trusted certificates (!243)
> - OpenSSL: Fix bug when populating trust store (!244, Alessandro Bono)
> - Fix license on dtls-connection.c test (!245, David King)
> - Updated translations
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-core/glib-networking/glib-networking/eagain.patch=C2=
=A0 | 2 +-
> =C2=A0.../{glib-networking_2.78.1.bb =3D> glib-networking_2.80.0.bb}=C2=
=A0=C2=A0=C2=A0 | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-core/glib-networking/{glib-networking_2.78.1.bb=
 =3D> glib-networking_2.80.0.bb} (95%)

Sadly this resulted in ptest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6652
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6828

Cheers,

Richard

