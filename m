Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0192F6BF40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 23:46:56 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n21so8138174qtl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 15:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rSQVF/8GwdkBG+Vbd1Bf3O/U57AnY5OHZUjYpKmSwJ8=;
	b=rBllpeByNkh2RY+D2KMwlDKSLPCsNvEULdfwrx1cusWlm8s4/0AdJa1sRZkfavDIXp
	/EMlekEBNrmyrE0JICoxhr1+7ep2OQqRD0SWngUvw1jBMISk3l3aDwtfPVbpid/6wNq9
	tjiaOe9AwN9hfg8AqOKt+f8ZP6gPe1iBZPsCRds2+/kfhE+bMFEx9V+w9SMXhPSk9nbD
	eyS6zjtREukPRS71tWcExZnyDtTPTzyQxXhJmIPwaLww0R74zi8/3rrmv6NmEytNcTUQ
	6kebomtfa0bN89B/vxA5E71cJXsMoEMKn9kmpNDaYLQ/oCIYpTVFRTEqSz71M8FLpfwa
	7/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rSQVF/8GwdkBG+Vbd1Bf3O/U57AnY5OHZUjYpKmSwJ8=;
	b=ZBQdiKbS4JvKlfPLa0iEvH+nY46m6+K5MSvtcErEO9GCc5tK5fhdc7FK4P08n5GM8g
	TN1L0gEYgSGeeSXD9Xtubn0x52pjPnGkbS/4grqAGT1eavcn7fUnVGf5X9UplLbN7MPi
	rpOHRadgiPd4a+8M0ISmWH1i4pTlB6drC3SvjmrqC2AZ8W2ypUzNlliv3rXFYJ5Ffum6
	M5XWmPbPzIiRsUDw87AvZ9qz8xh2jjxRzXs6dhKYdVODqmbuSDbcfKNMOnbv0nC/TUAq
	OC6lPnorJr3mXcKbI7A2yoJhRVCS8wb4r+vbmkWqh13ACSR2+x7xSbFfPTXlVfPEXh5F
	WV+A==
X-Gm-Message-State: AA+aEWYy1L6C/1wEdGflV4vBtHAhEnws+xRCKpudLTkzf1Q1k6xGftkO
	lBuJ4jSxE8BjedKXMZIx26D92KFF5rMkOs03KTs=
X-Google-Smtp-Source: AFSGD/UFzl2tVIMs7dvxBtU8fulrEOXtL9Oi4zCU3u7S4AvLl836puxG/RnMeEtDZyI2i/IIOTNENejqNlc+Ho5gCag=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr4956910qte.29.1544831217651; 
	Fri, 14 Dec 2018 15:46:57 -0800 (PST)
MIME-Version: 1.0
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Dec 2018 15:46:31 -0800
Message-ID: <CAMKF1spRwzV+NRwbdFDHMgX4ffP3CZ_NKoOS8QF60KJkBKbJCw@mail.gmail.com>
To: Serhey Popovych <serhe.popovych@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/13] powerpc/powerpc64: Support build with musl as libc
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
X-List-Received-Date: Fri, 14 Dec 2018 23:46:57 -0000
Content-Type: text/plain; charset="UTF-8"

Serhey

Thanks for doing this work and really a clean pull request with good
explanation that I have seen lately. Good work, For most parts
everything is in order except few places where I have replied
specifically to the patches

