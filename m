Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F378DC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 14:14:59 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.6927.1660227290441660577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K5v4z2TP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so2752817wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=Muoa/udU3ri/xs8eCdFiz5767eUqgHKfnzNHEbkFNMM=;
        b=K5v4z2TPaM/Zwmhor++mi501E2hmJe45AUlci+K+R8IiDPfEpDpfgfHy6kzPxvmHzy
         X0XPfbuYRRqUu/Z6kAUdjiEtVi1QQ9LzlZGIN0TXvSylQp/6Hc8aKXm/lCsRao6tIzWU
         X8CyHDjHRJ5KHWzA0fO9RIdpIiriYXxejaGFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=Muoa/udU3ri/xs8eCdFiz5767eUqgHKfnzNHEbkFNMM=;
        b=Rwq+ebTP7dpqiHivCnOLV++pJGkxV1NE6RFNFejCIgtUDhLIGl/F0euWuU8ZZR6cxl
         f0CF1lXkZ5vhcYi1KZ/aOuupEr+5Ko389RuIh27RdLQwugQaDNSve7y+8rngCf2hVeex
         KX/uQHFcRuS8ptEw6fnG+AoDGh1iZzPCxSfTQ97dU/icpO5j26sYYqIV29HN8e3lMLqy
         x9Da4LEvDDC54F1TtezJZdJ5TPovyf56GuMQvE1bVkXwKe2LzcQ0GzEXvs/mpZv7DuZR
         ZVlfr2YaQD20HpMrKkOFz4b1dj0manW+ckO+Dmkx0S7NWqUoKBcDmYMiR7GYQOIPoLoT
         Sohg==
X-Gm-Message-State: ACgBeo3k+4pGgzRodBPYnJE0GK6rL5EjQ6U4eNwyz2xqcHGyXU6UaAq/
	cLS0XngCbPhHNDTlAf3gLws6zQ==
X-Google-Smtp-Source: 
 AA6agR4V5E16u7y1a0E2JoZU181tfKifESqKKtEy6GxlMOGpFB/TsT3/7ySvAo/09Kz+NvT4/kYpTg==
X-Received: by 2002:a05:600c:4e0c:b0:3a5:410d:819d with SMTP id
 b12-20020a05600c4e0c00b003a5410d819dmr5756203wmq.157.1660227288639;
        Thu, 11 Aug 2022 07:14:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7?
 ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 a5-20020adffb85000000b0021e45afa7b0sm18914013wrr.109.2022.08.11.07.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 07:14:47 -0700 (PDT)
Message-ID: 
 <c9cc4c758866f60a5bdf98b2b2a34cf174e791ec.camel@linuxfoundation.org>
Subject: Re: [PATCH 5/5] lib: Add copyright statements to files without one
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2022 15:14:46 +0100
In-Reply-To: <8107ebe1-2bbc-fd0f-f79d-8699cc9a2795@pbarker.dev>
References: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
	 <20220810194510.484900-5-richard.purdie@linuxfoundation.org>
	 <f0b888c9-c467-fae2-5c96-5e01e302a0c6@pbarker.dev>
	 <0d93685bfa828dc7a7bb268ca94e240577bcc9e1.camel@linuxfoundation.org>
	 <8107ebe1-2bbc-fd0f-f79d-8699cc9a2795@pbarker.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 14:14:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169243

On Thu, 2022-08-11 at 09:19 +0100, Paul Barker wrote:
> On 11/08/2022 08:59, Richard Purdie wrote:
> > On Thu, 2022-08-11 at 08:57 +0100, Paul Barker wrote:
> > > On 10/08/2022 20:45, Richard Purdie wrote:
> > > > diff --git a/meta/lib/oeqa/runtime/cases/rtc.py b/meta/lib/oeqa/run=
time/cases/rtc.py
> > > > index c4e66813249..223cf7b95d9 100644
> > > > --- a/meta/lib/oeqa/runtime/cases/rtc.py
> > > > +++ b/meta/lib/oeqa/runtime/cases/rtc.py
> > > > @@ -1,3 +1,8 @@
> > > > +\#
> > >=20
> > > Looks like an extra '\' has slipped in here.
> >=20
> > Thanks, well spotted! I've fixed in the branch.
>=20
> I've also checked master-next with `reuse lint`, obviously it complains=
=20
> that license text files aren't in the places the reuse tool wants them=
=20
> to be and that's unimportant, but it does highlight some other low=20
> hanging fruit:
>=20
> * The following are missing SPDX headers:
>=20
>      * scripts/lib/devtool/menuconfig.py
>      * meta-skeleton/recipes-kernel/hello-mod/files/hello.c
>=20
> * The following are missing copyright headers:
>=20
>      * scripts/lib/argparse_oe.py
>      * scripts/lib/wic/plugins/source/bootimg-partition.py
>      * scripts/lib/wic/plugins/source/empty.py
>      * scripts/lib/wic/plugins/source/isoimage-isohybrid.py
>      * scripts/lib/wic/plugins/source/rawcopy.py


I've tweaked the patches to cover those, thanks.

> * Most files under meta/conf can probaby have copyright and license=20
> headers added without any confusion.

Yes, I'd agree.

> * `reuse lint` will accept the following header as valid, which could be=
=20
> a path forward for recipes if other folks think it's clear enough:
>=20
>      # Recipe: Copyright OpenEmbedded Contributors
>      # Recipe: SPDX-License-Identifier: MIT

Certainly worth considering.

Cheers,

Richard

