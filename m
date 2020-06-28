Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.29738.1593356281611693955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 07:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ebJHZP7J;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id e22so10738315edq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gJn4eyh9WtFBklhRBDnYmg3a2tK6GUsQcfIIPqdVUkA=;
        b=ebJHZP7JMg+3P8bKgOL9L0poH89r0pDNJvtttG6IaCJCU7wcxezGUjwf9Xri6Nn1Xl
         f0QCfYTiU+Bkkf/u5OGB46v0r6vcQ4moQOYzlu3JR6C9cGTNGUZBdvDNpZ7Oo8S4apnL
         VCgRPNcUIuXPQNIUEbSgVgnX0aKFWzM8jHpUDJEOKPSfFsBJ+i4m2sUwbqVjApUHj78f
         uy4GrFc7YpoXxCFXErPfCekAiGCIFZW/6SIgzeMrMip+vRhE0B38wTfTN+4oLQM/ga2T
         YubEp1aK6JOPeMNhU7gtzNCoPH65zZPaAwTP53Ccq2qrRdpY7l9OEtTvq2yjz8GPVl7K
         s/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gJn4eyh9WtFBklhRBDnYmg3a2tK6GUsQcfIIPqdVUkA=;
        b=UQFZTz21s5opZI4cmY6hkShyGxLSo/RV5mppDYK24QsH9lL2z7IiVxAIKfgABMdVXD
         OegWAumesqlyYcJdPYBhYY+YnI4BsDEmVpxL9D/RApQpds19NJpP8soGuTkxLSyPIl5g
         7p6rW7UcwNXdEtnUwm1hCVOA3pGRpdAgZ7naX9P6zB/l/Y7rTZv69NIzIWi4nn8HT629
         6CpHo3VvbQFwMubY/Spjm9rv1UG/mDPO3Pcjc2e87oMANAXSGnTq6ReXcSZSyoi+WVku
         KSYhKq2WxyRN/YsGsLJu8J8NCmWcdsJw3Z+mA20cxF7Fqh+PcdG8ybjS4snhCyRQEKO3
         X5kA==
X-Gm-Message-State: AOAM531qvEsxHGvSY5cedR8xGejqSIpY0wNfJlfHi+awg5aNk0jxUgc7
	/U1uGmTOR15tSyYOPqgEtDM=
X-Google-Smtp-Source: ABdhPJwtheV8uEiRQz7rAf+xd1ADclFe5jzLUiUHwI5bY1uqOjKgNvdrkfE3FZyP3kbjZMBEZINKhw==
X-Received: by 2002:aa7:d8c2:: with SMTP id k2mr12832466eds.346.1593356280063;
        Sun, 28 Jun 2020 07:58:00 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from Saturn.fritz.box ([81.221.228.86])
        by smtp.gmail.com with ESMTPSA id v27sm12821188ejg.36.2020.06.28.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 07:57:59 -0700 (PDT)
