Return-Path: <andrea.adami@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 10BD279F12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 14:20:09 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id n4-v6so9611589plp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 06:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SKCI24DTYs8LOP3W5BcWnS3/ejD7rmdPW8nfePTcti4=;
	b=sFxF5ZqWYfqdY6hTbBHW+eAVqb1AhrrhW/6fw7mQ81rHLM/xj/halIngvAE0D5nuLR
	Cws9E7e7tHDvgIL/nGppCCBztuzkUNjFTMtXLaGq3ZtM0AwTUC1rC1U4bQsFnJhvYB1f
	DP42XYAgXwkbQUkXHuFqb0oAgICvE3+763y38DG9F0Yhvylazal/1AoRIm7UojR1Xw6K
	X3yp7+7MBI6gb66L9ro2TiAmHVwry8QxCks0er4PUEbFpqYHTpqTuWthPzL+ZrgOtr1X
	uwsESyUjXq1mKkrBV9bEMZAp+A8MSNUvJql84ERi7RWmPoxvkgjPagxz7ZGqb2rLRL8G
	i1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SKCI24DTYs8LOP3W5BcWnS3/ejD7rmdPW8nfePTcti4=;
	b=t+EPmZbRk604HlShwlnfG+MKK+m6Fd9khoqWbHvh0LGGfIgddvBphUwwYQRTbT9kRB
	E5lYM78YbYlz6UabJrD08APaWpEm7bYMMqRqvduhModjkvq2FuEvdC3g8UZzTUJZE9oI
	Sog9pnLAJ0y/6TREQ1oYmaFnbEaeOktZ01a/ajJtn7Z7hDMM50hipmM/wwGFwXEnmO5N
	/kiH51BQ5Eu65OaPoOzpoXHFWhhN0j7huvJGZEbtpQZ02q68D/LlXRhqnrRCt+OzWoIf
	4fcwo/HEcCuWgiTg5zHyW4gN3z1hWfo2LT18p4WAWhoLgdopOGA7VTFpfSPji9wwln0F
	EpZA==
X-Gm-Message-State: AGRZ1gLoH2+ukz4Ky1af5KuxBC0gdxzW37am7TdQqmsa1f3RND/l9Q5L
	/LyAG2ZWsAc7bmoK9D0Idyzw6d3VYtjeHijXggIkNV95
X-Google-Smtp-Source: AJdET5e0Vlj68BhCTywTfGtI4bW6Bcfi2TdKrjsvWonfX07oVjDyPj9Oy2LpQDjc2hMBIiQDEugUoz1kzch/oEt5Ipw=
X-Received: by 2002:a17:902:b592:: with SMTP id
	a18-v6mr4600216pls.248.1541686811116; 
	Thu, 08 Nov 2018 06:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20181107121602.13768-1-nathan@nathanrossi.com>
	<20181107121602.13768-2-nathan@nathanrossi.com>
	<CAAQYJAurMNXOeAh5Px8a5NqUBzc4PdcfL1KpfqUESjzdwO0gvw@mail.gmail.com>
	<CA+aJhH2B11RMAw0cGnp4sF+eXnBOjd0A0XLyTb-te4FaYHS1FQ@mail.gmail.com>
In-Reply-To: <CA+aJhH2B11RMAw0cGnp4sF+eXnBOjd0A0XLyTb-te4FaYHS1FQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 8 Nov 2018 15:19:58 +0100
Message-ID: <CAAQYJAv8Y+cceAgiuW3jtnxRY3Oi73V-Ys13sP5YCLfg-UrpxA@mail.gmail.com>
To: nathan@nathanrossi.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 08 Nov 2018 14:20:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 8, 2018 at 2:05 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> On Wed, 7 Nov 2018 at 23:32, Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > On Wed, Nov 7, 2018 at 1:16 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
> > >
> > > The kernel has two differing code paths when handling a built-in cpio
> > > versus a cpio passed to the kernel from a boot loader. When the kernel
> > > is booted with the built-in cpio it expects the /dev/console node to
> > > exist and will panic if it does not exist.
> > >
> > >   Kernel panic - not syncing: /dev/console is missing or not a character device!
> > >
> > > When the cpio is passed to the kernel via a bootloader, this behaviour
> > > is not observed.
> > >
> >
> > Well, of course once booted you have devtmpfs or you have provided
> > your devices-list.
> > We fight since long with this early issues and I think this approach
> > is wrong: there are more things needed, not only /dev/consoleI'd say
> > the responsability to check for devtmpfs or recreate the devices is up
> > to init manager of the image.
>
> Ok, so I do not think my commit message was clear enough in this regard.
>
> Firstly the kernel requires the /dev/console node before the init
> process is started, but after it has unpacked the built-in ramfs and
> after it has mounted the initrd (rd or ramfs). You can see the exact
> call that attempts to open /dev/console here:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/init/main.c?h=v4.20-rc1#n1154
>
> The exact problem this change is solving is the fact that by embedding
> a user source cpio into the kernel, the default kernel initramfs is
> replaced. The default kernel ramfs contains /dev, /dev/console and
> /root.
>
> Also for reference when the kernel is built without
> initramfs/BLK_DEV_INITRD support it will create this default rootfs
> with an alternate initcall:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/init/noinitramfs.c?h=v4.20-rc1
>
> So essentially the kernel is always expecting the rootfs to contain
> this /dev/console node.
>
> >
> > We don't use busybox, just a single binary running as init: kexecboot
> > will exactly do that, check and recreate devices if missing:
> > http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
>
> This only solves the user space requirements for device nodes. Since
> kexecboot or busybox will not be executed before the kernel tries to
> open the /dev/console file.
>
Rightm and nothing bad will happen, just the
pr_err("Warning: unable to open an initial console.\n");

