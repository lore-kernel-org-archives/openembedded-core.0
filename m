Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 03990719D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 09:24:33 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id q7so147614706qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 02:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/9uZ+WNZQ7JtOqF6Xww+dbiErbAoDx/ezi7VyRnly1Y=;
	b=IuDb4BYiL5VHARkcwuJwLZxHyKFv7dOUEKuVIudUNLU5Kqk7FGq5qHFSCAVlI0HCWq
	6QxXFjfEreQ7Z6Dp7VsHbZH/pH3tOQj4qlCUouNcnscOWUsrfYuY1DkZJfxxbl0DRpEB
	J7D/w9//LXv3WxOZ4tk1ik+89YLwiIGTVTwnxX6mKMFUDNlQ5W7VpTtAqMZlOpLysKj/
	7W39cic6Y9W6iB5vDLCZc9FpX4dY+ZeOb8MjCZ7xyLeRVn6JyxO71epMK1cjddYlDQqG
	IiV0Ok4pvfMVZMFKJXr0++x1a+u7O7qB3C6smhZwocRLJ4+pWz6Ms3Ujwdag6iaszZZz
	BHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/9uZ+WNZQ7JtOqF6Xww+dbiErbAoDx/ezi7VyRnly1Y=;
	b=aOyIVyjn7gJ7PLkSOfkhMoFfUjxribomAiuAaNy0dceszC058zplZPrbL+W4jZev8v
	zHA0dyf+TpY/A5Advigi5GgV7ilv8QtqgPD7JB5wMIVGuIAxbxPBQGtgRg7GuPJJAcfk
	LdmKVHXobLBXZJq/kiv5PpAkk8MZfjp8fpc5bKlVdrih726TE+fKP1PJ9V7xOzTGCFiw
	ZZ141RtzM3KRvePzEIKrKkAIWsiEg8Tc319PyUskix6M5CXI3xoqRvwWLMrwmhH296Rp
	5JkcnCQj/xBsyeHeb/KbM+/ECy0rJiysVwoE3KIBzYVRTjTK5fphJuOT3FaqC7lNXfp7
	NGHg==
X-Gm-Message-State: AA6/9RkDdvTr4W/apNKvZ1i3N9gw87WNtbX/qcYVPFJIhwj4Yu2Z1/uQebexMxqethIfqhf4nopL5KOj0K43Jw==
X-Received: by 10.28.25.68 with SMTP id 65mr10831039wmz.93.1476782674644; Tue,
	18 Oct 2016 02:24:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Tue, 18 Oct 2016 02:24:14 -0700 (PDT)
In-Reply-To: <20161018083842.GA17823@linux.intel.com>
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
	<20161018073138.GA17569@linux.intel.com>
	<CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
	<20161018083842.GA17823@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 18 Oct 2016 11:24:14 +0200
Message-ID: <CAD4b0_LVGC5mJ72MXytQ+4Kovve1=ca8HVohfju8CPe+BzpjfA@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 09:24:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 10:38 AM, Ed Bartosh <ed.bartosh@linux.intel.com> w=
rote:
> On Tue, Oct 18, 2016 at 10:37:22AM +0200, Maciej Borz=C4=99cki wrote:
>> On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.intel.com>=
 wrote:
>> > On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borz=C4=99cki wrote:
>> >> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.intel.c=
om> wrote:
>> >> > Hi Maciej,
>> >> >
>> >> > There is already --size and --extra-space options.
>> >> > Can we get the same or similar result by just using them? Do we rea=
lly
>> >> > need new option for similar purpose?
>> >>
>> >> --reserved-size serves a different purpose, it establishes an upper
>> >> bound on the size of a partition during layout. Unlike
>> >> --size/--extra-space does not depend on the size of the filesystem
>> >> image.
>> >>
>> >> For instance, assume I'm creating an image for SD card/eMMC with a
>> >> fixed partition layout (something simple: boot partition, primary &
>> >> secondary rootfs partitions, some data partition). Because future
>> >> system updates are delivered as filesystem image, I want to make sure
>> >> that there is exactly xxx MBs for my current and future rootfs images
>> >> (regardless of current image size). Neither --size nor --extra-space
>> >> can do that. I could use, say `--size 200 --overhead-factor 1`, but
>> >> this will needlessly create a 200MB rootfs image and if I happen to
>> >> cross the 200MB boundary I will not get an error.
>> >>
>> >> I had a private patch that added --fixed-size to enforce --size, but
>> >> that would still end up creating filesystem image to fill the whole
>> >> space.
>> > I didn't get the difference between enforcing partition size and below
>> > implementation. Can you elaborate a bit?
>>
>> `--fixed-size` was something that I had added to my fork back in 2014,
>> even before `--overhead-factor` came in. The problem is that depending
>> on a project you might want to have more control over how partitions
>> are laid out, or even need to have a fixed layout. Adding
>> `--fixed-size` would had a similar effect to what `--overhead-factor
>> 1` does right now. Combined with `--size` would ensure that rootfs is
>> say, 200MB large. The downside was that wic would actually create a
>> 200MB rootfs, something that is not really necessary. In fact, I only
>> wanted to have 200MB gap so that I have some spare space for future
>> updates (where update is just a rootfs image you dd to the partition).
>>
> Thanks for the explanations. Now I got it - reserved size is not a part
> of partition, it's a gap between partitions.

