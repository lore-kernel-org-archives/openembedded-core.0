Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB397C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 12:52:40 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.25077.1744375956892900332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 05:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1xnPKqT;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b602d2ffso2100130a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744375956; x=1744980756; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PE3b7YFp03XTTU0gTjIRqksPW7DPqd2bVgaJK/XWF+Q=;
        b=i1xnPKqTByeImgzgW9GEvxg0HYo5XJRh9VSH2gYfgplPp91KIf6oMzOHIsX4A36y+N
         h3mfAdwgVWK4CcPSl0zrF35eiIRFZlchludSSOfP5sYJ4zvhJ9jiLn0tKKW7xfXA2qrM
         DYY5moe4zljWbpNTemscP3PzCT9cHmO0sTPNyBq5PzjCB3GIMXzRwkMUUz8Vl89fc4+q
         pwu5eBHbR2vzqVO7wGild++f+OKjZk11/22NQp6ockFsHRABFYcp4tp2wB6KDroEbEwS
         PkLT/ozwRQl7aexOYi+Tyj7tDn/D5WPxfMFrLFOf31vuI2K7AdulP8FHXefWsSH8ftI4
         0tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375956; x=1744980756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PE3b7YFp03XTTU0gTjIRqksPW7DPqd2bVgaJK/XWF+Q=;
        b=ShGocO0ssY8K/efXNX56h0E0hL02n/GXQNx8xKGBNBfgCbXlYTmBn7Trg8G7lu2Hpg
         b8pP78QtP3saEaX+SlVWwv6EKBG24qQ5yb+8JEfUJmBnCVjWG1QsvLnviJwZfrCcQbhV
         zGQsAfgsMWnlDQa2mxl56haOVbufNgsoVpXvcHwx4fEKAHwBSV9p+WVIlLl+i6ySAfZ9
         n7iMiD1HbhsMBzIn1ZDd78EoXU8psnIyOZOFScJV4LPFI9NJXmKFmXoDNxGrGMxtq5D6
         KKE4lG0Mol8kQ5ZSCx6hwAK7wwdHPjHXD4oYAJ6HPfCc1SA4+Y32esgG5G+NAFPZtu7h
         rxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9iSeFwatllUOyks00RzN1wvifz+skMz9m3lThmq84FmxIyhNYlW3A/WgI2mgrUoGog4iDB73MFAEgwYLC3LYk2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyoEv8ZrATex/H750CLL4HLZSEZEDWm2nsbT367ZoYP7trmJf5Z
	gmckEQrDLUheWIq4c9GLv0S5wZekm7lY7f+5DBeJhszl4Ex4M0zFohkyuRMJQCojuQUx0Lu51FE
	ppdpNgzh9xiKyMnkK9VN7crI6dNg=
X-Gm-Gg: ASbGncuKQrMAI6VH//ZXC5Pjj/GiJPDCfoGqM5fQcAZ+XEc4EIltoYZAy4dvHx5uId7
	oBa+0EVmTx77mUwEuTGnDaw09aSLNCfWB2oUyr0Xrl6JxpXzJ1GI9mC8ZdkuPOQsZqxiuJhm2tv
	Rv4QLvu7/Dgg6R2YNvrlWr9yNAtoUT4+9xBA==
X-Google-Smtp-Source: AGHT+IFUWHf6UK7oPLKpvcua5LxJ9cVPTwtuHb7TXByMaw+cs67IORcbF5MQHPlZzXRq1lD5C749WFhT8uaQhtCLm68=
X-Received: by 2002:a17:90b:1f91:b0:301:98fc:9b5a with SMTP id
 98e67ed59e1d1-3082362476amr4171627a91.6.1744375956076; Fri, 11 Apr 2025
 05:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org> <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <Z_fBAsbV-hY-x_SC@nuoska> <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
 <Z_jJX05RuRTcFf4P@nuoska>
In-Reply-To: <Z_jJX05RuRTcFf4P@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Apr 2025 08:52:24 -0400
X-Gm-Features: ATxdqUH5Mzx3PcVbjwMwaeJyqzSyui135HbybBFHTAqJxpaldsZrRoDMA-RMsxA
Message-ID: <CADkTA4MWWtMXdRhvmdXhoS38SVpqXUz=p5G5H1i820QaV4CR0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003783590632802d38"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 12:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214738

