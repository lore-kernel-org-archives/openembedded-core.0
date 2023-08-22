Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621B6EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 10:01:07 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.4722.1692698463704281877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 03:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TL/ryu2X;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fe11652b64so6504719e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692698457; x=1693303257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MHhesd/BeJt3hN1QmJooDS1V5Ib+ngmsSxaTYMGEY5w=;
        b=TL/ryu2XG2gywr16SwwZpYfZ0IjncjlelZYm/RQHFC6HjyfYGE5dFPSliADDNb3/Jz
         fpiRnnZWOseA62L5OPdwe15RRrqJXMSny9r3DwOIbx71EIU3SiaL2NeLEmNVPGY9vTsu
         37sjyimV96uNXsJq86Cdn/6H45bigC92dYLpQu3ufJuIebZG+YiQ0+ubRxO1RntGI5la
         LHWc1Lv2AYGSWo1tbhN177AgBt4fUJ5NDXP1w8nutZcmeB8kDQW08xzBlXEUWFcvh/Ln
         k8awOW4EGaBORwbW7/fXasliw9kgMAAh4VtLV4+OraRp/jMpWzSq4dVDaG5kTC+nN0S4
         vtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692698457; x=1693303257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MHhesd/BeJt3hN1QmJooDS1V5Ib+ngmsSxaTYMGEY5w=;
        b=V//XI5EmxAt0SM4ZwnqcKY9twlVj4DvJiYer+AFsYqTx3HioXDKzTBi2222aiOataY
         hLT9hLM9H5kORebPTqz7n9b/dz4GoKADZkpRJcHKtBEDS+fDHp/6GPAcy9iMb+TXCGmR
         h7/7RPn6ltJZ/az8pXSB8UDHXWmjUivVG478bnvtuxZez2MAwJsPvU3jXdRcudGzMxCM
         /VOke2kwEAZj2tdj+vK90wkiys9XSp4ySam9x8avyNzs6upPgV4Wz1GDdy2YOWII1dtu
         g63diRhQGquM+dUN59zygrvtXDS35NugPBk9r53nGfNxq9zNi7DY0yn7o4mOex+vRilU
         wxXw==
X-Gm-Message-State: AOJu0Yxz0eiXdWTAJGwUvauq1GsEIyqomDEpKuoC/llanE9LiaU73C35
	3SfNT1LQqjaPfsXrF6DbYSr90UEq4m0GrL024Ic=
X-Google-Smtp-Source: AGHT+IFAujU8gxuPiQzvyh2+7P4VmtbuYzBui6OiT/wyPvS8u0hJo3g5RArAg3qPA3T4nGDMMs/baQgZJOVlLs3uvWo=
X-Received: by 2002:a05:6512:4026:b0:4f9:570c:7b28 with SMTP id
 br38-20020a056512402600b004f9570c7b28mr7843877lfb.32.1692698456435; Tue, 22
 Aug 2023 03:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
 <20230821161120.171956-3-adrian.freihofer@siemens.com> <20230821215634.349b3509@booty>
 <a76ad1f4279c33a470050da46395839096c3cf58.camel@siemens.com>
In-Reply-To: <a76ad1f4279c33a470050da46395839096c3cf58.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Aug 2023 12:00:45 +0200
Message-ID: <CANNYZj83zUc6qAknx03Rc7cxW1ZgkCH5tiY_rW5ueMrdMNqbbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/14] build: vscode configuration
To: adrian.freihofer@siemens.com
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 10:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186500

It's probably simpler to enforce that the build folder is not under
poky/ if I understand this right? How is it created, and at which
point?

Alex

On Mon, 21 Aug 2023 at 23:46, Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=siemens.com@lists.openembedded.org> wrote:
>
> On Mon, 2023-08-21 at 21:56 +0200, Luca Ceresoli wrote:
> > Hello Adrian,
> >
> > On Mon, 21 Aug 2023 18:07:05 +0200
> > "Adrian Freihofer" <adrian.freihofer@gmail.com> wrote:
> >
> > > This is just my setup. It's not supposed to be merged into poky.
> >
> > If this not supposed to me merged, clarifying that on the subject
> > line
> > would be nice (e.g. add "**** DO NOT MERGE ****")  to not overlook
> > that,
> > as well as moving this patch at the end of the series IMO.
>
>
> Thank you for the hint. I will update it as soon as I get more
> feedback.
>
> But we should probably discuss this a bit more. When VSCode is used to
> work on a meta layer (e.g. poky), some indexer plugins start indexing
> the code. In the case of a meta-layer repository, the build folder can
> be very large and it is very important to configure VSCode to ignore
> it. Otherwise, the plugins will run with 100% CPU load until an OOM
> exception occurs. In practice, this makes VSCode more or less unusable
> for working with Yocto until a file like the one added by this patch is
> deployed before VSCode starts. And from the user's point of view, it is
> not obvious why the system runs at 100% CPU load and eventually
> crashes. In other words: If you don't have this patch, you will hate
> VSCode as a Yocto developer.
>
> It is even more misleading that VSCode starts the indexers immediately,
> but does not stop or reconfigure them when the ignore list is updated.
> In practice, this means that every time the ignore list is changed,
> VSCode immediately starts indexing the build folder until the OOM
> exception stops it. Depending on the system's OOM handler, the entire
> build machine may crash.
>
> Particularly annoying is the Python plugin that ignores the general
> ignore list and requires an extra ignore section.
>
> However, putting a static file in poky doesn't look like a good
> solution. Depending on the setup, the configuration here is not valid.
> A better approach would be to handle this in the bitbake plugin. But
> even that looks kind of wrong, because why should the bitbake plugin
> configure other indexer plugins? Other ideas would be to have the
> configuration file generated by the layer setup tool or simply cover
> this topic in the documentation.
>
> Regards,
> Adrian
>
> >
> > Luca
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186485): https://lists.openembedded.org/g/openembedded-core/message/186485
> Mute This Topic: https://lists.openembedded.org/mt/100876148/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

