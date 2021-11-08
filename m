Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87D1C433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 11:30:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.43546.1636371057763359352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L12LuiAL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so11371717wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Y1aWuCy4UqSazeui1qdb0lxhO0H+JqUbHQokiiRC22k=;
        b=L12LuiALMDWH8WNnYRiBWKLsH9EmydYWNgKA0HFfZ9ee9zOURhAQ4SGdXycMPhOzwL
         W0HySxiTh7V/Lv+XCCse4HlMJDKtrD38pjdEjdeonjakw37mKtod40lOMFXM1LksxEm2
         6gZenefC2LlD2fgeZID2H0WKQxpPawnbEftSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y1aWuCy4UqSazeui1qdb0lxhO0H+JqUbHQokiiRC22k=;
        b=S3isNTB6KWUK1UorIo6lZJhrnaB9rvT53QJ3P50RK5AAZDuXU+m9UWhmmXj8baHFFC
         uOghCVCT/Zai3OTVEgnWrb7nXhQ28nPfrGrokc75mrwvDjaIYMiJM9a8RpMhrxBMdbQr
         MWMIdlgbVfUGBqgda93XvzcSSYe7BWTeoqeZMqHQyGGEF8MF81u7J762S1JH8RxRQ6Kj
         YmWUc2+qDUmuALBoAaDkqcRa4ALNT2K+YZ/RI9Viot5Rvk0vywNbaPbb+Qb4prMyho+o
         Zh93EuuhzOG+zDCtGru2WDaX0sI7v/7kLijHxr7n08EgvVCuupcWpsD4lnK+2QZZW2UU
         bzqw==
X-Gm-Message-State: AOAM532eIw24EhqKtojcGgLBTXL663/knxc+mQOem3y4H6yY9ZRKxk83
	0u3+SbxB3pVe1ubYRznVE0nrWA==
X-Google-Smtp-Source: 
 ABdhPJxp6JyjeuDOAAwnMWu73lCFXR/cj+TVzQduE/pmV5NKCTrr7BUqWob/dOzXQuYkofZnvqykTQ==
X-Received: by 2002:a1c:7715:: with SMTP id
 t21mr18352635wmi.183.1636371056198;
        Mon, 08 Nov 2021 03:30:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c39:dba0:779a:3673?
 ([2001:8b0:aba:5f3c:5c39:dba0:779a:3673])
        by smtp.gmail.com with ESMTPSA id
 e18sm16415444wrs.48.2021.11.08.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 03:30:55 -0800 (PST)
Message-ID: 
 <f14d3a8317338299c2cccebc59e15e4e8ce35738.camel@linuxfoundation.org>
Subject: Re: [OE-core] broken dunfell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, maira.canal@usp.br, akuster808
	 <akuster808@gmail.com>
Date: Mon, 08 Nov 2021 11:30:55 +0000
In-Reply-To: 
 <CAAfyv35N15Ec_LU3UqcDfWRtuo6BgFWmiqLTpG5YSRDyLRGv-g@mail.gmail.com>
References: 
	<CAAfyv37SVDPteJkaLzZB7bYRdCPGK4ndKJ=gZig75GoxYAvR-A@mail.gmail.com>
	 <7fc00066616717818068558463b78a300cdb5e6e.camel@linuxfoundation.org>
	 <CAAfyv35N15Ec_LU3UqcDfWRtuo6BgFWmiqLTpG5YSRDyLRGv-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 11:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157972

On Mon, 2021-11-08 at 12:23 +0100, Belisko Marek wrote:
> On Mon, Nov 8, 2021 at 12:08 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Mon, 2021-11-08 at 11:53 +0100, Marek Belisko wrote:
> > > Hello, latest commit in meta-openembedded on dunfell branch raise an error:
> > > 
> > > meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb:14:
> > > unparsed line: 'RDEPENDS:${PN} += "    ${PYTHON_PN}-logging
> > > ${PYTHON_PN}-fcntl "'
> > > 
> > > Seems new syntax is used in this commit, fix is simple:
> > > 
> > > diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > index 1ba2c6f..7ebaa45 100644
> > > --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> > > @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
> > > "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
> > > 
> > >  inherit pypi setuptools3
> > > 
> > > -RDEPENDS:${PN} += "\
> > > +RDEPENDS_${PN} += "\
> > >      ${PYTHON_PN}-logging \
> > >      ${PYTHON_PN}-fcntl \
> > >  "
> > > 
> > > Thanks and BR,
> > 
> > 
> > Whilst that probably shouldn't be there, I suspect if you upgrade bitbake you
> > won't see that issue.
> I want to say on dunfell due fact it's LTS release ;)
> 

Bitbake as well as OE-Core, meta-openembedded and Poky have LTS branches. I
doubt you're using the most recent revisions of bitbake on that LTS branch.

I wasn't suggesting you upgrade to the latest master.

Cheers,

Richard



