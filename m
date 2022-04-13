Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A7C4743C
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.6233.1649856502278844268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 06:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qrR3fXVJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id k23so3974901ejd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Na85yMOfMFWP5QuDFnwTRNbJkikiwvV2zrZfnO5lBs=;
        b=qrR3fXVJBA/AToQOCMHIK3X8X4YQeQ5seLEoQAuXKWHLabP+3b5j9zssBml2V9CawJ
         DgQc5hU9mQdnEZjOG99i3gZ6MlcpjE1RZ5NEHoCn7ORQ2kDD+77C+hCzKahQ/Ca9vZll
         7wABrHfZuXdJh6kOujKmbZkNqvvzj3gKg5VQ+p/Mh/5v60nR1M5BouJ9QtE690hz6k+f
         +kHLK67z4HWt9Xzp3q9tcytvv7K0ksNCv1N8Gu/Uvb7DtIiX9y2EwUVffh+PaWhfwBdS
         rk+D1WezHisKZwwFpPDPX4196yc2bao1ra6nVzcvkQFl0Bjd2Twkwsz7TrXBRPN2CpRo
         aUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Na85yMOfMFWP5QuDFnwTRNbJkikiwvV2zrZfnO5lBs=;
        b=mf95TRu+Er1BdezeyxV8Q99hTgq2zZNIN18EB1cHGLGFWvcujgOBha4pDV01klzAOI
         Z/ZMk/j1coKYuhfRlE6sg5oOaJYHM6V2FuH6S30N8yaERw3gx7FDsSrorWzMNZVk7p4I
         zu7hifCNVvKS0+9qcgYt0PQOryxqlfkg36FiT3kucd/+xK6y2C3nuTMtX6b6eeih7Kk/
         fkgC6FTy11Iah/UNa2LwDQeAkc8CdPtcKit3mRoKt4FPmjZ1Klke0kQ6KzD4KyM2DvpF
         6BMqX7oWvIBJFGRzlu4WmnUFpxPprD0HEsOP/zEeuZAkMnQJezl1XFK7KUksxKveKpew
         wskg==
X-Gm-Message-State: AOAM5321JWMMFMD95C+rfHot9JtSzkg3MQvME4Ke1QcUjeL3vxK88Wqy
	K0NSBrU8XJoHZj5DHiU57Sl8hk3HD1RT/01XRwY=
X-Google-Smtp-Source: 
 ABdhPJzeQ7QrYRDxtIU2LXhDIgG2HhcjzaCEXkbRtzzi1+hg5eo25N8W8O10ZWbXPoehciPcWAU+77JQwPpmQuYJrV4=
X-Received: by 2002:a17:907:7fa9:b0:6e8:c0e1:5741 with SMTP id
 qk41-20020a1709077fa900b006e8c0e15741mr4474860ejc.159.1649856500599; Wed, 13
 Apr 2022 06:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220412130818.26000-1-alexk@zuma.ai>
 <20220413112923.0106c0bb@melee>
In-Reply-To: <20220413112923.0106c0bb@melee>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 13 Apr 2022 14:28:09 +0100
Message-ID: 
 <CAO5Uq5Tng3E10nWrXZQ6N7KAmpJq8Sem=PhEb2TK58adzawnfQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] kernel: Delete unused
 KERNEL_LOCALVERSION variable
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164322

On Wed, Apr 13, 2022 at 10:29 AM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> Hello Alex,
>
> Il giorno Tue, 12 Apr 2022 14:08:18 +0100
> "Alex Kiernan" <alex.kiernan@gmail.com> ha scritto:
>
> > This has been unused since:
> >
> >   commit fb61dc1430f81ae2ee59766ffab8404fd79ff1b1
> >   Author: Richard Purdie <richard@openedhand.com>
> >   Date:   Mon Jan 8 21:05:18 2007 +0000
> >
> >       kernel.bbclass: Drop KERNEL_RELEASE variable
> >
> >       git-svn-id: https://svn.o-hand.com/repos/poky/trunk@1123
> > 311d38ba-8fff-0310-9ca6-ca027cbcb966
> >
> > Signed-off-by: Alex Kiernan <alexk@zuma.ai>
>
> This patch has [meta-oe] in the subject line but it is indeed for
> oe-core. No need to resend it, I've taken it for autobuilders testing
> already, however this is something you should possibly fix in future
> patches.
>
> The same applies to the 8-patch series you sent a few minutes earlier.
>

Thank you!

-- 
Alex Kiernan

