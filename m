Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9F1C433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 20:36:20 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.38851.1643661379388794785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 12:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qZIE5+yM;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id b12so13977563qvz.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 12:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zalIa8TqoLOnQkMHo/VETUjF086hIPwWk+pAPGYpKDs=;
        b=qZIE5+yMMmDGJKM2YxwQi6SxOb/+d8EOTFzjZMUhBDyaN6I/syRd+DgFxyYaedCoPG
         2wD+te1EA2h67tDotEF7B6uIEmYQBgcW3xY9H3Mv4a4gxqUDtO/esfZXntgcDE65wMVs
         jNyIGe7MBc2T9iVnRjr2XRKBqSSp/XfFGDsNfuTw7vEdv2Jf1CEsk7jpyfJtnBQaeEP8
         tZabUntKqclK7fwHXs6TopaTd9y2O8cfZBvGaF1PPWy7InbLrL/EkTS2mWTYqlb0uUZL
         K8ENQJADeAcXjl1eYCWqP9KEEJ+W8DJg+HfBL0joLNGsr1VzCmVjSURBCH1bO/uwlKEx
         aVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zalIa8TqoLOnQkMHo/VETUjF086hIPwWk+pAPGYpKDs=;
        b=nMo86etoWGOf0owdHvACjB4ahTF7VyEDl8e0xSkziO8EqpgHR/BnFMREwsvEbUN0rs
         WqN3Ex3m1pchmRb1rFfIFOif3ZhjktTDGX/wMtzqSA3NF86AzPos8cwtgc1mWcxmc5GW
         kiZaw3NliptJ1IhtviY+Xr3BZGS4U4FARzoxgnKE51SeOhFijjL3UvM8OBhSZO1+WTVO
         BBVNToGOay1UzlAo1udeiWfybayMeVfcvY5K+TTQS3nYZ/r4ZthkqDG8VJ1aBVL1eRTC
         wDTF05spCsOg5I8YA42wP/QXXF10SrsY6ZfGWJ2WBU6mrrbiCcCgDwbMC73FmMRZjcYP
         RjBA==
X-Gm-Message-State: AOAM532IZbej5qd+6iy8eHk5KKGQcN5xeKdSjpVBHFQgOdaVpY757D68
	fRvSqNV/V014BdgJ5EY84pw=
X-Google-Smtp-Source: 
 ABdhPJzHyTgJjaCLlHgkXaJMH86WBrwvomHxtDr1yLvYu3JBHKFzNMKPQayOaTGD3FMxMjKXi2yPcw==
X-Received: by 2002:a05:6214:c2f:: with SMTP id
 a15mr18964417qvd.0.1643661378384;
        Mon, 31 Jan 2022 12:36:18 -0800 (PST)
Received: from [10.129.162.221] ([37.120.205.172])
        by smtp.gmail.com with ESMTPSA id
 o22sm8433616qkl.88.2022.01.31.12.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 12:36:17 -0800 (PST)
Message-ID: <10c1ea08-3b69-aeef-6052-41ad98f37ce6@gmail.com>
Date: Mon, 31 Jan 2022 21:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH v2] initramfs-framework: Add overlayroot module
Content-Language: en-US
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
References: <20220129194839.3280002-1-alhe@linux.microsoft.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20220129194839.3280002-1-alhe@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 20:36:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161137

Hi Alejandro,
Thanks for the v2, but my questions from v1 are still left unanswered.

1. Do you really need the whole rootfs to be in overlay? Perhaps you 
have another use case in mind, but the more scope overlay has, the more 
migration effort you need in order to update upper layer on image upgrade.
2. I was thinking if perhaps that would be better to extend 
files/overlayfs-etc-preinit.sh.in to suit your needs and re-use common 
parts rather then having a good part of it copied to initramfs-framework?

Cheers,
Vyacheslav

