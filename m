Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CBE7A7F375
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 18:14:12 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id g4so11289060qtq.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RG6Czb5cR91pkskp0QZXaYGwxGhO9Ibhxf8Jb+EatzY=;
	b=AlSzHZvGBY+dzdXmQQDW90o53+nrRMZ74xFka/oMA/QEjmXk9bhXe81F6HUnVbq9f1
	mmy2Iuij+Kt/L4UdN6kol7oEaOSENHJYBR309zG1Pw3nGz0vKVm9ACLQRmN9ygoqR5FM
	WCYkk8dWH198IQqnfYLOS6y/qsuccB8UBFaXgvOTXFqSk1ygGKQibJ/hBmUBwLrWfr/r
	7gAncM1FcEtjJDj3yDI0LXXSx7vcbS9uOvG2O5CqbVd9Pj8vj1KZGEz+E3NvyVOB6ryB
	FIs+P7p1YNeqEuisAeWCeQv2UI0RtuAvEVLGLBy7IEeFXeRXtu3rWuUUbFb0qY52icoS
	x7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RG6Czb5cR91pkskp0QZXaYGwxGhO9Ibhxf8Jb+EatzY=;
	b=mFIUpqHdsqo+YiXRKpKjWivdlUQCluLv3fdHZgqgG7boNwJkMQC6T/acxf71So3NEC
	bHCTZYcj4VXIIPS+fFmZA1Ph0ur7dnQjXUT0Uq8pnupYN0yk3wEWHXeTV0YGrInGRSSr
	VjXGtLItstlY0rh2HPmLehbvEdnCW9M4J3dcbur3GA8+qAwwtYW1YRmLKY3ZdJsoUloD
	usJH5NTe8fpt93cWzlpnV45WdqcBCILEmwCgj7IlMB0YRWEm7w3cHKCQsge19NjOhQO8
	JWTEQw2Jwp5OBIgYQ7EZOZZSBCqlV0VOplZDcaj158p/NS7WJddBfe+DBzu5TYEZ91IN
	5ASg==
X-Gm-Message-State: APjAAAUR3Cr3be9nbiSLN4xDyxgfdgogL5myXvpkTL1RCjfrJaYJHyZv
	2zh283LUqcrzmaWpFlTkZGMiPfvhs4tSkuNE6W4=
X-Google-Smtp-Source: APXvYqzX86yqtGJZgDfCNw1y2v4L4NghhxpGiE3PGAoenvCZmE6lz7N82j+N1+skyMllV+xpwP0ey0vgZzmS5bUSZuE=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr21309638qti.88.1567275253519; 
	Sat, 31 Aug 2019 11:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567181039.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1567181039.git.bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Aug 2019 11:13:47 -0700
Message-ID: <CAMKF1sqotrbvGrf4Gx8CYhS=9P3kT+2frbRBqsTnfQMP4KXV4g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3 v2] kernel-yocto: 5.2 intro series
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
X-List-Received-Date: Sat, 31 Aug 2019 18:14:14 -0000
Content-Type: text/plain; charset="UTF-8"

largely this worked fine ( buildwise ) for meta-openembedded layers included see

https://errors.yoctoproject.org/Errors/Build/87912/

The 5.2 regressions are below, If anyone has cycles to fix them would be great.

klibc, klibc-static-utils - syscall stub generator in klibc now gets
confused and cant generate the header file with syscalls
drbd, can-isotp - External kernel modules ( maybe need some forward porting )
bpftool - Fails with new error (undefined reference to `do_btf')

Cheers
-Khem

On Fri, Aug 30, 2019 at 9:06 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> These are the patches for the 5.2 intro that aren't in your current master-next.
>
> Kevin's meta-yocto-bsp can use a minor SRCREV bump, and I'll send that shortly
> to the appropriate list. But even running with it as-is, isn't a problem.
>
> I will also follow up with the 5.0 removal and some other minor tweaks once
> this introduction of recipes goes green.
>
> Cheers,
>
> Bruce
>
> The following changes since commit be28058c101a38ad9e01c0ce95bbe0c7dee19410:
>
>   Revert "poky.conf: make systemd as default init manager" (2019-08-30 13:37:48 +0100)
>
> are available in the Git repository at:
>
>   git://git.pokylinux.org/poky-contrib zedd/kernel-next
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-next
>
> Bruce Ashfield (3):
>   linux-libc-headers: update to v5.2 headers
>   linux-yocto: introduce 5.2 recipes
>   qemu: bump linux-yocto preferred version to 5.2
>
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  meta/conf/machine/include/x86-base.inc        |  2 +-
>  meta/conf/machine/qemuarmv5.conf              |  2 +-
>  ...sm-ptrace.h-should-not-depend-on-uap.patch | 62 -------------------
>  ...aders_5.0.bb => linux-libc-headers_5.2.bb} |  5 +-
>  .../linux/linux-yocto-rt_5.2.bb               | 44 +++++++++++++
>  .../linux/linux-yocto-tiny_5.2.bb             | 32 ++++++++++
>  meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 ++++++++++++++++
>  8 files changed, 135 insertions(+), 68 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.0.bb => linux-libc-headers_5.2.bb} (75%)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb
>
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

