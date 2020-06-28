Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web12.25029.1593335098495447859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 02:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CV801YR0;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id m25so7678418vsp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 02:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tYX9p68bjow6VfpCLeWdQzppxb5An3qYTDuR6j0RFTs=;
        b=CV801YR0CsSFFKCDINxUiki6t1tzzSKeOH0MTQ+4IA+2R2p9dBORgEryqnRLZAQwWZ
         BhMn/KQ+mMGvnhyR546UeXTa0Qm7Z6AT7BPQRdTOYRVNOT0xIQxX2OHycfCdb5v+dsXU
         XOYQmAhM4mCXOj/XQbrFomGWYHinSpEbVeXJ/qseEch0cFDQyMwIU4gdagj2V73udAPK
         qt/I+7tWWnQ3XnywQp0EZnOnIAMKw7nBM67kkv/f0Qf1nozj/6s6r3qPbIhCU+U3g6ed
         fG1UcUD/VJkKZT2EYIL40ktQKsIRHH+lGZ4EM01nXnUsl20o/1a9OCghE9sgpAaSaJ6j
         PvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tYX9p68bjow6VfpCLeWdQzppxb5An3qYTDuR6j0RFTs=;
        b=cmr9D4fMWim3O0KcvrxygU4ehaest7aFcqOR8XHIOInjXMuPIMV4TospYPYaLkQSC1
         NcWVMG5jmSQ1GvsZmbTjhEZPRR4uSrZGPw+t4QzCgutZ/8XT+c+QGH3c5Ji9PjLhCLp9
         lcjZuJJWXrvnSHZzqTkSh7rN5YyyEf7NWto7cBiLJMGERYRaeus9SSIBkzMXavPRYqwi
         FmgvewmCLkJ7nIjcryrmbkgo9jmyiNJL+L73E3+ABy6kH/m3bZ95Yg7IwuV1KgCaR+qb
         HUaaOaaJAt04cSM35kmnuc1h/tDFJFGKsuIwbZkdX+MNKY1qrxIewbvynvD3hqrvmIAO
         DUkw==
X-Gm-Message-State: AOAM53318nH5n2+s+g4O15RMqhNquA3GNb/ypxElrbGHQMgzOdbiMoqU
	mp7a3i3LoEyTjb91FEb9jnrJ7T8ZWBNot+++mrQ=
X-Google-Smtp-Source: ABdhPJy/H0V3obVtjZtmj6HWyxNN/BIUQUevtO1nVT97uo6K4WNnd1iQeexBlyLYk+evBUTGOQRkyolDY2IEJaKSmcc=
X-Received: by 2002:a67:304e:: with SMTP id w75mr7947218vsw.192.1593335097543;
 Sun, 28 Jun 2020 02:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200627113417.25595-1-max.krummenacher@toradex.com>
 <CAHtQpK7RAB30qS=kRbsqEc48-_rvUCCHEMRgPJCdcpTY-A5C5g@mail.gmail.com> <1593298313.4316.22.camel@gmail.com>