--0000000000003783590632802d38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 3:48=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:
> > On Thu, Apr 10, 2025 at 9:00=E2=80=AFAM Mikko Rapeli via lists.openembe=
dded.org
> > <mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> >
> > > On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> > > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > lists.openembedded.org wrote:
> > > > > At the moment linux-yocto kernels for various architectures
> > > > > are not very modular and a lot of drivers are built into the kern=
el
> > > > > even when they are not needed at runtime. These make the main
> kernel
> > > > > binary big and slow to boot. This also impacts udev in userspace
> > > > > which takes a long time processing events from all these built in
> > > drivers,
> > > > > for example when udev runs in initrd.
> > > > >
> > > > > Then constructing the initrd is very device and kernel
> configuration
> > > specific.
> > > > > initrd image needs explicitly define which binary packages to
> install
> > > > > to avoid pulling in complex dependencies. A full set of kernel
> modules
> > > > > via kernel-modules meta package is too big for initrd and most of
> the
> > > > > drivers are not needed for use cases like "just load modules to
> mount
> > > > > main rootfs". Then the initrd configuration breaks if kernel driv=
er
> > > > > is built into the kernel since the binary package doesn't exist.
> > > > >
> > > > > Introduce kernel-initrd-modules meta package to solve these
> problems.
> > > > > The meta package adds dependencies to real kernel modules based o=
n
> > > > > the kernel module file paths so that it will include several
> > > > > kernel subsystems and their drivers which are often needed to fin=
d
> > > > > main rootfs from some block device. This works when drivers are
> built
> > > > > as modules but does not break if drivers are built into the kerne=
l.
> > > > >
> > > > > The resulting initrd is also smaller since only a subset of drive=
rs
> > > > > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > > > > kernel and qemu and AMD KV260 HW.
> > > > >
> > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > ---
> > > > >  .../kernel-module-split.bbclass               | 48
> +++++++++++++++++++
> > > > >  meta/classes-recipe/kernel.bbclass            |  5 +-
> > > > >  meta/classes-recipe/module.bbclass            | 37 +++++++++++++=
+
> > > > >  3 files changed, 89 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> > > b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > index 9487365eb7..101c5cd959 100644
> > > > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> > > > >  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> > > > >  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> > > > >
> > > > > +# subset of kernel modules needed in initrd, to e.g. mount rootf=
s
> > > from block device
> > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > +
> > > > > +# match regex to path or file name. E.g. include all drivers wit=
h
> > > files in path /drivers/ata/
> > > > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > > > +/drivers/acpi/|\
> > > > > +/drivers/ata/|\
> > > > > +/drivers/block/|\
> > > > > +/drivers/cdrom/|\
> > > > > +/drivers/char/hw_random/|\
> > > > > +/drivers/char/tpm/|\
> > > > > +/drivers/char/|\
> > > > > +/drivers/crypto/|\
> > > > > +/drivers/dax/|\
> > > > > +/drivers/firmware/arm_scmi/|\
> > > > > +/drivers/gpu/drm/|\
> > > > > +/drivers/md/|\
> > > > > +/drivers/mmc/|\
> > > > > +/drivers/mtd/|\
> > > > > +/drivers/nvdimm/|\
> > > > > +/drivers/nvme/|\
> > > > > +/drivers/pci/|\
> > > > > +/drivers/scsi/|\
> > > > > +/drivers/tee/|\
> > > > > +/drivers/tty/serial/|\
> > > > > +/drivers/virtio/|\
> > > > > +/drivers/watchdog/|\
> > > > > +/kernel/arch/|\
> > > > > +/kernel/block/|\
> > > > > +/kernel/crypto/|\
> > > > > +/kernel/fs/|\
> > > > > +/kernel/lib/\
> > > > > +)(.*)"
> > > > > +
> > > > >  python split_kernel_module_packages () {
> > > > >      import re
> > > > >
> > > > > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > > > >      modules =3D do_split_packages(d,
> > > root=3D'${nonarch_base_libdir}/modules', file_regex=3Dmodule_regex,
> > > output_pattern=3Dmodule_pattern, description=3D'%s kernel module',
> > > postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_m=
etadata,
> > > extra_depends=3D'%s-%s' % (kernel_package_name, kernel_version))
> > > > >      if modules:
> > > > >          d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules)=
)
> > > > > +
> > > > > +    initrd_metapkg =3D
> d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE')
> > > or ""
> > > > > +    initrd_module_regex =3D d.getVar('KERNEL_INITRD_MODULES_REGE=
X')
> or
> > > ""
> > > > > +    if (initrd_metapkg !=3D "") and (initrd_module_regex !=3D ""=
):
> > > > > +        initrd_module_regex =3D re.compile(initrd_module_regex)
> > > > > +        initrd_modules =3D []
> > > > > +        for module in modules:
> > > > > +            files =3D d.getVar('FILES:' + module)
> > > > > +            m =3D re.match(initrd_module_regex, files)
> > > > > +            if m:
> > > > > +                initrd_modules.append(module)
> > > > > +
> > > > > +        if initrd_modules:
> > > > > +            d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+'
> > > '.join(initrd_modules))
> > > > >  }
> > > > >
> > > > >  do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf=
_"
> + s,
> > > (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > > > diff --git a/meta/classes-recipe/kernel.bbclass
> > > b/meta/classes-recipe/kernel.bbclass
> > > > > index 36ce659762..3dcaebcaed 100644
> > > > > --- a/meta/classes-recipe/kernel.bbclass
> > > > > +++ b/meta/classes-recipe/kernel.bbclass
> > > > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile
> do_transform_kernel
> > > do_transform_bundled_initramfs d
> > > > >
> > > > >  # kernel-base becomes kernel-${KERNEL_VERSION}
> > > > >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > > > -PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > ${KERNEL_PACKAGE_NAME}-dbg"
> > > > > +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base
> > > ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image
> > > ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules
> > > ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > > > >  FILES:${PN} =3D ""
> > > > >  FILES:${KERNEL_PACKAGE_NAME}-base =3D
> > > "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order
> > > ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin
> > >
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > > > >  FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
> > > > >  FILES:${KERNEL_PACKAGE_NAME}-dev =3D
> "/${KERNEL_IMAGEDEST}/System.map*
> > > /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*
> > > ${KERNEL_SRC_PATH}
> ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > > >  FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D
> > > "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > > > >  FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> > > > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D ""
> > > > >  FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug /usr/src/de=
bug"
> > > > >  RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base=
 (=3D
> > > ${EXTENDPKGV})"
> > > > >  # Allow machines to override this dependency if kernel image
> files are
> > > > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
> > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
> > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
> > > > >  ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D "1"
> > > > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "1"
> > > > >  DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules m=
eta
> > > package"
> > > > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "Kernel in=
itrd
> > > modules meta package"
> > > > >
> > > > >  pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > > > >     if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > > > diff --git a/meta/classes-recipe/module.bbclass
> > > b/meta/classes-recipe/module.bbclass
> > > > > index f2f0b25a2d..51f864f1f9 100644
> > > > > --- a/meta/classes-recipe/module.bbclass
> > > > > +++ b/meta/classes-recipe/module.bbclass
> > > > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > > > >  KERNEL_MODULES_META_PACKAGE =3D "${PN}"
> > > > >  FILES:${PN} =3D ""
> > > > >  ALLOW_EMPTY:${PN} =3D "1"
> > > > > +
> > > > > +# subset of kernel modules needed in initrd, to e.g. mount rootf=
s
> > > from block device
> > > > > +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@
> > > d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > > > +
> > > > > +# match regex to path or file name. E.g. include all drivers wit=
h
> > > files in path /drivers/ata/
> > > > > +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> > > > > +/drivers/acpi/|\
> > > > > +/drivers/ata/|\
> > > > > +/drivers/block/|\
> > > > > +/drivers/cdrom/|\
> > > > > +/drivers/char/hw_random/|\
> > > > > +/drivers/char/tpm/|\
> > > > > +/drivers/char/|\
> > > > > +/drivers/crypto/|\
> > > > > +/drivers/dax/|\
> > > > > +/drivers/firmware/arm_scmi/|\
> > > > > +/drivers/gpu/drm/|\
> > > > > +/drivers/md/|\
> > > > > +/drivers/mmc/|\
> > > > > +/drivers/mtd/|\
> > > > > +/drivers/nvdimm/|\
> > > > > +/drivers/nvme/|\
> > > > > +/drivers/pci/|\
> > > > > +/drivers/scsi/|\
> > > > > +/drivers/tee/|\
> > > > > +/drivers/tty/serial/|\
> > > > > +/drivers/virtio/|\
> > > > > +/drivers/watchdog/|\
> > > > > +/kernel/arch/|\
> > > > > +/kernel/block/|\
> > > > > +/kernel/crypto/|\
> > > > > +/kernel/fs/|\
> > > > > +/kernel/lib/\
> > > > > +)(.*)"
> > > > > +
> > > > > +FILES:${PN}-initrd =3D ""
> > > > > +ALLOW_EMPTY:${PN}-initrd =3D "1"
> > > >
> > > > What is the difference between the variable defined in kernel-modul=
e-
> > > > split.bbclass and this one in module.bbclass? Do we need/want to
> > > > separate but seemingly similar definitions?
> > >
> > > One is for kernel compilation and in-tree drivers, the other is for
> > > out-of-tree modules.
> > >
> > > The "kernel-modules" meta package is handled this way too, with
> > > duplication in both.
> > >
> > > Bruce says this should be moved to linux-yocto kernel recipe,
> > > which IMO breaks the use of kernel-initrd-modules for vendor kernel
> recipes
> > > outside of oe-core. I'd rather support them too to e.g. more easily
> boot
> > > qemu or run oeqa selftests with qemu.
> > >
> >
> > That's not quite what I said (but it is close), I said it shouldn't be
> > defined
> > at the base with no requirement opt-in from a recipe (even if this way
> > of constructing an initrd with the modules is not the default). It is a=
 (
> > weak)
> > binding to specific kernel versions and directory layouts, but it is a
> > binding
> > none the less. If it sits at the base in the classes no one will ever
> look
> > at
> > it or even know that it should be considered.
> >
> > My suggestion was not that it should only be in linux-yocto (but I'd
> > insist on overriding it or doing it slightly differently in linux-yocto=
),
> > I was saying that it I think  that the two definitions are far to simil=
ar
> > and even if there remain two definitions, they should be moved
> > into a .inc file.
>
> Actually the duplication is a bug. All duplication in module.bbclass can =
be
> removed since it includes kernel-module-split.bbclass. Both kernel.bbclas=
s
> and
> module.bbclass include kernel-module-split.bbclass. Sorry about this.
> I must have stopped half way when moving things there.
>
> Sending v4 with this fixed soon.
>
> > Any kernel recipe that wants to build an initrd like this can opt-in by
> > including the .inc, and/or creating their own definition.
>
> This I don't get. I think the kernel.bbclass and module.bbclass should
> work out of the box with sane defaults. The kernel recipes can override
> and adjust these as they see fit. Yes there is a dependency to some kerne=
l
> APIs (kernel module install paths) which can change, but those have been
> stable for, over 25 years (as long as I have been compiling kernels)?
>
> For full control, initrd recipe maintainers can define the exact set
> of kernel and other binary packages to install which makes the recipe
> kernel config and machine specific.
>
> I don't think moving the definitions to a linux-yocto side .inc file
> and then using that as basis in non-core kernel recipes is good. The
> kernel.bbclass and module.bbclass would not work independently anymore
> and require meta/recipes-kernel/linux/ side .inc file for working default=
s.
> Or should the .inc file live in meta/conf/distro/include?
>

