Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id E528C71979
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 11:08:07 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id x79so350005397lff.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MIo7CqY1qF/r+MivDqmGAxt/mqNP9VrkQco6XVS0bp0=;
	b=Vi6N79SmYkXbpnYhRSb035bXqKCzJEf2oRLeKD2ntNRaCQ/TP7GV0C8nD+x16pEOMD
	d6uTVXFmoJdLhYQcBj8PIPTHh16dHpnWon616Ld5i5nb559Vh9sYdbq7G2orpiPw4jVv
	ijsWNiPedx3Dkxd1taa7cPO9khbLsBnukldPtTJ86t8QsHezSxD+N3/BlpzX2R7fvQS2
	/ndfyZSSfbmex4J2BrbFqER3Clr6eOlQF+75NSrp782wDjEkgv8XhuE+P6cAxwkToyGc
	NthQbOVybXpwYkxdHnGNF8Qfl6qGeLoTWy5S5iTDANGylTNl9axN8gpnpYGdiKP4MQ0c
	tVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MIo7CqY1qF/r+MivDqmGAxt/mqNP9VrkQco6XVS0bp0=;
	b=ZXzFoU8nd8bFMevGgGd9239DQdzQbzZE4MaEIgrbtWoeXyB1y12ULdxhRN3uggU9gt
	l4KBXeDHMZT7LyL4ZQUdgfcu50LAhK4mN9kmNl07NW+tTp65QqY2I17Bg3dDy0BrfdNc
	h9TTTFR809ibUD+daD1ZHeEakZgIVIoSUnM6kfjHQzSzzQ0gOe4YLTcVvSxil51lmZRm
	NC6sUuo8S0EnoDR5H8+9yO3HZtZRjs2ZAevJMEX4ahjNAx8ZfIB5LMjU8lCC+eH6N6Vf
	I0nxwokn+TA8J9VwbApsDozxH82y8/hSsj3CcdFztP1KlqR2yJKEW29mjPjufoLiBypm
	DngQ==
X-Gm-Message-State: AA6/9RnsdHVB0UY7HnM08+C6TJ0v/hxty0ZTaR6YfSsDG4BUAzko+sVGMtHz4xm+NXl/Qz/bcOT3TMA7d78NNA==
X-Received: by 10.28.148.22 with SMTP id w22mr11771232wmd.42.1476788888438;
	Tue, 18 Oct 2016 04:08:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Tue, 18 Oct 2016 04:07:48 -0700 (PDT)
In-Reply-To: <20161018101703.GA18747@linux.intel.com>
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
	<20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
	<20161018083842.GA17823@linux.intel.com>
	<CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
	<20161018092748.GA18050@linux.intel.com>
	<CAD4b0_Ji4ai5XXEdiiO87ELxwEuZRrYfG=Vg6aOyebc9ZBqtGw@mail.gmail.com>
	<20161018101703.GA18747@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 18 Oct 2016 13:07:48 +0200
Message-ID: <CAD4b0_Ky2N44v8XJXoF0LZm04PKpp6=r9PKk-Y4nHd_YZe7DgQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 11:08:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 12:17 PM, Ed Bartosh <ed.bartosh@linux.intel.com> w=
rote:
> On Tue, Oct 18, 2016 at 12:24:55PM +0200, Maciej Borz=C4=99cki wrote:
>> On Tue, Oct 18, 2016 at 11:27 AM, Ed Bartosh <ed.bartosh@linux.intel.com=
> wrote:
>> > On Tue, Oct 18, 2016 at 11:24:14AM +0200, Maciej Borz=C4=99cki wrote:
>> >> On Tue, Oct 18, 2016 at 10:38 AM, Ed Bartosh <ed.bartosh@linux.intel.=
com> wrote:
>> >> > On Tue, Oct 18, 2016 at 10:37:22AM +0200, Maciej Borz=C4=99cki wrot=
e:
>> >> >> On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.inte=
l.com> wrote:
>> >> >> > On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borz=C4=99cki w=
rote:
>> >> >> >> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.i=
ntel.com> wrote:
>> >> >> >> > Hi Maciej,
>> >> >> >> >
>> >> >> >> > There is already --size and --extra-space options.
>> >> >> >> > Can we get the same or similar result by just using them? Do =
we really
>> >> >> >> > need new option for similar purpose?
>> >> >> >>
>> >> >> >> --reserved-size serves a different purpose, it establishes an u=
pper
>> >> >> >> bound on the size of a partition during layout. Unlike
>> >> >> >> --size/--extra-space does not depend on the size of the filesys=
tem
>> >> >> >> image.
>> >> >> >>
>> >> >> >> For instance, assume I'm creating an image for SD card/eMMC wit=
h a
>> >> >> >> fixed partition layout (something simple: boot partition, prima=
ry &
>> >> >> >> secondary rootfs partitions, some data partition). Because futu=
re
>> >> >> >> system updates are delivered as filesystem image, I want to mak=
e sure
>> >> >> >> that there is exactly xxx MBs for my current and future rootfs =
images
>> >> >> >> (regardless of current image size). Neither --size nor --extra-=
space
>> >> >> >> can do that. I could use, say `--size 200 --overhead-factor 1`,=
 but
