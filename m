Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 387F07CF1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:10:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44SfNw0VVmz3n;
	Mon, 25 Mar 2019 17:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553530209;
	bh=4mGgGqLTfV52G6skOsDeamTl0Xq8DbU6dm1mI7ubLOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHwQCmBaZ66J/H221ZWMcDbjEZJXEp1xLwQyJjBeHnsCXFreIeIqJIYHk0eWQhBrj
	hL07XLjSqY3O92ZdlVMDzxNdG9LMf6m6zg4lg6biziPxTf4qJLiGjFBmrTH36MKEb3
	UNlMzST0Hk/gsaTjOkSdrvIjBN0w2sieqr50RPd5ka3+2FiSz4r/taw4hP5ZAMso+U
	LafCL2elgPdU3iYNl8MhdzTcaYSHnvQsLury/TP5ZK9Vp9MbXCap4CN1cLowlldJGI
	ePE1iCC0zbuuWTwzpuKnLeV4kOAj4IjzUh/Qa+IAKUpofFqA0xHQIvV9L6Gk4AP9DG
	Vf8DOGHwY5Jja5m0No+GU0gC3gaX91SCAXgKZ8F7GG6vTIEJ6jyet1p4Q31HPNieRH
	SVLS1P1yA997/dhDvC+edn8wavs8V7hPN3qqtoluLaTVutlqkid+fcOfQoGt+3r4By
	rNiJHMJgvdpQ+Axnmdd8xPZbGJRPxblPDW+j9nlpTeSH5WxoR6gzwdPcoHP77PtT5m
	I6t8a0hjIOZ2lStZRxZOPYe6W6dP1rSSWvC2l/MOHs0+JgAoud83fie2Z9ioHeuLcM
	wd4vUhUQquVE7pXs/4tk32IryJFFOvoeAcU47H+C2EdZm/G26dEoG4xdAtNM5eAtnq
	sQpxhh4aGCbtie9HvpSkqIIA=
Date: Mon, 25 Mar 2019 18:10:04 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20190325161004.GB484@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 16:10:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 25, 2019 at 04:36:44PM +0100, Andrea Adami wrote:
> On Sat, Mar 23, 2019 at 11:00 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
> >
> > On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas Müller wrote:
> > > > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > >
> > > > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > > > >...
> > > > > > There are certain design aspects of musl which are actually turning
> > > > > > out to be good
> > > > > > e.g. there is no __MUSL__ define, so non-portable code can not be
> > > > > > hidden which is a good thing,
> > > > > >...
> > > > >
> > > > > Please take a closer look at some of the musl changes to NM that made
> > > > > upgrading NM so hard for Andreas.
> > > > >
> > > > > +#if defined(__GLIBC__)
> > > > >  #include <net/ethernet.h>
> > > > > +#else /* musl libc */
> > > > > +#define ETH_ALEN       6               /* Octets in one ethernet addr   */
> > > > > +#endif
>...
> 
> Hi,

Hi Andrea,

> I am jumping in a little late to take side with Khem :)
> 
> What happens now is that more 'bad' sources (written to suit glibc and
> thus not portable) are discovered by the wider base of developers and
> autobuilders.
>...

but this does not apply to this example, which is a problem between
musl itself and the kernel headers.

Code can expect #include <foo.h> to work for any headers, and with any 
order of these headers. If it does not, the 'bad' sources are whatever
sources provide the headers in question.

musl does provide net/ethernet.h, but including it causes a compile
error here.

> As Khem said, this just needs time and efforts to clean up and
> upstream the patches.

Any sane upstream will refuse such patches that add musl-specific hacks
with the wrong define to work around problems in musl itself.

> Cheers
> Andrea

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


