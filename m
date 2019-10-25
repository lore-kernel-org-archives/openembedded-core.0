Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 57BC17FA72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 11:08:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4701ZX0Syyz3P;
	Fri, 25 Oct 2019 13:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572001733;
	bh=dhkqCUQvim9jOLi5bdpZEiRkO8jQqVr4nn7NYiFgSmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pgrl3pQXTzurtZr/KKmeqO+wmYyJnjFokj5jbaPy970LxgBHMc/KOm/sG4FQl83rB
	zwddtMIbj7vWtlVG8bBVjeBjhk5ZlSl6qAhyHXSCNS3oGWHOQtaKGIxvedtN2zOnpr
	kKqvrJbm9PjcMmy3Hx3K95ZpIa8GORQkavZQE1G8FVDiS3J+xatjgkZeqmuh2CSRDI
	vBMIP0YGRjmXI82Gb4TeROw4Ut8viHGu2JO+kzXO+2M7tInp93V4BiPeiNVyh0xKB4
	6SNgWwm8nOsD6kxaRDs/yuDkw8ZFS01KuEfa7mk6iPc5pKF2tk1DhZWEro9wYS9G/M
	Z/VdOBNMCLFEl4iloXHPqnrLCsWf9kNgMYs8g8T5HWEVegdQEMzDWVvnxzcWgITUDW
	w/WZXRDafQKLsL2Z0MpIo04/mjx82Hux8TGbWZ2H9JuUaiQ74LiLByDjcS2xUwEpOo
	hGorsWGU63g2K1bn0luPw6MJOAvB4ZoHnwzZawTPn2qIpvYe3PhI7dh12H7Xaf9Rq7
	AjxukTD5zTGgnLLG4Uw0W61tpHAWx7gdRKubFSVTVTBa//mzqMcOuJGbhxCb6ykJYn
	/IOnsDzFjYbFJ9nR5jGnx3HD6CLbp7wjrQgMTG6kp4MyQ7HnJxS/8WwU6m5mtdfnvl
	rOCY7HohtXQZr9c/5nL5FJtI=
Date: Fri, 25 Oct 2019 14:08:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <20191025110849.GB17425@localhost>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<20191024153740.GB9707@localhost>
	<b15dc7e214c76e710446b6dd634f669658d5a577.camel@linuxfoundation.org>
	<a83142c2-9106-f996-d1d9-380cbf8d2b97@herbrechtsmeier.net>
MIME-Version: 1.0
In-Reply-To: <a83142c2-9106-f996-d1d9-380cbf8d2b97@herbrechtsmeier.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Fri, 25 Oct 2019 11:08:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 25, 2019 at 10:35:20AM +0200, Stefan Herbrechtsmeier wrote:
> Am 24.10.19 um 17:59 schrieb Richard Purdie:
> > On Thu, 2019-10-24 at 18:37 +0300, Adrian Bunk wrote:
> > > On Thu, Oct 24, 2019 at 02:12:43PM +0200, Alexander Kanavin wrote:
> > > > On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
> > > > stefan@herbrechtsmeier.net> wrote:
> > > > 
> > > > > @Richard: What is your opinion about the per recipe dependency?
> > > > > Typically OE use one recipe per project. The NPM based solution
> > > > > handle a
> > > > > project and all dependencies via one recipe.
> > > > 
> > > > I don't think it's at all realistic to stick to the 'one recipe per
> > > > component' in node.js world. A typical 'npm install' can pull down
> > > > hundreds, or over a thousand dependencies, it's not feasible to
> > > > have a
> > > > recipe for each.
> > > 
> > > Debian has for the perl/python/node/go/rust/haskell ecosystems
> > > one recipe per component, with ~ 1k recipes each.
> > 
> > I think we'll have to end up having a smaller number of recipes which
> > generate multiple packages. That gives a reasonable parsing time at the
> > expense of having to pre-generate some of the recipe, a bit like the
> > core perl and python recipes work today. The exact split will depend on
> > the ecosystems and the "blocks" people tend to build in as its a
> > compromise between building too much and parsing time.
> 
> How should this work? Node.js consist of multiple independent packages and
> every package define its own dependencies. Thereby the dependencies is
> defined with a version range which often reference a single version.

Yes, it is a problem that backwards compatibility is frequently broken 
in Node.js packages and just using npm might result in 10 different
versions of the same package installed and used.

This is a huge mess that either has to be sorted out when packaging
(as is done in Debian), or you end up with security support basically 
impossible for something very exposed on the internet.

> Regards
>   Stefan

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


