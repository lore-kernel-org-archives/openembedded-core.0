Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14129.1793373474138221185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 08:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=F5CJRNKX;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917bab38b14so10106176d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373473; x=1793978273; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlErJOeNbi9rxn92xwwjodbFgFVRVbRlZAkI6Xg2TB8=;
        b=F5CJRNKX15/pVc13Z7zjxYvcqWAUyjbuAcT94ztLaqK8yBBBwI1KPgrbuUiZzdG7JR
         o8mClvGoPuodvFH3d159PKv8RLsKPb7A9dvc3hbzxcBD9YreuASDu8xR4BKCL0+MQHEk
         7W4fyzXyacG6Ivrn2wKk4u5J5YeRfK8+EtTueeeu8gM557/aeoVrycB8WBm4ehTFZnrd
         gjQ9++nG6OuXO1y9f9qQ89n8xTOpDAKi0eCTTE6Umgh4M319XZZK/6kDJe/crC+2AYBM
         m3wT0F2MxcgV5/cimUddSOtMJuC5L5sGxeikZmKjm71VdLOFi5xrtVaQC6QqQnx6GD2W
         isfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373473; x=1793978273;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlErJOeNbi9rxn92xwwjodbFgFVRVbRlZAkI6Xg2TB8=;
        b=klh2VdrcNOV7DQqtM2LGpTd+/wMvQQGhnaPoH0reSrNXvCDYE7A6TRQKSaZmReLZCW
         c1+1gRNTb3iHuplKc904NmAu2jywbbdbcWa/Xt4lROt6BtEc8TUzInjhHr2aWTREH8wM
         3oqRDEXsTsgGvm5fnQD+CXSs6+9pMFxmWromDg57Xbe6pT7m309LqlLzrHITazUrxYRg
         unSOKB6MN2x4RTXCy8ECFOTJaapAJcInh+a6Ie6eVif3p7XIfAnk9k9Z3p8GfwepeyQ3
         woW/sHkvpK97OrSWOu4spymfkBQSHQ+kWRsw32lDxVM5s5XgztifJrKJDee1HHgJF8Es
         /P9g==
X-Gm-Message-State: AFq9FYKXzwD1hZWw1mqRfg4/oQ421G+TfSKd62ms2a/w0ueUaLYSmk/j
	x0E5JY24BNO0NTN1FUOn9l6DmKfi/NbSzio08dyal2fwSYsKoKD957ne
X-Gm-Gg: AYBFou3lXqzVuPuAN1I4N638eR+QguCVfBv1QNrSg4Nvjw9IyXKW9UUKsBM6JzE8Mkq
	Bydgbadw3fTmD0KzNS85MqpfjfZI/yyNwqAi6qhXgPO1ibsgUm8rDYMAQhfRpjvSQCUGclhutkl
	AmBEtJQ5DGU14LYNMmoX6sxLeeUu2dH8PxkSVpT+PcSGJRBkFmpmwIhs2DPYYHfHnWARUE6rOke
	RlTn0byl2MC/oM/N7Fd87kQtwsn5a0yCVg+A4xFQfWr4p+wukzOZtOzrmQj4yzmXTqLtHwuUG73
	eMdQIXzaw4xPI3jon56gdDWwfXJdPtQHEMx2TN/JjyV5kKAVq26eujNY4G/I509G6MGmAt5Guxb
	m+/ZYQ7DxqAlX0kSw/R2asoGHG5JObU5eYOs9wLzjopGOeV0XP8SP5jJToNXmGZ7rCoSDfHBGtd
	wZp1QoKSuq+Y70U9bZwDGINOismrgdFlMLk0PZptQxIcca0r67oB8KbCh9743+cvp6NeocS++ax
	0IFx7LZKpPmOSxuKOa89iCBUBZMUmqVxorifMJL8J8GusjgvUAsqLh5/0jZljBkHLHl9v0ogTUR
	leMc7pMr6DJydkgjY3RB4aqaoBF9GVWzLrZlgk4eS7vCZJtv4yIwyYE8d1A5vjN3HHdJOn2hpwn
	17jBwzGqaDjQIc54rkq4OCsXDwKqc5UlxdtaKecZSU/VsFGCGb/N3
X-Received: by 2002:a05:620a:2984:b0:93f:2e7e:c818 with SMTP id af79cd13be357-94421799c57mr455433185a.59.1793373472756;
        Fri, 30 Oct 2026 08:17:52 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ad7431sm161857185a.40.2026.10.30.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:17:52 -0700 (PDT)
Message-ID: <6ae4b520.2ba6c529.9958c.7be2@mx.google.com>
Date: Fri, 30 Oct 2026 08:17:52 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, Peter.Marko@siemens.com
Subject: Re: [OE-core] [PATCH v2 0/3] Fix kernel complementary package installation
In-Reply-To: <7f6cfc2f345e31d031ee099a0d591b72c0a1ddc1.camel@siemens.com>
References: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
 <6ae3d215.cf61d36e.14493f.869f@mx.google.com>
 <7f6cfc2f345e31d031ee099a0d591b72c0a1ddc1.camel@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 15:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249053

