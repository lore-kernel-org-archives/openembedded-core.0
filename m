Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 23EB97D270
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 07:25:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 459vsn65BYz2C;
	Sat, 25 May 2019 09:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558769150;
	bh=9p3OKKc5nnobKr2uaXRN26f5pd9xbMCvV0rdKFy8Epk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/s47cjJ4qT/qVq+J/r2ovRy01UaJj9biGg/XMmDMeZUmSyOn9K0si5y+jTfdDfQ7
	MGGZKacp2hULetkr+t8lqTAoftdkSDYzLJiydr7AhmwNgkATNRgYKAYRnCVOYvOotg
	VwbzI8fara4IQV6JpAb6d+1bUcUTnLcyifMmtoNVzGCZFbj64cGVU+jZ9qmBKwvSKh
	2Obk/CVZ10hL2cycI3U0opqC+zhSL5QtmVlpYa4RPKKQ0QHfeTwdQYX2538TKKBD55
	ynab8H5rT7WVhtgblWpaH3klsZIhutzGoxOxJaIGSW9EzUhaQ8xmmIL3eYksznXjRQ
	XvJJdJZ7f3nTvNinH70VSmUJcwHr5NmkIDZA1Q4e/bIx1sMbsZIPmMBR53wSjZmdvU
	Xs3jE99siK+1epKFDMWc+PO+/HnxP9XxOpBzd6M/nY2XkBaJJPLCSyJHEzOIVONxts
	Df0jT3XVWMRDRZTxSh7OYYzj4+CR03dYpjgDiCiAGRbnFXh1vMGw6to6VQnMv+Mh8Z
	Wt3CJ2MfTAYrQtGEa+rHIg98kxDDgiOUab8RDZ2cmPE61GXNpoJ7elxdh67M8RstQ9
	R4P1hbRJ5/eP9bdMl/PskdOYShF4Y0DKBAUMUztWbTmfvqk6FZ5gyGXrXbYHvWzSmI
	yzB3gor+hzTT7NFi7kwqGWCQ=
Date: Sat, 25 May 2019 10:25:47 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190525072547.GC12358@localhost>
References: <20190524101211.GA25912@localhost>
	<f10fea91-06a4-529a-1b42-0c12dc46f54c@gmail.com>
	<20190524172737.GA6813@localhost>
	<CAMKF1sp8H7pOMvHLw+xJhOEE8KyPASmSrQJYxib-ugqrP-OS0Q@mail.gmail.com>
	<20190524175859.GB6813@localhost>
	<CAMKF1sr-JCp6HM1BwYE5T-hgK_2T2j7rfNiRZcD0r_AuC2F7LA@mail.gmail.com>
	<20190524184546.GA12358@localhost>
	<CAJ86T=Vr=BSX1fF3G-bHspzXQpXw6qEkUjFDt0==CwgDnpPGFA@mail.gmail.com>
	<20190524202842.GB12358@localhost>
	<CAJ86T=XoVzv5yLq1Hkoy2mXVDAA0rY-h8WboP4OmimLrJwJK0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XoVzv5yLq1Hkoy2mXVDAA0rY-h8WboP4OmimLrJwJK0w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Sat, 25 May 2019 07:25:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 24, 2019 at 03:25:57PM -0700, Andre McCurdy wrote:
