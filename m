Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.87.1631552477177937724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 10:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LG11/gRS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so7551737wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WemK8bP/768Jo4RV17nvwJJDb5hGoRm0B1j9y42GlmU=;
        b=LG11/gRSHpyuboFBtipyClwrQN9OC2mWU5NiXsfJ+/Z1H1X6U6UcaSVP8Z5y6jG2/D
         50PtDXYbt1zD85MBL9tL2awrXEsUfPW+ve7FAveK+sT3F6NzODa+LmokFPJkpAi/5F9M
         ZUFseXPrW4KfUSzbcgzpSm91OI9o34+9DAqX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WemK8bP/768Jo4RV17nvwJJDb5hGoRm0B1j9y42GlmU=;
        b=YZ1EWTSpdeZQA/jPtu3a4w5s7hEklSdNbhic64esKJZFqnnyClw1aJqBTEWqYplOlF
         b/X23MN8HAJWvdFmsriYgV7aftqWPioQImOOrgAZhVpyHHt0tjTGzPiOrnrSsE2/o1Oa
         dXl/n7RfznskJvspGoDg++ZtGrDiVeyjwElhQEs3P4HLon9i6YPvwofNtNZI+/6XVShs
         jTpgBoL2/nJS8F/BzaqLPv2J7xNm0R+UBdnnY4dXt0G1KMbF0WOC04LdKDJ4UmEndEar
         077K/r1N/NOz4qNOTAZBGNtvQbdjDiThLY4JhWTrZ7CiIYYe1cNGS3vTOYxRVraLCong
         d8sg==
X-Gm-Message-State: AOAM530E1PiSpq6ltaT0cR1AXbghMayO5LkdtPn3Rkq1UlDvUEmdE5Lk
	4zsJHORLXvA4nujAnzzrWpkeQw==
X-Google-Smtp-Source: ABdhPJxfDupietx/UFNCrLRZmEYcqDoQNFik/AsOgrmPTsYGLWlnNsDEuCqFE/VPz7i7XHqaniFxfw==
X-Received: by 2002:a1c:3942:: with SMTP id g63mr12350315wma.134.1631552475490;
        Mon, 13 Sep 2021 10:01:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7b8:8478:e47c:cb85? ([2001:8b0:aba:5f3c:f7b8:8478:e47c:cb85])
        by smtp.gmail.com with ESMTPSA id p4sm3088126wmg.16.2021.09.13.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 10:01:15 -0700 (PDT)
Message-ID: <5a6a112b92ba3921ba31bc648f37f9cff2687f49.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Date: Mon, 13 Sep 2021 18:01:13 +0100
In-Reply-To: <CAOSpxda2cHN3d0WDMLszq8QJD0-Qa37e0NU57Xu21EXR672oFg@mail.gmail.com>
References: <20210912150121.8237296032A@nuc.router0800d9.com>
	 <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org>
	 <16A41EB09718E439.21276@lists.openembedded.org>
	 <CAOSpxda2cHN3d0WDMLszq8QJD0-Qa37e0NU57Xu21EXR672oFg@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-13 at 05:19 -1000, Steve Sakoman wrote:
> On Sun, Sep 12, 2021 at 6:05 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> > 
> > 
> > 
> > On Sun, Sep 12, 2021, 5:57 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Sun, 2021-09-12 at 05:01 -1000, Steve Sakoman wrote:
> > > > Branch: hardknott
> > > > 
> > > > New this week: 0 CVEs
> > > > 
> > > > Removed this week: 2 CVEs
> > > > CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
> > > > CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
> > > 
> > > I'm not sure I believe these numbers as tar CVEs which showed up for dunfell and
> > > master don't show up here. Why? :/
> > 
> > 
> > Don't know! Will investigate tomorrow.
> 
> I re-ran the hardknott report this morning and it now includes the
> missing tar cve's (as well as the libsolv, vim, and inetutils cve's we
> saw in master/dunfell)
> 
> No idea why these weren't in yesterday's report since they were
> obviously in the upstream database and appeared in the master and
> dunfell runs (and hardknott runs last)
> 
> I've seen this kind of thing once or twice in the past and have never
> been able to figure out what is going on since it is so intermittent.

I'm not sure how we pull the database but is it possible that there are multiple
upstream servers of that data and we pull from different instances which may not
have all updated to the same data? Would there be any way to investigate/prove
that?

I'm a little worried about the inconsistencies. I'm guessing your builds don't
share a DL_DIR so they'd fetch different CVE databases?

Cheers,

Richard



