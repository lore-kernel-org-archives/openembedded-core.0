Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2A271A01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 08:37:42 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id x79so343304829lff.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2016 01:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=n6sbyJr4b3ESzJGU2fF7JAURvozNvI5Qf+5Ulv0KgN0=;
	b=K6TU++eAeiIe4/TuMxGQZQoDseMaWu/JWiaLA7aUfxbCn1YjgBr1Er1mPcoe3jWuFV
	4WK2ujvY9AhZ5naUUJCoNN8lDIEwLlADWxO/7Y6gjuUAprvJfLWeeJoswWIzKUhUy3zC
	oreh7PQbdRCiEvy+1vQ2GIv9794UYnOW4cees+hE8n2vtkco66RPBp6nvUcOpgZbby2+
	0PSpAXVOqHF0E3t+Rqjhjocvxr+7QNsxX0Dcya34UBX6kz7F5Oho8wxIQxub8ZQfxhFa
	yk8TBedBN1UO3evwH5b5kSJWt0OSfrs53pJAk9CG9op9/zi49lDjSeADur8wGeRb2sIj
	o+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=n6sbyJr4b3ESzJGU2fF7JAURvozNvI5Qf+5Ulv0KgN0=;
	b=LJXYDCtwfL3A/Bbir7Ev6z5glje9QcDhPrzYU8aotz2u43RBXxs3Mb5uZBJsXBMcvQ
	nHnLI3EjzsAsZDyYa+cDpasJUawRUYMa0VJv9Lop7jiKRMeHGGXC63CaxOC27CE3l4uR
	RSy2HX/U4SbvSo4PJV2pYCP7qYoOxsqDVDnZvoqi44aNFYrWFA9yIUdHzPQI7ZZVGWFl
	MvTFhUFFxS266PsdUWz+GNANDoBrX65kmdSZ+Gkd8c4fbgK9Dgw6mQU1a+WbM+ybd2YI
	hf2I4S3TE84EBv4Qr8XEtZkRQdEhxwg9guboqeDVDFrYYHfPhUTVzxlMmDc8LnnQbWOt
	Nhqw==
X-Gm-Message-State: AA6/9RlepG9gue8m6UuxVL1Y70KmMgbAbPcz7lBcFmKeESkREvhKFWuNfl5sTooLeNiP0AgtJSsvreufk9D4dA==
X-Received: by 10.28.26.193 with SMTP id a184mr10682748wma.93.1476779863026;
	Tue, 18 Oct 2016 01:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Tue, 18 Oct 2016 01:37:22 -0700 (PDT)
In-Reply-To: <20161018073138.GA17569@linux.intel.com>
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
	<CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
	<20161018073138.GA17569@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Tue, 18 Oct 2016 10:37:22 +0200
Message-ID: <CAD4b0_LjLzKRYACNx8tOAyrdsfeTQdAGMBKvotkj4Ah6w=PGJw@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Oct 2016 08:37:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2016 at 9:31 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wr=
ote:
> On Mon, Oct 17, 2016 at 04:46:00PM +0200, Maciej Borz=C4=99cki wrote:
>> On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com>=
 wrote:
>> > Hi Maciej,
>> >
>> > There is already --size and --extra-space options.
>> > Can we get the same or similar result by just using them? Do we really
>> > need new option for similar purpose?
>>
>> --reserved-size serves a different purpose, it establishes an upper
>> bound on the size of a partition during layout. Unlike
>> --size/--extra-space does not depend on the size of the filesystem
>> image.
>>
>> For instance, assume I'm creating an image for SD card/eMMC with a
>> fixed partition layout (something simple: boot partition, primary &
>> secondary rootfs partitions, some data partition). Because future
>> system updates are delivered as filesystem image, I want to make sure
>> that there is exactly xxx MBs for my current and future rootfs images
>> (regardless of current image size). Neither --size nor --extra-space
>> can do that. I could use, say `--size 200 --overhead-factor 1`, but
>> this will needlessly create a 200MB rootfs image and if I happen to
>> cross the 200MB boundary I will not get an error.
>>
>> I had a private patch that added --fixed-size to enforce --size, but
>> that would still end up creating filesystem image to fill the whole
>> space.
> I didn't get the difference between enforcing partition size and below
> implementation. Can you elaborate a bit?