> On Fri, May 24, 2019 at 1:28 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Fri, May 24, 2019 at 12:34:23PM -0700, Andre McCurdy wrote:
> > > On Fri, May 24, 2019 at 11:46 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > > On Fri, May 24, 2019 at 11:04:50AM -0700, Khem Raj wrote:
> > >...
> > > > > I think we should put in plan for 2.8 and define the scope, since we
> > > > > are switching
> > > > > poky defaults to systemd,
> > > >
> > > > Switching glibc builds to systemd as default is a reasonable decision.
> > > >
> > > > Switching musl builds to systemd as default would be very bad.
> > > >
> > > > Combining a tiny C library with a huge init system completely misses
> > > > the configurations where the tiny C library actually makes sense for
> > > > users.
> > >
> > > For new projects yes. However I know of a project (a big project,
> > > shipping millions of devices) which picked systemd and glibc long ago
> > > and is now running out of space. They already have various solutions
> > > to free up Flash (some apps switched to being runtime downloadable,
> > > etc) but if/when more savings need to be found then switching from
> > > glibc to musl might be a less invasive change than switching from
> > > systemd to some other init system. We obviously shouldn't make
> > > decisions for OE today based on the historical decisions of one
> > > project, but I just want to make the point that real world projects
> > > have a lifetime and may end up with a combination of systemd + musl
> > > due on past decisions that may not make sense for a new project
> > > starting today.
> >
> > I am feeling guilty that there are two only partially related
> > topics mixed in this discussion.
> >
> > In this part of the discussion the topic was what the default
> > (and CI-tested) init system for musl should be - it seems obvious
> > to me that systemd is not what users will usually want to use with musl.
> 
> It would be great to have an alternative init system option for
> smaller devices in oe-core. I don't think collectively we have the
> development capacity to support it though (it's probably far more work
> than properly fixing all the currently known issues with systemd on
> musl...).

Is there development capacity to support musl?

Supporting musl is a real pain across the board,
with new issues all the time.

For really tiny systems you need both a tiny C library and a tiny init 
system, so not properly supporting the combination of both forces users 
to use alternative options instead of OE.

Which minimizes the benefits gained by the pains of supporting musl.

> > But there is also the topic whether systemd on musl is
> > in a state that it should be made available at all.
> 
> I think it's wrong to remove stuff from oe-core just because it isn't
> perfect or isn't CI tested. Having something in oe-core means there's
> a common version to collaborate on. If it gets kicked out then
> development efforts inevitably fragment. Users are generally smart
> enough to understand the concept of an experimental feature - although
> we could perhaps do a better job of identifying them. Maybe one day
> when users can create a custom distro config by running "make
> menuconfig" there will be an option to enable experimental features
> and the combination of musl and systemd would be hidden behind that.
> Until then, perhaps we could add a sanity check warning if musl and
> systemd are enabled together?

That would be an improvement.

But it conflicts with the intention to make systemd the default
and CI-tested init system for musl.

>...
> > At that point my email that started this thread becomes relevant,
> > the fact that the systemd/musl patches in OE add new security
> > vulnerabilities and other bugs - and none of the systemd-on-musl
> > proponents seems to consider this a problem they have to fix ASAP.
> 
> It's certainly a problem and we should try to fix it. It's not at all
> uncommon that patches to fix build issues with musl, clang, a new
> version of gcc, etc have a life cycle... a first pass just to fix the
> build and then updates as issues are found or better solutions get
> merged upstream. It's the normal process. You could argue that we are
> sometimes too quick to merge the first pass hacks and too slow to
> review and update them, but unfortunately that's just a consequence of
> limited developer resources (and it's always more fun to try to get
> the latest version of something working than review and cleanup old
> patches...).

If upstreaming is possible at all.

With systemd on musl there is also the fundamental problem that 
neither of the upstreams is interested in compromising their 
software for the other.

Not to blame either of them, there is simply a fundamental conflict 
between the systemd "use all functionality available" and the musl
"be a tiny C library" and "follow standards and provide only some
GNU extensions".

One example:

systemd uses qsort_r.
musl upstream doesn't want to add qsort_r since it is nonstandard
and BSD and glibc ended up providing incompatible versions.
Most C libraries for Linux just follow glibc on that,
but musl upstream is not doing this with a reasonable
technical justification.

For 0002-don-t-use-glibc-specific-qsort_r.patch (which looks as if it 
does cause data corruption) upstream is therefore in practice POSIX,
unless you manage to convince systemd upstream to use something like
gnulib to provide all the functionality they use that is not provided
by musl. Which would also be a constant effort you have to makes since
systemd upstream would not care about musl when making changes to
their code.

Even harder are cases like on_exit(3) (not currently hit by systemd but 
by other Linux-only software), which might not be implementable as an 
external function outside the C library.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


