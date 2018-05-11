Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id B9A8D7706D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 15:41:45 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id c9-v6so7472041iob.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=igDRMhAd4iFf5BNYF7NIpDsug9Xrgmb0t89LY20e9z4=;
	b=vl59JYowRLiNetJp6Da9lM5utlD31mqfcyQANWmxyu1o8g8bfVD+0c3QB6y2AMvZ1F
	MNKgzoNqEWGwSUNWGagn1m+tgfRTWWz7ZMbxXmA418ToIy5vyaNtBtZPClKMW+CEdxFH
	bklx3bvvuZ9LZzXAGEdCugDiqfwFqDTR8EjiohWVWr+rimfzBNI+S5TtzrfZwqDgXvhM
	RvJ9+3EKFUAUSPMuQg6f5r0iLqdnlXf3eloDK9LCTe8BB2INcw6bE/Ga61iWtD+4O6xx
	ESSYUNV8Vur73LFGpNhJbxUyDsn4FnsICyy9w1SPfrgO12c80x22uJIiVsyno7LbSxtU
	xlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=igDRMhAd4iFf5BNYF7NIpDsug9Xrgmb0t89LY20e9z4=;
	b=Y3Jdj+k/pDNcq0sJdlNPFlpeeN3geNo2tLqjcpoipVzV4RvYYBDQmAXto5VbENy7nn
	krdVNORW2n/5OD9Ciqv+3qptKqvd/L3TQu7dZ/17srNDOxj4iIYs9C2blA0b7TiMasR6
	TBybrp7B8ZN0QkX8Ewv17pIMg7x9CG4iKuqgotpmX1OdJ+4WyCfdSOiSOxkUoXBAm70z
	D6l5QXK1V2uCFvs4XeyntoTH8xDeJ3480fbp5+kLMDrxs0P2vIgcMHwuErLjceT363OH
	MfZnIYO9Zg3+QDqdJKaMstvOep2x7VFwSMHi6idMjFDCx5IjYetMYxOclvfD88pthwhj
	i2dg==
X-Gm-Message-State: ALKqPwcJ5eQ2h8xVVzRgk97KwurZUM4D8igVuBCB7ayj0cU4Mo+oEckF
	dnP45WBXAEz30nC8mPOJY52hiCa1+b9ZbbJR42M4Psv8
X-Google-Smtp-Source: AB8JxZpcFEL9aNMhYsRSGiJMwloM1VoH/kW4DbOCMbQnDKkB0CMahnqX+EJd5u24foqf1K+YowlRGJJeIfaTDhbF5nQ=
X-Received: by 2002:a6b:b74b:: with SMTP id
	h72-v6mr6304883iof.201.1526053306693; 
	Fri, 11 May 2018 08:41:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Fri, 11 May 2018 08:41:26 -0700 (PDT)
In-Reply-To: <20180504174346.1149-2-otavio@ossystems.com.br>
References: <20180504174346.1149-1-otavio@ossystems.com.br>
	<20180504174346.1149-2-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 May 2018 16:41:26 +0100
Message-ID: <CAJTo0LZRrvYgu9Pthi+ZzsxQX76qW2j7VzXvxfjMuOFNr5JJiQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] wic: add ontrack DM6 aux3 support
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
X-List-Received-Date: Fri, 11 May 2018 15:41:46 -0000
Content-Type: text/plain; charset="UTF-8"

Somehow, these patches are causing selftest to fail:

ERROR: Not supported fstype:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1051/steps/Running%20oe-selftest/logs/stdio

Ross

On 4 May 2018 at 18:43, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Add ontrack DM6 aux3 partition support to enable creating
> partitions required to boot i.MX MXS based platforms.
>
> This has been removed by OE-Core:21af89a6 (wic: allow only supported
> fstypes). It was unnoticed as most users were still using the
> meta-freecale image generation class instead of wic but we are now
> in process of dropping the class and this is the remaining use-case.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v2: None
>
>  scripts/lib/wic/ksparser.py              | 3 ++-
>  scripts/lib/wic/plugins/imager/direct.py | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index e590b2fe3c..02b267380f 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -138,7 +138,8 @@ class KickStart():
>          part.add_argument('--fsoptions', dest='fsopts')
>          part.add_argument('--fstype', default='vfat',
>                            choices=('ext2', 'ext3', 'ext4', 'btrfs',
> -                                   'squashfs', 'vfat', 'msdos', 'swap'))
> +                                   'squashfs', 'vfat', 'msdos', 'swap',
> +                                   'ontrackdm6aux3'))
>          part.add_argument('--mkfs-extraopts', default='')
>          part.add_argument('--label')
>          part.add_argument('--no-table', action='store_true')
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 1fa6b917e6..594481e6a9 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -528,6 +528,8 @@ class PartitionedImage():
>                  parted_fs_type = "fat16"
>                  if not part.system_id:
>                      part.system_id = '0x6' # FAT16
> +            elif part.fstype == "ontrackdm6aux3":
> +                parted_fs_type = "ontrackdm6aux3"
>              else:
>                  # Type for ext2/ext3/ext4/btrfs
>                  parted_fs_type = "ext2"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

