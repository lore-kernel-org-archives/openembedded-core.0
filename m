Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.12633.1631636786663746223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 09:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SWEHK+MT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id d6so21171831wrc.11
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KosXruJJ+ku8krNa7Vmk6tneQmiev+Ij1twaSTEM7ws=;
        b=SWEHK+MTVFW1FbS6v+NFUynadA6NPhhIza9Z1oI0GMDyRU8eV2TgPV/r+VTkGbqhPN
         3m4jEAfKcCE0UWiGSvY6OHLH4cr5AMIw0Db0mAPlsLd2zN3atjIDsdSVOB0HCEycF059
         JPr5PKULT5xRyf506AblCDMi0IPpckr10W0fk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KosXruJJ+ku8krNa7Vmk6tneQmiev+Ij1twaSTEM7ws=;
        b=3wx6dOy9FA82HflIQrPFtSl0QTSdZSv1r+396kqBtgcqTGxj9lJBJXXEFuxQHRPqvq
         55gyR1nFTd1xNbrirtXfprKBMNP1orhPGIvGip5G0T4Kp1vjCbja9m8KYZKGZj97lO77
         Sl4RP2vRm5R16+5WckZ6qd8SI2IEHC2Ory10fXa03pWVStozdHSxsWaHo8BDgb6Y4Bp8
         ZLnNyaO9jGwNhR3rwC8kvPzFpZlLKpxf6HKp5ReK4ISCRXVFbxPJqUJCeGKT48dq7wOJ
         yx9HlA6OxMW/5Au7UM8dlofoVoZrr98oQCiHRA2V2Z7bvUdq3r1KRoM8OLQW1GlkFG3z
         z5/g==
X-Gm-Message-State: AOAM531qAvy7mJ5FcrLbzFFiOSzBEpNX09VmiYu6Y3Qjl0oQpfjEAWjl
	7aGvSkWMMItdgWqPPZ2XcVFOrw==
X-Google-Smtp-Source: ABdhPJz+0/ty9Z9mFRNhNcMnGsvUSjXZoqwlGyBP56OMqb3WyR9sZcr/WS1TaX7Nmj5F9B64pZ6DAQ==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr18723941wri.391.1631636785092;
        Tue, 14 Sep 2021 09:26:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:dde7:52d8:54de:9dfe? ([2001:8b0:aba:5f3c:dde7:52d8:54de:9dfe])
        by smtp.gmail.com with ESMTPSA id f18sm5093478wrw.63.2021.09.14.09.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 09:26:24 -0700 (PDT)
Message-ID: <3b0b951e0f49c1412ab9e0073f83c66b63111950.camel@linuxfoundation.org>
Subject: Re: [OE-core] Public project sstate/hash equivalence mirror now live
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Joshua Watt
 <JPEWhacker@gmail.com>
Cc: akuster808 <akuster808@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Tue, 14 Sep 2021 17:26:21 +0100
In-Reply-To: <AM9PR09MB4642D948515CF977444F9B17A8DA9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<0b6111c1d71f1665cacafafaea972e609a77a0cd.camel@linuxfoundation.org>
	 <95bf1261-eb40-cafa-3153-0c472142fb98@gmail.com>
	 <2f7b629ba49f76ad80461d00a3322a3fa1dc1b19.camel@linuxfoundation.org>
	 <CAJdd5Gax1=zFWNRqG4O5z9Xu=QvjuNuRNAv1NWp5=WX7yiK17Q@mail.gmail.com>
	 <AM9PR09MB4642D948515CF977444F9B17A8DA9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-09-14 at 17:27 +0200, Konrad Weihmann wrote:
> 
> On 12.09.21 18:01, Joshua Watt wrote:
> > 
> > 
> > On Sun, Sep 12, 2021, 10:58 AM Richard Purdie 
> > <richard.purdie@linuxfoundation.org 
> > <mailto:richard.purdie@linuxfoundation.org>> wrote:
> > 
> >     On Sun, 2021-09-12 at 07:55 -0700, akuster808 wrote:
> >      >
> >      > On 9/12/21 4:46 AM, Richard Purdie wrote:
> >      > > We made the autobuilder sstate public a while ago but it wasn't
> >     useful after we
> >      > > switched to hash equivalence by default. I'm pleased to be able
> >     to report that
> >      > > we now have a read-only public server for the hash equivalence.
> >     We did have to
> >      > > fix a small API omission and a couple of sstate related bugs
> >     but I'm pleased to
> >      > > be able to report it is now operational and usable. An example
> >     config would be:
> >      > >
> >      > > SSTATE_MIRRORS ?= "file://.*
> >     http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH
> >     <http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH>"
> >      > > BB_HASHSERVE_UPSTREAM = "typhoon.yocto.io:8687
> >     <http://typhoon.yocto.io:8687>"
> >      > >
> >      > > I've included an example image build below where it took 11
> >     minutes for a
> >      > > core-image-minimal image build. Obviously this is only of
> >     benefit if you're
> >      > > building configurations that match the project autobuilder
> >     although hash
> >      > > equivalence could be useful alone in reducing some build times.
> >      >
> >      > What branches that support hash equivalence will be available
> >     other than
> >      > Master?
> > 
> >     The question doesn't make sense as hash equivalence doesn't have a
> >     "branch".
> >     We're sharing any hash equivalence data generated from builds on the
> >     autobuilder.
> > 
> > 
> > We should (?) backport the BB_HASHSERVE_UPSTREAM patch so that the 
> > instructions to enable it make sense on older branches though.
> 
> Yes, please - I'd really like to see that in dunfell and hardknott too

Readonly hash equivalence is only in hardknott and master, it isn't in dunfell.
The commit in question:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=96b548a79d87120655da3ac5501b8ad4726cf1a4

This means the backport of the recent addition only really makes sense in the
context of hardknott.

Cheers,

Richard


