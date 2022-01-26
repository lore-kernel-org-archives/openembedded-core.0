Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5339C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 14:11:45 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.12956.1643206303788726546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 06:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ifEERdsj;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ka4so39305560ejc.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1tDLTIkBi2XSy146/1P/s2PNfWhLgN+RO9fGfgErFhk=;
        b=ifEERdsjqgyAazzipYR3jp2CwsSz5r+t5nhlz5xDoQvvu1Bb1aqN9Uahsv/xyy/TBa
         s3Cbgv5aT1xw3DfkQhAP2JnFXYjXBbhDD1r+aZo91jR1FVlu2GPauR++i+j2b6bGF4Bj
         4Y/zY85bGHp8Axvp43KyfXVL7jb2QaFuwtDt8YPM8jhH6g+IfqRrZjhI2A7b6OViAhQR
         RuqdC2HDQBNEUMl0uqg36s92VhjJe8ozYJ8kGek/BhDpHtj8jKoJHLmtF7ySnnJm766Q
         Xkh9Bl9nCHJjAQoajHKoTvtUrxJKB6cs6BV4Di4kPNBRhMnfXgm/U4FT6hB0aSFC6Zdl
         U3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1tDLTIkBi2XSy146/1P/s2PNfWhLgN+RO9fGfgErFhk=;
        b=nv7u8Q9PJmqfPp9i8HJxATJLAMAqtbq35sQqs//BXTGpPOs3m2xm98Oi70RoMuubgM
         LHCmb7PQB3zybHPAuqeM9LzUI35EcuelBZTPfvZoA1VrTG89l9i4PhoEcPGym0pkXMZi
         31JRzH8TC/DqT5JdNvfUd0Fd7I5QyyPzBDtJwnZFvAdFhsdqbQyT/nThDmaofnOYgEfy
         8Yzua4WgVPpWZr1XU9+LgQdAg9Q+03DcWvMGtwLM+b0ymgLijRou5HBDo5VSJNn/A7Jq
         HDQsBx76P7bZ2A2yp4clGJb1q5z+fBNue3+wpDN0iJV6fCncD1J7YdRWrxKAPOIB44bA
         1UDQ==
X-Gm-Message-State: AOAM532bwHwbR5Ybw+xcGy3nsDBc4yb4RBuMkgrdo1Hlcim5mxwKp6Ej
	l9sSk4Wskrwi6c+O+cpZgmosS3ovIhKJu0uUOxM=
X-Google-Smtp-Source: 
 ABdhPJzDD8WQhIb8QM/nfdOH4sut21UNdt52+cV0qLk/5koW5eGCXz7sCOHZyQdbAftvcoaXw8ZhahaqiXz73GHddU4=
X-Received: by 2002:a17:907:7d86:: with SMTP id
 oz6mr13120094ejc.532.1643206301883;
 Wed, 26 Jan 2022 06:11:41 -0800 (PST)
MIME-Version: 1.0
References: <20220126072231.1749903-1-alhe@linux.microsoft.com>
In-Reply-To: <20220126072231.1749903-1-alhe@linux.microsoft.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 26 Jan 2022 09:11:30 -0500
Message-ID: 
 <CADkTA4OjQsH5hJPt9RuEVaVHCPf6YXOb5U+LkRqV_V7KEHcEPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] initramfs-framework: Add overlayroot module
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 14:11:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160988

On Wed, Jan 26, 2022 at 2:22 AM Alejandro Hernandez Samaniego
<alhe@linux.microsoft.com> wrote:
>
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

Alejandro,

What's the higher level use case for this ? It would be worth capturing
it in the commit log.  Is this filling a gap in existing functionality ? Is it
for spinning up initramfs only configurations ? A security thing ?

>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>  .../initramfs-framework/overlayroot           | 93 +++++++++++++++++++
>  .../initrdscripts/initramfs-framework_1.0.bb  |  9 ++
>  2 files changed, 102 insertions(+)
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> new file mode 100644
> index 0000000000..ec5700e8fc
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
> @@ -0,0 +1,93 @@
> +#!/bin/sh
> +

The new script should have a copyright and SPDX identifier .. Don't
take this as great wisdom, it is something thatI always forget to to
as well!

On that note, is this completely from scratch or is it the assembly of
other bits and pieces found elsewhere ? It would be good to document
that as well.

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

For maintenance reasons, it would be a good idea to expand on (in
words) what the tweak is, what the old value is, and the new.

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

What's the boot flow in the end ? The r/w overlay is setup, and the rest of the
initrams -> full boot happens as normal ?

Bruce

> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 9e8c1dc3ab..4e76e20026 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -18,6 +18,7 @@ SRC_URI = "file://init \
>             file://e2fs \
>             file://debug \
>             file://lvm \
> +           file://overlayroot \
>            "
>
>  S = "${WORKDIR}"
> @@ -49,6 +50,9 @@ do_install() {
>      # lvm
>      install -m 0755 ${WORKDIR}/lvm ${D}/init.d/09-lvm
>
> +    # overlayroot needs to run after rootfs module but before finish
> +    install -m 0755 ${WORKDIR}/overlayroot ${D}/init.d/91-overlayroot
> +
>      # Create device nodes expected by some kernels in initramfs
>      # before even executing /init.
>      install -d ${D}/dev
> @@ -64,6 +68,7 @@ PACKAGES = "${PN}-base \
>              initramfs-module-rootfs \
>              initramfs-module-debug \
>              initramfs-module-lvm \
> +            initramfs-module-overlayroot \
>             "
>
>  FILES:${PN}-base = "/init /init.d/99-finish /dev"
> @@ -107,3 +112,7 @@ FILES:initramfs-module-debug = "/init.d/00-debug"
>  SUMMARY:initramfs-module-lvm = "initramfs lvm rootfs support"
>  RDEPENDS:initramfs-module-lvm = "${PN}-base"
>  FILES:initramfs-module-lvm = "/init.d/09-lvm"
> +
> +SUMMARY:initramfs-module-overlayroot = "initramfs support for mounting a RW overlay on top of a RO root filesystem"
> +RDEPENDS:initramfs-module-overlayroot = "${PN}-base initramfs-module-rootfs"
> +FILES:initramfs-module-overlayroot = "/init.d/91-overlayroot"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160961): https://lists.openembedded.org/g/openembedded-core/message/160961
> Mute This Topic: https://lists.openembedded.org/mt/88691930/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