>> >> >> >> this will needlessly create a 200MB rootfs image and if I happe=
n to
>> >> >> >> cross the 200MB boundary I will not get an error.
>> >> >> >>
>> >> >> >> I had a private patch that added --fixed-size to enforce --size=
, but
>> >> >> >> that would still end up creating filesystem image to fill the w=
hole
>> >> >> >> space.
>> >> >> > I didn't get the difference between enforcing partition size and=
 below
>> >> >> > implementation. Can you elaborate a bit?
>> >> >>
>> >> >> `--fixed-size` was something that I had added to my fork back in 2=
014,
>> >> >> even before `--overhead-factor` came in. The problem is that depen=
ding
>> >> >> on a project you might want to have more control over how partitio=
ns
>> >> >> are laid out, or even need to have a fixed layout. Adding
>> >> >> `--fixed-size` would had a similar effect to what `--overhead-fact=
or
>> >> >> 1` does right now. Combined with `--size` would ensure that rootfs=
 is
>> >> >> say, 200MB large. The downside was that wic would actually create =
a
>> >> >> 200MB rootfs, something that is not really necessary. In fact, I o=
nly
>> >> >> wanted to have 200MB gap so that I have some spare space for futur=
e
>> >> >> updates (where update is just a rootfs image you dd to the partiti=
on).
>> >> >>
>> >> > Thanks for the explanations. Now I got it - reserved size is not a =
part
>> >> > of partition, it's a gap between partitions.
>> >>
>> >> I might have not been clear enough when explaining. It's not a gap,
>> >> it's just a container of size --reserved-size listed in MBR/GPT.
>> >> There's probably a filesystem inside but not necessarily.
>> >> Graphically it looks as like this:
>> >>
>> >>                          --reserved-size
>> >>                       |----------------------|
>> >>                       v                      v
>> >>     +-----------------+----------------------+---------------------+
>> >>     |..... stuff .....|xxxxxxxxxx            |..... stuff .........|
>> >>     +-----------------+----------------------+---------------------+
>> >>                       ^         ^            ^
>> >>                       |---------|------------|
>> >>                        --size    --extra-space
>> >>
>> >>
>> > Ah, I'm wrong again. It's a partition size limit, but it's not necessa=
ry
>> > formatted, right? It's only formatted if size =3D=3D reserved_size.
>> >
>> >> >
>> >> > What's the advantage of creating unusable gap over creating partiti=
on of
>> >> > the same size that can be used?
>> >>
>> >> Just convenience.
>> >>
>> > What's the convenience of having extra space on partition that can't b=
e
>> > used for data over having it formatted and used?
>> >
>> >> > Even if that space is not needed it doesn't harm to have it, does i=
t?
>> >>
>> >> I have not seen any negative side effects.
>> >>
>> > I do. If user needs that reserved space it's impossible to get it with=
out
>> > reformatting partition. The free space exists, but can't be used.
>>
>> That's not the point and is not aligned with use case I'm trying to solv=
e.
>>
>> My case is rather simple, I'm creating an image for SD card that is
>> deployed in the field. In that particular case, there's a primary and
>> a secondary (aka. active and inactive) rootfs partitions that are
>> switched whenever a system update comes in. The update is a file
>> system image that is copied over to the inactive partition, followed
>> by a system reboot.
>>
>> What I need is the ability to set a certain size of a partition (say
>> 100MB), regardless of current rootfs size (which may be, say 70MB).
>> The remaining unused space sets an upper limit on how much the rootfs
>> may grow in the future (in this example case, it's 30MB). RIght now
>> the best I can do is to describe a partition like this: `part /
>> --source rootfs --size 100MB --overhead-factor 1`, hoping that if
>> rootfs grows beyond 100MB I will somehow still be able to catch that
>> and that the future images remain size compatible.
>>
>> The resulting filesystem inside the partition is larger than what
>> IMAGE_CMD (ex. IMAGE_CMD_ext4) would give me, because of explicit
>> --size in kickstart. I would prefer to have something comparable in
>> size just to avoid later surprises, what implies using defaults.
>> However, using defaults, means that I cannot control the layout
>> because it will likely change each time rootfs size gets changed.
>> There is no `--fixed-size` or other option to enforce specific size.
>>
>> Summing up, a simple use case that cannot be currently solved using wic.
>>
>> BTW. actually we're missing an ability to enforce --size (i.e.
>> --fixed-size?) and a method passing an explicit partition offset
>> inside the disk image (something useful for `--source rawcopy
>> --no-table` partitions, currently solved with `--align`).
>>
> I undertood the problem and I agree that wic doesn't provide a solution.
>
> However, instead of making unformatted space I'd propose to format it,
> i.e. to have --max-size option that would confict with --size and
> specify upper size limit for the partition. All partition will be
> formatted and available for data. This is identical to --fixed-size optio=
n
> you've described. This approach would solve the problem you're
> addressing and it would also make additional space usable.
>
> I'd also suggest to rename --size to --min-size and make --size deprecate=
d.
>
> Does this make sense to you?

No strong opinions here, just that deprecating --size might current
users uneasy.

Perhaps --max-size could be a boolean switch? We could just name it
--fixed-size (bool, defaults to False), with semantics that if
--fixed-size is provided, the partition will have size --size,
occurrence of --overhead-factor or --extra-space will raise an error.

Cheers,
--=20
Maciej Borzecki
RnDity