In-Reply-To: <1593298313.4316.22.camel@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sun, 28 Jun 2020 11:04:46 +0200
Message-ID: <CAHtQpK7Gsn6rHsMa=tuqATACLAS87E8H5cqZDycWF2woQch8zw@mail.gmail.com>
Subject: Re: [[OE-core][Patch] cogl-1.0: : don't require eglmesaext.h
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

Hello Max

On Sun, Jun 28, 2020 at 12:51 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Resent from correct email address. Sorry for the noise.
>
> Hello Andrey
>
>
> Am Samstag, den 27.06.2020, 21:31 +0200 schrieb Andrey Zhizhikin:
> > Hello Max,
> >
> > On Sat, Jun 27, 2020 at 1:35 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > >
> > > Starting with 1.22.8 cogl code unconditionally includes eglmesaext.h.
> > > Change configure.ac so that eglmesaext.h is only included if it actually
> > > exists.
> > >
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> >
> > This patch fails to build with following errors in do_configure:
> >
> > > checking for wayland-egl >= 1.0.0 wayland-client >= 1.0.0... yes
> > > checking EGL/egl.h usability... no
> > > checking EGL/egl.h presence... no
> > > checking for EGL/egl.h... no
> > > configure: error: Unable to locate required EGL headers
> > > WARNING: exit code 1 from a shell command.
>
> I tested with a (relatively) clean meta-freescale installation, master branch.
> I built an i.MX 6 based machine with use-mainline-bsp and an i.MX6 and i.MX8MM based machine with
> use-nxp-bsp.

Exactly the combination of imx8mmevk and use-nxp-bsp is failing for
me. I tried to perform the clean build with the same failed results...

> For me the use-mainline-bsp build unsurprisingly succeeded without and with the patch. The two
> builds with use-nxp-bsp failed before the patch in do_compile because eglmesaext.h is missing, but
> succeeded with the patch applied.

I've opened the issue regarding this failure in meta-freescale
(https://github.com/Freescale/meta-freescale/issues/438) where I tried
to sum up the details regarding this failure, and looks like the fix
you proposed should've address it. I do not have a `use-mainline-bsp`
build, and imx8mmevk build fails because of the missing non-upstreamed
`mesa` header installation. Current `mesa` configuration in Freescale
layer disables EGL, therefore `EGL/eglmesaext.h` is not installed into
sysroot.

>
> What was your exact configuration and build target?

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-fsl-linux"
MACHINE              = "imx8mmevk"
DISTRO               = "krill-wayland"
DISTRO_VERSION       = "2020.04"
TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
TARGET_FPU           = ""
meta
meta-poky            = "master:70f14da0c558a54439fca245b73e054b8deba75d"
meta-oe
meta-multimedia
meta-python
meta-networking
meta-filesystems     = "master:e9e823d1a03eec5874346ed0c87e29c376195476"
meta-freescale       = "master:be4bd4650170a5e9c38875809be440daa65aa0aa"
meta-freescale-3rdparty = "master:13c782bfe40c921034944d6680bd27517a580598"
meta-freescale-distro = "master:c1da36a693c1d9b50d4d318cb4a960e8daaddbd5"

DISTRO is a pure derivative of fsl-wayland, there are no graphics
amendments inside.


> Do the headers exist in your build?
>   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/recipe-sysroot/usr/include/

Nope, the header is not installed into recipe-sysroot. Surprisingly
however, it is present in
cogl-1.0/1.22.8-r0/recipe-sysroot-native/usr/include/

> Any hint in the configure log output?
>   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/build/config.log
>

Other than missing `EGL/egl.h` file, which reports the error:
configure:25431: result: no
configure:25431: checking for EGL/egl.h
configure:25431: result: no
configure:25438: error: Unable to locate required EGL headers

there are some additional errors regarding missing X11 support and
needed optimization warning for _FORTIFY_SOURCE

I've uploaded the config.log to GitHub
(https://gist.github.com/zandrey/65b15322c9561847f499648a2a46f173) so
you can take a look at it.

> Max
>
> buildhistroy/images/colibri_imx6/glibc/core-image-weston/build-id.txt
>
> colibri-imx6: core-image-weston configured for fslc-xwayland 3.2-snapshot-20200627
>
> Build Configuration:
> BB_VERSION           = "1.47.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-fslc-linux-gnueabi"
> MACHINE              = "colibri-imx6"
> DISTRO               = "fslc-xwayland"
> DISTRO_VERSION       = "3.2-snapshot-20200627"
> TUNE_FEATURES        = "arm vfp cortexa9 neon thumb callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky            = "master:3e96efc4dd87f74ba807692feab5d3750e7e9e30"
> -> that is my patch on top of poky, master:5951cbcabe29e8520876c7646b578c12d6c20950
> meta-oe
> meta-multimedia
> meta-python          = "HEAD:e9e823d1a03eec5874346ed0c87e29c376195476"
> meta-freescale       = "master:be4bd4650170a5e9c38875809be440daa65aa0aa"
> meta-freescale-3rdparty = "master:13c782bfe40c921034944d6680bd27517a580598"
> meta-freescale-distro = "HEAD:eb60ca80e81e07909920889fcdd03649934c4896"



-- 
Regards,
Andrey.
