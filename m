Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 02B50719BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 13:59:42 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id f6so160213260qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/evNiXbNdh2wYZEnyaioHIxE2NhS4EBhKw/itR7330g=;
	b=QE05tlGjAOzg8319h6IncmmDeC04qiaNXG1J18M5jX2tryFKq5yu54NAQxW6MuEGkn
	ncwF5qUkbCONGnmctVZFdEZ1Hy8wbZ+eIE1i3B1gPtsksXIACSzKh1le3l3o9An1w0Z5
	FB5Rta8ZE8zAyzyoi/xJQg5I38vXt//VNyQkt6vOUCPTCL23PQxNsarCjBr+dW3xCn1w
	UJo7i+G/sCJHVYI6nuG/5/sSbHid7QNruhfLA2WatxFjiaEhn644f+2zRa2OH1R/0Iy7
	JV3bjGQ5f4xkhuBNGoQ6lH9/Uge6GlH3wMB9M/cyxvvii/F3HBiV6ImiWoPed0b+Cb9f
	1U4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/evNiXbNdh2wYZEnyaioHIxE2NhS4EBhKw/itR7330g=;
	b=BtSGwcgbp+nq4Wmz+AZYmdi8pijHDy6kfAKom/lE0kTFx3cPgKbb5Sm1BgsEcGq9H2
	ImGTQ/Fl88647i8wD5ByadEtpvu4AMuOCLSkFxtW5hb9SeAribbf3oVeE2L+e3U3jGbK
	axycfmrSFsBZEm1xF4S7vvm04DnL/PVVGUxvzrUvwQKPk5QaoZJBdZICjJ7STA+4klyR
	MXDSpubmpVkAt4QHS2vrRc9KAPYH7XoawpKjcli9mPj00Mxfr1mdnW8z3MVzhRY/HOCw
	D8aaPwLJV4ELsENtr81TS68QvO4fuSEFHsZRfByXQXvzRnSjgp2O7GmZaKFHVnMJQtuo
	Rw1Q==
X-Gm-Message-State: AA6/9Rkbz3vPfPVO1948mWlgGaMYiwFRYSheVi5Ymvta+5LptAvk8IIoZ3Pw+EbmnuzNEcn9f9gdiwSd0AAqMg==
X-Received: by 10.194.90.174 with SMTP id bx14mr339371wjb.41.1476799183931;
	Tue, 18 Oct 2016 06:59:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Tue, 18 Oct 2016 06:59:23 -0700 (PDT)
In-Reply-To: <20161018110557.GA12819@linux.intel.com>
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
	<20161018110557.GA12819@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 18 Oct 2016 15:59:23 +0200