Let me be clear. I am not saying "linux-yocto" here. I said a ".inc" file.

Put that .inc file in a common directory and call it something like
initrd-kernel-<foo>.inc, recipes include that .inc file to opt into the
behaviour and get the base definition if they want it.

This modular based initrd isn't going to be the default, so it has
to be opt-in anyway. So put the opt-in and the definitions in a .inc
file, a recipe including it, opts-in.

I don't like the directory listings at all, but that's the best way to
not hide them and again, you can't get a general enough set of
definitions in a base class to serve all possible use cases. It needs
to come from top down.

Bruce



>
> I think the defaults belong to kernel-module-split.bbclass used by both
> kernel and modules bbclasses.
>
> Cheers,
>
> -Mikko
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003783590632802d38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 11, 2025 at 3:48=
=E2=80=AFAM Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mik=
ko.rapeli@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi,<br>
<br>
On Thu, Apr 10, 2025 at 09:15:02AM -0400, Bruce Ashfield wrote:<br>
&gt; On Thu, Apr 10, 2025 at 9:00=E2=80=AFAM Mikko Rapeli via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&gt; &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openembedded.org=
" target=3D"_blank">linaro.org@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:<b=
r>
&gt; &gt; &gt; On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; At the moment linux-yocto kernels for various architect=
ures<br>
&gt; &gt; &gt; &gt; are not very modular and a lot of drivers are built int=
o the kernel<br>
&gt; &gt; &gt; &gt; even when they are not needed at runtime. These make th=
e main kernel<br>
&gt; &gt; &gt; &gt; binary big and slow to boot. This also impacts udev in =
userspace<br>
&gt; &gt; &gt; &gt; which takes a long time processing events from all thes=
e built in<br>
&gt; &gt; drivers,<br>
&gt; &gt; &gt; &gt; for example when udev runs in initrd.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Then constructing the initrd is very device and kernel =
configuration<br>
&gt; &gt; specific.<br>
&gt; &gt; &gt; &gt; initrd image needs explicitly define which binary packa=
ges to install<br>
&gt; &gt; &gt; &gt; to avoid pulling in complex dependencies. A full set of=
 kernel modules<br>
