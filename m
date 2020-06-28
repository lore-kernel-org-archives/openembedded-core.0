Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web12.29884.1593356812375165402
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 08:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9P1Hb1u;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: andrey.z@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id b205so2918283vkb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26FmjNepy5k1pYHdF7XymSJMCazLHvB48ZwekC+zQuM=;
        b=Y9P1Hb1u96Suiqm2b2VTv4Rag4mdQFhxY153pVeN57hYPqoZ7u08a1LSwbEsOtjFOs
         sPRTl85zE69bDrdVPg2AYFYOZqhFPNNB7MsqZcyEfK4gFt/MH8L8Py0hUThQFyPkVGx7
         SDo8o9GsI9P4B6ahwPd2p8azdQW0QsQinHsZZ81eyl0y2lKa7+VKYsesIoGmGyK+HYwZ
         RS+/PdfzIrbGq42fmy7MukShr2gP7rDpCG5cUOM1nAp8KAwio44FnqUE3Q7/KCQJcjO2
         dW4v0Fd1b3krbV3zredjGmRtQ139ZmGazWf6kKkWKRw2s2y+VJtU8dPwiSHjJNbxFCpQ
         6x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26FmjNepy5k1pYHdF7XymSJMCazLHvB48ZwekC+zQuM=;
        b=WdqDNJWiICBusW0OP75VrovcrNiD34RDDUabt94mGrsR+uqzeKe5Lpqiv8A/vmCpQZ
         OQdrYug7EkU1aBnFaS+R//MqtuVFXWfhZVi73bRPgtz5CvHZjQenbx9VXEv8a6ONpo1D
         Ax6386ShS0J6xVwuoVaPjrQ+DqG05721o8gXAAkCXXCmTesnd4UaBDp3VClwTQghxHi3
         DXKV+OADght2FNMj7ghoelHn9h6J5ZSqC6Mid9jxWdBV4xdiismGCza3HcWU30MdVHda
         TzmoxSTDTo90v24+YEHrdv7H0nERJ5B9ZR+fA70rEN4gRGXrJatf0tDE+M+/pOxs6/t+
         j+rQ==
X-Gm-Message-State: AOAM533Svwm7KkG8LcmVfPzL2/jC5OLyJYjd1c3o+himFG2d6Lhs0hsB
	PjnPpB74+kRboiKXaVJpOaDv33tpw4ciLa6Jz4Q=
X-Google-Smtp-Source: ABdhPJzyzMUzUF4CfNaoIfmYpuCr1aUpWF68bFFM5aT5wdV4BN8bKTZZNGA99YNek94IY3G4WXksPqlsYRaCaYZQcWM=
X-Received: by 2002:a1f:280c:: with SMTP id o12mr7130674vko.92.1593356811401;
 Sun, 28 Jun 2020 08:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200627113417.25595-1-max.krummenacher@toradex.com>
 <CAHtQpK7RAB30qS=kRbsqEc48-_rvUCCHEMRgPJCdcpTY-A5C5g@mail.gmail.com>
 <1593298313.4316.22.camel@gmail.com> <CAHtQpK7Gsn6rHsMa=tuqATACLAS87E8H5cqZDycWF2woQch8zw@mail.gmail.com>
 <1593356278.3117.10.camel@gmail.com>
