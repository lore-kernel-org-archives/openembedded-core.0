Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4555.1610730234027719731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RG52BZDC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id s24so1289339wmj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 09:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3GKtJOgLxp/tZdGFHtMCDiPR8a2Rvu/KcNpUeXMwQV4=;
        b=RG52BZDCIfOWR68wLR2h55xyaEpq5xNH+OY77VQRrhPrZ0v026N/khO5dc2XU6jS7v
         y0/4AFKDH22GiN+zm1c1iN/A7ZJeaYwCd6rOmuan4+F0K0ErXPSQbojhyUmqGiXegtcx
         Hk8k6J+Lxr6DkWafFd5sL3pRCpVG4GZF1TNvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3GKtJOgLxp/tZdGFHtMCDiPR8a2Rvu/KcNpUeXMwQV4=;
        b=Lw8t1Pbf7txORPakvKBqgoof8MFOp2+HokBl6e9sep3Po/WJJ+/6ofV/pStmTbEnb1
         M16vdxcf5JDe3DNBgkIS54iwnJDNpTCJF3edoJI38ILUEAdW1MG/3TCTmMr0b1Zdtx4d
         rsAu3oFFdLDjr1lWk7gVKqjI6VwYQQ/PdDQY5cJDDBfdb4hi4ONduWrbWuYW6McQNVQh
         EOfxUxwVAYr9w6CkDFX6aMWo0d/qhfeUG8MN6xb1Wy/mSH5AuyzyL++mE7rOzuiRYcA/
         D24jF4ZDN7Ypimm2PUyJqbYF9VhG5QXUKiq6y+ul+F0J8mQNXHuRy3r9DchSkdk81NBy
         jxMw==
X-Gm-Message-State: AOAM532cjTailc0mPI7vthoPj4J5ghVbvkoJYhcn8JVu2OKIMOABDPl9
	RttW8ZCpx6+xO3qr5sWBiGk++Q==
X-Google-Smtp-Source: ABdhPJwgdgdr0/MEFLP970UPjzN7nEtZjgtNngI+SSEdLrodWV1qwNTszUHhvxOSJRV6xV4Mi7yvUg==
X-Received: by 2002:a05:600c:22c6:: with SMTP id 6mr9558935wmg.33.1610730232518;
        Fri, 15 Jan 2021 09:03:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id f14sm13756142wme.14.2021.01.15.09.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:03:52 -0800 (PST)
Message-ID: <8968526a57263a7b19d993073a2b477047d22766.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][dunfell][gatesgarth][master] zip: whitelist CVE-2018-13410 and CVE-2018-13684
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 17:03:51 +0000
In-Reply-To: <YAHJ0TSKnUuczvAQ@korppu>
References: <20210115104807.40671-1-mikko.rapeli@bmw.de>
	 <49b9decc4cf96646d8bb616931548966ac9f37f6.camel@linuxfoundation.org>
	 <YAHJ0TSKnUuczvAQ@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 16:58 +0000, Mikko.Rapeli@bmw.de wrote:
> On Fri, Jan 15, 2021 at 04:48:13PM +0000, Richard Purdie wrote:
> > On Fri, 2021-01-15 at 12:48 +0200, Mikko Rapeli wrote:
> > > https://nvd.nist.gov/vuln/detail/CVE-2018-13410 is disputed and
> > > also Debian considers it not a vulnerability:
> > > 
> > > https://security-tracker.debian.org/tracker/CVE-2018-13410
> > > 
> > > http://seclists.org/fulldisclosure/2018/Jul/24
> > > "Negligible security impact, would involve that a untrusted party controls the -TT value."
> > > 
> > > https://nvd.nist.gov/vuln/detail/CVE-2018-13684 is not for zip, also Debian concludes this:
> > > 
> > > https://security-tracker.debian.org/tracker/CVE-2018-13684
> > > 
> > > "NOT-FOR-US: smart contract implementation for ZIP"
> > > 
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > > ---
> > >  meta/recipes-extended/zip/zip_3.0.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
> > > index c00a932763..47e6fc5278 100644
> > > --- a/meta/recipes-extended/zip/zip_3.0.bb
> > > +++ b/meta/recipes-extended/zip/zip_3.0.bb
> > > @@ -19,6 +19,9 @@ UPSTREAM_VERSION_UNKNOWN = "1"
> > >  SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
> > >  SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
> > > 
> > > 
> > > +CVE_CHECK_WHITELIST += "CVE-2018-13410"
> > > +CVE_CHECK_WHITELIST += "CVE-2018-13684"
> > > +
> > 
> > Where we're adding these can we put a small comment in as well just
> > saying why we're whitelisting it?
> 
> Sure, but lets try to be consistent then.

I am trying to be, I did add comments with the recently whitelist
entries I added! :)

There are probably some older ones which don't have it but we should
probably try and improve that over time if we can too.
> 

> > I appreciate the info is in the commit but I think its important enough
> > to list in the recipe as a comment too.
> 
> I agree.
> 
> Though it's not clear if these should be removed when updating recipe versions.
> Sometimes NVD data is good, sometimes bad, sometimes it's not clear howto fix...
> Doing local builds with
> 
> INHERIT += "cve-check"
> 
> is the only way to find out, I guess.

Yes, if upstream are no longer listing it as being relevant, we could
drop the WHITELIST entry but in general I think they'll be in cases
where the upstream entry can't be changed. That means for recipe
upgrading, we probably end up keeping them.

Cheers,

Richard

