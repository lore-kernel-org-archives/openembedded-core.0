Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web12.30796.1593359678394736474
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 08:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VNF90i8r;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id 64so1715651vsl.3
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7tVqK/Tb+yxWfSz/+6zxCgZLeK4/uplhmbRrGWoHhF4=;
        b=VNF90i8rQMmP09bOHzyNLY0NYZmd7rARKoBJbwX+E4t35sV/Ji/068fo7wpYf8C6Wu
         kzD2kWwE8tfbGNEZ1WGzIY0IYTN09wbhIKF7Z8wW+oreaGmD3wDjf+Mg4JHTyzw9LAH6
         if7QCL9hVYSqsS5vd/KqR2DTfI84AZ6o5s9M9FY0gHK3pYYocWgoTsCIVVpFD0gblvKJ
         SPtJab+XCXkIoOeb0SThuc8o75Q8Yl4PVT8Y6+S0KzdhxfnRSF0bhjg4iQZ9U8WXGkvk
         JNr3Cs38hNYTEw+amtm0e4LcqJRT/ib2jIqCFQpDSQzjT5pAKxKgkJfZB1JVvsDiDnK1
         WA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7tVqK/Tb+yxWfSz/+6zxCgZLeK4/uplhmbRrGWoHhF4=;
        b=OQ52bB9jSb/NQCeQZe0Pn4+60OFURb4h0DyvGGbjmxZ6pg9ajTZc4dyVJ1iJESZBQh
         y9SMLjljkFGIPWf8m+hZ0QNYeL++F0cRMIOsB0H77/Or/RCE8TfcGi70GVlc/sbS2cPS
         JMUUWqyXF/COO6lwWkayUWryRyec57D2t/UsE/0o+aVH7ZV9KNU5KJYoxGGjxADzwgEf
         epEdO0OwbnMOCp3dcSGtS5W0S7eZyyp8ucVQtaEWBZTIQWJubG14CntPDKId5vSbgHst
         ra5ShT+UtiWIw/coQR41vHAq7nUkK737I6tYx97+L33PCrToU6wLNeffMgTkqLbafUcE
         WKZg==
X-Gm-Message-State: AOAM5335AosREmW27QFpgBKkeUDnP6HmjbbxEedTJkJJeKKcDEsmzZNj
	jsCcxguNqNIx8oDdau8MT2idPaDdXphr+4TKfnM=
X-Google-Smtp-Source: ABdhPJy6nrbnbNyT/ZKsiPoaajI5MaS3s1dKwLnUL2eK0/4G1SOIv/8d+7DqxJric7gt1yzZwHB6t8lJ/hEOwyHOaVE=
X-Received: by 2002:a67:b405:: with SMTP id x5mr8285755vsl.79.1593359677506;
 Sun, 28 Jun 2020 08:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200627113417.25595-1-max.krummenacher@toradex.com>
 <CAHtQpK7RAB30qS=kRbsqEc48-_rvUCCHEMRgPJCdcpTY-A5C5g@mail.gmail.com>
 <1593298313.4316.22.camel@gmail.com> <CAHtQpK7Gsn6rHsMa=tuqATACLAS87E8H5cqZDycWF2woQch8zw@mail.gmail.com>
 <1593356278.3117.10.camel@gmail.com> <161CBD9446BC6284.11480@lists.openembedded.org>
