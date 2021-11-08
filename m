Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F5CC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 14:03:06 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.45100.1636380185996399925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 06:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jmgJyy5F;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id q74so43749104ybq.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 06:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37Vdeewy5IOom86cu65OvQa1RLuvg2zkOxwRGSTpvuM=;
        b=jmgJyy5FteDDXJX8khe70r2Sd8zG8tjBgMLUkF2GejgIikI3x2cErAnwf4eqy5pIiZ
         nzZ2Wf46v/RqhN0e5X1/xxZZu8gbcLKrgEyot8k68fC03DZku3GaSV84GMYrgDR3SHUA
         G7jMwHn1Z/n7Q6xcMSybGVWD4ooT4o1iMonyI/s6s0e5K+NKs8Uo/roCU6o9OpJ20qJ4
         lS3b4wYcchj9/FM54ubINHoJy0HlEvmVpxaIxu2qdFGtHgZTjI22jMSCMShZAU29z0LO
         G7ilHPDm0dX/QcjuEz7A97QsmNmx+bL1KB5j3iivrB6M5ePqLe6CQhjkdFlmGNr9cr3Z
         bKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37Vdeewy5IOom86cu65OvQa1RLuvg2zkOxwRGSTpvuM=;
        b=pQ1tfZGS0LjdrnYi/5Z5JF4sLX0UiBiBI+WwCyy3Cw0+eT04OmdZA5Bm1kuv/vzBP7
         YFJBUt+YCjFc/8EmbWFLKXXyJke8VMb5vhRfpwggRyQXhfKF+qYGP4/xHPDkIR0FBH62
         I3/f8iITFuPJohG+kq0w9wGi2pUB2QPc7rExBw8xTnu5nSOie4gvzeG0j9TZfLL5sdhS
         neNAMNMfk4F8pvHLFhagXwMW4EBgjrXXOJviLGRnXGlw41nzzAYhxUamZuxRE+zBn7ZG
         f4iaMiudHOxXSaxGvCwI7fYgS+UVCsaK9CXrgLIbkoyftBSoegc2UECRi8e60JOW+xzw
         DiDA==
X-Gm-Message-State: AOAM532Lbe7FztsyffhyTZFoa7oAM1Uarpu4F3K8QenyHGUF5Xf16FO9
	mJgFeXRVzYLdi+I03Ego1W+BAPld0JLh/73cbbk=
X-Google-Smtp-Source: 
 ABdhPJxqx4V8I/cUTS2gSp1UKEDYUFOeWLlk0Gbs7KuwZYflJ/UccOqvm0UQX997x/1pkQ29SqO/lnWS9I27DWu4TLw=
X-Received: by 2002:a25:4146:: with SMTP id
 o67mr33360679yba.378.1636380185100;
 Mon, 08 Nov 2021 06:03:05 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAAfyv37SVDPteJkaLzZB7bYRdCPGK4ndKJ=gZig75GoxYAvR-A@mail.gmail.com>
 <7fc00066616717818068558463b78a300cdb5e6e.camel@linuxfoundation.org>
 <CAAfyv35N15Ec_LU3UqcDfWRtuo6BgFWmiqLTpG5YSRDyLRGv-g@mail.gmail.com>
 <f14d3a8317338299c2cccebc59e15e4e8ce35738.camel@linuxfoundation.org>
 <CAAfyv37n27_1q5Pj3HTHTAo-_8qo7ah4=w3jk9Sdmg+egrgdHg@mail.gmail.com>
In-Reply-To: 
 <CAAfyv37n27_1q5Pj3HTHTAo-_8qo7ah4=w3jk9Sdmg+egrgdHg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Mon, 8 Nov 2021 04:02:54 -1000
Message-ID: 
 <CAGDS+nmK=bfE4BHJ+u+9ye8EijAkDKN5O4gL9Mxg54yT_q7PaQ@mail.gmail.com>
Subject: Re: [OE-core] broken dunfell
To: Marek Belisko <marek.belisko@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, maira.canal@usp.br,
	akuster808 <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 14:03:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157982

On Mon, Nov 8, 2021 at 1:44 AM Marek Belisko <marek.belisko@gmail.com> wrote:
>
> On Mon, Nov 8, 2021 at 12:30 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2021-11-08 at 12:23 +0100, Belisko Marek wrote:
> > > On Mon, Nov 8, 2021 at 12:08 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Mon, 2021-11-08 at 11:53 +0100, Marek Belisko wrote:
> > > > > Hello, latest commit in meta-openembedded on dunfell branch raise an error:
> > > > >
> > > > > meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb:14:
> > > > > unparsed line: 'RDEPENDS:${PN} += "    ${PYTHON_PN}-logging
> > > > > ${PYTHON_PN}-fcntl "'
> > > > >
> > > > > Seems new syntax is used in this commit, fix is simple:
> > > > >
> > > > > diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > > b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > > index 1ba2c6f..7ebaa45 100644
> > > > > --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > > +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > > @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
> > > > > "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
> > > > >
> > > > >  inherit pypi setuptools3
> > > > >
> > > > > -RDEPENDS:${PN} += "\
> > > > > +RDEPENDS_${PN} += "\
> > > > >      ${PYTHON_PN}-logging \
> > > > >      ${PYTHON_PN}-fcntl \
> > > > >  "
> > > > >
> > > > > Thanks and BR,
> > > >
> > > >
> > > > Whilst that probably shouldn't be there, I suspect if you upgrade bitbake you
> > > > won't see that issue.
> > > I want to say on dunfell due fact it's LTS release ;)
> > >
> >
> > Bitbake as well as OE-Core, meta-openembedded and Poky have LTS branches. I
> > doubt you're using the most recent revisions of bitbake on that LTS branch.

> OK sorry for confusion I was at: dunfell-23.0.6 branch in poky repo.

That is your issue!  The support for the new override syntax was
introduced in dunfell-23.0.11.

If you upgrade to that, you should be OK.

Steve

> >
> > I wasn't suggesting you upgrade to the latest master.
> >
> > Cheers,
> >
> > Richard
> >
> >
>
> BR,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157973): https://lists.openembedded.org/g/openembedded-core/message/157973
> Mute This Topic: https://lists.openembedded.org/mt/86902854/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

