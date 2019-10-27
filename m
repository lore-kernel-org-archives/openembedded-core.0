Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
	[209.85.166.172])
	by mail.openembedded.org (Postfix) with ESMTP id E886C7F9DC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 00:27:27 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id i12so4973867ils.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eGmlSbUjLvJUef982MkkOkn4loxQlFjW2bBtpy3Q/KA=;
	b=IDrNm4iqNuQm6yGbkJgICBPI+A455v9vHne7CjcnLAzOLw9nz0RyU3W0y+NnY+na8I
	bNL25xilENMXPyCwyYHHA4OPQciVi4cPx6tIwY1RniiSpQFY0Gy72t5ABPeSsKj2tBFc
	9oVvBQgF0Vzdm6zqpPi2oa7cn0hN7spcv/fzZTnaZRjHZkIyc71Wh/g8m/LeADKAGE2n
	yQeuXnqATU1BrDnLQnXF202S61rIfeo1g+6LC/Rfw2vmDFYQDvX9raAb7Mv33u+ceyU/
	rm4ixslkNz/xSzUe1lyOGS737tipj/OydLmyQq+zFfTCudT/2BTxrSbtchfOEJsYMjlc
	yDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eGmlSbUjLvJUef982MkkOkn4loxQlFjW2bBtpy3Q/KA=;
	b=OUmoFfadYlCbAT1a6WJ11DwVjzE7mxfc2apGPlwW6lHj6isdtIx5AMjqJxG9srcMtD
	8WXCVTH4yxeICN72EUyWVtv7Ec6BzfxmEHzTxk4UgoMuRuuZlZvOwi8men4PvEYo3Dq5
	dFY/vhn94oIJH+Q53UwB2ZDuIjGAoSJoTejmCai5N4W+K7MvWfqce2xR9OrCwvNFuiMi
	iIVayrXSev0IXDOnFuSwWpIIpfsYRRMY7v3k0m9U3pSLmx8lydx6DDE6vVHYxaAkCPmG
	j/+903FsQ6LVLuNVLA5T8n7rEJao5Gf6crp+AI4k+180XzpmLUAWGVygPOxmO0wsNr/I
	5OjA==
X-Gm-Message-State: APjAAAWo60BQ+3WFf1GzfQpoKevuUKtny3E2MceFcif8jlctKIHlVuHN
	Qwx054oOXbin0jaQ+Z1+Jl/HhjwmpvN8sOPl3Is=
X-Google-Smtp-Source: APXvYqws/phI3yj/jssgNDM6lfXlJYtS+inRvsQ+txUxyGLrpNsqvKuQyUN5aK+8VKGKp9puZPRLkB55FPSPmktfE+0=
X-Received: by 2002:a92:5ac2:: with SMTP id b63mr13747055ilg.192.1572136048797;
	Sat, 26 Oct 2019 17:27:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:aa09:0:0:0:0:0 with HTTP; Sat, 26 Oct 2019 17:27:28
	-0700 (PDT)
In-Reply-To: <de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
References: <CAA=hcWTH9VCNgbDbU+ai3sydbWWKNR9HfnuGKu3oQ7XsHN6JBQ@mail.gmail.com>
	<de0e9a45-522a-be55-120a-b3cbd398ec6c@gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Sun, 27 Oct 2019 11:27:28 +1100
Message-ID: <CAA=hcWSTFCUBniK19V-2d0o87PjLN1dkpsWCXhjMXfBQiFvtEw@mail.gmail.com>
To: Ferry Toth <fntoth@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: zimage Initramfs booting stuck at Start Kernel
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
X-List-Received-Date: Sun, 27 Oct 2019 00:27:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ferry,

On 10/27/19, Ferry Toth <fntoth@gmail.com> wrote:
>
> As an example you might want to look at my repo, I have 2 images minimal
> and initramfs:
> https://github.com/edison-fw/meta-intel-edison/tree/master/meta-intel-edison-distro/recipes-core/images
>
> I don't exactly know how you are doing it. But I'll try to explain what
> I do:
> I have
> 1) a normal rootfs (say edison-image-minimal) and
> 2) a initramfs rootfs containing kernel modules needed for booting and a
> init script.
>
> Initramfs is build using core-image-minimal-initramfs.bbappend. Some
> additional unneeded packages are pulled, and as size is restricted (10MB
> or so?) we remove them here.

Thanks for the tips, that confirms my long suspensions that the size
of the image could be the cause of the problem, my working zImage size
is 8MB, my failing zImager-initramfs size is 35MB. How did you remove
the 10 MB size restriction? I checked your
core-image-minimal-initramfs.bbappend, there is no sign to remove 10
MB size restriction. You have a resize-rootfs.service, but I am not
sure that is the one for fixing the 10 MB size restriction. The
edison-image-minimal.bb has the IMAGE_ROOTFS_SIZE = "1048576", sorry
for my dumb, is that size for 1048576 KB (1GB) or 1048576 B (1MB)?

> The init script is here:
> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-distro/recipes-core/initrdscripts/initramfs-framework/init
>
> The init script loads modules, waits for the disk with the rootfs to
> appear and mount it. Then switchroot to it.
> If it doesn't appear it drops to a shell so you can investigate what's
> wrong.

I am confident that the 10 MB size restriction is the problem, I am
not clear where that 10 MB size restriction is defined and how to fix
the size restriction, appreciate your helps.

> To build everything edison-image-minimal triggers build of u-boot,
> kernel, rootfs, initramfs and kernel-with-built-in-initramfs.

> Search for 'init' and 'live' and find the needed lines in
> https://github.com/edison-fw/meta-intel-edison/blob/master/meta-intel-edison-distro/recipes-core/images/edison-image-minimal.bb

I looked at the init script, but not clear if it is critical for
fixing that issue or not. My init is the symblic link to
/lib/systemd/systemd in imx6.

Thank you very much.

Kind regards,

- jh