`--fixed-size` was something that I had added to my fork back in 2014,
even before `--overhead-factor` came in. The problem is that depending
on a project you might want to have more control over how partitions
are laid out, or even need to have a fixed layout. Adding
`--fixed-size` would had a similar effect to what `--overhead-factor
1` does right now. Combined with `--size` would ensure that rootfs is
say, 200MB large. The downside was that wic would actually create a
200MB rootfs, something that is not really necessary. In fact, I only
wanted to have 200MB gap so that I have some spare space for future
updates (where update is just a rootfs image you dd to the partition).


>
>> Another workaround we used until now was to create a filesystem image
>> manually and use fsimage source plugin. To get a fixed layout with
>> rootfs image that may grow/shrink between builds, you still need to
>> fiddle with --align (for instance, set it to 215040 to have the
>> partition start at 210MB offset).
>>
>
> Thanks for the explanations. I'm almost convinced.
>
> See my comments below.
>
>> >
>> >
>> > On Mon, Oct 17, 2016 at 03:06:18PM +0200, Maciej Borzecki wrote:
>> >> Added new option --reserved-size to wks. The option can be used to
>> >> indicate how much space should be reserved for a partition. This is
>> >> useful if the disk will be a subject to full filesystem image updates
>> >> and puts an upper limit of the size of filesystem images.
>> >>
>> >> The actual filesystem image may be smaller than the reserved space, t=
hus
>> >> leaving some room for growth. If it is larger, an error will be raise=
d.
>> >>
>> >> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
>> >> ---
>> >>  scripts/lib/wic/help.py                | 11 ++++++++++
>> >>  scripts/lib/wic/imager/direct.py       |  3 ++-
>> >>  scripts/lib/wic/ksparser.py            |  1 +
>> >>  scripts/lib/wic/partition.py           |  1 +
>> >>  scripts/lib/wic/utils/partitionedfs.py | 37 ++++++++++++++++++++++++=
+---------
>> >>  5 files changed, 43 insertions(+), 10 deletions(-)
>> >>
>> >> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>> >> index e5347ec4b7c900c68fc64351a5293e75de0672b3..1a5c7020ba0cdc5ef2e47=
7a2b14360e09098a896 100644
>> >> --- a/scripts/lib/wic/help.py
>> >> +++ b/scripts/lib/wic/help.py
>> >> @@ -646,6 +646,17 @@ DESCRIPTION
>> >>                   not specified, the size is in MB.
>> >>                   You do not need this option if you use --source.
>> >>
>> >> +         --reserved-size: This option specifies that there should be
>> >> +                          at least that many bytes reserved for
> According to the code if partition size > reserved size wic will throw
> an error. This somehow conflicts with 'at least that many bytes' part of =
the
> description in my opinion.
>
> As far as I uderstood your code this parameter specifies hard upper
> limit for partition size, right?

Thanks, the wording is a bit off. I should rephrase it to 'that many
bytes' or just state that it's an upper limit.