I might have not been clear enough when explaining. It's not a gap,
it's just a container of size --reserved-size listed in MBR/GPT.
There's probably a filesystem inside but not necessarily.
Graphically it looks as like this:

                         --reserved-size
                      |----------------------|
                      v                      v
    +-----------------+----------------------+---------------------+
    |..... stuff .....|xxxxxxxxxx            |..... stuff .........|
    +-----------------+----------------------+---------------------+
                      ^         ^            ^
                      |---------|------------|
                       --size    --extra-space


>
> What's the advantage of creating unusable gap over creating partition of
> the same size that can be used?

Just convenience.

> Even if that space is not needed it doesn't harm to have it, does it?

I have not seen any negative side effects.

>
>> >> >>
>> >> >> +         --reserved-size: This option specifies that there should=
 be
>> >> >> +                          at least that many bytes reserved for
>> > According to the code if partition size > reserved size wic will throw
>> > an error. This somehow conflicts with 'at least that many bytes' part =
of the
>> > description in my opinion.
>> >
>> > As far as I uderstood your code this parameter specifies hard upper
>> > limit for partition size, right?
>>
>> Thanks, the wording is a bit off. I should rephrase it to 'that many
>> bytes' or just state that it's an upper limit.
>>
> Upper limit is a wrong term here. I'm sorry for confusing you.
> I proposed it because I misunderstood that it's not a partition size but =
a reserved
> space after partition. Anyway, I think above description should be
> modified to explain the option in a clear way. Using ascii picture of
> the partition layout would probably help to show what this option means.
>
>> >> >>              msger.debug("Assigned %s to %s%d, sectors range %d-%d=
 size %d "
>> >> >> -                        "sectors (%d bytes)." \
>> >> >> +                        "sectors (%d bytes), reserved %d bytes." =
\
>> >> >>                              % (part['mountpoint'], part['disk_nam=
e'], part['num'],
>> >> >> -                               part['start'], part['start'] + par=
t['size'] - 1,
>> >> >> -                               part['size'], part['size'] * self.=
sector_size))
>> >> >> +                               part['start'], disk['offset'] - 1,
>> >> >> +                               part['size'], part['size'] * self.=
sector_size,
>> >> >> +                               part['reserved_size'] * self.secto=
r_size))
>> > This will produce incorrect output about partition size as in reality =
partition size will
>> > be set to part['reserved_size'].
>>
>> I tried to avoid confusing the reader here. Partition size is one
>> thing and reservation is another. That is why reservation is logged
>> explicitly. Logging just the size would raise questions about why the
>> partition has grown.
>>
>> Perhaps it makes sense to log reservation like this instead?
>>
> What about using 'reserved %d bytes of space after partition' or
> something like that?
>
>>    part['reserved_size'] * self.sector_size if part['reserved_size']
>> else part['size'] * self.sector_size
>>
>> >
>> > "reserved 0 bytes" message will be produced if --reserved-size option
>> > is not used. It's a bit confusing as 'reserved' is too generic word. C=
an
>> > we use 'reserved size' instead?
>>
>> Yes, 'reserved size' sounds much better.
> We can also skip this part if reserved size is 0.
>
>> >> >> @@ -288,17 +303,21 @@ class Image():
>> >> >>                  # Type for ext2/ext3/ext4/btrfs
>> >> >>                  parted_fs_type =3D "ext2"
>> >> >>
>> >> >> +            psize =3D part['size']
>> >> >> +            if part['reserved_size']:
>> >> >> +                psize =3D part['reserved_size']
>> >> >> +
>> > Here I'm getting confused. How this new parameters differs from --size=
 if it behaves
>> > the same way, i.e. partition size is set to its value.
>>
>> That's intentional, Partition.prepare() is not be affected by the
>> reservation. I just want to reserve some space during layout, but not
>> necessarily enlarge the rootfs right now.
>
> This made the whole thing clear for me! Thank you.
>
>> > The only
>> > difference I see is that if rootfs size is greater than reserved size
>> > wic will fail to create partition. Would it make sense to name it
>> > --max-size in this case?
>>
>> Just wording, reservation seems more fitting, but I'm open to suggestion=
s.
>>
> I agree. --max-size would suggest that wic will make partition with this
> size.
>
> I'm still wondering what's the benefit of having unused space between
> partitions though.
>
>> >> >>              self.__create_partition(disk['disk'].device, part['ty=
pe'],
>> >> >> -                                    parted_fs_type, part['start']=
, part['size'])
>> >> >> +                                    parted_fs_type, part['start']=
, psize)
>> >> >>
>> >> >>              if part['part_type']:
>> >> >>                  msger.debug("partition %d: set type UID to %s" % =
\
>> >
>> > Can you cover this functionality(and may be other size-related
>> > functionality too) with tests? You can add testcases to existing
>> > oe-selftest wic module.
>>
>> I'll take a look at it.
> Thanks.
>
> --
> Regards,
> Ed



--=20
Maciej Borzecki
RnDity

