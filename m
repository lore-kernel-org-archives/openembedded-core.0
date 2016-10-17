Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2E86AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:46:19 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id t193so117748147ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9bTzh+T8rVkfDzjC0M1nnzB9YH9JJOT1XeLjvMoNW+g=;
	b=PgDF4woohhZZSk8xk3zotMX9ZjF0zvjbG1iYIpW8T2QD1JaQqDmv/RtSr+TlHOR/tO
	vcF6uWjqpR4DmVUmcon/cA5Y0S+GinVeAewbbfpBQ6XVMTndFGRcBQStgTNQ4oKbjefj
	L8HWESP1pqbnSzrwfhmDDhwkC+IAqcGExReTnOHCyFWOH2hnyvH4VAfGlcTDzRxN5Flz
	b6SUbw7knruWsQxuqGhXaF0mLyQlqoIUDDOipedIft0w9jAZ7F5bLEnneW7l0MFYAM1O
	Q6h5+fsG2xSxXPJ5bazPbi/31ijHDo7H43rEPPXHpnisMY18uPrh6hkKL79HVTriN9xu
	xaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9bTzh+T8rVkfDzjC0M1nnzB9YH9JJOT1XeLjvMoNW+g=;
	b=MIEGp44o7jkwAqlb9QzzUzKYhivXA5B5lFnWeKc5xxmNVC/PvINBMVqXI+5f0HbHfg
	VUHW4EMH2BVxH9yypZixHgCfSuMVhWCEztW85BARxnd5SWO0i3BQQM6VRsk6uIpyLMV8
	aDic7fV0G/rdwiU+LOmdfnvCJ7gx09i0+642sIvlKDuA6NmeMumAUDAmkjkplQ1nsp4F
	qjiT/ujmraTIr0CHEbBAd/NoBWaFtcIdmtokUP0QEbWrvb5JVOchqaOjgHzVGBi0SjiW
	A8vr4/dsgNNfloqcuv5cutdZG7nk+lBC34jzMeT0Ve0pzsHxmw+XAy03MT9bmw8R4wqy
	g0hg==
X-Gm-Message-State: AA6/9Rk82QnbKOjj3VDz/jxAj/cCsru7K8qSJbyfiiJTlJ7yjy5IKtX88GMG2Mo5/BrVE6u+9ZeJ0MUURZ2yfg==
X-Received: by 10.28.158.203 with SMTP id h194mr8181796wme.59.1476715580987;
	Mon, 17 Oct 2016 07:46:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.164.89 with HTTP; Mon, 17 Oct 2016 07:46:00 -0700 (PDT)
In-Reply-To: <20161017132234.GA14510@linux.intel.com>
References: <30a5ef699fb1b575baf95b986a755f509e9e747e.1476706733.git.maciej.borzecki@rndity.com>
	<20161017132234.GA14510@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 17 Oct 2016 16:46:00 +0200
Message-ID: <CAD4b0_K2KcaZ_pwO0yfJPF8NNzgjm8cYFD-24E3k8_DdUaAO3A@mail.gmail.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 14:46:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 17, 2016 at 3:22 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Hi Maciej,
>
> There is already --size and --extra-space options.
> Can we get the same or similar result by just using them? Do we really
> need new option for similar purpose?

--reserved-size serves a different purpose, it establishes an upper
bound on the size of a partition during layout. Unlike
--size/--extra-space does not depend on the size of the filesystem
image.

For instance, assume I'm creating an image for SD card/eMMC with a
fixed partition layout (something simple: boot partition, primary &
secondary rootfs partitions, some data partition). Because future
system updates are delivered as filesystem image, I want to make sure
that there is exactly xxx MBs for my current and future rootfs images
(regardless of current image size). Neither --size nor --extra-space
can do that. I could use, say `--size 200 --overhead-factor 1`, but
this will needlessly create a 200MB rootfs image and if I happen to
cross the 200MB boundary I will not get an error.

I had a private patch that added --fixed-size to enforce --size, but
that would still end up creating filesystem image to fill the whole
space.
Another workaround we used until now was to create a filesystem image
manually and use fsimage source plugin. To get a fixed layout with
rootfs image that may grow/shrink between builds, you still need to
fiddle with --align (for instance, set it to 215040 to have the
partition start at 210MB offset).

