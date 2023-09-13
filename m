Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3978EEE01FA
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 17:40:42 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.3497.1694626841256745556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 10:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=X+5UVwwP;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1d53ab187e8so62065fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694626840; x=1695231640; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/WLdZmC8Xx/sOd4oBmeHrhw37hnWnhRX8n5ANeM8S4=;
        b=X+5UVwwPoDr7pPsSUIV32Inn24lBK0sL9hBWuOF22YVeHCi6cGvef/YY5NqWJU2lrG
         xxHtgXWSAewdaECSSb3v+DDzfBXRyFv/VGJJm2x9KuOjGxI0LuA850vG1M5bc4ynJ1FN
         TzZOT/aKuDYV1XxzIxp4b7Vw2duidMP+uWGNfVcNDMf6+NkiJAe6zWdQBUlDOQqIqROw
         RJPhOxRSBZVgOZpB4SHHLKzUkWxzXvjvcMf8E2wQGlEU2nLh8SRRa16mtzEoCbCZwpri
         5D13Cy1FMvzrGHhgjYnYxboUArVvOsDM1qjSkH++QDBoMsi1Wvgc97uLalFXIYNbDIA2
         77JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694626840; x=1695231640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/WLdZmC8Xx/sOd4oBmeHrhw37hnWnhRX8n5ANeM8S4=;
        b=vWd4LHDVxb6oh50/IpPNJOF/MN+v9W8Q/2B0fXHDofTn/ftg3avXtlmS85tEz+hqfK
         OOs66HoGd3OEYtf0GGPeprA+dMX+htUYYK47r10VsGt1avqqH5Rymvgyi9gw7Q4q3gu9
         2MWhhB7R8kqKpFYVdAfX6RNyfzCSdqr5vfcvIoE73xr30PDI1UghtNElyYlwLE5h3Fc9
         kaW+1ybuvTLjsYxQGy53uTO2Zca1LrLHj3TZKmN/jfHtxbSuSqt82dXrTbABigx/ffk6
         6yc0Ozo8YbcOuQMf7NczHGMrFfaKDPgkUYg2jmohswSk3XR69d+y9sEkJZeZZWlh4bma
         hTmg==
X-Gm-Message-State: AOJu0YxYUaXhWELZ0TbpqPKrX82vx6aGPV9WQzYfmZmUftEJLBvICGBH
	8ZPI06GaUMhJ6h7/Crfp/oJdBbf3UBiBXV2fpjg=
X-Google-Smtp-Source: AGHT+IE3Cko9oDyKH50dHbKUegk2F3yJMATnyCSF5EHbmYNlZN3vF7c9A+eXDa4okjbCvdqLx+/Tf5LJMfifK7kC7E0=
X-Received: by 2002:a05:6870:56ac:b0:1bb:7d24:eabb with SMTP id
 p44-20020a05687056ac00b001bb7d24eabbmr3843423oao.0.1694626840365; Wed, 13 Sep
 2023 10:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230913113256.585535-1-sanjanasanju1608@gmail.com> <20478.1694605266303113660@lists.openembedded.org>
In-Reply-To: <20478.1694605266303113660@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Sep 2023 10:40:14 -0700
Message-ID: <CAMKF1spiW15NQTGTuaGiLG8LzjdJ25jSSQF_fJi7qmSafmex-Q@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] binutils: stable 2.38 branch updates
To: Sanjana V <sanjanasanju1608@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 17:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187619

On Wed, Sep 13, 2023 at 4:41=E2=80=AFAM Sanjana V <sanjanasanju1608@gmail.c=
om> wrote:
>
> Regression testing with binutils testing is performed and no regressions =
found.

Thanks. LGTM

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187586): https://lists.openembedded.org/g/openembedde=
d-core/message/187586
> Mute This Topic: https://lists.openembedded.org/mt/101334703/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

