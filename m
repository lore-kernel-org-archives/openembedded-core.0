Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4089.1793584686336249388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=op8EsBPK;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f22a8515eso244845685a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 17:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793584685; x=1794189485; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pTGYk/ct4rBsH9lz8TklaJFZawbM0OpBZ5tykKCepE=;
        b=op8EsBPKmhzntI8YXkl1U/u1jy/qr8xOR9g6jAHyQOhnPksV4/6v0UcJ+X7f7BvrQC
         qbJcdtu4rV8Ts/04yfdPLPpRqdDtlhSWxhUag2RaEWUdJNtAcDXVbfub3oyy+PfDsnNL
         Rwzi45hWtqYT9/VybQsXvAPm/LJMijxfqOd66FBjGH1H5h4MOQ3gP3BHgTE7AEwtvext
         P6gh9jJLZ/U69dnCpEiSfJo3vHZl4JEd26yzLEzfuEGslyEXBdLQfZwxfdKh6K88NCAn
         FINMt5Xzst9w9sNQYGqlfNIBqpUFdBsxeCRgyhVAwHFWZmw1gNJPikXCX0xFPuk+UGYx
         Oo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793584685; x=1794189485;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pTGYk/ct4rBsH9lz8TklaJFZawbM0OpBZ5tykKCepE=;
        b=2NvnXRgUrC25ZuKth//OwG7g8r9nH2pByfmI7LZYUbqOsMjLYHWeCRDNAST75ac71Z
         42GX7xM01sigX612qnuoeeFvlH8MhRWRAhrlEpftDxy33MdXN3yqOOC6jf/soriSHll5
         DenX+wivVebhpX4IuvGjY5qr2hcP1xXLTHBd9+94KsKmQVIqP2yjix/lHU5bjxNtSGGp
         xLm82B2XzY4IsXyUuoOCLwl0jWaoMUzTHRy+lMW/NiC/y0b3eyk5VhqjCaXAgtL9BhJ9
         NnVcmS2hUGOwKIdFa7LnE2kp1UhAVIxzHiKl+OmgeSlAL7WG3idObSw4nPElfIGca4bo
         dEkw==
X-Gm-Message-State: AFq9FYKBHP3LwTEgUW2W1ny4sIr+Wu1pasximmNPkbHvPLOc5rAPjxkW
	W6YQh9ysTGA7Eo5AyUtcgmH4iuTuInc/cfmUYQuSYk25QNz32YNJakEx
X-Gm-Gg: AYBFou1YMU9aHXuCYdFQWsth+d+r0F4hyw/ErOMQloGmwlDcVC1RGylpKI4+h4GDu1J
	AMqf8rHrr6ZIvbGwvG+4DT9Q+aWKbdQiWo9IhdVZMkLE8pvJOF0WFHc1itaN+2oToe/WCJhAiJE
	wxYlO9j7GbAa/vYit2VgnrhFFopx/8yOO4/q0chZ4cwm5FK999RumTEb5xuTAu9xoLLSjJ3DJmb
	WgaiI/JE2//tLZeSu/75NWh74wT7aMMp66TIDQs7mC6r5prIrNdQqgwORGneBR8VL12CsSwpnSi
	FA1yD5M5ruW3kwCaNNceuHn+xu/z0hC4zTIxKpVb1wzs31W77IQ4guF5rnVQvVB7eYYtRTzkoNV
	OR2+2F6FkbqEfuQGAddIxdOUFDbwpIw9xX2SPGNnfGhA5z4J5M1pd05mdl351v0NaODfS6ed/ul
	jY2IN6O1z1K/HvtgOa1SzG2iEQ4hrj1oybtLF9Glycq4lpQKd01eeyLJkKKbSaC7EiLIjqV+RkF
	Vx2x3XFo8q331hpA8yK9C745us1ObyXYyJ2t+oQHDYgtiYPPAzszt0I9ahZMILJtj7voH51CQVP
	tg6ejfku16iGjdaarR+7LBSsRjnpx4Sdy5a67dtn+3PbQyFZSoOpMAGEgbOcNHPq98oTvsoCh1J
	NXT0KUUeXOjaV4MM8Suh0ci9C4nyK2UX80OTQLvuSQpoALJkRBtwL
X-Received: by 2002:a05:620a:2a05:b0:93f:277b:3136 with SMTP id af79cd13be357-944215825abmr1404190685a.2.1793584684972;
        Sun, 01 Nov 2026 17:58:04 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2ddsm719073185a.11.2026.11.01.17.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:58:04 -0800 (PST)
