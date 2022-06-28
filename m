Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38801C43334
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 09:09:24 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web09.53113.1656407355627877092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 02:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mn3Z8QFO;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id c15so1154045ljr.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0h9A5iUjwyMBwW/ApzFKI1oGLzuuY4ejxbP53dkIsJQ=;
        b=mn3Z8QFO1a6vx2Or0sGWd3zeUYALb8FfxnWI+JFrQOR4VkabjVz56GVTFy5k3cWTYA
         MmKCCIY9a3VGAbYJNDSqUMkEKt6dqe8vXX3IrFr4yyS5B/5kIe+SnosA+pVbmx41Os4Y
         /Z16SiICv644oKMR5pnccv73lly6hf0mTLPlaMQF6NJzjVldHeWsqEHzhnm9EYFdthd1
         KxpVIyZ9cAmKw1pweHBemaUexny7ojfQPFQsy1mIWeOVaQV6sTrMt1D6Wm3A80mtDC+E
         zgwR0Xw4rjJjX3EbhSfN+CfjxpPDJxEUn1e7NqrUeSFWs3VoU70CoCim+AEx5Lh2IhFE
         O0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0h9A5iUjwyMBwW/ApzFKI1oGLzuuY4ejxbP53dkIsJQ=;
        b=SS7My0+rpFgd22M0becD5HRkKQgwj//ox2BwYp5ElueORjgAjePSv++nkgJRuNOu0D
         VuCiucWs2HTRm3B+sYpBi1bYoDgEsOUBQ3WjQFA4aM3stkZ1hQnMzY3+QDMAK7V0AVLK
         j/qOJpTi6pwyONfLkqhhVoIYtRKikqmlF8XZE3XdmNCwGL29I2rK2/wVNTdTcI8Q/Gzm
         V1Ylx0D81xxGe4xJ3WV1G/jEm11XKDMDgj/tCarsTtwO1lFE31hRlJqecvoQo/e1A2fW
         F1jU4MWAzeBILfYSbQAKwl/wNnwqCdXrG1dip9zezII8YMW3cqzxGBKZBTIndZ/4g1XR
         rL7Q==
X-Gm-Message-State: AJIora+BfTN1rid5YykUIp4LHUWfuafstd6Qu1Wr15jZ/ePbdbI8sNOI
	CHpQQfx7VLydDgzXrZZPtb0q8FBsB0tVsMUd9ZE=
X-Google-Smtp-Source: 
 AGRyM1tCb6JqAm4yujl+/SON3QNHCY6y4zAvTzvG8QTyCc2F77NKDNTh0zY2yVZcQUyDqtGkSGp4cym8S2XZeLycsjQ=
X-Received: by 2002:a2e:8555:0:b0:25a:7efc:4670 with SMTP id
 u21-20020a2e8555000000b0025a7efc4670mr9331113ljj.513.1656407353601; Tue, 28
 Jun 2022 02:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
 <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
In-Reply-To: <717c8fd06b6f256edfe95b31d378f3ae544a7f50.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jun 2022 11:09:02 +0200
Message-ID: 
 <CANNYZj8-wOkCuh00=LzF3nxi0Lo02YPQUFDmCTQ=aLC6Zg6_rA@mail.gmail.com>
Subject: Re: eSDK dependencies
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"Marko, Peter" <Peter.Marko@siemens.com>,
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 09:09:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167335

I'm seeing that this builds patch-native (to be able to patch busybox)
and its dependencies (quilt/autoconf/automake). If this has been
working differently before, bisecting to the point where it changed
would be very appreciated.

Alex

On Tue, 28 Jun 2022 at 09:55, Valek, Andrej <andrej.valek@siemens.com> wrote:
>
> Hello Richard and Alex,
>
> Richard:
> We tried to revert the commits which you mentioned and it didn't work.
>
> Alex:
> Yes, is fully reproducible on latest master.
>
> bitbake core-image-minimal -c populate_sdk_ext
>
> eSDK installed via: poky-glibc-x86_64-core-image-minimal-cortexa15t2hf-
> neon-qemuarm-toolchain-ext-4.1+snapshot.sh
>
> . environment-setup-cortexa15t2hf-neon-poky-linux-gnueabi
> devtool modify busybox
>
> Sstate summary: Wanted 14 Local 0 Mirrors 0 Missed 14 Current 6 (0%
> match, 30% complete)
>
> So it started a compilation of missing components. We are assuming,
> that eSDK will include all build deps for all components in the image
> and not just a deps for image itself.
>
>
> Regards,
> Andrej
>
> On Mon, 2022-06-27 at 14:35 +0100, Richard Purdie wrote:
> > On Mon, 2022-06-27 at 12:32 +0000, Valek, Andrej wrote:
> > > I have a question related to eSDK dependencies. We're using the
> > > dunfell
> > > branch were everything related to this eSDK topic works fine. Now
> > > we're
> > > in the transition phase to new LTS branch, where were we found one
> > > big
> > > difference between eSDKs.
> > >
> > > The old variant (dunfell) includes all application build
> > > dependencies,
> > > but the new variant (kirkstone/master) doesn't. Means if I
> > > installed
> > > the eSDK and used "devtool modify my-app" (application installed on
> > > the
> > > image) it works without any additional build deps recompilation.
> > > But now, if I do the same on the newer version it always recompile
> > > all
> > > build deps.
> > > I was already looked, what could be changed, but I didn't find so
> > > far
> > > something suspicious. So the question is, what has been changed,
> > > and
> > > how to bring the old variant back?
> >
> > Guessing is hard. Since you're asking me to guess:
> >
> > https://git.yoctoproject.org/poky/commit/?id=568f62214bca3ac6d35eef8d9f4562596fb4c9ab
> >
> > which was partially reverted here:
> >
> > https://git.yoctoproject.org/poky/commit/?id=f22e1fbdf7bed111e080d176fe5a39c5139308ed
> >
> > maybe? It could be something else. It wasn't a specific change to
> > remove such dependencies but I suspect it could have happened as an
> > unforeseen side effect of something else.
> >
> > You may need to come up with a simple test case and then bisect
> > between
> > the two releases to see which change it was. Once we understand what
> > change caused it, working out a solution would be easier, it is
> > premature to even try without knowing the cause.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
>

