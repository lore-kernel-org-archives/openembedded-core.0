Return-Path: <nathan@nathanrossi.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 656C06007A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 13:05:54 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id n12so26186811qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 05:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w2asnDU5a+i5eCuuqHR2R6XmJfQDl0aakshIyzf7rpE=;
	b=eO5nbqwdbdDTq5PnB0wCvRS1ndLchpZQsRb2xLb8ICFqoPE7ahMtJf34DtZsQbrGDW
	kHegh1pMn1PncvhaZhrBLZdfJBuhfllbwfbM6lBFj42AqU0oztQHFvHdpFgyZPbi/26Y
	QSlyaaVLEouR50KQhkyHpX6ahDdIXUDCDTQD9h+6yLCht270VFJvLMeprGE6/KSUDkvO
	kBz8q3+zQhJtkUyaaAzURO86fmlixQTjOApS/L/ud5YvD13MG8AMxrf+Ttm0K5H9EYIU
	DigBYhyez2ODQq8+IwsyCIxspCwak/g6L6HD/72pm6yrD/zMa+TOQygnoqwfxivBEZ+c
	TbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w2asnDU5a+i5eCuuqHR2R6XmJfQDl0aakshIyzf7rpE=;
	b=e93VcLS0VqmteJqZmOpkowHGaumYCqBptxoIAJDXK5g4IMshUPaZoKj12gLngb9JhN
	d4yrFkzQDiEUxOFbvpSsAcu8oPbUfbOA1t16w/iJk+uLU7oajCQIxcVcWRHcWztjCNiZ
	Cvt3nMEimh33/CLhoZhDBU16SRGjqBY7Kv+i1ByZ2CQvlVlOY5DkKCPJJ3UM7gOW2RkZ
	mshynfWgJpkY3EjBIbD+MTUVP0A4DX8r6NCLHP79QpVDWegJvAMnTT+mZNnJm8nYCYZd
	saWRaCqRvX3b8ZOEra9rC480PhJ3XEX7Mk5WgKCo3v43RVRQcf8jfV2YKnu8Ch4ezE+O
	HmBQ==
X-Gm-Message-State: AGRZ1gKqtji0yIIV24wnxZxd1BEuQ6ffaUvMlWSSyk+E3BeLluEoa1QY
	kjpBeI7GBnK5nezmVGYHk96FayvAnPksg9dSZPUZpA==
X-Google-Smtp-Source: AJdET5fad9+7DtlFf2kLqQenRIwV0Wa7EUQQ7PbnNnB3h+2TrLoaFmtaqEm1YIlAzaQXwb+Ea+mjGQwj8ii5qyqGSpI=
X-Received: by 2002:aed:3c7d:: with SMTP id u58mr4361194qte.198.1541682355067; 
	Thu, 08 Nov 2018 05:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20181107121602.13768-1-nathan@nathanrossi.com>
	<20181107121602.13768-2-nathan@nathanrossi.com>
	<CAAQYJAurMNXOeAh5Px8a5NqUBzc4PdcfL1KpfqUESjzdwO0gvw@mail.gmail.com>
In-Reply-To: <CAAQYJAurMNXOeAh5Px8a5NqUBzc4PdcfL1KpfqUESjzdwO0gvw@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Thu, 8 Nov 2018 23:05:43 +1000
Message-ID: <CA+aJhH2B11RMAw0cGnp4sF+eXnBOjd0A0XLyTb-te4FaYHS1FQ@mail.gmail.com>
To: andrea.adami@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] kernel-initramfs.bbclass: Handle built-in /dev/console dependence
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
X-List-Received-Date: Thu, 08 Nov 2018 13:05:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Nov 2018 at 23:32, Andrea Adami <andrea.adami@gmail.com> wrote:
>
> On Wed, Nov 7, 2018 at 1:16 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
> >
> > The kernel has two differing code paths when handling a built-in cpio
> > versus a cpio passed to the kernel from a boot loader. When the kernel
> > is booted with the built-in cpio it expects the /dev/console node to
> > exist and will panic if it does not exist.
> >
> >   Kernel panic - not syncing: /dev/console is missing or not a character device!
> >
> > When the cpio is passed to the kernel via a bootloader, this behaviour
> > is not observed.
> >
>
> Well, of course once booted you have devtmpfs or you have provided
> your devices-list.
> We fight since long with this early issues and I think this approach
> is wrong: there are more things needed, not only /dev/consoleI'd say
> the responsability to check for devtmpfs or recreate the devices is up
> to init manager of the image.

Ok, so I do not think my commit message was clear enough in this regard.

