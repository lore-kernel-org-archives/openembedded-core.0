Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B33CC36001
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:00:00 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.2007.1742569194331250157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 07:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+u7Vezr;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e904f53151so16628726d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 07:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742569193; x=1743173993; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftubaorpE7UcUbNdnaoHKAwB6FGzEl9FSEaA0ENGweU=;
        b=T+u7VezrxEoFfyXqnptBnysVvC4OL+sCQMOzO8vYKkD4qPVvjKJRYRYXt7m1paCF6Z
         ASctXNHzOiKkLjFvWwe9Y7qIbD1ghLBc9dzuKXGoG4lLrHkTdVWsOxmCb9BnBSZfKVW9
         RLIwg1rI/bA53MJ9I5EoRt9jarwUR2D93z0+xkojR0IJTpPFMxIEslJh6IcZwiUssnzj
         D1IPNubKH141zRicZcX0RidgF/X8TFWMplGLfN7Oa6rawu4HzUSSNrbqWBbG1ntI5kc3
         Yt9FGxifhu8/hLAO18V1JA/E1ggYxcy0ysCaeCTke5LDX/wXSE1HUhAODXw6kg9rKm+a
         vYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569193; x=1743173993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftubaorpE7UcUbNdnaoHKAwB6FGzEl9FSEaA0ENGweU=;
        b=LJ21SWFK5eWbWPwgyMKrE4O9B4p63kOpdHexIFEJ2nHUOwRbEyOVoMZwOw6WVXw7Fb
         Dl8YIqbivyEnFZjpLervEs7KDc4urnGjutS1jBA4RsZ2NgvT/iNsjg/P9mQbXhGXKI4T
         u4WRyiJaS3tbVB6zhGucUU9nTR5lp7Zi/T9q9O2BKYGzxE/MTD7VFTxpaPTzjGIY1cN7
         oF4PQa5LYdD7uFSSSw2jdOFzGo3xi2n8yNtZwVU0MO1yI0Brje5Tc0bwpcd/C5qkAe24
         rs0v5hrPiU3zCUPFStTteuoR5z0/IhSdbTWqlxcPDPCVWRijGr8PhvHoh04spf41bqBP
         sRaA==
X-Gm-Message-State: AOJu0YwR/u5ppc/cS5uD8KNT9UvWytrBnWPmt9maEdbd8IKSHSQDixn6
	K0ga5f13hYdGLgjkYrOapGdUkf8vhBcoR5JvPV4kkNgox2CvsB21
X-Gm-Gg: ASbGncuUpBS+AsKvd23UzNeQidY9OqEgKs38SoBC+CbcWhKa27IEUH6/4WTa+TtJRli
	oZwC0OPraxADBqSsledJZGKrfmYtxeBQsmWLiD3hBZdaky9ex7O+EQBPpAHxCSA1HEqj+6rJwx/
	fAlIpw1l3P8Txxitnu9fFd5xZD/DWVheCQliiOCBgy4CtZVoAV7EupO3XcFbdo/YhpsWudpteHO
	w79tduT/AupFfIjWTeYbQaZBMO2J/SSrjyGeyXS110FEldc0T2tH0c29hXOzaJFoFSOzJa+TcKw
	iqy6hTQOgPJonkLlftubpKshHwtm8HIqTHo9OikvXZoaAx1kLCYeJtAAgUnezz0sq8rWU1sAcPW
	sXm1sR4ooeIwj1jtmJsJcL0Y=
X-Google-Smtp-Source: AGHT+IHL/xxiewJTsf1soZooRYhX6eEDSlTazmRXhnUCuZ4QRD9upWdIgmBGmyuYSRvloi8Gd+Ld0w==
X-Received: by 2002:a05:6214:21ee:b0:6e8:eabf:fd55 with SMTP id 6a1803df08f44-6eb3f357f8dmr47839076d6.39.1742569193027;
        Fri, 21 Mar 2025 07:59:53 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efe0cd6sm11898846d6.96.2025.03.21.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:59:52 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:59:50 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
Message-ID: <Z91+5mpCocPjYM+F@gmail.com>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-4-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321132517.670372-4-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213471

I was going to reply to v1, but v2 came out before I got to it!

In message: [OE-core] [PATCH v2 03/11] kernel.bbclass: add kernel-initrd-modules meta package
on 21/03/2025 Mikko Rapeli via lists.openembedded.org wrote:

> At the moment linux-yocto kernels for various architectures
> are not very modular and a lot of drivers are built into the kernel
> even when they are not needed at runtime. These make the main kernel
> binary big and slow to boot. This also impacts udev in userspace
> which takes a long time processing events from all these built in drivers,
> for example when udev runs in initrd.
> 
> Then constructing the initrd is very device and kernel configuration specific.
> initrd image needs explicitly define which binary packages to install
> to avoid pulling in complex dependencies. A full set of kernel modules
> via kernel-modules meta package is too big for initrd and most of the
> drivers are not needed for use cases like "just load modules to mount
> main rootfs". Then the initrd configuration breaks if kernel driver
> is built into the kernel since the binary package doesn't exist.
> 
> Introduce kernel-initrd-modules meta package to solve these problems.
> The meta package adds dependencies to real kernel modules based on
> the kernel module file paths so that it will include several
> kernel subsystems and their drivers which are often needed to find
> main rootfs from some block device. This works when drivers are built
> as modules but does not break if drivers are built into the kernel.