>
>> >> +                          the partition during layout. This is usefu=
l
>> >> +                          when the target disk will be a subject
>> >> +                          to full system image updates in the future=
.
>> >> +                          Specifying --reserved-size ensures that
>> >> +                          there is extra space in the partition allo=
wing
>> >> +                          for future growth of the file system store=
d
>> >> +                          inside. Value format is the same as for
>> >> +                          --size option.
>> >> +
>> >>           --source: This option is a wic-specific option that names t=
he
>> >>                     source of the data that will populate the
>> >>                     partition.  The most common value for this option
>> >> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/image=
r/direct.py
>> >> index edf5e5d2214f8e78b6c2a98d7f6cd45fcc0065c4..02e293b9d744b760fcdf1=
7610505dafef3e164ad 100644
>> >> --- a/scripts/lib/wic/imager/direct.py
>> >> +++ b/scripts/lib/wic/imager/direct.py
>> >> @@ -301,7 +301,8 @@ class DirectImageCreator(BaseImageCreator):
>> >>                                         no_table=3Dpart.no_table,
>> >>                                         part_type=3Dpart.part_type,
>> >>                                         uuid=3Dpart.uuid,
>> >> -                                       system_id=3Dpart.system_id)
>> >> +                                       system_id=3Dpart.system_id,
>> >> +                                       reserved_size=3Dpart.reserved=
_size)
>> >>
>> >>          if fstab_path:
>> >>              shutil.move(fstab_path + ".orig", fstab_path)
>> >> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.p=
y
>> >> index 0894e2b199a299fbbed272f2e1c95e9d692e3ab1..4118bffdf4337f2d2d393=
d7e096632cd7aa37402 100644
>> >> --- a/scripts/lib/wic/ksparser.py
>> >> +++ b/scripts/lib/wic/ksparser.py
>> >> @@ -137,6 +137,7 @@ class KickStart():
>> >>          part.add_argument('--part-type')
>> >>          part.add_argument('--rootfs-dir')
>> >>          part.add_argument('--size', type=3Dsizetype, default=3D0)
>> >> +        part.add_argument('--reserved-size', type=3Dsizetype, defaul=
t=3D0)
>> >>          part.add_argument('--source')
>> >>          part.add_argument('--sourceparams')
>> >>          part.add_argument('--system-id', type=3Dsystemidtype)
>> >> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition=
.py
>> >> index 90f65a1e3976a5460cd1b265b238168cce22781f..162a3a289de891ccf8143=
7876c1f7a6f3c797b3b 100644
>> >> --- a/scripts/lib/wic/partition.py
>> >> +++ b/scripts/lib/wic/partition.py
>> >> @@ -54,6 +54,7 @@ class Partition():
>> >>          self.part_type =3D args.part_type
>> >>          self.rootfs_dir =3D args.rootfs_dir
>> >>          self.size =3D args.size
>> >> +        self.reserved_size =3D args.reserved_size
>> >>          self.source =3D args.source
>> >>          self.sourceparams =3D args.sourceparams
>> >>          self.system_id =3D args.system_id
>> >> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic=
/utils/partitionedfs.py
>> >> index cb03009fc7e3c97305079629ded7d2ff01eba4c4..5d3b1588231459dedf014=
2f807114736f0bb28ea 100644
>> >> --- a/scripts/lib/wic/utils/partitionedfs.py
>> >> +++ b/scripts/lib/wic/utils/partitionedfs.py
>> >> @@ -91,7 +91,7 @@ class Image():
>> >>
>> >>      def add_partition(self, size, disk_name, mountpoint, source_file=
=3DNone, fstype=3DNone,
>> >>                        label=3DNone, fsopts=3DNone, boot=3DFalse, ali=
gn=3DNone, no_table=3DFalse,
>> >> -                      part_type=3DNone, uuid=3DNone, system_id=3DNon=
e):
>> >> +                      part_type=3DNone, uuid=3DNone, system_id=3DNon=
e, reserved_size=3D0):
>> >>          """ Add the next partition. Prtitions have to be added in th=
e
>> >>          first-to-last order. """
>> >>
>> >> @@ -99,9 +99,11 @@ class Image():
>> >>
>> >>          # Converting kB to sectors for parted
>> >>          size =3D size * 1024 // self.sector_size
>> >> +        reserved_size =3D reserved_size * 1024 // self.sector_size
>> >>
>> >>          part =3D {'ks_pnum': ks_pnum, # Partition number in the KS f=
ile
>> >>                  'size': size, # In sectors
>> >> +                'reserved_size': reserved_size, # space on disk rese=
rved for partition
>> >>                  'mountpoint': mountpoint, # Mount relative to chroot
>> >>                  'source_file': source_file, # partition contents
>> >>                  'fstype': fstype, # Filesystem type
>> >> @@ -192,7 +194,19 @@ class Image():
>> >>                      disk['offset'] +=3D align_sectors
>> >>
>> >>              part['start'] =3D disk['offset']
>> >> -            disk['offset'] +=3D part['size']
>> >> +
>> >> +            if part['reserved_size']:
>> >> +                if part['size'] > part['reserved_size']:
>> >> +                    msger.error("Partition %d on disk %s is larger (=
%s bytes) than its"
>> >> +                                " reserved space %s bytes" %
>> >> +                                (disk['numpart'], part['disk_name'],
>> >> +                                 part['size'] * self.sector_size,
>> >> +                                 part['reserved_size'] * self.sector=
_size))
>> >> +                # next partition starts after the space reserved for=
 the