Message-ID: <6ae7ee2c.757e2132.16a24.77ff@mx.google.com>
Date: Sun, 01 Nov 2026 17:58:04 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, Peter.Marko@siemens.com
Subject: Re: [OE-core] [PATCH v2 0/3] Fix kernel complementary package installation
In-Reply-To: <4b02434605104cd40cf4aa57f7c6a0db42796f64.camel@siemens.com>
References: <20260923205206.1102615-1-adrian.freihofer@siemens.com>
 <6ae3d215.cf61d36e.14493f.869f@mx.google.com>
 <7f6cfc2f345e31d031ee099a0d591b72c0a1ddc1.camel@siemens.com>
 <6ae4b520.2ba6c529.9958c.7be2@mx.google.com>
 <4b02434605104cd40cf4aa57f7c6a0db42796f64.camel@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 01:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249173

On Sat, Oct 31, 2026 at 7:22 AM Freihofer, Adrian wrote:
>
> There are different use cases:
>    1. working as a developer on the kernel. For this I agree with your
>       statement.
>    2. remote debugging a user space application with a debugger such as
>       the Trace32 which supports seamless stepping into the kernel
>       context of a user space process. For this use case the sources
>       are required on the host as for a dynamically linked library
>       ideally as a -src and -dbg package.
>    3. Installing the package (also possible with a binary package feed)
>       into the rootfs is required for on target debugging and
>       profiling.

Thanks, that's the list I was looking for. 2 and 3 are the concrete use
cases for having the source in a rootfs (or rootfs-dbg), so I've gone
ahead with it (more below).

> Agree. This addresses all use cases by:
>  * devtool modify linux-yocto
>  * IMAGE_INSTALL_DEBUGFS:append = " kernel-dev"
>  * IMAGE_INSTALL:append = " kernel-dev"
>  * opkg install kernel-dev

One correction (so nobody sees this on the list or in the archive
and copies this into a local.conf): kernel-dev is
System.map, the config and Module.symvers. The source package is
kernel-devsrc, and the symbols are kernel-dbg and kernel-vmlinux.

kernel-devsrc also doesn't cover 2 or 3 today. (At risk of stating
what is already well know) It is what's needed to build modules
(headers, Kconfig/Makefiles, scripts), so it has almost no
.c files, and installing it pulls in the tools for "make scripts prepare"
(bc, bison, flex, gcc-plugins, openssl-dev, ...), which people
don't want in rootfs-dbg.

>  - I'll send the kernel.bbclass prefix map change on its own, once
> I've
>    checked SPDX's compiled-sources filter is unaffected (it's the
> only
>    other consumer of the kernel's debugsources list)
>
> I did that a few weeks ago. It's an independent code path.

Thanks. I read through it as well, and agree, the compiled-sources
filter only matches files found in the kernel-source copy, and the
generated files were never in there.

> If we have the 9000+ source files instead of only the 400+ generated
> files, all use cases which I have in mind are addressed. Sounds good.

That's what I've prototyped, based on some patches that I've had around
for several years at this point .. It stays one package (kernel-devsrc)
and one tree at /usr/src/kernel, where the debug info points with the
prefix map. PACKAGECONFIG chooses what goes in it:

  build:   what kernel-devsrc is today, with its RDEPENDS. The default,
           so nothing changes for existing users.
  source:  a curated core (core directories plus the machine's arch),
           and the drivers the build actually compiled, discovered from
           kbuild's .cmd files. No RDEPENDS.
  full:    the whole tree.
  tarball: the whole tree as a tarball, rather than uncompressed. This
           is similar to what other distros have in their linux-source
	   packages

With:

  PACKAGECONFIG:pn-kernel-devsrc = "source"
  IMAGE_INSTALL_DEBUGFS = "kernel-dbg kernel-vmlinux kernel-devsrc"

on qemux86-64 (7.2.13), rootfs-dbg gets the symbols and 254MB of source
at /usr/src/kernel, and nothing else: no build tools come along. All
9016 source files named in the kernel's debug info are there. The only
ones missing are the 592 generated files from the build directory,
which we don't want to ship. The full tree is 1.5GB.

That covers 2 (rootfs-dbg on the host, no path mapping in the debugger)
and 3 (install it in the image or from a feed). "source build" gives
both the source and what's needed to build modules on target.

The package can optionally be versioned (kernel-devsrc-<kver>, with
kernel-devsrc holding just the /usr/src/kernel link), so the source of
more than one kernel can be installed side by side.

One thing to know: if the image itself already installs kernel-devsrc,
IMAGE_INSTALL_DEBUGFS won't put it in rootfs-dbg. rootfs-dbg starts from
the image's package database, so it's seen as already installed, and
only the debug files are copied over. That's how the debug rootfs works
in general, but it'll need documenting.

If that sounds ok, I'll send the prefix map patch, and then the
kernel-devsrc series as an RFC so you can try it with TRACE32.

Bruce