&gt; &gt; &gt; &gt; via kernel-modules meta package is too big for initrd a=
nd most of the<br>
&gt; &gt; &gt; &gt; drivers are not needed for use cases like &quot;just lo=
ad modules to mount<br>
&gt; &gt; &gt; &gt; main rootfs&quot;. Then the initrd configuration breaks=
 if kernel driver<br>
&gt; &gt; &gt; &gt; is built into the kernel since the binary package doesn=
&#39;t exist.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Introduce kernel-initrd-modules meta package to solve t=
hese problems.<br>
&gt; &gt; &gt; &gt; The meta package adds dependencies to real kernel modul=
es based on<br>
&gt; &gt; &gt; &gt; the kernel module file paths so that it will include se=
veral<br>
&gt; &gt; &gt; &gt; kernel subsystems and their drivers which are often nee=
ded to find<br>
&gt; &gt; &gt; &gt; main rootfs from some block device. This works when dri=
vers are built<br>
&gt; &gt; &gt; &gt; as modules but does not break if drivers are built into=
 the kernel.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The resulting initrd is also smaller since only a subse=
t of drivers<br>
&gt; &gt; &gt; &gt; are needed for &quot;mount the rootfs&quot; usecase. Te=
sted on genericarm64<br>
&gt; &gt; &gt; &gt; kernel and qemu and AMD KV260 HW.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko=
.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 .../kernel-module-split.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 48 +++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 meta/classes-recipe/module.bbclass=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 37 ++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 3 files changed, 89 insertions(+), 1 deletion(-)<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/kernel-module-split.bb=
class<br>
&gt; &gt; b/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; &gt; &gt; &gt; index 9487365eb7..101c5cd959 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/classes-recipe/kernel-module-split.bbclass<b=
r>
&gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/kernel-module-split.bbclass<b=
r>
&gt; &gt; &gt; &gt; @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D &q=
uot;&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL=
_VERSION}&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +# subset of kernel modules needed in initrd, to e.g. m=
ount rootfs<br>
&gt; &gt; from block device<br>
&gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quot;${@<br>
&gt; &gt; d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) or &quot;kernel&quot; }=
-initrd-modules&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +# match regex to path or file name. E.g. include all d=
rivers with<br>
&gt; &gt; files in path /drivers/ata/<br>
&gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(\<br>
&gt; &gt; &gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; &gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; &gt; &gt; +/drivers/block/|\<br>
&gt; &gt; &gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; &gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; &gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; &gt; &gt; +/drivers/char/|\<br>
&gt; &gt; &gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; &gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; &gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; &gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; &gt; &gt; +/drivers/md/|\<br>
&gt; &gt; &gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; &gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; &gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; &gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; &gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; &gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; &gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; &gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; &gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; &gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; &gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; &gt; &gt; +/kernel/block/|\<br>
&gt; &gt; &gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; &gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; &gt; &gt; +/kernel/lib/\<br>
&gt; &gt; &gt; &gt; +)(.*)&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 python split_kernel_module_packages () {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 import re<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -183,6 +217,20 @@ python split_kernel_module_package=
s () {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 modules =3D do_split_packages(d,<br=
>
&gt; &gt; root=3D&#39;${nonarch_base_libdir}/modules&#39;, file_regex=3Dmod=
ule_regex,<br>
&gt; &gt; output_pattern=3Dmodule_pattern, description=3D&#39;%s kernel mod=
ule&#39;,<br>
&gt; &gt; postinst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfr=
ob_metadata,<br>
&gt; &gt; extra_depends=3D&#39;%s-%s&#39; % (kernel_package_name, kernel_ve=
rsion))<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 if modules:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEP=
ENDS:&#39; + metapkg, &#39; &#39;+&#39; &#39;.join(modules))<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 initrd_metapkg =3D d.getVar(&#39;KERNEL_=
INITRD_MODULES_META_PACKAGE&#39;)<br>
&gt; &gt; or &quot;&quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 initrd_module_regex =3D d.getVar(&#39;KE=
RNEL_INITRD_MODULES_REGEX&#39;) or<br>
&gt; &gt; &quot;&quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (initrd_metapkg !=3D &quot;&quot;) an=
d (initrd_module_regex !=3D &quot;&quot;):<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_module_regex =3D re=
.compile(initrd_module_regex)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_modules =3D []<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for module in modules:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 files =3D d.=
getVar(&#39;FILES:&#39; + module)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.mat=
ch(initrd_module_regex, files)<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 initrd_modules.append(module)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if initrd_modules:<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(=
&#39;RDEPENDS:&#39; + initrd_metapkg, &#39; &#39;+&#39;<br>
&gt; &gt; &#39;.join(initrd_modules))<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 do_package[vardeps] +=3D &#39;${@&quot; &quot;.jo=
in(map(lambda s: &quot;module_conf_&quot; + s,<br>
&gt; &gt; (d.getVar(&quot;KERNEL_MODULE_PROBECONF&quot;) or &quot;&quot;).s=
plit()))}&#39;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; &gt; &gt; index 36ce659762..3dcaebcaed 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; &gt; &gt; &gt; @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_tr=
ansform_kernel<br>
&gt; &gt; do_transform_bundled_initramfs d<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 # kernel-base becomes kernel-${KERNEL_VERSION}<br=
>
&gt; &gt; &gt; &gt;=C2=A0 # kernel-image becomes kernel-image-${KERNEL_VERS=
ION}<br>
&gt; &gt; &gt; &gt; -PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PAC=
KAGE_NAME}-base<br>
&gt; &gt; ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image<br>
&gt; &gt; ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules<br>
&gt; &gt; ${KERNEL_PACKAGE_NAME}-dbg&quot;<br>
&gt; &gt; &gt; &gt; +PACKAGES =3D &quot;${KERNEL_PACKAGE_NAME} ${KERNEL_PAC=
KAGE_NAME}-base<br>
&gt; &gt; ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image<br>
&gt; &gt; ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules<br>
&gt; &gt; ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg&=
quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${PN} =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-base =3D<br>
&gt; &gt; &quot;${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.or=
der<br>
&gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin<=
br>
&gt; &gt; ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.=
modinfo&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-image =3D &quot;&quo=
t;<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-dev =3D &quot;/${KER=
NEL_IMAGEDEST}/System.map*<br>
&gt; &gt; /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config*=
<br>
&gt; &gt; ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSIO=
N}/build&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D<br>
&gt; &gt; &quot;/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}&quot;<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-modules =3D &quot;&q=
uot;<br>
&gt; &gt; &gt; &gt; +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D &quot;=
&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${KERNEL_PACKAGE_NAME}-dbg =3D &quot;/usr/l=
ib/debug /usr/src/debug&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 RDEPENDS:${KERNEL_PACKAGE_NAME} =3D &quot;${KERNE=
L_PACKAGE_NAME}-base (=3D<br>
&gt; &gt; ${EXTENDPKGV})&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 # Allow machines to override this dependency if k=
ernel image files are<br>
&gt; &gt; &gt; &gt; @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =
=3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D &quot=
;1&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D &quo=
t;1&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D &q=
uot;1&quot;<br>
&gt; &gt; &gt; &gt; +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D =
&quot;1&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D &q=
uot;Kernel modules meta<br>
&gt; &gt; package&quot;<br>
&gt; &gt; &gt; &gt; +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D =
&quot;Kernel initrd<br>
&gt; &gt; modules meta package&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;$D/lib/modules/${KER=
NEL_VERSION}&quot; ]; then<br>
&gt; &gt; &gt; &gt; diff --git a/meta/classes-recipe/module.bbclass<br>
&gt; &gt; b/meta/classes-recipe/module.bbclass<br>
&gt; &gt; &gt; &gt; index f2f0b25a2d..51f864f1f9 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/classes-recipe/module.bbclass<br>
&gt; &gt; &gt; &gt; +++ b/meta/classes-recipe/module.bbclass<br>
&gt; &gt; &gt; &gt; @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_insta=
ll<br>
&gt; &gt; &gt; &gt;=C2=A0 KERNEL_MODULES_META_PACKAGE =3D &quot;${PN}&quot;=
<br>
&gt; &gt; &gt; &gt;=C2=A0 FILES:${PN} =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt;=C2=A0 ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +# subset of kernel modules needed in initrd, to e.g. m=
ount rootfs<br>
&gt; &gt; from block device<br>
&gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D &quot;${@<br>
&gt; &gt; d.getVar(&quot;KERNEL_PACKAGE_NAME&quot;) or &quot;kernel&quot; }=
-initrd-modules&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +# match regex to path or file name. E.g. include all d=
rivers with<br>
&gt; &gt; files in path /drivers/ata/<br>
&gt; &gt; &gt; &gt; +KERNEL_INITRD_MODULES_REGEX ?=3D &quot;(.*)(\<br>
&gt; &gt; &gt; &gt; +/drivers/acpi/|\<br>
&gt; &gt; &gt; &gt; +/drivers/ata/|\<br>
&gt; &gt; &gt; &gt; +/drivers/block/|\<br>
&gt; &gt; &gt; &gt; +/drivers/cdrom/|\<br>
&gt; &gt; &gt; &gt; +/drivers/char/hw_random/|\<br>
&gt; &gt; &gt; &gt; +/drivers/char/tpm/|\<br>
&gt; &gt; &gt; &gt; +/drivers/char/|\<br>
&gt; &gt; &gt; &gt; +/drivers/crypto/|\<br>
&gt; &gt; &gt; &gt; +/drivers/dax/|\<br>
&gt; &gt; &gt; &gt; +/drivers/firmware/arm_scmi/|\<br>
&gt; &gt; &gt; &gt; +/drivers/gpu/drm/|\<br>
&gt; &gt; &gt; &gt; +/drivers/md/|\<br>
&gt; &gt; &gt; &gt; +/drivers/mmc/|\<br>
&gt; &gt; &gt; &gt; +/drivers/mtd/|\<br>
&gt; &gt; &gt; &gt; +/drivers/nvdimm/|\<br>
&gt; &gt; &gt; &gt; +/drivers/nvme/|\<br>
&gt; &gt; &gt; &gt; +/drivers/pci/|\<br>
&gt; &gt; &gt; &gt; +/drivers/scsi/|\<br>
&gt; &gt; &gt; &gt; +/drivers/tee/|\<br>
&gt; &gt; &gt; &gt; +/drivers/tty/serial/|\<br>
&gt; &gt; &gt; &gt; +/drivers/virtio/|\<br>
&gt; &gt; &gt; &gt; +/drivers/watchdog/|\<br>
&gt; &gt; &gt; &gt; +/kernel/arch/|\<br>
&gt; &gt; &gt; &gt; +/kernel/block/|\<br>
&gt; &gt; &gt; &gt; +/kernel/crypto/|\<br>
&gt; &gt; &gt; &gt; +/kernel/fs/|\<br>
&gt; &gt; &gt; &gt; +/kernel/lib/\<br>
&gt; &gt; &gt; &gt; +)(.*)&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +FILES:${PN}-initrd =3D &quot;&quot;<br>
&gt; &gt; &gt; &gt; +ALLOW_EMPTY:${PN}-initrd =3D &quot;1&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What is the difference between the variable defined in kerne=
l-module-<br>
&gt; &gt; &gt; split.bbclass and this one in module.bbclass? Do we need/wan=
t to<br>
&gt; &gt; &gt; separate but seemingly similar definitions?<br>
&gt; &gt;<br>
&gt; &gt; One is for kernel compilation and in-tree drivers, the other is f=
or<br>
&gt; &gt; out-of-tree modules.<br>
&gt; &gt;<br>
&gt; &gt; The &quot;kernel-modules&quot; meta package is handled this way t=
oo, with<br>
&gt; &gt; duplication in both.<br>
&gt; &gt;<br>
&gt; &gt; Bruce says this should be moved to linux-yocto kernel recipe,<br>
&gt; &gt; which IMO breaks the use of kernel-initrd-modules for vendor kern=
el recipes<br>
&gt; &gt; outside of oe-core. I&#39;d rather support them too to e.g. more =
easily boot<br>
&gt; &gt; qemu or run oeqa selftests with qemu.<br>
&gt; &gt;<br>
&gt; <br>
&gt; That&#39;s not quite what I said (but it is close), I said it shouldn&=
#39;t be<br>
&gt; defined<br>
&gt; at the base with no requirement opt-in from a recipe (even if this way=
<br>
&gt; of constructing an initrd with the modules is not the default). It is =
a (<br>
&gt; weak)<br>
&gt; binding to specific kernel versions and directory layouts, but it is a=
<br>
&gt; binding<br>
&gt; none the less. If it sits at the base in the classes no one will ever =
look<br>
&gt; at<br>
&gt; it or even know that it should be considered.<br>
&gt; <br>
&gt; My suggestion was not that it should only be in linux-yocto (but I&#39=
;d<br>
&gt; insist on overriding it or doing it slightly differently in linux-yoct=
o),<br>
&gt; I was saying that it I think=C2=A0 that the two definitions are far to=
 similar<br>
