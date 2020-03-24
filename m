Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.819.1585081046198409742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 13:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PDrfD+AU;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id d198so4796977wmd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DzLCm2VCoyDwYBW5srwJr3pQK5UA3HKIFtH7OZIoawQ=;
        b=PDrfD+AUbMAIpDP2k/p5PmZHA9m7yalCTjusadKZFHXPCcdZ0P5w6DOUTMhxgjFDp5
         ugILWel2u33zsdBYY3UDVOZTUBXhQFTvVHTxwIAnQNbMfPgoPt03VDEQlS6uoqVWv1w6
         hAwKFXSYbiOxIEhVXzhdtWViorkr+iFtGIfxsI67dnJSxpm/lr32NWtHa98davDD+GVq
         BiX1VvR5eP3GYDgcjjtgHdsbhS+B+IZIOKZpma2Z3EVbMQlzkFDp8EtaPZZs8+kQ+X9q
         ooqSyG07MzZU/MELjRapp7cpAF8hDcxCluAxOeED75bElScGAxiFhNT4WxagxBbrPefT
         AcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DzLCm2VCoyDwYBW5srwJr3pQK5UA3HKIFtH7OZIoawQ=;
        b=W8GFW8/c1juD/7jLJG/mYrEm6Hm3ulWqN29sGTJ2bIie9DKCpeHuSAMQJ168J6I19Q
         vhBI8O+QUwlz3YFvlr0m41scNo1a4RZqQ7z+FvQxlw44MwZ1e7TWJu9M4wGPoIrN+W+C
         pcmQrfdClMxQI0ePY8fqNE8Nb8Lh+O4iFGK/MKeZ5aYxgLTijFYLZO2SKS2cr5gshIRx
         3Aq65wjQggagnVrZWyzuGn/hn12VvF6qWh2nTWLdjGMWDojc64tLYm6+rL63/Rvwh9Qo
         241+J+7Ofdk4C8CiEiM3rnFxbS9xZYs/yxhYV3wwSpaJOY5yVuteLGAQTsU1SjgtIL5T
         9yMw==
X-Gm-Message-State: ANhLgQ3UQxkns6CwTl50d3IS7NbX4Ui5OQLC0XDsxkowcPgwxFgT2/zl
	+SGMFfSxLWgFCDNuhg3Gm0E=
