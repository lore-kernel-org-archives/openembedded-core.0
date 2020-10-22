Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.4364.1603333302102849951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 19:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nb1R0upZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id c5so79394qtw.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 19:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e+bQ1Y5t79721x++KTUiLlmgTeJgnOxSCQYqpefYuBM=;
        b=nb1R0upZkv1p16XNszA85ppAJD4JXxvB9KdvOrgPsQKaepOJv0a5/UgIYEC6IkiGbD
         rrAZVGk4qplOqvfjYyzbWFjz86vNBMWUvt4JP0YqaDC9VsCeNnlOEF6yGfitUDGd1xBZ
         dW8GJhimTdvMYIcJSTykSn2p4oby0+Rl80bkAZLFUoRHPj1vazBUmz/XK1Lv1IeIYHgc
         P1s5lRjxFgzqygp87uAaAmkRyxLmNuFSopCroAFFP7pS5BdoICu4+dLSAQ79LV3+L59l
         DzBr4mkDcwg20ANKB/nhbIV0RCcQ/jHIheYbNVn9DuTpamCntos/kp9PVD2UmMCUAz8x
         ZrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e+bQ1Y5t79721x++KTUiLlmgTeJgnOxSCQYqpefYuBM=;
        b=eyetvC1jhe3AdeMtuvkCNc5JIDlgEHnanoyexdxrTqvkrgg0S3iIrC1//ffguwZY2i
         jVZNt5vzXoEpBZZJ0KjctVo0/bv+f+hE+3c/V/uo+BfjpVtNKDrvkkiRNQpirIS7HfWq
         24xHb5fuoOBnCLHDxDhG8tyhvkx8pRW0/vuEqlI6sFyMB1xTpceB2Dy/Tjuk83bqrxSu
         KM205xOoHJdtysZGz/825OwhHUSqOBMyrsKLDw8F+hylVnnX8Vlrebx+5O8WYGZNUr79
         Db/6ArQRJGK4zYbDOVsKmTUg6LrB6zJRLIfTLczZ5bmaAyHxLhXORNkPb1PKi4tGmyCs
         n5vw==
X-Gm-Message-State: AOAM5304YsEgdStN77DI8QfYjvSF6ulCzHHmdwv5SF+7S34wHSZt6m+I
	wDY19mUEWGD+vcvpcWhXcJ/kmarCghPzbt1d414=
X-Google-Smtp-Source: ABdhPJwiERX4V9JtSymbAZTpz5u8Iv70wwkJBPscblVLxQF0Jx2H4Xva3xbYnfUW4fnDFnAjAZbqY7nBf2jIbk8muGQ=
X-Received: by 2002:ac8:57d1:: with SMTP id w17mr129422qta.194.1603333301112;
 Wed, 21 Oct 2020 19:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201021155857.2841570-1-luca.boccassi@gmail.com> <5d383a0d9c3aa724fc1aaac4fcd6d75fe5f2dec2.camel@linuxfoundation.org>
In-Reply-To: <5d383a0d9c3aa724fc1aaac4fcd6d75fe5f2dec2.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 21 Oct 2020 19:21:15 -0700
Message-ID: <CAMKF1sqeeYnhu_677KdPLeSa_D3mMJO6oPADEpxS0hVsaLH_Nw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Add new recipe for squashfs-tools-ng
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Luca Bocassi <luca.boccassi@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 21, 2020 at 12:02 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-10-21 at 16:58 +0100, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >
> > The main difference with squashfs-tools is the availability
> > of a shared library and a programmatic interface, rather
> > than just command-line tools.
> >
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> >  .../squashfs-tools-ng_git.bb                  | 37
> > +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-
> > tools-ng_git.bb
>
> Should we be switching over to squashfs-tools-ng and removing squashfs-
> tools? I'm not sure we want to support both versions?

I am not sure if we want to switch to ng yet as on option its good to
have. Perhaps in meta-oe or some other place.

>
> Cheers,
>
> Richard
>
>
> 
>
