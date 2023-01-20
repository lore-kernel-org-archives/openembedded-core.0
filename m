Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D671C38159
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:40 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.82169.1674238299247349074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h/i63s41;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id g2-20020a9d6b02000000b006864bf5e658so3561524otp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EvT/sEhJgq5VwTTDeTIJyoGhkq4tkBkBH5iPnCtJ3/U=;
        b=h/i63s41EudrHX0Sr4QuGG7mTnmMzsBSP94ob5IEOkSDjssD/JSS5+V3f8jfOgF67s
         1mXsHqF7FZ/WLmov/HDNSMg0o15C+vxHJ2HquJsY/0uuIb+mrxM8OLkMMnVz/ICmwSKt
         XF67rULXvpD8KtmxkYAhhoyC/JXAJPP8vOQpMteBt/zsN6pMqbdGxJasTALm6gKDvPJb
         EQGh5/I2DG7WgKg+Nhn5BCMrHI9RXczPPJ3j+HP6WPOeTrjsSjO/jAePdFqwZdoTShsL
         ACtVAydhd9y3aQ6klJHxK1SGh3pLiU42VlXJCr5dJHNu1joQ1rE2XIgPZI5mOM4pb/Lp
         Rniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvT/sEhJgq5VwTTDeTIJyoGhkq4tkBkBH5iPnCtJ3/U=;
        b=UhycCKvVhYLU727/B/oz21ihwW6/SwBvKSBv0EPXns2kOA/8wCzjpY1uFS5MiClzKb
         9hNazzwozSXXro9zue0mrNHn9gwmrYLUlkIbF9WF+VNT1JRnGiynHt5XRyNAGx/zkB2x
         VA+9IK0jhUcl6a8k321RinCixrBoU2UGjLc5xP8aI6IlYj28radlmZBOTW9aFHzbFBV2
         ToWhXQTEv2sS2Vn5ULgQIexfPXjcaIcNKAYMKctLOuBXrLGxfwzVZvBy84jeNFNyIwUx
         BHybuwVwh9wvi25J4WJFDDJSIrNHvsfvy70dB3UAAAgv+MCq4Bk4FQ1qOcz5Xks3njBA
         Pb3A==
X-Gm-Message-State: AFqh2kpLXPOei/wWybO2uUidt+2IkgTV+7+bFFCR1HEV7gPXB7sMV02Q
	WDYn1W2hVhwNPg6QasbsrWYfJrhAtnMV1on7oNT193rUM2T0Hw==
X-Google-Smtp-Source: AMrXdXtOuTvtIuDXiqNf7426JChqaHafql+tNLxD9M2jfrsJz2joNrQokLPxpsCXlH3rmcRrwyitTsWYJO+jxLKPlqI=
X-Received: by 2002:a05:6830:6382:b0:686:4bf5:e675 with SMTP id
 ch2-20020a056830638200b006864bf5e675mr831234otb.111.1674238298430; Fri, 20
 Jan 2023 10:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20230119235141.1603399-1-raj.khem@gmail.com> <20230120124754.14c0e5d3@booty>
In-Reply-To: <20230120124754.14c0e5d3@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Jan 2023 10:11:12 -0800
Message-ID: <CAMKF1soVuu3kOksuFZEzQKW2BsSqrZ9FSOF3Yg=oJvNfPCf_Kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] binutils: Upgrade to 2.40 release
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176225

On Fri, Jan 20, 2023 at 3:47 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> On Thu, 19 Jan 2023 15:51:39 -0800
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> I'm afraid this time the patch does _really_ not apply, and the simple
> sorcery I did for v1 and v2 is not working anymore. If you could
> recreate the patches based on a clean oe-core master branch that would
> be good.

I have pushed the related patchset to a branch on poky-contrib here

https://git.yoctoproject.org/poky-contrib/log/?h=kraj/binutils-2.40

Let me know how it goes.

>
> Thank you!
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

