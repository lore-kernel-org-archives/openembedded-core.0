Return-Path: <andrea.adami@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8764A6BDD2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 14:25:45 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d72so4549407pga.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 06:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kNSrxDhXpc8WS7I7ZK67ieCroxQaD3fr1v5RXtKRpKA=;
	b=ii7zTuuZ+/EBIt3pyyhWuflYySOCZSCCzaL7WA4l00ZT1D3fhPQ4QSz22/kQQs2k3S
	xtxUPavlmfx8W4kCXdjTbzuMliFMP3HQwIAEBD2xZcIcfJivBlKBz+ICMYojqxzpD4zn
	Ns8drgqgbZ5LmeUDGJHq+wFMzCTMflJ7a0pxNZUXzrQuHU5nXyZciwKT0LqnwAEH9J0m
	qGGyifBZwJdNN6pwwGb9+vJGHXzL8DHORQDQConNGFPg4BRGrg8FnXBiwxr9NmUn+ED4
	ELEnmJzLVoDobZrhQdSqh4ukkRKaIaflRgQFWGojlHiDbA/jO3Y982S/KJTMcGkkeaet
	OZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kNSrxDhXpc8WS7I7ZK67ieCroxQaD3fr1v5RXtKRpKA=;
	b=HOi7G9qsqC4H9yDAGXZdY+JvYKgibV4KliGDXvKWZjqomyAvH3E48UgJx0uPKUi0B+
	BV57LihfJFm6J5w00//s6DQdWEbxx6PJ+Ilk6dy/iQ4lP/UCAKi2AYk+5ra4SMyicBLr
	szx4DatS3ad/5SkkLXqIYlqTyMS/hNEokgGGuNPhV0PWwF3pnSKmb1vJmGe629H9hSC2
	PGbrdBpnDpbqLeZxu/iDmTbLxJ7fAKSmdM116lKiBa2zSY+wN62heScYfSjCpyALnZoc
	ofZgHgGGvrm+lveM3GuH4ECMKIj9wJ4EX6qd0apuvLdjeirDHoUW38LEUGsb47lbGxqA
	wGiQ==
X-Gm-Message-State: AHQUAuaE5zMUZnQ1Z3RFj7/vvJQZ+DEIzhiq1gIQb8ORArveHsX+QFD+
	lYvvCJEcwTvBpRkN3PNJ6CzZh5agqhPVfOWAwmo=
X-Google-Smtp-Source: AHgI3IYsO2cHNHOQokhSrbiH6XKcuUsJ8MNkbR1UqL++tSW6ygBV3DB/rKMza7aP2tWSM0R8JhS3c89AwukY4FiJ4Os=
X-Received: by 2002:a63:df13:: with SMTP id u19mr10335057pgg.294.1549549546598;
	Thu, 07 Feb 2019 06:25:46 -0800 (PST)
MIME-Version: 1.0
References: <4881796E12491D4BB15146FE0209CE64681CF335@DE02WEMBXB.internal.synopsys.com>
	<CAMjhiJjNLN7Rnj8es_860h2=XdTbf9nnawouhUBYd+dEApmr4w@mail.gmail.com>
	<4881796E12491D4BB15146FE0209CE64681D54A2@DE02WEMBXB.internal.synopsys.com>
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681D54A2@DE02WEMBXB.internal.synopsys.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 7 Feb 2019 15:25:33 +0100
Message-ID: <CAAQYJAsCYPP88dCGY_=4mKE9rPGuw6za01tw-CB7D7VCZ7xYeg@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Always install initramfs-framework-base in case of linux-yocto & INITRAMFS_IMAGE_BUNDLE=1
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
X-List-Received-Date: Thu, 07 Feb 2019 14:25:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 6, 2019 at 4:54 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Leon,
>
> > -----Original Message-----
> > From: Leon Woestenberg <leon@sidebranch.com>
> > Sent: Friday, February 1, 2019 12:18 AM
> > To: Alexey Brodkin <alexey.brodkin@synopsys.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] Always install initramfs-framework-base in case of linux-yocto &
> > INITRAMFS_IMAGE_BUNDLE=1
> >
> > On Tue, Jan 29, 2019 at 9:01 PM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > > --------------------------->8----------------------
> > > /dev/console is missing or not a character device!
> > > Please ensure your rootfs is properly configured
> > > --------------------------->8----------------------
> >
> > I thought /dev/console could also be created by the kernel itself onto
> > a "temporary filesystem for device nodes" (DEVTMPFS).
> > I am not sure, but here is a similar case:
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.net_pipermail_buildroot_2015-
> > 2DMarch_123309.html&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=
> > 9xab_6OSIxhk6sCiqSFEwTUASBIaA_-C_wGiSMfJn3o&s=SJ9X7QVWrd1gCdyBsL9fdY841I4qG2y47VH3Sw-IRF4&e=
> >
> > Is your (other) kernel configured with CONFIG_DEVTMPFS=y?
>
> Indeed it is.
>
> The problem is devtmpfs is auto-mounted in prepare_namespace() which
> is not executed in case of initramfs because in case of initramfs we
> expect its "/init" will do everything itself, see [1].

Hi,
I jump in because I was at the same point years ago [1]: the issue
here is basically the linux-yocto specific patch adding the check for
console.
It was simply reverted in our case...

Cheers
Andrea

[1]
http://cgit.openembedded.org/meta-openembedded/commit/meta-initramfs/recipes-kernel?id=7183bacd5c866d433467a750e485e6c01af4aafc


>
> That said enabling CONFIG_DEVTMPFS_MOUNT doesn't help with initramfs too.
> So I don't see any other solution except disabling this check in case
> of enabled CONFIG_BLK_DEV_INITRD, see [2].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/early-userspace/README#n140
> [2] https://lists.yoctoproject.org/pipermail/linux-yocto/2019-February/007552.html
>
> -Alexey
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

