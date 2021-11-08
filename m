Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73407C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 11:23:48 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web08.43644.1636370627144605427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GlGPeigb;
 spf=pass (domain: gmail.com, ip: 209.85.219.179,
 mailfrom: marek.belisko@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id e136so39271884ybc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R48C/y/wdIK8P6XPY46pcoE737LtU9vBFnJd4u4kbmc=;
        b=GlGPeigbs/B+Ff4uadsnLd/phurrU1lQvYvr/tOj7lqw7+LNBJDg67g8khsrbf8qr3
         JeZceAbLtxS5M1mDjio60c7ywVPD6kcpvPmsk3UmfVwi2hkKFJuhUItQHiLJ90G8P/ua
         v5NbgY8ofL3maifDHftoyCRtFD9H0lj/BRhC5oCUtKZf2y1RLpSCQP1CMhyI4RP5esnd
         gCfH7H5B4Xg/d7poQ8J60BqLbnhk28jBdiZtrOJgq7Z2P+uFDWe6RWQlVgVVfToIBvjU
         8dJqt3Rywf3YWCOEClvBUQPeYXqbXUMzU3EfnLnBvyzIQdfIkfXaxdIRLJrs/Pv5S1vO
         gXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R48C/y/wdIK8P6XPY46pcoE737LtU9vBFnJd4u4kbmc=;
        b=mpqVYipXz/BBGI5CpZbC8HKB/KQJa4F0pWkoc1Rh/iAGkPWuQs15UDJlcfooSLDuNd
         bOmTjPSCoqHoXPudcNvY+WtAqkbw70inEuYsnPCFdMKPDsgSb1RiH1cdNMSn0YlB3dMN
         aUGNGI63I2NtsfJmDSbpz9isx3hdAp1woO7Oc0NaEVgrmPsFnu4efD4i3ZKyRK8NeQMe
         GQG+E/E/ymPV10v/0YTKilwf80mGPQIiWVhKv8GZDlbnSbIu0cmmGOlN0i+K+TKXBUYx
         XEN9/Rzm3NQ7g4dk/JR47rWUZZBU2Ts1chl3PwXCaRkkkttDnmWhJSBNDpf4e1EUnYpJ
         HRfQ==
X-Gm-Message-State: AOAM533XFA/lSTIUeqSklvgEtT9wN3xsIeYVMyww/xpluBxuQFE6lhpt
	ZowTzPmZIxqz0c5rbZ25/nfy0gMh97xbiG+33zM=
X-Google-Smtp-Source: 
 ABdhPJzEyX+bdS0bAgmOe3qn3P/tez2GCg9ep6n764oGYSEy5xtWFubiNCPhNIwClcdK19B6snlVwgNkH9zOXDxto2s=
X-Received: by 2002:a05:6902:704:: with SMTP id
 k4mr61238153ybt.201.1636370626392;
 Mon, 08 Nov 2021 03:23:46 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAAfyv37SVDPteJkaLzZB7bYRdCPGK4ndKJ=gZig75GoxYAvR-A@mail.gmail.com>
 <7fc00066616717818068558463b78a300cdb5e6e.camel@linuxfoundation.org>
In-Reply-To: 
 <7fc00066616717818068558463b78a300cdb5e6e.camel@linuxfoundation.org>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 8 Nov 2021 12:23:35 +0100
Message-ID: 
 <CAAfyv35N15Ec_LU3UqcDfWRtuo6BgFWmiqLTpG5YSRDyLRGv-g@mail.gmail.com>
Subject: Re: [OE-core] broken dunfell
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, maira.canal@usp.br,
	akuster808 <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 11:23:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157971

On Mon, Nov 8, 2021 at 12:08 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-11-08 at 11:53 +0100, Marek Belisko wrote:
> > Hello, latest commit in meta-openembedded on dunfell branch raise an error:
> >
> > meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb:14:
> > unparsed line: 'RDEPENDS:${PN} += "    ${PYTHON_PN}-logging
> > ${PYTHON_PN}-fcntl "'
> >
> > Seems new syntax is used in this commit, fix is simple:
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > index 1ba2c6f..7ebaa45 100644
> > --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
> > "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
> >
> >  inherit pypi setuptools3
> >
> > -RDEPENDS:${PN} += "\
> > +RDEPENDS_${PN} += "\
> >      ${PYTHON_PN}-logging \
> >      ${PYTHON_PN}-fcntl \
> >  "
> >
> > Thanks and BR,
>
>
> Whilst that probably shouldn't be there, I suspect if you upgrade bitbake you
> won't see that issue.
I want to say on dunfell due fact it's LTS release ;)
>
> Cheers,
>
> Richard
>

BR,

marek

