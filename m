Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97038EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 11:26:55 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.10644.1689852414943068653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 04:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=IpJ/nO5X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3143ccb0f75so598302f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689852413; x=1690457213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MhACF1yxhNcQSFJJ0psv5zyPTjFb9tnj2Q+rYwAXGVk=;
        b=IpJ/nO5X6XVpBy039Oq0/HCURqVaH51iwxSqHhtT0g8ZpPENMZPaz/7R9JouoIdmKX
         lGcypm0Gv0+789CDu6DIRGFuOY158/YHvAHuWONwv8MQKQxHPXzLspcBXKWKoxPTj7C4
         MEp9ep0fh7uBlwUf5X/8C4TCG+m0NCl7whBhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689852413; x=1690457213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhACF1yxhNcQSFJJ0psv5zyPTjFb9tnj2Q+rYwAXGVk=;
        b=mB5Z1t6IXopQmkkpAzUGxkG4A4E+wLhDuxCrrXnhl5CHT3704fdTm9UUMJxGMTjPz8
         H0aTq9nrjiFQWcVP/fjcs41zzAGwRasnurZXRo/jce0yR0FfVVmxBcyXBL1LYdl5evkU
         2jum3dqZL+sk70SMVHsEjE5vnHzIyTxSZVi/7HZNbSJBKzzqrI3FUnsQaK53Z8TrOqqY
         K9OZFKHY7B5+6XZlXr4Es3eX5iFmcRTIOhpiE6233P+gMdVtBiHj00Y3N1rwyWX5REVF
         M0YwMbC2C5nckWuPvi9/XeIotKdEgbwV3bamrf4WDnnpA1OzTS6Wx2ZIbSp3SHRIjT0j
         AW0A==
X-Gm-Message-State: ABy/qLbNSVjOuBN+FbQPAQ89RtXDzTsOrzRtEx+MSd56JHDaYoo2mWVu
	S0/JRfAo+t7iKBqFfODQrUNQLtsgcEF4Jf3xC3c=
X-Google-Smtp-Source: APBJJlEBmvrgIMFTjj4DUxS174Oaxux0fpQ3RcbBtxvEIqkmJ2D5w0PN6js/QW+vXRU1TtkOt7HAXQ==
X-Received: by 2002:a5d:6d4b:0:b0:315:99be:6fe4 with SMTP id k11-20020a5d6d4b000000b0031599be6fe4mr2091403wri.69.1689852413193;
        Thu, 20 Jul 2023 04:26:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba5b:ff9f:e968:6d69? ([2001:8b0:aba:5f3c:ba5b:ff9f:e968:6d69])
        by smtp.gmail.com with ESMTPSA id p15-20020adfce0f000000b00301a351a8d6sm1065766wrn.84.2023.07.20.04.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 04:26:52 -0700 (PDT)
Message-ID: <1c22b4fdfdcf22b58f7e06df872a9e0980645328.camel@linuxfoundation.org>
Subject: Re: [OE-core] Toolchain test results
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>, 
 "Mittal, Anuj" <anuj.mittal@intel.com>, Randy MacLeod
 <randy.macleod@windriver.com>, "Kokkonda, Sundeep"
 <Sundeep.Kokkonda@windriver.com>
Date: Thu, 20 Jul 2023 12:26:52 +0100
In-Reply-To: <1772EB68FCA90E64.1400@lists.openembedded.org>
References: <1772EB68FCA90E64.1400@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 11:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184634

On Tue, 2023-07-18 at 10:14 +0100, Richard Purdie via
lists.openembedded.org wrote:
> qemuarm has ~350 failures
> qemuarm64 has ~350 failures
> qemux86-64 has ~4000 (3900 in glibc)
> qemux86 has ~4000 (3500 in glibc)
> qemuppc has ~600 failures
> qemumips64 has ~5000 failures (all over)
> qemumips has ~1600 failures
>=20
> Anuj: Can Intel look into the glibc test failures on x86?

I realised the glibc issues were due to the network being disabled for
the tests and have sent a patch to fix that. That reduces the failures
from ~3900 to ~330. We should really try and reduce that further but it
is a start!

Cheers,

Richard


