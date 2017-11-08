Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8FB77F34
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 11:03:03 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id 8so2766651qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 03:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LUL399MkCx3KmAPi3BxC+JQ/rmRdqxKh1kHfU8MHwK8=;
	b=gkoPRqb1NNpn0al0wO3g3Q95CzfAtB0bSDwLtIgCRgYS4JIQMRZmLMdiMwHcEcPTHK
	oduO1UfykDl3669t79oKmI8oeXU9YSk/jjmXk9gENC81lzGDtXDr9ycgMe81BfvZYKlk
	JF6uQxgmTtnCk26wJNI86+wENi++V8lkjWcsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LUL399MkCx3KmAPi3BxC+JQ/rmRdqxKh1kHfU8MHwK8=;
	b=Ev8n0cbN+JAQ67EqYF3ieOd9Q9v9AGx4UvxG6by9AukTCpzrwMkFIpetDPOMiCLR/W
	hS6jrjWR0t3JZ/V200RifnlYOMUoiQ3cOi1nhwn4S/Ylev1I1LkKXXSSASSVIsGDdkrv
	Sdej5jZQTomQZKsOVmZ1SSNyehstcNi9YKWKENInBVQTjxTV1UeofPoM1uaC99DczGcd
	UHKqGF5y9TJlCFMeJwgbeAQHGaGxPziL4ZCRysk8YFwaGiTDefuN4g6PBsVVpVdIfmaL
	6E6Qv7sPmlaGE85knlE/KEuDsctnmnESMcZsWJADJLEPvGmtq7+vDYMs62VrsVq/CzHl
	4O7g==
X-Gm-Message-State: AJaThX7ZnBL8wa+xzieQHSLrBZrgIssk5F/JXClxtitpD4Qc4CgkfDQv
	sYdb3EjO5269vqeN3ibO+ROQE+uN4TUCTzacPp3YaA==
X-Google-Smtp-Source: AGs4zMb8ItKWhi0SQV8XnFR/e6TMDxeY6Qwk8RNBhREBpa+vFfGL+NSJHYKoMwrxNxZ5j2OS8dYgI+O7ILeNP3TfBpw=
X-Received: by 10.200.46.22 with SMTP id r22mr117777qta.63.1510138984689; Wed,
	08 Nov 2017 03:03:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.81.81 with HTTP; Wed, 8 Nov 2017 03:02:43 -0800 (PST)
In-Reply-To: <20171107200707.GA9864@mobilek>
References: <20171107200707.GA9864@mobilek>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 8 Nov 2017 12:02:43 +0100
Message-ID: <CAP71WjxY=hZ2GWC0EWB_bUxQVn5JLqhXtJqCFxjFLHi8tPucQA@mail.gmail.com>
To: =?UTF-8?Q?Artur_M=C4=85drzak?= <artur@madrzak.eu>, 
	akuster <akuster@mvista.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Wed, 08 Nov 2017 11:03:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Armin.

On Tue, Nov 7, 2017 at 9:07 PM, Artur M=C4=85drzak <artur@madrzak.eu> wrote=
:
> The WIC's 'part' can now give a name for GPT partition in WKS file.
> It's similar to '--label', but is naming partintions instead file systems=
.
> It's required by some bootloaders to partitions have specified names.
>
> Backport from master to be able generate SD card image for Dragonboard410=
c.
>
> Signed-off-by: Artur M=C4=85drzak <artur@madrzak.eu>

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

