Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id E6D8160EBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 15:05:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u6so3114543wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 07:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=58fcF5Pbw+XItd28358iSQ2an+aFYCK8XStTLBy9wrY=;
	b=cPnP11oXyZTHyWA7YRuVlJ8YwnEqKke1C13MOcg5hAx/1wO7MkvcI+ZlJ9r6mvdeo+
	U6rIe2d+PILsqwzyux29nqiATf3yhAuihooRF6NkgkeaL+Uu9KFaigPllKO25noOpw+r
	rK+c1+jImhFn9FDBieyaIDawF8ZPWGCVU/J/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=58fcF5Pbw+XItd28358iSQ2an+aFYCK8XStTLBy9wrY=;
	b=IEyhh/oVwwYcyyRQz5VZf0j+88ys+ThbOaTGQMfcojoR29xw7GxnK9NWdGNBzkbqi1
	tp3PncPtEXS2JW8VZ3WTsDtF6lDwoLueNexjhlSDOEPW3MxOg/IO2AgtO2T6Y8FEejam
	cPFej8dz17Wp/HaRkMAnCyUypYMQC7gnxklla8l7lcyA/vp1k+wx2VmZ/yhXWELqCfo3
	vcYap1m5+Um59OWsBVhtnhyuhbp/cqDOx9U1FSE2hkuPPLgV443ToFIwAOaVZ3xrBdwD
	ThFX2De7advyMOi3RG/Bu5o5IJgZw0Cc47ciLiBxChtFbodltLHIc7Y7hX5lGYSZU7sx
	2+/Q==
X-Gm-Message-State: APjAAAUMD8lsbigRcC61YMonNvPhN0Tbv80i4pn9LXho2DljECITJFAx
	gsfPlDOiuTk88L28KVf+wqCBNA==
X-Google-Smtp-Source: APXvYqxdOpNqFFKgk9dVN0W07DjBOVFbMIBRPEsTSV4YC35kMg6/tdZo6+sHIguPHsqJiVPyjk8/mQ==
X-Received: by 2002:adf:e70d:: with SMTP id c13mr5096824wrm.248.1581087960551; 
	Fri, 07 Feb 2020 07:06:00 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a9sm3595274wmm.15.2020.02.07.07.05.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 07:05:59 -0800 (PST)
Message-ID: <6109c3315b8a215881c134441b74d0753820b5c8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Feb 2020 15:05:58 +0000
In-Reply-To: <BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
References: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
	<ad681bbf95efbeb211cbbe00dd73a4e2ce7cf335.camel@linuxfoundation.org>
	<BN6PR1201MB248222EF01FA45459B7BC0BE8B1C0@BN6PR1201MB2482.namprd12.prod.outlook.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Cache unihash ... doesn't match BB_UNIHASH ...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2020 15:06:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-07 at 14:43 +0000, chris.laplante@agilent.com wrote:
> Hi Richard,
> 
> > On Fri, 2020-02-07 at 08:16 +0000, Alex Kiernan wrote:
> > > Hi
> > > 
> > > We've got a couple of multiconfig builds with different
> > > configurations in one bitbake run (whether it needs to be like
> > > this a
> > > different question - I suspect we had something that worked and
> > > stopped there!)
> > > 
> > > However, for sometime we've been seeing errors like this on
> > > master
> > > (the recipes vary):
> > > 
> > > ERROR: mc:forensic:ca-certificates-20190110-r0
> > > do_deploy_source_date_epoch: Cache unihash
> > > 37d2546973a2b7c16fbcb1a8dd4939e4a1bba8c3d6d2dfb6e7204ca08d437ace
> > > doesn't match BB_UNIHASH
> > > 09baf78bd9316acdd308980c42ea4ed1eacea61bcc0d840c36293d1a5a22db69
> > 
> > This is an internal sanity test. It means the hash that it had in
> > the
> > task/worker context didn't match what the server thought the
> > unihash
> > should be. There have been changes in this area to try and fix
> > various
> > things, I'm wondering if we introduced a bug with multiconfig
> > handling.
> > 
> > There are some patches in master-next related to this area so it
> > would
> > be interesting to know if that made things better/worse.
> 
> Anecdotally, we are running Zeus for nightly builds with three
> multiconfigs. I cherry-picked your "bitbake: fix2" and "bitbake:
> fixup" patches and haven't seen any of the BB_UNIHASH errors since.
> Granted it's only been a week. But before that, hash equiv +
> multiconfig was unusable due to the BB_UNIHASH errors.

That is a really helpful data point, thanks. I should probably clean up
those bitbake patches and get them merged then, I couldn't decide if
they were right or not...

Cheers,

Richard


