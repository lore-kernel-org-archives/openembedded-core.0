Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBD2C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 07:30:41 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web08.25223.1643268640272966893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 23:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NQWxgd+b;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id c188so2513749iof.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 23:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=k8iCjDR7kmn0WwkHiBn4MDBkXOT8CVC1AsKu+GBzxxc=;
        b=NQWxgd+bLUOOP0JQOKzRhzs6uDvJZMdzyyCVg5kpfWAtgd2a4RUPvDAGayNmNGqYEE
         JomGqCtgozXbJBi/duNkzHm8ysoimNaWZMOHy2cehJJT4VEefzCeCqyDNx3gi/9yEJpa
         XhRO2mimgaGFDMDCFN56xQTEs4fmNVyj7cXi2u5ouRpQKV+VJZ5tQyvEyY19GvaVc/jc
         ZyfnQxnJiKSugpI9zoZDzVDMgrvnLZsSNVQqoBq0vmiMMqmqWtcjdS/GiTh0K/4sYxxs
         1PqR0ubh4NIJ4JwNYnQ/d0lR0h/Uy4eqtVuCguXatiJoBmNtZ8vqOQQ0kJXwCdz6NxDc
         4rYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k8iCjDR7kmn0WwkHiBn4MDBkXOT8CVC1AsKu+GBzxxc=;
        b=bupCKxucNDNlIyWfABdCpx3S5cZjWekmPfbEd3g6k3cBV9w0p4OiAg0SwedWXGL9Sk
         0blwqZ5YmbRcUOB8lCtibnpQTRA4sxegEGjSPKs7/hGBkafyMHlvooA57evRMqE2Uaat
         OHYxZ+8bgKewJW3eiGmBnuALQOjVcq93zXTDGWsWKr9KsBxRQe75rDNPCYaJABckH/Si
         UgwRIZRY3U5eMBka3Lfc59iiR8bwqogooSERGv6OLWn4tZX9C1S/z9WcmR6z2pnMl11i
         VkUpC8EEBh0yQb4qygArlg66SJrL2gZ7TsT7DtUSRnpaqFqyPeXyEnD+JoDMTTrmpz/W
         1heQ==
X-Gm-Message-State: AOAM530XO5ofaKBP5sI5ueUOKdqPXvSKw1ar7psvke+t78OzfJJ+QrPJ
	sBsS29NjDXMErlXNl+P6yjGJP68ZV/Ilfw==
X-Google-Smtp-Source: 
 ABdhPJxgd6vhpe00T4hmPQa0QrgL3o22gPJ6GDplHAcqbIRk/YBeKvrhyKjj3VjQoLKXmIF5mw/r5g==
X-Received: by 2002:a02:966b:: with SMTP id c98mr1222723jai.124.1643268639518;
        Wed, 26 Jan 2022 23:30:39 -0800 (PST)
Received: from [10.128.96.162] ([72.10.160.132])
        by smtp.gmail.com with ESMTPSA id
 g7sm12138553ild.3.2022.01.26.23.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 23:30:39 -0800 (PST)
Message-ID: <1a9dc8db-027e-ce02-539f-1f8c73dce884@gmail.com>
Date: Thu, 27 Jan 2022 08:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] initramfs-framework: Add overlayroot module
Content-Language: en-US
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
 openembedded-core@lists.openembedded.org
References: <20220126072231.1749903-1-alhe@linux.microsoft.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20220126072231.1749903-1-alhe@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 07:30:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161021

Hi Alejandro,
Thanks for your patch.

I recently submitted two classes overlayfs and overlayfs-etc to do the 
same thing you want to achieve. Could you please take a look if you can 
use them instead? If not, perhaps we could adapt it to suit your needs?

Regards,
Vyacheslav

On 26.01.2022 08:22, Alejandro Hernandez Samaniego wrote:
> When installed, this module mounts a read-write (RW) overlay on
> top of a root filesystem, which is kept read-only (RO).
>
> It needs to be executed after the initramfs-module-rootfs since
> it relies on it to mount the filesystem at initramfs startup but
> before the finish module which normally switches root.
>
> It requires rootrw=<foo> to be passed as a kernel parameter to
> specify the device/partition to be used as RW by the overlay and
> has a dependency on overlayfs support being present in the
> running kernel.
>
> It does not require the read-only IMAGE_FEATURE to be enabled.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>   .../initramfs-framework/overlayroot           | 93 +++++++++++++++++++
>   .../initrdscripts/initramfs-framework_1.0.bb  |  9 ++
>   2 files changed, 102 insertions(+)
>   create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> new file mode 100644
> index 0000000000..ec5700e8fc
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> @@ -0,0 +1,93 @@
> +#!/bin/sh
> +
> +# Simple initramfs module intended to mount a read-write (RW)
> +# overlayfs on top of /, keeping the original root filesystem
> +# as read-only (RO).
> +#
> +# NOTE: The read-only IMAGE_FEATURE is not required for this to work
> +#
> +# It relies on the initramfs-module-rootfs to mount the original
> +# root filesystem, and requires 'rootrw=<foo>' to be passed as a
> +# kernel parameter, specifying the device/partition intended to
> +# use as RW.
> +#
> +# It also has a dependency on overlayfs being enabled in the
> +# running kernel via KERNEL_FEATURES (kmeta) or any other means.
> +#
> +# The RO root filesystem remains accessible by the system, mounted
> +# at /rofs
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
> +exit_gracefully() {
> +    echo $1 >/dev/console
> +    echo >/dev/console
> +    echo "OverlayRoot mounting failed, starting system as read-only" >/dev/console
> +    echo >/dev/console
> +
> +    # Make sure / is mounted as read only anyway.
> +    # Borrowed from rootfs-postcommands.bbclass
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
> +    # Continue as if the overlayroot module didn't exist
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
>


