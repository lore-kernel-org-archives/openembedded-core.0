Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD8AC47088
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.3464.1649881293644146670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 13:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b9BLxJu0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id e21so4213954wrc.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xWh6yVteVe0qvGkHxe2TPt/OX5GQxTp1rv1aYhAzD+k=;
        b=b9BLxJu0589yB+F7U9qoPddNlsiMNb8qyY9iD0CJw60Gcg9zEwLJl57KmrUQHgN3gy
         wE7X2P1Kc1kRnTvGIAI0t5oQtXmTe4Lm/NngiWiuYacH75QLj8H0Ys5o+N2fuPG5KJll
         ercg/yy8hEuHo7X2SxG+jG4LdhQFJ9JRhSrow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xWh6yVteVe0qvGkHxe2TPt/OX5GQxTp1rv1aYhAzD+k=;
        b=VdAHG/fzBcLtPK20KKolDz/lbncyvYoHJOJ43ua3NqzfxLIe/VAt/PbrQCd7TgXozY
         pfcf2wFuVBbq/QN21Lw5hcT1OKb03US5Dv7y8B+uHHTSgPJAAuZ6vp/avvWZ2q/ZUCE3
         06vOEq8ytwClZTq9lXrAdB4faxwJnhvO6A6UDY14UqkySCgxGhoSe/EGvPu2PCyQv61e
         dLzPS2futT+pqs8xzL5EH4iqTzHrkESQTJeUW89RkqChYUn3DQu35p5Mpc/sMdifpq7p
         9ish8nPqQANN4+XybFqvyM4a6vs+f5IX9bAaHOBe3Tkactw4VJQGhETm7JXQF1tgr6iE
         mFMQ==
X-Gm-Message-State: AOAM533jMMPdEjm4o112imK0Ntx2UU0F/otFYzbh+7qzj9ZCUqGT8r38
	rdC2Qjkhs8LCEma4FR65sLUiGA==
X-Google-Smtp-Source: 
 ABdhPJxbMngleRWAzKS2yjgTxIcKQGRvvElymD8+hVgGmJZv3vFOPFLqB5jkXn8a/fcTuclEHo+LbQ==
X-Received: by 2002:adf:fa09:0:b0:207:9af2:d7b4 with SMTP id
 m9-20020adffa09000000b002079af2d7b4mr402136wrr.544.1649881291932;
        Wed, 13 Apr 2022 13:21:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:353f:5203:2a56:f190?
 ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b00203da1fa749sm34108wry.72.2022.04.13.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:21:31 -0700 (PDT)
Message-ID: 
 <9999ca2b0e2bbe59097db2c7064d4c92f8866ba5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] buildtools: Add standalone make tarball
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Apr 2022 21:21:29 +0100
In-Reply-To: 
 <CAJ86T=Up-de2X5=mjvpVqkwfXrQWHXDV5bd6G6+G9oEA4PUvnw@mail.gmail.com>
References: <20220413175817.2187595-1-richard.purdie@linuxfoundation.org>
	 <20220413175817.2187595-2-richard.purdie@linuxfoundation.org>
	 <CAJ86T=Up-de2X5=mjvpVqkwfXrQWHXDV5bd6G6+G9oEA4PUvnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164364

On Wed, 2022-04-13 at 12:21 -0700, Andre McCurdy wrote:
> On Wed, Apr 13, 2022 at 10:58 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Some versions of make have bugs. Add a way to provide a make tarball
> > that can be used on it's own in these cases.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/distro/include/maintainers.inc         |  1 +
> >  .../recipes-core/meta/buildtools-make-tarball.bb | 16 ++++++++++++++++
> >  2 files changed, 17 insertions(+)
> >  create mode 100644 meta/recipes-core/meta/buildtools-make-tarball.bb
> > 
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 2c5e7308275..09a75933e26 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -84,6 +84,7 @@ RECIPE_MAINTAINER:pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.o
> >  RECIPE_MAINTAINER:pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-buildtools-docs-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> > +RECIPE_MAINTAINER:pn-buildtools-make-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER:pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
> >  RECIPE_MAINTAINER:pn-busybox-inittab = "Denys Dmytriyenko <denis@denix.org>"
> >  RECIPE_MAINTAINER:pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
> > diff --git a/meta/recipes-core/meta/buildtools-make-tarball.bb b/meta/recipes-core/meta/buildtools-make-tarball.bb
> > new file mode 100644
> > index 00000000000..e278f682719
> > --- /dev/null
> > +++ b/meta/recipes-core/meta/buildtools-make-tarball.bb
> > @@ -0,0 +1,16 @@
> > +require recipes-core/meta/buildtools-tarball.bb
> > +
> > +DESCRIPTION = "SDK type target for building a standalone tarball containing build-essentials, python3, chrpath, \
> > +               make, git and tar. The tarball can be used to run bitbake builds on systems which don't meet the \
> > +               usual version requirements and have ancient compilers."
> 
> Over enthusiastic copy and paste?

Yes, well spotted. I'll fix that on the branch, thanks.

Cheers,

Richard



