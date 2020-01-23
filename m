Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 71D5D7FD1B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5641040BF7;
	Thu, 23 Jan 2020 22:43:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zvDQp5LJHQw8; Thu, 23 Jan 2020 22:43:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 92AD1400E8;
	Thu, 23 Jan 2020 22:43:41 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 082071743AB; Thu, 23 Jan 2020 17:43:41 -0500 (EST)
Date: Thu, 23 Jan 2020 17:43:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20200123224340.GG4735@denix.org>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
	<CAJ86T=VYsiBgrxPL-N4yy0S2FNUixxn6sfWjaaWQioFHqD=2-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VYsiBgrxPL-N4yy0S2FNUixxn6sfWjaaWQioFHqD=2-g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 22:43:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2020 at 02:39:52PM -0800, Andre McCurdy wrote:
> On Thu, Jan 23, 2020 at 2:17 PM Ross Burton <ross.burton@intel.com> wrote:
> > On 23/01/2020 21:43, Bruce Ashfield wrote:
> > > On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >>
> > >> From: Denys Dmytriyenko <denys@ti.com>
> > >>
> > >> Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> > >> To avoid duplicating efforts of adding very similar recipes to BSP layers,
> > >> add an upstream reference implementation to openembedded-core, which can be
> > >> customized by BSPs, if needed.
> > >
> > > Isn't this one of the things that Jon Mason is trying to
> > > standardize/support in meta-arm ?
> > >
> > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a
> > >
> > > What's the delta between the two ?
> >
> > That was precisely my thought too.  meta-arm isn't exactly well known
> > right now, but ideally it should be a central place for common pieces
> > that are specific to ARM hardware (unlike anything that is needed for
> > qemuarm itself).
> 
> Such as all the various cortex etc CPU tuning files?

LOL! :) Of course, since ARM is such an inferior arch to x86. Otherwise we 
should move everything that is not needed by qemux86 to meta-intel... JK :)

-- 
Denys

