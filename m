Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3004871A88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 10:25:15 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id f128so271099228qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kMgnhTVBbiFrbt1w9w4vEe+wp6VfQ/W9U+/bBGKt5ZM=;
	b=vA7T8zrsWaLsaFNlAe7nE7PosOxlso6kdW3yE6ED9YJKZmnbFf8TNU9oZwXbnvtTiK
	O/YqlhAOHVuHPjNkv+GtkK40crZsc61tcmiB5oFyhYDsem1/lfEaLMvq/BnLux+70MYu
	vCsLARLMCv7IWLrSZAyXViPsewWMgmsjmtU+ldzUsowT70xJhISOX2ebg7G43y5ghTAO
	y1qm7UTHySuA2ODJ52gGBo12qiJAIOQB5rSnrTn43s3fzxfL/B9Nw3bHXkCD/O7/yW89
	kCqB2NLfC7b9BGL6oprMphe41tQ7YXfL1uIgc769ulVI3QpJ7WubxhyZgB6QdBlaK8uQ
	drbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kMgnhTVBbiFrbt1w9w4vEe+wp6VfQ/W9U+/bBGKt5ZM=;
	b=KgTkKm7ab92hlSSWDwDqLvG9p0DG0tXVK3QUXlGH6OaJROc0tBNwEsOLt+N6jaAsrk
	mMCsEHqPslGyXd4xm9qN3TLRQ1cvuYyZSjq3G41h/8Rj9oqzyUUc6AdH+Z3sd6yj2VUe
	QokPuABp8j1fls2luDpS6kQWH/Fw3mx7sDrjhUsJHAoTXIsr1J6BExf3XU72gFBYIBd9
	VvjVqVyYmEQosGQ3v6zTVNiAqUItLaJ1xTgTHyZy2KWm07mqZhwqL9LIbYfxLuVxMQbt
	oHXkxfDjIsXI7As+LLgyYyzGsEQVpNgHmwavPL9IPtclN8v0JGKkvATxU7gUsbb8K0ia
	+JlQ==
X-Gm-Message-State: AA6/9RkSNfU+jTe6BCyc0aTUptQl1y/gjlPXjcbuHH/K64UuGrScJxp39r+5rlSD0Sohe5y5FEzy9aVRLO1D2A==
X-Received: by 10.194.107.137 with SMTP id hc9mr15565274wjb.158.1476786316329; 
	Tue, 18 Oct 2016 03:25:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Tue, 18 Oct 2016 03:24:55 -0700 (PDT)
In-Reply-To: <20161018092748.GA18050@linux.intel.com>
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
	<20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
	<20161018083842.GA17823@linux.intel.com>
	<CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
	<20161018092748.GA18050@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 18 Oct 2016 12:24:55 +0200
