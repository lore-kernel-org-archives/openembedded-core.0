Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id B935871A82
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 15:46:11 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id t10so1135464pgo.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 07:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=jB/AQKqv0ObQ1UNZIT6IyMZivIjGLePhu7dT/j5UPY4=;
	b=YOvkNvwNdjDjtNQhTssERYPGix8PNtdE8JayVU0hRwVSgucVRnarhhGCuPJTE1h3ht
	C8XTD3OPHpqLPBW6trMsdLZ3NqEK1aWRbXPLwDAFQsDcLeyQbjpaz2iQUThIWfxs7zRO
	hfO5OZ3jPJFeG5SCCuUvpBCj2uytstkdn5SN/9RFiVCiwiD8NZO65GTk9+m7MAG97Mth
	0u7fBbKLz87uFuNCm1ugI+DF5jw4Xsgi+p1zfZ/XGifJzCSmqyEcBT1Dz4Jc1KA5P4Ag
	wki+wqXKgdSR5OOJoV51Gp4CuRqYBivs7zxMmdvde6anMSrGPyfoHKXQ7Ix7/APxCeQF
	6+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=jB/AQKqv0ObQ1UNZIT6IyMZivIjGLePhu7dT/j5UPY4=;
	b=mi77kO4fXlmOePZH9iIEleHmiam04Z3F9TJGGw33nE1Z1p0es16Tv1Ve9I2QhT4WPz
	OBC/PZl4+VajFwHvqtzyUnorIRQujcksSwEE8eh3AnHxbz966n5hDgTR/jFmryozmXhO
	cYX7M4iQeHB+nrS3gBeD3JWcFXUkkpnkIngENRDhG86SLm5MI2xakX7TeiWTozNn5Abn
	IhUEg+lxhLmHVZ8yJFvwwWJ8KNynK09+hGKifPS1t20IugjQk7uFGSthHz3/U9XTdon5
	xiP7uvYzqihfmX6bpGiAGRW7sBZLruEYh/cr9/fQqpYm80xHQHWc9EZ/f3gFF0kg8/+J
	pSDg==
X-Gm-Message-State: AJaThX7D0rcYlZP8+ewAPnnX3IrXCoOdE+4AstNLrTXXgNQm69CWvPCn
	cf+6zMSD5r1INlGPaIQD8F8=
X-Google-Smtp-Source: ABhQp+Q38XgT6Nb3f+yWIfm0paN9HGauKk4A8jDRqsFdgW+TqO4Bq4bukAX7eUQSzlY+3jXxDSr99Q==
X-Received: by 10.84.128.197 with SMTP id a63mr225026pla.212.1510155973002;
	Wed, 08 Nov 2017 07:46:13 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:c19d:2195:1ec1:2b82?
	([2601:202:4001:9ea0:c19d:2195:1ec1:2b82])
	by smtp.gmail.com with ESMTPSA id n3sm7973591pgp.61.2017.11.08.07.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 07:46:12 -0800 (PST)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <20171108110409.19900-1-nicolas.dechesne@linaro.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <03bbafa0-af61-6f17-44d5-0e3b91219e0b@gmail.com>
Date: Wed, 8 Nov 2017 07:46:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108110409.19900-1-nicolas.dechesne@linaro.org>
Subject: Re: [rocko][PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Wed, 08 Nov 2017 15:46:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/08/2017 03:04 AM, Nicolas Dechesne wrote:
> From: Artur Mądrzak <artur@madrzak.eu>
>
> The WIC's 'part' can now give a name for GPT partition in WKS file.
> It's similar to '--label', but is naming partintions instead file systems.
> It's required by some bootloaders to partitions have specified names.
>
> Backport from master, without it WIC cannot be used on Qualcomm based machines.
This is adding new functionality to a stable release.  What other
machines need this to work?

- armin
>
> Signed-off-by: Artur Mądrzak <artur@madrzak.eu>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 9b60e3466ed7cff0cea10815851eb1304002eb52)
> ---
>  scripts/lib/wic/help.py                  |  2 ++
>  scripts/lib/wic/ksparser.py              |  1 +
>  scripts/lib/wic/partition.py             |  1 +
>  scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
>  4 files changed, 15 insertions(+)
>
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index bd9c62e2e8..2ac45e052e 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -970,6 +970,8 @@ DESCRIPTION
>                              This option cannot be used with --fixed-size
>                              option.
>  
> +         --part-name: This option is specific to wic. It specifies name for GPT partitions.
> +
>           --part-type: This option is specific to wic. It specifies partition
>                        type GUID for GPT partitions.
>                        List of partition type GUIDS can be found here:
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 99b66eebc5..7850e81d2f 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -144,6 +144,7 @@ class KickStart():
>          part.add_argument('--no-table', action='store_true')
>          part.add_argument('--ondisk', '--ondrive', dest='disk', default='sda')
>          part.add_argument("--overhead-factor", type=overheadtype)
> +        part.add_argument('--part-name')
>          part.add_argument('--part-type')
>          part.add_argument('--rootfs-dir')
>  
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index b623bb9e6d..66e61ba70c 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -51,6 +51,7 @@ class Partition():
>          self.no_table = args.no_table
>          self.num = None
>          self.overhead_factor = args.overhead_factor
> +        self.part_name = args.part_name
>          self.part_type = args.part_type
>          self.rootfs_dir = args.rootfs_dir
>          self.size = args.size
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 60317eed22..bdb8385620 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -366,6 +366,10 @@ class PartitionedImage():
>          for num in range(len(self.partitions)):
>              part = self.partitions[num]
>  
> +            if self.ptable_format == 'msdos' and part.part_name:
> +                raise WicError("setting custom partition name is not " \
> +                               "implemented for msdos partitions")
> +
>              if self.ptable_format == 'msdos' and part.part_type:
>                  # The --part-type can also be implemented for MBR partitions,
>                  # in which case it would map to the 1-byte "partition type"
> @@ -519,6 +523,13 @@ class PartitionedImage():
>              self._create_partition(self.path, part.type,
>                                     parted_fs_type, part.start, part.size_sec)
>  
> +            if part.part_name:
> +                logger.debug("partition %d: set name to %s",
> +                             part.num, part.part_name)
> +                exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
> +                                         (part.num, part.part_name,
> +                                          self.path), self.native_sysroot)
> +
>              if part.part_type:
>                  logger.debug("partition %d: set type UID to %s",
>                               part.num, part.part_type)


