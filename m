Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.202.1584984609541399343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b2OjyFjY;
 spf=pass (domain: konsulko.com, ip: 209.85.128.66, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f66.google.com with SMTP id l20so410191wmi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 10:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=/oQpQOdpmyQA6BsI2B0wvKT2LUCsaNYok/LgI+T9DjQ=;
        b=b2OjyFjYh1BeZW52E9xZ9QgbtxzWO4BMvk+jcqYZvNc4Y6A/vioW+VMEmLlcPZgTLN
         pEExfSz19JVraZxJ/77BU4urYsDtbw7FnEZpwl1OIxXSeCHzWxoDNnscpEBDNLvfWNXx
         /XL+k9vQbx/3sbg5M8Sh4hu6zwTt8wuneBLZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=/oQpQOdpmyQA6BsI2B0wvKT2LUCsaNYok/LgI+T9DjQ=;
        b=V2GF/93KYUELTiLD7hLHIHqRnmXVs8XxD+VVwpO5vJ2DDNhMaArJ8BJCfG7JkU/GJw
         S+OUNO+4NEJ4SijQgS4SnDfHzVACa2seH4ztiapTcFBEUL1Udz15hSxdFpE44DwCpp6Y
         XXBLsOx05qhGTMxd0G3ZlnTTqqRtOI/t+na3lfc6Odcu7P2mb01Sx3t4aVK1k3R42tvH
         JMmlaxq+a+NKT0aTUSa86779jrnAEe8ur2bzYcoZY2GVL/7HfrpFUeh2Qv1PQVjuDL7p
         /4uop8qJF+FKbNFwAn3ELkINuzbB/+XKVD+u8IOS5+WWHA77f1sSuFBpKVg67sUfWCXK
         Ryxw==
X-Gm-Message-State: ANhLgQ0+CJlA5xEK9Uzydv1ejUu/XLRXMmnREcYow+9BCos6AR1Neuv5
	v0b1WmW8J4Bf1jacp+ODv0oInw==
X-Google-Smtp-Source: ADFU+vsTwWegWAvUyWaxnPjdbFdJoZWlGdMpIGf0d7MHPXOWOO/QgdwxHVIRm5yoezBMRYpRwlCk7Q==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr414727wmb.78.1584984608039;
        Mon, 23 Mar 2020 10:30:08 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id j11sm24298503wrt.14.2020.03.23.10.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:30:07 -0700 (PDT)
Date: Mon, 23 Mar 2020 17:30:03 +0000
From: "Paul Barker" <pbarker@konsulko.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bitbake: gitsm: download submodules
Message-ID: <20200323173003.14e4695e@ub1910>
In-Reply-To: <1292952b0e1fd7de3b123a1fbef8366cd7a22b80.camel@siemens.com>
References: <84e64ccddc46261a59bb1e281ef3294e08119abc.camel@siemens.com>
	<20200304095944.792423a0@ub1910>
	<cdda8416d63d0a7cdec45eefc8d93b1f74f175ec.camel@siemens.com>
	<20200305094209.3704f549@ub1910>
	<1292952b0e1fd7de3b123a1fbef8366cd7a22b80.camel@siemens.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 5 Mar 2020 22:56:15 +0000
"Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:

> On Thu, 2020-03-05 at 09:42 +0000, Paul Barker wrote:
> > On Wed, 4 Mar 2020 12:30:10 +0000
> > "Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:
> >   
> > > -----Original Message-----
> > > From: Paul Barker <pbarker@konsulko.com>
> > > To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
> > > Cc: openembedded-core@lists.openembedded.org <
> > > openembedded-core@lists.openembedded.org>
> > > Subject: Re: [OE-core] [PATCH] bitbake: gitsm: download submodules
> > > Date: Wed, 04 Mar 2020 09:59:44 +0000
> > > 
> > > On Wed, 4 Mar 2020 08:12:27 +0000
> > > "Freihofer, Adrian" <adrian.freihofer@siemens.com> wrote:
> > >   
> > > > The unpack function failed because the submodules were not
> > > > downloaded.
> > > > Calling download before unpack for each submodule solves this
> > > > issue.
> > > > 
> > > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > > ---
> > > >  bitbake/lib/bb/fetch2/gitsm.py | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/bitbake/lib/bb/fetch2/gitsm.py
> > > > b/bitbake/lib/bb/fetch2/gitsm.py
> > > > index c622771d21..3715e9824f 100644
> > > > --- a/bitbake/lib/bb/fetch2/gitsm.py
> > > > +++ b/bitbake/lib/bb/fetch2/gitsm.py
> > > > @@ -184,6 +184,7 @@ class GitSM(Git):
> > > >  
> > > >              try:
> > > >                  newfetch = Fetch([url], d, cache=False)
> > > > +                newfetch.download()
> > > >                  newfetch.unpack(root=os.path.dirname(os.path.joi
> > > > n(re
> > > > po
> > > > _conf, 'modules', module)))
> > > >              except Exception as e:
> > > >                  logger.error('gitsm: submodule unpack failed: %s
> > > > %s'
> > > > %
> > > > (type(e).__name__, str(e)))    
> > > 
> > > You shouldn't be trying to download submodules in the do_unpack
> > > step.
> > > If
> > > they're missing at this stage it probably indicates a fetch issue.
> > > 
> > > Basically true, but the information about which submodules need to
> > > be
> > > downloaded is not available before the top level repo has been
> > > unpacked. I guess the solution must be something like:
> > > 
> > > fetch top-level
> > > unpack top-level
> > > foreach submodule:
> > >   fetch submodule
> > >   unpack submodule
> > > 
> > > What's the exact error that you're seeing?
> > > 
> > > Don't remeber exactly. But when I debugged the flow, it became
> > > obvious,
> > > that the submodules are not downloaded.
> > > 
> > > This could be related to the issue I saw when the fetcher uses git
> > > shallow
> > > tarballs from a mirror - if that's the case I'm planning to get
> > > that
> > > fixed
> > > this weekend.
> > > 
> > > Yes, the problem occurs with git shallows. The patch solves it with
> > > and
> > > without shallows for us.
> > > 
> > > Also, your email client seems to have chewed the patch up. It's
> > > best to
> > > send
> > > patches using `git send-email` only.
> > > 
> > > Sorry, we switched to a new e-mail solution. I have to adapt my
> > > setup.  
> > 
> > The problem with your patch is that it would require network access
> > during
> > do_unpack which then breaks our ability to do offline builds.  
> Fetching in the unpack task is probably really wrong, I agree.
> However, it also works on our CI infrastructure which runs without
> Internet connectivity.
> > 
> > Do you only see this issue when fetching from git shallow mirror
> > tarballs?  
> 
> On our CI which works with gitshallow archives, fetching did not work
> at all. On machines with Internet access we also had problems, but I did not completely analyze what happened. The ovmf package from poky was causing the troubles in our case.
> 
> > If so, the mirror tarballs need to be extracted during do_fetch but
> > not placed in the usual 'git2' directory (as future fetches can't
> > cope with shallow clones in that directory).  
> 
> Do you already have an idea how this could be implemented?

Sorry for the late response, I meant to let you know when my fix for this had
gone in to bitbake but I ended up away due to illness for a couple of weeks.
Commit 3987db95 "fetch2/gitsm: Unpack shallow mirror tarballs" should resolve
your issue, please let me know if it doesn't.

-- 
Paul Barker
Konsulko Group
