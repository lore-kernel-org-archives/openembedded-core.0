Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEA57D597
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 11:55:20 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f4so19711529ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u0CiQePgqVWUEvZTQa8gUqzoeOli7plZS5Loofr++aQ=;
	b=nLac7XbWBR3zB7evraA0oYSB7nI+yAHWEhZwIqcj4bFDcGnuq6GFPgbLMBUd/kkknj
	BVtlAgjKrMHlM/k2QiEP+xGvIRwLBpdGRoXKcjlsfUWZOIrOCf5X5EwsM/35aXCci/8f
	SFJX4O4H3KuqOOY9RCTXuJv4X02To9bRuu+JnWh5HiZnRY11wB87ohKn7bSqmKPXBqbX
	NlKllszA4UjbHzbf/4C0ksxBf88r3MgQ/IcwczbHzLRCFoD/73CrMpnvvNxKk/zdw+Bk
	40ngL2p9hQ8quprOG094VAzCYe+ij3UNss6vso08BxNFPSyTzNHWNy7T1fjinMqI2O/I
	tytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u0CiQePgqVWUEvZTQa8gUqzoeOli7plZS5Loofr++aQ=;
	b=BFNBwUhUMnPbFfuQgxJ2O2xAAh652m3R0mTR08+zHxCmj90I4PDbd6zcxD6yVfY08N
	9SANGYpWvz141rrUHONf/86GyBhIKB91e3a8sGPK/Fj4sjHN25TrfCe/f3gZpR1i/gxy
	ufMwZCzdke1Y00PWgWPU1fOJqc3y2uTxYGYFKgis1ikj/D5+cUniimY+A5/iDH4KAXLT
	llnnfyEnD3D6XPee4ppjOwFDRzoupU8EMmsF51QpdGSfNgM9O1e7WW2QebkTvu42XIuT
	k4gVvVuh34RJ8GD3nBrUiShB/ytLT8pK4Pz9hFfe7zU27IQ5MB8XJmsBjlB+GysWV33S
	M8PQ==
X-Gm-Message-State: APjAAAXqZN4+VwsxWMT6t1JBCKySOyf9C2j3Ncy1ESB6r7gkby6xajki
	DM7EQdv/Qap8upRqxEoQBl+5el091awIEvPxYhx9wg==
X-Google-Smtp-Source: APXvYqz7rUnF3MOR1FD6UCWn7ijYN1YkDCUj+78ptN5ALjJjnOPEpnMWa4GiPO1Zqd+A5fSER8n7HMAa8ayBC3TJV5o=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr10563080iod.25.1562932521488; 
	Fri, 12 Jul 2019 04:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561724553.git.liezhi.yang@windriver.com>
	<37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
	<CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
	<add0a48c-e769-9b86-1de7-88a156b3a599@windriver.com>
	<CAJTo0LaNjqmPG0RnRmeNOOeVqnX=muVCeyWcjtFW+1gnidRQmw@mail.gmail.com>
	<CAJTo0LboCz4FYFU5Rmy7a8XQXqXJCY1DNbpqHA7p_Anz+rgGow@mail.gmail.com>
	<41f8454d-7632-eb44-6aee-942d192a5165@windriver.com>
In-Reply-To: <41f8454d-7632-eb44-6aee-942d192a5165@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2019 12:55:10 +0100
Message-ID: <CAJTo0LbRLKN1LyJzuB718wW1anMpuW=Z3FngQLh_-6U2OzZuWg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] waf: python2 -> python3
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
X-List-Received-Date: Fri, 12 Jul 2019 11:55:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2019 at 11:33, Robert Yang <liezhi.yang@windriver.com> wrote:
> > HOSTTOOLS is more complicated and there's still plenty of pieces that
> > use host python.  I've an old poky-contrib:ross/nopy2 branch that
> > fixes a few more users of host python2 that needs rebasing and
> > retesting.
>
> I meant remove python2 from HOSTTOOLS, but it seems not easy to do atm, so maybe
> we still need keep it for many years. I have this idea is because host such as
> Redhat Linux 8 doesn't install python2 by default any more.

I left a world build going last night, some more fixes in nopy2.
There's still about 10 recipes failing.

Ross

