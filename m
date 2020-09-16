Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.22789.1600264163171391728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QqwWLPUm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id e17so2876187wme.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 06:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PVXkv1aKc7rZcZJBCmHTOj6d8R6lEe2yYaHdmW8DGSc=;
        b=QqwWLPUmQP8mW3Bze1Fbsi93RnYPS1xNUeWX1lbTJz7f3nvJIhENrbIFW13682wNE1
         JkdkRmvdhtYsdlebx6+PYEG73LRGKCwn8pOWHC8S4ImBCmeAKQmb4XRF9Dq+RcI4L/XN
         JolZ2R/88kpqix5zkeOpe5nqXNfHEiRiNfWZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PVXkv1aKc7rZcZJBCmHTOj6d8R6lEe2yYaHdmW8DGSc=;
        b=MQ5bH2+l+HNrKiXeh0Nv8F1xtHJ1rglUnD6wVr/1CPxvy7UnmvgQXZfTARP7QdWVvt
         75RNTyRVmd7sELljpNAAuCtSUSnZX68fnNqqc1m0TSbnjD8bXEesBD1y7scit3BNhyYY
         R6w//1WVd1qlr8SmX+fb2PBBohSE5quo4x3Lt1kzGA8/qLpMX/8Fly3k+IGriP4MIN4o
         F6XP5r6RxLX/8Cf58x/3gMgbTxUVT+KoUqYbbw9a2H7CgUt8q1rehIXul14ZoDNw9BIb
         +9ATAYhXg4PHt46Bc0C0mDpPtmJCxNkveMv7HOTqDF1byhBvJJKnyg7hLwluGgynY5tJ
         JOXQ==
X-Gm-Message-State: AOAM530ha8E3vJWpvM3/XuwmGjMDTDHBnAhTtF6F3fSslqe+JycGimVF
	3N9wLWAWVz/qPa2y/NCvAy/KAg==
X-Google-Smtp-Source: ABdhPJx1PFFdG5vp2FE2jD384Gqk0dsy/d5JfEISIXTAFV1qspwD5Gjf1Qpz50iMgPdgom9o1YRd4g==
X-Received: by 2002:a05:600c:21d4:: with SMTP id x20mr4764337wmj.26.1600264161442;
        Wed, 16 Sep 2020 06:49:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.6.3.c.1.5.9.4.8.7.9.7.2.3.5.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:532:7978:4951:c36c])
        by smtp.gmail.com with ESMTPSA id m4sm34763353wro.18.2020.09.16.06.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:49:20 -0700 (PDT)
Message-ID: <c8e4bad572b1305b1b1a15b96643aeafe2272f6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Sep 2020 14:49:19 +0100
In-Reply-To: <CAPoiz9yVTQAH2WJbVdbfED6r1EWKfaAnfRjSLbrcCzJL7og92Q@mail.gmail.com>
References: <20200914151359.11240-1-jon.mason@arm.com>
	 <8c3f76c48201397cc3f90fa89cda85a4fa739b76.camel@linuxfoundation.org>
	 <CAPoiz9yVTQAH2WJbVdbfED6r1EWKfaAnfRjSLbrcCzJL7og92Q@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-16 at 09:45 -0400, Jon Mason wrote:
> On Wed, Sep 16, 2020 at 9:26 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2020-09-14 at 11:13 -0400, Jon Mason wrote:
> > > There is a large number of Arm Tune files located in
> > > meta/conf/machine/include/, and to support the current and
> > > upcoming Arm
> > > cores, more are needed.  Adding more files is simply going to
> > > make it
> > > harder to find the relevant ones for an OE/YP
> > > developer/user.  Also,
> > > there are problems with stale and erroneous configs (see my
> > > previous
> > > series), which will only be exacerbated by having more files.
> > > 
> > > I am proposing a reorganization of the existing tune files by
> > > including
> > > them in the generic family include file.  For example, the
> > > tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> > > tune-cortexa57.inc would be moved into arch-armv8a.inc.  This
> > > reduces
> > > the number of files from 12 to 2 for ARMv8a, and that is
> > > excluding the
> > > 13 I am adding in this series that would otherwise be unique
> > > files.
> > > 
> > > To use, simply add
> > > ...
> > > DEFAULTTUNE ?= "neoversen1"
> > > require conf/machine/include/arm/arch-armv8-2a.inc
> > > ...
> > > 
> > > Which is arguably what should be done anyway (instead of taking
> > > the
> > > default of the tune include file).
> > > See the qemuarm64 patch in the series for a working example.
> > > 
> > > Of course, by removing the existing tune files, current users are
> > > going
> > > to break.  A simple script can be written to use sed (or similar)
> > > to
> > > replace the relevant parts for those users that would be affected
> > > (at
> > > least for those that are in the layer index and update
> > > regularly).
> > 
> > I've just looked at this in a bit more details and I'm worried.
> > 
> > The intent is the BSP includes the processor/core tune file that
> > its
> > based upon. The BSP should usually know which one is present.
> > 
> > That tune then presents the possible options which the BSPs selects
> > from but the end user or distro can override.
> > 
> > With this change, you get all tunes and you don't know which are
> > compatible with a given core/processor. I'm not sure that is an
> > improvement.
> 
> Before you were selecting an A75 inc file (for example), now you are
> specifying an ARMv8.2 inc file and saying it is an A75 from the
> available list.  Either way, you needed to know which core you were
> running.
> 
> In addition to this, you have the ability to run the generic default
> for the family, which will work for all of them.  And for ARMv8, even
> the more generic armv8 will work for all of them.  So, there isn't an
> incompatibility problem.

You should have the ability to access the generic tune with either
approach?

> > I appreciate not wanting "lots of files" but we need to consider
> > the
> > usability too.
> > 
> > As others have mentioned, the errors are fairly obvious with diff
> > between the files (or a GUI like meld).
> > 
> > What are the advantages this brings other than fewer files? Am I
> > missing something?
> 
> This is the main benefit of it, TBH.  If I add 25 more arm tunes,
> it's going to get ugly.  And if Arm keeps adding cores at this same
> pace every year, it's going to get even uglier.  However, I'm fine to
> send out those patches if it only bothers me to have so many files.

My worry is that the current system:

a) tells BSP developers to select their processor, not an arch
b) only shows them tunes that work on that processor

So we're changing the model, but only for armv8XXX. This is going to be
confusing. I do like only showing people things they can use too.

How about we split the difference and add the new tune files into
subdirs by architecture?

Cheers,

Richard

