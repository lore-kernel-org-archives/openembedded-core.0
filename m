Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02EAC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 13:24:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.19105.1683120269766808224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 06:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=PS6J8nKr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f1cfed93e2so51709195e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683120268; x=1685712268;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xw8jDEpQb18vHITOll/c2M6hqUM94oVKAxM+5rTrmEE=;
        b=PS6J8nKraqgODV7Fqzk6f6o0sC0pqcAx6egc/HGYGcUdD88s72ys9RFv97OiJ3h0RC
         yJl1EP2c+C002p91a3LoT//Mo+MVLAjKTIv4Sz3GkKjDfbR1+Wc9rX1vhO0uF1UtD/0E
         vrueZ6EJ9mT77jtvZ0E6NexbUnfzpY9wXfZnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683120268; x=1685712268;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xw8jDEpQb18vHITOll/c2M6hqUM94oVKAxM+5rTrmEE=;
        b=Wl0to1YdOTSLuJG1VO3rkoUPSOL0PEDWKaP+xwjjdoq0/a7bOx4OodB3vG4yoWzwqC
         nTGXO2djKt8nva6yE6x+SU14YSfYJaGnRHrn7gMAtfCPXH6XXjBX0QNGSG2LJct7a0bn
         PBH106zUoSuwalUfCqPwh6B71SidBjMjPk+t3ncdHV3RWtQvuPhWB1kBKdzd4uAOo5FK
         7ulnoTolzi5QPk9VtTU37zvzZ6I9Ze3qrJZz9PhE0pKCRqANjdSkxxowWRgjVhrw/kPi
         Imp5Hjvd2IzSMKwAAB0VMBu+WaXw4paAeI+SAof+TSl+sq1NXboAon0ByZmknFkVj0EW
         j4Nw==
X-Gm-Message-State: AC+VfDxjH4c8GhDo0h5B3mOCBexm6Xbt06bpVdxEHBzPBv4MxFm4fX2f
	D1VHczBcHhXLtahMWNI/cWoQdg==
X-Google-Smtp-Source: ACHHUZ5RfrCnuReIwmLbOxMytpDIsMTfvwUuM1VYTjMEo0lIafdoJXxia6RMIco+tNhL992WCTtWbg==
X-Received: by 2002:a05:600c:b41:b0:3f1:79ad:f3a8 with SMTP id k1-20020a05600c0b4100b003f179adf3a8mr15100245wmr.16.1683120268051;
        Wed, 03 May 2023 06:24:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b003f17f9965a7sm1942802wmi.1.2023.05.03.06.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 06:24:27 -0700 (PDT)
Message-ID: <50cb843b7f9399ea3b60f01681c3d808a54d557d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add "xz" to HOSTTOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	michael.opdenacker@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2023 14:24:26 +0100
In-Reply-To: <CANNYZj81SkyZ_vZmeR4xvOSBAMWihxpravM4LB5sO4Uauc+6iQ@mail.gmail.com>
References: <20230503095239.2487980-1-michael.opdenacker@bootlin.com>
	 <b8d70b39c6cfd3127a6871f6666e86de0eaecc77.camel@linuxfoundation.org>
	 <fe25f670-5d6a-45a8-fdd8-301c44ee7e7f@bootlin.com>
	 <CANNYZj81SkyZ_vZmeR4xvOSBAMWihxpravM4LB5sO4Uauc+6iQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 13:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180825

On Wed, 2023-05-03 at 14:42 +0200, Alexander Kanavin wrote:
> On Wed, 3 May 2023 at 14:39, Michael Opdenacker via
> lists.openembedded.org
> <michael.opdenacker=3Dbootlin.com@lists.openembedded.org> wrote:
> > Then, we I ran my tests on a fresh Fedora container, bitbake didn't war=
n
> > me but "xz" was missing, but this prevented the uninative shim from
> > being installed. It seems that at least on Fedora, "xz" isn't pulled by
> > the other host tools we install.
> >=20
> > I guess most people has "xz" anyway, which could explain why this wasn'=
t
> > reported before.
>=20
> HOSTTOOLS is used to filter tools from the host in $PATH, at least in
> bitbake tasks, so is uninative extractor bypassing that somehow then?

The uninative code calls tar from the host. It then probably depends
upon how tar has been configured and whether it calls xz or uses a
library?

I'm guessing in the context of uninative, PATH hasn't been locked down
yet.

I think we probably should add xz to HOSTTOOLS at this point but it
probably does also mean we should change ASSUME_PROVIDED and there are
some things with an xz dependency which will need to use xz-
replacement-native since they probably need library components and not
just xz itself.

Cheers,

Richard

