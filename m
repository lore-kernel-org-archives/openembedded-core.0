Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA84C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 08:54:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.17820.1705654488988807879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 00:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=nAEx5/SK;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e7065b692so5285305e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 00:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705654487; x=1706259287; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aY480GJ2nyKDAesugPR651ziUfUhxcZP/UtzKLEZr/g=;
        b=nAEx5/SKqvlyoNttvhL3bUgFgrTjyZt+Zk4snkBnuAqkO2Z3GKJYNam7n/AndrU2es
         APC+EwjZ1Buxmvd3hbgNPNG6PNK/TKoYe+mW64H4DUXDOOP0mhDH1CmU1+ha9JOZUgbi
         PBjFVkraepUIQbfVuMqgZ4lzksqN9dLW2t0OqEZs0M4xymxIccSmamUUvGDE0AFAjEOz
         CbPvnc7kiu/dFdmVVeKiD0hXnZCmWpsOhz1jR0+Gv8YAeC3xJM699s1RGoraIkfP0fCI
         uEgUbXKl1R8FibZ9mEtb8CYKDLNDA7FLTcvCos6K/gNx0x/jrBZbEjTa26F3X9idj+iR
         f90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705654487; x=1706259287;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aY480GJ2nyKDAesugPR651ziUfUhxcZP/UtzKLEZr/g=;
        b=BPQe5EtS0YRnFM6yeUD6uFLqxhjyejBm+TTNO+Er86tJErYQuXNdU2430DhtPtwhPk
         q1t7mdPS6ur5bekHE0rRQ7bPEpFzzNZ0OukgBouSjemN8oGWmGFaH5WiBpiehRgj3YUM
         zw+8Fw4ftTYfuWbGfCu3cQH4xq8aTftOMBFtQe0wwf4mv4lp0/OWbAT71i6AYRp/zjzc
         spIrh8oSBMfrMmdb3Nc1uL+LvZ2YGYYAAsXWchMqwZL9iId8qcFl9PlRBB2iYgI7Vdwp
         nCGsqz0JPauhRhWnYEhA4WEsuMChxB3FJxqynUmbuvhyQ5JntAdGxPn71wa1G3GoTkfD
         Do/g==
X-Gm-Message-State: AOJu0YxKGZWV0i2+NfMNVX6rPB6HGaR3EAjNsk1s3CQFbSaq4JRkHAX7
	B29iC+psDNTAz8jiCCetGLaQPWwnoyQQWwHbHg0MGWeR22knXBAvk2nbEUfdMMk=
X-Google-Smtp-Source: AGHT+IHLKapyx1pjUQkYcUer6BN5rm727m8kjsZk6KRvCRMIHiCQlbupRVdZEhKs3TOcN6TDtGc1yQ==
X-Received: by 2002:a05:600c:1986:b0:40e:52d3:e964 with SMTP id t6-20020a05600c198600b0040e52d3e964mr1321739wmq.172.1705654486771;
        Fri, 19 Jan 2024 00:54:46 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b0040e4733aecbsm28180973wmq.15.2024.01.19.00.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 00:54:46 -0800 (PST)
Message-ID: <5af72078-4346-46ec-9b20-13758b9179ea@smile.fr>
Date: Fri, 19 Jan 2024 09:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [WIC] Configurable addressing of GTP main table
Content-Language: en-US
To: davide.cardillo@seco.com, openembedded-core@lists.openembedded.org
References: <LgwM.1705653509015986487.SlLM@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <LgwM.1705653509015986487.SlLM@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 08:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194020

Hello,