On Fri, Dec 14, 2018 at 9:55 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> Musl has support for ppc (32bit) and ppc64 (64bit). OE still missing
> several tricks in configuration to make builds possible:
>
>   1) Most important part is that musl implements elfv2 ABI only for
>      64bit PowerPC. That ABI is default for little-endian but supports
>      big-endian too. Historically elfv1 ABI is used for big-endian
>      PowerPC.
>
>   2) Using uncommon elfv2 ABI for big-endian requires to disable all
>      assembler optimizations in openssl: unfortunately I can't find more
>      smart way at the moment.
>
>   3) LDSO path need to be adjusted to support /lib64 path which is
>      default for powerpc64 (see bitbake.conf) instead of $baselibdir.
>
>   4) Default library search path is hardcoded to
>      "/lib:/usr/local/lib:/usr/lib": pass -DSYSLIBDIR and -DLIBDIR and
>      use them to set path.
>
>   5) Need to add more tweaks to patch that adds --with-ldbl-128 knob
>      to gcc configure: there is a set of functions that use TFtype in
>      ppc64-fp.c in libgcc. This should be compatible with glibc.
>
>   6) Disable qemu-userspace for powerpc64 bit: there is no support.
>      While there change qemuwrapper to exit explicitly to fix infinite
>      execution in do_rootfs() task when building on IBM POWER8 machine.
>
>   7) Misc fixes that map powerpc-linux-musl python3 triplet to
>      powerpc-linux-gnu, remove conflicting sed in do_configure() vs
>      patch settings in gcc and fix DEFAULTTUNE settings for various
>      IBM POWER platforms.
>
> Build is done on IBM POWER8 machine running RHEL7:
>
> Images:
> -------
>     core-image-sato
>     core-image-full-cmdline
>
> For powerpc64:
> --------------
>               glibc                musl
>          systemd sysvinit    systemd sysvinit
>   gcc-7.3   y       y           y       y
>   gcc-8.2   y       y           y       y
>
> For powerpc:
> ------------
>               glibc                musl
>          systemd sysvinit    systemd sysvinit
>   gcc-7.3   n       x           x       x      (*)
>   gcc-8.2   y       y           y       y
>
> Note that gcc-7.3 builds for 32bit powerpc fail due to:
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=11754
>
> Kernel/images are boot tested using KVM-HV on IBM POWER8.
>
> Serhey Popovych (13):
>   lib/oe/elf.py: Add powerpc64 architecture definition for musl
>   tune-power[5-7].inc: Fix DEFAULTTUNE values
>   tune-power[5-7].inc: Disable QEMU usermode usage
>   qemuwrapper: Explicitly exit in case of no qemu supported for target
>   arch-powerpc64.inc: Use elfv2 ABI when building with musl
>   musl: Create default library search path based on configuration
>   musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
>   openssl: Skip assembler optimized code for powerpc64 with musl
>   python3: Fix do_configure check platform triplet error (2)
>   gcc: Fix preprocessor redefines for header pathes
>   gcc: More places to patch to disable ldbl 128 for musl on PPC
>   gcc: Enable secureplt for powerpc64 target too
>   gcc-7.3,gcc-8.2: Use variable SYSTEMLIBS_DIR instead of hardcoding it
>     for ppc64
>
>  .../machine/include/powerpc/arch-powerpc64.inc     |   3 +
>  meta/conf/machine/include/tune-power5.inc          |   5 +-
>  meta/conf/machine/include/tune-power6.inc          |   5 +-
>  meta/conf/machine/include/tune-power7.inc          |   5 +-
>  meta/lib/oe/elf.py                                 |   1 +
>  .../openssl/openssl10_1.0.2q.bb                    |   1 +
>  .../recipes-connectivity/openssl/openssl_1.1.1a.bb |   1 +
>  ...slibdir-and-libdir-as-default-pathes-to-l.patch |  61 ++++
>  meta/recipes-core/musl/musl_git.bb                 |   3 +-
>  meta/recipes-devtools/gcc/gcc-7.3.inc              |   1 +
>  ...Ensure-target-gcc-headers-can-be-included.patch |  36 --
>  ...44-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 391 ++++++++++++++++++++-
>  ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 ++
>  meta/recipes-devtools/gcc/gcc-8.2.inc              |   1 +
>  ...Ensure-target-gcc-headers-can-be-included.patch |  36 --
>  ...34-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 342 +++++++++++++++++-
>  ...werpc-powerpc64-Add-support-for-musl-ldso.patch |  31 ++
>  meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
>  .../tweak-MULTIARCH-for-powerpc-linux-musl.patch   |  40 +++
>  meta/recipes-devtools/python/python3_3.5.6.bb      |   1 +
>  .../recipes-devtools/qemu/qemuwrapper-cross_1.0.bb |   3 +-
>  21 files changed, 920 insertions(+), 80 deletions(-)
>  create mode 100644 meta/recipes-core/musl/musl/0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0050-powerpc-powerpc64-Add-support-for-musl-ldso.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0042-powerpc-powerpc64-Add-support-for-musl-ldso.patch
>  create mode 100644 meta/recipes-devtools/python/python3/tweak-MULTIARCH-for-powerpc-linux-musl.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

