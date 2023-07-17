Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF06EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 14:25:17 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9593.1689603913816291361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 07:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MbqEjWhV;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9928abc11deso646858666b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689603912; x=1692195912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DsKmEWQcor9WghWZCtH2eDXwChLhT7e7X57/ctkaHg=;
        b=MbqEjWhVygzxQOHCiUz1L2N/H6em9i1A31JcKQRRXLzOnV5ftwG8w0GTEn3lO6EzdV
         2X/9BJU3trG+fCQarWdbkMVJc+l4K0O7lzPJN5ooMPrUXHJy6Vd0fRO3WSS9emEeXWoL
         eFcpcMSVjqfbgv/Yxb/+dwaJMTF9zOhHyLeEtxDkoEHB5Jg2+uZVIDNBWw8P6dI0XNim
         pIqSt2/g5PFJ0ABxbMXnAN8x2EhZV447le1k44MGRRViDBlIjiN5WeP0iYvbnAHWrifo
         xc7mUy04RQERo7zsUCaCLOtsxyLypT/drgjz6PUFHqvddeVG0EZfo8zjgNe0eZeJmipT
         FP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689603912; x=1692195912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DsKmEWQcor9WghWZCtH2eDXwChLhT7e7X57/ctkaHg=;
        b=g8baP7AO+NE0c3/hEMpSXIhPQvxeJzTld2BIGnMXIx0VyeBxCcs/5CzNxbOvIW06v8
         j+wwRkoivxvGD2Ux/EHzC9Z0dcNlg8P9UWv5v8cVcSWivi9u0zw8wSkj8i5Dzb3itBcY
         Z+ISTxAJVcjedWX3pw7hv8lQFhOUCskn+JGWcEdxh3IaQeZfxFSjZcVQTZqsdWXrfxJW
         q4++zGi0Jtvhw/oFryfVfbsQsFA/3cYjApOegRFYZBl+5oxp135Hj5Aau9NrIC44/8hn
         Ezcd+8Jik9P87LOKn9YEOP5DHVuXxOA+SRPurI0x96pqvpd3j2IPJ7T8eltrlqb0DaGF
         rCFg==
X-Gm-Message-State: ABy/qLZUSE7KNJR+DRucAr3V4FRMO/7MNZbdfNA5HRYTQMj1siqaUPEZ
	tH/qZU9tLh4kNJ4JOmYmKP5deTT7cimuaBo6xXNpxw==
X-Google-Smtp-Source: APBJJlGs5pjdCMsU7vbcZZB1jhZS3raBrGhaz46dHzbYZWZ8y3jTJr+OeHRL0Lq5dPMqfY4Bpi1DvHRiXBP6La3qBaU=
X-Received: by 2002:a17:907:6da2:b0:991:b292:695 with SMTP id
 sb34-20020a1709076da200b00991b2920695mr12343649ejc.55.1689603912015; Mon, 17
 Jul 2023 07:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <202307171349425149c051@mail.local> <17172.1689602142772444612@lists.openembedded.org>
 <20230717142038b0940de6@mail.local>
In-Reply-To: <20230717142038b0940de6@mail.local>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 17 Jul 2023 04:25:00 -1000
Message-ID: <CAOSpxdYZZAvhX3kOrZnn9kahLMFLZOrOY0rYKroSM8=3xnpBow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: Add dependencies for erofs-utils
To: alexandre.belloni@bootlin.com
Cc: Heiko <heiko.thole@entwicklung.eq-3.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 14:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184471

On Mon, Jul 17, 2023 at 4:20=E2=80=AFAM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On 17/07/2023 06:55:42-0700, Heiko wrote:
> > Hello Alexandre,
> >
> > I know. The patch is based on it.
> >
> > I asked to cherrypick it. But Steve told me ( https://lists.openembedde=
d.org/g/openembedded-core/message/184140 ) , that I should create a new pat=
ch.
> >
>
> Please mark it for kirkstone then

Yes, the patch subject should be something like: [oe-core] [kirkstone]
[PATCH] wic: Add dependencies for erofs-utils

No need to re-submit this time though, I've taken the patch into my test qu=
eue.

Steve

