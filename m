Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5D1C369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 13:12:11 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.25576.1744377127596060985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 06:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=crqBwEh3;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so2284034e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744377126; x=1744981926; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KHnQF8L9uZhPYhSY/hFMbSAKGRCpGFbdYwB9l4fPg1A=;
        b=crqBwEh3cXqAWDPbrF0p4uNlws1cAJdpImYxtbLKACOHBVGqmihE4VWUaS6oFDm6PB
         kzdZ2Qn6ZPC3bATiXePvJrStpZ9/9XtnMKTVtAd0aq2gEXLuN15sZU6tIA8Djr+LTgXi
         0hKOWxMXW55C60qijF0Utwp4MREqdVGoWHgAX3T6Tjtxm5eFg62/nLgsM/Au72Cq/kM5
         mIgJi5aAA1/yloTgA4E1rgeIQ00uaaZLSYNpXZ+unsjYZMOoUUnKpoFmz0TGYNN8JE49
         vc3McvYNz87STrD/zZN9mxLkNsxcYwEd1UmHh0BdW/oF8Yp+iAnJg7ze3sp1BLE7bmdd
         aN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377126; x=1744981926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHnQF8L9uZhPYhSY/hFMbSAKGRCpGFbdYwB9l4fPg1A=;
        b=FLHB8bAbp7VYpw8cxFVJ631TzRxlLzj70thkHnQNW53vY3wqQYsA8WM1NXX5W6fGfy
         2DhMoZUUccVSMzANU1VeGJXdG5X/nka1Q3TLzHDl8A7/XEnwfInRWRLh8s3ZE6jhu3FP
         3zmyhOG0tZKYsr4DVJnaEUR8HqkXvX5u1Dxs9dE1/prMHeRmQfJun4bCFe1zt+V8ZryU
         8xDzYfn0mV6PSpDCKfxABq5dga+i0PkLbcIIutJqAGZunEI8HfqVCj+rZYxz9krUn6aF
         R6osDahfp8FJRD2PELGiEudA8i7+6zE2lMsose9tnwAiOrfodZaKAkAaHTRdnUb7mbcu
         8ZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb5iBcUyCjZ9UugxLealKKBDfR4hZs2vs1ki/VuJcFhuhAGKYOdc0zlEG+k+9miGqplbMio3FumhHG1XIdIbBpEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxPNGAAiDV712Hz0cewjgk/Bd4P9Pd3KWesvWsfZYLuk/EkZHCM
	6vvoAUuHDDAWKT5WsWNOEjWTLIM5K/z7ymkCPeMuneltU1fowMhUNWRlznQnNgXfOs+D405LB0r
	oqpE=
X-Gm-Gg: ASbGncs1lU6GcrVaBvTI1tqB9QJe6JQlhjqni/gUeN3D+FazheV6qi9N3UrJOJOU3ZC
	YrCcZJ7kt7FrOP9neYFeSxGEi34eccNMro35Es2Mt4TvHtrlO4MxoqxGcyEoyTmk+QjArW/+L+Z
	zLDriCnU/pasH0vFy/EN5JkJEjkTGyT9zT+rV/zM5qXTkc4rkgy3yJo7WFaJHurWysKIS2m5W4d
	MVJ7P+TdBpbo7OJ4e+smvbyUck6QFkd+ugnan4vpkIGegOvYFR1Ek6nKjJFgFMKQ4nvdCUnm9Qt
	7lEipG/RaJV6ANrdcUegma0sB+y4mV4WMKd+Grqp/hEuUAvw9iLel6Mo7MQqAGORb6x7NkC4HA=
	=
X-Google-Smtp-Source: AGHT+IFv+R7l53rClrXyXxrpfbIBJlHo7zyVuYRF1UARKL8ueaaRtUzzzf98h4LMgBkC8ZriX6XPmQ==
X-Received: by 2002:a05:6512:6d2:b0:545:243e:e2dc with SMTP id 2adb3069b0e04-54d452ca0bfmr768971e87.39.1744377125452;
        Fri, 11 Apr 2025 06:12:05 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d520279sm428062e87.232.2025.04.11.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:12:04 -0700 (PDT)
Date: Fri, 11 Apr 2025 16:12:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
Message-ID: <Z_kVI4bN7xWOyUi-@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org>
 <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <Z_fBAsbV-hY-x_SC@nuoska>
 <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
 <Z_jJX05RuRTcFf4P@nuoska>
 <CADkTA4MWWtMXdRhvmdXhoS38SVpqXUz=p5G5H1i820QaV4CR0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4MWWtMXdRhvmdXhoS38SVpqXUz=p5G5H1i820QaV4CR0A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214741

Hi,