X-Google-Smtp-Source: ADFU+vu0gFWSWwVHcAbekKUD8AMJRkoy5iU395VzXCcnWRlvHKrmKVBANFRp/A68o7LSlIT9mPcDjw==
X-Received: by 2002:a05:600c:2101:: with SMTP id u1mr7622478wml.177.1585081044560;
        Tue, 24 Mar 2020 13:17:24 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2pfrec.lan.ffah.ch (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id z188sm5895190wme.46.2020.03.24.13.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 13:17:23 -0700 (PDT)
Message-ID: <3a484c2606764690adcf4e03946fa46c53e67e02.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake: gitsm: download submodules
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Mar 2020 21:17:22 +0100
In-Reply-To: <20200323173003.14e4695e@ub1910>
References: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
	 <20200304095944.792423a0@ub1910>
	 <cdda8416d63d0a7cdec45eefc8d93b1f74f175ec.camel@siemens.com>
	 <20200305094209.3704f549@ub1910>
	 <1292952b0e1fd7de3b123a1fbef8366cd7a22b80.camel@siemens.com>
	 <20200323173003.14e4695e@ub1910>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-23 at 17:30 +0000, Paul Barker wrote:
> On Thu, 5 Mar 2020 22:56:15 +0000
> "Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:
> 
> > On Thu, 2020-03-05 at 09:42 +0000, Paul Barker wrote:
> > > On Wed, 4 Mar 2020 12:30:10 +0000
> > > "Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:
> > >   
> > > > -----Original Message-----
> > > > From: Paul Barker <pbarker@konsulko.com>
> > > > To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
> > > > Cc: openembedded-core@lists.openembedded.org <
> > > > openembedded-core@lists.openembedded.org>
> > > > Subject: Re: [OE-core] [PATCH] bitbake: gitsm: download submodules
> > > > Date: Wed, 04 Mar 2020 09:59:44 +0000
> > > > 
> > > > On Wed, 4 Mar 2020 08:12:27 +0000
> > > > "Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:
> > > >   
> > > > > The unpack function failed because the submodules were not
> > > > > downloaded.
> > > > > Calling download before unpack for each submodule solves this
> > > > > issue.
> > > > > 
> > > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > > > ---
> > > > >  bitbake/lib/bb/fetch2/gitsm.py | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/bitbake/lib/bb/fetch2/gitsm.py
> > > > > b/bitbake/lib/bb/fetch2/gitsm.py
> > > > > index c622771d21..3715e9824f 100644
> > > > > --- a/bitbake/lib/bb/fetch2/gitsm.py
> > > > > +++ b/bitbake/lib/bb/fetch2/gitsm.py
> > > > > @@ -184,6 +184,7 @@ class GitSM(Git):
> > > > >  
> > > > >              try:
> > > > >                  newfetch = Fetch([url], d, cache=False)
> > > > > +                newfetch.download()
> > > > >                  newfetch.unpack(root=os.path.dirname(os.path.joi
> > > > > n(re
> > > > > po
> > > > > _conf, 'modules', module)))
> > > > >              except Exception as e:
> > > > >                  logger.error('gitsm: submodule unpack failed: %s
> > > > > %s'
> > > > > %
> > > > > (type(e).__name__, str(e)))    
> > > > 
> > > > You shouldn't be trying to download submodules in the do_unpack
> > > > step.
> > > > If
> > > > they're missing at this stage it probably indicates a fetch issue.
> > > > 
> > > > Basically true, but the information about which submodules need to
> > > > be
> > > > downloaded is not available before the top level repo has been
> > > > unpacked. I guess the solution must be something like:
> > > > 
> > > > fetch top-level
> > > > unpack top-level
> > > > foreach submodule:
> > > >   fetch submodule
> > > >   unpack submodule
> > > > 
> > > > What's the exact error that you're seeing?
> > > > 
> > > > Don't remeber exactly. But when I debugged the flow, it became
> > > > obvious,
> > > > that the submodules are not downloaded.
> > > > 
> > > > This could be related to the issue I saw when the fetcher uses git
> > > > shallow
> > > > tarballs from a mirror - if that's the case I'm planning to get
> > > > that
> > > > fixed
> > > > this weekend.
> > > > 
> > > > Yes, the problem occurs with git shallows. The patch solves it with
> > > > and
> > > > without shallows for us.
> > > > 
> > > > Also, your email client seems to have chewed the patch up. It's
> > > > best to
> > > > send
> > > > patches using `git send-email` only.
> > > > 
> > > > Sorry, we switched to a new e-mail solution. I have to adapt my
> > > > setup.  
> > > 
> > > The problem with your patch is that it would require network access
> > > during
> > > do_unpack which then breaks our ability to do offline builds.  
> > Fetching in the unpack task is probably really wrong, I agree.
> > However, it also works on our CI infrastructure which runs without
> > Internet connectivity.
> > > Do you only see this issue when fetching from git shallow mirror
> > > tarballs?  
> > 
> > On our CI which works with gitshallow archives, fetching did not work
> > at all. On machines with Internet access we also had problems, but I did not completely analyze what happened. The ovmf package from poky was causing the troubles in our case.
> > 
> > > If so, the mirror tarballs need to be extracted during do_fetch but
> > > not placed in the usual 'git2' directory (as future fetches can't
> > > cope with shallow clones in that directory).  
> > 
> > Do you already have an idea how this could be implemented?
> 
> Sorry for the late response, I meant to let you know when my fix for this had
> gone in to bitbake but I ended up away due to illness for a couple of weeks.
> Commit 3987db95 "fetch2/gitsm: Unpack shallow mirror tarballs" should resolve
> your issue, please let me know if it doesn't.

Thank you Paul. We picked your commit during the last days. It looks
much better than mine and it works perfect.

Regards,
Adrian
> 
> 