&gt; and even if there remain two definitions, they should be moved<br>
&gt; into a .inc file.<br>
<br>
Actually the duplication is a bug. All duplication in module.bbclass can be=
<br>
removed since it includes kernel-module-split.bbclass. Both kernel.bbclass =
and<br>
module.bbclass include kernel-module-split.bbclass. Sorry about this.<br>
I must have stopped half way when moving things there.<br>
<br>
Sending v4 with this fixed soon.<br>
<br>
&gt; Any kernel recipe that wants to build an initrd like this can opt-in b=
y<br>
&gt; including the .inc, and/or creating their own definition.<br>
<br>
This I don&#39;t get. I think the kernel.bbclass and module.bbclass should<=
br>
work out of the box with sane defaults. The kernel recipes can override<br>
and adjust these as they see fit. Yes there is a dependency to some kernel<=
br>
APIs (kernel module install paths) which can change, but those have been<br=
>
stable for, over 25 years (as long as I have been compiling kernels)?<br>
<br>
For full control, initrd recipe maintainers can define the exact set<br>
of kernel and other binary packages to install which makes the recipe<br>
kernel config and machine specific.<br>
<br>
I don&#39;t think moving the definitions to a linux-yocto side .inc file<br=
>
and then using that as basis in non-core kernel recipes is good. The<br>
kernel.bbclass and module.bbclass would not work independently anymore<br>
and require meta/recipes-kernel/linux/ side .inc file for working defaults.=
<br>
Or should the .inc file live in meta/conf/distro/include?<br></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">L=
et me be clear. I am not saying &quot;linux-yocto&quot; here. I said a &quo=
t;.inc&quot; file.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Put th=
at .inc file in a common directory and call it something like</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">initrd-kernel-&lt;foo&gt;.in=
c, recipes include that .inc file to opt into the</div><div class=3D"gmail_=
default" style=3D"font-size:small">behaviour and get the base definition if=
 they want it.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">This modul=
ar based initrd isn&#39;t going to be the default, so it has</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">to be opt-in anyway. So put t=
he opt-in and the definitions in a .inc</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">file, a recipe including it, opts-in.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">I don&#39;t like the directory listin=
gs at all, but that&#39;s the best way to</div><div class=3D"gmail_default"=
 style=3D"font-size:small">not hide them and again, you can&#39;t get a gen=
eral enough set of</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">definitions in a base class to serve all possible use cases. It needs</=
div><div class=3D"gmail_default" style=3D"font-size:small">to come from top=
 down.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I think the defaults belong to kernel-module-split.bbclass used by both<br>
kernel and modules bbclasses.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000003783590632802d38--