Message-ID: <CAD4b0_Ji4ai5XXEdiiO87ELxwEuZRrYfG=Vg6aOyebc9ZBqtGw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 10:25:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 11:27 AM, Ed Bartosh <ed.bartosh@linux.intel.com> w=
rote:
> On Tue, Oct 18, 2016 at 11:24:14AM +0200, Maciej Borz=C4=99cki wrote:
>> On Tue, Oct 18, 2016 at 10:38 AM, Ed Bartosh <ed.bartosh@linux.intel.com=
> wrote:
>> > On Tue, Oct 18, 2016 at 10:37:22AM +0200, Maciej Borz=C4=99cki wrote:
>> >> On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.intel.c=
om> wrote:
>> >> > On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borz=C4=99cki wrot=
e:
>> >> >> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.inte=
l.com> wrote:
>> >> >> > Hi Maciej,
>> >> >> >
>> >> >> > There is already --size and --extra-space options.
>> >> >> > Can we get the same or similar result by just using them? Do we =
really
>> >> >> > need new option for similar purpose?
>> >> >>
>> >> >> --reserved-size serves a different purpose, it establishes an uppe=
r
>> >> >> bound on the size of a partition during layout. Unlike
>> >> >> --size/--extra-space does not depend on the size of the filesystem
>> >> >> image.
>> >> >>
>> >> >> For instance, assume I'm creating an image for SD card/eMMC with a
>> >> >> fixed partition layout (something simple: boot partition, primary =
&
>> >> >> secondary rootfs partitions, some data partition). Because future
>> >> >> system updates are delivered as filesystem image, I want to make s=
ure
>> >> >> that there is exactly xxx MBs for my current and future rootfs ima=
ges
>> >> >> (regardless of current image size). Neither --size nor --extra-spa=
ce
>> >> >> can do that. I could use, say `--size 200 --overhead-factor 1`, bu=
t
>> >> >> this will needlessly create a 200MB rootfs image and if I happen t=
o
>> >> >> cross the 200MB boundary I will not get an error.
>> >> >>
>> >> >> I had a private patch that added --fixed-size to enforce --size, b=
ut
>> >> >> that would still end up creating filesystem image to fill the whol=
e
>> >> >> space.
>> >> > I didn't get the difference between enforcing partition size and be=
low
>> >> > implementation. Can you elaborate a bit?
>> >>
>> >> `--fixed-size` was something that I had added to my fork back in 2014=
,
>> >> even before `--overhead-factor` came in. The problem is that dependin=
g
>> >> on a project you might want to have more control over how partitions
>> >> are laid out, or even need to have a fixed layout. Adding
>> >> `--fixed-size` would had a similar effect to what `--overhead-factor
>> >> 1` does right now. Combined with `--size` would ensure that rootfs is
>> >> say, 200MB large. The downside was that wic would actually create a
>> >> 200MB rootfs, something that is not really necessary. In fact, I only
>> >> wanted to have 200MB gap so that I have some spare space for future
>> >> updates (where update is just a rootfs image you dd to the partition)=
.
>> >>
>> > Thanks for the explanations. Now I got it - reserved size is not a par=
t
>> > of partition, it's a gap between partitions.
>>
>> I might have not been clear enough when explaining. It's not a gap,
>> it's just a container of size --reserved-size listed in MBR/GPT.
>> There's probably a filesystem inside but not necessarily.
>> Graphically it looks as like this:
>>
>>                          --reserved-size
>>                       |----------------------|
>>                       v                      v
>>     +-----------------+----------------------+---------------------+
>>     |..... stuff .....|xxxxxxxxxx            |..... stuff .........|
>>     +-----------------+----------------------+---------------------+
>>                       ^         ^            ^
>>                       |---------|------------|
>>                        --size    --extra-space
>>
>>
> Ah, I'm wrong again. It's a partition size limit, but it's not necessary
> formatted, right? It's only formatted if size =3D=3D reserved_size.
>
>> >
>> > What's the advantage of creating unusable gap over creating partition =
of
>> > the same size that can be used?
>>
>> Just convenience.
>>
> What's the convenience of having extra space on partition that can't be
> used for data over having it formatted and used?
>
>> > Even if that space is not needed it doesn't harm to have it, does it?
>>
>> I have not seen any negative side effects.
>>
> I do. If user needs that reserved space it's impossible to get it without
> reformatting partition. The free space exists, but can't be used.

That's not the point and is not aligned with use case I'm trying to solve.

My case is rather simple, I'm creating an image for SD card that is
deployed in the field. In that particular case, there's a primary and
a secondary (aka. active and inactive) rootfs partitions that are
switched whenever a system update comes in. The update is a file
system image that is copied over to the inactive partition, followed
by a system reboot.

What I need is the ability to set a certain size of a partition (say
100MB), regardless of current rootfs size (which may be, say 70MB).
The remaining unused space sets an upper limit on how much the rootfs
may grow in the future (in this example case, it's 30MB). RIght now
the best I can do is to describe a partition like this: `part /
--source rootfs --size 100MB --overhead-factor 1`, hoping that if
rootfs grows beyond 100MB I will somehow still be able to catch that
and that the future images remain size compatible.

The resulting filesystem inside the partition is larger than what
IMAGE_CMD (ex. IMAGE_CMD_ext4) would give me, because of explicit
--size in kickstart. I would prefer to have something comparable in
size just to avoid later surprises, what implies using defaults.
However, using defaults, means that I cannot control the layout
because it will likely change each time rootfs size gets changed.
There is no `--fixed-size` or other option to enforce specific size.

Summing up, a simple use case that cannot be currently solved using wic.

BTW. actually we're missing an ability to enforce --size (i.e.
--fixed-size?) and a method passing an explicit partition offset
inside the disk image (something useful for `--source rawcopy
--no-table` partitions, currently solved with `--align`).

Cheers,
--=20
Maciej Borzecki
RnDity

