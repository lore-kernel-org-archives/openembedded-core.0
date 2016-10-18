Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id ACB5871B56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 11:31:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 18 Oct 2016 04:31:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,361,1473145200"; d="scan'208";a="1046331949"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2016 04:31:25 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4B6B06A4006;
	Tue, 18 Oct 2016 04:30:51 -0700 (PDT)
Date: Tue, 18 Oct 2016 14:05:57 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej =?utf-8?B?Qm9yesSZY2tp?= <maciej.borzecki@rndity.com>
Message-ID: <20161018110557.GA12819@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
	<20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
	<20161018083842.GA17823@linux.intel.com>
	<CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
	<20161018092748.GA18050@linux.intel.com>
	<CAD4b0_Ji4ai5XXEdiiO87ELxwEuZRrYfG=Vg6aOyebc9ZBqtGw@mail.gmail.com>
	<20161018101703.GA18747@linux.intel.com>
	<CAD4b0_Ky2N44v8XJXoF0LZm04PKpp6=r9PKk-Y4nHd_YZe7DgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD4b0_Ky2N44v8XJXoF0LZm04PKpp6=r9PKk-Y4nHd_YZe7DgQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add --reserved-size wks option
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
X-List-Received-Date: Tue, 18 Oct 2016 11:31:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 18, 2016 at 01:07:48PM +0200, Maciej Borzęcki wrote:
> On Tue, Oct 18, 2016 at 12:17 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > On Tue, Oct 18, 2016 at 12:24:55PM +0200, Maciej Borzęcki wrote:
> >> On Tue, Oct 18, 2016 at 11:27 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >> > On Tue, Oct 18, 2016 at 11:24:14AM +0200, Maciej Borzęcki wrote:
> >> >> On Tue, Oct 18, 2016 at 10:38 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >> >> > On Tue, Oct 18, 2016 at 10:37:22AM +0200, Maciej Borzęcki wrote:
> >> >> >> On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >> >> >> > On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borzęcki wrote:
> >> >> >> >> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >> >> >> >> > Hi Maciej,
> >> >> >> >> >
> >> >> >> >> > There is already --size and --extra-space options.
> >> >> >> >> > Can we get the same or similar result by just using them? Do we really
> >> >> >> >> > need new option for similar purpose?
> >> >> >> >>
> >> >> >> >> --reserved-size serves a different purpose, it establishes an upper
> >> >> >> >> bound on the size of a partition during layout. Unlike
> >> >> >> >> --size/--extra-space does not depend on the size of the filesystem
> >> >> >> >> image.
> >> >> >> >>
> >> >> >> >> For instance, assume I'm creating an image for SD card/eMMC with a
> >> >> >> >> fixed partition layout (something simple: boot partition, primary &
> >> >> >> >> secondary rootfs partitions, some data partition). Because future
> >> >> >> >> system updates are delivered as filesystem image, I want to make sure
> >> >> >> >> that there is exactly xxx MBs for my current and future rootfs images
> >> >> >> >> (regardless of current image size). Neither --size nor --extra-space
> >> >> >> >> can do that. I could use, say `--size 200 --overhead-factor 1`, but
> >> >> >> >> this will needlessly create a 200MB rootfs image and if I happen to
> >> >> >> >> cross the 200MB boundary I will not get an error.
> >> >> >> >>
> >> >> >> >> I had a private patch that added --fixed-size to enforce --size, but
> >> >> >> >> that would still end up creating filesystem image to fill the whole
> >> >> >> >> space.
> >> >> >> > I didn't get the difference between enforcing partition size and below
> >> >> >> > implementation. Can you elaborate a bit?
> >> >> >>
> >> >> >> `--fixed-size` was something that I had added to my fork back in 2014,
> >> >> >> even before `--overhead-factor` came in. The problem is that depending
> >> >> >> on a project you might want to have more control over how partitions
> >> >> >> are laid out, or even need to have a fixed layout. Adding
> >> >> >> `--fixed-size` would had a similar effect to what `--overhead-factor
> >> >> >> 1` does right now. Combined with `--size` would ensure that rootfs is
> >> >> >> say, 200MB large. The downside was that wic would actually create a
> >> >> >> 200MB rootfs, something that is not really necessary. In fact, I only
> >> >> >> wanted to have 200MB gap so that I have some spare space for future
> >> >> >> updates (where update is just a rootfs image you dd to the partition).
> >> >> >>
> >> >> > Thanks for the explanations. Now I got it - reserved size is not a part
> >> >> > of partition, it's a gap between partitions.
> >> >>
> >> >> I might have not been clear enough when explaining. It's not a gap,
> >> >> it's just a container of size --reserved-size listed in MBR/GPT.
> >> >> There's probably a filesystem inside but not necessarily.
> >> >> Graphically it looks as like this:
> >> >>
> >> >>                          --reserved-size
> >> >>                       |----------------------|
> >> >>                       v                      v
> >> >>     +-----------------+----------------------+---------------------+
> >> >>     |..... stuff .....|xxxxxxxxxx            |..... stuff .........|
> >> >>     +-----------------+----------------------+---------------------+
> >> >>                       ^         ^            ^
> >> >>                       |---------|------------|
> >> >>                        --size    --extra-space
> >> >>
> >> >>
> >> > Ah, I'm wrong again. It's a partition size limit, but it's not necessary
> >> > formatted, right? It's only formatted if size == reserved_size.
> >> >
> >> >> >
> >> >> > What's the advantage of creating unusable gap over creating partition of
> >> >> > the same size that can be used?
> >> >>
> >> >> Just convenience.
> >> >>
> >> > What's the convenience of having extra space on partition that can't be
> >> > used for data over having it formatted and used?
> >> >
> >> >> > Even if that space is not needed it doesn't harm to have it, does it?
> >> >>
> >> >> I have not seen any negative side effects.
> >> >>
> >> > I do. If user needs that reserved space it's impossible to get it without
> >> > reformatting partition. The free space exists, but can't be used.
> >>
> >> That's not the point and is not aligned with use case I'm trying to solve.
> >>
> >> My case is rather simple, I'm creating an image for SD card that is
> >> deployed in the field. In that particular case, there's a primary and
> >> a secondary (aka. active and inactive) rootfs partitions that are
> >> switched whenever a system update comes in. The update is a file
> >> system image that is copied over to the inactive partition, followed
> >> by a system reboot.
> >>
> >> What I need is the ability to set a certain size of a partition (say
> >> 100MB), regardless of current rootfs size (which may be, say 70MB).
> >> The remaining unused space sets an upper limit on how much the rootfs
> >> may grow in the future (in this example case, it's 30MB). RIght now
> >> the best I can do is to describe a partition like this: `part /
> >> --source rootfs --size 100MB --overhead-factor 1`, hoping that if
> >> rootfs grows beyond 100MB I will somehow still be able to catch that
> >> and that the future images remain size compatible.
> >>
> >> The resulting filesystem inside the partition is larger than what
> >> IMAGE_CMD (ex. IMAGE_CMD_ext4) would give me, because of explicit
> >> --size in kickstart. I would prefer to have something comparable in
> >> size just to avoid later surprises, what implies using defaults.
> >> However, using defaults, means that I cannot control the layout
> >> because it will likely change each time rootfs size gets changed.
> >> There is no `--fixed-size` or other option to enforce specific size.
> >>
> >> Summing up, a simple use case that cannot be currently solved using wic.
> >>
> >> BTW. actually we're missing an ability to enforce --size (i.e.
> >> --fixed-size?) and a method passing an explicit partition offset
> >> inside the disk image (something useful for `--source rawcopy
> >> --no-table` partitions, currently solved with `--align`).
> >>
> > I undertood the problem and I agree that wic doesn't provide a solution.
> >
> > However, instead of making unformatted space I'd propose to format it,
> > i.e. to have --max-size option that would confict with --size and
> > specify upper size limit for the partition. All partition will be
> > formatted and available for data. This is identical to --fixed-size option
> > you've described. This approach would solve the problem you're
> > addressing and it would also make additional space usable.
> >
> > I'd also suggest to rename --size to --min-size and make --size deprecated.
> >
> > Does this make sense to you?
> 
> No strong opinions here, just that deprecating --size might current
> users uneasy.
> 
By deprecting --size I didn't mean removing it completely. We can just
print a warning suggesting usage of other options.

> Perhaps --max-size could be a boolean switch? We could just name it
> --fixed-size (bool, defaults to False), with semantics that if
> --fixed-size is provided, the partition will have size --size,
> occurrence of --overhead-factor or --extra-space will raise an error.
> 
That would work too, but it looks a bit confusing to me to have 2 different
types of size-related options.

I agree on raising error on --overhead-factor and --extra-space.

Frankly I'd make --overhead-factor deprecated too as it's too implicit
from my point of view. May be there are some use cases for it, but I can't
imagine why would someone want free space to be n times bigger than used space.
Anyway, it's totally different story. Let's not talk about it now.

--
Regards,
Ed

