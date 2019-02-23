Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9205E7CAAB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 17:00:29 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d2so6036464qti.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 09:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Textn9rQoASX0jzX7MBEFSYsl2OLcLx4nssmMDQZCgQ=;
	b=UQPOw+tCIe1WUHzj1/xCwzzfXXMEDD8osk4G5z5y26Kr1YU0ZcNhTRAok8aqEuR0A4
	U44/lzD9Pq2QAzwvLnoqBMhgXcMJSWURU3iT5+Qv5yB/7wUz4SwJtkyE3qELIpEsAm8B
	4ik83apGJMOX+7ugEs6Ix4m1qCBYYd8qlTuT3OaeUzE35gohVuql+HA2B90B8wZln+BA
	gDo+fFL/QJTqlAsvXEPBm6dzRVGw12j/GsdGpP/bGES2KQV6ugFmyCtNJLdiUornPDxZ
	UdGvvzE/mK0fTFP+kmpNTQ2pfW8FQRdQ0/ab3x2TMclt/oIVsn35juuTETb83pyKDb3Z
	ZU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Textn9rQoASX0jzX7MBEFSYsl2OLcLx4nssmMDQZCgQ=;
	b=YNG+7HyouTNyrNqX0yrNtPXPcubShooUXpLLSwOJR3nS7G7YaMBQF4Yc3R+dmlXxJb
	w8KeH3IOXZPCDHFreRbwZwdQtLq5nenCN7LoPjpmt9RYd9IFkGavJx/EKYBOXKaN4siQ
	7n0nn5GBE3sphHRd1EADVwOAv3nYbJYe91QWJ34LHnsUjlleMV6oZO3lFbCi1GwI2vfX
	XY7FFqNGX/Lm6wvz8hLkX6ns734Sda02+z7ecShOsmFsghI48OY7wQJnejM/sd4EKtB7
	eyE6/9sWNX+F9kVZ72DSWvr6GFm+fShU1Ky7HlBnEaJv7bcv8R/GoKuaCye0JCG449mU
	8bfA==
X-Gm-Message-State: AHQUAuanKbOfHrfCqbKKWqY8cIbngZBUIN5cOXifG4io2462SN/450lL
	rDrpXFN1xLPOXJLqVVHSXjJubXLOWZjDyRVkEvw=
X-Google-Smtp-Source: AHgI3Ibh4PLa/DGZRUBBalsdgDAJnNZ1LnzE4WO7YsIYZqeSU+fBK9Lg87YfKqHkTcfR6qLT3PkgadNAkulrUe4Qvks=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr7814276qtn.253.1550941230239; 
	Sat, 23 Feb 2019 09:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20190115230612.18947-1-petr.vorel@gmail.com>
	<f945d8518ac05d37fbba3a134dc09d6c89acbc7a.camel@linuxfoundation.org>
	<CAMKF1spaQmVW_=5bgus7nkw5Q9vU+DQH+qTzMj27i8omxg1DwA@mail.gmail.com>
	<20190116152809.GA407@x230>
	<c2b3d2ad4287960a5805627ef550dad30e2b82d3.camel@linuxfoundation.org>
In-Reply-To: <c2b3d2ad4287960a5805627ef550dad30e2b82d3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Feb 2019 09:00:04 -0800
Message-ID: <CAMKF1sqWVxZwT93wT0=habRrZW6M1FAAcvVcaXnc_ZSRfY147A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20190115
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
X-List-Received-Date: Sat, 23 Feb 2019 17:00:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 23, 2019 at 8:12 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-01-16 at 16:28 +0100, Petr Vorel wrote:
> > Hi Richard, Khem,
> >
> > > > Thanks for looking at this. Unfortunately it failed in testing on
> > > > most
> > > > targets:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/181/steps/7/logs/step1b
> > > > (one failure given as an example).
> > > > Warnings as errors are good during development but sometimes less
> > > > useful during release due to the variety of end user
> > > > configurations.
> > > with glibc 2.29 in play
> > > http://errors.yoctoproject.org/Errors/Details/216829/
> >
> > Thanks for your reports.
> > Is there any way I could easily reproduce it?
> > Some config I can download?
> > I'm testing with default config.
> > I'm sorry for dummy question, I'm more experienced with Buildroot.
>
> Sorry for not replying sooner. We just hit this issue again:
>
> http://errors.yoctoproject.org/Errors/Latest/?filter=480efd388db578106a8a2129c0382b7e56a1ee36&type=commit&limit=150
>
> This time I think I understand where the error is coming from though:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/security_flags.inc
>
> does:
>
> security_flags.inc:SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
> security_flags.inc:SECURITY_CFLAGS ?= "${SECURITY_STACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>
> so the reproducer should be to add "-Wformat -Wformat-security
> -Werror=format-security" to CFLAGS when building ltp.
>

I think this must be new, we are carrying patches to fix similar
issues in other parts of ltp. Probably something to consider for
upstreaming
e.g.
https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch

> Cheers,
>
> Richard
>