Le 19/01/2024 à 09:38, davide.cardillo via lists.openembedded.org a écrit :
> Issue:
> the usage of a gpt table with i.MX processor is not compatible by default.
> This is due to a memory conflict: the main partition table is placed into
> the same memory space used to flash the header of the U-Boot. This last
> can not be moved since the ROM code of the i.MX6 starts to read to that
> fixed address (0x400).
> This problem can be solved using a feature of the GTP partition table for
> witch the main table can be moved to a desired memory area.
> The WIC library present in Poky manages the GTP table through some
> standard Linux commands (gdisk and sgdisk) which ones have already the
> opportunity to perform this task.
> This patch introduces this feature with the addition of some wic's options,
> used also in wks file.
> 
> New partition placement behavior:
> Since now all partitions are placed after the gpt table presents into the
> first 1KB of memory (including both the gpt header at the first byte of
> memory and the main partition table starting at 0x400).
> Now the main gpt table can be placed in other address spaces and a partition
> can be placed also before the gpt table. Recap:
> - by default, all partitions are placed sequentially, one after the other.
> The first partition implicitly starts after the GPT partition table.
> - adding a flag to the item of a partition into the wks file, the partition
> can be placed, starting from a fixed memory offset (neglecting the memory
> space occupied by the GTP table).
> Combining the moving of the main partition table and the absolute (not yet
> relative) positioning of a partition, now it is possible to place one or more
>    partitions before the GPT table.
> 
> New flags:
> - main-ptable-offset (size in KB): to add as property of the bootloader item.
> Specifies the main partition table location in KB.
> - fixed-align (boolean): to add as property of a partition. Specifies that the
> partition must to placed with absolute offset, used in conjunction with --align
> property
> 
> Example:
> setting used for a wic for an i.MX6 processor, where the main partition table is
> placed with the absolute offset of 4MB
> 
> bootloader --ptable gpt --main-ptable-offset 4096K
> part / --source rawcopy --sourceparams="file=u-boot.imx" --ondisk mmcblk --align 1 --size 1M --no-table --fixed-align
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

FYI, your patch is not formatted properly. (It lacks spaces at the start of context lines?)

Maybe look into using git-send-email to avoid this kind of problem?

Regards,

> ---
> scripts/lib/wic/ksparser.py              |   2 +
> scripts/lib/wic/partition.py             |   1 +
> scripts/lib/wic/plugins/imager/direct.py | 102 +++++++++++++++++++++--
> scripts/wic                              |   2 +-
> 4 files changed, 98 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 0df9eb0d05..45db2eaa5d 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -148,6 +148,7 @@ class KickStart():
>         part = subparsers.add_parser('part')
>         part.add_argument('mountpoint', nargs='?')
>         part.add_argument('--active', action='store_true')
> +        part.add_argument('--fixed-align', action='store_true')
>         part.add_argument('--align', type=int)
>         part.add_argument('--offset', type=sizetype("K", True))
>         part.add_argument('--exclude-path', nargs='+')
> @@ -194,6 +195,7 @@ class KickStart():
>                                 default='msdos')
>         bootloader.add_argument('--timeout', type=int)
>         bootloader.add_argument('--source')
> +        bootloader.add_argument('--main-ptable-offset', type=sizetype("K"), default=0)
>  
>         include = subparsers.add_parser('include')
>         include.add_argument('path', type=cannedpathtype)
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 5275da6ed3..1bd2b457cd 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -26,6 +26,7 @@ class Partition():
>         self.args = args
>         self.active = args.active
>         self.align = args.align
> +        self.fixed_align = args.fixed_align
>         self.disk = args.disk
>         self.device = None
>         self.extra_space = args.extra_space
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 165fc2979f..efa4d7804e 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -16,6 +16,7 @@ import random
> import shutil
> import tempfile
> import uuid
  ^ For example, here

