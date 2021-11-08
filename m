Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C11C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 11:44:23 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web08.43770.1636371862178023335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m2p0y67T;
 spf=pass (domain: gmail.com, ip: 209.85.219.169,
 mailfrom: marek.belisko@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id v7so42863763ybq.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ONXVKGBtOLhw94k+VpQ7wCXhwNcLXw0aJQo2f0AH220=;
        b=m2p0y67TqjR6yc1NJ+Kkrk8nci0ZnlJO1rwZXO/dpk1tGf7/uCZTtiuAxTPeBNx+FF
         lwNRLtzqmb1GGrHh7Q7VUy7biq5Q/R451DhqyjFr8Y82s7DSzk7/b67zbqBR00Mw2T0+
         3Zoi885E52MLsrgvB0YKL0EOSniraVhwpapz/YCiPoTdeGCzWHvXLS/kSAiFGSjb9aqb
         U9ifcAgOlHCjb/c5qF2CIoe/zAut3bGsGLP1B33Tp6eFJjDdm32KiMvwU4GFMusCGVu/
         DXKHswmVFVcYVDxn8uVSHQZLIDjflsGY8H86JBmkq5qrEI7g1vSzDLWz/oF5t4sKgign
         bNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONXVKGBtOLhw94k+VpQ7wCXhwNcLXw0aJQo2f0AH220=;
        b=UYrrRRHbRxzc/vm5weFGp56Ge0/9fKJnTowreKMSx1PGvHMY9tbFPRFBdywXfLBx8/
         BPPQUwRSfZvKkvvh0ojtjYufeNj8Tzex8rk16rlMfFe5xWvbXl0n2izSB2SadPuFGO3O
         gxQYB4pYQ4nqYPjOFrgga34+iBNSmiHXHoTfEVweF5AUcluqnpjBiRC1sTTp48u+Ctyv
         cTOum1obeayk0JuBXgS3JLRkXIG62fWeHKjkHfn9aRGvTT4XR5ss2s9v+qvGBCNh1ZJh
         aZ3/P2IC52VpCB0mJSQOHHDjPEHY17+iX6nwkfeU46uWyv8Ckp71T3pf3IJOxMoriz1X
         E7gg==
X-Gm-Message-State: AOAM532nulKzBFMk8StSqdwA/RZGjExXTTB4M1Nh10pQHXazaGWLcfnQ
	xUTV75Xz9AVJCkmiWmRlBfTfj6UeZQKW+HwKFXQ=
X-Google-Smtp-Source: 
 ABdhPJwyBuKD/MZ4P8ci/z1sVNH+chGH8Co+ObtxRzRUJ7X8OrICpppBuEKg0UChCOGcuaDPUZD/bSFCN0ivd7dYcPw=
X-Received: by 2002:a25:d68e:: with SMTP id
 n136mr81681892ybg.59.1636371861334;
 Mon, 08 Nov 2021 03:44:21 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAAfyv37SVDPteJkaLzZB7bYRdCPGK4ndKJ=gZig75GoxYAvR-A@mail.gmail.com>
 <7fc00066616717818068558463b78a300cdb5e6e.camel@linuxfoundation.org>
 <CAAfyv35N15Ec_LU3UqcDfWRtuo6BgFWmiqLTpG5YSRDyLRGv-g@mail.gmail.com>
 <f14d3a8317338299c2cccebc59e15e4e8ce35738.camel@linuxfoundation.org>
In-Reply-To: 
 <f14d3a8317338299c2cccebc59e15e4e8ce35738.camel@linuxfoundation.org>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 8 Nov 2021 12:44:09 +0100
Message-ID: 
 <CAAfyv37n27_1q5Pj3HTHTAo-_8qo7ah4=w3jk9Sdmg+egrgdHg@mail.gmail.com>
Subject: Re: [OE-core] broken dunfell
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, maira.canal@usp.br,
	akuster808 <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 11:44:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157973

On Mon, Nov 8, 2021 at 12:30 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-11-08 at 12:23 +0100, Belisko Marek wrote:
> > On Mon, Nov 8, 2021 at 12:08 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2021-11-08 at 11:53 +0100, Marek Belisko wrote:
> > > > Hello, latest commit in meta-openembedded on dunfell branch raise an error:
> > > >
> > > > meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb:14:
> > > > unparsed line: 'RDEPENDS:${PN} += "    ${PYTHON_PN}-logging
> > > > ${PYTHON_PN}-fcntl "'
> > > >
> > > > Seems new syntax is used in this commit, fix is simple:
> > > >
> > > > diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > index 1ba2c6f..7ebaa45 100644
> > > > --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > > @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
> > > > "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
> > > >
> > > >  inherit pypi setuptools3
> > > >
> > > > -RDEPENDS:${PN} += "\
> > > > +RDEPENDS_${PN} += "\
> > > >      ${PYTHON_PN}-logging \
> > > >      ${PYTHON_PN}-fcntl \
> > > >  "
> > > >
> > > > Thanks and BR,
> > >
> > >
> > > Whilst that probably shouldn't be there, I suspect if you upgrade bitbake you
> > > won't see that issue.
> > I want to say on dunfell due fact it's LTS release ;)
> >
>
> Bitbake as well as OE-Core, meta-openembedded and Poky have LTS branches. I
> doubt you're using the most recent revisions of bitbake on that LTS branch.
OK sorry for confusion I was at: dunfell-23.0.6 branch in poky repo.
>
> I wasn't suggesting you upgrade to the latest master.
>
> Cheers,
>
> Richard
>
>

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

