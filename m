Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 764807C3A2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 10:33:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q18so12767810wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 02:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=310vJEXyamaXMwKzcGFdBuxUjLsQDfsz17YnmwraWGA=;
	b=huZsIGTqd2SMe7irVvw9MwU1Wa7ymFeGjNTho14ZSKq8+u0hv+GNQ7MBF2uAQwVrOC
	2FOsq/LZykQ6LWcrYZu1n3Ejh1FVSmj177HRKQ5eXu2urmiID0NOZXxzhpP1bPsIpB8y
	HPLCUzhDuQoTHHqx3XNN8UNJggFlkuZnOWTyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=310vJEXyamaXMwKzcGFdBuxUjLsQDfsz17YnmwraWGA=;
	b=SllYeLSIH5o6PrtM28i1+ueAihFqceB8iqjG7hnchNP5k2sUFIJ7f0zwigVOxW+Nc7
	T/rRpejpP/sobH8icugRVCnf5IkFTJF1+YVtaTV7ia9jIahltFCph7qQ8YV/3C+Gq3V2
	OxprTIf6jeKzqiDI4LC4XzZGR+ZCT+7Zluq4lJKRG+EVdfMxIiJN64EPbMDmmHA4Ly1O
	xYwc6uceNJlur6qYqw39sQBJ+PHCqKQ/Jm+W/+kTG5ux2FVmeMAQY/yGn61094ETtGY2
	TLetkfT+50nSlaKNyg57UjRmVK/h6zRlaor+uEC3gixVp7BqrV93QS3A2LK5xNY/NvAl
	I7Pg==
X-Gm-Message-State: AJcUukdPBnlK8OfOljblwJV1Q5UvU2FV68j5FJ5yac3K9UmF+OvCvUBE
	ueFM+Lni6s9Wv3zUwakd5JKtlA==
X-Google-Smtp-Source: ALg8bN4ijyqy0j+5DRz9PWe9+oO1E8ipmeFeJsFQQcmJRKU//UaGXLVHHMc2pdquus5bNj7CJ9hs1Q==
X-Received: by 2002:adf:fd87:: with SMTP id d7mr14237362wrr.74.1548498799953; 
	Sat, 26 Jan 2019 02:33:19 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h131sm91738670wmd.17.2019.01.26.02.33.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 26 Jan 2019 02:33:18 -0800 (PST)
Message-ID: <c6ef31705bf1f47f7b3a265328ebc98d722c3e2f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 26 Jan 2019 10:33:17 +0000
In-Reply-To: <CAMKF1sqcKnd1ZaGxjQqPH2oYVhyuO=h1wSREii2jXsGkf=5QFQ@mail.gmail.com>
References: <20190123200520.14956-1-raj.khem@gmail.com>
	<CAJ86T=XF3Xr0x6zEH2nsHhLQ3afEMP3Ot31pbK9-66ORrCjnsg@mail.gmail.com>
	<CAMKF1srPt+fiSotytF2jczPEoCsCP5x7U=bODNe23476CA_ABQ@mail.gmail.com>
	<CAJ86T=Xp_KgsZWv=oj4kEdWqAihMNASpOMc0s7nLHgcpVozWsg@mail.gmail.com>
	<CAMKF1sqcKnd1ZaGxjQqPH2oYVhyuO=h1wSREii2jXsGkf=5QFQ@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-arm: Do not add -march options for arm architecture
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
X-List-Received-Date: Sat, 26 Jan 2019 10:33:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-24 at 22:22 -0500, Khem Raj wrote:
> On Wed, Jan 23, 2019 at 6:11 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > On Wed, Jan 23, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com>
> > wrote:
> > > On Wed, Jan 23, 2019 at 5:27 PM Andre McCurdy <
> > > armccurdy@gmail.com> wrote:
> > > > On Wed, Jan 23, 2019 at 12:05 PM Khem Raj <raj.khem@gmail.com>
> > > > wrote:
> > > > > tune files which inherit the arch definitions already define
> > > > > appropriate
> > > > > -mcpu option, which is equivalent of right -march and -mtune
> > > > > combination
> > > > 
> > > > And what about machines which inherit an arch definition
> > > > instead of a
> > > > cpu definition? Is that no longer supported?
> > > 
> > > I could not find such a machine configuration in several BSP
> > > layers I looked at.
> > > Do you know of machine definitions where these files are included
> > > directly in machine configs ?
> > 
> > Using a CPU specific include but then leaving the generic
> > DEFAULTTUNE
> > (ie not enabling any CPU specific TUNE_CCARGS) is equivalent, and I
> > guess quite common.
> 
> defaulttune does not play much part in appending -mcpu option to
> compiler flags, A case
> where this could bypass the setting mcpu is when we do not include a
> tune-* for arm based machine
> and thats the case I was interested to know.
> 
> again if there is such a BSP I would be interested to test it out.
> > > if so, then we have to either use _remove or introduce a weak
> > > variable
> > > to set march only if
> > > mcpu is not set which
> > 
> > I think the solution is to ensure that the CPU specific tuning
> > options
> > are always compatible with any architecture specific options which
> > may
> > be active.
> > 
> > In general our CPU specific tuning files are a little sloppy (e.g.
> > defaulting to combinations of VFP versions and architecture levels
> > which never exist in the real world). If newer versions of gcc are
> > making those issues more apparent then why not take the opportunity
> > to
> > fix them properly?
> 
> the mcpu option is helping with right march/mtune combination. while
> we can
> use specific -march=arch(+-)features syntax and combine with right
> -mtune to match -mcpu I think we should use
> compiler defaults and not try to recreate something that -mcpu would
> do it easily for us.
> 
> So either we drop the idea of setting mcpu and use basic -march value
> combined with -mtune ( which btw. was default in past)
> or if we want to let compiler use ISA for a particular arch
> implementation ( cortexXXX ) then we should just use -mcpu and drop
> using -mtune and -march.
> 
> I would include towards option 1.

I think the friction is partly because we support "generic" tunes as
well as cpu specific ones. Having a system which allows all of these to
be switched between is hard.

I do agree we need to have a system which does one or the other and is
clearer than the current setup though.

The v2 patch isn't right as it will only work for one end result case
and won't dynamically adjust as the current code is designed to do. We
can fix that and make such a patch work, we just need to decide what
we're aiming for first and document it.

I'd also love to understand which of the tunes are actually used and
which ones we could prune out...

Cheers,

Richard




