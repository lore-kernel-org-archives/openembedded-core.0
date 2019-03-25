Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 723746BA10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 17:07:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Sgg81nTnz5v;
	Mon, 25 Mar 2019 18:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553533652;
	bh=JASys4Kyr99v6YJ3fE/tt8op7gjUFbq1EWI3ZeRNSuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4VzcCnmXUD+hbw+LFxRBldjVVrEYbPLIAZFIkeVRL3fUn+INaQWbkyLxy+Qtg7Hg
	QTr7QLNobYhvict8r3oePsf7HPRGnSZ6RSgMODUzSu9xpSIAYzQylBtlv5228ZeKmc
	WBkggZ63VSanMSbTVaNk56tbnAmdUBMGnP+mxyxcj8yoJ1p+DiyFkUwD/EmnTuncqJ
	fwPVC4s8UzcPr6IOq6QfI61NYH5cIL8Zw+ku/SUckZJQvT6KFWl/FLjhg+INcR2OP1
	TA3ao+HJ6flkfL+xubyPEGkp3Kz2P4O1TSVl+xDc3r5FkLQtSrFtBjLwrj9vRaSgh3
	fTN2Is4F7ZLZHQQPTPGlq9wQI6NdUkY4vpNG0BVkBY+O3ApRMYGokmXmymbkz8yX7T
	82Sh4/LHcc/1G4zD/MDvojwESFYX53EgjMREnzYfPQfJwpzAjtckJwW/tjDU6at6yy
	DtyT0gJoWhmdaINzCJ0uKTKirUaDgAkWKwWgKgLUk0fxhsQ1vpE+JI7aJ8PI1ruSTY
	0IJsB5HVLUHWAc0uLv2Jix8A94SRPOejiuxt2nJSx3IUOXvIgm69VEtV0wooo51zgo
	jdqzlk8KBSl0rT2B5jiN8kB4LOA8xSnmmUKtgZ9XNv2//J9vNjJRj29aFVGqgDa40X
	NwD2ZG0NAkMkWo28ZbOBQNlU=
Date: Mon, 25 Mar 2019 19:07:30 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20190325170730.GC484@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
	<CAAQYJAsR=cXSGnG6Z0hsfZHP0ZSqVh36Wb=shwY69LeahBCiPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAsR=cXSGnG6Z0hsfZHP0ZSqVh36Wb=shwY69LeahBCiPA@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Mar 2019 17:07:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 25, 2019 at 05:31:47PM +0100, Andrea Adami wrote:
> On Mon, Mar 25, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Mon, Mar 25, 2019 at 04:36:44PM +0100, Andrea Adami wrote:
> > > On Sat, Mar 23, 2019 at 11:00 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
> > > >
> > > > On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > >
> > > > > On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas Müller wrote:
> > > > > > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > > >
> > > > > > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > > > > > >...
> > > > > > > > There are certain design aspects of musl which are actually turning
> > > > > > > > out to be good
> > > > > > > > e.g. there is no __MUSL__ define, so non-portable code can not be
> > > > > > > > hidden which is a good thing,
> > > > > > > >...
> > > > > > >
> > > > > > > Please take a closer look at some of the musl changes to NM that made
> > > > > > > upgrading NM so hard for Andreas.
> > > > > > >
> > > > > > > +#if defined(__GLIBC__)
> > > > > > >  #include <net/ethernet.h>
> > > > > > > +#else /* musl libc */
> > > > > > > +#define ETH_ALEN       6               /* Octets in one ethernet addr   */
> > > > > > > +#endif
> > >...
> > >
> > > Hi,
> >
> > Hi Andrea,
> >
> > > I am jumping in a little late to take side with Khem :)
> > >
> > > What happens now is that more 'bad' sources (written to suit glibc and
> > > thus not portable) are discovered by the wider base of developers and
> > > autobuilders.
> > >...
> >
> > but this does not apply to this example, which is a problem between
> > musl itself and the kernel headers.
> >
> > Code can expect #include <foo.h> to work for any headers, and with any
> > order of these headers. If it does not, the 'bad' sources are whatever
> > sources provide the headers in question.
> >
> > musl does provide net/ethernet.h, but including it causes a compile
> > error here.
> 
> Adrian,
> 
> I don't know in this specific case, you do surely know better about
> kernel/headers than me :)
> Strangely I remember one issue with net/if.h and netinet/in.h with
> kexec-tools and musl: maybe there is really something too special with
> those net headers.
> 
> Switching the order of the headers did solve back then
> https://git.openembedded.org/meta-openembedded/commit/meta-initramfs/recipes-kernel/kexec?id=b97358d5a3568deb2a5e939019bb2acef053e53f

This changed the order between two headers that are both provided by musl.

> Sorry for the OT

This is not OT, this is a good example for a patch that is a workaround
for some problem in musl (and not a generic portability fix).

> Cheers
> Andrea

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


