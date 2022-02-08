Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91402C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 22:56:17 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.19078.1644360976573311216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QSVZUEaH;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id o3so394495qtm.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 14:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XNCwanD1/O9ierWG01rKqSxtXYnDpNw5tKRFPT6ez20=;
        b=QSVZUEaHR3E+xle8I8TmFSmEdVky5gWKwgqcfs3pEVqNnLRe0fiwaIw5HkOM+QQuyq
         UzWNn5AXENGgoDVIkLVjthX6hW8zj5n7MXVJE7PUAGC/pZWEyMMC6tHub/ObfExltX0E
         tPZW/VVb6tcCgtStW3jgqaAOEPbCcN5xx/fhf4tqUH793cma3E0Fqbx9d7UX2TxH0vnN
         KAwRVN4k272O+jfBXuzIqhanBVQLufaG0lk1u1VTEapNvKwp1WStv+OBbawXpWbNxuk2
         hRx//Jr5a85KDSGVuijbh2byK81vsCOfTAgWt/R4wdSfN6w4JIBEMnJzkqSsuvurbsNC
         SsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XNCwanD1/O9ierWG01rKqSxtXYnDpNw5tKRFPT6ez20=;
        b=MdFI3xLuYARWvpZIqxGh2J8ZcIK9rXkoaQJ1R5BO72Q93foxxaa7voU9Ry7bO9NhTj
         5sRZW1/nQdfsUvC1FfyBN4mZsoURH2mUS9AcxvIploXy67+6+7AnTkklpE5nfFFHGKzW
         JFT2OFv3zmTvae9gv0wUwfd53TipXWPBAHIqVFT0n/s9lRV/nLKF7wBIn12TY5mSDVk5
         vG4rFGFlppLVePHvvq1t2ir9n7Gwp1OmiGy9NxPhQzk2SCtpotojsTKZFhy5iuX7+beH
         Ly+HxEJNuCPgyvDBS0Ea95Bx0YljPwwHilIh1J2Q9ocfTvMUfM0ML84N9DyiaTs/G0PH
         +GWQ==
X-Gm-Message-State: AOAM530BNKzSHsKNXx2Z6iHEoObleJ4k9tDc1GdAx6EMZsdqNOyZaVIs
	Qy8VO+IeqS873uXxNx9EG2IhJSDQLGdeCUEAUYI=
X-Google-Smtp-Source: 
 ABdhPJx3q5slZR/vH2lavRBEtv0fsISggF7u0DwpFAGDjhyQQhVbDmxsxY4pRywiEMSlhrsceTGxnlqlj7pBT52uCH8=
X-Received: by 2002:a05:622a:1a99:: with SMTP id
 s25mr4548251qtc.634.1644360975560;
 Tue, 08 Feb 2022 14:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20220203200203.3703888-1-raj.khem@gmail.com>
 <d94531cb509781ddb13745462054f2c9a6f52203.camel@linuxfoundation.org>
In-Reply-To: 
 <d94531cb509781ddb13745462054f2c9a6f52203.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2022 14:55:49 -0800
Message-ID: 
 <CAMKF1srvg3F3NL9WMsdPqHHYbG7TBDpeJmhyoJPPe2oeBUu7Vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] glibc: Upgrade to 2.35 (RFC)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 22:56:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161533

sent a v3

Its also top 3 patches on
https://git.yoctoproject.org/poky-contrib/log/?h=kraj/poky-next

On Sun, Feb 6, 2022 at 12:13 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-02-03 at 12:02 -0800, Khem Raj wrote:
> > package up /usr/bin/ld.so
> >
> > ld.so is a new tool which is added as a symlink to original dynamic
> > linker so make it available with same name across architectures which is
> > useful to leveral features like  --preload, --audit, and --list-diagnostics
> > more accessible to end users
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> We have a couple of test failures with this change:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4720
>
> mulitlib due to overlapping ld.so

I fixed this.

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5027
>
> and some issue build building openssl-native with a buildtools using this
> upgraded libc. I do read that the WNOHANG from perl like that is causing by
> exception handling so we'd need to see what the real error was.

I have tried to fix it by resolving using (), hope this will help.

>
>
> Cheers,
>
> Richard
>
>
>

