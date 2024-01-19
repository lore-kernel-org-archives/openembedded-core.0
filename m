Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1526BC47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 11:54:17 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.20297.1705665253558933908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 03:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=raARakZ5;
 spf=pass (domain: smile.fr, ip: 209.85.218.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a2a17f3217aso67990966b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 03:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705665251; x=1706270051; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GEOcDYDtV0VBCoTiFhrAtLSArvSWYAvBt0O2Iw88wR0=;
        b=raARakZ58CBVFvA8U4/vciwtI3LWyQWj/edxvPxEPViAtw+ZaXmn6wSIQmZqnfOAD4
         p8TxWknjTVwqN+229wdt9QdTGCqlJQz71GbKBbOpwmLOgx4Y9Lxik8L494bz+19CGEnI
         obcQbY6U5i8yvL3iX6TwTdEBYUhaNaV1x6qwGrNAFcTQ51xNo7fME4YvBD+FOmxBznna
         E0e8RD+AUtcIccL4G8YrSsjdm9E5ej2DCJ4KtjvfWmUGRJWF4A450+zmVo53Lmv5wJ4B
         Lp/lDPsd8HZavfooas3vMjSMbme2utDLYmYn48NcUWEBV1RezwDufzP9Cokrz16oTKf+
         Zm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705665251; x=1706270051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEOcDYDtV0VBCoTiFhrAtLSArvSWYAvBt0O2Iw88wR0=;
        b=wLiHv2hRegHx5SzfbIAkOflrEFXS/fQPC4vLsZWAITq+R4bAUAItbm3qwv5lXosOYD
         Z46m2R9l1K23/GHJmCs68xIT5A0HU6UKWy0mf5HSAOEaZvmS2y0PvHlK9UyjLYyIo4jm
         OZ8XTLx5c8jYiqL/VlyXbaiotbKkgtPCcROZVfiODDeE6pdLlzRaiGzWxgJAlLk9rvVW
         iMx7Gz1OdfZfIyueFZDjHcpAxHjauB+BWBNPg80W6kboUvn71TbPd4v7JcGLJdiiDJJK
         vzsTaKur52fJhauHl5Hu+ldcRrdzioD82FwwwBdYhc57w5uMrIQDMa/yGy3v0rz7kgeP
         Up8g==
X-Gm-Message-State: AOJu0YxZP5HPHMOXicTsPmbuGSjNj8SvoLr+K07T7+l25OaGalU6hVJF
	XgSTn1LOENl6QgUNj6D/X2cTBgmrTR2OKFjOSC0cQr0lxQ5K9O2eMLplQZJu64TdMKqGi2mDA33
	DoqSxaDTRP/DOiGtETBhgh0RoXLhkcIK8yBiY5g==
X-Google-Smtp-Source: AGHT+IEdwrurMZhU/HBJaTa/BS3iHMBfDbQfHD4AJKyj6nxO5RCKVVgq8dBRNmcYev2p85+srjv6+pIzp0F5OkfLvZc=
X-Received: by 2002:a17:906:6c2:b0:a26:9ec0:e35 with SMTP id
 v2-20020a17090606c200b00a269ec00e35mr1451305ejb.135.1705665251463; Fri, 19
 Jan 2024 03:54:11 -0800 (PST)
MIME-Version: 1.0
References: <PFKW.1705652626289844798.6eW0@lists.openembedded.org>
In-Reply-To: <PFKW.1705652626289844798.6eW0@lists.openembedded.org>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Fri, 19 Jan 2024 12:53:45 +0100
Message-ID: <CAMSfU+6dtipjtNS83T4667RFPNwFaek4fWZWAR0UQRdL4VJMuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [WIC] Configurable addressing of GTP main table
To: davide.cardillo@seco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006b6e5d060f4b23ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 11:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194034

--0000000000006b6e5d060f4b23ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 janv. 2024 =C3=A0 12:40, davide.cardillo via lists.openembedded.=
org
<davide.cardillo=3Dseco.com@lists.openembedded.org> a =C3=A9crit :

> Issue:
> the usage of a gpt table with i.MX processor is not compatible by default=
.
> This is due to a memory conflict: the main partition table is placed into
> the same memory space used to flash the header of the U-Boot. This last
> can not be moved since the ROM code of the i.MX6 starts to read to that
> fixed address (0x400).
> This problem can be solved using a feature of the GTP partition table for
> witch the main table can be moved to a desired memory area.
> The WIC library present in poky manages the GTP table through some
> standard Linux commands (gdisk and sgdisk) which ones have already the
> opportunity to perform this task.
> This patch introduces this feature with the addition of some wic's
> options,
> used also in wks file.
>
> New partition placement behavior:
> Since now all partitions are placed after the gpt table presents into the
> first 1KB of memory (including both the gpt header at the first byte of
> memory and the main partition table staring at 0x400).
> Now the main gpt table can be placed in other address spaces and a
> partition
> can be placed also before the gpt table. Recap:
> - by default, all partitions are placed sequentially, one after the other=
.
> The first partition implicitly starts after the GPT partition table.
> - adding a flag to the item of a partition into the wks file, the
> partition
> can be placed, starting from a fixed memory offset (neglecting the memory
> space occupied by the GTP table).
> Combining the moving of the main partition table and the absolute (not ye=
t
> relative) positioning of a partition, now it is possible to place one or
> more
>    partitions before the GPT table.
>
> New flags:
> - main-ptable-offset (size in KB): to add as property of the bootloader
> item.
> Specifies the main partition table location in KB.
> - fixed-align (boolean): to add as property of a partition. Specifies tha=
t
> the
> partition must to placed with absolute offset, used in conjunction with
> --align
> property
>
> Example:
> setting used for a wic for an i.MX6 processor, where the main partition
> table is
> placed with the absolute offset of 4MB
>
> bootloader --ptable gpt --main-ptable-offset 4096K
> part / --source rawcopy --sourceparams=3D"file=3Du-boot.imx" --ondisk mmc=
blk
> --align 1 --size 1M --no-table --fixed-align
>
> Test environment:
> This patch is a part of Edgehog OS (https://git.seco.com/edgehog) a
> custom Yocto distribution by SECO SpA (www.seco.com), used on multiple
> architectures (both ARM and x86).
> This solution is widely used by all SECO customers who use hardware
> solution based on NXP i.MX6 processors.
>
> Signed-off-by: Davide Cardillo <davide.cardillo@seco.com>
> Reviewed-by: Tobias Poganiuch <tobias.poganiuch@seco.com>
> Tested-by: Andrea Da Col <andrea.dacol@seco.com>
> Tested-by: Daniel Rinaldi <daniel.rinaldi@seco.com>
> ---
> scripts/lib/wic/ksparser.py              |   2 +
> scripts/lib/wic/partition.py             |   1 +
> scripts/lib/wic/plugins/imager/direct.py | 102 +++++++++++++++++++++--
> scripts/wic                              |   2 +-
> 4 files changed, 98 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 0df9eb0d05..45db2eaa5d 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -148,6 +148,7 @@ class KickStart():
>         part =3D subparsers.add_parser('part')
>         part.add_argument('mountpoint', nargs=3D'?')
>         part.add_argument('--active', action=3D'store_true')
> +        part.add_argument('--fixed-align', action=3D'store_true')
>         part.add_argument('--align', type=3Dint)
>         part.add_argument('--offset', type=3Dsizetype("K", True))
>         part.add_argument('--exclude-path', nargs=3D'+')
> @@ -194,6 +195,7 @@ class KickStart():
>                                 default=3D'msdos')
>         bootloader.add_argument('--timeout', type=3Dint)
>         bootloader.add_argument('--source')
> +        bootloader.add_argument('--main-ptable-offset',
> type=3Dsizetype("K"), default=3D0)
>
>         include =3D subparsers.add_parser('include')
>         include.add_argument('path', type=3Dcannedpathtype)
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 5275da6ed3..1bd2b457cd 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -26,6 +26,7 @@ class Partition():
>         self.args =3D args
>         self.active =3D args.active
>         self.align =3D args.align
> +        self.fixed_align =3D args.fixed_align
>         self.disk =3D args.disk
>         self.device =3D None
>         self.extra_space =3D args.extra_space
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> index 165fc2979f..efa4d7804e 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -16,6 +16,7 @@ import random
> import shutil
> import tempfile
> import uuid
> +import operator
>

Same problem as before :(

Looking at the headers of your mail, it looks like you are using
https://lists.openembedded.org/g/openembedded-core to copy/paste your
patch. That won't work.

Try to follow the steps documented in :
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#usi=
ng-git-to-send-patches

Regards,


>
> from time import strftime
>
> @@ -66,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
>         self.workdir =3D self.setup_workdir(options.workdir)
>         self._image =3D None
>         self.ptable_format =3D self.ks.bootloader.ptable
> +        self.main_ptable_offset =3D self.ks.bootloader.main_ptable_offse=
t
>         self.parts =3D self.ks.partitions
>
>         # as a convenience, set source to the boot partition source
> @@ -77,6 +79,7 @@ class DirectPlugin(ImagerPlugin):
>
>         image_path =3D self._full_path(self.workdir, self.parts[0].disk,
> "direct")
>         self._image =3D PartitionedImage(image_path, self.ptable_format,
> +                                       self.main_ptable_offset,
>                                        self.parts, self.native_sysroot,
>                                        options.extra_space)
>
> @@ -294,15 +297,27 @@ GPT_OVERHEAD =3D 34
> # Size of a sector in bytes
> SECTOR_SIZE =3D 512
>
> +class memoryRegion():
> +    def __init__(self):
> +        self.start_sector =3D 1
> +        self.end_sector =3D 1
> +        self.part_num =3D 0
> +
> +    def __init__(self, part_num, start_sec, end_sec):
> +        self.part_num =3D part_num
> +        self.start_sector =3D start_sec
> +        self.end_sector =3D end_sec
> +
> class PartitionedImage():
>     """
>     Partitioned image in a file.
>     """
>
> -    def __init__(self, path, ptable_format, partitions,
> native_sysroot=3DNone, extra_space=3D0):
> +    def __init__(self, path, ptable_format, main_ptable_offset,
> partitions, native_sysroot=3DNone, extra_space=3D0):
>         self.path =3D path  # Path to the image file
>         self.numpart =3D 0  # Number of allocated partitions
>         self.realpart =3D 0 # Number of partitions in the partition table
> +        self.fixedalign_part =3D 0 # Number of partitions with absolute
> alignment
>         self.primary_part_num =3D 0  # Number of primary partitions (msdo=
s)
>         self.extendedpart =3D 0      # Create extended partition before t=
his
> logical partition (msdos)
>         self.extended_size_sec =3D 0 # Size of exteded partition (msdos)
> @@ -311,11 +326,13 @@ class PartitionedImage():
>         self.min_size =3D 0 # Minimum required disk size to fit
>                           # all partitions (in bytes)
>         self.ptable_format =3D ptable_format  # Partition table format
> +        self.main_ptable_offset =3D main_ptable_offset # for GPT table,
> offset
>         # Disk system identifier
>         self.identifier =3D random.SystemRandom().randint(1, 0xffffffff)
>
>         self.partitions =3D partitions
>         self.partimages =3D []
> +        self.used_memory_region =3D []
>         # Size of a sector used in calculations
>         self.sector_size =3D SECTOR_SIZE
>         self.native_sysroot =3D native_sysroot
> @@ -368,6 +385,30 @@ class PartitionedImage():
>             # Converting kB to sectors for parted
>             part.size_sec =3D part.disk_size * 1024 // self.sector_size
>
> +    def _add_busy_region(self, part_num, start_sec, end_sec):
> +        self.used_memory_region.append(memoryRegion(part_num, start_sec,
> end_sec))
> +        self.used_memory_region =3D sorted(self.used_memory_region,
> key=3Doperator.attrgetter('start_sector'))
> +
> +    def _print_busy_region_list(self):
> +        list =3D "Busy memory region (in sector)\n"
> +        list +=3D "\tpart#\tstart\tEnd\n"
> +        for num in range(len(self.used_memory_region)):
> +            list +=3D"\t%s\t%s\t%s\n" %
> (self.used_memory_region[num].part_num, \
> +                self.used_memory_region[num].start_sector,
> self.used_memory_region[num].end_sector)
> +        logger.debug(list)
> +
> +    def _check_memory_region(self, start_sec, end_sec ):
> +        """ Check if the specified region is already flagges as used.
> Returns
> +        zero if not used, 1 otherwise"""
> +        for num in range(len(self.used_memory_region)):
> +            region =3D self.used_memory_region[num]
> +            if ( ( region.start_sector < start_sec and start_sec <
> region.end_sector) or \
> +                    ( region.start_sector < end_sec and end_sec <
> region.end_sector) ):
> +                return 1
> +            if ( start_sec < region.start_sector and end_sec >
> region.end_sector ):
> +                return 1
> +        return 0
> +
>     def layout_partitions(self):
>         """ Layout the partitions, meaning calculate the position of ever=
y
>         partition on the disk. The 'ptable_format' parameter defines the
> @@ -379,6 +420,35 @@ class PartitionedImage():
>         # partitions not listed in the table are not included.
>         num_real_partitions =3D len([p for p in self.partitions if not
> p.no_table])
>
> +        # The partitions flagged as fixed alignment partition are placed
> into image
> +        # before the others. Instead, relative-aligned partitions are
> placed in a
> +        # serialized fashion, with control of the intersection of memory
> areas.
> +        # The base address of the relative-aligned partitions is, as
> before,
> +        # the maximum address accupied by the partition table
> +
> +        # Flag as used the momoery required for partition table
> +        self._add_busy_region(-1, 0, MBR_OVERHEAD)
> +        if self.ptable_format =3D=3D "gpt":
> +            offset =3D self.main_ptable_offset * 1024 // self.sector_siz=
e
> +            self._add_busy_region(-1, offset, offset + GPT_OVERHEAD)
> +
> +        # Search all partition with fixed position into the image
> +        for num in range(len(self.partitions)):
> +            part =3D self.partitions[num]
> +            if not part.fixed_align:
> +                continue
> +            if not part.no_table:
> +                raise WicError("A partition with fixed alignment must
> have no_table flag set")
> +
> +            start_sector =3D (part.align * 1024 // self.sector_size)
> +            end_sector =3D start_sector + part.size_sec - 1
> +            if self._check_memory_region(start_sector, end_sector) =3D=
=3D 1:
> +                self._print_busy_region_list()
> +                raise WicError("A partition wants to use an already used
> memory region (sectors %d - %d)" \
> +                        % (start_sector, end_sector))
> +            self._add_busy_region(num, start_sector, end_sector)
> +            part.start =3D start_sector
> +
>         # Go through partitions in the order they are added in .ks file
>         for num in range(len(self.partitions)):
>             part =3D self.partitions[num]
> @@ -403,7 +473,7 @@ class PartitionedImage():
>                 if self.ptable_format =3D=3D "msdos":
>                     overhead =3D MBR_OVERHEAD
>                 elif self.ptable_format =3D=3D "gpt":
> -                    overhead =3D GPT_OVERHEAD
> +                    overhead =3D (self.main_ptable_offset * 1024 //
> self.sector_size) + GPT_OVERHEAD
>
>                 # Skip one sector required for the partitioning scheme
> overhead
>                 self.offset +=3D overhead
> @@ -418,7 +488,7 @@ class PartitionedImage():
>                     self.offset +=3D 2
>
>             align_sectors =3D 0
> -            if part.align:
> +            if not part.fixed_align and part.align:
>                 # If not first partition and we do have alignment set we
> need
>                 # to align the partition.
>                 # FIXME: This leaves a empty spaces to the disk. To fill
> the
> @@ -440,7 +510,7 @@ class PartitionedImage():
>                     # increase the offset so we actually start the
> partition on right alignment
>                     self.offset +=3D align_sectors
>
> -            if part.offset is not None:
> +            if not part.fixed_align and part.offset is not None:
>                 offset =3D part.offset // self.sector_size
>
>                 if offset * self.sector_size !=3D part.offset:
> @@ -455,14 +525,20 @@ class PartitionedImage():
>
>                 self.offset =3D offset
>
> -            part.start =3D self.offset
> -            self.offset +=3D part.size_sec
> -
>             if not part.no_table:
>                 part.num =3D self.realpart
>             else:
>                 part.num =3D 0
>
> +            if not part.fixed_align:
> +                part.start =3D self.offset
> +                self.offset +=3D part.size_sec
> +                if self._check_memory_region(part.start, self.offset) =
=3D=3D
> 1:
> +                    self._print_busy_region_list()
> +                    raise WicError("A partition wants to use an already
> used memory region (sectors %d - %d)" \
> +                        % (part.start, self.offset))
> +                self._add_busy_region(part.num, part.start, self.offset)
> +
>             if self.ptable_format =3D=3D "msdos" and not part.no_table:
>                 if part.type =3D=3D 'logical':
>                     self.logical_part_cnt +=3D 1
> @@ -482,12 +558,14 @@ class PartitionedImage():
>                          "sectors (%d bytes).", part.mountpoint,
> part.disk,
>                          part.num, part.start, self.offset - 1,
> part.size_sec,
>                          part.size_sec * self.sector_size)
> +
> +        self._print_busy_region_list()
>
>         # Once all the partitions have been layed out, we can calculate
> the
>         # minumim disk size
>         self.min_size =3D self.offset
>         if self.ptable_format =3D=3D "gpt":
> -            self.min_size +=3D GPT_OVERHEAD
> +            self.min_size +=3D (self.main_ptable_offset * 1024 //
> self.sector_size) + GPT_OVERHEAD
>
>         self.min_size *=3D self.sector_size
>         self.min_size +=3D self.extra_space
> @@ -606,6 +684,14 @@ class PartitionedImage():
>                 exec_native_cmd("sfdisk --part-type %s %s %s" % \
>                                 (self.path, part.num, part.system_id),
>                                 self.native_sysroot)
> +
> +        if self.ptable_format =3D=3D "gpt" and self.main_ptable_offset >=
 0:
> +            main_ptable_sectors =3D self.main_ptable_offset * 1024 //
> self.sector_size
> +            logger.debug("Move the main GPT partition table forward by %=
s
> sector(s)", main_ptable_sectors)
> +            cmd =3D "sgdisk -j %d %s" % (main_ptable_sectors, self.path)
> +            #cmd =3D "(echo -e 'x'; echo -e 'j' ; echo -e '%d'; echo -e
> 'w'; echo -e 'Y') | gdisk %s" % (main_ptable_sectors, self.path)
> +            exec_native_cmd(cmd, self.native_sysroot)
> +
>
>     def cleanup(self):
>         pass
> diff --git a/scripts/wic b/scripts/wic
> index 06e0b48db0..0c59a550ef 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -59,7 +59,7 @@ from wic import help as hlp
>
>
> def wic_logger():
> -    """Create and convfigure wic logger."""
> +    """Create and configure wic logger."""
>     logger =3D logging.getLogger('wic')
>     logger.setLevel(logging.INFO)
>
> --
> 2.39.2
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194032):
> https://lists.openembedded.org/g/openembedded-core/message/194032
> Mute This Topic: https://lists.openembedded.org/mt/103828012/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
> --
Yoann Congal
Smile ECS - Tech expert

--0000000000006b6e5d060f4b23ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5MZcKgdmVuLiAxOSBqYW52LiAyMDI0IMOgwqAxMjo0MCwgZGF2
aWRlLmNhcmRpbGxvIHZpYSA8YSBocmVmPSJodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZyI+
bGlzdHMub3BlbmVtYmVkZGVkLm9yZzwvYT4gJmx0O2RhdmlkZS5jYXJkaWxsbz08YSBocmVmPSJt
YWlsdG86c2Vjby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZyI+c2Vjby5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZzwvYT4mZ3Q7IGEgw6ljcml0wqA6PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxf
cXVvdGUiPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHgg
MHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRk
aW5nLWxlZnQ6MWV4Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlIj5Jc3N1ZTog
PGJyPnRoZSB1c2FnZSBvZiBhIGdwdCB0YWJsZSB3aXRoIGkuTVggcHJvY2Vzc29yIGlzIG5vdCBj
b21wYXRpYmxlIGJ5IGRlZmF1bHQuIDxicj5UaGlzIGlzIGR1ZSB0byBhIG1lbW9yeSBjb25mbGlj
dDogdGhlIG1haW4gcGFydGl0aW9uIHRhYmxlIGlzIHBsYWNlZCBpbnRvIDxicj50aGUgc2FtZSBt
ZW1vcnkgc3BhY2UgdXNlZCB0byBmbGFzaCB0aGUgaGVhZGVyIG9mIHRoZSBVLUJvb3QuIFRoaXMg
bGFzdCA8YnI+Y2FuIG5vdCBiZSBtb3ZlZCBzaW5jZSB0aGUgUk9NIGNvZGUgb2YgdGhlIGkuTVg2
IHN0YXJ0cyB0byByZWFkIHRvIHRoYXQgPGJyPmZpeGVkIGFkZHJlc3MgKDB4NDAwKS4gPGJyPlRo
aXMgcHJvYmxlbSBjYW4gYmUgc29sdmVkIHVzaW5nIGEgZmVhdHVyZSBvZiB0aGUgR1RQIHBhcnRp
dGlvbiB0YWJsZSBmb3IgPGJyPndpdGNoIHRoZSBtYWluIHRhYmxlIGNhbiBiZSBtb3ZlZCB0byBh
IGRlc2lyZWQgbWVtb3J5IGFyZWEuIDxicj5UaGUgV0lDIGxpYnJhcnkgcHJlc2VudCBpbiBwb2t5
IG1hbmFnZXMgdGhlIEdUUCB0YWJsZSB0aHJvdWdoIHNvbWUgPGJyPnN0YW5kYXJkIExpbnV4IGNv
bW1hbmRzIChnZGlzayBhbmQgc2dkaXNrKSB3aGljaCBvbmVzIGhhdmUgYWxyZWFkeSB0aGUgPGJy
Pm9wcG9ydHVuaXR5IHRvIHBlcmZvcm0gdGhpcyB0YXNrLiA8YnI+VGhpcyBwYXRjaCBpbnRyb2R1
Y2VzIHRoaXMgZmVhdHVyZSB3aXRoIHRoZSBhZGRpdGlvbiBvZiBzb21lIHdpYyYjMzk7cyBvcHRp
b25zLCA8YnI+dXNlZCBhbHNvIGluIHdrcyBmaWxlLiA8YnI+PGJyPk5ldyBwYXJ0aXRpb24gcGxh
Y2VtZW50IGJlaGF2aW9yOiA8YnI+U2luY2Ugbm93IGFsbCBwYXJ0aXRpb25zIGFyZSBwbGFjZWQg
YWZ0ZXIgdGhlIGdwdCB0YWJsZSBwcmVzZW50cyBpbnRvIHRoZSA8YnI+Zmlyc3QgMUtCIG9mIG1l
bW9yeSAoaW5jbHVkaW5nIGJvdGggdGhlIGdwdCBoZWFkZXIgYXQgdGhlIGZpcnN0IGJ5dGUgb2Yg
PGJyPm1lbW9yeSBhbmQgdGhlIG1haW4gcGFydGl0aW9uIHRhYmxlIHN0YXJpbmcgYXQgMHg0MDAp
LiA8YnI+Tm93IHRoZSBtYWluIGdwdCB0YWJsZSBjYW4gYmUgcGxhY2VkIGluIG90aGVyIGFkZHJl
c3Mgc3BhY2VzIGFuZCBhIHBhcnRpdGlvbiA8YnI+Y2FuIGJlIHBsYWNlZCBhbHNvIGJlZm9yZSB0
aGUgZ3B0IHRhYmxlLiBSZWNhcDogPGJyPi0gYnkgZGVmYXVsdCwgYWxsIHBhcnRpdGlvbnMgYXJl
IHBsYWNlZCBzZXF1ZW50aWFsbHksIG9uZSBhZnRlciB0aGUgb3RoZXIuIDxicj5UaGUgZmlyc3Qg
cGFydGl0aW9uIGltcGxpY2l0bHkgc3RhcnRzIGFmdGVyIHRoZSBHUFQgcGFydGl0aW9uIHRhYmxl
LiA8YnI+LSBhZGRpbmcgYSBmbGFnIHRvIHRoZSBpdGVtIG9mIGEgcGFydGl0aW9uIGludG8gdGhl
IHdrcyBmaWxlLCB0aGUgcGFydGl0aW9uIDxicj5jYW4gYmUgcGxhY2VkLCBzdGFydGluZyBmcm9t
IGEgZml4ZWQgbWVtb3J5IG9mZnNldCAobmVnbGVjdGluZyB0aGUgbWVtb3J5IDxicj5zcGFjZSBv
Y2N1cGllZCBieSB0aGUgR1RQIHRhYmxlKS4gPGJyPkNvbWJpbmluZyB0aGUgbW92aW5nIG9mIHRo
ZSBtYWluIHBhcnRpdGlvbiB0YWJsZSBhbmQgdGhlIGFic29sdXRlIChub3QgeWV0IDxicj5yZWxh
dGl2ZSkgcG9zaXRpb25pbmcgb2YgYSBwYXJ0aXRpb24sIG5vdyBpdCBpcyBwb3NzaWJsZSB0byBw
bGFjZSBvbmUgb3IgbW9yZSA8YnI+wqDCoMKgcGFydGl0aW9ucyBiZWZvcmUgdGhlIEdQVCB0YWJs
ZS4gPGJyPjxicj5OZXcgZmxhZ3M6IDxicj4tIG1haW4tcHRhYmxlLW9mZnNldCAoc2l6ZSBpbiBL
Qik6IHRvIGFkZCBhcyBwcm9wZXJ0eSBvZiB0aGUgYm9vdGxvYWRlciBpdGVtLiA8YnI+U3BlY2lm
aWVzIHRoZSBtYWluIHBhcnRpdGlvbiB0YWJsZSBsb2NhdGlvbiBpbiBLQi4gPGJyPi0gZml4ZWQt
YWxpZ24gKGJvb2xlYW4pOiB0byBhZGQgYXMgcHJvcGVydHkgb2YgYSBwYXJ0aXRpb24uIFNwZWNp
ZmllcyB0aGF0IHRoZSA8YnI+cGFydGl0aW9uIG11c3QgdG8gcGxhY2VkIHdpdGggYWJzb2x1dGUg
b2Zmc2V0LCB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGggLS1hbGlnbiA8YnI+cHJvcGVydHkgPGJy
Pjxicj5FeGFtcGxlOiA8YnI+c2V0dGluZyB1c2VkIGZvciBhIHdpYyBmb3IgYW4gaS5NWDYgcHJv
Y2Vzc29yLCB3aGVyZSB0aGUgbWFpbiBwYXJ0aXRpb24gdGFibGUgaXMgPGJyPnBsYWNlZCB3aXRo
IHRoZSBhYnNvbHV0ZSBvZmZzZXQgb2YgNE1CIDxicj48YnI+Ym9vdGxvYWRlciAtLXB0YWJsZSBn
cHQgLS1tYWluLXB0YWJsZS1vZmZzZXQgNDA5NksgPGJyPnBhcnQgLyAtLXNvdXJjZSByYXdjb3B5
IC0tc291cmNlcGFyYW1zPSZxdW90O2ZpbGU9dS1ib290LmlteCZxdW90OyAtLW9uZGlzayBtbWNi
bGsgLS1hbGlnbiAxIC0tc2l6ZSAxTSAtLW5vLXRhYmxlIC0tZml4ZWQtYWxpZ24gPGJyPjxicj5U
ZXN0IGVudmlyb25tZW50OiA8YnI+VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgRWRnZWhvZyBPUyAo
PGEgaHJlZj0iaHR0cHM6Ly9naXQuc2Vjby5jb20vZWRnZWhvZyIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vZ2l0LnNlY28uY29tL2VkZ2Vob2c8L2E+KSBhIDxicj5jdXN0b20gWW9jdG8gZGlzdHJp
YnV0aW9uIGJ5IFNFQ08gU3BBICg8YSBocmVmPSJodHRwOi8vd3d3LnNlY28uY29tIiB0YXJnZXQ9
Il9ibGFuayI+d3d3LnNlY28uY29tPC9hPiksIHVzZWQgb24gbXVsdGlwbGUgPGJyPmFyY2hpdGVj
dHVyZXMgKGJvdGggQVJNIGFuZCB4ODYpLiA8YnI+VGhpcyBzb2x1dGlvbiBpcyB3aWRlbHkgdXNl
ZCBieSBhbGwgU0VDTyBjdXN0b21lcnMgd2hvIHVzZSBoYXJkd2FyZSA8YnI+c29sdXRpb24gYmFz
ZWQgb24gTlhQIGkuTVg2IHByb2Nlc3NvcnMuIDxicj48YnI+U2lnbmVkLW9mZi1ieTogRGF2aWRl
IENhcmRpbGxvICZsdDs8YSBocmVmPSJtYWlsdG86ZGF2aWRlLmNhcmRpbGxvQHNlY28uY29tIiB0
YXJnZXQ9Il9ibGFuayI+ZGF2aWRlLmNhcmRpbGxvQHNlY28uY29tPC9hPiZndDsgPGJyPlJldmll
d2VkLWJ5OiBUb2JpYXMgUG9nYW5pdWNoICZsdDs8YSBocmVmPSJtYWlsdG86dG9iaWFzLnBvZ2Fu
aXVjaEBzZWNvLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnRvYmlhcy5wb2dhbml1Y2hAc2Vjby5jb208
L2E+Jmd0OyA8YnI+VGVzdGVkLWJ5OiBBbmRyZWEgRGEgQ29sICZsdDs8YSBocmVmPSJtYWlsdG86
YW5kcmVhLmRhY29sQHNlY28uY29tIiB0YXJnZXQ9Il9ibGFuayI+YW5kcmVhLmRhY29sQHNlY28u
Y29tPC9hPiZndDsgPGJyPlRlc3RlZC1ieTogRGFuaWVsIFJpbmFsZGkgJmx0OzxhIGhyZWY9Im1h
aWx0bzpkYW5pZWwucmluYWxkaUBzZWNvLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmRhbmllbC5yaW5h
bGRpQHNlY28uY29tPC9hPiZndDsgPGJyPi0tLSA8YnI+c2NyaXB0cy9saWIvd2ljL2tzcGFyc2Vy
LnB5IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfCDCoMKgMiArIDxicj5zY3JpcHRzL2xpYi93
aWMvcGFydGl0aW9uLnB5IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHwgwqDCoDEgKyA8YnI+c2Ny
aXB0cy9saWIvd2ljL3BsdWdpbnMvaW1hZ2VyL2RpcmVjdC5weSB8IDEwMiArKysrKysrKysrKysr
KysrKysrKystLSA8YnI+c2NyaXB0cy93aWMgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHwgwqDCoDIgKy0gPGJyPjQgZmlsZXMgY2hhbmdl
ZCwgOTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkgPGJyPjxicj5kaWZmIC0tZ2l0IGEv
c2NyaXB0cy9saWIvd2ljL2tzcGFyc2VyLnB5IGIvc2NyaXB0cy9saWIvd2ljL2tzcGFyc2VyLnB5
IDxicj5pbmRleCAwZGY5ZWIwZDA1Li40NWRiMmVhYTVkIDEwMDY0NCA8YnI+LS0tIGEvc2NyaXB0
cy9saWIvd2ljL2tzcGFyc2VyLnB5IDxicj4rKysgYi9zY3JpcHRzL2xpYi93aWMva3NwYXJzZXIu
cHkgPGJyPkBAIC0xNDgsNiArMTQ4LDcgQEAgY2xhc3MgS2lja1N0YXJ0KCk6IDxicj7CoMKgwqDC
oMKgwqDCoMKgcGFydCA9IHN1YnBhcnNlcnMuYWRkX3BhcnNlcigmIzM5O3BhcnQmIzM5OykgPGJy
PsKgwqDCoMKgwqDCoMKgwqBwYXJ0LmFkZF9hcmd1bWVudCgmIzM5O21vdW50cG9pbnQmIzM5Oywg
bmFyZ3M9JiMzOTs/JiMzOTspIDxicj7CoMKgwqDCoMKgwqDCoMKgcGFydC5hZGRfYXJndW1lbnQo
JiMzOTstLWFjdGl2ZSYjMzk7LCBhY3Rpb249JiMzOTtzdG9yZV90cnVlJiMzOTspIDxicj4rIMKg
wqDCoMKgwqDCoMKgcGFydC5hZGRfYXJndW1lbnQoJiMzOTstLWZpeGVkLWFsaWduJiMzOTssIGFj
dGlvbj0mIzM5O3N0b3JlX3RydWUmIzM5OykgPGJyPsKgwqDCoMKgwqDCoMKgwqBwYXJ0LmFkZF9h
cmd1bWVudCgmIzM5Oy0tYWxpZ24mIzM5OywgdHlwZT1pbnQpIDxicj7CoMKgwqDCoMKgwqDCoMKg
cGFydC5hZGRfYXJndW1lbnQoJiMzOTstLW9mZnNldCYjMzk7LCB0eXBlPXNpemV0eXBlKCZxdW90
O0smcXVvdDssIFRydWUpKSA8YnI+wqDCoMKgwqDCoMKgwqDCoHBhcnQuYWRkX2FyZ3VtZW50KCYj
Mzk7LS1leGNsdWRlLXBhdGgmIzM5OywgbmFyZ3M9JiMzOTsrJiMzOTspIDxicj5AQCAtMTk0LDYg
KzE5NSw3IEBAIGNsYXNzIEtpY2tTdGFydCgpOiA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQ9JiMzOTttc2Rv
cyYjMzk7KSA8YnI+wqDCoMKgwqDCoMKgwqDCoGJvb3Rsb2FkZXIuYWRkX2FyZ3VtZW50KCYjMzk7
LS10aW1lb3V0JiMzOTssIHR5cGU9aW50KSA8YnI+wqDCoMKgwqDCoMKgwqDCoGJvb3Rsb2FkZXIu
YWRkX2FyZ3VtZW50KCYjMzk7LS1zb3VyY2UmIzM5OykgPGJyPisgwqDCoMKgwqDCoMKgwqBib290
bG9hZGVyLmFkZF9hcmd1bWVudCgmIzM5Oy0tbWFpbi1wdGFibGUtb2Zmc2V0JiMzOTssIHR5cGU9
c2l6ZXR5cGUoJnF1b3Q7SyZxdW90OyksIGRlZmF1bHQ9MCkgPGJyPsKgPGJyPsKgwqDCoMKgwqDC
oMKgwqBpbmNsdWRlID0gc3VicGFyc2Vycy5hZGRfcGFyc2VyKCYjMzk7aW5jbHVkZSYjMzk7KSA8
YnI+wqDCoMKgwqDCoMKgwqDCoGluY2x1ZGUuYWRkX2FyZ3VtZW50KCYjMzk7cGF0aCYjMzk7LCB0
eXBlPWNhbm5lZHBhdGh0eXBlKSA8YnI+ZGlmZiAtLWdpdCBhL3NjcmlwdHMvbGliL3dpYy9wYXJ0
aXRpb24ucHkgYi9zY3JpcHRzL2xpYi93aWMvcGFydGl0aW9uLnB5IDxicj5pbmRleCA1Mjc1ZGE2
ZWQzLi4xYmQyYjQ1N2NkIDEwMDY0NCA8YnI+LS0tIGEvc2NyaXB0cy9saWIvd2ljL3BhcnRpdGlv
bi5weSA8YnI+KysrIGIvc2NyaXB0cy9saWIvd2ljL3BhcnRpdGlvbi5weSA8YnI+QEAgLTI2LDYg
KzI2LDcgQEAgY2xhc3MgUGFydGl0aW9uKCk6IDxicj7CoMKgwqDCoMKgwqDCoMKgc2VsZi5hcmdz
ID0gYXJncyA8YnI+wqDCoMKgwqDCoMKgwqDCoHNlbGYuYWN0aXZlID0gYXJncy5hY3RpdmUgPGJy
PsKgwqDCoMKgwqDCoMKgwqBzZWxmLmFsaWduID0gYXJncy5hbGlnbiA8YnI+KyDCoMKgwqDCoMKg
wqDCoHNlbGYuZml4ZWRfYWxpZ24gPSBhcmdzLmZpeGVkX2FsaWduIDxicj7CoMKgwqDCoMKgwqDC
oMKgc2VsZi5kaXNrID0gYXJncy5kaXNrIDxicj7CoMKgwqDCoMKgwqDCoMKgc2VsZi5kZXZpY2Ug
PSBOb25lIDxicj7CoMKgwqDCoMKgwqDCoMKgc2VsZi5leHRyYV9zcGFjZSA9IGFyZ3MuZXh0cmFf
c3BhY2UgPGJyPmRpZmYgLS1naXQgYS9zY3JpcHRzL2xpYi93aWMvcGx1Z2lucy9pbWFnZXIvZGly
ZWN0LnB5IGIvc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvaW1hZ2VyL2RpcmVjdC5weSA8YnI+aW5k
ZXggMTY1ZmMyOTc5Zi4uZWZhNGQ3ODA0ZSAxMDA2NDQgPGJyPi0tLSBhL3NjcmlwdHMvbGliL3dp
Yy9wbHVnaW5zL2ltYWdlci9kaXJlY3QucHkgPGJyPisrKyBiL3NjcmlwdHMvbGliL3dpYy9wbHVn
aW5zL2ltYWdlci9kaXJlY3QucHkgPGJyPkBAIC0xNiw2ICsxNiw3IEBAIGltcG9ydCByYW5kb20g
PGJyPmltcG9ydCBzaHV0aWwgPGJyPmltcG9ydCB0ZW1wZmlsZSA8YnI+aW1wb3J0IHV1aWQgPGJy
PitpbXBvcnQgb3BlcmF0b3IgPGJyPjwvc3Bhbj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+
PGRpdj5TYW1lIHByb2JsZW0gYXMgYmVmb3JlIDooPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5M
b29raW5nIGF0IHRoZSBoZWFkZXJzIG9mIHlvdXIgbWFpbCwgaXQgbG9va3MgbGlrZSB5b3UgYXJl
IHVzaW5nIDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJl
ZGRlZC1jb3JlIj5odHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZTwvYT4gdG8gY29weS9wYXN0ZSB5b3VyIHBhdGNoLiBUaGF0IHdvbiYjMzk7dCB3b3JrLjwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VHJ5IHRvIGZvbGxvdyB0aGUgc3RlcHMgZG9jdW1lbnRl
ZCBpbiA6IDxhIGhyZWY9Imh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qub3JnL2Rldi9jb250cmli
dXRvci1ndWlkZS9zdWJtaXQtY2hhbmdlcy5odG1sI3VzaW5nLWdpdC10by1zZW5kLXBhdGNoZXMi
Pmh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qub3JnL2Rldi9jb250cmlidXRvci1ndWlkZS9zdWJt
aXQtY2hhbmdlcy5odG1sI3VzaW5nLWdpdC10by1zZW5kLXBhdGNoZXM8L2E+IDxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlJlZ2FyZHMsPGJyPjwvZGl2PjxkaXY+wqA8L2Rpdj48YmxvY2tx
dW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7
Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+
PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSI+wqA8YnI+ZnJvbSB0aW1lIGltcG9y
dCBzdHJmdGltZSA8YnI+wqA8YnI+QEAgLTY2LDYgKzY3LDcgQEAgY2xhc3MgRGlyZWN0UGx1Z2lu
KEltYWdlclBsdWdpbik6IDxicj7CoMKgwqDCoMKgwqDCoMKgc2VsZi53b3JrZGlyID0gc2VsZi5z
ZXR1cF93b3JrZGlyKG9wdGlvbnMud29ya2RpcikgPGJyPsKgwqDCoMKgwqDCoMKgwqBzZWxmLl9p
bWFnZSA9IE5vbmUgPGJyPsKgwqDCoMKgwqDCoMKgwqBzZWxmLnB0YWJsZV9mb3JtYXQgPSBzZWxm
LmtzLmJvb3Rsb2FkZXIucHRhYmxlIDxicj4rIMKgwqDCoMKgwqDCoMKgc2VsZi5tYWluX3B0YWJs
ZV9vZmZzZXQgPSBzZWxmLmtzLmJvb3Rsb2FkZXIubWFpbl9wdGFibGVfb2Zmc2V0IDxicj7CoMKg
wqDCoMKgwqDCoMKgc2VsZi5wYXJ0cyA9IHNlbGYua3MucGFydGl0aW9ucyA8YnI+wqA8YnI+wqDC
oMKgwqDCoMKgwqDCoCMgYXMgYSBjb252ZW5pZW5jZSwgc2V0IHNvdXJjZSB0byB0aGUgYm9vdCBw
YXJ0aXRpb24gc291cmNlIDxicj5AQCAtNzcsNiArNzksNyBAQCBjbGFzcyBEaXJlY3RQbHVnaW4o
SW1hZ2VyUGx1Z2luKTogPGJyPsKgPGJyPsKgwqDCoMKgwqDCoMKgwqBpbWFnZV9wYXRoID0gc2Vs
Zi5fZnVsbF9wYXRoKHNlbGYud29ya2Rpciwgc2VsZi5wYXJ0c1swXS5kaXNrLCAmcXVvdDtkaXJl
Y3QmcXVvdDspIDxicj7CoMKgwqDCoMKgwqDCoMKgc2VsZi5faW1hZ2UgPSBQYXJ0aXRpb25lZElt
YWdlKGltYWdlX3BhdGgsIHNlbGYucHRhYmxlX2Zvcm1hdCwgPGJyPisgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHNlbGYubWFpbl9wdGFibGVfb2Zmc2V0LCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2Vs
Zi5wYXJ0cywgc2VsZi5uYXRpdmVfc3lzcm9vdCwgPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG9w
dGlvbnMuZXh0cmFfc3BhY2UpIDxicj7CoDxicj5AQCAtMjk0LDE1ICsyOTcsMjcgQEAgR1BUX09W
RVJIRUFEID0gMzQgPGJyPiMgU2l6ZSBvZiBhIHNlY3RvciBpbiBieXRlcyA8YnI+U0VDVE9SX1NJ
WkUgPSA1MTIgPGJyPsKgPGJyPitjbGFzcyBtZW1vcnlSZWdpb24oKTogPGJyPisgwqDCoMKgZGVm
IF9faW5pdF9fKHNlbGYpOiA8YnI+KyDCoMKgwqDCoMKgwqDCoHNlbGYuc3RhcnRfc2VjdG9yID0g
MSA8YnI+KyDCoMKgwqDCoMKgwqDCoHNlbGYuZW5kX3NlY3RvciA9IDEgPGJyPisgwqDCoMKgwqDC
oMKgwqBzZWxmLnBhcnRfbnVtID0gMCA8YnI+KyA8YnI+KyDCoMKgwqBkZWYgX19pbml0X18oc2Vs
ZiwgcGFydF9udW0sIHN0YXJ0X3NlYywgZW5kX3NlYyk6IDxicj4rIMKgwqDCoMKgwqDCoMKgc2Vs
Zi5wYXJ0X251bSA9IHBhcnRfbnVtIDxicj4rIMKgwqDCoMKgwqDCoMKgc2VsZi5zdGFydF9zZWN0
b3IgPSBzdGFydF9zZWMgPGJyPisgwqDCoMKgwqDCoMKgwqBzZWxmLmVuZF9zZWN0b3IgPSBlbmRf
c2VjIDxicj4rIDxicj5jbGFzcyBQYXJ0aXRpb25lZEltYWdlKCk6IDxicj7CoMKgwqDCoCZxdW90
OyZxdW90OyZxdW90OyA8YnI+wqDCoMKgwqBQYXJ0aXRpb25lZCBpbWFnZSBpbiBhIGZpbGUuIDxi
cj7CoMKgwqDCoCZxdW90OyZxdW90OyZxdW90OyA8YnI+wqA8YnI+LSDCoMKgwqBkZWYgX19pbml0
X18oc2VsZiwgcGF0aCwgcHRhYmxlX2Zvcm1hdCwgcGFydGl0aW9ucywgbmF0aXZlX3N5c3Jvb3Q9
Tm9uZSwgZXh0cmFfc3BhY2U9MCk6IDxicj4rIMKgwqDCoGRlZiBfX2luaXRfXyhzZWxmLCBwYXRo
LCBwdGFibGVfZm9ybWF0LCBtYWluX3B0YWJsZV9vZmZzZXQsIHBhcnRpdGlvbnMsIG5hdGl2ZV9z
eXNyb290PU5vbmUsIGV4dHJhX3NwYWNlPTApOiA8YnI+wqDCoMKgwqDCoMKgwqDCoHNlbGYucGF0
aCA9IHBhdGggwqAjIFBhdGggdG8gdGhlIGltYWdlIGZpbGUgPGJyPsKgwqDCoMKgwqDCoMKgwqBz
ZWxmLm51bXBhcnQgPSAwIMKgIyBOdW1iZXIgb2YgYWxsb2NhdGVkIHBhcnRpdGlvbnMgPGJyPsKg
wqDCoMKgwqDCoMKgwqBzZWxmLnJlYWxwYXJ0ID0gMCAjIE51bWJlciBvZiBwYXJ0aXRpb25zIGlu
IHRoZSBwYXJ0aXRpb24gdGFibGUgPGJyPisgwqDCoMKgwqDCoMKgwqBzZWxmLmZpeGVkYWxpZ25f
cGFydCA9IDAgIyBOdW1iZXIgb2YgcGFydGl0aW9ucyB3aXRoIGFic29sdXRlIGFsaWdubWVudCA8
YnI+wqDCoMKgwqDCoMKgwqDCoHNlbGYucHJpbWFyeV9wYXJ0X251bSA9IDAgwqAjIE51bWJlciBv
ZiBwcmltYXJ5IHBhcnRpdGlvbnMgKG1zZG9zKSA8YnI+wqDCoMKgwqDCoMKgwqDCoHNlbGYuZXh0
ZW5kZWRwYXJ0ID0gMCDCoMKgwqDCoMKgIyBDcmVhdGUgZXh0ZW5kZWQgcGFydGl0aW9uIGJlZm9y
ZSB0aGlzIGxvZ2ljYWwgcGFydGl0aW9uIChtc2RvcykgPGJyPsKgwqDCoMKgwqDCoMKgwqBzZWxm
LmV4dGVuZGVkX3NpemVfc2VjID0gMCAjIFNpemUgb2YgZXh0ZWRlZCBwYXJ0aXRpb24gKG1zZG9z
KSA8YnI+QEAgLTMxMSwxMSArMzI2LDEzIEBAIGNsYXNzIFBhcnRpdGlvbmVkSW1hZ2UoKTogPGJy
PsKgwqDCoMKgwqDCoMKgwqBzZWxmLm1pbl9zaXplID0gMCAjIE1pbmltdW0gcmVxdWlyZWQgZGlz
ayBzaXplIHRvIGZpdCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCMgYWxsIHBhcnRpdGlvbnMgKGluIGJ5dGVzKSA8YnI+wqDCoMKgwqDCoMKg
wqDCoHNlbGYucHRhYmxlX2Zvcm1hdCA9IHB0YWJsZV9mb3JtYXQgwqAjIFBhcnRpdGlvbiB0YWJs
ZSBmb3JtYXQgPGJyPisgwqDCoMKgwqDCoMKgwqBzZWxmLm1haW5fcHRhYmxlX29mZnNldCA9IG1h
aW5fcHRhYmxlX29mZnNldCAjIGZvciBHUFQgdGFibGUsIG9mZnNldCA8YnI+wqDCoMKgwqDCoMKg
wqDCoCMgRGlzayBzeXN0ZW0gaWRlbnRpZmllciA8YnI+wqDCoMKgwqDCoMKgwqDCoHNlbGYuaWRl
bnRpZmllciA9IHJhbmRvbS5TeXN0ZW1SYW5kb20oKS5yYW5kaW50KDEsIDB4ZmZmZmZmZmYpIDxi
cj7CoDxicj7CoMKgwqDCoMKgwqDCoMKgc2VsZi5wYXJ0aXRpb25zID0gcGFydGl0aW9ucyA8YnI+
wqDCoMKgwqDCoMKgwqDCoHNlbGYucGFydGltYWdlcyA9IFtdIDxicj4rIMKgwqDCoMKgwqDCoMKg
c2VsZi51c2VkX21lbW9yeV9yZWdpb24gPSBbXSA8YnI+wqDCoMKgwqDCoMKgwqDCoCMgU2l6ZSBv
ZiBhIHNlY3RvciB1c2VkIGluIGNhbGN1bGF0aW9ucyA8YnI+wqDCoMKgwqDCoMKgwqDCoHNlbGYu
c2VjdG9yX3NpemUgPSBTRUNUT1JfU0laRSA8YnI+wqDCoMKgwqDCoMKgwqDCoHNlbGYubmF0aXZl
X3N5c3Jvb3QgPSBuYXRpdmVfc3lzcm9vdCA8YnI+QEAgLTM2OCw2ICszODUsMzAgQEAgY2xhc3Mg
UGFydGl0aW9uZWRJbWFnZSgpOiA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIyBDb252ZXJ0
aW5nIGtCIHRvIHNlY3RvcnMgZm9yIHBhcnRlZCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cGFydC5zaXplX3NlYyA9IHBhcnQuZGlza19zaXplICogMTAyNCAvLyBzZWxmLnNlY3Rvcl9zaXpl
IDxicj7CoDxicj4rIMKgwqDCoGRlZiBfYWRkX2J1c3lfcmVnaW9uKHNlbGYsIHBhcnRfbnVtLCBz
dGFydF9zZWMsIGVuZF9zZWMpOiA8YnI+KyDCoMKgwqDCoMKgwqDCoHNlbGYudXNlZF9tZW1vcnlf
cmVnaW9uLmFwcGVuZChtZW1vcnlSZWdpb24ocGFydF9udW0sIHN0YXJ0X3NlYywgZW5kX3NlYykp
IDxicj4rIMKgwqDCoMKgwqDCoMKgc2VsZi51c2VkX21lbW9yeV9yZWdpb24gPSBzb3J0ZWQoc2Vs
Zi51c2VkX21lbW9yeV9yZWdpb24sIGtleT1vcGVyYXRvci5hdHRyZ2V0dGVyKCYjMzk7c3RhcnRf
c2VjdG9yJiMzOTspKSA8YnI+KyA8YnI+KyDCoMKgwqBkZWYgX3ByaW50X2J1c3lfcmVnaW9uX2xp
c3Qoc2VsZik6IDxicj4rIMKgwqDCoMKgwqDCoMKgbGlzdCA9ICZxdW90O0J1c3kgbWVtb3J5IHJl
Z2lvbiAoaW4gc2VjdG9yKVxuJnF1b3Q7IDxicj4rIMKgwqDCoMKgwqDCoMKgbGlzdCArPSAmcXVv
dDtcdHBhcnQjXHRzdGFydFx0RW5kXG4mcXVvdDsgPGJyPisgwqDCoMKgwqDCoMKgwqBmb3IgbnVt
IGluIHJhbmdlKGxlbihzZWxmLnVzZWRfbWVtb3J5X3JlZ2lvbikpOiA8YnI+KyDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgbGlzdCArPSZxdW90O1x0JXNcdCVzXHQlc1xuJnF1b3Q7ICUgKHNlbGYudXNl
ZF9tZW1vcnlfcmVnaW9uW251bV0ucGFydF9udW0sIFwgPGJyPisgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgc2VsZi51c2VkX21lbW9yeV9yZWdpb25bbnVtXS5zdGFydF9zZWN0b3IsIHNl
bGYudXNlZF9tZW1vcnlfcmVnaW9uW251bV0uZW5kX3NlY3RvcikgPGJyPisgwqDCoMKgwqDCoMKg
wqBsb2dnZXIuZGVidWcobGlzdCkgPGJyPisgPGJyPisgwqDCoMKgZGVmIF9jaGVja19tZW1vcnlf
cmVnaW9uKHNlbGYsIHN0YXJ0X3NlYywgZW5kX3NlYyApOiA8YnI+KyDCoMKgwqDCoMKgwqDCoCZx
dW90OyZxdW90OyZxdW90OyBDaGVjayBpZiB0aGUgc3BlY2lmaWVkIHJlZ2lvbiBpcyBhbHJlYWR5
IGZsYWdnZXMgYXMgdXNlZC4gUmV0dXJucyA8YnI+KyDCoMKgwqDCoMKgwqDCoHplcm8gaWYgbm90
IHVzZWQsIDEgb3RoZXJ3aXNlJnF1b3Q7JnF1b3Q7JnF1b3Q7IDxicj4rIMKgwqDCoMKgwqDCoMKg
Zm9yIG51bSBpbiByYW5nZShsZW4oc2VsZi51c2VkX21lbW9yeV9yZWdpb24pKTogPGJyPisgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJlZ2lvbiA9IHNlbGYudXNlZF9tZW1vcnlfcmVnaW9uW251bV0g
PGJyPisgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICggKCByZWdpb24uc3RhcnRfc2VjdG9yICZs
dDsgc3RhcnRfc2VjIGFuZCBzdGFydF9zZWMgJmx0OyByZWdpb24uZW5kX3NlY3Rvcikgb3IgXCA8
YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCggcmVnaW9uLnN0YXJ0
X3NlY3RvciAmbHQ7IGVuZF9zZWMgYW5kIGVuZF9zZWMgJmx0OyByZWdpb24uZW5kX3NlY3Rvcikg
KTogPGJyPisgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDEgPGJyPisgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmICggc3RhcnRfc2VjICZsdDsgcmVnaW9uLnN0YXJ0X3NlY3Rv
ciBhbmQgZW5kX3NlYyAmZ3Q7IHJlZ2lvbi5lbmRfc2VjdG9yICk6IDxicj4rIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAxIDxicj4rIMKgwqDCoMKgwqDCoMKgcmV0dXJuIDAg
PGJyPisgPGJyPsKgwqDCoMKgZGVmIGxheW91dF9wYXJ0aXRpb25zKHNlbGYpOiA8YnI+wqDCoMKg
wqDCoMKgwqDCoCZxdW90OyZxdW90OyZxdW90OyBMYXlvdXQgdGhlIHBhcnRpdGlvbnMsIG1lYW5p
bmcgY2FsY3VsYXRlIHRoZSBwb3NpdGlvbiBvZiBldmVyeSA8YnI+wqDCoMKgwqDCoMKgwqDCoHBh
cnRpdGlvbiBvbiB0aGUgZGlzay4gVGhlICYjMzk7cHRhYmxlX2Zvcm1hdCYjMzk7IHBhcmFtZXRl
ciBkZWZpbmVzIHRoZSA8YnI+QEAgLTM3OSw2ICs0MjAsMzUgQEAgY2xhc3MgUGFydGl0aW9uZWRJ
bWFnZSgpOiA8YnI+wqDCoMKgwqDCoMKgwqDCoCMgcGFydGl0aW9ucyBub3QgbGlzdGVkIGluIHRo
ZSB0YWJsZSBhcmUgbm90IGluY2x1ZGVkLiA8YnI+wqDCoMKgwqDCoMKgwqDCoG51bV9yZWFsX3Bh
cnRpdGlvbnMgPSBsZW4oW3AgZm9yIHAgaW4gc2VsZi5wYXJ0aXRpb25zIGlmIG5vdCBwLm5vX3Rh
YmxlXSkgPGJyPsKgPGJyPisgwqDCoMKgwqDCoMKgwqAjIFRoZSBwYXJ0aXRpb25zIGZsYWdnZWQg
YXMgZml4ZWQgYWxpZ25tZW50IHBhcnRpdGlvbiBhcmUgcGxhY2VkIGludG8gaW1hZ2UgPGJyPisg
wqDCoMKgwqDCoMKgwqAjIGJlZm9yZSB0aGUgb3RoZXJzLiBJbnN0ZWFkLCByZWxhdGl2ZS1hbGln
bmVkIHBhcnRpdGlvbnMgYXJlIHBsYWNlZCBpbiBhIDxicj4rIMKgwqDCoMKgwqDCoMKgIyBzZXJp
YWxpemVkIGZhc2hpb24sIHdpdGggY29udHJvbCBvZiB0aGUgaW50ZXJzZWN0aW9uIG9mIG1lbW9y
eSBhcmVhcy4gPGJyPisgwqDCoMKgwqDCoMKgwqAjIFRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlIHJl
bGF0aXZlLWFsaWduZWQgcGFydGl0aW9ucyBpcywgYXMgYmVmb3JlLCA8YnI+KyDCoMKgwqDCoMKg
wqDCoCMgdGhlIG1heGltdW0gYWRkcmVzcyBhY2N1cGllZCBieSB0aGUgcGFydGl0aW9uIHRhYmxl
IDxicj4rIDxicj4rIMKgwqDCoMKgwqDCoMKgIyBGbGFnIGFzIHVzZWQgdGhlIG1vbW9lcnkgcmVx
dWlyZWQgZm9yIHBhcnRpdGlvbiB0YWJsZSA8YnI+KyDCoMKgwqDCoMKgwqDCoHNlbGYuX2FkZF9i
dXN5X3JlZ2lvbigtMSwgMCwgTUJSX09WRVJIRUFEKSA8YnI+KyDCoMKgwqDCoMKgwqDCoGlmIHNl
bGYucHRhYmxlX2Zvcm1hdCA9PSAmcXVvdDtncHQmcXVvdDs6IDxicj4rIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBvZmZzZXQgPSBzZWxmLm1haW5fcHRhYmxlX29mZnNldCAqIDEwMjQgLy8gc2VsZi5z
ZWN0b3Jfc2l6ZSA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VsZi5fYWRkX2J1c3lfcmVn
aW9uKC0xLCBvZmZzZXQsIG9mZnNldCArIEdQVF9PVkVSSEVBRCkgPGJyPisgPGJyPisgwqDCoMKg
wqDCoMKgwqAjIFNlYXJjaCBhbGwgcGFydGl0aW9uIHdpdGggZml4ZWQgcG9zaXRpb24gaW50byB0
aGUgaW1hZ2UgPGJyPisgwqDCoMKgwqDCoMKgwqBmb3IgbnVtIGluIHJhbmdlKGxlbihzZWxmLnBh
cnRpdGlvbnMpKTogPGJyPisgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhcnQgPSBzZWxmLnBhcnRp
dGlvbnNbbnVtXSA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgbm90IHBhcnQuZml4ZWRf
YWxpZ246IDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnRpbnVlIDxicj4r
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiBub3QgcGFydC5ub190YWJsZTogPGJyPisgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmFpc2UgV2ljRXJyb3IoJnF1b3Q7QSBwYXJ0aXRpb24g
d2l0aCBmaXhlZCBhbGlnbm1lbnQgbXVzdCBoYXZlIG5vX3RhYmxlIGZsYWcgc2V0JnF1b3Q7KSA8
YnI+KyA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhcnRfc2VjdG9yID0gKHBhcnQuYWxp
Z24gKiAxMDI0IC8vIHNlbGYuc2VjdG9yX3NpemUpIDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBlbmRfc2VjdG9yID0gc3RhcnRfc2VjdG9yICsgcGFydC5zaXplX3NlYyAtIDEgPGJyPisgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmIHNlbGYuX2NoZWNrX21lbW9yeV9yZWdpb24oc3RhcnRfc2Vj
dG9yLCBlbmRfc2VjdG9yKSA9PSAxOiA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzZWxmLl9wcmludF9idXN5X3JlZ2lvbl9saXN0KCkgPGJyPisgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmFpc2UgV2ljRXJyb3IoJnF1b3Q7QSBwYXJ0aXRpb24gd2FudHMgdG8gdXNl
IGFuIGFscmVhZHkgdXNlZCBtZW1vcnkgcmVnaW9uIChzZWN0b3JzICVkIC0gJWQpJnF1b3Q7IFwg
PGJyPisgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCUgKHN0
YXJ0X3NlY3RvciwgZW5kX3NlY3RvcikpIDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZWxm
Ll9hZGRfYnVzeV9yZWdpb24obnVtLCBzdGFydF9zZWN0b3IsIGVuZF9zZWN0b3IpIDxicj4rIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBwYXJ0LnN0YXJ0ID0gc3RhcnRfc2VjdG9yIDxicj4rIDxicj7C
oMKgwqDCoMKgwqDCoMKgIyBHbyB0aHJvdWdoIHBhcnRpdGlvbnMgaW4gdGhlIG9yZGVyIHRoZXkg
YXJlIGFkZGVkIGluIC5rcyBmaWxlIDxicj7CoMKgwqDCoMKgwqDCoMKgZm9yIG51bSBpbiByYW5n
ZShsZW4oc2VsZi5wYXJ0aXRpb25zKSk6IDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwYXJ0
ID0gc2VsZi5wYXJ0aXRpb25zW251bV0gPGJyPkBAIC00MDMsNyArNDczLDcgQEAgY2xhc3MgUGFy
dGl0aW9uZWRJbWFnZSgpOiA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiBz
ZWxmLnB0YWJsZV9mb3JtYXQgPT0gJnF1b3Q7bXNkb3MmcXVvdDs6IDxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgb3ZlcmhlYWQgPSBNQlJfT1ZFUkhFQUQgPGJyPsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZWxpZiBzZWxmLnB0YWJsZV9mb3JtYXQgPT0g
JnF1b3Q7Z3B0JnF1b3Q7OiA8YnI+LSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoG92ZXJoZWFkID0gR1BUX09WRVJIRUFEIDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgb3ZlcmhlYWQgPSAoc2VsZi5tYWluX3B0YWJsZV9vZmZzZXQgKiAxMDI0
IC8vIHNlbGYuc2VjdG9yX3NpemUpICsgR1BUX09WRVJIRUFEIDxicj7CoDxicj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCMgU2tpcCBvbmUgc2VjdG9yIHJlcXVpcmVkIGZvciB0aGUg
cGFydGl0aW9uaW5nIHNjaGVtZSBvdmVyaGVhZCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBzZWxmLm9mZnNldCArPSBvdmVyaGVhZCA8YnI+QEAgLTQxOCw3ICs0ODgsNyBAQCBj
bGFzcyBQYXJ0aXRpb25lZEltYWdlKCk6IDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgc2VsZi5vZmZzZXQgKz0gMiA8YnI+wqA8YnI+wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYWxpZ25fc2VjdG9ycyA9IDAgPGJyPi0gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIHBh
cnQuYWxpZ246IDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiBub3QgcGFydC5maXhlZF9h
bGlnbiBhbmQgcGFydC5hbGlnbjogPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IyBJZiBub3QgZmlyc3QgcGFydGl0aW9uIGFuZCB3ZSBkbyBoYXZlIGFsaWdubWVudCBzZXQgd2Ug
bmVlZCA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjIHRvIGFsaWduIHRoZSBw
YXJ0aXRpb24uIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCMgRklYTUU6IFRo
aXMgbGVhdmVzIGEgZW1wdHkgc3BhY2VzIHRvIHRoZSBkaXNrLiBUbyBmaWxsIHRoZSA8YnI+QEAg
LTQ0MCw3ICs1MTAsNyBAQCBjbGFzcyBQYXJ0aXRpb25lZEltYWdlKCk6IDxicj7CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIyBpbmNyZWFzZSB0aGUgb2Zmc2V0IHNvIHdl
IGFjdHVhbGx5IHN0YXJ0IHRoZSBwYXJ0aXRpb24gb24gcmlnaHQgYWxpZ25tZW50IDxicj7CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VsZi5vZmZzZXQgKz0gYWxpZ25f
c2VjdG9ycyA8YnI+wqA8YnI+LSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgcGFydC5vZmZzZXQg
aXMgbm90IE5vbmU6IDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiBub3QgcGFydC5maXhl
ZF9hbGlnbiBhbmQgcGFydC5vZmZzZXQgaXMgbm90IE5vbmU6IDxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoG9mZnNldCA9IHBhcnQub2Zmc2V0IC8vIHNlbGYuc2VjdG9yX3NpemUg
PGJyPsKgPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgb2Zmc2V0ICogc2Vs
Zi5zZWN0b3Jfc2l6ZSAhPSBwYXJ0Lm9mZnNldDogPGJyPkBAIC00NTUsMTQgKzUyNSwyMCBAQCBj
bGFzcyBQYXJ0aXRpb25lZEltYWdlKCk6IDxicj7CoDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHNlbGYub2Zmc2V0ID0gb2Zmc2V0IDxicj7CoDxicj4tIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBwYXJ0LnN0YXJ0ID0gc2VsZi5vZmZzZXQgPGJyPi0gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHNlbGYub2Zmc2V0ICs9IHBhcnQuc2l6ZV9zZWMgPGJyPi0gPGJyPsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmIG5vdCBwYXJ0Lm5vX3RhYmxlOiA8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBwYXJ0Lm51bSA9IHNlbGYucmVhbHBhcnQgPGJyPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGVsc2U6IDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhcnQubnVt
ID0gMCA8YnI+wqA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgbm90IHBhcnQuZml4ZWRf
YWxpZ246IDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhcnQuc3RhcnQgPSBz
ZWxmLm9mZnNldCA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZWxmLm9mZnNl
dCArPSBwYXJ0LnNpemVfc2VjIDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlm
IHNlbGYuX2NoZWNrX21lbW9yeV9yZWdpb24ocGFydC5zdGFydCwgc2VsZi5vZmZzZXQpID09IDE6
IDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VsZi5fcHJpbnRf
YnVzeV9yZWdpb25fbGlzdCgpIDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmFpc2UgV2ljRXJyb3IoJnF1b3Q7QSBwYXJ0aXRpb24gd2FudHMgdG8gdXNlIGFuIGFs
cmVhZHkgdXNlZCBtZW1vcnkgcmVnaW9uIChzZWN0b3JzICVkIC0gJWQpJnF1b3Q7IFwgPGJyPisg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCUgKHBhcnQuc3Rh
cnQsIHNlbGYub2Zmc2V0KSkgPGJyPisgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2Vs
Zi5fYWRkX2J1c3lfcmVnaW9uKHBhcnQubnVtLCBwYXJ0LnN0YXJ0LCBzZWxmLm9mZnNldCkgPGJy
PisgPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIHNlbGYucHRhYmxlX2Zvcm1hdCA9PSAm
cXVvdDttc2RvcyZxdW90OyBhbmQgbm90IHBhcnQubm9fdGFibGU6IDxicj7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGlmIHBhcnQudHlwZSA9PSAmIzM5O2xvZ2ljYWwmIzM5OzogPGJy
PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZWxmLmxvZ2ljYWxfcGFy
dF9jbnQgKz0gMSA8YnI+QEAgLTQ4MiwxMiArNTU4LDE0IEBAIGNsYXNzIFBhcnRpdGlvbmVkSW1h
Z2UoKTogPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgJnF1b3Q7c2VjdG9ycyAoJWQgYnl0ZXMpLiZxdW90OywgcGFydC5tb3VudHBvaW50LCBwYXJ0
LmRpc2ssIDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHBhcnQubnVtLCBwYXJ0LnN0YXJ0LCBzZWxmLm9mZnNldCAtIDEsIHBhcnQuc2l6ZV9zZWMs
IDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBh
cnQuc2l6ZV9zZWMgKiBzZWxmLnNlY3Rvcl9zaXplKSA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqA8YnI+KyDCoMKgwqDCoMKgwqDCoHNlbGYuX3ByaW50X2J1c3lfcmVnaW9uX2xpc3QoKSA8
YnI+wqA8YnI+wqDCoMKgwqDCoMKgwqDCoCMgT25jZSBhbGwgdGhlIHBhcnRpdGlvbnMgaGF2ZSBi
ZWVuIGxheWVkIG91dCwgd2UgY2FuIGNhbGN1bGF0ZSB0aGUgPGJyPsKgwqDCoMKgwqDCoMKgwqAj
IG1pbnVtaW0gZGlzayBzaXplIDxicj7CoMKgwqDCoMKgwqDCoMKgc2VsZi5taW5fc2l6ZSA9IHNl
bGYub2Zmc2V0IDxicj7CoMKgwqDCoMKgwqDCoMKgaWYgc2VsZi5wdGFibGVfZm9ybWF0ID09ICZx
dW90O2dwdCZxdW90OzogPGJyPi0gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlbGYubWluX3NpemUg
Kz0gR1BUX09WRVJIRUFEIDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzZWxmLm1pbl9zaXpl
ICs9IChzZWxmLm1haW5fcHRhYmxlX29mZnNldCAqIDEwMjQgLy8gc2VsZi5zZWN0b3Jfc2l6ZSkg
KyBHUFRfT1ZFUkhFQUQgPGJyPsKgPGJyPsKgwqDCoMKgwqDCoMKgwqBzZWxmLm1pbl9zaXplICo9
IHNlbGYuc2VjdG9yX3NpemUgPGJyPsKgwqDCoMKgwqDCoMKgwqBzZWxmLm1pbl9zaXplICs9IHNl
bGYuZXh0cmFfc3BhY2UgPGJyPkBAIC02MDYsNiArNjg0LDE0IEBAIGNsYXNzIFBhcnRpdGlvbmVk
SW1hZ2UoKTogPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXhlY19uYXRpdmVf
Y21kKCZxdW90O3NmZGlzayAtLXBhcnQtdHlwZSAlcyAlcyAlcyZxdW90OyAlIFwgPGJyPsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAoc2VsZi5wYXRoLCBwYXJ0Lm51bSwgcGFydC5zeXN0ZW1faWQpLCA8YnI+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNlbGYu
bmF0aXZlX3N5c3Jvb3QpIDxicj4rIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPGJy
PisgwqDCoMKgwqDCoMKgwqBpZiBzZWxmLnB0YWJsZV9mb3JtYXQgPT0gJnF1b3Q7Z3B0JnF1b3Q7
IGFuZCBzZWxmLm1haW5fcHRhYmxlX29mZnNldCAmZ3Q7IDA6IDxicj4rIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBtYWluX3B0YWJsZV9zZWN0b3JzID0gc2VsZi5tYWluX3B0YWJsZV9vZmZzZXQgKiAx
MDI0IC8vIHNlbGYuc2VjdG9yX3NpemUgPGJyPisgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxvZ2dl
ci5kZWJ1ZygmcXVvdDtNb3ZlIHRoZSBtYWluIEdQVCBwYXJ0aXRpb24gdGFibGUgZm9yd2FyZCBi
eSAlcyBzZWN0b3IocykmcXVvdDssIG1haW5fcHRhYmxlX3NlY3RvcnMpIDxicj4rIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBjbWQgPSAmcXVvdDtzZ2Rpc2sgLWogJWQgJXMmcXVvdDsgJSAobWFpbl9w
dGFibGVfc2VjdG9ycywgc2VsZi5wYXRoKSA8YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2Nt
ZCA9ICZxdW90OyhlY2hvIC1lICYjMzk7eCYjMzk7OyBlY2hvIC1lICYjMzk7aiYjMzk7IDsgZWNo
byAtZSAmIzM5OyVkJiMzOTs7IGVjaG8gLWUgJiMzOTt3JiMzOTs7IGVjaG8gLWUgJiMzOTtZJiMz
OTspIHwgZ2Rpc2sgJXMmcXVvdDsgJSAobWFpbl9wdGFibGVfc2VjdG9ycywgc2VsZi5wYXRoKSA8
YnI+KyDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXhlY19uYXRpdmVfY21kKGNtZCwgc2VsZi5uYXRp
dmVfc3lzcm9vdCkgPGJyPisgPGJyPsKgPGJyPsKgwqDCoMKgZGVmIGNsZWFudXAoc2VsZik6IDxi
cj7CoMKgwqDCoMKgwqDCoMKgcGFzcyA8YnI+ZGlmZiAtLWdpdCBhL3NjcmlwdHMvd2ljIGIvc2Ny
aXB0cy93aWMgPGJyPmluZGV4IDA2ZTBiNDhkYjAuLjBjNTlhNTUwZWYgMTAwNzU1IDxicj4tLS0g
YS9zY3JpcHRzL3dpYyA8YnI+KysrIGIvc2NyaXB0cy93aWMgPGJyPkBAIC01OSw3ICs1OSw3IEBA
IGZyb20gd2ljIGltcG9ydCBoZWxwIGFzIGhscCA8YnI+wqA8YnI+wqA8YnI+ZGVmIHdpY19sb2dn
ZXIoKTogPGJyPi0gwqDCoMKgJnF1b3Q7JnF1b3Q7JnF1b3Q7Q3JlYXRlIGFuZCBjb252ZmlndXJl
IHdpYyBsb2dnZXIuJnF1b3Q7JnF1b3Q7JnF1b3Q7IDxicj4rIMKgwqDCoCZxdW90OyZxdW90OyZx
dW90O0NyZWF0ZSBhbmQgY29uZmlndXJlIHdpYyBsb2dnZXIuJnF1b3Q7JnF1b3Q7JnF1b3Q7IDxi
cj7CoMKgwqDCoGxvZ2dlciA9IGxvZ2dpbmcuZ2V0TG9nZ2VyKCYjMzk7d2ljJiMzOTspIDxicj7C
oMKgwqDCoGxvZ2dlci5zZXRMZXZlbChsb2dnaW5nLklORk8pIDxicj7CoDxicj4tLSDCoDxicj4y
LjM5LjI8YnI+PC9zcGFuPg0KPGJyPg0KLT0tPS09LT0tPS09LT0tPS09LT0tPS08YnI+DQpMaW5r
czogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC48YnI+DQpWaWV3
L1JlcGx5IE9ubGluZSAoIzE5NDAzMik6IDxhIGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTk0MDMyIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE5NDAzMjwvYT48YnI+DQpNdXRlIFRoaXMgVG9waWM6IDxh
IGhyZWY9Imh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDM4MjgwMTIvNDMxNjE4
NSIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL210LzEwMzgyODAxMi80MzE2MTg1PC9hPjxicj4NCkdyb3VwIE93bmVyOiA8YSBo
cmVmPSJtYWlsdG86b3BlbmVtYmVkZGVkLWNvcmUlMkJvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIiB0YXJnZXQ9Il9ibGFuayI+b3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZzwvYT48YnI+DQpVbnN1YnNjcmliZTogPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIiIHJlbD0ibm9yZWZlcnJl
ciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL3Vuc3ViPC9hPiBbPGEgaHJlZj0ibWFpbHRvOnlvYW5uLmNvbmdhbEBzbWls
ZS5mciIgdGFyZ2V0PSJfYmxhbmsiPnlvYW5uLmNvbmdhbEBzbWlsZS5mcjwvYT5dPGJyPg0KLT0t
PS09LT0tPS09LT0tPS09LT0tPS08YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PHNwYW4g
Y2xhc3M9ImdtYWlsX3NpZ25hdHVyZV9wcmVmaXgiPi0tIDwvc3Bhbj48YnI+PGRpdiBkaXI9Imx0
ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+PGZvbnQgZmFjZT0iUmFs
ZXdheSwgcmVndWxhciI+WW9hbm4gQ29uZ2FsPC9mb250PjxkaXY+PGZvbnQgZmFjZT0iUmFsZXdh
eSwgcmVndWxhciI+U21pbGUgRUNTIC0gVGVjaCBleHBlcnQ8YnI+PC9mb250PjwvZGl2PjwvZGl2
PjwvZGl2PjwvZGl2Pg0K
--0000000000006b6e5d060f4b23ed--