Message-ID: <CAD4b0_LAjiTOdma6TCcuAm09G3bNNg3sTGyRbf6o+wV_XjVsZg@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 13:59:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 1:05 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wr=
ote:
> On Tue, Oct 18, 2016 at 01:07:48PM +0200, Maciej Borz=C4=99cki wrote:
>> On Tue, Oct 18, 2016 at 12:17 PM, Ed Bartosh <ed.bartosh@linux.intel.com=
> wrote:
>> > On Tue, Oct 18, 2016 at 12:24:55PM +0200, Maciej Borz=C4=99cki wrote:
>> >> On Tue, Oct 18, 2016 at 11:27 AM, Ed Bartosh <ed.bartosh@linux.intel.=
com> wrote:
>> >> > On Tue, Oct 18, 2016 at 11:24:14AM +0200, Maciej Borz=C4=99cki wrot=
e:
>> >> >> On Tue, Oct 18, 2016 at 10:38 AM, Ed Bartosh <ed.bartosh@linux.int=
el.com> wrote:
>> >> >> > On Tue, Oct 18, 2016 at 10:37:22AM +0200, Maciej Borz=C4=99cki w=
rote:
>> >> >> >> On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.i=
ntel.com> wrote:
>> >> >> >> > On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borz=C4=99ck=
i wrote:
>> >> >> >> >> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linu=
x.intel.com> wrote:
>> >> >> >> >> > Hi Maciej,
>> >> >> >> >> >
>> >> >> >> >> > There is already --size and --extra-space options.
>> >> >> >> >> > Can we get the same or similar result by just using them? =
Do we really
>> >> >> >> >> > need new option for similar purpose?
>> >> >> >> >>
>> >> >> >> >> --reserved-size serves a different purpose, it establishes a=
n upper
>> >> >> >> >> bound on the size of a partition during layout. Unlike
>> >> >> >> >> --size/--extra-space does not depend on the size of the file=
system
>> >> >> >> >> image.
>> >> >> >> >>
>> >> >> >> >> For instance, assume I'm creating an image for SD card/eMMC =
with a
>> >> >> >> >> fixed partition layout (something simple: boot partition, pr=
imary &
>> >> >> >> >> secondary rootfs partitions, some data partition). Because f=
uture
>> >> >> >> >> system updates are delivered as filesystem image, I want to =
make sure
>> >> >> >> >> that there is exactly xxx MBs for my current and future root=
fs images
>> >> >> >> >> (regardless of current image size). Neither --size nor --ext=
ra-space
>> >> >> >> >> can do that. I could use, say `--size 200 --overhead-factor =
1`, but
>> >> >> >> >> this will needlessly create a 200MB rootfs image and if I ha=
ppen to
>> >> >> >> >> cross the 200MB boundary I will not get an error.
>> >> >> >> >>
>> >> >> >> >> I had a private patch that added --fixed-size to enforce --s=
ize, but
>> >> >> >> >> that would still end up creating filesystem image to fill th=
e whole
>> >> >> >> >> space.
>> >> >> >> > I didn't get the difference between enforcing partition size =
and below
>> >> >> >> > implementation. Can you elaborate a bit?
>> >> >> >>
>> >> >> >> `--fixed-size` was something that I had added to my fork back i=
n 2014,
>> >> >> >> even before `--overhead-factor` came in. The problem is that de=
pending
>> >> >> >> on a project you might want to have more control over how parti=
tions
>> >> >> >> are laid out, or even need to have a fixed layout. Adding
>> >> >> >> `--fixed-size` would had a similar effect to what `--overhead-f=
actor
>> >> >> >> 1` does right now. Combined with `--size` would ensure that roo=
tfs is
>> >> >> >> say, 200MB large. The downside was that wic would actually crea=
te a
>> >> >> >> 200MB rootfs, something that is not really necessary. In fact, =
I only
>> >> >> >> wanted to have 200MB gap so that I have some spare space for fu=
ture
>> >> >> >> updates (where update is just a rootfs image you dd to the part=
ition).
>> >> >> >>
>> >> >> > Thanks for the explanations. Now I got it - reserved size is not=
 a part