>> >> +                # current one
>> >> +                disk['offset'] +=3D part['reserved_size']
>> >> +            else:
>> >> +                disk['offset'] +=3D part['size']
>> >>
>> >>              part['type'] =3D 'primary'
>> >>              if not part['no_table']:
>> >> @@ -207,10 +221,11 @@ class Image():
>> >>
>> >>              disk['partitions'].append(num)
>> >>              msger.debug("Assigned %s to %s%d, sectors range %d-%d si=
ze %d "
>> >> -                        "sectors (%d bytes)." \
>> >> +                        "sectors (%d bytes), reserved %d bytes." \
>> >>                              % (part['mountpoint'], part['disk_name']=
, part['num'],
>> >> -                               part['start'], part['start'] + part['=
size'] - 1,
>> >> -                               part['size'], part['size'] * self.sec=
tor_size))
>> >> +                               part['start'], disk['offset'] - 1,
>> >> +                               part['size'], part['size'] * self.sec=
tor_size,
>> >> +                               part['reserved_size'] * self.sector_s=
ize))
> This will produce incorrect output about partition size as in reality par=
tition size will
> be set to part['reserved_size'].

I tried to avoid confusing the reader here. Partition size is one
thing and reservation is another. That is why reservation is logged
explicitly. Logging just the size would raise questions about why the
partition has grown.

Perhaps it makes sense to log reservation like this instead?

   part['reserved_size'] * self.sector_size if part['reserved_size']
else part['size'] * self.sector_size

>
> "reserved 0 bytes" message will be produced if --reserved-size option
> is not used. It's a bit confusing as 'reserved' is too generic word. Can
> we use 'reserved size' instead?

Yes, 'reserved size' sounds much better.

>
>> >>
>> >>          # Once all the partitions have been layed out, we can calcul=
ate the
>> >>          # minumim disk sizes.
>> >> @@ -288,17 +303,21 @@ class Image():
>> >>                  # Type for ext2/ext3/ext4/btrfs
>> >>                  parted_fs_type =3D "ext2"
>> >>
>> >> +            psize =3D part['size']
>> >> +            if part['reserved_size']:
>> >> +                psize =3D part['reserved_size']
>> >> +
> Here I'm getting confused. How this new parameters differs from --size if=
 it behaves
> the same way, i.e. partition size is set to its value.

That's intentional, Partition.prepare() is not be affected by the
reservation. I just want to reserve some space during layout, but not
necessarily enlarge the rootfs right now.

> The only
> difference I see is that if rootfs size is greater than reserved size
> wic will fail to create partition. Would it make sense to name it
> --max-size in this case?

Just wording, reservation seems more fitting, but I'm open to suggestions.

>
>> >>              # Boot ROM of OMAP boards require vfat boot partition to=
 have an
>> >>              # even number of sectors.
>> >>              if part['mountpoint'] =3D=3D "/boot" and part['fstype'] =
in ["vfat", "msdos"] \
>> >> -               and part['size'] % 2:
>> >> -                msger.debug("Substracting one sector from '%s' parti=
tion to " \
>> >> +               and psize % 2:
>> >> +                msger.debug("Subtracting one sector from '%s' partit=
ion to " \
>> >>                              "get even number of sectors for the part=
ition" % \
>> >>                              part['mountpoint'])
>> >> -                part['size'] -=3D 1
>> >> +                psize -=3D 1
>> >>
>> >>              self.__create_partition(disk['disk'].device, part['type'=
],
>> >> -                                    parted_fs_type, part['start'], p=
art['size'])
>> >> +                                    parted_fs_type, part['start'], p=
size)
>> >>
>> >>              if part['part_type']:
>> >>                  msger.debug("partition %d: set type UID to %s" % \
>
> Can you cover this functionality(and may be other size-related
> functionality too) with tests? You can add testcases to existing
> oe-selftest wic module.

I'll take a look at it.

--=20
Maciej Borzecki
RnDity