On Fri, Apr 11, 2025 at 08:52:24AM -0400, Bruce Ashfield wrote:
> On Fri, Apr 11, 2025 at 3:48 AM Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
> 
> > Hi,
> >
> > On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:
> > > On Thu, Apr 10, 2025 at 9:00 AM Mikko Rapeli via lists.openembedded.org
> > > <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > >
> > > > On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> > > > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > > lists.openembedded.org wrote:
> > > > > > At the moment linux-yocto kernels for various architectures
> > > > > > are not very modular and a lot of drivers are built into the kernel
> > > > > > even when they are not needed at runtime. These make the main
> > kernel
> > > > > > binary big and slow to boot. This also impacts udev in userspace
> > > > > > which takes a long time processing events from all these built in
> > > > drivers,
> > > > > > for example when udev runs in initrd.
> > > > > >
> > > > > > Then constructing the initrd is very device and kernel
> > configuration
> > > > specific.
> > > > > > initrd image needs explicitly define which binary packages to
> > install
> > > > > > to avoid pulling in complex dependencies. A full set of kernel
> > modules
> > > > > > via kernel-modules meta package is too big for initrd and most of
> > the
> > > > > > drivers are not needed for use cases like "just load modules to
> > mount
> > > > > > main rootfs". Then the initrd configuration breaks if kernel driver
> > > > > > is built into the kernel since the binary package doesn't exist.
> > > > > >
> > > > > > Introduce kernel-initrd-modules meta package to solve these
> > problems.
> > > > > > The meta package adds dependencies to real kernel modules based on
> > > > > > the kernel module file paths so that it will include several
> > > > > > kernel subsystems and their drivers which are often needed to find
> > > > > > main rootfs from some block device. This works when drivers are
> > built
> > > > > > as modules but does not break if drivers are built into the kernel.
> > > > > >
> > > > > > The resulting initrd is also smaller since only a subset of drivers
> > > > > > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > > > > > kernel and qemu and AMD KV260 HW.
> > > > > >
> > > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > > ---
> > > > > >  .../kernel-module-split.bbclass               | 48
> > +++++++++++++++++++
> > > > > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > > > > >  meta/classes-recipe/module.bbclass            | 37 ++++++++++++++
> > > > > >  3 files changed, 89 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> > > > b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > index 9487365eb7..101c5cd959 100644
> > > > > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> > > > > >  KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> > > > > >  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
> > > > > >
> > > > > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs
> > > > from block device
> > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@
> > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > +
> > > > > > +# match regex to path or file name. E.g. include all drivers with
> > > > files in path /drivers/ata/
> > > > > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > > > > +/drivers/acpi/|\
> > > > > > +/drivers/ata/|\
> > > > > > +/drivers/block/|\
> > > > > > +/drivers/cdrom/|\
> > > > > > +/drivers/char/hw_random/|\
> > > > > > +/drivers/char/tpm/|\
> > > > > > +/drivers/char/|\
> > > > > > +/drivers/crypto/|\
> > > > > > +/drivers/dax/|\
> > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > +/drivers/gpu/drm/|\
> > > > > > +/drivers/md/|\
> > > > > > +/drivers/mmc/|\
> > > > > > +/drivers/mtd/|\
> > > > > > +/drivers/nvdimm/|\
> > > > > > +/drivers/nvme/|\
> > > > > > +/drivers/pci/|\
> > > > > > +/drivers/scsi/|\
> > > > > > +/drivers/tee/|\
> > > > > > +/drivers/tty/serial/|\
> > > > > > +/drivers/virtio/|\
> > > > > > +/drivers/watchdog/|\
> > > > > > +/kernel/arch/|\
> > > > > > +/kernel/block/|\
> > > > > > +/kernel/crypto/|\
> > > > > > +/kernel/fs/|\
> > > > > > +/kernel/lib/\
> > > > > > +)(.*)"
> > > > > > +
> > > > > >  python split_kernel_module_packages () {
> > > > > >      import re
> > > > > >
> > > > > > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > > > > >      modules = do_split_packages(d,
> > > > root='${nonarch_base_libdir}/modules', file_regex=module_regex,
> > > > output_pattern=module_pattern, description='%s kernel module',
> > > > postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata,
> > > > extra_depends='%s-%s' % (kernel_package_name, kernel_version))
> > > > > >      if modules:
> > > > > >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> > > > > > +
> > > > > > +    initrd_metapkg =
> > d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> > > > or ""
> > > > > > +    initrd_module_regex = d.getVar('KERNEL_INITRD_MODULES_REGEX')
> > or
> > > > ""
> > > > > > +    if (initrd_metapkg != "") and (initrd_module_regex != ""):
> > > > > > +        initrd_module_regex = re.compile(initrd_module_regex)
> > > > > > +        initrd_modules = []
> > > > > > +        for module in modules:
> > > > > > +            files = d.getVar('FILES:' + module)
> > > > > > +            m = re.match(initrd_module_regex, files)
> > > > > > +            if m:
> > > > > > +                initrd_modules.append(module)
> > > > > > +
> > > > > > +        if initrd_modules:
> > > > > > +            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> > > > '.join(initrd_modules))
> > > > > >  }
> > > > > >
> > > > > >  do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_"
> > + s,
> > > > (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > > > > diff --git a/meta/classes-recipe/kernel.bbclass
> > > > b/meta/classes-recipe/kernel.bbclass
> > > > > > index 36ce659762..3dcaebcaed 100644
> > > > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile
> > do_transform_kernel
> > > > do_transform_bundled_initramfs d
> > > > > >
> > > > > >  # kernel-base becomes kernel-${KERNEL_VERSION}
> > > > > >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > > > > -PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > > +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > > ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > >  FILES:${PN} = ""
> > > > > >  FILES:${KERNEL_PACKAGE_NAME}-base =
> > > > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
> > > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> > > >
> > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > > > > >  FILES:${KERNEL_PACKAGE_NAME}-image = ""
> > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dev =
> > "/${KERNEL_IMAGEDEST}/System.map*
> > > > /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*
> > > > ${KERNEL_SRC_PATH}
> > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > > > >  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =
> > > > "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > > > > >  FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> > > > > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules = ""
> > > > > >  FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
> > > > > >  RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (=
> > > > ${EXTENDPKGV})"
> > > > > >  # Allow machines to override this dependency if kernel image
> > files are
> > > > > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
> > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
> > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
> > > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
> > > > > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules = "1"
> > > > > >  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta
> > > > package"
> > > > > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules = "Kernel initrd
> > > > modules meta package"
> > > > > >
> > > > > >  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > > > > >     if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > > > > diff --git a/meta/classes-recipe/module.bbclass
> > > > b/meta/classes-recipe/module.bbclass
> > > > > > index f2f0b25a2d..51f864f1f9 100644
> > > > > > --- a/meta/classes-recipe/module.bbclass
> > > > > > +++ b/meta/classes-recipe/module.bbclass
> > > > > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > > > > >  KERNEL_MODULES_META_PACKAGE = "${PN}"
> > > > > >  FILES:${PN} = ""
> > > > > >  ALLOW_EMPTY:${PN} = "1"
> > > > > > +
> > > > > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs
> > > > from block device
> > > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@
> > > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > > +
> > > > > > +# match regex to path or file name. E.g. include all drivers with
> > > > files in path /drivers/ata/
> > > > > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > > > > +/drivers/acpi/|\
> > > > > > +/drivers/ata/|\
> > > > > > +/drivers/block/|\
> > > > > > +/drivers/cdrom/|\
> > > > > > +/drivers/char/hw_random/|\
> > > > > > +/drivers/char/tpm/|\
> > > > > > +/drivers/char/|\
> > > > > > +/drivers/crypto/|\
> > > > > > +/drivers/dax/|\
> > > > > > +/drivers/firmware/arm_scmi/|\
> > > > > > +/drivers/gpu/drm/|\
> > > > > > +/drivers/md/|\
> > > > > > +/drivers/mmc/|\
> > > > > > +/drivers/mtd/|\
> > > > > > +/drivers/nvdimm/|\
> > > > > > +/drivers/nvme/|\
> > > > > > +/drivers/pci/|\
> > > > > > +/drivers/scsi/|\
> > > > > > +/drivers/tee/|\
> > > > > > +/drivers/tty/serial/|\
> > > > > > +/drivers/virtio/|\
> > > > > > +/drivers/watchdog/|\
> > > > > > +/kernel/arch/|\
> > > > > > +/kernel/block/|\
> > > > > > +/kernel/crypto/|\
> > > > > > +/kernel/fs/|\
> > > > > > +/kernel/lib/\
> > > > > > +)(.*)"
> > > > > > +
> > > > > > +FILES:${PN}-initrd = ""
> > > > > > +ALLOW_EMPTY:${PN}-initrd = "1"
> > > > >
> > > > > What is the difference between the variable defined in kernel-module-
> > > > > split.bbclass and this one in module.bbclass? Do we need/want to
> > > > > separate but seemingly similar definitions?
> > > >
> > > > One is for kernel compilation and in-tree drivers, the other is for
> > > > out-of-tree modules.
> > > >
> > > > The "kernel-modules" meta package is handled this way too, with
> > > > duplication in both.
> > > >
> > > > Bruce says this should be moved to linux-yocto kernel recipe,
> > > > which IMO breaks the use of kernel-initrd-modules for vendor kernel
> > recipes
> > > > outside of oe-core. I'd rather support them too to e.g. more easily
> > boot
> > > > qemu or run oeqa selftests with qemu.
> > > >
> > >
> > > That's not quite what I said (but it is close), I said it shouldn't be
> > > defined
> > > at the base with no requirement opt-in from a recipe (even if this way
> > > of constructing an initrd with the modules is not the default). It is a (
> > > weak)
> > > binding to specific kernel versions and directory layouts, but it is a
> > > binding
> > > none the less. If it sits at the base in the classes no one will ever
> > look
> > > at
> > > it or even know that it should be considered.
> > >
> > > My suggestion was not that it should only be in linux-yocto (but I'd
> > > insist on overriding it or doing it slightly differently in linux-yocto),
> > > I was saying that it I think  that the two definitions are far to similar
> > > and even if there remain two definitions, they should be moved
> > > into a .inc file.
> >
> > Actually the duplication is a bug. All duplication in module.bbclass can be
> > removed since it includes kernel-module-split.bbclass. Both kernel.bbclass
> > and
> > module.bbclass include kernel-module-split.bbclass. Sorry about this.
> > I must have stopped half way when moving things there.
> >
> > Sending v4 with this fixed soon.
> >
> > > Any kernel recipe that wants to build an initrd like this can opt-in by
> > > including the .inc, and/or creating their own definition.
> >
> > This I don't get. I think the kernel.bbclass and module.bbclass should
> > work out of the box with sane defaults. The kernel recipes can override
> > and adjust these as they see fit. Yes there is a dependency to some kernel
> > APIs (kernel module install paths) which can change, but those have been
> > stable for, over 25 years (as long as I have been compiling kernels)?
> >
> > For full control, initrd recipe maintainers can define the exact set
> > of kernel and other binary packages to install which makes the recipe
> > kernel config and machine specific.
> >
> > I don't think moving the definitions to a linux-yocto side .inc file
> > and then using that as basis in non-core kernel recipes is good. The
> > kernel.bbclass and module.bbclass would not work independently anymore
> > and require meta/recipes-kernel/linux/ side .inc file for working defaults.
> > Or should the .inc file live in meta/conf/distro/include?
> >
> 
> Let me be clear. I am not saying "linux-yocto" here. I said a ".inc" file.
> 
> Put that .inc file in a common directory and call it something like
> initrd-kernel-<foo>.inc, recipes include that .inc file to opt into the
> behaviour and get the base definition if they want it.