> ---
>  scripts/lib/wic/help.py                |  2 ++
>  scripts/lib/wic/imager/direct.py       |  1 +
>  scripts/lib/wic/ksparser.py            |  1 +
>  scripts/lib/wic/partition.py           |  1 +
>  scripts/lib/wic/utils/partitionedfs.py | 15 ++++++++++++++-
>  5 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index e5347ec4b7..324499e438 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -727,6 +727,8 @@ DESCRIPTION
>                              equal to 1.
>                              The default value is 1.3.
>
> +         --part-name: This option is specific to wic. It specifies name =
for GPT partitions.
> +
>           --part-type: This option is specific to wic. It specifies parti=
tion
>                        type GUID for GPT partitions.
>                        List of partition type GUIDS can be found here:
> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/di=
rect.py
> index 4c547e04a6..6cb209aa88 100644
> --- a/scripts/lib/wic/imager/direct.py
> +++ b/scripts/lib/wic/imager/direct.py
> @@ -299,6 +299,7 @@ class DirectImageCreator(BaseImageCreator):
>                                         boot=3Dpart.active,
>                                         align=3Dpart.align,
>                                         no_table=3Dpart.no_table,
> +                                       part_name=3Dpart.part_name,
>                                         part_type=3Dpart.part_type,
>                                         uuid=3Dpart.uuid,
>                                         system_id=3Dpart.system_id)
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 0894e2b199..3c99136144 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -134,6 +134,7 @@ class KickStart():
>          part.add_argument('--no-table', action=3D'store_true')
>          part.add_argument('--ondisk', '--ondrive', dest=3D'disk')
>          part.add_argument("--overhead-factor", type=3Doverheadtype, defa=
ult=3D1.3)
> +        part.add_argument('--part-name')
>          part.add_argument('--part-type')
>          part.add_argument('--rootfs-dir')
>          part.add_argument('--size', type=3Dsizetype, default=3D0)
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index ec3aa6622c..2ffe7e3350 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -51,6 +51,7 @@ class Partition():
>          self.mountpoint =3D args.mountpoint
>          self.no_table =3D args.no_table
>          self.overhead_factor =3D args.overhead_factor
> +        self.part_name =3D args.part_name
>          self.part_type =3D args.part_type
>          self.rootfs_dir =3D args.rootfs_dir
>          self.size =3D args.size
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/uti=
ls/partitionedfs.py
> index 9ea4a30cbb..d18fa1d489 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -91,7 +91,7 @@ class Image():
>
>      def add_partition(self, size, disk_name, mountpoint, source_file=3DN=
one, fstype=3DNone,
>                        label=3DNone, fsopts=3DNone, boot=3DFalse, align=
=3DNone, no_table=3DFalse,
> -                      part_type=3DNone, uuid=3DNone, system_id=3DNone):
> +                      part_name=3DNone, part_type=3DNone, uuid=3DNone, s=
ystem_id=3DNone):
>          """ Add the next partition. Partitions have to be added in the
>          first-to-last order. """
>
> @@ -113,6 +113,7 @@ class Image():
>                  'boot': boot, # Bootable flag
>                  'align': align, # Partition alignment
>                  'no_table' : no_table, # Partition does not appear in pa=
rtition table
> +                'part_name' : part_name, # Partition name
>                  'part_type' : part_type, # Partition type
>                  'uuid': uuid, # Partition UUID
>                  'system_id': system_id} # Partition system id
> @@ -146,6 +147,11 @@ class Image():
>                  raise ImageError("setting custom partition type is not "=
 \
>                                   "implemented for msdos partitions")
>
> +            if ptable_format =3D=3D 'msdos' and part['part_name']:
> +                raise ImageError("setting custom partition name is not "=
 \
> +                                 "implemented for msdos partitions")
> +
> +
>              # Get the disk where the partition is located
>              disk =3D self.disks[part['disk_name']]
>              disk['numpart'] +=3D 1
> @@ -301,6 +307,13 @@ class Image():
>              self.__create_partition(disk['disk'].device, part['type'],
>                                      parted_fs_type, part['start'], part[=
'size'])
>
> +            if part['part_name']:
> +                msger.debug("partition %d: set  name to %s" % \
> +                            (part['num'], part['part_name']))
> +                exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
> +                                         (part['num'], part['part_name']=
,
> +                                          disk['disk'].device), self.nat=
ive_sysroot)
> +
>              if part['part_type']:
>                  msger.debug("partition %d: set type UID to %s" % \
>                              (part['num'], part['part_type']))
> --
> 2.13.6
>