Message-ID: <1593356278.3117.10.camel@gmail.com>
Subject: Re: [[OE-core][Patch] cogl-1.0: : don't require eglmesaext.h
From: "Max Krummenacher" <max.oss.09@gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Max
	Krummenacher <max.krummenacher@toradex.com>
Date: Sun, 28 Jun 2020 16:57:58 +0200
In-Reply-To: <CAHtQpK7Gsn6rHsMa=tuqATACLAS87E8H5cqZDycWF2woQch8zw@mail.gmail.com>
References: <20200627113417.25595-1-max.krummenacher@toradex.com>
	 <CAHtQpK7RAB30qS=kRbsqEc48-_rvUCCHEMRgPJCdcpTY-A5C5g@mail.gmail.com>
	 <1593298313.4316.22.camel@gmail.com>
	 <CAHtQpK7Gsn6rHsMa=tuqATACLAS87E8H5cqZDycWF2woQch8zw@mail.gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 28.06.2020, 11:04 +0200 schrieb Andrey Zhizhikin:
> Hello Max
> 
> On Sun, Jun 28, 2020 at 12:51 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > 
> > Resent from correct email address. Sorry for the noise.
> > 
> > Hello Andrey
> > 
> > 
> > Am Samstag, den 27.06.2020, 21:31 +0200 schrieb Andrey Zhizhikin:
> > > Hello Max,
> > > 
> > > On Sat, Jun 27, 2020 at 1:35 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
> > > > 
> > > > Starting with 1.22.8 cogl code unconditionally includes eglmesaext.h.
> > > > Change configure.ac so that eglmesaext.h is only included if it actually
> > > > exists.
> > > > 
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > 
> > > 
> > > This patch fails to build with following errors in do_configure:
> > > 
> > > > checking for wayland-egl >= 1.0.0 wayland-client >= 1.0.0... yes
> > > > checking EGL/egl.h usability... no
> > > > checking EGL/egl.h presence... no
> > > > checking for EGL/egl.h... no
> > > > configure: error: Unable to locate required EGL headers
> > > > WARNING: exit code 1 from a shell command.
> > 
> > I tested with a (relatively) clean meta-freescale installation, master branch.
> > I built an i.MX 6 based machine with use-mainline-bsp and an i.MX6 and i.MX8MM based machine
> > with
> > use-nxp-bsp.
> 
> Exactly the combination of imx8mmevk and use-nxp-bsp is failing for
> me. I tried to perform the clean build with the same failed results...
> 
> > For me the use-mainline-bsp build unsurprisingly succeeded without and with the patch. The two
> > builds with use-nxp-bsp failed before the patch in do_compile because eglmesaext.h is missing,
> > but
> > succeeded with the patch applied.
> 
> I've opened the issue regarding this failure in meta-freescale
> (https://github.com/Freescale/meta-freescale/issues/438) where I tried
> to sum up the details regarding this failure, and looks like the fix
> you proposed should've address it. I do not have a `use-mainline-bsp`
> build, and imx8mmevk build fails because of the missing non-upstreamed
> `mesa` header installation. Current `mesa` configuration in Freescale
> layer disables EGL, therefore `EGL/eglmesaext.h` is not installed into
> sysroot.
> 
> > 
> > What was your exact configuration and build target?
> 
> Build Configuration:
> BB_VERSION           = "1.47.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "aarch64-fsl-linux"
> MACHINE              = "imx8mmevk"
> DISTRO               = "krill-wayland"
> DISTRO_VERSION       = "2020.04"
> TUNE_FEATURES        = "aarch64 cortexa53 crc crypto"
> TARGET_FPU           = ""
> meta
> meta-poky            = "master:70f14da0c558a54439fca245b73e054b8deba75d"
> meta-oe
> meta-multimedia
> meta-python
> meta-networking
> meta-filesystems     = "master:e9e823d1a03eec5874346ed0c87e29c376195476"
> meta-freescale       = "master:be4bd4650170a5e9c38875809be440daa65aa0aa"
> meta-freescale-3rdparty = "master:13c782bfe40c921034944d6680bd27517a580598"
> meta-freescale-distro = "master:c1da36a693c1d9b50d4d318cb4a960e8daaddbd5"
> 
> DISTRO is a pure derivative of fsl-wayland, there are no graphics
> amendments inside.

Looks like that distro does not have xwayland and thus the X11 headers are
not installed. That now makes the test for egl.h fail as by default X11 headers
are included through eglplatform.h.
That wasn't catched by my tests as I used a distro which builds xwayland.

> 
> 
> > Do the headers exist in your build?
> >   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/recipe-sysroot/usr/include/
> 
> Nope, the header is not installed into recipe-sysroot. Surprisingly
> however, it is present in
> cogl-1.0/1.22.8-r0/recipe-sysroot-native/usr/include/

Are you sure? Your config.log tells otherwise:

    In file included from ...recipe-sysroot/usr/include/EGL/egl.h:39,
                     from conftest.c:63:
    ...recipe-sysroot/usr/include/EGL/eglplatform.h:144:10: fatal error: X11/Xlib.h: No such file or
directory

Does replacing the initial patch with this one help in your setup?
The test should not only check for existence of the headers themselves.
https://gitlab.gnome.org/GNOME/cogl/-/commit/d9f38c5864e577edb7e9f55c9f1d06248f85429b.patch

Max
> 
> > Any hint in the configure log output?
> >   .../work/<pkg-arch>/cogl-1.0/1.22.8-r0/build/config.log
> > 
> 
> Other than missing `EGL/egl.h` file, which reports the error:
> configure:25431: result: no
> configure:25431: checking for EGL/egl.h
> configure:25431: result: no
> configure:25438: error: Unable to locate required EGL headers
> 
> there are some additional errors regarding missing X11 support and
> needed optimization warning for _FORTIFY_SOURCE
> 
> I've uploaded the config.log to GitHub
> (https://gist.github.com/zandrey/65b15322c9561847f499648a2a46f173) so
> you can take a look at it.



