Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2009B6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:42:17 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k67so26382433wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=m9OOIzYY1qFiUM3nEHGJ1HnXjbD27QBM0MNa16isldc=;
	b=1FDmuGgHfzTLTuGVEJLVtgBQMwgf3ICoU4Bz1tEANT5PNL5AEXok8kVASPpQMIb3Nj
	AXdtx+xuSo03+hC3vwwu5srhva8I5vZ+Cl3gxs5Map/kvKfY853MClwATg8C0x+qMLsP
	G5D13aLtFYxtApdMxAy6tH0avubWruW7uRrwNve3uigdu0F/rGxizy6ENXkr5ZJBokRf
	KeI5ujf59iBoRCnzbS5VdQgB4N8xLvgD46mGOG9tahTCGnnupxnNdCag3pqsadTZ3OfF
	9idi9ewuZD4YfBVn2754SP+/0nvhpWQq6pSoUptOY+D0Af2Vu24NXHTm6sTjKZmYHvUz
	PhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=m9OOIzYY1qFiUM3nEHGJ1HnXjbD27QBM0MNa16isldc=;
	b=WRh4eAZij/onjxdbJA2B8dbLO1iGn520vlAaNhlMiM1QrRl+ZxlImsAchm5HWoOrbz
	nRH0q+m8qkwWuEIyDs6ZNMaPSZQG4Vpt5Xx2Vo1BrYzXj9cpC2qoylQ5DPB+O5jxHDpx
	rMP9y5cRw9IBQ9K3esLyoSVBAdtD+pLmYaxZ1qcOEafvTbcy415nG+7bIapdWHIhcRXP
	BLOXEN3Y/f6QQ1dZb4GsHST9IcMy5m+Aeq+SjXEl9+AYUJA6TwlfZqBPplu4ozbi8ONj
	31B1csgLfTSBMW8B+pyzNES890246VYJToIxSCC4i68l1UNS+W9QPmV+b5mCIX57KrH7
	1kIw==
X-Gm-Message-State: AIVw11072cgZHtfYFZjxKFzFU7zjbzDWdGmZL7d6X72tFURSuRPqmYNL
	CFx++o4jrIfulJ5SzRw=
X-Received: by 10.28.148.67 with SMTP id w64mr8476254wmd.55.1499708538529;
	Mon, 10 Jul 2017 10:42:18 -0700 (PDT)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com.
	[209.85.128.182]) by smtp.gmail.com with ESMTPSA id
	x131sm7018471wmg.13.2017.07.10.10.42.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:42:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f182.google.com with SMTP id r103so148415428wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:42:17 -0700 (PDT)
X-Received: by 10.28.195.67 with SMTP id t64mr8563157wmf.41.1499708537261;
	Mon, 10 Jul 2017 10:42:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Mon, 10 Jul 2017 10:42:16 -0700 (PDT)
In-Reply-To: <ccbf5f4746d009a5424034e6fce978e9f3dea49c.1499294682.git.wei.tee.ng@intel.com>
References: <cover.1499294682.git.wei.tee.ng@intel.com>
	<ccbf5f4746d009a5424034e6fce978e9f3dea49c.1499294682.git.wei.tee.ng@intel.com>
Date: Mon, 10 Jul 2017 14:42:16 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoPHMnbiu8cz+jPUquJEVs4_sbCO7c8W_Xt-LekMwYQDA@mail.gmail.com>
Message-ID: <CAP9ODKoPHMnbiu8cz+jPUquJEVs4_sbCO7c8W_Xt-LekMwYQDA@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] initramfs-framework: setup-live: detect media and assign rootfs image
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
X-List-Received-Date: Mon, 10 Jul 2017 17:42:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 6, 2017 at 3:28 PM,  <wei.tee.ng@intel.com> wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>
> Integrate the featuers in init-live.sh into new scriptlet to handle

typo!

> boot up live image process using framework method.
>
> This commit include the changes for:
> - Create a conditional loop for the bootparam_root variable. If it is
> not set, then it will boot from ROOT_IMAGE. Else, it will boot normally
> which is not from removable media.
>
> - Gives a standard path to the original boot disk mount which can be
> used to. While /media/sda is a good guess, it isn't always right, nor
> is it a good assumption that only one boot disk is in the system.
>
> - The current rootfs module has no support for rootfs images, currently
> it only support for rootfs partitions for wic image. Therefore, there
> is a need to assign the rootfs image for live image.
>
> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
> ---
>  .../initrdscripts/initramfs-framework/setup-live   | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
> new file mode 100644
> index 0000000..16da34a
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
> @@ -0,0 +1,67 @@
> +#/bin/sh
> +# Copyright (C) 2011 O.S. Systems Software LTDA.
> +# Licensed on MIT
> +
> +setup_enabled() {
> +       return 0
> +}
> +
> +setup_run() {
> +ROOT_IMAGE="rootfs.img"
> +ISOLINUX=""
> +ROOT_DISK=""
> +shelltimeout=30

Wrong indent

> +       if [ -z $bootparam_root ]; then
> +               echo "Waiting for removable media..."
> +               C=0
> +               while true
> +               do
> +                 for i in `ls /run/media 2>/dev/null`; do
> +                     if [ -f /run/media/$i/$ROOT_IMAGE ] ; then
> +                               found="yes"
> +                               ROOT_DISK="$i"
> +                               break
> +                         elif [ -f /run/media/$i/isolinux/$ROOT_IMAGE ]; then

Wrong indent

> +                               found="yes"
> +                               ISOLINUX="isolinux"
> +                               ROOT_DISK="$i"
> +                               break
> +                     fi
> +                 done
> +                 if [ "$found" = "yes" ]; then
> +                     break;
> +                 fi
> +                 # don't wait for more than $shelltimeout seconds, if it's set
> +                 if [ -n "$shelltimeout" ]; then
> +                     echo -n " " $(( $shelltimeout - $C ))
> +                     if [ $C -ge $shelltimeout ]; then
> +                          echo "..."
> +                          echo "Mounted filesystems"
> +                          mount | grep media
> +                          echo "Available block devices"
> +                          cat /proc/partitions
> +                          fatal "Cannot find $ROOT_IMAGE file in /run/media/* , dropping to a shell "

IIRC fatal does not drop to a shell, it keeps a loop.

> +                     fi
> +                     C=$(( C + 1 ))
> +                 fi
> +                 sleep 1
> +               done
> +
> +               # The existing rootfs module has no support for rootfs images. Assign the rootfs image.
> +               bootparam_root="/run/media/$ROOT_DISK/$ISOLINUX/$ROOT_IMAGE"
> +       else
> +               break
> +       fi
> +
> +       if [ "$bootparam_LABEL" != "boot" -a -f /init.d/$bootparam_LABEL.sh ] ; then
> +               if [ -f /run/media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
> +                   ./init.d/$bootparam_LABEL.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode $console_params
> +               else
> +                   fatal "Could not find $bootparam_LABEL script"
> +               fi
> +
> +               # If we're getting here, we failed...
> +               fatal "Target $bootparam_LABEL failed"
> +       fi
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