Ok I will do this in v5.
 
> This modular based initrd isn't going to be the default, so it has
> to be opt-in anyway. So put the opt-in and the definitions in a .inc
> file, a recipe including it, opts-in.

I think this should be the default on most machines which use
core-image-initramfs-boot in oe-core.

genericarm64, beagleplay etc machines already for install of "kernel-modules"
to all images, including core-image-initramfs-boot:

$ git grep MACHINE_EXTRA_RRECOMMENDS meta/conf/machine meta-yocto-bsp/conf/machine/ | grep kernel-modules
meta-yocto-bsp/conf/machine/beaglebone-yocto.conf:MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
meta-yocto-bsp/conf/machine/genericarm64.conf:MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
meta-yocto-bsp/conf/machine/include/genericx86-common.inc:MACHINE_EXTRA_RRECOMMENDS += "kernel-modules linux-firmware"
meta/conf/machine/include/loongarch/qemuloongarch.inc:MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
meta/conf/machine/include/riscv/qemuriscv.inc:MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
meta/conf/machine/qemuppc64.conf:MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"

Some qemu machines don't and that causes issues since
initrd is not flexible to boot even slightly different configurations,
like block device emulation moved from scsi to virtio.
This causes issues with oeqa selftests when small kernel or qemuboot
differences break tests.

initrd itself is optional, but in core-image-initramfs-boot I made
including "kernel-initrd-modules" the default. To me this makes sense.

Kernels for different machines can enable drivers as modules or as built-in
but the initrd config stays the same and will mostly just work. I think
this is a good default.

And then "kernel-initrd-modules" are much smaller than "kernel-modules".
Still too big for real products but better than nothing. For
genericarm64 this reduced initrd image size from 200 Mb to 54 Mb.

> I don't like the directory listings at all, but that's the best way to
> not hide them and again, you can't get a general enough set of
> definitions in a base class to serve all possible use cases. It needs
> to come from top down.

Yes, improvements welcome. At least this doesn't break when drivers
change from built-in or as modules and new features added to linux-yocto
configs don't bloat the kernel so much anymore. Like the pmem patches
which just got in. They work as modules.

Cheers,

-Mikko