The list of paths gives me the nagging feeling that there's
a better way. With the paths, it is just something else to
maintain and has to work against an undefined set of kernel and
kernel versions (not that major directories in the kernel change,
so I don't think it is a big issue).

There won't be a way to do this generically, but I'd prefer that
this was driven from the kernel recipes down to the packaging,
instead of the packaging (the classes) coming along after and
trying to serve the needs of those undefined sets of recipes and
configurations.

The simplest would be to have the kernel recipes provide that
regex. That way the coupling of directories to the kernel
version and provider is explicit. Sure, that means the regex
is in recipes (and possibly repeated), but individual layers
and kernel providers can figure out how to minimize that
themselvs (.inc or whatever), so it is a solvable problem.

The other way that I was thinking was an annotation in the
module meta-data that could do the same thing. i.e. it could
tag a configuration option's purpose and then use that to
generate the list of modules (versus the directories), but
again, that would just go in the recipe versus the base classes
and would allow different providers to have different ways
of specifying what is for the initrd.

I honestly wouldn't provide a default in the bbclass as we
just have no way to test it for all the different kernels
and kernel providers in the ecosystem. Make the opt-in
explicit by requiring it in the kernel recipe to start
building the meta-package.

> 
> The resulting initrd is also smaller since only a subset of drivers
> are needed for "mount the rootfs" usecase. Tested on genericarm64
> kernel and qemu and AMD KV260 HW.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  .../kernel-module-split.bbclass               | 46 +++++++++++++++++++
>  meta/classes-recipe/kernel.bbclass            |  5 +-
>  meta/classes-recipe/module.bbclass            | 37 +++++++++++++++
>  3 files changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
> index 9487365eb7..06e8fbed6e 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>  KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
>  
> +# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
> +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> +
> +# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
> +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> +/drivers/acpi/|\
> +/drivers/ata/|\
> +/drivers/block/|\
> +/drivers/cdrom/|\
> +/drivers/char/hw_random/|\
> +/drivers/char/tpm/|\
> +/drivers/char/|\
> +/drivers/crypto/|\
> +/drivers/dax/|\
> +/drivers/firmware/arm_scmi/|\
> +/drivers/gpu/drm/|\
> +/drivers/md/|\
> +/drivers/mmc/|\
> +/drivers/mtd/|\
> +/drivers/nvdimm/|\
> +/drivers/nvme/|\
> +/drivers/pci/|\
> +/drivers/scsi/|\
> +/drivers/tee/|\
> +/drivers/tty/serial/|\
> +/drivers/virtio/|\
> +/drivers/watchdog/|\
> +/kernel/arch/|\
> +/kernel/block/|\
> +/kernel/crypto/|\
> +/kernel/fs/|\
> +/kernel/lib/\
> +)(.*)"
> +

Is that the same regex in both files ? We probably should unify them or
maintainence will be harder, which is why I'm suggesting that this
should come from the recipes, not the bbclass itself.

>  python split_kernel_module_packages () {
>      import re
>  
> @@ -183,6 +217,18 @@ python split_kernel_module_packages () {
>      modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
>      if modules:
>          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> +
> +    initrd_metapkg = d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> +    initrd_module_regex = re.compile(d.getVar('KERNEL_INITRD_MODULES_REGEX'))
> +    initrd_modules = []
> +    for module in modules:
> +        files = d.getVar('FILES:' + module)
> +        m = re.match(initrd_module_regex, files)
> +        if m:
> +            initrd_modules.append(module)
> +
> +    if initrd_modules:
> +        d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+' '.join(initrd_modules))

I'd suggest that we could also have a flag to completely skip the
processing. It isn't a particularly expensive set of operations, but
we tend to not do processing for boot modes that won't be used.

If it was driven top-down from a kernel recipe like I mentioned
above, just testing if the KERNEL_INITRD_MODULES_REGEX was defined
might be a good flag for the job.

Bruce

>  }
>  
>  do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 64a685a964..8fda61574d 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
>  
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> -PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
> +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
>  FILES:${PN} = ""
>  FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
>  FILES:${KERNEL_PACKAGE_NAME}-image = ""
>  FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>  FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
>  FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules = ""
>  FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
>  RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
>  # Allow machines to override this dependency if kernel image files are
> @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
>  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules = "1"
>  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
> +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules = "Kernel initrd modules meta package"
>  
>  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
>  	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
> index f2f0b25a2d..51f864f1f9 100644
> --- a/meta/classes-recipe/module.bbclass
> +++ b/meta/classes-recipe/module.bbclass
> @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
>  KERNEL_MODULES_META_PACKAGE = "${PN}"
>  FILES:${PN} = ""
>  ALLOW_EMPTY:${PN} = "1"
> +
> +# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
> +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> +
> +# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
> +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> +/drivers/acpi/|\
> +/drivers/ata/|\
> +/drivers/block/|\
> +/drivers/cdrom/|\
> +/drivers/char/hw_random/|\
> +/drivers/char/tpm/|\
> +/drivers/char/|\
> +/drivers/crypto/|\
> +/drivers/dax/|\
> +/drivers/firmware/arm_scmi/|\
> +/drivers/gpu/drm/|\
> +/drivers/md/|\
> +/drivers/mmc/|\
> +/drivers/mtd/|\
> +/drivers/nvdimm/|\
> +/drivers/nvme/|\
> +/drivers/pci/|\
> +/drivers/scsi/|\
> +/drivers/tee/|\
> +/drivers/tty/serial/|\
> +/drivers/virtio/|\
> +/drivers/watchdog/|\
> +/kernel/arch/|\
> +/kernel/block/|\
> +/kernel/crypto/|\
> +/kernel/fs/|\
> +/kernel/lib/\
> +)(.*)"
> +
> +FILES:${PN}-initrd = ""
> +ALLOW_EMPTY:${PN}-initrd = "1"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213459): https://lists.openembedded.org/g/openembedded-core/message/213459
> Mute This Topic: https://lists.openembedded.org/mt/111827585/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


