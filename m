Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.13648.1611674714910371499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 07:25:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IS4d6EjF;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id p21so18146833lfu.11
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 07:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z6n+KVT9fE6GdoWaQsb0U/PAsze88EonkWzeyc/Hx3o=;
        b=IS4d6EjFSEK2McvJ/es1Hxw4XMsB7XgaGlp2PqyY8Mr6Ux4i5kJKFZRBYGvij1+Jt8
         SxL3UlIqjIb3nvb0X2iZIkzHNwDzF32Drc44BuK+b4a+LJCW4Gmyb7N1Lj0PDh96/0Ne
         ucjW8nQ6uT540odI90F3YlhYf6ZyDKD7kMZqiSXhJB+G8aAntYkHXRIKZXgCEe9Otb3O
         KBWH0sJvrNBea3WdoO7FO3UQ8Rcwdfx/aZ+cGy78gnOQ8j5w+lsqWO9GXySHCWTsR9Qc
         SOMsKbqj+U7N7q9eEUiH0fqtjAzXhVlSkPAio+TbwqQxLucAScOaA8epC1Z+K8gFpnUp
         6rWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z6n+KVT9fE6GdoWaQsb0U/PAsze88EonkWzeyc/Hx3o=;
        b=Nee0jTZi3PfVp0vZx6zp1thQTlE0VZKJiLljQeM28EhGry1AbZrqGdkP70y0Eh7m6A
         KISodSISgcCVHPfwS5DeaSP07NuOMdbFyqdhFwPtOTrcz7M+sDpVQG+OcLh9RgrXluqP
         AyvNFoJuPqz211f7n1U3SMQs1CCpmtHYiCSvRRGXSmjibLNB0xSbNsZt1/lFlSLYLm3+
         GgNNlMCKGA/U4XL+TkBHXVM7+Z47d32SHUGWOqGsUzaS9fVL/lfKZ7z3Me3UQtY1pcZ6
         czjfQvNdKZFHq4hFd3M0JfYA5NkMs+Yx4Eqalx3EWM1j71NLskySyOflQwxsIh1RXrQ8
         YeGw==
X-Gm-Message-State: AOAM530TojmbrZpcJeRUjgCKUkhEu5JNG8OVvGQUsNUKQDYfjnsUKbUd
	QC1WKnBULrw98JeBySU3J8jA8/2rVAhqsBPzpHI=
X-Google-Smtp-Source: ABdhPJyDFJ18aQLOYQTYC84T+ntQxW4p6GJaU6fbsbbxcBOWTzqbVd8M/cbQDvjdU3JGPBYcn/wQXL4OkXD/yWDp++o=
X-Received: by 2002:a19:4158:: with SMTP id o85mr2951870lfa.429.1611674713164;
 Tue, 26 Jan 2021 07:25:13 -0800 (PST)
MIME-Version: 1.0
References: <CAHtQpK71uAoq_hwDGJCvt5O_=kNXHkWFkmHC-BQkzcSCM3ys7A@mail.gmail.com>
 <CAOSpxdZ_0+QOwnpaCMMm=+1WUcedQ7aqnm=rmg1=_bU8TWOELQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZ_0+QOwnpaCMMm=+1WUcedQ7aqnm=rmg1=_bU8TWOELQ@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 Jan 2021 16:25:01 +0100
Message-ID: <CAHtQpK7N-vmpvTpm2Jt-3Q4i+WXtMHfNSq4Jf+BsgsjkETwv7Q@mail.gmail.com>
Subject: Re: [dunfell]: gpsd recipe (3.19) build is broken
To: Steve Sakoman <steve@sakoman.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Steve,

On Tue, Jan 26, 2021 at 3:29 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> Hi Andrey,
>
> Thanks for reporting this issue.
>
> I'm the maintainer for the dunfell branch of oe-core.  The gpsd recipe
> is part of meta-openembedded. I'm copying Armin, who is the maintainer
> for the dunfell branch of meta-openembedded.

True, I've realized the recipe is not part of OE-Core.

>
> That said, I'm surprised you are seeing this issue since the gpsd
> recipe has been fairly stable for quite some time.  I know that Armin
> does test builds quite frequently.
>
> FWIW, I tried doing a gpsd build with oe-core, meta-openembedded,
> meta-freescale, and meta-freescale-distro on an Ubuntu 20.04 and it
> completed successfully.

Arghh, got the same setup now - and the build issue was gone! :( Looks
like this was an intermittent one.

I went ahead and invalidated the sstate for the recipe, and build went
through alright.

With that said: please discard this message, and thanks for responding here!

>
> Perhaps more information on your environment might help.  What
> distro/version is the OS on your build machine? What other layers are
> enabled in your build? What are you using for MACHINE and DISTRO?  Do
> any of your layers have a .bbappend for gpsd?

For the record: had nothing fancy, same setup as you've indicated above:

Build Configuration:
BB_VERSION           = "1.46.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-fsl-linux"
MACHINE              = "imx8mmevk"
DISTRO               = "fsl-wayland"
DISTRO_VERSION       = "3.1"
TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
TARGET_FPU           = ""
meta
meta-poky            = "HEAD:bb7747497adbc7c99f6fc9b48b643eecb4cb1408"
meta-oe
meta-multimedia
meta-python
meta-networking
meta-filesystems     = "dunfell:5bba79488b7d393d2258d6e917f7bf7b0d7c4073"
meta-freescale       =
"update-kernel-dunfell:184ee6b12d1c06db9327535ad1ae84d4709cfdb0"
meta-freescale-3rdparty = "HEAD:ed841161a97307ebd901c31c62f8ecbee6baaacf"
meta-freescale-distro = "HEAD:5d882cdf079b3bde0bd9869ce3ca3db411acbf3b"

>
> Regards,
>
> Steve
>
> On Tue, Jan 26, 2021 at 2:13 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > Hello Steve,
> >
> > gpsd recipe build breaks on the dunfell branch with following error messages:
> >
> > | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> > ./libgpsd.a(ppsthread.o): undefined reference to symbol
> > 'pthread_create@@GLIBC_2.17'
> > | /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot-native/usr/bin/aarch64-fsl-linux/../../libexec/aarch64-fsl-linux/gcc/aarch64-fsl-linux/9.3.0/ld:
> > /development/dunfell/build-output/work/aarch64-fsl-linux/gpsd/3.19-r0/recipe-sysroot/lib/libpthread.so.0:
> > error adding symbols: DSO missing from command line
> >
> > This cannot be reproduced on the current master branch, where the
> > version of gpsd recipe has been bumped up from 3.19 to 3.20.
> >
> > Can you please consider to cherry-pick following commits from master
> > in order to upgrade the gspd version on dunfell branch:
> >
> > 98e61961c gpsd: add new init script
> > 04afc692a gpsd: mark CLEANBROKEN
> > 33a15c790 gpsd: fix build on aarch64
> > cecab9c4c gpsd: Upgrade 3.19 -> 3.20
> >
> > I've tried to cherry-pick them locally and they do apply clean. Also
> > the build of gpsd is successful after this upgrade.
> >
> > --
> > Regards,
> > Andrey.


--
Regards,
Andrey.