> +import operator
>  
> from time import strftime
>  
> @@ -66,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
>         self.workdir = self.setup_workdir(options.workdir)
>         self._image = None
>         self.ptable_format = self.ks.bootloader.ptable
> +        self.main_ptable_offset = self.ks.bootloader.main_ptable_offset
>         self.parts = self.ks.partitions
>  
>         # as a convenience, set source to the boot partition source
> @@ -77,6 +79,7 @@ class DirectPlugin(ImagerPlugin):
>  
>         image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
>         self._image = PartitionedImage(image_path, self.ptable_format,
> +                                       self.main_ptable_offset,
>                                        self.parts, self.native_sysroot,
>                                        options.extra_space)
>  
> @@ -294,15 +297,27 @@ GPT_OVERHEAD = 34
> # Size of a sector in bytes
> SECTOR_SIZE = 512
>  
> +class memoryRegion():
> +    def __init__(self):
> +        self.start_sector = 1
> +        self.end_sector = 1
> +        self.part_num = 0
> +
> +    def __init__(self, part_num, start_sec, end_sec):
> +        self.part_num = part_num
> +        self.start_sector = start_sec
> +        self.end_sector = end_sec
> +
> class PartitionedImage():
>     """
>     Partitioned image in a file.
>     """
>  
> -    def __init__(self, path, ptable_format, partitions, native_sysroot=None, extra_space=0):
> +    def __init__(self, path, ptable_format, main_ptable_offset, partitions, native_sysroot=None, extra_space=0):
>         self.path = path  # Path to the image file
>         self.numpart = 0  # Number of allocated partitions
>         self.realpart = 0 # Number of partitions in the partition table
> +        self.fixedalign_part = 0 # Number of partitions with absolute alignment
>         self.primary_part_num = 0  # Number of primary partitions (msdos)
>         self.extendedpart = 0      # Create extended partition before this logical partition (msdos)
>         self.extended_size_sec = 0 # Size of exteded partition (msdos)
> @@ -311,11 +326,13 @@ class PartitionedImage():
>         self.min_size = 0 # Minimum required disk size to fit
>                           # all partitions (in bytes)
>         self.ptable_format = ptable_format  # Partition table format
> +        self.main_ptable_offset = main_ptable_offset # for GPT table, offset
>         # Disk system identifier
>         self.identifier = random.SystemRandom().randint(1, 0xffffffff)
>  
>         self.partitions = partitions
>         self.partimages = []
> +        self.used_memory_region = []
>         # Size of a sector used in calculations
>         self.sector_size = SECTOR_SIZE
>         self.native_sysroot = native_sysroot
> @@ -368,6 +385,30 @@ class PartitionedImage():
>             # Converting kB to sectors for parted
>             part.size_sec = part.disk_size * 1024 // self.sector_size
>  
> +    def _add_busy_region(self, part_num, start_sec, end_sec):
> +        self.used_memory_region.append(memoryRegion(part_num, start_sec, end_sec))
> +        self.used_memory_region = sorted(self.used_memory_region, key=operator.attrgetter('start_sector'))
> +
> +    def _print_busy_region_list(self):
> +        list = "Busy memory region (in sector)\n"
> +        list += "\tpart#\tstart\tEnd\n"
> +        for num in range(len(self.used_memory_region)):
> +            list +="\t%s\t%s\t%s\n" % (self.used_memory_region[num].part_num, \
> +                self.used_memory_region[num].start_sector, self.used_memory_region[num].end_sector)
> +        logger.debug(list)
> +
> +    def _check_memory_region(self, start_sec, end_sec ):
> +        """ Check if the specified region is already flagges as used. Returns
> +        zero if not used, 1 otherwise"""
> +        for num in range(len(self.used_memory_region)):
> +            region = self.used_memory_region[num]
> +            if ( ( region.start_sector < start_sec and start_sec < region.end_sector) or \
> +                    ( region.start_sector < end_sec and end_sec < region.end_sector) ):
> +                return 1
> +            if ( start_sec < region.start_sector and end_sec > region.end_sector ):
> +                return 1
> +        return 0
> +
>     def layout_partitions(self):
>         """ Layout the partitions, meaning calculate the position of every
>         partition on the disk. The 'ptable_format' parameter defines the
> @@ -379,6 +420,35 @@ class PartitionedImage():
>         # partitions not listed in the table are not included.
>         num_real_partitions = len([p for p in self.partitions if not p.no_table])
>  
> +        # The partitions flagged as fixed alignment partition are placed into image
> +        # before the others. Instead, relative-aligned partitions are placed in a
> +        # serialized fashion, with control of the intersection of memory areas.
> +        # The base address of the relative-aligned partitions is, as before,
> +        # the maximum address accupied by the partition table
> +
> +        # Flag as used the momoery required for partition table
> +        self._add_busy_region(-1, 0, MBR_OVERHEAD)
> +        if self.ptable_format == "gpt":
> +            offset = self.main_ptable_offset * 1024 // self.sector_size
> +            self._add_busy_region(-1, offset, offset + GPT_OVERHEAD)
> +
> +        # Search all partition with fixed position into the image
> +        for num in range(len(self.partitions)):
> +            part = self.partitions[num]
> +            if not part.fixed_align:
> +                continue
> +            if not part.no_table:
> +                raise WicError("A partition with fixed alignment must have no_table flag set")
> +
> +            start_sector = (part.align * 1024 // self.sector_size)
> +            end_sector = start_sector + part.size_sec - 1
> +            if self._check_memory_region(start_sector, end_sector) == 1:
> +                self._print_busy_region_list()
> +                raise WicError("A partition wants to use an already used memory region (sectors %d - %d)" \
> +                        % (start_sector, end_sector))
> +            self._add_busy_region(num, start_sector, end_sector)
> +            part.start = start_sector
> +
>         # Go through partitions in the order they are added in .ks file
>         for num in range(len(self.partitions)):
>             part = self.partitions[num]
> @@ -403,7 +473,7 @@ class PartitionedImage():
>                 if self.ptable_format == "msdos":
>                     overhead = MBR_OVERHEAD
>                 elif self.ptable_format == "gpt":
> -                    overhead = GPT_OVERHEAD
> +                    overhead = (self.main_ptable_offset * 1024 // self.sector_size) + GPT_OVERHEAD
>  
>                 # Skip one sector required for the partitioning scheme overhead
>                 self.offset += overhead
> @@ -418,7 +488,7 @@ class PartitionedImage():
>                     self.offset += 2
>  
>             align_sectors = 0
> -            if part.align:
> +            if not part.fixed_align and part.align:
>                 # If not first partition and we do have alignment set we need
>                 # to align the partition.
>                 # FIXME: This leaves a empty spaces to the disk. To fill the
> @@ -440,7 +510,7 @@ class PartitionedImage():
>                     # increase the offset so we actually start the partition on right alignment
>                     self.offset += align_sectors
>  
> -            if part.offset is not None:
> +            if not part.fixed_align and part.offset is not None:
>                 offset = part.offset // self.sector_size
>  
>                 if offset * self.sector_size != part.offset:
> @@ -455,14 +525,20 @@ class PartitionedImage():
>  
>                 self.offset = offset
>  
> -            part.start = self.offset
> -            self.offset += part.size_sec
> -
>             if not part.no_table:
>                 part.num = self.realpart
>             else:
>                 part.num = 0
>  
> +            if not part.fixed_align:
> +                part.start = self.offset
> +                self.offset += part.size_sec
> +                if self._check_memory_region(part.start, self.offset) == 1:
> +                    self._print_busy_region_list()
> +                    raise WicError("A partition wants to use an already used memory region (sectors %d - %d)" \
> +                        % (part.start, self.offset))
> +                self._add_busy_region(part.num, part.start, self.offset)
> +
>             if self.ptable_format == "msdos" and not part.no_table:
>                 if part.type == 'logical':
>                     self.logical_part_cnt += 1
> @@ -482,12 +558,14 @@ class PartitionedImage():
>                          "sectors (%d bytes).", part.mountpoint, part.disk,
>                          part.num, part.start, self.offset - 1, part.size_sec,
>                          part.size_sec * self.sector_size)
> +             
> +        self._print_busy_region_list()
>  
>         # Once all the partitions have been layed out, we can calculate the
>         # minumim disk size
>         self.min_size = self.offset
>         if self.ptable_format == "gpt":
> -            self.min_size += GPT_OVERHEAD
> +            self.min_size += (self.main_ptable_offset * 1024 // self.sector_size) + GPT_OVERHEAD
>  
>         self.min_size *= self.sector_size
>         self.min_size += self.extra_space
> @@ -606,6 +684,14 @@ class PartitionedImage():
>                 exec_native_cmd("sfdisk --part-type %s %s %s" % \
>                                 (self.path, part.num, part.system_id),
>                                 self.native_sysroot)
> +                 
> +        if self.ptable_format == "gpt" and self.main_ptable_offset > 0:
> +            main_ptable_sectors = self.main_ptable_offset * 1024 // self.sector_size
> +            logger.debug("Move the main GPT partition table forward by %s sector(s)", main_ptable_sectors)
> +            cmd = "sgdisk -j %d %s" % (main_ptable_sectors, self.path)
> +            #cmd = "(echo -e 'x'; echo -e 'j' ; echo -e '%d'; echo -e 'w'; echo -e 'Y') | gdisk %s" % (main_ptable_sectors, self.path)
> +            exec_native_cmd(cmd, self.native_sysroot)
> +
>  
>     def cleanup(self):
>         pass
> diff --git a/scripts/wic b/scripts/wic
> index 06e0b48db0..0c59a550ef 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -59,7 +59,7 @@ from wic import help as hlp
>  
>  
> def wic_logger():
> -    """Create and convfigure wic logger."""
> +    """Create and configure wic logger."""
>     logger = logging.getLogger('wic')
>     logger.setLevel(logging.INFO)
>  
> --  
> 2.39.2
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194018): https://lists.openembedded.org/g/openembedded-core/message/194018
> Mute This Topic: https://lists.openembedded.org/mt/103826557/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