In-Reply-To: <1593356278.3117.10.camel@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sun, 28 Jun 2020 17:06:40 +0200
Message-ID: <CAHtQpK7xf4iSgoofRpLEnS19HQBFGSZLhNSNrJqQcD5GSHEBvA@mail.gmail.com>
Subject: Re: [[OE-core][Patch] cogl-1.0: : don't require eglmesaext.h
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 28, 2020 at 4:58 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Am Sonntag, den 28.06.2020, 11:04 +0200 schrieb Andrey Zhizhikin:
> > Hello Max
> >
> > On Sun, Jun 28, 2020 at 12:51 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > >
> > > Resent from correct email address. Sorry for the noise.
> > >
> > > Hello Andrey
> > >
> > >
> > > Am Samstag, den 27.06.2020, 21:31 +0200 schrieb Andrey Zhizhikin:
> > > > Hello Max,
> > > >
> > > > On Sat, Jun 27, 2020 at 1:35 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > >
> > > > > Starting with 1.22.8 cogl code unconditionally includes eglmesaext.h.
> > > > > Change configure.ac so that eglmesaext.h is only included if it actually
> > > > > exists.
> > > > >
> > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > >
> > > >
> > > > This patch fails to build with following errors in do_configure:
> > > >
> > > > > checking for wayland-egl >= 1.0.0 wayland-client >= 1.0.0... yes
> > > > > checking EGL/egl.h usability... no
> > > > > checking EGL/egl.h presence... no
> > > > > checking for EGL/egl.h... no
> > > > > configure: error: Unable to locate required EGL headers
> > > > > WARNING: exit code 1 from a shell command.
> > >
> > > I tested with a (relatively) clean meta-freescale installation, master branch.
> > > I built an i.MX 6 based machine with use-mainline-bsp and an i.MX6 and i.MX8MM based machine
> > > with
> > > use-nxp-bsp.
> >
> > Exactly the combination of imx8mmevk and use-nxp-bsp is failing for
> > me. I tried to perform the clean build with the same failed results...
> >
> > > For me the use-mainline-bsp build unsurprisingly succeeded without and with the patch. The two
> > > builds with use-nxp-bsp failed before the patch in do_compile because eglmesaext.h is missing,
> > > but
> > > succeeded with the patch applied.
> >
> > I've opened the issue regarding this failure in meta-freescale
> > (https://github.com/Freescale/meta-freescale/issues/438) where I tried
> > to sum up the details regarding this failure, and looks like the fix
> > you proposed should've address it. I do not have a `use-mainline-bsp`
> > build, and imx8mmevk build fails because of the missing non-upstreamed
> > `mesa` header installation. Current `mesa` configuration in Freescale
> > layer disables EGL, therefore `EGL/eglmesaext.h` is not installed into
> > sysroot.
> >
> > >
> > > What was your exact configuration and build target?
> >
> > Build Configuration:
> > BB_VERSION           = "1.47.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "aarch64-fsl-linux"
> > MACHINE              = "imx8mmevk"
> > DISTRO               = "krill-wayland"
> > DISTRO_VERSION       = "2020.04"
> > TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
> > TARGET_FPU           = ""
> > meta
> > meta-poky            = "master:70f14da0c558a54439fca245b73e054b8deba75d"
> > meta-oe
> > meta-multimedia
> > meta-python
> > meta-networking
> > meta-filesystems     = "master:e9e823d1a03eec5874346ed0c87e29c376195476"
> > meta-freescale       = "master:be4bd4650170a5e9c38875809be440daa65aa0aa"
> > meta-freescale-3rdparty = "master:13c782bfe40c921034944d6680bd27517a580598"
> > meta-freescale-distro = "master:c1da36a693c1d9b50d4d318cb4a960e8daaddbd5"
> >
> > DISTRO is a pure derivative of fsl-wayland, there are no graphics
> > amendments inside.
>
> Looks like that distro does not have xwayland and thus the X11 headers are
> not installed. That now makes the test for egl.h fail as by default X11 headers
> are included through eglplatform.h.
> That wasn't catched by my tests as I used a distro which builds xwayland.

Correct, I'm using Wayland-only distro, no X11 is enabled.

>
> >
> >
> > > Do the headers exist in your build?
> > >   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/recipe-sysroot/usr/include/
> >
> > Nope, the header is not installed into recipe-sysroot. Surprisingly
> > however, it is present in
> > cogl-1.0/1.22.8-r0/recipe-sysroot-native/usr/include/
>
> Are you sure? Your config.log tells otherwise:
>
>     In file included from ...recipe-sysroot/usr/include/EGL/egl.h:39,
>                      from conftest.c:63:
>     ...recipe-sysroot/usr/include/EGL/eglplatform.h:144:10: fatal error: X11/Xlib.h: No such file or
> directory

I guess my comment was confusing, sorry for that. I do not have Mesa
non-upstreamed headers (eglmesaext.h and eglextchromium.h) installed
in recipe-sysroot, all other headers are present. I thought you've
been asking for those headers only.


>
> Does replacing the initial patch with this one help in your setup?
> The test should not only check for existence of the headers themselves.
> https://gitlab.gnome.org/GNOME/cogl/-/commit/d9f38c5864e577edb7e9f55c9f1d06248f85429b.patch

I'll give it a try now, thanks for pointing it out! ;)

>
> Max
> >
> > > Any hint in the configure log output?
> > >   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/build/config.log
> > >
> >
> > Other than missing `EGL/egl.h` file, which reports the error:
> > configure:25431: result: no
> > configure:25431: checking for EGL/egl.h
> > configure:25431: result: no
> > configure:25438: error: Unable to locate required EGL headers
> >
> > there are some additional errors regarding missing X11 support and
> > needed optimization warning for _FORTIFY_SOURCE
> >
> > I've uploaded the config.log to GitHub
> > (https://gist.github.com/zandrey/65b15322c9561847f499648a2a46f173) so
> > you can take a look at it.
>
>
>

-- 
Regards,
Andrey.