Firstly the kernel requires the /dev/console node before the init
process is started, but after it has unpacked the built-in ramfs and
after it has mounted the initrd (rd or ramfs). You can see the exact
call that attempts to open /dev/console here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/init/main.c?h=v4.20-rc1#n1154

The exact problem this change is solving is the fact that by embedding
a user source cpio into the kernel, the default kernel initramfs is
replaced. The default kernel ramfs contains /dev, /dev/console and
/root.

Also for reference when the kernel is built without
initramfs/BLK_DEV_INITRD support it will create this default rootfs
with an alternate initcall:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/init/noinitramfs.c?h=v4.20-rc1

So essentially the kernel is always expecting the rootfs to contain
this /dev/console node.

>
> We don't use busybox, just a single binary running as init: kexecboot
> will exactly do that, check and recreate devices if missing:
> http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb

This only solves the user space requirements for device nodes. Since
kexecboot or busybox will not be executed before the kernel tries to
open the /dev/console file.

>
> Please don't inject anything in the cpio, let the image-engineer decide.
>
> This poor image is regularly attacked by new changes filling the cpio
> with undesidered stuff:
> http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb

How does this image handle this /dev/console dependency? Is there
something I am missing with how it is built into the kernel, or with
how the kernel you are using is configured?

It appears the initramfs-framework images of oe-core solve this by
creating the node in the image itself.
http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb#n51
http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb#n15
http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb

Looking at the log of those files, it appears this might have been a
kernel version and/or architecture specific thing back in 2013...
http://git.openembedded.org/openembedded-core/commit/?id=0352841cd92f6316bcac092e2fff9d28c352b36b

>
> Maybe we are on the corner-case, size-contraints limit us to be within
> 1MiB, neverthless I think it is a good exercise to keep things small
> and clean ;)

I would also like to avoid this change if there is an alternative that
works better.

Thanks,
Nathan

>
> As for the previous patch touching initramfs, I hold my comments for
> the moment: let me first test it.
> Cheers
>
> Andrea
>
> > To resolve this issue, ensure any cpio that is built into the kernel is
> > prepared with a /dev/console node. This is done by appending to the
> > copied cpio of the INITRAMFS_IMAGE. In order to create the node to
> > append, the task must be executed with root permission (to run mknod).
> > As such this change creates and intermediate _prepare task between the
> > existing _bundle and _copy tasks.
> >
> > Note: The default/minimal initramfs that the kernel sources
> > gen_initramfs_list.sh generates contains this device node.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/usr/gen_initramfs_list.sh?h=master#n55
> >
> > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > ---
> >  meta/classes/kernel-initramfs.bbclass | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel-initramfs.bbclass b/meta/classes/kernel-initramfs.bbclass
> > index b23fb51495..135f4c8949 100644
> > --- a/meta/classes/kernel-initramfs.bbclass
> > +++ b/meta/classes/kernel-initramfs.bbclass
> > @@ -16,7 +16,8 @@ python __anonymous () {
> >      if image and bundle:
> >          # add all the tasks
> >          bb.build.addtask('do_initramfs_copy', 'do_initramfs_bundle', 'do_install', d)
> > -        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_copy', d)
> > +        bb.build.addtask('do_initramfs_prepare', 'do_initramfs_bundle', 'do_initramfs_copy', d)
> > +        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_prepare', d)
> >
> >          # make the do_initramfs_copy task depend on the image do_image_complete task
> >          d.appendVarFlag('do_initramfs_copy', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > @@ -67,6 +68,18 @@ do_initramfs_copy () {
> >      echo "Finished copy of initramfs into ./usr"
> >  }
> >
> > +do_initramfs_prepare[dirs] = "${B}"
> > +fakeroot do_initramfs_prepare () {
> > +    echo "Preparing initramfs by creating required /dev/ nodes"
> > +    # append a /dev/console node, this node must be created in the rootfs
> > +    # for built-in initramfs cpios otherwise it will error with:
> > +    #   Kernel panic - not syncing: /dev/console is missing or not a character device!
> > +    rm -rf ${B}/usr/append
> > +    mkdir -p ${B}/usr/append/dev
> > +    mknod -m 600 ${B}/usr/append/dev/console c 5 1
> > +    (cd  ${B}/usr/append && echo "./dev/console" | cpio -oA -H newc -F ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio)
> > +}
> > +
> >  do_initramfs_bundle[dirs] = "${B}"
> >  do_initramfs_bundle () {
> >      echo "Creating a kernel image with a bundled initramfs..."
> > ---
> > 2.19.1
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