On Thu, Oct 30, 2026 at 6:40 AM Freihofer, Adrian wrote:
>
> > First, to make sure I have the use case right: this is TRACE32 (or
> > cross-gdb to qemu, it's a similar pattern) running on the host, with
> > rootfs-dbg extracted on the host as the debug sysroot. Nothing here
> > runs gdb on the target. Correct ?
>
> Yes, that's the use case which triggered this discussion.
>
> But I can think about more use cases which could benefit from a
> complete -src package (or different package name) for the kernel as
> there are also more use cases for any other -src package.

Thanks for confirming. I'd like to hear what those other use cases are,
since they're what would drive a full source package (more on that below).

For the host-side case, though, I don't think we need a source package
at all. The debugger runs on the host, so rootfs-dbg only has to supply
the symbols (kernel-dbg, kernel-vmlinux). The source can come from any
tree on the host that matches the build: the build's
work-shared/<machine>/kernel-source, or a linux-yocto checkout at the
recipe's SRCREV. With the prefix map change, every path in the kernel's
debug info is under /usr/src/kernel, so it's a single mapping in the
debugger to that tree.

> >    I'm not completely sold on sending this one yet, but I could be
> >    convinced to go that way rather than a -src package. If it covers
> >    your use case, that's the argument that would do it.
>
> I think this sounds very good and it would address at least the remote
> debugging case and make it much more consistent than it is now.

Having thought about it more, I'm going to keep linux-source local for
now. The problem is that a full source tree plus the ${B} artifacts is a
superset of kernel-devsrc. Everything devsrc does can be done with it,
just with a bigger footprint. I don't want two copies of the kernel source
to maintain, one curated and one not, and that's what linux-source is.

If a use case arrives that needs the source inside a rootfs (and not just
on the host), I'd want it done inside kernel-devsrc: one tree at
/usr/src/kernel, curated by default as it is today, with an opt-in to
widen it to the full source. No second copy, and no path mapping at all,
since the debug info already points there. The source would need to be
its own package without devsrc's toolchain RDEPENDS, so rootfs-dbg can
take it without pulling in a compiler. And it stays opt-in: nobody should
get ~1.6GB of source by accident.

It also doesn't have to be the whole tree. devsrc is already machine
specific, so the likely way I'd go is a larger devsrc: a curated spine
(core plus the machine's arch), with the drivers it needs discovered
from what the build actually compiled. On qemux86-64 that's about 330MB,
versus 1.5GB for the full tree.

> >  - 2/3: fine with me. Keeping the kernel out of the complementary
> >    install is what I asked for in v1, and with (1) it is a no-op.
>
> Should we then not just drop this patch as well? It's ugly to have this
> kernel specific case handled outside of the kernel recipe.

Agreed, drop it. With the prefix map, linux-yocto-src isn't created at
all, so there's nothing for core-image to exclude. That makes it all three.

The way I see it now, the 592 generated files in linux-yocto-src are the
actual bug today. They're there only because ${B} isn't mapped, and
they're the only reason the kernel gets a -src package. Complementary
install then pulls that package into rootfs-dbg without kernel-dbg, which
is the inconsistency you started from. Fixing the map removes the package,
and so the inconsistency, without any kernel special case in the image
classes or package.py.

> What the kernel recipe could provide instead:
> A: an empty -src package (just to behave like all other packages).
> B: an empty meta package which RDEPENDS on all the real kernel source
> packages. The kernel would no longer be something special. The sources
> are also included in the rootfs-dbg by default as for all user space
> packages. If the user prefers to have the kernel excluded from rootfs-
> dbg he can do what the patch does.
>
> I think B would be the most consistent approach and therefore also the
> most self-explanatory implementation.

I don't think we should do either.

A is an empty package that exists only so the kernel matches a pattern.
It doesn't give anyone anything.

For B, the real source package it would depend on doesn't exist (see
above). Even if it did, B puts the kernel back on the generic
complementary path, which is what I pushed back on in v1:

 - Complementary install maps every installed kernel-module-* package to
   linux-yocto-src, so almost every debug image would get the full kernel
   source by default, about 1.6GB unpacked.

 - It ties linux-yocto to whichever recipe ends up providing the source.

 - kernel-dbg still isn't pulled in by complementary install
   (KERNEL_PACKAGE_NAME vs PN), so you'd still get source without symbols.

The kernel is special here, in that it isn't usually a rootfs package.
I'd rather that be explicit (IMAGE_INSTALL_DEBUGFS for the symbols, and
a mapping to the source on the host) than hidden behind a meta-package.

So my plan is:

 - drop 1/3, 2/3 and 3/3
 - I'll send the kernel.bbclass prefix map change on its own, once I've
   checked SPDX's compiled-sources filter is unaffected (it's the only
   other consumer of the kernel's debugsources list)
 - revisit a full source package, inside kernel-devsrc, when there's a
   concrete use case that needs it in a rootfs

Thougts ?

Bruce
