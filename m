Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561F6C4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 21:14:56 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.28578.1672434894245384513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 13:14:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QZtORMSm;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id o66so20300519oia.6
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 13:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NqA30z6+w9kxNHS6X/Hs17OwKq9ToZQHmyznCXRv/Nk=;
        b=QZtORMSmn7BMH63lkledFfxHTy3rab4DSmXZgHofj8vvbbd0rJcO6pw9Pm7H/9T7yI
         P0efu1VnOXHC59y/dTiD4hXqadnU/gtSweJRJ3Z2Ik2JYSkMbd2sTKli26qYvTbKqSIS
         yd9ts0lJuCjSKfPtxczams/SZGVwNF/DcFLy3M3zo/9IqU+W9aemywP3gIcjfbWbC7WF
         shO2eUf/IScyUEHEGdbDK/QO/6/UD7pKpWvMzscrQeZhBJwzKN4fU+Sq9zme+X6Xh2W1
         1YB89CW2XAmKyxIZ5cu9swzi2qYUo22WyZbHM5xQ3+Hk0bPfNBnLbtBQXHbDD5hVd8TO
         XYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqA30z6+w9kxNHS6X/Hs17OwKq9ToZQHmyznCXRv/Nk=;
        b=3lCjKS042BMDxbP8NBZixnaFgOrd3rifvWerqF6ywewT9vYe3VoCzN0Nz0LXgF/giu
         h6YCxfRYdXJywjBw/GKoqwQICpQP9h2z0uMjurN1XopwsCfE8iFuQyONC9aS5WQ+UPm4
         JUvZ3MRfW3ekcubjCCcQsxPrAFHVmthxhV7undw1JUv0BYGyXEL3yAmU581YE1MeSPEK
         fsTo/pkFCcrdrdSSJNcgzEiQjd1ZUDRd8F9Xlve4czTCYMVpzvtxhW3nRFEkNn72Qw0x
         3ltNFIudPsv70BdHZDb5awzci8pqEpF5LrNPeRDwK4OzvRj2XTBB4ltKPR9KduQUFFu7
         TpSA==
X-Gm-Message-State: AFqh2kq0SaYFIgv5tzMP9C9Dmz6FWHHZCWqVadpgKzR7nFvKpY7AxNgU
	ii1SFF6zWNGTIFtM7lEGzoPLNOmNolPf4Xn0FJE=
X-Google-Smtp-Source: AMrXdXv3N1/ky+XzDoY/XYuEwlkXIiRTfe6zhE8c3S2ZpcJMQX/Qox9nVysPozC1ZsA4npdCZaf2L77BkkkKMeiKpT4=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr1760880oia.262.1672434893327; Fri, 30
 Dec 2022 13:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20221229071310.4111511-1-raj.khem@gmail.com> <8b9837c04e2f9bb684aa290761e00e9d072e3dba.camel@linuxfoundation.org>
In-Reply-To: <8b9837c04e2f9bb684aa290761e00e9d072e3dba.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Dec 2022 13:14:27 -0800
Message-ID: <CAMKF1sq-Nw9Mdzkg2c-rbmFfcVr4BG=ZikEs4pRr=Kn4URCh5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Update to latest on tip of trunk
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 21:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175178

On Thu, Dec 29, 2022 at 3:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-12-28 at 23:13 -0800, Khem Raj wrote:
> > Brings following changes
> >
> > * f47a8cdd ldso: fix invalid early references to extern-linkage libc.page_size
> > * 377218cb pthread_atfork: fix return value on malloc failure
> > * 29e43191 fix double-processing of DT_RELR relocations in ldso relocating itself
> > * b50eb8c3 fix strverscmp comparison of digit sequence with non-digits
> > * ad5dcd39 fix async thread cancellation stack alignment
> > * 8f925945 fix return value of gethostby{name[2],addr} with no result but no error
> > * 63402be2 clean up dns_parse_callback
> > * 0a7b4323 dns response handling: don't treat too many addresses as an error
> > * 41603c77 dns response handling: ignore presence of wrong-type RRs
> > * cf76df0e fix missing synchronization of pthread TSD keys with MT-fork
> > * 5ff3eea9 fgets: avoid arithmetic overflow when n==INT_MIN is passed
> > * d8f35e29 fix AS-safety of close when aio is in use and fd map is expanded
> > * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
> > * aebd6a36 fix potential deadlock between multithreaded fork and aio
> > * d64148a8 fix potential unsynchronized access to killlock state at thread exit
> > * 36b72cd6 fix potential deadlock in dlerror buffer handling at thread exit
> > * 833a4691 configure: disable TBAA optimization because most compilers are buggy
> > * e6e82132 disable MADV_FREE usage in mallocng
> > * 25e6fee2 remove LFS64 programming interfaces (macro-only) from _GNU_SOURCE
> > * 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker remapping
> > * dec8f0a4 dns query core: detect udp truncation at recv time
> > * 8c408937 getaddrinfo dns lookup: use larger answer buffer to handle long CNAMEs
> > * 759bf785 arpa/nameser.h: update RR types list
> > * 51d4669f dns: implement tcp fallback in __res_msend query core
> > * e2e95176 res_send: use a temp buffer if caller's buffer is under 512 bytes
> > * c87d75f2 adapt res_msend DNS query core for working with multiple sockets
> > * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish NODATA vs NxDomain
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > index a72d87ea6f..7749495ec6 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,7 +4,7 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
> > +SRCREV = "f47a8cdd250d9163fcfb39bf4e9d813957c0b187"
> >
> >  BASEVER = "1.2.3"
> >
>
> I tested this with your 3 musl patches and it showed a few issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6421
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6439
>

I have sent fixes for all the build failures seen in these two builds.

Thanks
-Khem