then init is run.


> >
> > Please don't inject anything in the cpio, let the image-engineer decide.
> >
> > This poor image is regularly attacked by new changes filling the cpio
> > with undesidered stuff:
> > http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
>
> How does this image handle this /dev/console dependency? Is there
> something I am missing with how it is built into the kernel, or with
> how the kernel you are using is configured?
>
> It appears the initramfs-framework images of oe-core solve this by
> creating the node in the image itself.
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb#n51
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb#n15
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
>
> Looking at the log of those files, it appears this might have been a
> kernel version and/or architecture specific thing back in 2013...
> http://git.openembedded.org/openembedded-core/commit/?id=0352841cd92f6316bcac092e2fff9d28c352b36b
>
> >

And I had to revert it...
http://cgit.openembedded.org/meta-openembedded/commit/meta-initramfs/recipes-kernel?id=7183bacd5c866d433467a750e485e6c01af4aafc

> > Maybe we are on the corner-case, size-contraints limit us to be within
> > 1MiB, neverthless I think it is a good exercise to keep things small
> > and clean ;)
>
> I would also like to avoid this change if there is an alternative that
> works better.
>

Well, at the beginning we used IMAGE_DEVICE_TABLES to populate it.
Then whit the introduction of devtmpfs (3.2 iirc) we switched using
it, to save the few kb of the /dev:the trick here is that devtmpfs
automount does not work in the initramfs so you have to mount devtmpfs
by hand in your init, like here
https://github.com/kexecboot/kexecboot/blob/master/src/kexecboot.c#L734

Cheers
Andrea

> Thanks,
> Nathan
>
> >
> > As for the previous patch touching initramfs, I hold my comments for
> > the moment: let me first test it.
> > Cheers
> >
> > Andrea
> >
> > > To resolve this issue, ensure any cpio that is built into the kernel is
> > > prepared with a /dev/console node. This is done by appending to the
> > > copied cpio of the INITRAMFS_IMAGE. In order to create the node to
> > > append, the task must be executed with root permission (to run mknod).
> > > As such this change creates and intermediate _prepare task between the
> > > existing _bundle and _copy tasks.
> > >
> > > Note: The default/minimal initramfs that the kernel sources
> > > gen_initramfs_list.sh generates contains this device node.
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/usr/gen_initramfs_list.sh?h=master#n55
> > >
> > > Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> > > ---
> > >  meta/classes/kernel-initramfs.bbclass | 15 ++++++++++++++-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/kernel-initramfs.bbclass b/meta/classes/kernel-initramfs.bbclass
> > > index b23fb51495..135f4c8949 100644
> > > --- a/meta/classes/kernel-initramfs.bbclass
> > > +++ b/meta/classes/kernel-initramfs.bbclass
> > > @@ -16,7 +16,8 @@ python __anonymous () {
> > >      if image and bundle:
> > >          # add all the tasks
> > >          bb.build.addtask('do_initramfs_copy', 'do_initramfs_bundle', 'do_install', d)
> > > -        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_copy', d)
> > > +        bb.build.addtask('do_initramfs_prepare', 'do_initramfs_bundle', 'do_initramfs_copy', d)
> > > +        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_prepare', d)
> > >
> > >          # make the do_initramfs_copy task depend on the image do_image_complete task
> > >          d.appendVarFlag('do_initramfs_copy', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> > > @@ -67,6 +68,18 @@ do_initramfs_copy () {
> > >      echo "Finished copy of initramfs into ./usr"
> > >  }
> > >
> > > +do_initramfs_prepare[dirs] = "${B}"
> > > +fakeroot do_initramfs_prepare () {
> > > +    echo "Preparing initramfs by creating required /dev/ nodes"
> > > +    # append a /dev/console node, this node must be created in the rootfs
> > > +    # for built-in initramfs cpios otherwise it will error with:
> > > +    #   Kernel panic - not syncing: /dev/console is missing or not a character device!
> > > +    rm -rf ${B}/usr/append
> > > +    mkdir -p ${B}/usr/append/dev
> > > +    mknod -m 600 ${B}/usr/append/dev/console c 5 1
> > > +    (cd  ${B}/usr/append && echo "./dev/console" | cpio -oA -H newc -F ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio)
> > > +}
> > > +
> > >  do_initramfs_bundle[dirs] = "${B}"
> > >  do_initramfs_bundle () {
> > >      echo "Creating a kernel image with a bundled initramfs..."
> > > ---
> > > 2.19.1
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