In-Reply-To: <161CBD9446BC6284.11480@lists.openembedded.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sun, 28 Jun 2020 17:54:26 +0200
Message-ID: <CAHtQpK5Nkjfqx8DrhWyjTct=Fpj7tf3-UCeo=+dp1=mh0iYqjA@mail.gmail.com>
Subject: Re: [[OE-core][Patch] cogl-1.0: : don't require eglmesaext.h
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 28, 2020 at 5:07 PM Andrey Zhizhikin via
lists.openembedded.org <andrey.z=gmail.com@lists.openembedded.org>
wrote:
>
> On Sun, Jun 28, 2020 at 4:58 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> >
> > Am Sonntag, den 28.06.2020, 11:04 +0200 schrieb Andrey Zhizhikin:
> > > Hello Max
> > >
> > > On Sun, Jun 28, 2020 at 12:51 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > >
> > > > Resent from correct email address. Sorry for the noise.
> > > >
> > > > Hello Andrey
> > > >
> > > >
> > > > Am Samstag, den 27.06.2020, 21:31 +0200 schrieb Andrey Zhizhikin:
> > > > > Hello Max,
> > > > >
> > > > > On Sat, Jun 27, 2020 at 1:35 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > > >
> > > > > > Starting with 1.22.8 cogl code unconditionally includes eglmesaext.h.
> > > > > > Change configure.ac so that eglmesaext.h is only included if it actually
> > > > > > exists.
> > > > > >
> > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > >
> > > > >
> > > > > This patch fails to build with following errors in do_configure:
> > > > >
> > > > > > checking for wayland-egl >= 1.0.0 wayland-client >= 1.0.0... yes
> > > > > > checking EGL/egl.h usability... no
> > > > > > checking EGL/egl.h presence... no
> > > > > > checking for EGL/egl.h... no
> > > > > > configure: error: Unable to locate required EGL headers
> > > > > > WARNING: exit code 1 from a shell command.
> > > >
> > > > I tested with a (relatively) clean meta-freescale installation, master branch.
> > > > I built an i.MX 6 based machine with use-mainline-bsp and an i.MX6 and i.MX8MM based machine
> > > > with
> > > > use-nxp-bsp.
> > >
> > > Exactly the combination of imx8mmevk and use-nxp-bsp is failing for
> > > me. I tried to perform the clean build with the same failed results...
> > >
> > > > For me the use-mainline-bsp build unsurprisingly succeeded without and with the patch. The two
> > > > builds with use-nxp-bsp failed before the patch in do_compile because eglmesaext.h is missing,
> > > > but
> > > > succeeded with the patch applied.
> > >
> > > I've opened the issue regarding this failure in meta-freescale
> > > (https://github.com/Freescale/meta-freescale/issues/438) where I tried
> > > to sum up the details regarding this failure, and looks like the fix
> > > you proposed should've address it. I do not have a `use-mainline-bsp`
> > > build, and imx8mmevk build fails because of the missing non-upstreamed
> > > `mesa` header installation. Current `mesa` configuration in Freescale
> > > layer disables EGL, therefore `EGL/eglmesaext.h` is not installed into
> > > sysroot.
> > >
> > > >
> > > > What was your exact configuration and build target?
> > >
> > > Build Configuration:
> > > BB_VERSION           = "1.47.0"
> > > BUILD_SYS            = "x86_64-linux"
> > > NATIVELSBSTRING      = "universal"
> > > TARGET_SYS           = "aarch64-fsl-linux"
> > > MACHINE              = "imx8mmevk"
> > > DISTRO               = "krill-wayland"
> > > DISTRO_VERSION       = "2020.04"
> > > TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
> > > TARGET_FPU           = ""
> > > meta
> > > meta-poky            = "master:70f14da0c558a54439fca245b73e054b8deba75d"
> > > meta-oe
> > > meta-multimedia
> > > meta-python
> > > meta-networking
> > > meta-filesystems     = "master:e9e823d1a03eec5874346ed0c87e29c376195476"
> > > meta-freescale       = "master:be4bd4650170a5e9c38875809be440daa65aa0aa"
> > > meta-freescale-3rdparty = "master:13c782bfe40c921034944d6680bd27517a580598"
> > > meta-freescale-distro = "master:c1da36a693c1d9b50d4d318cb4a960e8daaddbd5"
> > >
> > > DISTRO is a pure derivative of fsl-wayland, there are no graphics
> > > amendments inside.
> >
> > Looks like that distro does not have xwayland and thus the X11 headers are
> > not installed. That now makes the test for egl.h fail as by default X11 headers
> > are included through eglplatform.h.
> > That wasn't catched by my tests as I used a distro which builds xwayland.
>
> Correct, I'm using Wayland-only distro, no X11 is enabled.
>
> >
> > >
> > >
> > > > Do the headers exist in your build?
> > > >   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/recipe-sysroot/usr/include/
> > >
> > > Nope, the header is not installed into recipe-sysroot. Surprisingly
> > > however, it is present in
> > > cogl-1.0/1.22.8-r0/recipe-sysroot-native/usr/include/
> >
> > Are you sure? Your config.log tells otherwise:
> >
> >     In file included from ...recipe-sysroot/usr/include/EGL/egl.h:39,
> >                      from conftest.c:63:
> >     ...recipe-sysroot/usr/include/EGL/eglplatform.h:144:10: fatal error: X11/Xlib.h: No such file or
> > directory
>
> I guess my comment was confusing, sorry for that. I do not have Mesa
> non-upstreamed headers (eglmesaext.h and eglextchromium.h) installed
> in recipe-sysroot, all other headers are present. I thought you've
> been asking for those headers only.
>
>
> >
> > Does replacing the initial patch with this one help in your setup?
> > The test should not only check for existence of the headers themselves.
> > https://gitlab.gnome.org/GNOME/cogl/-/commit/d9f38c5864e577edb7e9f55c9f1d06248f85429b.patch
>
> I'll give it a try now, thanks for pointing it out! ;)

With this version (also d9f38c5864e577edb7e9f55c9f1d06248f85429b)
Wayland-only build succeeds, so:

Tested-by: Andrey Zhizhikin <andrey.z@gmail.com>

>
> >
> > Max
> > >
> > > > Any hint in the configure log output?
> > > >   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/build/config.log
> > > >
> > >
> > > Other than missing `EGL/egl.h` file, which reports the error:
> > > configure:25431: result: no
> > > configure:25431: checking for EGL/egl.h
> > > configure:25431: result: no
> > > configure:25438: error: Unable to locate required EGL headers
> > >
> > > there are some additional errors regarding missing X11 support and
> > > needed optimization warning for _FORTIFY_SOURCE
> > >
> > > I've uploaded the config.log to GitHub
> > > (https://gist.github.com/zandrey/65b15322c9561847f499648a2a46f173) so
> > > you can take a look at it.
> >
> >
> >
>
> --
> Regards,
> Andrey.
> 



-- 
Regards,
Andrey.