On 29.01.2022 20:48, Alejandro Hernandez Samaniego wrote:
> When installed, this module mounts a read-write (RW) overlay on
> top of a root filesystem, which is kept read-only (RO), free
> from modifications by the user, this might prove to be useful
> if we want to access or restore the original unmodified rootfs.
>
> The existing overlay-etc.bbclass does something similar, it
> mounts an overlay on top of the /etc directory, however doing
> the same for root causes the original root to be inaccessible
> once the system is booted, hence why this module is added to
> the initramfs boot flow, allowing us to mount the RW overlay,
> while keeping the original rootfs mounted at /rofs once the
> system finishes booting. This script is loosely based on that
> class.
>
> This module requires rootrw=<foo> to be passed as a kernel
> parameter to specify the device/partition to be used as RW by the
> overlay and has a dependency on overlayfs support being present
> in the running kernel.
>
> It does not require the read-only IMAGE_FEATURE to be enabled.
>
> The module needs to be executed after the initramfs-module-rootfs
> since it relies on it to mount the filesystem at initramfs startup
> but before the finish module which normally switches root.
> After overlayroot is executed the usual boot flow continues from
> the real init process.
>
> If something goes wrong while running this module, the rootfs
> is still mounted RO (with no overlay) and the finish module is
> executed to continue booting normally.
>
> Its worth noting that, on purpose, this isnt installed by default
> on any images that use initramfs-framework to keep the boot flow
> unmodified, only when a user manually requests to install it,
> then it becomes functional.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>   .../initramfs-framework/overlayroot           | 112 ++++++++++++++++++
>   .../initrdscripts/initramfs-framework_1.0.bb  |   9 ++
>   2 files changed, 121 insertions(+)
>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> new file mode 100644
> index 0000000000..d40342dc59
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> @@ -0,0 +1,112 @@
> +#!/bin/sh
> +
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright 2022 (C), Microsoft Corporation
> +
> +# Simple initramfs module intended to mount a read-write (RW)
> +# overlayfs on top of /, keeping the original root filesystem
> +# as read-only (RO), free from modifications by the user.
> +#
> +# NOTE: The read-only IMAGE_FEATURE is not required for this to work
> +#
> +# This script is based on the overlay-etc.bbclass, which sets up
> +# an overlay on top of the /etc directory, but in this case allows
> +# accessing the original, unmodified rootfs at /rofs after boot.
> +#
> +# It relies on the initramfs-module-rootfs to mount the original
> +# root filesystem, and requires 'rootrw=<foo>' to be passed as a
> +# kernel parameter, specifying the device/partition intended to
> +# use as RW.
> +#
> +# This module needs to be executed after the initramfs-module-rootfs
> +# since it relies on it to mount the filesystem at initramfs startup
> +# but before the finish module which normally switches root.
> +# After overlayroot is executed the usual boot flow continues from
> +# the real init process.
> +#
> +# If something goes wrong while running this module, the rootfs
> +# is still mounted RO (with no overlay) and the finish module is
> +# executed to continue booting normally.
> +#
> +# It also has a dependency on overlayfs being enabled in the
> +# running kernel via KERNEL_FEATURES (kmeta) or any other means.
> +
> +
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +
> +# We get OLDROOT from the rootfs module
> +OLDROOT="/rootfs"
> +
> +NEWROOT="${RWMOUNT}/root"
> +RWMOUNT="/overlay"
> +ROMOUNT="${RWMOUNT}/rofs"
> +UPPER_DIR="${RWMOUNT}/upper"
> +WORK_DIR="${RWMOUNT}/work"
> +
> +MODULES_DIR=/init.d
> +
> +# Something went wrong, make sure / is mounted as read only anyway.
> +exit_gracefully() {
> +    echo $1 >/dev/console
> +    echo >/dev/console
> +    echo "OverlayRoot mounting failed, starting system as read-only" >/dev/console
> +    echo >/dev/console
> +
> +    # The following is borrowed from rootfs-postcommands.bbclass
> +    # This basically looks at the real rootfs mounting options and
> +    # replaces them with "ro"
> +
> +    # Tweak the mount option and fs_passno for rootfs in fstab
> +    if [ -f ${OLDROOT}/etc/fstab ]; then
> +        sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${OLDROOT}/etc/fstab
> +    fi
> +
> +    # Tweak the "mount -o remount,rw /" command in busybox-inittab inittab
> +    if [ -f ${OLDROOT}/etc/inittab ]; then
> +        sed -i 's|/bin/mount -o remount,rw /|/bin/mount -o remount,ro /|' ${OLDROOT}/etc/inittab
> +    fi
> +
> +    # Continue as if the overlayroot module didn't exist to continue booting
> +    . $MODULES_DIR/99-finish
> +    eval "finish_run"
> +}
> +
> +
> +if [ -z "$bootparam_rootrw" ]; then
> +    exit_gracefully "rootrw= kernel parameter doesn't exist and its required to mount the overlayfs"
> +fi
> +
> +mkdir -p ${RWMOUNT}
> +
> +# Mount RW device
> +if mount -n -t ${bootparam_rootfstype:-ext4} -o ${bootparam_rootflags:-defaults} ${bootparam_rootrw} ${RWMOUNT}
> +then
> +    # Set up overlay directories
> +    mkdir -p ${UPPER_DIR}
> +    mkdir -p ${WORK_DIR}
> +    mkdir -p ${NEWROOT}
> +    mkdir -p ${ROMOUNT}
> +
> +    # Remount OLDROOT as read-only
> +    mount -o bind ${OLDROOT} ${ROMOUNT}
> +    mount -o remount,ro ${ROMOUNT}
> +
> +    # Mount RW overlay
> +    mount -t overlay overlay -o lowerdir=${ROMOUNT},upperdir=${UPPER_DIR},workdir=${WORK_DIR} ${NEWROOT} || exit_gracefully "initramfs-overlayroot: Mounting overlay failed"
> +else
> +    exit_gracefully "initramfs-overlayroot: Mounting RW device failed"
> +fi
> +
> +# Set up filesystems on overlay
> +mkdir -p ${NEWROOT}/proc
> +mkdir -p ${NEWROOT}/dev
> +mkdir -p ${NEWROOT}/sys
> +mkdir -p ${NEWROOT}/rofs
> +
> +mount -n --move ${ROMOUNT} ${NEWROOT}/rofs
> +mount -n --move /proc ${NEWROOT}/proc
> +mount -n --move /sys ${NEWROOT}/sys
> +mount -n --move /dev ${NEWROOT}/dev
> +
> +exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gracefully "Couldn't chroot into overlay"
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 9e8c1dc3ab..4e76e20026 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -18,6 +18,7 @@ SRC_URI = "file://init \
>              file://e2fs \
>              file://debug \
>              file://lvm \
> +           file://overlayroot \
>             "
>   
>   S = "${WORKDIR}"
> @@ -49,6 +50,9 @@ do_install() {
>       # lvm
>       install -m 0755 ${WORKDIR}/lvm ${D}/init.d/09-lvm
>   
> +    # overlayroot needs to run after rootfs module but before finish
> +    install -m 0755 ${WORKDIR}/overlayroot ${D}/init.d/91-overlayroot
> +
>       # Create device nodes expected by some kernels in initramfs
>       # before even executing /init.
>       install -d ${D}/dev
> @@ -64,6 +68,7 @@ PACKAGES = "${PN}-base \
>               initramfs-module-rootfs \
>               initramfs-module-debug \
>               initramfs-module-lvm \
> +            initramfs-module-overlayroot \
>              "
>   
>   FILES:${PN}-base = "/init /init.d/99-finish /dev"
> @@ -107,3 +112,7 @@ FILES:initramfs-module-debug = "/init.d/00-debug"
>   SUMMARY:initramfs-module-lvm = "initramfs lvm rootfs support"
>   RDEPENDS:initramfs-module-lvm = "${PN}-base"
>   FILES:initramfs-module-lvm = "/init.d/09-lvm"
> +
> +SUMMARY:initramfs-module-overlayroot = "initramfs support for mounting a RW overlay on top of a RO root filesystem"
> +RDEPENDS:initramfs-module-overlayroot = "${PN}-base initramfs-module-rootfs"
> +FILES:initramfs-module-overlayroot = "/init.d/91-overlayroot"


