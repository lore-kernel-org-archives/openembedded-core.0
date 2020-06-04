Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9542.1591259419647284203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 01:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YhtbpGCw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id x6so5052569wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2020 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=F1n0RI1Wa62TvnybvL5kcnJ7XhIO1uw8bETmASqKlIo=;
        b=YhtbpGCwg1i5wP2XRWUPTVMtliTCdxSslhocP4tX9uRxJ6l7HVYBrbKcMXfOuYWkop
         WqBLcGDXhKjgmRgdcfwvisW+dwv13NpEewCqLOq66iwUfDI9A6LMnw2inN5qI3lFxWpl
         oc1J+XkAtS7c0Kn+rG9bururlue45B5KzUEZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=F1n0RI1Wa62TvnybvL5kcnJ7XhIO1uw8bETmASqKlIo=;
        b=EGPM2z6X9mlDnVzzX2lXO00b7jOc31V/gmBt2oPHQtWJMcc+ICGKqk7cYXxQK4ZJZp
         Cpm8weYE4oUeTYkoL17r+x+oeHRRhbDFVQlJiNM8QoqbjuYxzCR81Ob6lc308s+ZpyhO
         xDCT8uqq6r7ZJurK7wBXyjMDHBtL/No2Q1JTEn/170L6ENwtWpJ+Sje6UKnHBMtO9auX
         UP4bfsrAOWdYn3NVtPKuqF6G8KO3k3O/acGqT4lTSiq+WoAcGLk+vt9ljFZaESPsJ16N
         J4Yuhp6L+8r+8btXEyUfBC/VikikuWyQ+Ac/0vIP96BD5bIrBdYAUOpjwsmpkrmQ3XcF
         y+RQ==
X-Gm-Message-State: AOAM533xxp1/oJFTpiWjAjG3G4PiwclUTB7QJhm8p/zma/izlFTvPIJ8
	JQQzIkgNOy+tb4toJbgFUJ1vHg==
X-Google-Smtp-Source: ABdhPJwjRyVG3Me6eItxu8xKK3yw7zBHcoktMNISCJN17MvIw72SepB16DV6NA3aVMkxmQtny8PEGg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr3229603wrw.364.1591259418078;
        Thu, 04 Jun 2020 01:30:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c5sm2669326wma.20.2020.06.04.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 01:30:16 -0700 (PDT)
Message-ID: <d2545e9653c46da43381d255fb874950022c45dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][ 08/10] armv8/tunes: Define TUNE_PKGARCH
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Martin.Jansa@gmail.com"
	 <Martin.Jansa@gmail.com>
Date: Thu, 04 Jun 2020 09:30:15 +0100
In-Reply-To: <7185bff15ca130c5ed472812368a0fdf221d7921.camel@intel.com>
References: <20200521161543.3273063-1-raj.khem@gmail.com>
	 <20200521161543.3273063-8-raj.khem@gmail.com>
	 <CA+chaQdLO1aLYeuFZ_a8=HC=GFyX2M9wfWE_+Uro6ob6gqHThw@mail.gmail.com>
	 <e21304ef6fc99ca4cf33b96eb920095027ebf297.camel@intel.com>
	 <CAMKF1spHodgTCgAOs30tSYE9ypGenA1JUS9U6Wc6HfMnWabKdQ@mail.gmail.com>
	 <7185bff15ca130c5ed472812368a0fdf221d7921.camel@intel.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-22 at 00:23 +0000, Mittal, Anuj wrote:
> On Thu, 2020-05-21 at 17:05 -0700, Khem Raj wrote:
> > On Thu, May 21, 2020 at 4:49 PM Mittal, Anuj <anuj.mittal@intel.com
> > >
> > wrote:
> > > On Thu, 2020-05-21 at 19:37 +0200, Martin Jansa wrote:
> > > > On Thu, May 21, 2020 at 6:16 PM Khem Raj <raj.khem@gmail.com>
> > > > wrote:
> > > > > Now that they uses -mcpu, its better to have tune specific
> > > > > build
> > > > > directories, since aarch64 wont be appropriate any longer
> > > > 
> > > > I agree with Steve that this is a bit invasive for stable
> > > > branch,
> > > > but
> > > > on the other hand it's long overdue and if we don't improve it
> > > > in
> > > > LTS
> > > > branch then many people will need to carry local work arounds
> > > > for
> > > > multi-machine builds. +1 from me.
> > > > 
> > > 
> > > But this is against the LTS/Stable branch policy. What is the
> > > point
> > > of
> > > having a policy if we are going to keep making exceptions?
> > > There'd
> > > be
> > > other changes as well for which people might be carrying work-
> > > arounds.
> > > Would we be willing to make exceptions for all?
> > > 
> > 
> > Thanks for bringing this up. Policy exceptions are not common but
> > they
> 
> That's two exceptions in a week.
> 
> I am not against the change but I think the policy document should be
> modified to define how exceptions should/will be handled. 
> 
> > are not absent either
> > hence context is important for such changes, I am definitely
> > interested to hear
> > about how it is going to affect arm64 users at this early stage of
> > release. 
> 
> The release has been made and I think the branch is assumed to be
> stable from the time it was released and policy should be applied?
> There's no early release stage defined where-in such changes would be
> acceptable.

This series doesn't have a decision on it yet. If an exception were
made, it would be two exceptions in the lifetime of the LTS so far, not
just a week. The fact we'd like to make a point release is focusing the
fact we need to make some decisions rather than a sudden stream of
policy exceptions.

I'd also note its most likely we'd find issues just after release as
people start using things, over time it becomes much less likely. 

If such issues are identified, particularly now as people start using
it, the question is what we do about it. If we can fix things to
improve things for users and the risk is either low, or managed to a
specific subset of users who can benefit, that does seem like a
sensible thing to do.

I guess I'd hoped we could all be sensible about these things, the LTS
policy is there as a set of 'guide rails' to make decisions against but
as a maintainer, I know that not everything that makes sense neatly
fits within a written set of rules. The LTS maintainer does need to
have some ability to make decisions and I've always thought it was
clear the TSCs are the ultimate decision makers for any technical
decision the project faces should there not be consensus. 

In the case of these patches I'm not seeing anyone arguing against them
on technical grounds or saying they don't make sense other than some
things I've said to Steve! The complaint is that they break policy.

I will discuss making a escalation and final decision path clearer with
the YP TSC (who wrote/maintain the policy).

Cheers,

Richard






