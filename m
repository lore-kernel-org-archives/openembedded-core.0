Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCB2C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:41:34 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.10483.1637170893416962115
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b0hkAraZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id s9so2551607qvk.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivjRUnCHd7ZBmn4teHJz2iFrmUEtT+4fGyJadsb9+C8=;
        b=b0hkAraZLu/b7kl4nGSobdpZJJ24w7g7tRlz4dEQysKh9xlbFLYcqw2zZR4adLMJan
         yKHJJ0E/kh/OrTNGGC24oSRyap9FFwMAEBmcMVfTlUM7tOpDi4OocpAdwzgPFb/8ZTwR
         bz8Ee59gFY5OjiMTgPsXu6OxkLEqwW6H377ud3pnFBumna9tg/Lxg00HeZLUxu7utUBc
         H8jYp+NJQ9HLEpJ8+YCuC6yUHQMfu5nGHVDx1RWMaLAjKiA31/05CbXFxbrTjZutYryS
         hxkHqe02PJV9fbe/+BYAoXHGnsmrCWVJuXyb7qPdb8qBpZYazPr/cFnuFRKRpqpIA1K1
         fZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivjRUnCHd7ZBmn4teHJz2iFrmUEtT+4fGyJadsb9+C8=;
        b=RZWucfc5tS3UgIPAm/D6sy+dUa1Le0PnWhfJykNbRyDSDIPPriXFrHD8PYxYVhnDUa
         0z6F/BfFhvz37JG08My2L1eqEWhclL30H3Qk0/O76qj4A60g1H1iFnuDxJhqWuQZqYiq
         lyuZn9xQL8T+cu5f0LvZQ/Mf419FysMpz+jh457XD5hqK3VI/Ey79t7Go92oht4B4B2p
         wQAF6eo5D9fzFtGP/kJitYbeNR8JWJqeZ0CzpuX5SnyWu4g5m0bp3qHyydhRLaMu0xmN
         FO6+KXDczBbLOTdiVv5X67FNQExJsS4T6PI1z2RhYmVsFiz30qsGEFSMx7ZgbMvESQsx
         SdBw==
X-Gm-Message-State: AOAM530mEvFfx3qmCOfLm90Hv1IWTOQeAgavKaoTFoVMhFO7mIY7RKd4
	cjHsUWHTT39la70yJCifluUr1ziSx1f6N/QYVfI=
X-Google-Smtp-Source: 
 ABdhPJxBevswiz9wUlzx9NU5pBlknzMHS5rTT6zOV4jJWKLBOZsfjaFrQdQYPUggDsh409SKz8dslDbAb4ic9UOPG+M=
X-Received: by 2002:a05:6214:2b0f:: with SMTP id
 jx15mr57908607qvb.62.1637170892558;
 Wed, 17 Nov 2021 09:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20211117165646.70015-1-raj.khem@gmail.com>
 <20211117165646.70015-2-raj.khem@gmail.com>
 <dbfbf7aee5bb837deab0f04d16bfe60f514fb72f.camel@linuxfoundation.org>
In-Reply-To: 
 <dbfbf7aee5bb837deab0f04d16bfe60f514fb72f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2021 09:41:06 -0800
Message-ID: 
 <CAMKF1sr0f61MFBwQ=xqwe34=znuR2HgtOnHKjb_ncQhU0fMaWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glibc: Append files instead of making then
 part of main SRC_URI
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:41:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158441

On Wed, Nov 17, 2021 at 9:38 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-11-17 at 08:56 -0800, Khem Raj wrote:
> > This will help later with using devupstream
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc_2.34.bb | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> > index 72064772789..778898f1979 100644
> > --- a/meta/recipes-core/glibc/glibc_2.34.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> > @@ -29,10 +29,6 @@ NATIVESDKFIXES:class-nativesdk = "\
> >  "
> >
> >  SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> > -           file://etc/ld.so.conf \
> > -           file://generate-supported.mk \
> > -           file://makedbs.sh \
> > -           \
> >             ${NATIVESDKFIXES} \
> >             file://0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
> >             file://0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
> > @@ -60,6 +56,12 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >             file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
> >             file://CVE-2021-43396.patch \
> >             "
> > +# Use append instead of += that way patch is applied with devupstream too
> > +SRC_URI:append = "\
> > +           file://etc/ld.so.conf \
> > +           file://generate-supported.mk \
> > +           file://makedbs.sh \
> > +"
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build-${TARGET_SYS}"
> >
>
> I'm afraid I really dislike these kinds of patches. We need to do something with
> our syntax so we don't have to jump through weird hoops like this. These kind of
> changes look really fragile and easy to break.

what do you suggest as a better approach

>
> Effectively it is an arms race to turn everything into an append, then nothing
> can disable it.
>
> Cheers,
>
> Richard
>

