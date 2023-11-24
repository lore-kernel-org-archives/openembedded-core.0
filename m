Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A33C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:12:47 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.137809.1700835167299420334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UK2lr2IC;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1f9ef233912so425371fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700835166; x=1701439966; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvocW39PSDpS4Q8CkcfHS7zoGsIJdeXKrgu+MHcC46I=;
        b=UK2lr2ICugAHfUAKJI8Vhcro6AVFzYbrxhSfQi6vdE7NhIEoOdw0hLuVIlk9+RnAYI
         GHGiNchd7YbNwCYJW8+yTf3V2CVOnCIcid88aa9I2pDOomNLI0EHGUUJiR/H0rudoYqj
         SzxDecrXQwY8No3EQbJbu0jq9veRIbbnrCedUebclY9u34UAMv6+NbUQVZ9jlinM4n2/
         rbc/VycWsLh+7B8FB64ODVORNqZsDlpWiAEoouCsfNf2berqBYxn3SF8xMY5trhBHsN3
         PjqtLq4ve0P2fu/uV6lBFsfyNt3B1tAwJAjr/elUwVT/WX17J/4Xm3m5IGuXA6RCLvQB
         FEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700835166; x=1701439966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvocW39PSDpS4Q8CkcfHS7zoGsIJdeXKrgu+MHcC46I=;
        b=PVTGSnFJr8PcE/UtvMnbEl2Y4eOcHB5T3ez79FaokanxqobF+1BI8XPpvtQ6rPMdri
         xd6x/HOU6UjaaaBpHvR32+wzF+7Z5wknNiNLJtRK1RoRreU08WNmSwGDr8e8C6200Aa0
         mpiyMuC+N9l0rLN2YZUjl4Xly6AcYj1afK2cFK7ylYFYQ4HVGBKF3e88INd2MWcMuPKs
         5/IJ39Ki8PUEGMj3P9n4oW4pVzgj6s1YV6ax9LboO1P13wFD6dbuKNu2+F9Dxj490Mbg
         Yj4PD3PeYau9u2BphYkG7ovJ/1OI6FAs+qktC7GqdTm0SSp6t/0jIDypIGOQoGROpmhW
         mq+g==
X-Gm-Message-State: AOJu0Yxj2OZt62QwnWQa2uav9rvJu8CTCQLZnP2G9oUem8E115XnK8FE
	oETtla2BjbXz2EMY8xB1YrbIdVF2DazXJhdhbIcNsiSfHSE=
X-Google-Smtp-Source: AGHT+IHEosGxMNAO9ILYe3fUHFYPEo55lMGf4IZXZYEX5aN4MnTH7ECBvCRGrULAvJKIBiZ5e73jTOMpJ85qZrssA6A=
X-Received: by 2002:a05:6870:213:b0:1f9:57df:ce37 with SMTP id
 j19-20020a056870021300b001f957dfce37mr3675812oad.33.1700835166412; Fri, 24
 Nov 2023 06:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20231124062142.4189235-1-lizhi.xu@windriver.com>
In-Reply-To: <20231124062142.4189235-1-lizhi.xu@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 24 Nov 2023 14:12:34 +0000
Message-ID: <CAO5Uq5R6Ctm4TTTd+FxTOazq2uK-bGWqkCLZ+5zSu-FBk8jQeA@mail.gmail.com>
Subject: Re: [PATCH V2] [OE-core] tzdata: Reduced time zone configuration
To: Lizhi.Xu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191202

On Fri, Nov 24, 2023 at 6:21=E2=80=AFAM Xu, Lizhi via lists.openembedded.or=
g
<Lizhi.Xu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> tzdata.bb by default pulls in all possible timezone data packages which
> increases size of the final root filesystem considerably.
> The customer would like to have extra timezones configurable so that only
> tzdata-core is chosen by default and rest of the zones are optional.
> This change would make the fs size a lot smaller.
>
> Comparison of customized package volume before and after:
> When TZ_PACKAGES contains all tzdata packets, the image size of tzdata is=
 7.4MB.
> The difference in mirror size between the two is 7MB.
>
> When TZ_PACKAGES only retains one tzdata-core, the image size generated b=
y
> tzdata is 320KB.
>
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>

I get what you're trying to do, but this looks horrid. How about
splitting into multiple packages based on top level directory (plus
the few which sit in the top level directory) using a new
PACKAGESPLITFUNCS so you don't have to hardcode the list of packages?

--=20
Alex Kiernan