>
>
> On Mon, Oct 17, 2016 at 03:06:18PM +0200, Maciej Borzecki wrote:
>> Added new option --reserved-size to wks. The option can be used to
>> indicate how much space should be reserved for a partition. This is
>> useful if the disk will be a subject to full filesystem image updates
>> and puts an upper limit of the size of filesystem images.
>>
>> The actual filesystem image may be smaller than the reserved space, thus
>> leaving some room for growth. If it is larger, an error will be raised.
>>
>> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
>> ---
>>  scripts/lib/wic/help.py                | 11 ++++++++++
>>  scripts/lib/wic/imager/direct.py       |  3 ++-
>>  scripts/lib/wic/ksparser.py            |  1 +
>>  scripts/lib/wic/partition.py           |  1 +
>>  scripts/lib/wic/utils/partitionedfs.py | 37 +++++++++++++++++++++++++---------
>>  5 files changed, 43 insertions(+), 10 deletions(-)
>>
>> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>> index e5347ec4b7c900c68fc64351a5293e75de0672b3..1a5c7020ba0cdc5ef2e477a2b14360e09098a896 100644
>> --- a/scripts/lib/wic/help.py
>> +++ b/scripts/lib/wic/help.py
>> @@ -646,6 +646,17 @@ DESCRIPTION
>>                   not specified, the size is in MB.
>>                   You do not need this option if you use --source.
>>
>> +         --reserved-size: This option specifies that there should be
>> +                          at least that many bytes reserved for
>> +                          the partition during layout. This is useful
>> +                          when the target disk will be a subject
>> +                          to full system image updates in the future.
>> +                          Specifying --reserved-size ensures that
>> +                          there is extra space in the partition allowing
>> +                          for future growth of the file system stored
>> +                          inside. Value format is the same as for
>> +                          --size option.
>> +
>>           --source: This option is a wic-specific option that names the
>>                     source of the data that will populate the
>>                     partition.  The most common value for this option
>> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
>> index edf5e5d2214f8e78b6c2a98d7f6cd45fcc0065c4..02e293b9d744b760fcdf17610505dafef3e164ad 100644
>> --- a/scripts/lib/wic/imager/direct.py
>> +++ b/scripts/lib/wic/imager/direct.py
>> @@ -301,7 +301,8 @@ class DirectImageCreator(BaseImageCreator):
>>                                         no_table=part.no_table,
>>                                         part_type=part.part_type,
>>                                         uuid=part.uuid,
>> -                                       system_id=part.system_id)
>> +                                       system_id=part.system_id,
>> +                                       reserved_size=part.reserved_size)
>>
>>          if fstab_path:
>>              shutil.move(fstab_path + ".orig", fstab_path)
>> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
>> index 0894e2b199a299fbbed272f2e1c95e9d692e3ab1..4118bffdf4337f2d2d393d7e096632cd7aa37402 100644
>> --- a/scripts/lib/wic/ksparser.py
>> +++ b/scripts/lib/wic/ksparser.py
>> @@ -137,6 +137,7 @@ class KickStart():
>>          part.add_argument('--part-type')
>>          part.add_argument('--rootfs-dir')
>>          part.add_argument('--size', type=sizetype, default=0)
>> +        part.add_argument('--reserved-size', type=sizetype, default=0)
>>          part.add_argument('--source')
>>          part.add_argument('--sourceparams')
>>          part.add_argument('--system-id', type=systemidtype)
>> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
>> index 90f65a1e3976a5460cd1b265b238168cce22781f..162a3a289de891ccf81437876c1f7a6f3c797b3b 100644
>> --- a/scripts/lib/wic/partition.py
>> +++ b/scripts/lib/wic/partition.py
>> @@ -54,6 +54,7 @@ class Partition():
>>          self.part_type = args.part_type
>>          self.rootfs_dir = args.rootfs_dir
>>          self.size = args.size
>> +        self.reserved_size = args.reserved_size
>>          self.source = args.source
>>          self.sourceparams = args.sourceparams
>>          self.system_id = args.system_id
>> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
>> index cb03009fc7e3c97305079629ded7d2ff01eba4c4..5d3b1588231459dedf0142f807114736f0bb28ea 100644
>> --- a/scripts/lib/wic/utils/partitionedfs.py
>> +++ b/scripts/lib/wic/utils/partitionedfs.py
>> @@ -91,7 +91,7 @@ class Image():
>>
>>      def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
>>                        label=None, fsopts=None, boot=False, align=None, no_table=False,
>> -                      part_type=None, uuid=None, system_id=None):
>> +                      part_type=None, uuid=None, system_id=None, reserved_size=0):
>>          """ Add the next partition. Prtitions have to be added in the
>>          first-to-last order. """
>>
>> @@ -99,9 +99,11 @@ class Image():
>>
>>          # Converting kB to sectors for parted
>>          size = size * 1024 // self.sector_size
>> +        reserved_size = reserved_size * 1024 // self.sector_size
>>
>>          part = {'ks_pnum': ks_pnum, # Partition number in the KS file
>>                  'size': size, # In sectors
>> +                'reserved_size': reserved_size, # space on disk reserved for partition
>>                  'mountpoint': mountpoint, # Mount relative to chroot
>>                  'source_file': source_file, # partition contents
>>                  'fstype': fstype, # Filesystem type
>> @@ -192,7 +194,19 @@ class Image():
>>                      disk['offset'] += align_sectors
>>
>>              part['start'] = disk['offset']
>> -            disk['offset'] += part['size']
>> +
>> +            if part['reserved_size']:
>> +                if part['size'] > part['reserved_size']:
>> +                    msger.error("Partition %d on disk %s is larger (%s bytes) than its"
>> +                                " reserved space %s bytes" %
>> +                                (disk['numpart'], part['disk_name'],
>> +                                 part['size'] * self.sector_size,
>> +                                 part['reserved_size'] * self.sector_size))
>> +                # next partition starts after the space reserved for the
>> +                # current one
>> +                disk['offset'] += part['reserved_size']
>> +            else:
>> +                disk['offset'] += part['size']
>>
>>              part['type'] = 'primary'
>>              if not part['no_table']:
>> @@ -207,10 +221,11 @@ class Image():
>>
>>              disk['partitions'].append(num)
>>              msger.debug("Assigned %s to %s%d, sectors range %d-%d size %d "
>> -                        "sectors (%d bytes)." \
>> +                        "sectors (%d bytes), reserved %d bytes." \
>>                              % (part['mountpoint'], part['disk_name'], part['num'],
>> -                               part['start'], part['start'] + part['size'] - 1,
>> -                               part['size'], part['size'] * self.sector_size))
>> +                               part['start'], disk['offset'] - 1,
>> +                               part['size'], part['size'] * self.sector_size,
>> +                               part['reserved_size'] * self.sector_size))
>>
>>          # Once all the partitions have been layed out, we can calculate the
>>          # minumim disk sizes.
>> @@ -288,17 +303,21 @@ class Image():
>>                  # Type for ext2/ext3/ext4/btrfs
>>                  parted_fs_type = "ext2"
>>
>> +            psize = part['size']
>> +            if part['reserved_size']:
>> +                psize = part['reserved_size']
>> +
>>              # Boot ROM of OMAP boards require vfat boot partition to have an
>>              # even number of sectors.
>>              if part['mountpoint'] == "/boot" and part['fstype'] in ["vfat", "msdos"] \
>> -               and part['size'] % 2:
>> -                msger.debug("Substracting one sector from '%s' partition to " \
>> +               and psize % 2:
>> +                msger.debug("Subtracting one sector from '%s' partition to " \
>>                              "get even number of sectors for the partition" % \
>>                              part['mountpoint'])
>> -                part['size'] -= 1
>> +                psize -= 1
>>
>>              self.__create_partition(disk['disk'].device, part['type'],
>> -                                    parted_fs_type, part['start'], part['size'])
>> +                                    parted_fs_type, part['start'], psize)
>>
>>              if part['part_type']:
>>                  msger.debug("partition %d: set type UID to %s" % \
>> --
>> 2.5.0
>>
>
> --
> Regards,
> Ed



-- 
Maciej Borzecki
RnDity