>> >> >> > of partition, it's a gap between partitions.
>> >> >>
>> >> >> I might have not been clear enough when explaining. It's not a gap=
,
>> >> >> it's just a container of size --reserved-size listed in MBR/GPT.
>> >> >> There's probably a filesystem inside but not necessarily.
>> >> >> Graphically it looks as like this:
>> >> >>
>> >> >>                          --reserved-size
>> >> >>                       |----------------------|
>> >> >>                       v                      v
>> >> >>     +-----------------+----------------------+--------------------=
-+
>> >> >>     |..... stuff .....|xxxxxxxxxx            |..... stuff ........=
.|
>> >> >>     +-----------------+----------------------+--------------------=
-+
>> >> >>                       ^         ^            ^
>> >> >>                       |---------|------------|
>> >> >>                        --size    --extra-space
>> >> >>
>> >> >>
>> >> > Ah, I'm wrong again. It's a partition size limit, but it's not nece=
ssary
>> >> > formatted, right? It's only formatted if size =3D=3D reserved_size.
>> >> >
>> >> >> >
>> >> >> > What's the advantage of creating unusable gap over creating part=
ition of
>> >> >> > the same size that can be used?
>> >> >>
>> >> >> Just convenience.
>> >> >>
>> >> > What's the convenience of having extra space on partition that can'=
t be
>> >> > used for data over having it formatted and used?
>> >> >
>> >> >> > Even if that space is not needed it doesn't harm to have it, doe=
s it?
>> >> >>
>> >> >> I have not seen any negative side effects.
>> >> >>
>> >> > I do. If user needs that reserved space it's impossible to get it w=
ithout
>> >> > reformatting partition. The free space exists, but can't be used.
>> >>
>> >> That's not the point and is not aligned with use case I'm trying to s=
olve.
>> >>
>> >> My case is rather simple, I'm creating an image for SD card that is
>> >> deployed in the field. In that particular case, there's a primary and
>> >> a secondary (aka. active and inactive) rootfs partitions that are
>> >> switched whenever a system update comes in. The update is a file
>> >> system image that is copied over to the inactive partition, followed
>> >> by a system reboot.
>> >>
>> >> What I need is the ability to set a certain size of a partition (say
>> >> 100MB), regardless of current rootfs size (which may be, say 70MB).
>> >> The remaining unused space sets an upper limit on how much the rootfs
>> >> may grow in the future (in this example case, it's 30MB). RIght now
>> >> the best I can do is to describe a partition like this: `part /
>> >> --source rootfs --size 100MB --overhead-factor 1`, hoping that if
>> >> rootfs grows beyond 100MB I will somehow still be able to catch that
>> >> and that the future images remain size compatible.
>> >>
>> >> The resulting filesystem inside the partition is larger than what
>> >> IMAGE_CMD (ex. IMAGE_CMD_ext4) would give me, because of explicit
>> >> --size in kickstart. I would prefer to have something comparable in
>> >> size just to avoid later surprises, what implies using defaults.
>> >> However, using defaults, means that I cannot control the layout
>> >> because it will likely change each time rootfs size gets changed.
>> >> There is no `--fixed-size` or other option to enforce specific size.
>> >>
>> >> Summing up, a simple use case that cannot be currently solved using w=
ic.
>> >>
>> >> BTW. actually we're missing an ability to enforce --size (i.e.
>> >> --fixed-size?) and a method passing an explicit partition offset
>> >> inside the disk image (something useful for `--source rawcopy
>> >> --no-table` partitions, currently solved with `--align`).
>> >>
>> > I undertood the problem and I agree that wic doesn't provide a solutio=
n.
>> >
>> > However, instead of making unformatted space I'd propose to format it,
>> > i.e. to have --max-size option that would confict with --size and
>> > specify upper size limit for the partition. All partition will be
>> > formatted and available for data. This is identical to --fixed-size op=
tion
>> > you've described. This approach would solve the problem you're
>> > addressing and it would also make additional space usable.
>> >
>> > I'd also suggest to rename --size to --min-size and make --size deprec=
ated.
>> >
>> > Does this make sense to you?
>>
>> No strong opinions here, just that deprecating --size might current
>> users uneasy.
>>
> By deprecting --size I didn't mean removing it completely. We can just
> print a warning suggesting usage of other options.
>
>> Perhaps --max-size could be a boolean switch? We could just name it
>> --fixed-size (bool, defaults to False), with semantics that if
>> --fixed-size is provided, the partition will have size --size,
>> occurrence of --overhead-factor or --extra-space will raise an error.
>>
> That would work too, but it looks a bit confusing to me to have 2 differe=
nt
> types of size-related options.

Ok, but now we would have --min-size (previously known as --size) and
--size (or --max-size?). That's still 2 size related options plus a
deprecation warning.

>
> I agree on raising error on --overhead-factor and --extra-space.
>
> Frankly I'd make --overhead-factor deprecated too as it's too implicit
> from my point of view. May be there are some use cases for it, but I can'=
t
> imagine why would someone want free space to be n times bigger than used =
space.

Well, there are IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE options.
I suppose that --overhead-factor was added so that you could set it to
1 and get the actual --size you want and/or have it controlled in a
more predictable manner by adding --extra-space.

> Anyway, it's totally different story. Let's not talk about it now.
>

--=20
Maciej Borzecki
RnDity

