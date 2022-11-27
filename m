Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4027C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 22:22:25 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.103054.1669587742482423564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 14:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gCouKQZa;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: petr.vorel@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so7418906pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 14:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UrtehQ3TXwAElU7q0WXfgd3zwnjuv2VlWpFeTAdJS0c=;
        b=gCouKQZaE4IA0t1OooSJcef5pZzpJWBs/QlFAdFI6SH84r1VcybNu8dMf9+TY1bUfk
         ZWVw8IYMImhzZYYPFILXy+AFxajsKjqV28BTxRqV51rkSKTV0iSaKspQ0/EiWuoifnwK
         gp1AH6YTMTDgpTLBYRQZpUTVk9lWwPREqSP1XG3YAAwODkngy6K44pqCVwWYkfB4UN/l
         OqOh/QzXLP++cZ4I1alnDLDFG1sfGjwVCEVwtlHpCso0m6yNs+sgcmXOcV38NkFZ1v7i
         8EJ1dbILXQamp6BB9Q9fa1CKtbomAY1RTXdM9UXn80XpE6Po/GrD3K5SKVwpPUeI5TGa
         aw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrtehQ3TXwAElU7q0WXfgd3zwnjuv2VlWpFeTAdJS0c=;
        b=Yk9UW5cX+NZhMseGIjKEaXpF41BO4apNGklyC/vNHB56nywtTB5yh2GkFnsrrQQZcf
         Do6trH3thTumGyAg6UAqIFMdfRN/UVP42R9FhZZOB+MJyfXrvUBCtvNBO6u7X7sI07kS
         IbRKND4QLOQXBNUYoCoLoFPOxGtM9eRGy9iqY6yqOSVB90N4ATC++TntPX+bRocL/XHt
         PxKtyRhr+Gw+N90awmQp2WK/oamwueGM5fLj8+8FFla6/ZHHr5C4SBCskzfYWweJ3PUs
         Yn9uLqfdCisTziNJBiE/Ifl4Mkjyp8BQBMHXNUArjpLd4Py0khh9va0XUxnHHV/u5qMG
         WCAA==
X-Gm-Message-State: ANoB5pkcX3WZHEUPnL6WLdzAJ3wmLdFXGLd45NT7lPgz8NToym5o6mDB
	V1aF4FBVvW8HMLgn0HQnt09mKxClNd8QMMIWxBk=
X-Google-Smtp-Source: AA0mqf6VSr+gqg6LUHi5+yofPlTyUepKliqz+NHKgv3x9fhNymt+kxA1JXaWf/xcmUBvr4dg4SlHsq9PBTDXokgX90s=
X-Received: by 2002:a17:90a:8592:b0:219:2e8c:a775 with SMTP id
 m18-20020a17090a859200b002192e8ca775mr3999675pjn.102.1669587741935; Sun, 27
 Nov 2022 14:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20221127151708.473859-1-pevik@seznam.cz> <Y4OvnGtP+XQBEjXc@mail.local>
 <CAB1t1Cym1x5-k7yG3QCB+br+J-d0AouFJMBHObywPb7-F-PO7Q@mail.gmail.com> <Y4PhEOd5RUZ97Bff@mail.local>
In-Reply-To: <Y4PhEOd5RUZ97Bff@mail.local>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 27 Nov 2022 23:22:10 +0100
Message-ID: <CAB1t1CxfTMpk+Lc_fA7wb=4ux0M_XEpteMxHKO1dgTrvh7Vetg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] iputils: update to 20221126
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Petr Vorel <pevik@seznam.cz>, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Khem Raj <raj.khem@gmail.com>, Changhyeok Bae <changhyeok.bae@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 22:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173888

On Sun, 27 Nov 2022 at 23:13, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 27/11/2022 22:55:31+0100, Petr Vorel wrote:
> > On Sun, 27 Nov 2022 at 19:42, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hello,
> > >
> > > You should at least build test your patches
> >
> > OK, I'll do. What always discourages me is that unlike Buildroot
> > build, openembedded takes so long.
> >
> > What I usually do:
> > cd ..; git clone git://git.openembedded.org/bitbake.git; cd -
> > . oe-init-build-env
> > bitbake iputils
> >
> > If there is anything I can speedup a build (e.g. using some of host
> > utils to build really just the target) please let me know.
>
> Not really, you'd have to keep your sstate-cache but my guess is that
> your builds are infrequent enough that everything will rebuild anyway.

Yes.

>
> This made me try to understand why you didn't test your patches and I
> didn't realize you are maintaining iputils. Thanks for the help!

Yes, I'm just iputils and ltp maintainer, thus understand the upstream code,
but not much of openembedded (I don't even use it).

>
> >
> > >
> > > On 27/11/2022 16:17:08+0100, Petr Vorel wrote:
> > > > -PACKAGECONFIG ??= "libcap rarpd \
> > > > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
> > > > +PACKAGECONFIG ??= "libcap \
> > > > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', d)} \
> > >
> > > This probably doesn't work either
> > Not sure what's wrong on this, but maybe build shows that out.
>
> The whole bb.utils.contains call can be removed because it doesn't do
> anything once you remove the 'ninfod' argument.
>
> I'll send the patch to our CI with the line removed
Thank you! I'll send v3 without this line (so that it can be applied
if your testing is ok):
${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \

Kind regards,
Petr

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

