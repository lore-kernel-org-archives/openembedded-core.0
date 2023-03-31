Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E670C6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 13:26:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.54482.1680269211896334649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 06:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NJwE+fod;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so10000577wmq.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 06:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680269210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V6pwLOwXLGqpwidM51DrnIJLg4U3Msz4Olg5skXOMUg=;
        b=NJwE+fod1/Vpf4rFwPLgMu0H/bJI/rFn3XYv13eDn0H+ef2r7MB652PbsCtRb3EjnR
         Ouoll5zIoDIUlkRsGKXwgHgK3ab1/IFlKCRep283G2bbWjqRohmdde2lz4J0USOhvtvJ
         hZv9EA22i82xJL4pTGv/MvYW+JoouwYqYaYaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680269210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6pwLOwXLGqpwidM51DrnIJLg4U3Msz4Olg5skXOMUg=;
        b=DZVOH2myJe9b+B0hVKLo8MMZSRSaQB5vjGsKXLO+KrLdZ3/uf0HYqjHTZ90h/2sX8/
         70+HqXL6vmiHdavBmlbPPlNoF94FhX31p11wIqToxIpng9PLKNQZRRRm04l3xFT+ZZgu
         mxOeSUirR1cc31aC801yQ1k4aAD/KQQaTEs2L5lqCnN5ALKdu652C16zhzYnYwhurzDE
         x+sF4LRUanRZ6l5JrjJPVbsB8/Pnm5r3KfIVVIxj+cPbv2Myyu/OIK7OxPld+vBFwKHB
         nz00HJOCRkKoRUw324Djpav4n1Z/XbdvEmUIQw6mGS/mNsLwed98IBenXFYZNN71hZzG
         sxBw==
X-Gm-Message-State: AO0yUKWsP34JR+ptuiXWSVOk9Y13cbKqfLPJlRS1WrnXZnknGrDz3G52
	7e0CDeZEPCgmHp5j+fETUHL/Sg==
X-Google-Smtp-Source: AK7set9qv/+LtwZ6RA8jNakKHFibpcejT2Yk/O+ogtcKh4dNJHsYpmBD4RWzbc8VTiMczZzEenopBw==
X-Received: by 2002:a1c:7219:0:b0:3eb:9822:f0 with SMTP id n25-20020a1c7219000000b003eb982200f0mr20271230wmc.30.1680269210377;
        Fri, 31 Mar 2023 06:26:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18b7:bfe:d74b:7341? ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c220700b003f04646838esm1464685wml.39.2023.03.31.06.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 06:26:50 -0700 (PDT)
Message-ID: <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for
 zvariant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org, alex.kiernan@gmail.com
Date: Fri, 31 Mar 2023 14:26:49 +0100
In-Reply-To: <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
	 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
	 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
	 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 13:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179443

On Fri, 2023-03-31 at 15:21 +0200, Alexander Kanavin wrote:
> On Fri, 31 Mar 2023 at 14:27, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > We do have other reproducibility issues in rust and had to exclude some
> > packages from the test because of this. We do want to resolve those
> > issues though.
>=20
> But aren't recipes in meta-selftest exempted from reproducibility require=
ment?

I suspect we can put an EXCLUDE_FROM_WORLD =3D "1" in there and then this
will "go away" but shouldn't our output be reproducible and isn't this
therefore actually a good test?

Cheers,

Richard

